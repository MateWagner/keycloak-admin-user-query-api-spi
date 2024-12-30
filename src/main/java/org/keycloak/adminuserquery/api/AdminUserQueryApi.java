package org.keycloak.adminuserquery.api;

import static jakarta.ws.rs.core.MediaType.APPLICATION_JSON;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaBuilder.In;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Path;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.ws.rs.BadRequestException;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.jboss.logging.Logger;
import org.keycloak.connections.jpa.JpaConnectionProvider;
import org.keycloak.adminuserquery.data.CustomPage;
import org.keycloak.adminuserquery.data.JoinFields;
import org.keycloak.adminuserquery.data.Operator;
import org.keycloak.adminuserquery.data.RequestQuery;
import org.keycloak.adminuserquery.data.SearchFilter;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.RoleModel;
import org.keycloak.models.UserModel;
import org.keycloak.models.jpa.UserAdapter;
import org.keycloak.models.jpa.entities.RoleEntity;
import org.keycloak.models.jpa.entities.UserEntity;
import org.keycloak.models.jpa.entities.UserRoleMappingEntity;
import org.keycloak.models.utils.ModelToRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.services.resources.admin.permissions.AdminPermissionEvaluator;
import org.keycloak.services.resources.admin.permissions.UserPermissionEvaluator;

public class AdminUserQueryApi {

  private static final Logger log = Logger.getLogger(AdminUserQueryApi.class);
  private final EntityManager em;
  private final KeycloakSession session;
  private final RealmModel realm;
  private final AdminPermissionEvaluator auth;
  private final String realmId;
  private final CriteriaBuilder cb;

  public AdminUserQueryApi(KeycloakSession session, AdminPermissionEvaluator adminPermissionEvaluator) {
    this.session = session;
    this.auth = adminPermissionEvaluator;
    this.em = session.getProvider(JpaConnectionProvider.class).getEntityManager();
    this.realm = session.getContext().getRealm();
    this.realmId = realm.getId();
    this.cb = em.getCriteriaBuilder();
  }

  @GET
  @Produces(APPLICATION_JSON)
  public CustomPage<UserRepresentation> get(
      @QueryParam("pageNumber") Integer pageNumber,
      @QueryParam("pageSize") Integer pageSize,
      @QueryParam("q") RequestQuery requestQuery
  ) {
    UserPermissionEvaluator userPermissionEvaluator = auth.users();

    validateRequest(pageNumber, pageSize, userPermissionEvaluator);

    final List<String> userIdListWithGivenRole = getUserIdListWithRoleQuery(requestQuery);

    final TypedQuery<UserEntity> userEntityTypedQuery = getUserEntityTypedQuery(requestQuery, userIdListWithGivenRole);

    if (pageNumber != null && pageSize != null) {
      userEntityTypedQuery.setFirstResult(pageNumber * pageSize).setMaxResults(pageSize);
      final List<UserEntity> resultList = userEntityTypedQuery.getResultList();

      final int totalCount = getTotalCount(requestQuery, userIdListWithGivenRole);
      final int pageCount = (int) Math.ceil((double) totalCount / pageSize);

      return new CustomPage<>(toRepresentation(realm, userPermissionEvaluator, resultList), totalCount, pageCount, pageNumber);
    } else {
      final List<UserEntity> resultList = userEntityTypedQuery.getResultList();
      return new CustomPage<>(toRepresentation(realm, userPermissionEvaluator, resultList), resultList.size(), 1, 0);
    }
  }

  private TypedQuery<UserEntity> getUserEntityTypedQuery(RequestQuery requestQuery, List<String> userIdListWithGivenRole) {
    final CriteriaQuery<UserEntity> userCriteriaQuery = cb.createQuery(UserEntity.class);
    final Root<UserEntity> userEntityRoot = userCriteriaQuery.from(UserEntity.class);

    final List<Predicate> predicateList = getPredicateList(userEntityRoot, requestQuery);

    if (!userIdListWithGivenRole.isEmpty()) {
      final In<String> inClause = cb.in(userEntityRoot.get("id"));
      for (String roleId : userIdListWithGivenRole) {
        inClause.value(roleId);
      }
      userCriteriaQuery.select(userEntityRoot).where(cb.and(predicateList.toArray(Predicate[]::new)), cb.and(inClause));
    } else {
      userCriteriaQuery.select(userEntityRoot).where(cb.and(predicateList.toArray(Predicate[]::new)));
    }

    return em.createQuery(userCriteriaQuery);
  }

  private int getTotalCount(RequestQuery requestQuery, List<String> userIdListWithGivenRole) {
    final CriteriaQuery<Long> countQuery = cb.createQuery(Long.class);
    final Root<UserEntity> countRoot = countQuery.from(UserEntity.class);
    final List<Predicate> predicateList = getPredicateList(countRoot, requestQuery);

    if (!userIdListWithGivenRole.isEmpty()) {
      final In<String> inClause = cb.in(countRoot.get("id"));
      for (String roleId : userIdListWithGivenRole) {
        inClause.value(roleId);
      }
      countQuery.select(cb.count(countRoot)).where(cb.and(predicateList.toArray(Predicate[]::new)), cb.and(inClause));
    } else {
      countQuery.select(cb.count(countRoot)).where(cb.and(predicateList.toArray(Predicate[]::new)));
    }
    return em.createQuery(countQuery).getSingleResult().intValue();
  }

