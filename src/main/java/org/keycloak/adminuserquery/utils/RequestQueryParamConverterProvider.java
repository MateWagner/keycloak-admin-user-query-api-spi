package org.keycloak.adminuserquery.utils;

import jakarta.ws.rs.ext.ParamConverter;
import jakarta.ws.rs.ext.ParamConverterProvider;
import jakarta.ws.rs.ext.Provider;
import java.lang.reflect.Type;
import org.keycloak.adminuserquery.data.RequestQuery;

@Provider
public class RequestQueryParamConverterProvider implements ParamConverterProvider {
    @Override
    public <T> ParamConverter<T> getConverter(Class<T> rawType, Type genericType, java.lang.annotation.Annotation[] annotations) {
        if (rawType.equals(RequestQuery.class)) {
            return (ParamConverter<T>) new RequestQueryParamConverter();
        }
        return null;
    }
}
