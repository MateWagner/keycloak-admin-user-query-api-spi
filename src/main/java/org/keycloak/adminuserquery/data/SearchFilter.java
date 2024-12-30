package org.keycloak.adminuserquery.data;

public record SearchFilter(String key, String value, Operator operator) {}
