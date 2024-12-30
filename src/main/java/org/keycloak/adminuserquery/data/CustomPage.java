package org.keycloak.adminuserquery.data;

import java.util.List;

public record CustomPage<T>(List<T> content, int totalElements, int totalPages, int currentPage){}
