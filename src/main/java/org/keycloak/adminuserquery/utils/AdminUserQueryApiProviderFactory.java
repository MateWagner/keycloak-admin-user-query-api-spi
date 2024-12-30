package org.keycloak.adminuserquery.utils;

import org.jboss.logging.Logger;
import org.keycloak.Config.Scope;
import org.keycloak.adminuserquery.api.AdminUserQueryApi;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.models.RealmModel;
import org.keycloak.services.resources.admin.AdminEventBuilder;
import org.keycloak.services.resources.admin.ext.AdminRealmResourceProvider;
import org.keycloak.services.resources.admin.ext.AdminRealmResourceProviderFactory;
import org.keycloak.services.resources.admin.permissions.AdminPermissionEvaluator;


public class AdminUserQueryApiProviderFactory implements AdminRealmResourceProviderFactory, AdminRealmResourceProvider {

  public static final String ID = "user-query";

  private static final Logger log = Logger.getLogger(AdminUserQueryApiProviderFactory.class);


  @Override
  public String getId() {
    return ID;
  }

  @Override
  public AdminRealmResourceProvider create(KeycloakSession session) {

    return this;
  }

  @Override
  public void init(Scope config) {
    log.info("Admin user query is loaded and available on /admin/realms/{realm}/user-query");
  }

  @Override
  public void postInit(KeycloakSessionFactory factory) {
  }

  @Override
  public Object getResource(KeycloakSession keycloakSession, RealmModel realmModel, AdminPermissionEvaluator adminPermissionEvaluator, AdminEventBuilder adminEventBuilder) {
    return new AdminUserQueryApi(keycloakSession, adminPermissionEvaluator);
  }

  @Override
  public void close() {
  }
}
