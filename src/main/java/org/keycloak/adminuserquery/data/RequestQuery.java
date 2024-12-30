package org.keycloak.adminuserquery.data;

import java.util.List;

public record RequestQuery(List<SearchFilter> criteriaList) {}