  private static void validateRequest(Integer pageNumber, Integer pageSize, UserPermissionEvaluator userPermissionEvaluator) {
    userPermissionEvaluator.requireQuery();
    if ((pageNumber != null && pageSize == null) || (pageNumber == null && pageSize != null)) {
      throw new BadRequestException(String.format("Paging value incomplete pageNumber: %s pageSize: %s", pageNumber, pageSize));
    }
    if (pageNumber != null && pageSize != null && (pageNumber < 0 || pageSize < 1)) {
      throw new BadRequestException("Page number and size must be positive values.");
    }
  }

  private List<String> getUserIdListWithRoleQuery(RequestQuery requestQuery) {
    final Optional<SearchFilter> optionalRoleSearchFilter = requestQuery.criteriaList()
                                                                        .stream()
                                                                        .filter(searchFilter -> searchFilter.key().equals("role"))
                                                                        .findFirst();
    if (optionalRoleSearchFilter.isEmpty()) {
      return Collections.emptyList();
    }

    final SearchFilter roleSearchFilter = optionalRoleSearchFilter.get();
    final CriteriaQuery<String> roleQuery = cb.createQuery(String.class);
    final Root<RoleEntity> roleEntityRoot = roleQuery.from(RoleEntity.class);
    final Predicate roleNamePredicate = getOperatorBasedPredicate(roleEntityRoot.get("name"), roleSearchFilter.operator(), roleSearchFilter.value());
    final Predicate realmId = getOperatorBasedPredicate(roleEntityRoot.get("realmId"), Operator.EQ, this.realmId);
    roleQuery.select(roleEntityRoot.get("id")).where(cb.and(realmId, roleNamePredicate));
    final List<String> roleIdList = em.createQuery(roleQuery).getResultList();

    final CriteriaQuery<UserRoleMappingEntity> urmQuery = cb.createQuery(UserRoleMappingEntity.class);
    final Root<UserRoleMappingEntity> userRoleMappingEntityRoot = urmQuery.from(UserRoleMappingEntity.class);
    final In<String> inClause = cb.in(userRoleMappingEntityRoot.get("roleId"));
    for (String roleId : roleIdList) {
      inClause.value(roleId);
    }
    urmQuery.select(userRoleMappingEntityRoot).where(inClause);
    requestQuery.criteriaList().remove(roleSearchFilter);
    return em.createQuery(urmQuery).getResultStream().map(userRoleMappingEntity -> userRoleMappingEntity.getUser().getId()).toList();
  }

  private List<Predicate> getPredicateList(Root<UserEntity> entityRoot, RequestQuery query) {
    Map<JoinFields, Join<UserEntity, ?>> joins = getJoinsMap(entityRoot);

    List<Predicate> predicateList = query.criteriaList().stream().flatMap(searchFilter -> {
      try {
        if (searchFilter.key().contains(JoinFields.ATTRIBUTES.name + ".")) {
          return getAttributePredicate(joins.get(JoinFields.ATTRIBUTES), searchFilter).stream();
        } else {
          return Stream.of(getOperatorBasedPredicate(entityRoot.get(searchFilter.key()), searchFilter.operator(), searchFilter.value()));
        }
      } catch (IllegalArgumentException e) {
        throw new BadRequestException(String.format("Invalid query parameter key: %s", searchFilter.key()), e);
      }
    }).collect(Collectors.toList());

    predicateList.add(getOperatorBasedPredicate(entityRoot.get("realmId"), Operator.EQ, realmId));
    return predicateList;
  }

  private List<Predicate> getAttributePredicate(Join<UserEntity, ?> attributeJoin, SearchFilter filter) {
    List<Predicate> attributePredicateList = new ArrayList<>();
    var name = filter.key().split("\\.")[1];
    attributePredicateList.add(getOperatorBasedPredicate(attributeJoin.get("name"), Operator.EQ, name));
    attributePredicateList.add(getOperatorBasedPredicate(attributeJoin.get("value"), filter.operator(), filter.value()));
    return attributePredicateList;
  }

  private Predicate getOperatorBasedPredicate(Path<String> path, Operator operator, String value) {
    return switch (operator) {
      case EQ -> cb.equal(path, value);
      case NE -> cb.notEqual(path, value);
      case C -> cb.like(path, "%" + value + "%");
      case NC -> cb.notLike(path, "%" + value + "%");
    };
  }

  private Map<JoinFields, Join<UserEntity, ?>> getJoinsMap(Root<UserEntity> entityRoot) {
    Map<JoinFields, Join<UserEntity, ?>> joins = new HashMap<>();
    joins.put(JoinFields.ATTRIBUTES, entityRoot.join(JoinFields.ATTRIBUTES.name, JoinType.LEFT));
    return joins;
  }

  private List<UserRepresentation> toRepresentation(RealmModel realm, UserPermissionEvaluator usersEvaluator, List<UserEntity> userEntities) {
    boolean canViewGlobal = usersEvaluator.canView();
    usersEvaluator.grantIfNoPermission(session.getAttribute(UserModel.GROUPS) != null);
    Stream<UserModel> userModels = userEntities.stream().map(userEntity -> new UserAdapter(session, realm, em, userEntity));
    return userModels.filter(user -> canViewGlobal || usersEvaluator.canView(user)).map(user -> {
      UserRepresentation userRep = ModelToRepresentation.toRepresentation(session, realm, user);
      userRep.setAccess(usersEvaluator.getAccess(user));
      userRep.setRealmRoles(user.getRealmRoleMappingsStream().map(RoleModel::getName).toList());
      return userRep;
    }).toList();
  }
}
