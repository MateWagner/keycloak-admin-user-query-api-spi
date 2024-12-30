# Custom user query spi for Keycloak

## About the project
Keycloak is an open-source Identity and Access Management platform. However, its default User Query API lacks the flexibility and depth needed for advanced user searches. This project addresses this limitation by providing a custom solution.

### Problem

Keycloak's default functionality for user search is constrained:

- Searches based on attributes are limited to exact matches.

- Advanced queries like partial matches (e.g., "contains" operations) are not supported, even with the `exact=true` parameter in their API.

### Solution

This project introduces a custom endpoint built on the Keycloak Admin interface. It supports:

- Flexible paging and filtering across all UserEntity fields that do not require joins.

- Advanced search capabilities for fields such as roles and attributes.

By leveraging this enhanced API, Keycloak administrators can perform efficient, complex user queries directly.

---

## Usage
### Endpoint

`GET /admin/realms/{realm}/user-query?q={query list}`

 **With Paging**:

`GET /admin/realms/{realm}/user-query?q={query list}&pageNumber=0&pageSize=1`

### Query anatomy
***The query must be URL-encoded (JavaScript URL format).***

The structure of a simple query is: `{key}:{operator}:{value}`

 **Example**:
* Username: `username:C:admin`
* Email: `email:EQ:admin@admin.admin`
* Role: `role:C:_role`
* Attributes: `attributes.my_attribute:EQ:client`

 **Combination of query**
Queries can be combined using the `|` operator:

`{key}:{operator}:{value}|{key2}:{operator}:{value2}|attributes.{name of attribute}:{operator}:{value}`

### Available Operators

| ***Query key*** | ***Description*** |
|:----------------|:-----------------:|
| EQ              |       Equal       |
| NE              |     Not Equal     |
| C               |     Contains      |
| NC              |   Not Contains    |

---

## Demonstration

A small demo has been prepared, leveraging Docker for ease of use and consistency.

### Key Features
- **Base Image**: Bitnami Keycloak 26.0.0.
- **Custom JAR File**: The Dockerfile builds and integrates a custom JAR file, adding the enhanced user query functionality.
- **PostgreSQL Database**: Pre-configured to initialize with sample data to showcase the integration.
- **API Testing with Bruno**: Includes a [Bruno](https://www.usebruno.com/) API collection in the `bruno-api-collection` folder, enabling easy testing and validation of the custom endpoint.

### Steps
1. Start the Docker demo:

    `docker compose up`
2. Access the preloaded sample data.

### Preloaded data:
- **Realm**: _master_

  | **Username** | **First Name** | **Last Name** | **Email** | **Attributes** | **Attributes Value** | **Password** | **Roles**  |
  |--------------|----------------|---------------|-----------|----------------|----------------------|--------------|------------|
 || `admin`      | -              | -             | -         | -              | -                    | `admin`      | `kc admin` |

- **Realm**: _test_

    | Username | **First Name** | **Last Name** | **Email**         | **Attributes** | **Attributes Value** | **Password** | **Roles**                 |
    |----------|----------------|---------------|-------------------|----------------|----------------------|--------------|---------------------------|
    | `admin1` | `admin`        | `admin1`      | `admin1@test.com` | `my_attribute` | `admin,client`       | -            | `[admin_role, user_role]` |
    | `admin2` | `admin`        | `admin2`      | `admin2@test.com` | `my_attribute` | `admin,client`       | -            | `[admin_role, user_role]` | 
    | `user1`  | `user`         | `user1`       | `user1@test.com`  | `my_attribute` | `client`             | -            | `[user_role]`             |
    | `user2`  | `user`         | `user2`       | `user2@test.com`  | `my_attribute` | `client`             | -            | `[user_role]`             |

---

## Building and installing

### Build the Project
**Pre-requisites**: Java 17 or above.

### Commands
#### Windows:
- Maven Wrapper:
  
    `.\mvnw.cmd package`

- Maven:

  `mvn package`
  
#### Linux:
- Maven Wrapper:

  `./mvnw package`
- Maven:

  `mvn package`
  
### Install
Once built, the JAR file will be located in the `target` directory. To install:

1. Copy the generated JAR file to the `providers` folder in your Keycloak installation directory (`KEYCLOAK_HOME`).

2. For detailed instructions, refer to the [Keycloak documentation.](https://www.keycloak.org/server/configuration-provider)

---

This guide provides everything you need to enhance Keycloak's user querying capabilities with ease and flexibility. Happy querying!
