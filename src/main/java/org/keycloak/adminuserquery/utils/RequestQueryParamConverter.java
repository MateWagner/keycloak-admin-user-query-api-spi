package org.keycloak.adminuserquery.utils;

import jakarta.ws.rs.ext.ParamConverter;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.keycloak.adminuserquery.data.Operator;
import org.keycloak.adminuserquery.data.RequestQuery;
import org.keycloak.adminuserquery.data.SearchFilter;

public class RequestQueryParamConverter implements ParamConverter<RequestQuery> {

    @Override
    public RequestQuery fromString(String value) {
        if (value == null || value.isEmpty()) {
            return new RequestQuery(new ArrayList<>());
        }
        var decodedString = URLDecoder.decode(value,  StandardCharsets.UTF_8);
        List<SearchFilter> filters = Arrays.stream(decodedString.split("\\|"))
                                           .map(part -> {
                String[] elements = part.split(":");
                if (elements.length == 3) {
                    return new SearchFilter(elements[0], elements[2], Operator.valueOf(elements[1].toUpperCase()));
                }
                throw new IllegalArgumentException("Invalid query format: " + part);
            })
                                           .collect(Collectors.toList());

        return new RequestQuery(filters);
    }

    @Override
    public String toString(RequestQuery value) {
        if (value == null) {
            return "";
        }

        // Serialize RequestQuery back to string (reverse of `fromString`)
        return value.criteriaList().stream()
            .map(filter -> String.format("%s:%s:%s", filter.key(), filter.operator(), filter.value()))
            .collect(Collectors.joining(","));
    }
}
