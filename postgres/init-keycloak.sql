--
-- PostgreSQL database dump
--


\connect keycloak

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


--
-- TOC entry 250 (class 1259 OID 17017)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- TOC entry 277 (class 1259 OID 17460)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- TOC entry 253 (class 1259 OID 17032)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- TOC entry 252 (class 1259 OID 17027)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- TOC entry 251 (class 1259 OID 17022)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- TOC entry 254 (class 1259 OID 17037)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- TOC entry 278 (class 1259 OID 17475)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- TOC entry 217 (class 1259 OID 16398)
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- TOC entry 237 (class 1259 OID 16756)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- TOC entry 289 (class 1259 OID 17724)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- TOC entry 288 (class 1259 OID 17599)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- TOC entry 238 (class 1259 OID 16766)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- TOC entry 266 (class 1259 OID 17265)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- TOC entry 267 (class 1259 OID 17279)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- TOC entry 290 (class 1259 OID 17765)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- TOC entry 268 (class 1259 OID 17284)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- TOC entry 286 (class 1259 OID 17520)
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- TOC entry 285 (class 1259 OID 17515)
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- TOC entry 218 (class 1259 OID 16417)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- TOC entry 219 (class 1259 OID 16420)
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- TOC entry 216 (class 1259 OID 16390)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- TOC entry 215 (class 1259 OID 16385)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- TOC entry 291 (class 1259 OID 17781)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- TOC entry 220 (class 1259 OID 16425)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- TOC entry 279 (class 1259 OID 17480)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- TOC entry 280 (class 1259 OID 17485)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- TOC entry 293 (class 1259 OID 17807)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- TOC entry 281 (class 1259 OID 17494)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- TOC entry 282 (class 1259 OID 17503)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- TOC entry 283 (class 1259 OID 17506)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- TOC entry 284 (class 1259 OID 17512)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- TOC entry 241 (class 1259 OID 16802)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- TOC entry 287 (class 1259 OID 17577)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- TOC entry 263 (class 1259 OID 17204)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- TOC entry 262 (class 1259 OID 17201)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- TOC entry 242 (class 1259 OID 16807)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- TOC entry 243 (class 1259 OID 16816)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- TOC entry 247 (class 1259 OID 16920)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- TOC entry 248 (class 1259 OID 16925)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- TOC entry 261 (class 1259 OID 17198)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- TOC entry 221 (class 1259 OID 16433)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- TOC entry 246 (class 1259 OID 16917)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- TOC entry 260 (class 1259 OID 17189)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- TOC entry 259 (class 1259 OID 17184)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- TOC entry 299 (class 1259 OID 17969)
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- TOC entry 300 (class 1259 OID 17980)
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- TOC entry 273 (class 1259 OID 17403)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- TOC entry 239 (class 1259 OID 16791)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- TOC entry 240 (class 1259 OID 16797)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- TOC entry 222 (class 1259 OID 16439)
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- TOC entry 223 (class 1259 OID 16456)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- TOC entry 265 (class 1259 OID 17213)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- TOC entry 245 (class 1259 OID 16909)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- TOC entry 224 (class 1259 OID 16464)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- TOC entry 298 (class 1259 OID 17915)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- TOC entry 225 (class 1259 OID 16467)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- TOC entry 226 (class 1259 OID 16474)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- TOC entry 244 (class 1259 OID 16825)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- TOC entry 227 (class 1259 OID 16484)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- TOC entry 258 (class 1259 OID 17148)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- TOC entry 257 (class 1259 OID 17141)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- TOC entry 295 (class 1259 OID 17846)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- TOC entry 275 (class 1259 OID 17430)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- TOC entry 274 (class 1259 OID 17415)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- TOC entry 269 (class 1259 OID 17353)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- TOC entry 294 (class 1259 OID 17822)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- TOC entry 272 (class 1259 OID 17389)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- TOC entry 270 (class 1259 OID 17361)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- TOC entry 271 (class 1259 OID 17375)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- TOC entry 296 (class 1259 OID 17864)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- TOC entry 301 (class 1259 OID 17997)
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO keycloak;

--
-- TOC entry 297 (class 1259 OID 17874)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- TOC entry 228 (class 1259 OID 16487)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- TOC entry 276 (class 1259 OID 17445)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- TOC entry 230 (class 1259 OID 16493)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- TOC entry 249 (class 1259 OID 16930)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- TOC entry 292 (class 1259 OID 17797)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- TOC entry 231 (class 1259 OID 16498)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- TOC entry 232 (class 1259 OID 16506)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- TOC entry 255 (class 1259 OID 17042)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- TOC entry 256 (class 1259 OID 17047)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- TOC entry 233 (class 1259 OID 16511)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- TOC entry 264 (class 1259 OID 17210)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- TOC entry 234 (class 1259 OID 16516)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- TOC entry 235 (class 1259 OID 16519)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- TOC entry 229 (class 1259 OID 16490)
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- TOC entry 236 (class 1259 OID 16533)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- TOC entry 4210 (class 0 OID 17017)
-- Dependencies: 250
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- TOC entry 4237 (class 0 OID 17460)
-- Dependencies: 277
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 4213 (class 0 OID 17032)
-- Dependencies: 253
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
b2cbb9d5-fac4-442d-91fc-5f973c142037	\N	auth-cookie	4bd0522d-6268-48d6-85e6-d08570bd2206	6547bbde-d926-42e5-afed-e7f3704d52e8	2	10	f	\N	\N
f4bad1f5-651e-4b6d-8d80-7b739e9a4a68	\N	auth-spnego	4bd0522d-6268-48d6-85e6-d08570bd2206	6547bbde-d926-42e5-afed-e7f3704d52e8	3	20	f	\N	\N
93812e52-0e8b-4062-b289-9fc2e7cedc31	\N	identity-provider-redirector	4bd0522d-6268-48d6-85e6-d08570bd2206	6547bbde-d926-42e5-afed-e7f3704d52e8	2	25	f	\N	\N
3e96e4ac-08d8-425a-9568-ae3c6bfc22cb	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	6547bbde-d926-42e5-afed-e7f3704d52e8	2	30	t	688bf02e-a077-466d-8fcf-89aae0d57cb0	\N
1066cdd5-e307-45ae-a088-ec3fab297be7	\N	auth-username-password-form	4bd0522d-6268-48d6-85e6-d08570bd2206	688bf02e-a077-466d-8fcf-89aae0d57cb0	0	10	f	\N	\N
c36d6459-8a16-4b33-aa05-99f9f1ab911a	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	688bf02e-a077-466d-8fcf-89aae0d57cb0	1	20	t	dd628185-2954-4e50-8918-b9579e81d481	\N
896b8ca3-679c-49ef-9ca2-5cdd4168db44	\N	conditional-user-configured	4bd0522d-6268-48d6-85e6-d08570bd2206	dd628185-2954-4e50-8918-b9579e81d481	0	10	f	\N	\N
76854a8c-8ecf-4e68-8e76-272fbac4dd5a	\N	auth-otp-form	4bd0522d-6268-48d6-85e6-d08570bd2206	dd628185-2954-4e50-8918-b9579e81d481	0	20	f	\N	\N
f3ad1b5d-732d-4a72-b3af-f7449425f052	\N	direct-grant-validate-username	4bd0522d-6268-48d6-85e6-d08570bd2206	faa666c8-e14d-4dac-be65-6369c1c4c9e8	0	10	f	\N	\N
6d636c12-9937-425b-acdb-95baca9a2178	\N	direct-grant-validate-password	4bd0522d-6268-48d6-85e6-d08570bd2206	faa666c8-e14d-4dac-be65-6369c1c4c9e8	0	20	f	\N	\N
5dba2964-6bde-4205-b51a-87bb75bf40b7	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	faa666c8-e14d-4dac-be65-6369c1c4c9e8	1	30	t	f12bc30a-a324-4ef6-88b8-b80bc48b8a86	\N
82af6b69-2b3e-47b1-9104-333ffff7a95c	\N	conditional-user-configured	4bd0522d-6268-48d6-85e6-d08570bd2206	f12bc30a-a324-4ef6-88b8-b80bc48b8a86	0	10	f	\N	\N
d8f132af-2a55-4283-8efb-ab2697d007a5	\N	direct-grant-validate-otp	4bd0522d-6268-48d6-85e6-d08570bd2206	f12bc30a-a324-4ef6-88b8-b80bc48b8a86	0	20	f	\N	\N
2ea99602-5dcb-4051-bd19-60a8f78a8584	\N	registration-page-form	4bd0522d-6268-48d6-85e6-d08570bd2206	5810424b-ec1e-48dd-85de-205c168795fb	0	10	t	f785771a-7d59-42d7-82a5-c454dfe59e1e	\N
9e6ac39f-7875-444d-875f-6495d83007e1	\N	registration-user-creation	4bd0522d-6268-48d6-85e6-d08570bd2206	f785771a-7d59-42d7-82a5-c454dfe59e1e	0	20	f	\N	\N
71a73088-8ab5-498c-845a-a4f570e45a74	\N	registration-password-action	4bd0522d-6268-48d6-85e6-d08570bd2206	f785771a-7d59-42d7-82a5-c454dfe59e1e	0	50	f	\N	\N
d86aad7a-2c4e-4290-9eba-476ea9e04421	\N	registration-recaptcha-action	4bd0522d-6268-48d6-85e6-d08570bd2206	f785771a-7d59-42d7-82a5-c454dfe59e1e	3	60	f	\N	\N
684c86a3-43e4-4ceb-b5d4-c3ca30b751c4	\N	registration-terms-and-conditions	4bd0522d-6268-48d6-85e6-d08570bd2206	f785771a-7d59-42d7-82a5-c454dfe59e1e	3	70	f	\N	\N
91a2b2a2-b453-4c8b-b98b-d2a2b55b1e9f	\N	reset-credentials-choose-user	4bd0522d-6268-48d6-85e6-d08570bd2206	6eb4fb52-1b5f-41bc-b05d-575cb8c3f176	0	10	f	\N	\N
7b7faefd-1bc6-4db5-aa47-5089c1d03120	\N	reset-credential-email	4bd0522d-6268-48d6-85e6-d08570bd2206	6eb4fb52-1b5f-41bc-b05d-575cb8c3f176	0	20	f	\N	\N
007af7a2-66e5-4564-bc9b-c764e37b09b2	\N	reset-password	4bd0522d-6268-48d6-85e6-d08570bd2206	6eb4fb52-1b5f-41bc-b05d-575cb8c3f176	0	30	f	\N	\N
a5be62d1-3c82-49c7-b46c-5d42b59bc212	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	6eb4fb52-1b5f-41bc-b05d-575cb8c3f176	1	40	t	793662d4-5c1f-461e-a531-9d0293c547e2	\N
ded34832-2856-4dcd-b955-8f5b81268b58	\N	conditional-user-configured	4bd0522d-6268-48d6-85e6-d08570bd2206	793662d4-5c1f-461e-a531-9d0293c547e2	0	10	f	\N	\N
77b1d1f2-0f15-4936-996b-bac604cb1faa	\N	reset-otp	4bd0522d-6268-48d6-85e6-d08570bd2206	793662d4-5c1f-461e-a531-9d0293c547e2	0	20	f	\N	\N
2dea668c-f9f4-495e-9930-93aa9e8aed4c	\N	client-secret	4bd0522d-6268-48d6-85e6-d08570bd2206	8a5dad25-b49c-4492-9581-5fb868285313	2	10	f	\N	\N
269227de-50e1-4faf-ade4-e94d49a9c08c	\N	client-jwt	4bd0522d-6268-48d6-85e6-d08570bd2206	8a5dad25-b49c-4492-9581-5fb868285313	2	20	f	\N	\N
86f9f4e0-f924-4ac3-ade2-2fc0037abd62	\N	client-secret-jwt	4bd0522d-6268-48d6-85e6-d08570bd2206	8a5dad25-b49c-4492-9581-5fb868285313	2	30	f	\N	\N
0c75fe16-6dad-4592-a28e-0ee2494e47cb	\N	client-x509	4bd0522d-6268-48d6-85e6-d08570bd2206	8a5dad25-b49c-4492-9581-5fb868285313	2	40	f	\N	\N
9831497a-44d8-4364-89a5-48a662056072	\N	idp-review-profile	4bd0522d-6268-48d6-85e6-d08570bd2206	c7fc0c90-9231-48f7-9785-8592216baebb	0	10	f	\N	34608da6-c472-4c67-ac65-74fe9510b25c
b987b4e4-d343-4c5c-a23e-c7c14aba93d0	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	c7fc0c90-9231-48f7-9785-8592216baebb	0	20	t	2f012548-5b53-45bd-96bb-385253e380af	\N
7f090144-7a33-48a6-9512-2803a4e5d1b8	\N	idp-create-user-if-unique	4bd0522d-6268-48d6-85e6-d08570bd2206	2f012548-5b53-45bd-96bb-385253e380af	2	10	f	\N	1c0016b3-9421-411e-b65a-69e97de2e6ff
cce55e4b-cf92-4c1a-8e24-aa2f1d0b2fd4	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	2f012548-5b53-45bd-96bb-385253e380af	2	20	t	1e5f9893-9361-4449-8dc1-59f7c203acfe	\N
7303a44b-b3b6-42d9-991b-722032ffec5d	\N	idp-confirm-link	4bd0522d-6268-48d6-85e6-d08570bd2206	1e5f9893-9361-4449-8dc1-59f7c203acfe	0	10	f	\N	\N
1a689fc6-8b06-40d6-aefc-ac01efeb5f23	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	1e5f9893-9361-4449-8dc1-59f7c203acfe	0	20	t	78316b00-a569-428d-b772-862e5004332c	\N
45d581cc-7bd7-4434-a2a6-e1226435e6ac	\N	idp-email-verification	4bd0522d-6268-48d6-85e6-d08570bd2206	78316b00-a569-428d-b772-862e5004332c	2	10	f	\N	\N
e99f77d0-6058-4f3f-be65-f8c9655910f8	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	78316b00-a569-428d-b772-862e5004332c	2	20	t	a1641344-5179-440a-9c9f-748e5c5c04d0	\N
747df8fe-73cd-4492-8222-a0bdf19f5d44	\N	idp-username-password-form	4bd0522d-6268-48d6-85e6-d08570bd2206	a1641344-5179-440a-9c9f-748e5c5c04d0	0	10	f	\N	\N
3c2f2e48-8dbd-4fbc-8a76-678314db84ec	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	a1641344-5179-440a-9c9f-748e5c5c04d0	1	20	t	8b9abddf-ba6a-40b8-b24c-82035e5c48ad	\N
ef07d331-fe83-4d0b-ac0b-77fca36f6356	\N	conditional-user-configured	4bd0522d-6268-48d6-85e6-d08570bd2206	8b9abddf-ba6a-40b8-b24c-82035e5c48ad	0	10	f	\N	\N
e7e9a165-ccdf-44c6-b2f0-f45443d0d3bb	\N	auth-otp-form	4bd0522d-6268-48d6-85e6-d08570bd2206	8b9abddf-ba6a-40b8-b24c-82035e5c48ad	0	20	f	\N	\N
4b6d4735-eeb9-40d9-9845-0a28c1bf983a	\N	http-basic-authenticator	4bd0522d-6268-48d6-85e6-d08570bd2206	f543070d-0621-4174-9634-c907fe5f1fc0	0	10	f	\N	\N
07a3c130-ef47-438d-adcc-adc109f98334	\N	docker-http-basic-authenticator	4bd0522d-6268-48d6-85e6-d08570bd2206	1065bc41-1617-4ade-967c-f24124ced9ce	0	10	f	\N	\N
42b68994-ba61-4382-9c90-b3e0a8468769	\N	auth-cookie	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e6957db3-7961-4768-b492-b8ace98b6baf	2	10	f	\N	\N
cd7efb4c-95c6-4c58-931d-60b26f313faf	\N	auth-spnego	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e6957db3-7961-4768-b492-b8ace98b6baf	3	20	f	\N	\N
912495dc-c916-4d1c-a797-6575792418d6	\N	identity-provider-redirector	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e6957db3-7961-4768-b492-b8ace98b6baf	2	25	f	\N	\N
8e636616-9935-47c6-8a52-8103825905fa	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e6957db3-7961-4768-b492-b8ace98b6baf	2	30	t	a16024f3-46cb-4253-b345-912a34f9ee56	\N
78f73932-4b92-4ac3-b11f-2bc875645860	\N	auth-username-password-form	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a16024f3-46cb-4253-b345-912a34f9ee56	0	10	f	\N	\N
e0c5817a-530e-44a9-a827-d3556bf1f30e	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a16024f3-46cb-4253-b345-912a34f9ee56	1	20	t	936b321a-da5e-45d9-8a63-6d599e531418	\N
3595ed2a-5b30-4425-b2f9-2a8a52bc6bad	\N	conditional-user-configured	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	936b321a-da5e-45d9-8a63-6d599e531418	0	10	f	\N	\N
99f5e11d-e256-4c71-8971-71de92a0cabf	\N	auth-otp-form	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	936b321a-da5e-45d9-8a63-6d599e531418	0	20	f	\N	\N
a4493187-0f05-4388-96bb-90dabad4b62f	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e6957db3-7961-4768-b492-b8ace98b6baf	2	26	t	4cc0aa60-d11f-4781-8982-0d916374c6f9	\N
856dd9f4-af0a-45e9-9f13-8a52306a1976	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	4cc0aa60-d11f-4781-8982-0d916374c6f9	1	10	t	65ea76d4-1ca8-4c85-bddd-ecd162809dc5	\N
c1925ad6-57cf-411d-ae94-1de25cfa6baa	\N	conditional-user-configured	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	65ea76d4-1ca8-4c85-bddd-ecd162809dc5	0	10	f	\N	\N
646fed41-f451-4a37-a7ff-96391080bde4	\N	organization	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	65ea76d4-1ca8-4c85-bddd-ecd162809dc5	2	20	f	\N	\N
8e36b65e-5f2e-4995-86d2-c615d65550c5	\N	direct-grant-validate-username	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a9802acc-42db-43c2-8859-115241bf898d	0	10	f	\N	\N
4b4ea9a0-2302-495f-b7b7-6e86ae15e32a	\N	direct-grant-validate-password	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a9802acc-42db-43c2-8859-115241bf898d	0	20	f	\N	\N
f1da6722-eb80-425a-b9a7-09f5d3b2bd1f	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a9802acc-42db-43c2-8859-115241bf898d	1	30	t	e1e85009-1593-46f2-9b06-a6f4e6dc896f	\N
b00c74d2-df9a-4d95-b69d-98580cc422d5	\N	conditional-user-configured	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e1e85009-1593-46f2-9b06-a6f4e6dc896f	0	10	f	\N	\N
1137c251-f5f7-459e-a6d0-23ec07da21c8	\N	direct-grant-validate-otp	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	e1e85009-1593-46f2-9b06-a6f4e6dc896f	0	20	f	\N	\N
572c63de-329c-434a-ad4e-419812e96ccd	\N	registration-page-form	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a8857646-4972-40dd-afe2-325739f690ce	0	10	t	f9001d28-cae4-4746-89a4-df403c66fc08	\N
b97be39d-94e0-421c-8384-0e4a7e9e178e	\N	registration-user-creation	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f9001d28-cae4-4746-89a4-df403c66fc08	0	20	f	\N	\N
ee2baa7c-868d-49d4-a8b1-74084c6d260d	\N	registration-password-action	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f9001d28-cae4-4746-89a4-df403c66fc08	0	50	f	\N	\N
0876e32d-27e4-414f-bd4e-6c9cde79c6b0	\N	registration-recaptcha-action	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f9001d28-cae4-4746-89a4-df403c66fc08	3	60	f	\N	\N
de148d11-46ae-42e8-a76b-4cc8532061b2	\N	registration-terms-and-conditions	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f9001d28-cae4-4746-89a4-df403c66fc08	3	70	f	\N	\N
0d7b147b-ee23-4df0-80b4-4e11c5cf80f4	\N	reset-credentials-choose-user	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b0c75072-43b4-4858-a83c-b6ef68b8e37e	0	10	f	\N	\N
2c17e082-d9c8-472c-8ea1-b95fa2840b47	\N	reset-credential-email	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b0c75072-43b4-4858-a83c-b6ef68b8e37e	0	20	f	\N	\N
5e6c504a-2c81-49f9-b4d0-c46e1187e293	\N	reset-password	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b0c75072-43b4-4858-a83c-b6ef68b8e37e	0	30	f	\N	\N
14669235-0d8f-4480-8ec8-ed4196b3b157	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b0c75072-43b4-4858-a83c-b6ef68b8e37e	1	40	t	2856e54f-86d0-446a-a6d9-43e706657de3	\N
bd2e5d45-0007-4548-8577-faa933bc5ac1	\N	conditional-user-configured	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	2856e54f-86d0-446a-a6d9-43e706657de3	0	10	f	\N	\N
22b55dec-92b5-454d-894b-5f0e3a5624d1	\N	reset-otp	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	2856e54f-86d0-446a-a6d9-43e706657de3	0	20	f	\N	\N
9d7de076-09d9-41d8-ab6e-e264387b2ee7	\N	client-secret	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	48f0279d-6cdc-484f-9a62-c003cee0fe48	2	10	f	\N	\N
c9f61a50-2254-4b36-bce6-8350659aef71	\N	client-jwt	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	48f0279d-6cdc-484f-9a62-c003cee0fe48	2	20	f	\N	\N
19d2077e-3de2-4c0d-8488-e8eedc3fc333	\N	client-secret-jwt	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	48f0279d-6cdc-484f-9a62-c003cee0fe48	2	30	f	\N	\N
94386437-a59b-4029-b31c-755e55c9c2ab	\N	client-x509	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	48f0279d-6cdc-484f-9a62-c003cee0fe48	2	40	f	\N	\N
b0eecb0f-bfb0-41f7-8eb1-b4b45a219c0e	\N	idp-review-profile	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	c15f0e0b-aaf2-4303-bb0d-caece79de2c1	0	10	f	\N	8047b0ee-e67a-4c41-aa90-657fa07f88e6
c633c6c3-029a-4ff7-90b8-66281e8d4a13	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	c15f0e0b-aaf2-4303-bb0d-caece79de2c1	0	20	t	9203b2c9-9ce0-4b31-bb13-a01167c35b1e	\N
177620ad-24b7-49b5-b7dc-a0e2d2eea684	\N	idp-create-user-if-unique	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	9203b2c9-9ce0-4b31-bb13-a01167c35b1e	2	10	f	\N	090f6cd3-fa26-46b2-b968-271052a16d1a
75e35f48-587e-4d20-9dfc-34d742d3cd32	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	9203b2c9-9ce0-4b31-bb13-a01167c35b1e	2	20	t	f30fe285-938a-4f0a-8008-d9f9206ebc22	\N
93cb4e16-c1d2-459d-8b0a-b80227aed108	\N	idp-confirm-link	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f30fe285-938a-4f0a-8008-d9f9206ebc22	0	10	f	\N	\N
6a1fe2cd-b143-41e6-a17e-3c4d90092f19	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f30fe285-938a-4f0a-8008-d9f9206ebc22	0	20	t	06c23511-e857-4278-afeb-3912e2bd1b25	\N
a82ef34a-2abe-4ba4-a90f-9010b6dad927	\N	idp-email-verification	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	06c23511-e857-4278-afeb-3912e2bd1b25	2	10	f	\N	\N
5717b73f-df82-4d93-b928-8ddb88076ed4	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	06c23511-e857-4278-afeb-3912e2bd1b25	2	20	t	2560325e-5e0b-4227-9bd9-77c556b58eea	\N
8cbee28c-e809-47a6-9622-6a4f7c3b5027	\N	idp-username-password-form	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	2560325e-5e0b-4227-9bd9-77c556b58eea	0	10	f	\N	\N
0c591c27-b6d5-4a4c-9d7a-74a04a97d6e6	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	2560325e-5e0b-4227-9bd9-77c556b58eea	1	20	t	11b08033-d352-4ead-852e-30f81ffa01be	\N
32b2bf6f-99ae-4765-ad1e-81231aee6592	\N	conditional-user-configured	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	11b08033-d352-4ead-852e-30f81ffa01be	0	10	f	\N	\N
e2a351d3-fbb6-45d6-8df7-a7a16658c0c0	\N	auth-otp-form	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	11b08033-d352-4ead-852e-30f81ffa01be	0	20	f	\N	\N
e99d4f54-9a5a-4325-922b-6e4464179abf	\N	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	c15f0e0b-aaf2-4303-bb0d-caece79de2c1	1	50	t	fefe084c-d7d3-499f-9114-b5bdefaec27b	\N
b29812ee-2552-4f5e-8925-aa90309f7d12	\N	conditional-user-configured	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	fefe084c-d7d3-499f-9114-b5bdefaec27b	0	10	f	\N	\N
947f3f1a-7c0f-4c3e-834a-e4e2e9f0bb9b	\N	idp-add-organization-member	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	fefe084c-d7d3-499f-9114-b5bdefaec27b	0	20	f	\N	\N
f8902f22-6c90-4538-b49c-719ae44ea998	\N	http-basic-authenticator	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b2ac399c-be1b-4f4a-b2ee-9a6d05ce9bba	0	10	f	\N	\N
91a5ff36-ba39-4951-b02b-1ad2252930d3	\N	docker-http-basic-authenticator	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	6b39aac6-c24b-48ae-8010-d47dc35df05a	0	10	f	\N	\N
\.


--
-- TOC entry 4212 (class 0 OID 17027)
-- Dependencies: 252
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
6547bbde-d926-42e5-afed-e7f3704d52e8	browser	Browser based authentication	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
688bf02e-a077-466d-8fcf-89aae0d57cb0	forms	Username, password, otp and other auth forms.	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
dd628185-2954-4e50-8918-b9579e81d481	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
faa666c8-e14d-4dac-be65-6369c1c4c9e8	direct grant	OpenID Connect Resource Owner Grant	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
f12bc30a-a324-4ef6-88b8-b80bc48b8a86	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
5810424b-ec1e-48dd-85de-205c168795fb	registration	Registration flow	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
f785771a-7d59-42d7-82a5-c454dfe59e1e	registration form	Registration form	4bd0522d-6268-48d6-85e6-d08570bd2206	form-flow	f	t
6eb4fb52-1b5f-41bc-b05d-575cb8c3f176	reset credentials	Reset credentials for a user if they forgot their password or something	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
793662d4-5c1f-461e-a531-9d0293c547e2	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
8a5dad25-b49c-4492-9581-5fb868285313	clients	Base authentication for clients	4bd0522d-6268-48d6-85e6-d08570bd2206	client-flow	t	t
c7fc0c90-9231-48f7-9785-8592216baebb	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
2f012548-5b53-45bd-96bb-385253e380af	User creation or linking	Flow for the existing/non-existing user alternatives	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
1e5f9893-9361-4449-8dc1-59f7c203acfe	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
78316b00-a569-428d-b772-862e5004332c	Account verification options	Method with which to verity the existing account	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
a1641344-5179-440a-9c9f-748e5c5c04d0	Verify Existing Account by Re-authentication	Reauthentication of existing account	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
8b9abddf-ba6a-40b8-b24c-82035e5c48ad	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	f	t
f543070d-0621-4174-9634-c907fe5f1fc0	saml ecp	SAML ECP Profile Authentication Flow	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
1065bc41-1617-4ade-967c-f24124ced9ce	docker auth	Used by Docker clients to authenticate against the IDP	4bd0522d-6268-48d6-85e6-d08570bd2206	basic-flow	t	t
e6957db3-7961-4768-b492-b8ace98b6baf	browser	Browser based authentication	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
a16024f3-46cb-4253-b345-912a34f9ee56	forms	Username, password, otp and other auth forms.	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
936b321a-da5e-45d9-8a63-6d599e531418	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
4cc0aa60-d11f-4781-8982-0d916374c6f9	Organization	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
65ea76d4-1ca8-4c85-bddd-ecd162809dc5	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
a9802acc-42db-43c2-8859-115241bf898d	direct grant	OpenID Connect Resource Owner Grant	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
e1e85009-1593-46f2-9b06-a6f4e6dc896f	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
a8857646-4972-40dd-afe2-325739f690ce	registration	Registration flow	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
f9001d28-cae4-4746-89a4-df403c66fc08	registration form	Registration form	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	form-flow	f	t
b0c75072-43b4-4858-a83c-b6ef68b8e37e	reset credentials	Reset credentials for a user if they forgot their password or something	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
2856e54f-86d0-446a-a6d9-43e706657de3	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
48f0279d-6cdc-484f-9a62-c003cee0fe48	clients	Base authentication for clients	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	client-flow	t	t
c15f0e0b-aaf2-4303-bb0d-caece79de2c1	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
9203b2c9-9ce0-4b31-bb13-a01167c35b1e	User creation or linking	Flow for the existing/non-existing user alternatives	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
f30fe285-938a-4f0a-8008-d9f9206ebc22	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
06c23511-e857-4278-afeb-3912e2bd1b25	Account verification options	Method with which to verity the existing account	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
2560325e-5e0b-4227-9bd9-77c556b58eea	Verify Existing Account by Re-authentication	Reauthentication of existing account	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
11b08033-d352-4ead-852e-30f81ffa01be	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
fefe084c-d7d3-499f-9114-b5bdefaec27b	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	f	t
b2ac399c-be1b-4f4a-b2ee-9a6d05ce9bba	saml ecp	SAML ECP Profile Authentication Flow	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
6b39aac6-c24b-48ae-8010-d47dc35df05a	docker auth	Used by Docker clients to authenticate against the IDP	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	basic-flow	t	t
\.


--
-- TOC entry 4211 (class 0 OID 17022)
-- Dependencies: 251
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
34608da6-c472-4c67-ac65-74fe9510b25c	review profile config	4bd0522d-6268-48d6-85e6-d08570bd2206
1c0016b3-9421-411e-b65a-69e97de2e6ff	create unique user config	4bd0522d-6268-48d6-85e6-d08570bd2206
8047b0ee-e67a-4c41-aa90-657fa07f88e6	review profile config	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d
090f6cd3-fa26-46b2-b968-271052a16d1a	create unique user config	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d
\.


--
-- TOC entry 4214 (class 0 OID 17037)
-- Dependencies: 254
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
1c0016b3-9421-411e-b65a-69e97de2e6ff	false	require.password.update.after.registration
34608da6-c472-4c67-ac65-74fe9510b25c	missing	update.profile.on.first.login
090f6cd3-fa26-46b2-b968-271052a16d1a	false	require.password.update.after.registration
8047b0ee-e67a-4c41-aa90-657fa07f88e6	missing	update.profile.on.first.login
\.


--
-- TOC entry 4238 (class 0 OID 17475)
-- Dependencies: 278
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 16398)
-- Dependencies: 217
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	f	master-realm	0	f	\N	\N	t	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
5a06802a-f187-458d-9d8f-6f984aa8c25c	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
0f609102-b1d5-4724-b3d1-d9bd6e11b963	t	f	broker	0	f	\N	\N	t	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
aa257a34-aba6-490f-9159-c9f3c606be16	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
1072829b-c776-46c3-8e7b-678fffbfe23f	t	t	admin-cli	0	t	\N	\N	f	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
d7e60689-15fd-4648-80f8-03b3849edcde	t	f	test-realm	0	f	\N	\N	t	\N	f	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	0	f	f	test Realm	f	client-secret	\N	\N	\N	t	f	f	f
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	f	realm-management	0	f	\N	\N	t	\N	f	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	f	account	0	t	\N	/realms/test/account/	f	\N	f	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	t	f	account-console	0	t	\N	/realms/test/account/	f	\N	f	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
89614203-f0b6-4e68-81a7-582665ae7363	t	f	broker	0	f	\N	\N	t	\N	f	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
34511941-fb4b-43c0-a8b8-c010452ce360	t	t	security-admin-console	0	t	\N	/admin/test/console/	f	\N	f	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
3bae3748-f79c-4c59-9588-fd11d2638579	t	t	admin-cli	0	t	\N	\N	f	\N	f	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- TOC entry 4197 (class 0 OID 16756)
-- Dependencies: 237
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
5a06802a-f187-458d-9d8f-6f984aa8c25c	post.logout.redirect.uris	+
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	post.logout.redirect.uris	+
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	pkce.code.challenge.method	S256
aa257a34-aba6-490f-9159-c9f3c606be16	post.logout.redirect.uris	+
aa257a34-aba6-490f-9159-c9f3c606be16	pkce.code.challenge.method	S256
aa257a34-aba6-490f-9159-c9f3c606be16	client.use.lightweight.access.token.enabled	true
1072829b-c776-46c3-8e7b-678fffbfe23f	client.use.lightweight.access.token.enabled	true
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	post.logout.redirect.uris	+
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	post.logout.redirect.uris	+
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	pkce.code.challenge.method	S256
34511941-fb4b-43c0-a8b8-c010452ce360	post.logout.redirect.uris	+
34511941-fb4b-43c0-a8b8-c010452ce360	pkce.code.challenge.method	S256
34511941-fb4b-43c0-a8b8-c010452ce360	client.use.lightweight.access.token.enabled	true
3bae3748-f79c-4c59-9588-fd11d2638579	client.use.lightweight.access.token.enabled	true
\.


--
-- TOC entry 4249 (class 0 OID 17724)
-- Dependencies: 289
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 4248 (class 0 OID 17599)
-- Dependencies: 288
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 4198 (class 0 OID 16766)
-- Dependencies: 238
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 4226 (class 0 OID 17265)
-- Dependencies: 266
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
8994f0ad-2742-4268-824b-85fad1e324ea	offline_access	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect built-in scope: offline_access	openid-connect
14e4a69c-8db9-438a-bacf-8bc9ac9edfb9	role_list	4bd0522d-6268-48d6-85e6-d08570bd2206	SAML role list	saml
9aaf8f35-d6d2-42fa-a0a2-439732a9e031	saml_organization	4bd0522d-6268-48d6-85e6-d08570bd2206	Organization Membership	saml
37961f47-ccec-47bb-88cc-ecce9f40510f	profile	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect built-in scope: profile	openid-connect
dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	email	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect built-in scope: email	openid-connect
96bc02a0-ba1a-4668-a92d-cb82286537e5	address	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect built-in scope: address	openid-connect
996d6706-2401-4a17-abfb-b50f340423cc	phone	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect built-in scope: phone	openid-connect
46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	roles	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect scope for add user roles to the access token	openid-connect
33157526-d4f7-42cd-b0e1-0555576d0cb4	web-origins	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect scope for add allowed web origins to the access token	openid-connect
b4756b98-01fe-4849-af2d-8d4bbd916313	microprofile-jwt	4bd0522d-6268-48d6-85e6-d08570bd2206	Microprofile - JWT built-in scope	openid-connect
58c25038-39f5-40a5-b55e-34c167137750	acr	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
5a61479c-dd3b-479a-8eef-d0c61c8ad88f	basic	4bd0522d-6268-48d6-85e6-d08570bd2206	OpenID Connect scope for add all basic claims to the token	openid-connect
939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	organization	4bd0522d-6268-48d6-85e6-d08570bd2206	Additional claims about the organization a subject belongs to	openid-connect
81d77dda-1aad-4f36-a368-a2af1d47d19d	offline_access	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect built-in scope: offline_access	openid-connect
5d7dd29b-fbc7-4c2f-850b-3b4b2b5861f1	role_list	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	SAML role list	saml
6e4d86df-bdd6-4f55-b66a-feb5bd019dc2	saml_organization	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	Organization Membership	saml
66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	profile	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect built-in scope: profile	openid-connect
d727c2f6-f728-4e33-9d84-59f8e6cae98d	email	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect built-in scope: email	openid-connect
8436ba14-a51c-418d-b73e-affe6553c6d5	address	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect built-in scope: address	openid-connect
3d6f45e3-d668-4fd5-a499-ba4c7086287f	phone	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect built-in scope: phone	openid-connect
a4eb39e6-4b68-4540-9504-9f81ae489acd	roles	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect scope for add user roles to the access token	openid-connect
0103f8a6-e520-4ef2-ad16-e992bdce117e	web-origins	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect scope for add allowed web origins to the access token	openid-connect
54989d12-a93f-403f-95eb-4c447eea196b	microprofile-jwt	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	Microprofile - JWT built-in scope	openid-connect
04e54e75-51bb-4668-99a2-07d84bb3954b	acr	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
2f7da4b4-c35b-4019-a419-fd4b6d0770b1	basic	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	OpenID Connect scope for add all basic claims to the token	openid-connect
355caef3-5c9c-4f6a-bd06-ef97571c08b5	organization	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	Additional claims about the organization a subject belongs to	openid-connect
\.


--
-- TOC entry 4227 (class 0 OID 17279)
-- Dependencies: 267
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
8994f0ad-2742-4268-824b-85fad1e324ea	true	display.on.consent.screen
8994f0ad-2742-4268-824b-85fad1e324ea	${offlineAccessScopeConsentText}	consent.screen.text
14e4a69c-8db9-438a-bacf-8bc9ac9edfb9	true	display.on.consent.screen
14e4a69c-8db9-438a-bacf-8bc9ac9edfb9	${samlRoleListScopeConsentText}	consent.screen.text
9aaf8f35-d6d2-42fa-a0a2-439732a9e031	false	display.on.consent.screen
37961f47-ccec-47bb-88cc-ecce9f40510f	true	display.on.consent.screen
37961f47-ccec-47bb-88cc-ecce9f40510f	${profileScopeConsentText}	consent.screen.text
37961f47-ccec-47bb-88cc-ecce9f40510f	true	include.in.token.scope
dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	true	display.on.consent.screen
dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	${emailScopeConsentText}	consent.screen.text
dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	true	include.in.token.scope
96bc02a0-ba1a-4668-a92d-cb82286537e5	true	display.on.consent.screen
96bc02a0-ba1a-4668-a92d-cb82286537e5	${addressScopeConsentText}	consent.screen.text
96bc02a0-ba1a-4668-a92d-cb82286537e5	true	include.in.token.scope
996d6706-2401-4a17-abfb-b50f340423cc	true	display.on.consent.screen
996d6706-2401-4a17-abfb-b50f340423cc	${phoneScopeConsentText}	consent.screen.text
996d6706-2401-4a17-abfb-b50f340423cc	true	include.in.token.scope
46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	true	display.on.consent.screen
46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	${rolesScopeConsentText}	consent.screen.text
46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	false	include.in.token.scope
33157526-d4f7-42cd-b0e1-0555576d0cb4	false	display.on.consent.screen
33157526-d4f7-42cd-b0e1-0555576d0cb4		consent.screen.text
33157526-d4f7-42cd-b0e1-0555576d0cb4	false	include.in.token.scope
b4756b98-01fe-4849-af2d-8d4bbd916313	false	display.on.consent.screen
b4756b98-01fe-4849-af2d-8d4bbd916313	true	include.in.token.scope
58c25038-39f5-40a5-b55e-34c167137750	false	display.on.consent.screen
58c25038-39f5-40a5-b55e-34c167137750	false	include.in.token.scope
5a61479c-dd3b-479a-8eef-d0c61c8ad88f	false	display.on.consent.screen
5a61479c-dd3b-479a-8eef-d0c61c8ad88f	false	include.in.token.scope
939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	true	display.on.consent.screen
939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	${organizationScopeConsentText}	consent.screen.text
939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	true	include.in.token.scope
81d77dda-1aad-4f36-a368-a2af1d47d19d	true	display.on.consent.screen
81d77dda-1aad-4f36-a368-a2af1d47d19d	${offlineAccessScopeConsentText}	consent.screen.text
5d7dd29b-fbc7-4c2f-850b-3b4b2b5861f1	true	display.on.consent.screen
5d7dd29b-fbc7-4c2f-850b-3b4b2b5861f1	${samlRoleListScopeConsentText}	consent.screen.text
6e4d86df-bdd6-4f55-b66a-feb5bd019dc2	false	display.on.consent.screen
66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	true	display.on.consent.screen
66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	${profileScopeConsentText}	consent.screen.text
66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	true	include.in.token.scope
d727c2f6-f728-4e33-9d84-59f8e6cae98d	true	display.on.consent.screen
d727c2f6-f728-4e33-9d84-59f8e6cae98d	${emailScopeConsentText}	consent.screen.text
d727c2f6-f728-4e33-9d84-59f8e6cae98d	true	include.in.token.scope
8436ba14-a51c-418d-b73e-affe6553c6d5	true	display.on.consent.screen
8436ba14-a51c-418d-b73e-affe6553c6d5	${addressScopeConsentText}	consent.screen.text
8436ba14-a51c-418d-b73e-affe6553c6d5	true	include.in.token.scope
3d6f45e3-d668-4fd5-a499-ba4c7086287f	true	display.on.consent.screen
3d6f45e3-d668-4fd5-a499-ba4c7086287f	${phoneScopeConsentText}	consent.screen.text
3d6f45e3-d668-4fd5-a499-ba4c7086287f	true	include.in.token.scope
a4eb39e6-4b68-4540-9504-9f81ae489acd	true	display.on.consent.screen
a4eb39e6-4b68-4540-9504-9f81ae489acd	${rolesScopeConsentText}	consent.screen.text
a4eb39e6-4b68-4540-9504-9f81ae489acd	false	include.in.token.scope
0103f8a6-e520-4ef2-ad16-e992bdce117e	false	display.on.consent.screen
0103f8a6-e520-4ef2-ad16-e992bdce117e		consent.screen.text
0103f8a6-e520-4ef2-ad16-e992bdce117e	false	include.in.token.scope
54989d12-a93f-403f-95eb-4c447eea196b	false	display.on.consent.screen
54989d12-a93f-403f-95eb-4c447eea196b	true	include.in.token.scope
04e54e75-51bb-4668-99a2-07d84bb3954b	false	display.on.consent.screen
04e54e75-51bb-4668-99a2-07d84bb3954b	false	include.in.token.scope
2f7da4b4-c35b-4019-a419-fd4b6d0770b1	false	display.on.consent.screen
2f7da4b4-c35b-4019-a419-fd4b6d0770b1	false	include.in.token.scope
355caef3-5c9c-4f6a-bd06-ef97571c08b5	true	display.on.consent.screen
355caef3-5c9c-4f6a-bd06-ef97571c08b5	${organizationScopeConsentText}	consent.screen.text
355caef3-5c9c-4f6a-bd06-ef97571c08b5	true	include.in.token.scope
\.


--
-- TOC entry 4250 (class 0 OID 17765)
-- Dependencies: 290
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
5a06802a-f187-458d-9d8f-6f984aa8c25c	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
5a06802a-f187-458d-9d8f-6f984aa8c25c	37961f47-ccec-47bb-88cc-ecce9f40510f	t
5a06802a-f187-458d-9d8f-6f984aa8c25c	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
5a06802a-f187-458d-9d8f-6f984aa8c25c	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
5a06802a-f187-458d-9d8f-6f984aa8c25c	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
5a06802a-f187-458d-9d8f-6f984aa8c25c	58c25038-39f5-40a5-b55e-34c167137750	t
5a06802a-f187-458d-9d8f-6f984aa8c25c	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
5a06802a-f187-458d-9d8f-6f984aa8c25c	b4756b98-01fe-4849-af2d-8d4bbd916313	f
5a06802a-f187-458d-9d8f-6f984aa8c25c	996d6706-2401-4a17-abfb-b50f340423cc	f
5a06802a-f187-458d-9d8f-6f984aa8c25c	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
5a06802a-f187-458d-9d8f-6f984aa8c25c	8994f0ad-2742-4268-824b-85fad1e324ea	f
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	37961f47-ccec-47bb-88cc-ecce9f40510f	t
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	58c25038-39f5-40a5-b55e-34c167137750	t
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	b4756b98-01fe-4849-af2d-8d4bbd916313	f
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	996d6706-2401-4a17-abfb-b50f340423cc	f
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	8994f0ad-2742-4268-824b-85fad1e324ea	f
1072829b-c776-46c3-8e7b-678fffbfe23f	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
1072829b-c776-46c3-8e7b-678fffbfe23f	37961f47-ccec-47bb-88cc-ecce9f40510f	t
1072829b-c776-46c3-8e7b-678fffbfe23f	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
1072829b-c776-46c3-8e7b-678fffbfe23f	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
1072829b-c776-46c3-8e7b-678fffbfe23f	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
1072829b-c776-46c3-8e7b-678fffbfe23f	58c25038-39f5-40a5-b55e-34c167137750	t
1072829b-c776-46c3-8e7b-678fffbfe23f	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
1072829b-c776-46c3-8e7b-678fffbfe23f	b4756b98-01fe-4849-af2d-8d4bbd916313	f
1072829b-c776-46c3-8e7b-678fffbfe23f	996d6706-2401-4a17-abfb-b50f340423cc	f
1072829b-c776-46c3-8e7b-678fffbfe23f	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
1072829b-c776-46c3-8e7b-678fffbfe23f	8994f0ad-2742-4268-824b-85fad1e324ea	f
0f609102-b1d5-4724-b3d1-d9bd6e11b963	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
0f609102-b1d5-4724-b3d1-d9bd6e11b963	37961f47-ccec-47bb-88cc-ecce9f40510f	t
0f609102-b1d5-4724-b3d1-d9bd6e11b963	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
0f609102-b1d5-4724-b3d1-d9bd6e11b963	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
0f609102-b1d5-4724-b3d1-d9bd6e11b963	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
0f609102-b1d5-4724-b3d1-d9bd6e11b963	58c25038-39f5-40a5-b55e-34c167137750	t
0f609102-b1d5-4724-b3d1-d9bd6e11b963	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
0f609102-b1d5-4724-b3d1-d9bd6e11b963	b4756b98-01fe-4849-af2d-8d4bbd916313	f
0f609102-b1d5-4724-b3d1-d9bd6e11b963	996d6706-2401-4a17-abfb-b50f340423cc	f
0f609102-b1d5-4724-b3d1-d9bd6e11b963	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
0f609102-b1d5-4724-b3d1-d9bd6e11b963	8994f0ad-2742-4268-824b-85fad1e324ea	f
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	37961f47-ccec-47bb-88cc-ecce9f40510f	t
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	58c25038-39f5-40a5-b55e-34c167137750	t
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	b4756b98-01fe-4849-af2d-8d4bbd916313	f
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	996d6706-2401-4a17-abfb-b50f340423cc	f
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	8994f0ad-2742-4268-824b-85fad1e324ea	f
aa257a34-aba6-490f-9159-c9f3c606be16	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
aa257a34-aba6-490f-9159-c9f3c606be16	37961f47-ccec-47bb-88cc-ecce9f40510f	t
aa257a34-aba6-490f-9159-c9f3c606be16	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
aa257a34-aba6-490f-9159-c9f3c606be16	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
aa257a34-aba6-490f-9159-c9f3c606be16	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
aa257a34-aba6-490f-9159-c9f3c606be16	58c25038-39f5-40a5-b55e-34c167137750	t
aa257a34-aba6-490f-9159-c9f3c606be16	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
aa257a34-aba6-490f-9159-c9f3c606be16	b4756b98-01fe-4849-af2d-8d4bbd916313	f
aa257a34-aba6-490f-9159-c9f3c606be16	996d6706-2401-4a17-abfb-b50f340423cc	f
aa257a34-aba6-490f-9159-c9f3c606be16	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
aa257a34-aba6-490f-9159-c9f3c606be16	8994f0ad-2742-4268-824b-85fad1e324ea	f
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	04e54e75-51bb-4668-99a2-07d84bb3954b	t
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	8436ba14-a51c-418d-b73e-affe6553c6d5	f
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	54989d12-a93f-403f-95eb-4c447eea196b	f
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	04e54e75-51bb-4668-99a2-07d84bb3954b	t
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	8436ba14-a51c-418d-b73e-affe6553c6d5	f
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	54989d12-a93f-403f-95eb-4c447eea196b	f
3bae3748-f79c-4c59-9588-fd11d2638579	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
3bae3748-f79c-4c59-9588-fd11d2638579	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
3bae3748-f79c-4c59-9588-fd11d2638579	04e54e75-51bb-4668-99a2-07d84bb3954b	t
3bae3748-f79c-4c59-9588-fd11d2638579	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
3bae3748-f79c-4c59-9588-fd11d2638579	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
3bae3748-f79c-4c59-9588-fd11d2638579	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
3bae3748-f79c-4c59-9588-fd11d2638579	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
3bae3748-f79c-4c59-9588-fd11d2638579	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
3bae3748-f79c-4c59-9588-fd11d2638579	8436ba14-a51c-418d-b73e-affe6553c6d5	f
3bae3748-f79c-4c59-9588-fd11d2638579	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
3bae3748-f79c-4c59-9588-fd11d2638579	54989d12-a93f-403f-95eb-4c447eea196b	f
89614203-f0b6-4e68-81a7-582665ae7363	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
89614203-f0b6-4e68-81a7-582665ae7363	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
89614203-f0b6-4e68-81a7-582665ae7363	04e54e75-51bb-4668-99a2-07d84bb3954b	t
89614203-f0b6-4e68-81a7-582665ae7363	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
89614203-f0b6-4e68-81a7-582665ae7363	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
89614203-f0b6-4e68-81a7-582665ae7363	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
89614203-f0b6-4e68-81a7-582665ae7363	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
89614203-f0b6-4e68-81a7-582665ae7363	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
89614203-f0b6-4e68-81a7-582665ae7363	8436ba14-a51c-418d-b73e-affe6553c6d5	f
89614203-f0b6-4e68-81a7-582665ae7363	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
89614203-f0b6-4e68-81a7-582665ae7363	54989d12-a93f-403f-95eb-4c447eea196b	f
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	04e54e75-51bb-4668-99a2-07d84bb3954b	t
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	8436ba14-a51c-418d-b73e-affe6553c6d5	f
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	54989d12-a93f-403f-95eb-4c447eea196b	f
34511941-fb4b-43c0-a8b8-c010452ce360	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
34511941-fb4b-43c0-a8b8-c010452ce360	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
34511941-fb4b-43c0-a8b8-c010452ce360	04e54e75-51bb-4668-99a2-07d84bb3954b	t
34511941-fb4b-43c0-a8b8-c010452ce360	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
34511941-fb4b-43c0-a8b8-c010452ce360	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
34511941-fb4b-43c0-a8b8-c010452ce360	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
34511941-fb4b-43c0-a8b8-c010452ce360	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
34511941-fb4b-43c0-a8b8-c010452ce360	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
34511941-fb4b-43c0-a8b8-c010452ce360	8436ba14-a51c-418d-b73e-affe6553c6d5	f
34511941-fb4b-43c0-a8b8-c010452ce360	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
34511941-fb4b-43c0-a8b8-c010452ce360	54989d12-a93f-403f-95eb-4c447eea196b	f
\.


--
-- TOC entry 4228 (class 0 OID 17284)
-- Dependencies: 268
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
8994f0ad-2742-4268-824b-85fad1e324ea	bfa5baaa-38b4-4bae-aa57-a3fe267726d7
81d77dda-1aad-4f36-a368-a2af1d47d19d	5a300429-230d-44ba-a1de-151881babe3b
\.


--
-- TOC entry 4246 (class 0 OID 17520)
-- Dependencies: 286
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
e098cceb-2bcf-4533-8cc4-38973b15e57e	Trusted Hosts	4bd0522d-6268-48d6-85e6-d08570bd2206	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	anonymous
8743dfdb-c978-42ae-8ffb-5c7cac3b29d8	Consent Required	4bd0522d-6268-48d6-85e6-d08570bd2206	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	anonymous
7d19a1c2-bb44-4e67-a17a-ff069c3e81fb	Full Scope Disabled	4bd0522d-6268-48d6-85e6-d08570bd2206	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	anonymous
e980ea45-1810-4cb9-84c0-5a8efdbf4646	Max Clients Limit	4bd0522d-6268-48d6-85e6-d08570bd2206	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	anonymous
58b82ef8-7dd9-4c21-abbe-8d3be68e134e	Allowed Protocol Mapper Types	4bd0522d-6268-48d6-85e6-d08570bd2206	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	anonymous
95ba790e-4b26-48ce-921f-0ac3125bc58b	Allowed Client Scopes	4bd0522d-6268-48d6-85e6-d08570bd2206	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	anonymous
f5edc1ff-75d8-4681-95a6-d38316fcd3e9	Allowed Protocol Mapper Types	4bd0522d-6268-48d6-85e6-d08570bd2206	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	authenticated
2f9cbed4-28ae-43c3-8e13-b7e0f2f9797e	Allowed Client Scopes	4bd0522d-6268-48d6-85e6-d08570bd2206	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	authenticated
bbe64476-60c4-4f64-b129-8e23a1ef5e46	rsa-generated	4bd0522d-6268-48d6-85e6-d08570bd2206	rsa-generated	org.keycloak.keys.KeyProvider	4bd0522d-6268-48d6-85e6-d08570bd2206	\N
1a1d483f-0358-4da5-a3ba-c122c92c08f0	rsa-enc-generated	4bd0522d-6268-48d6-85e6-d08570bd2206	rsa-enc-generated	org.keycloak.keys.KeyProvider	4bd0522d-6268-48d6-85e6-d08570bd2206	\N
ca73e40b-3e0c-4c9c-a197-a3493754154a	hmac-generated-hs512	4bd0522d-6268-48d6-85e6-d08570bd2206	hmac-generated	org.keycloak.keys.KeyProvider	4bd0522d-6268-48d6-85e6-d08570bd2206	\N
de17e8e8-8ab0-4a35-8974-0d8a925cfdd5	aes-generated	4bd0522d-6268-48d6-85e6-d08570bd2206	aes-generated	org.keycloak.keys.KeyProvider	4bd0522d-6268-48d6-85e6-d08570bd2206	\N
a8afe572-f272-4659-855b-f8850bc37816	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	4bd0522d-6268-48d6-85e6-d08570bd2206	\N
e5269a21-b90e-4221-8739-47123f04108c	rsa-generated	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	rsa-generated	org.keycloak.keys.KeyProvider	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N
cc1ce053-9ad9-4307-9cb4-74e4b4d728ef	rsa-enc-generated	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	rsa-enc-generated	org.keycloak.keys.KeyProvider	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N
1dd65f2a-c25f-442f-98cb-2dd5495f21ce	hmac-generated-hs512	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	hmac-generated	org.keycloak.keys.KeyProvider	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N
5855a663-9c94-4cb1-8aa9-f42bcc341431	aes-generated	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	aes-generated	org.keycloak.keys.KeyProvider	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N
c79dd5df-8d77-4a29-9447-1590074c7f31	Trusted Hosts	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	anonymous
584785e0-f677-4a5b-b272-3954346c30eb	Consent Required	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	anonymous
02488e72-cd64-412f-b047-67fbd48fe1a4	Full Scope Disabled	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	anonymous
01568050-47d1-407b-af34-b59dc76da3c5	Max Clients Limit	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	anonymous
2b55f398-f137-4f50-93c7-c5b67e79db0b	Allowed Protocol Mapper Types	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	anonymous
900c392c-0211-4061-8da6-eb78c0fb6f40	Allowed Client Scopes	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	anonymous
95cf5834-3f4f-4714-b500-073e2f6a4b75	Allowed Protocol Mapper Types	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	authenticated
ab76b87f-ba17-4844-b9d9-256342edc212	Allowed Client Scopes	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	authenticated
274a4fb3-6bd9-492c-8182-34e0633e3ffb	\N	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N
\.


--
-- TOC entry 4245 (class 0 OID 17515)
-- Dependencies: 285
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
dabcd25a-7cd9-4ca9-a6f1-7e628db5b6a0	95ba790e-4b26-48ce-921f-0ac3125bc58b	allow-default-scopes	true
52435877-46fe-4adb-b047-49541b493e3a	e098cceb-2bcf-4533-8cc4-38973b15e57e	host-sending-registration-request-must-match	true
67a112e1-7154-4448-afde-035914e0057e	e098cceb-2bcf-4533-8cc4-38973b15e57e	client-uris-must-match	true
b5d1e8af-9e78-49c8-b96d-713a40e8d226	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
041365e7-9082-4f92-97bd-45ad24b2c3f1	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	oidc-full-name-mapper
6ae312c1-5dc9-467b-b191-10c29d94cbc6	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	saml-user-property-mapper
fa543cfc-6b16-4d5b-9a11-11e9cce79b01	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
777f5d2c-9062-4368-9778-8819ec1cc4c0	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	saml-role-list-mapper
37d513af-9300-4ffd-8601-dd13d49fee99	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
ec944b4c-a965-42f7-8732-64cf9c92d6c3	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	saml-user-attribute-mapper
f917b9bc-5e40-4f7d-b17d-b60932a78db6	f5edc1ff-75d8-4681-95a6-d38316fcd3e9	allowed-protocol-mapper-types	oidc-address-mapper
883d5f44-947b-4361-9807-d18e48263afa	e980ea45-1810-4cb9-84c0-5a8efdbf4646	max-clients	200
efbf1dd3-f1c6-4b93-84fe-d50ed9f0fb39	2f9cbed4-28ae-43c3-8e13-b7e0f2f9797e	allow-default-scopes	true
fbb9fc86-41d2-45c1-ab9c-de6cc82d827e	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	saml-user-property-mapper
11b1e2fb-1f9f-4c93-b2da-fba2b703eef3	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
97529fbe-82dd-4f1f-ae99-f53494b7ea59	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	oidc-address-mapper
0cec2072-0629-48f8-938d-8f95cae0a788	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	oidc-full-name-mapper
f620a91e-97b7-41b9-909a-70f35d7200af	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	saml-user-attribute-mapper
85a853e7-1710-48a7-bc76-bb26ec98a72d	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
6602512a-e88c-4e60-8786-e2a407acb357	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2aafb86a-9da1-4bea-8b64-d0bbe69c5476	58b82ef8-7dd9-4c21-abbe-8d3be68e134e	allowed-protocol-mapper-types	saml-role-list-mapper
194c282c-f2f2-4cc6-99da-0229f8c1b140	de17e8e8-8ab0-4a35-8974-0d8a925cfdd5	kid	2b4dcc69-8954-438d-ae1e-b19ad7ffe837
1cc868ec-4b52-4c04-b273-8d9b09ae68ed	de17e8e8-8ab0-4a35-8974-0d8a925cfdd5	secret	WOSqc7xmLM3WgpqHMrYd1w
d2dbf64f-930a-4739-ab05-aaf410cab7bf	de17e8e8-8ab0-4a35-8974-0d8a925cfdd5	priority	100
f351d406-d8bc-4f37-98f5-178fa01b6a5d	ca73e40b-3e0c-4c9c-a197-a3493754154a	kid	5f37a138-ea69-40a8-9790-30ea718de496
00e57834-1d8f-4039-a802-b965571e93db	ca73e40b-3e0c-4c9c-a197-a3493754154a	algorithm	HS512
deff9962-bead-4ecb-bd9d-3c94ca1af85b	ca73e40b-3e0c-4c9c-a197-a3493754154a	secret	zAuTGSstCD74yMmk9oATNIocDAyLhJOCCPpVh9tFi9TyTzCb38coYvLO2qJ9FEe4IJg2CMxdV3JoCuJn6sJmI36l-KJRfKNga6MPjLCIk8SgIwMzVQ-IPfppgHA-rTRbJ-ZhB2SS5ywWBSDKcFIQ7Dv7MKugEvq7EDO_vtpGvPY
27f5b2b5-f4fa-4650-b4ef-3f95b68be3af	ca73e40b-3e0c-4c9c-a197-a3493754154a	priority	100
2e007775-a5f0-4e74-87df-0d7d00266ff1	1a1d483f-0358-4da5-a3ba-c122c92c08f0	privateKey	MIIEpAIBAAKCAQEAu6cOCQkkpPQQxUgfdDQkYh1rMYahMhwjwEmKW4aNtkv7crl+6fp4LF8P53wEitplDIEGs6LynZiuWo5eI7RYfexwH9EHhW2J2r6eOrAfdBcdkzEbjZ9q9SaTnayXlxUDzQn0jSQ5D8pIKQB2jbddzpyBRpwWAVN0su+k9YlJo0o0SARCKB2HbrSj/vUr85uRrGa/3uDNK/EuCbMkC+RqgJbJL3F6vyT0k44cngCDlYsvuFqGEodQDcQ7OlriIFwuemN67uLCe65EFEYPWB1CgayuMOo3xMhORw2PS5h8bFFv9YhL6bbjOLe+CAfSRZ/BQsYt8wjXUbCD0/eW2p9kbQIDAQABAoIBAAFVlMH3sK0Dl0Lv2llnLYMNFoAJpwfGL3LkkvlHoaZUL/uG2iIrx8L5AhHxTc728pT+LeAFHpiER2kZbg3u8Fok3j87q0QFnV9Sz6k3K2IV7/3l8X42TfpkRdRvL7zBR3+jvHtscINuOskf2bf0P9SCRGEOJxHnWAMVtSSRz1Y747BF4z77qf0Y/Jc2uPc8FAc0pUSg4He3jjn4lJp4cqsrvf3JcMSoNbyXl+1PTVZMVy/K3AkCTHd5lXEwBtXqGsAHP4cxMtZt6omrexVA1QrTLs+2lhskfn6Lb0wFizZcP9qTXnT/hAL3U/+QOyy/3M51O0rWSyEwfWWAJ3EGYvkCgYEA/so+qvwOWPLg8MfcrbVXZa1hyXb2MZbB3QuFaA/BeN7SJRyUKuxZNcGBhqbjMEV8c8q4KWu7qTjYNFkt/V1QfdUcJO8ujzea3CWQxl1RRqUPt/1y2HH1Xk3w/cKep/05eVQnhzytzSnBNGsfblfY5oeLek4gViAtPxF8zeFAH6MCgYEAvIswbgqZFeTEfUSoU2q9b2k5cMMHq7y5yQM6mnI4StZH2RIT8UfSHxELM68F5ak69y+IFmf8SHeA8q3T4pjHNGsMP8hee/w+0rwoPH2XFVINOu16xI3TIwq63r5Z1q8dVt0irE12Zxk21O8vZq+t0/aJ8juozDCfg2Q8vVbbbK8CgYEAnQ9w6BfuhDhcHzEkwNPrZxslD3rMsq7bHHawqwAjZG3+nq/qSjddmryJKscPfz8mQ36wXaAyk1MeO87JgciXCKpo6f+i9NfzF0f04cK+ikzPzrxmojRFa/eh2duxz55SYo9UupHWFYVquvRZ8LwoUZs2iJNGbbDyE1GlXIhA7f8CgYB5p9oc9uumS9FY/ucZxALtk1jD4KPfdUvvXwz+QPr/ltoPP3Hsuqni781pkOJeON7aRioqQvhvDeT/MZhJWskWkof50+DbYXxr34qa1XKaCDKPNlKD5vs4XiELvokbVCy7Mr6/rM/cYFGX/al5OZwQ68BAs6wL7MfQMOpcRWIZ8wKBgQCyaE5umoEPZ2+s/xFJW1PnTjThhoqegqN6HLe2lYrvYWxCYM/UKOcX2ecp/UzmXH3VSk4VodieEswR5TEOli9mGJGP54YLEuv4r/gWcLcf36+HecU/WMkqdm1PG+56KdqLDgJKpuJBHsLshzlKUFuFtzS7XW8fHZjeexnvouqZJA==
ba363030-c511-4150-a74d-7bff57eadca3	1a1d483f-0358-4da5-a3ba-c122c92c08f0	certificate	MIICmzCCAYMCBgGUFtg8GTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMjMwMDkxMjM3WhcNMzQxMjMwMDkxNDE3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7pw4JCSSk9BDFSB90NCRiHWsxhqEyHCPASYpbho22S/tyuX7p+ngsXw/nfASK2mUMgQazovKdmK5ajl4jtFh97HAf0QeFbYnavp46sB90Fx2TMRuNn2r1JpOdrJeXFQPNCfSNJDkPykgpAHaNt13OnIFGnBYBU3Sy76T1iUmjSjRIBEIoHYdutKP+9Svzm5GsZr/e4M0r8S4JsyQL5GqAlskvcXq/JPSTjhyeAIOViy+4WoYSh1ANxDs6WuIgXC56Y3ru4sJ7rkQURg9YHUKBrK4w6jfEyE5HDY9LmHxsUW/1iEvptuM4t74IB9JFn8FCxi3zCNdRsIPT95ban2RtAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAC7spNHE8frpYhc/hlsi/vIzGL6mm2wmD53u1mESQPFh5m8n4L60NIkC1zPrpaUiSvzgdfoQwPWtJm57LJ28RfbLnP1+FWJdjMZ8E4KixdoEXbOHNnv+32g8k25gblN56cjzbP3hwUMNTSTvGRk4WRc8nGu2gMd41eu4SzWgz2RZd5BGyCkjFQ9e8p1tAxCFuWU810Z2fYrhkyA1mzgejj4t8VRfmZiTeCBUoGVOnPppolrpR7aM0W+8EUT5eYPp3ycxV8wNyU2Ds2DAlk1KLDiYWkti8AEj+KCYahOZILNT3vV4kiWxN2sGECxDA5eBETIRSQ1k8siYxLPsYxbQ/gE=
f353e329-adc6-43e8-91ee-18c5405b6d88	1a1d483f-0358-4da5-a3ba-c122c92c08f0	priority	100
b14a79d2-35b5-455b-9575-2053ac2f064b	1a1d483f-0358-4da5-a3ba-c122c92c08f0	algorithm	RSA-OAEP
14194339-c2a4-4099-9eae-201676810841	1a1d483f-0358-4da5-a3ba-c122c92c08f0	keyUse	ENC
4b0a1009-d3f7-4d26-a9d4-a7d10c2b572d	a8afe572-f272-4659-855b-f8850bc37816	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
a372a935-18a3-4390-bae1-55a91df5b14d	bbe64476-60c4-4f64-b129-8e23a1ef5e46	keyUse	SIG
e17974f6-3225-461f-af90-d726fdf08aa1	bbe64476-60c4-4f64-b129-8e23a1ef5e46	certificate	MIICmzCCAYMCBgGUFtg7ZzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMjMwMDkxMjM3WhcNMzQxMjMwMDkxNDE3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCygLmxwVUpQ1/NL+DaM1kE5xszKPK7Kqelf+AxcoIepXWhGaKrughOUaFKAmwrZ32W6+prida28IRHM5c2z5H3Odf7jO3KOtuz2Qa+803wFdroa1zy5SeM6ATobCYDLwWmm9ktwefC6n/ZpsK7QeapmOSsqATZlM58W8Fe84G4EvLr0afxmKceed6c4B+/+tkeOas/wv7ruYPaZhEl4qPvZhopi3T7dSoNMp7U/e4OOezHiYTk9vxhX3M9XdPdZYVRBbG87ljgb4jpCm9+BKaeVNtL87/FrrYJP+d0cRCChQfF7T0XI3qsW+DslmtJiMSObCxmA8A79JIUwKd7rgjPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJfY8pGczsqKVvyobXib0+pMzPKwEwEiKKXG/AIe1KbKLk35tyCBTgs01Tkbi7B4xFdjr+PuxDHUCyy/L+ifYgCsCCSY1ZH1aEtgY3hj+5DfwqnozuYg145S9FO4H5V+/GGEMdgo0zuLYHyUnS7P3JSPojdpwgMhzj7AABXN1C0VPEy+NPT8W40ijvR69rFK/Bod7aaCE5S01G7Do782ii4XzEp7mpokIByL+BnJxkymgBdoQky+CYMgrxE0YA6zpEozgFhRMCF4YF/aQURcICjp3OWn5iKcZp63qIBkz6fOWxLt0QnRJejwbpree0oy47lbnYEb4a/2TMbFzcpMSCg=
d41bdd7e-b336-4bd3-8aee-268752533acb	bbe64476-60c4-4f64-b129-8e23a1ef5e46	privateKey	MIIEowIBAAKCAQEAsoC5scFVKUNfzS/g2jNZBOcbMyjyuyqnpX/gMXKCHqV1oRmiq7oITlGhSgJsK2d9luvqa4nWtvCERzOXNs+R9znX+4ztyjrbs9kGvvNN8BXa6Gtc8uUnjOgE6GwmAy8FppvZLcHnwup/2abCu0HmqZjkrKgE2ZTOfFvBXvOBuBLy69Gn8ZinHnnenOAfv/rZHjmrP8L+67mD2mYRJeKj72YaKYt0+3UqDTKe1P3uDjnsx4mE5Pb8YV9zPV3T3WWFUQWxvO5Y4G+I6QpvfgSmnlTbS/O/xa62CT/ndHEQgoUHxe09FyN6rFvg7JZrSYjEjmwsZgPAO/SSFMCne64IzwIDAQABAoIBABfZJTYPn4+Zk0PoI3veLq9TgGmiN7p0Kp1sthNqejea9oTAATY9RAfRVcxRV4n9qSSlP0FVKJfHZCeDx9jy/CGSG6jdfWrZLeow0tBnKYtWeCk40txsFjp38yk+7bMw2z8/r3vdXgKcxC5cM8Rt5mHT7f/38LHwdMfeQGRYVy/e4GsfwA3W5JdobUDHcaUTKoaQLbl4NTS7aOdCy3JLx4hlI4a56Rcc0wzWNOkM9roMBqzTHyOm50uDmCI8PCrS0qoeJSo0adsw34tgLwz40D+HTe2mxDsQM1H9VE9vbOhgT5AyqlrsPtt/m4LomYy/auCCLAH0PUsj4Gqx9z7KAEkCgYEA3AIc85BU9/NQBjyJUqIfn0xgf9wmYUNCPXkzztmslKj3fQ//U7gXzatLEEg0a3HeGmG2m4QbOE9X4UtrThezYGXww61CHmFtOCHbOTBmeQA/KxelkK6UUt7sEDnxhqWxdtKq/AcoHe238A8TtBmYfaONprFLNQeQ6qrEJqd0mwcCgYEAz7RgWAo5t1spUbEi7RZjBGaUQzalcMPyKCSYcsBnnNzzxiOHbZPeQVK6QDC9r2mLxl2uqHK57gOl28FzZ6udvdZ6yl8OOfi/d22GflhXoswBe0GX1QiUL2FBfD9xNPjVp1JXu4bQvD9JfnF5Z5PdNJ8paf/ktbICPMDB42uwCfkCgYBGvt80awsHmFP5TWoTClME1HiLZO1qhUg9oEXKlDBstVCwBH7kGuR8nEJNAArrKfhzn0wrAfYGy2zE442j1Pc3XlBne8UxI78NN8XYw/mPm0a0wqvYtGq5ozlhlmBWHd3NCb01wc9ioFhvd0mstjZU4Ezid0xpxv8QlszwaRST7QKBgFbXWsTUmacQ5WizgB/SkVnArdKgYXGRa4jfLCImUevi8cVxC2mEPpPfS+IUvuo9XeR1PNZPCW/7dHg6HM9GkLBToYlFTwRr/VmooGfo9dMqKqBnH11BtftNVXzmZaW5OFM5+VZ9mn5qk4bbWOA2kXEz7rPT+sMBBzBxg19bogG5AoGBAI7C3n9cnAMP80AdcRIXzbb/C3KTs/9cqgShhHcwL8FmpJLsA9TreDXdWRFY1+TyYRfh3Jp598+rYrc3WufOI6+EfD4dFhQz2EMTQj7roxQEr28Nu6XY813D+mbGCxlLG/Wx5i1O6L+kquAPmq/MO00WLN6o6Hsmxa0TY9gSHGSz
8d8bbc3b-9642-4344-adfc-2519e69a076b	bbe64476-60c4-4f64-b129-8e23a1ef5e46	priority	100
8cc04583-fc5c-4bbe-a9a9-056f64893d1f	cc1ce053-9ad9-4307-9cb4-74e4b4d728ef	certificate	MIIClzCCAX8CBgGUFuqdlzANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTI0MTIzMDA5MzI0MloXDTM0MTIzMDA5MzQyMlowDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMCTcQ3l3/HQq6Ry1Bo8TYLckRUoa9bm21Z3X5uKmH4z/BL74/CptvhZxlC7ofs3wzenpOCs4Nxdmwe39CEbBoZvI0owLDNPBa8Oko8Gwy7+uCuoKANvQWspQ0STn7/FMRg5+NsP2ckK6muVacHNvsVzBQB3ReTZ5+gXmeVduLQjgWlXPDIoirVgkFAa8OoFfZqAgTgxTZpqBU+eopPahzwGWF2zsBUVVz1UJ5fUTBOQlFyyHRIDZZapISYifjQOjblfgaEBDsBVtOajDe1CXoHDDjWYzGqPcF/qHeehDgcY128sZaxi4L2HzWtSIGzzfFC16U87vVSzqjEZyGJDX8kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEApGoT2ieBccidaPQpitCdVpM4VexuGLBorvxXNVCH4Q/yzecVMeBgQkHN735qdpERtTSksogT7QGjUgSyuHBkYjihxBXlJpSRgpPpgQ6456ALW5Exs1gKH94hd3gxoXHefWqoWNkmrswAYwxFaU5LrsUzPCKlqS0YFVbzE0J5XYQLmTZTYdK0JiBiWG9hJd+XxXdja/2p42IbrIh4rP7dZWbXKqbPkBU/bU8KjNWIeO2IioHPsyRk9Wafz77WCIrnpNC5rtnEtCBZGe3/9AZ4O+UDuWmVTXEMdARwJhNxFGIcWAM1e1qfbk1Z7m7rDKF3oFKO1xxpywBm8lo1LijMdw==
0883b650-b9b9-4100-8c9d-89acbd770564	cc1ce053-9ad9-4307-9cb4-74e4b4d728ef	priority	100
8343a699-eb35-4716-9ff3-c6f71eb04c55	cc1ce053-9ad9-4307-9cb4-74e4b4d728ef	privateKey	MIIEogIBAAKCAQEAwJNxDeXf8dCrpHLUGjxNgtyRFShr1ubbVndfm4qYfjP8Evvj8Km2+FnGULuh+zfDN6ek4Kzg3F2bB7f0IRsGhm8jSjAsM08Frw6SjwbDLv64K6goA29BaylDRJOfv8UxGDn42w/ZyQrqa5Vpwc2+xXMFAHdF5Nnn6BeZ5V24tCOBaVc8MiiKtWCQUBrw6gV9moCBODFNmmoFT56ik9qHPAZYXbOwFRVXPVQnl9RME5CUXLIdEgNllqkhJiJ+NA6NuV+BoQEOwFW05qMN7UJegcMONZjMao9wX+od56EOBxjXbyxlrGLgvYfNa1IgbPN8ULXpTzu9VLOqMRnIYkNfyQIDAQABAoIBAAcIT7jIkeNjrt4LbOjqinlcu5BU9nbVrwR6999iyTcxKsxQIdAWzim7PBerYnTvBI6PkCa9uue0JB2886Ep3X2ABjlYP+rJNT5KxQh1LAj/2nu5SfWDPazigiRcPBllnemJe7Nc+brbZesKZZljIG5XSSBiUfBfKdxSRK7TakJrMr+y46xTNoUQn8bK0k8aOhSInfvK+fsSvZH0JYTMiKF2NDa5LVPI9Feki5xSnV5noOdtypiLcJAoKGrW2vs/N1O1iy+mjpeEnQTsonfGZxuECVQiBOp4eFOPxQZQv4ZSk0bY5UicqTTgGXoJtDVRFRBTeytWPXBuG2Fo2HJwlCkCgYEA4PvpJuQPxsvbWlXk9hyN6O2izrH3+Uz5xsIYQ9aD5nBRi7HCYkY+Yk1gEKmfHjXKBzN6ayugaNHIcKz+meQ08SgrbT+7+mmRNqQHp6iWC3c4tRtlS7MvLVqqllBJv6K3zYhjvh3+O6Dns1hcg+6KwkngkyI2FLl82jXd8Ttf1DcCgYEA2x/KpbJWJschO8vq/D/7CuEgkG0cTCrwAp3BeNXla9uGmvCkL3Z0iLN9kqCGpJFfZJhZdG0kJcpD/XXQhBvh0NfJNjqJW0JpiJ4IR1IitcAz6Ba2PWRHtdw4mgTrIa6pVSGsu2NSHE158fnheatLUZzlzhrSvMLSIOtR9/rEa/8CgYAVa+bnLQ/TfdWE5GjIhi983iOCSq+xrQKbSh/FVcd5SXh6NJKtiMKn2XYsH/pmhfiWdvBRA/ZiBJdxIwea33+q9ogr/sWHMkYBTdzsucCPlupvVAxxCL6VMuzLIxnihTu69iGJGJH8W3W0PdWROkU7+ozHdZpwnrikjjxzm5OkQQKBgHC/Le0OEugHA+GZrgI3BXv2lGPb0Hicizw9YcREArT5kov8j+5f+9wuxskAUecxaaz/+t8+HSBYr50l1rFzC0EDFuQRQIW1aUnDTq0r5PIxwEOGFCUIiSFY+8K8DyQYk8Za+l683w3zC3DnSw3ohmuq2E+xW4eGksofauC2pgSPAoGAG8WaY07g6Ep5979cR+5Racgvu2ERSN+4tMQ/7SZbI/Hy6sn7++QggFlg7qYVqhh9SBf7yr9OReZXOY57iyRc+nw4lagT/6xdhftvvPtvyEpIulGx1wRxe87eCB2gzo3Yahd+4tdc9dTB3861VwbtGcSdVeBDVOKG1pZTLjWrea0=
6007cba5-e60f-4bcb-a14d-345748769e42	cc1ce053-9ad9-4307-9cb4-74e4b4d728ef	keyUse	ENC
b497b3eb-7756-4a14-a2b2-0f59c8fb0723	cc1ce053-9ad9-4307-9cb4-74e4b4d728ef	algorithm	RSA-OAEP
4e5229aa-c932-491b-85d7-cfa7a7751279	e5269a21-b90e-4221-8739-47123f04108c	keyUse	SIG
de562a83-6684-4729-ad92-cf933c913827	e5269a21-b90e-4221-8739-47123f04108c	certificate	MIIClzCCAX8CBgGUFuqdATANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTI0MTIzMDA5MzI0MVoXDTM0MTIzMDA5MzQyMVowDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK8Ge8zcBo3xOjq06fkUS4FVC7nf1ml5MIk664IFwP4C1GDU4nMCulax1oAkEM8KVpV35m0YH6iSvFcTIbBKUNTVmJX35Ftmi1cvij6okFHyIVBAYBwiHFfysbt2rotbdSmsqI60maC40IIdnNH2PIEG8w8+R9+GdNwfYZunl6dmYeA0hp1f43RkXlus9FCFeve01xmBPLzoVc0SMYf38pczQpDHye9LiVw+AT+a9BkS93aSrrE7HE3lImWFAdPj2y2UhXxZMhL/vxZmM7FNMU0qRKTCiXUEW9y9Asyw0XJuJXku8xoa7ushmRPSXHKmhi3EwUkrfnAPVqfO+xwHNCsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkiq5FxpZ5ArXQAPPNJkSG+2tum2uOjN/p5u2DleMBDD8k6FjyhOtBipokvMHNM/ON8cL7WanHNCmYxBBPe4Oehdyd0U9Z3i+oDyic1QqrPfqJfrHaA/eeYMZRm7AH/ubrIyjCi5MOOIrGGjT7EHIIhea5GNO+EjdNvr8d8wS69c9j4f4mQO+6NXRI5bObU/SGXQITwT8a1pBzAWpp6C8nvhKN49ezqconme7FzCxObA55FmityEFdsC45W0E5v7YjWymmnwXEFisF4DrCT7luaIFPttD+R/AeaVrXE1ETPkWtfZz6HfsaVrkA8xGGLzZLsT+9uXSJCF6B15zFQ4DcA==
3dd61d57-04f7-498a-a733-d9b680ecae8c	e5269a21-b90e-4221-8739-47123f04108c	priority	100
0cb36731-91b0-4643-9671-a083dcf824b9	e5269a21-b90e-4221-8739-47123f04108c	privateKey	MIIEpAIBAAKCAQEArwZ7zNwGjfE6OrTp+RRLgVULud/WaXkwiTrrggXA/gLUYNTicwK6VrHWgCQQzwpWlXfmbRgfqJK8VxMhsEpQ1NWYlffkW2aLVy+KPqiQUfIhUEBgHCIcV/Kxu3aui1t1KayojrSZoLjQgh2c0fY8gQbzDz5H34Z03B9hm6eXp2Zh4DSGnV/jdGReW6z0UIV697TXGYE8vOhVzRIxh/fylzNCkMfJ70uJXD4BP5r0GRL3dpKusTscTeUiZYUB0+PbLZSFfFkyEv+/FmYzsU0xTSpEpMKJdQRb3L0CzLDRcm4leS7zGhru6yGZE9JccqaGLcTBSSt+cA9Wp877HAc0KwIDAQABAoIBAC6y3ilEs4L/z/eF+b95iMPTOzO243B041xaGigw/NNJUf0cD+d73NfwzziVZt629W8f9J07CIdjz1i0RBLTYUnIS9QHtigk7hyvFIWvWAJlRjoxUvNurn1QxdcszVllZ5dc+ARLb4oQhaGR4RusRWxvvD5e8bJUH63zuYlcZ/xDxWV+qmIkiKYkk2pSZogMOr00qIl2FLQKSO1eQJE6CMp8/e2ZnX+TAahHAiIMki7wn5MWzxF34reWQ0FHn1OlIx8UR/3Py8q+F5xemdiImqEfDFwaFMHrpJUd64kUTT91ooFmbErneHuFnuZ1NbqWVY2aQ5eNmtur/+gOr+oE66ECgYEA6iSyCnkU582uXqKNbuaD+lPycbxa5X8PUhuuKmF8QRDFnbrCIp8IqGezIwD02hL2+GwjQDDX4kCY0/ABwU57Q/CWSkaXI5rY2TOdyLMm9quIIKhfEa04S0OBrI+1jWw0gP8SSEDYWK4gkp+OuFTJW+qBCB2SKjYNnTZcXEjIxVkCgYEAv10MuGOsAdlKMcAftq/Msre8zqAxdwncOJultIc3pSk7PvXT1MxQzFoqYfZnQxyVxD/lXxiLdJ7s3mi0ScFWzmZRFGHyDZzBHRKuy1aobDUYUxTcU1N9JXboWJ/kxgEWkJwQWEIPCGOBpgg3oiDofp75VUwGN6jKtl4sJHsJ4SMCgYEAtnt0+y6U+XhW7tCXlBg6Qe4NJVFcMkLNqPuDyOoDUh6FNcHpLdxuffmcJqrHKfLf4os9CflHN8GKmpsScxr8fN3T8/2CK7CyUs2kqlfeBR94z6MJvRgYqKfrN5clMxxi6ypgkElhk/PZ1Qxfyg/igy2H9NA/K4DHKYDFiPL87rkCgYB2V4PzT+hiqE7i3259WtCbQVdo7NZKSHXBKDhcoTZ/VDVIZVwgAE6DYctOE8SeU0InQGCH47TyZQoVLOk5p3AYalv/3+aCFouygAhKxYeYi2lEj+UFPt9o2NUtYYxoCuo6edj9y7RiOq9Fz1UgVXuSOpv07PP3XdIm36wqz1A3wwKBgQCcLbdSKkqMGUoLbnPh3HyVMomVMso9m50rtBmFV8n3YYC1OJiN/AHGwI+24NdUlat6qnY8OLnxWarqx0j2mrSbNa2YPaYqrX7Mum8SeJiIW1AocNexlkG+wEmucJvDlygo3b/bSuDrpCRKIvoeYuk1JyCCA0ib/dW93teASyopZg==
09c72611-a23f-4c3c-b6ce-325de34373fc	5855a663-9c94-4cb1-8aa9-f42bcc341431	secret	iv91iiiM6LlXaavYbMqxmg
9354f896-7738-4e8f-95c5-bec143453154	5855a663-9c94-4cb1-8aa9-f42bcc341431	kid	e7c35ecd-ceec-4fc5-98d7-6ed0328e7c33
bb3518d8-6e3f-435f-bac3-66985ff824d0	5855a663-9c94-4cb1-8aa9-f42bcc341431	priority	100
de0bd74a-3cdb-42a9-9133-50ce1c2439d8	1dd65f2a-c25f-442f-98cb-2dd5495f21ce	secret	2F2RzmKAIMGnw_Zha8esEw7K5yWNFVFkUBeczoi2ARY11oQUvmBaGrm6m35UyfkXQm21rqg3M2k88pHtAJe3vhvpLP4pY5dbY8ctDV-psge_v9PQl4zXTbvgNoFHvVKtfvtkIXk-4kXch_PwYaAIxVz9WG-eHmqPjyGDgP4cT5o
4c85c261-7580-4d3d-bbef-13412208e160	1dd65f2a-c25f-442f-98cb-2dd5495f21ce	priority	100
b0e409b0-f527-4a43-acf8-462d9ee8572c	1dd65f2a-c25f-442f-98cb-2dd5495f21ce	algorithm	HS512
8ae41708-a21d-4413-8d87-78f7c165a1fb	1dd65f2a-c25f-442f-98cb-2dd5495f21ce	kid	27596864-5ed4-4d55-ab47-050ea8de25a0
03ad8d66-3b53-4773-93e7-cf6ebf8150a2	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
412dc7f5-7fad-450c-ae34-f1e58d0242e7	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b2120a50-e359-4a5a-b028-a4a3616221e7	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d3c26bfa-223e-4dbc-98c6-c8f509118609	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	saml-user-attribute-mapper
67685a43-cab6-408d-a916-77d517a05193	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	saml-role-list-mapper
053bf43b-e6b0-419b-8ef6-900e57c1d8a1	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	saml-user-property-mapper
148f3ccc-4bdf-440d-a9ad-a85c3e95bdca	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	oidc-address-mapper
8281024b-e1cb-431b-a991-0ace415a3cf8	2b55f398-f137-4f50-93c7-c5b67e79db0b	allowed-protocol-mapper-types	oidc-full-name-mapper
2412826c-bfc3-402e-8bc4-74fca2b59cc5	c79dd5df-8d77-4a29-9447-1590074c7f31	client-uris-must-match	true
8b34e7aa-d656-4e72-9b2a-6e61615d1e81	c79dd5df-8d77-4a29-9447-1590074c7f31	host-sending-registration-request-must-match	true
742e4685-8454-458a-8e60-d9839cd79405	900c392c-0211-4061-8da6-eb78c0fb6f40	allow-default-scopes	true
a16a4bf8-84b3-47de-afac-401b72d26f09	ab76b87f-ba17-4844-b9d9-256342edc212	allow-default-scopes	true
d0446c72-0bcf-4a55-b6ec-884164250d89	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	saml-user-property-mapper
e6e97ae4-76d8-4d31-992b-4aac327ecfa4	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	oidc-full-name-mapper
bba1efb3-605d-4bc1-b857-17b62b9012c7	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	oidc-address-mapper
8dfb8a52-6a2a-410a-bdeb-43e0a99625d0	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
124c7e4b-6be6-4d23-9a30-386b5ce1fd41	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
7f6d35a7-f4d3-43b4-b71c-409e87685707	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	saml-role-list-mapper
059a5458-df1e-40e1-8396-d07874587e4d	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	saml-user-attribute-mapper
c69e3e0d-b49e-420b-abd0-6f22cfafb220	95cf5834-3f4f-4714-b500-073e2f6a4b75	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
fae87554-b45b-40df-8e98-ad820d2e5c9b	01568050-47d1-407b-af34-b59dc76da3c5	max-clients	200
657c272f-daa6-4b64-9238-589e78c1cd1f	274a4fb3-6bd9-492c-8182-34e0633e3ffb	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}],"unmanagedAttributePolicy":"ENABLED"}
\.


--
-- TOC entry 4178 (class 0 OID 16417)
-- Dependencies: 218
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
5b80ef4b-1803-4601-84cb-8561d83de9d4	867901f0-c0da-4ed0-9b73-907f2e62b6c2
5b80ef4b-1803-4601-84cb-8561d83de9d4	eeaaa6f3-903c-4f3f-9a92-0f28912525a3
5b80ef4b-1803-4601-84cb-8561d83de9d4	77210dfa-c8d8-471b-ac04-83b3eca981d0
5b80ef4b-1803-4601-84cb-8561d83de9d4	07ff1e02-8aad-4321-928a-234cb98c896d
5b80ef4b-1803-4601-84cb-8561d83de9d4	1390aee6-d13d-43b0-9514-9deda4c1a69c
5b80ef4b-1803-4601-84cb-8561d83de9d4	06f06156-87b1-4158-afe5-893101e0471f
5b80ef4b-1803-4601-84cb-8561d83de9d4	fe2320ce-fd6d-40d3-8d4d-5d74764f2ca2
5b80ef4b-1803-4601-84cb-8561d83de9d4	7a19e50e-84f0-495b-92ab-dc032fd24cfc
5b80ef4b-1803-4601-84cb-8561d83de9d4	54ba3ce1-912c-447f-97fe-14bc07a1faa1
5b80ef4b-1803-4601-84cb-8561d83de9d4	5cea39e9-fb3f-4bec-8c62-64c72b669ee8
5b80ef4b-1803-4601-84cb-8561d83de9d4	c26b316f-36da-4f8a-bc1d-63ec8d65539d
5b80ef4b-1803-4601-84cb-8561d83de9d4	ed421537-35d9-41d1-99d1-0e4837546632
5b80ef4b-1803-4601-84cb-8561d83de9d4	08c6a639-64bd-4826-b4ce-757e4cba5272
5b80ef4b-1803-4601-84cb-8561d83de9d4	24c60820-89f6-42b2-a2a5-c01288d4b60a
5b80ef4b-1803-4601-84cb-8561d83de9d4	d282dd2a-ced9-4d08-87f4-02a7134e65ea
5b80ef4b-1803-4601-84cb-8561d83de9d4	608be903-b741-4813-8c74-cf3457c51fcc
5b80ef4b-1803-4601-84cb-8561d83de9d4	61fa77e6-b00e-471e-98a1-8904b5fba82f
5b80ef4b-1803-4601-84cb-8561d83de9d4	ccd3ec4f-06f8-4206-8764-50debffba3d0
07ff1e02-8aad-4321-928a-234cb98c896d	d282dd2a-ced9-4d08-87f4-02a7134e65ea
07ff1e02-8aad-4321-928a-234cb98c896d	ccd3ec4f-06f8-4206-8764-50debffba3d0
1390aee6-d13d-43b0-9514-9deda4c1a69c	608be903-b741-4813-8c74-cf3457c51fcc
b396a245-b076-4b42-8d22-5718a2b9efcb	e74339dc-7e58-42fe-bd11-4044eddbfb15
b396a245-b076-4b42-8d22-5718a2b9efcb	7330cde2-fc86-4dc2-953e-9387daee37d3
7330cde2-fc86-4dc2-953e-9387daee37d3	77c24cf0-ea71-4373-8b79-8f0a94337266
179c9b45-5920-47e4-a48e-ec7f12f3d756	e93475fe-97f1-4472-bfc6-8a0a583cb697
5b80ef4b-1803-4601-84cb-8561d83de9d4	ec9cb0c9-4569-4b2b-b1f8-56c328a173aa
b396a245-b076-4b42-8d22-5718a2b9efcb	bfa5baaa-38b4-4bae-aa57-a3fe267726d7
b396a245-b076-4b42-8d22-5718a2b9efcb	a9810123-87b4-4fa5-861d-e75ec1dbb47e
5b80ef4b-1803-4601-84cb-8561d83de9d4	67ec12a7-1ead-4143-aba5-2382db56185b
5b80ef4b-1803-4601-84cb-8561d83de9d4	39274e71-644d-43e9-bd73-2d8972323737
5b80ef4b-1803-4601-84cb-8561d83de9d4	b62c4f3e-de6f-4936-9891-12bf7981ead5
5b80ef4b-1803-4601-84cb-8561d83de9d4	82775b62-1825-4781-a0dd-3ef52dde9c0d
5b80ef4b-1803-4601-84cb-8561d83de9d4	553d1f8d-144c-41d5-b7b3-73c4efecf8cd
5b80ef4b-1803-4601-84cb-8561d83de9d4	54113351-3885-4a4e-8526-d0147c5f0eaf
5b80ef4b-1803-4601-84cb-8561d83de9d4	cd418284-f7c8-4323-a196-d392ffe54777
5b80ef4b-1803-4601-84cb-8561d83de9d4	c68a1b2f-5d9d-4966-9ce4-f4d753607927
5b80ef4b-1803-4601-84cb-8561d83de9d4	770c49be-a973-437e-8060-7e7a2060d777
5b80ef4b-1803-4601-84cb-8561d83de9d4	751e7651-0bde-4a42-b4b0-efe9639d16a6
5b80ef4b-1803-4601-84cb-8561d83de9d4	9577b2c4-0f01-4215-a963-d2769a466ba7
5b80ef4b-1803-4601-84cb-8561d83de9d4	c6cdda2f-0a61-4dec-a4ca-a40e7e33511d
5b80ef4b-1803-4601-84cb-8561d83de9d4	aaa7f7e4-0a22-40e1-935d-e60be950afbb
5b80ef4b-1803-4601-84cb-8561d83de9d4	03f24b02-cf47-4f97-900d-3de252c90c31
5b80ef4b-1803-4601-84cb-8561d83de9d4	8759774b-9a00-4b14-8ff1-1f2bc6702e07
5b80ef4b-1803-4601-84cb-8561d83de9d4	573d1909-69c6-4bee-a633-5ad02fb19fad
5b80ef4b-1803-4601-84cb-8561d83de9d4	9d0cb0ba-1cd8-4b1f-801b-af1e7a286f3e
82775b62-1825-4781-a0dd-3ef52dde9c0d	8759774b-9a00-4b14-8ff1-1f2bc6702e07
b62c4f3e-de6f-4936-9891-12bf7981ead5	03f24b02-cf47-4f97-900d-3de252c90c31
b62c4f3e-de6f-4936-9891-12bf7981ead5	9d0cb0ba-1cd8-4b1f-801b-af1e7a286f3e
17920f63-c1bc-449f-acb6-9a646a69fb1c	12bafd12-464c-40d8-829c-d41af3e8ab16
17920f63-c1bc-449f-acb6-9a646a69fb1c	42606fb4-52a7-4246-b75f-3866b732b825
17920f63-c1bc-449f-acb6-9a646a69fb1c	d74f759d-f556-4cdd-b8f9-8a7f507c6627
17920f63-c1bc-449f-acb6-9a646a69fb1c	704b5dc3-2ca1-4743-8ae7-0402ba9bf2ee
17920f63-c1bc-449f-acb6-9a646a69fb1c	f47fdc16-e972-46e5-9649-b86cc8266c54
17920f63-c1bc-449f-acb6-9a646a69fb1c	9e85484d-6004-4282-83dd-ec9d1ead8af6
17920f63-c1bc-449f-acb6-9a646a69fb1c	179b230e-ebc4-4176-a288-c2540d7dd225
17920f63-c1bc-449f-acb6-9a646a69fb1c	426b79b3-4ee5-44ec-a25d-9fc32754859a
17920f63-c1bc-449f-acb6-9a646a69fb1c	f4ac5355-7b6e-4578-beb1-0ce0285d3ad4
17920f63-c1bc-449f-acb6-9a646a69fb1c	c9823011-8251-4b4b-b6e7-17364e5b8df7
17920f63-c1bc-449f-acb6-9a646a69fb1c	f5355cf8-c31d-409b-9a8b-6f69538ae76e
17920f63-c1bc-449f-acb6-9a646a69fb1c	937111d9-dca9-4ec3-9984-9d023686a4bd
17920f63-c1bc-449f-acb6-9a646a69fb1c	994e89f0-fa83-4577-919a-5b5eb6225ad2
17920f63-c1bc-449f-acb6-9a646a69fb1c	deedb12e-a6f9-4cb7-a92d-213edd057f07
17920f63-c1bc-449f-acb6-9a646a69fb1c	ab0da9c0-c1c9-4cef-8a36-70e486e049aa
17920f63-c1bc-449f-acb6-9a646a69fb1c	1ab67b04-156d-48ac-abb1-dffc63ab02e7
17920f63-c1bc-449f-acb6-9a646a69fb1c	5294e04e-99ca-41f0-950b-dda418abb798
704b5dc3-2ca1-4743-8ae7-0402ba9bf2ee	ab0da9c0-c1c9-4cef-8a36-70e486e049aa
76317afc-d012-4cb9-b876-f5da10fbd5ed	e1730fd1-1448-453b-80b3-683485fc8284
d74f759d-f556-4cdd-b8f9-8a7f507c6627	deedb12e-a6f9-4cb7-a92d-213edd057f07
d74f759d-f556-4cdd-b8f9-8a7f507c6627	5294e04e-99ca-41f0-950b-dda418abb798
76317afc-d012-4cb9-b876-f5da10fbd5ed	3eb82509-1201-4659-99ff-35716158aff2
3eb82509-1201-4659-99ff-35716158aff2	458d1414-23e2-4b96-82ba-3958149946a4
b21ab298-6c7f-4947-a1c4-f579197b5c78	0c6f7246-342c-4a45-8bc6-a678a8cb9326
5b80ef4b-1803-4601-84cb-8561d83de9d4	bb73e9b1-ea38-43ef-9ac6-c8f3cb856b47
17920f63-c1bc-449f-acb6-9a646a69fb1c	8664201d-ffc2-4f22-8bda-8f2f9f98012e
76317afc-d012-4cb9-b876-f5da10fbd5ed	5a300429-230d-44ba-a1de-151881babe3b
76317afc-d012-4cb9-b876-f5da10fbd5ed	68ecd769-edf8-4b7e-bcd3-fc275dcba02d
\.


--
-- TOC entry 4179 (class 0 OID 16420)
-- Dependencies: 219
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
01ff6614-b623-49d6-a65a-5243168f00d8	\N	password	2220ebb6-019d-4c78-8eaa-806b276bcc82	1735550219618	My password	{"value":"CQv6FydDu7O8BptU9VnyJLfbRCCGQX+p9GtbnIbLyYs=","salt":"fFKBBlufVY/i8uByraBKFw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- TOC entry 4176 (class 0 OID 16390)
-- Dependencies: 216
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-12-30 09:14:07.960586	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	5550046993
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-12-30 09:14:07.980534	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	5550046993
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-12-30 09:14:08.064245	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	5550046993
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-12-30 09:14:08.073451	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	5550046993
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-12-30 09:14:08.289109	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	5550046993
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-12-30 09:14:08.300195	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	5550046993
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-12-30 09:14:08.479529	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	5550046993
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-12-30 09:14:08.489033	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	5550046993
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-12-30 09:14:08.497202	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	5550046993
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-12-30 09:14:08.710062	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	5550046993
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-12-30 09:14:08.808084	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	5550046993
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-12-30 09:14:08.814469	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	5550046993
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-12-30 09:14:08.837618	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	5550046993
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-12-30 09:14:08.887707	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	5550046993
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-12-30 09:14:08.894732	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-12-30 09:14:08.903006	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	5550046993
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-12-30 09:14:08.911256	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	5550046993
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-12-30 09:14:09.035535	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	5550046993
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-12-30 09:14:09.14444	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	5550046993
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-12-30 09:14:09.15479	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	5550046993
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.260976	144	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	5550046993
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-12-30 09:14:09.158584	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	5550046993
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-12-30 09:14:09.164561	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	5550046993
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-12-30 09:14:09.277538	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	5550046993
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-12-30 09:14:09.301374	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	5550046993
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-12-30 09:14:09.30468	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	5550046993
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-12-30 09:14:09.814611	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	5550046993
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-12-30 09:14:10.043013	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	5550046993
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-12-30 09:14:10.052095	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	5550046993
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-12-30 09:14:10.181219	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	5550046993
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-12-30 09:14:10.213308	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	5550046993
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-12-30 09:14:10.242062	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	5550046993
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-12-30 09:14:10.24812	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	5550046993
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-12-30 09:14:10.255711	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-12-30 09:14:10.258512	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	5550046993
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-12-30 09:14:10.306535	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	5550046993
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-12-30 09:14:10.314734	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	5550046993
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-12-30 09:14:10.329281	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5550046993
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-12-30 09:14:10.335123	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	5550046993
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-12-30 09:14:10.34031	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	5550046993
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-12-30 09:14:10.342314	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	5550046993
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-12-30 09:14:10.345131	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	5550046993
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-12-30 09:14:10.351174	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	5550046993
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-12-30 09:14:11.945068	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	5550046993
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-12-30 09:14:11.952294	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	5550046993
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-12-30 09:14:11.958042	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	5550046993
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-12-30 09:14:11.964574	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	5550046993
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-12-30 09:14:11.966708	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	5550046993
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-12-30 09:14:12.126112	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	5550046993
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-12-30 09:14:12.134226	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	5550046993
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-12-30 09:14:12.215121	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	5550046993
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-12-30 09:14:12.627822	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	5550046993
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-12-30 09:14:12.633848	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-12-30 09:14:12.637815	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	5550046993
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-12-30 09:14:12.642477	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	5550046993
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-12-30 09:14:12.655659	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	5550046993
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-12-30 09:14:12.66851	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	5550046993
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-12-30 09:14:12.746091	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	5550046993
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-12-30 09:14:13.282141	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	5550046993
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-12-30 09:14:13.337509	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	5550046993
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-12-30 09:14:13.348872	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	5550046993
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-12-30 09:14:13.360734	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	5550046993
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-12-30 09:14:13.369912	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	5550046993
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-12-30 09:14:13.374515	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	5550046993
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-12-30 09:14:13.379947	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	5550046993
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-12-30 09:14:13.383797	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	5550046993
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-12-30 09:14:13.44032	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	5550046993
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-12-30 09:14:13.478084	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	5550046993
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-12-30 09:14:13.485394	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	5550046993
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-12-30 09:14:13.531029	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	5550046993
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-12-30 09:14:13.538624	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	5550046993
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-12-30 09:14:13.544321	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	5550046993
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-12-30 09:14:13.553292	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	5550046993
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-12-30 09:14:13.564018	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	5550046993
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-12-30 09:14:13.566563	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	5550046993
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-12-30 09:14:13.600818	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	5550046993
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-12-30 09:14:13.644311	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	5550046993
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-12-30 09:14:13.650115	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	5550046993
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-12-30 09:14:13.652777	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	5550046993
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-12-30 09:14:13.686315	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	5550046993
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-12-30 09:14:13.688685	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	5550046993
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-12-30 09:14:13.728049	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	5550046993
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-12-30 09:14:13.730558	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5550046993
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-12-30 09:14:13.738253	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5550046993
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-12-30 09:14:13.740341	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	5550046993
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-12-30 09:14:13.777796	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	5550046993
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-12-30 09:14:13.785557	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	5550046993
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-12-30 09:14:13.797013	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	5550046993
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-12-30 09:14:13.812463	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	5550046993
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.82041	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	5550046993
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.839732	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	5550046993
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.881418	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.892913	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	5550046993
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.894902	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	5550046993
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.909941	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	5550046993
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.912628	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	5550046993
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-12-30 09:14:13.921343	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	5550046993
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.031655	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.03414	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.050603	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.093856	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.096821	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.146608	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	5550046993
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-12-30 09:14:14.153991	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	5550046993
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-12-30 09:14:14.16511	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	5550046993
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-12-30 09:14:14.215454	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	5550046993
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-12-30 09:14:14.268303	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	5550046993
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2024-12-30 09:14:14.328153	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	5550046993
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-12-30 09:14:14.334844	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	5550046993
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-12-30 09:14:14.390089	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	5550046993
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-12-30 09:14:14.393164	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	5550046993
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-12-30 09:14:14.406421	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-12-30 09:14:14.41198	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	5550046993
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-12-30 09:14:14.486822	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	5550046993
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-12-30 09:14:14.490344	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	5550046993
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-12-30 09:14:14.495944	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	5550046993
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-12-30 09:14:14.498728	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	5550046993
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-12-30 09:14:14.508295	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	5550046993
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-12-30 09:14:14.512981	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	5550046993
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-12-30 09:14:14.669349	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	5550046993
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-12-30 09:14:14.675002	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	5550046993
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-12-30 09:14:14.680574	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-12-30 09:14:14.720281	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-12-30 09:14:14.725421	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	5550046993
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-12-30 09:14:14.727438	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-12-30 09:14:14.730068	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	5550046993
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.736869	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	5550046993
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.776616	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
25.0.0-28265-index-cleanup	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.789662	128	EXECUTED	9:8c0cfa341a0474385b324f5c4b2dfcc1	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION; dropIndex ...		\N	4.29.1	\N	\N	5550046993
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.792039	129	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.835937	130	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	5550046993
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.872684	131	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	5550046993
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.89033	132	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	5550046993
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.892761	133	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	5550046993
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-12-30 09:14:14.966797	134	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	5550046993
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:14.983054	135	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	5550046993
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:14.993491	136	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	5550046993
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.034106	137	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	5550046993
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.043276	138	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	5550046993
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.055009	139	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	5550046993
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.097564	140	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	5550046993
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.18989	141	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	5550046993
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.198395	142	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	5550046993
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-12-30 09:14:15.255405	143	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	5550046993
\.


--
-- TOC entry 4175 (class 0 OID 16385)
-- Dependencies: 215
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- TOC entry 4251 (class 0 OID 17781)
-- Dependencies: 291
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
4bd0522d-6268-48d6-85e6-d08570bd2206	8994f0ad-2742-4268-824b-85fad1e324ea	f
4bd0522d-6268-48d6-85e6-d08570bd2206	14e4a69c-8db9-438a-bacf-8bc9ac9edfb9	t
4bd0522d-6268-48d6-85e6-d08570bd2206	9aaf8f35-d6d2-42fa-a0a2-439732a9e031	t
4bd0522d-6268-48d6-85e6-d08570bd2206	37961f47-ccec-47bb-88cc-ecce9f40510f	t
4bd0522d-6268-48d6-85e6-d08570bd2206	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f	t
4bd0522d-6268-48d6-85e6-d08570bd2206	96bc02a0-ba1a-4668-a92d-cb82286537e5	f
4bd0522d-6268-48d6-85e6-d08570bd2206	996d6706-2401-4a17-abfb-b50f340423cc	f
4bd0522d-6268-48d6-85e6-d08570bd2206	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0	t
4bd0522d-6268-48d6-85e6-d08570bd2206	33157526-d4f7-42cd-b0e1-0555576d0cb4	t
4bd0522d-6268-48d6-85e6-d08570bd2206	b4756b98-01fe-4849-af2d-8d4bbd916313	f
4bd0522d-6268-48d6-85e6-d08570bd2206	58c25038-39f5-40a5-b55e-34c167137750	t
4bd0522d-6268-48d6-85e6-d08570bd2206	5a61479c-dd3b-479a-8eef-d0c61c8ad88f	t
4bd0522d-6268-48d6-85e6-d08570bd2206	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd	f
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	81d77dda-1aad-4f36-a368-a2af1d47d19d	f
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	5d7dd29b-fbc7-4c2f-850b-3b4b2b5861f1	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	6e4d86df-bdd6-4f55-b66a-feb5bd019dc2	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	d727c2f6-f728-4e33-9d84-59f8e6cae98d	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	8436ba14-a51c-418d-b73e-affe6553c6d5	f
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	3d6f45e3-d668-4fd5-a499-ba4c7086287f	f
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	a4eb39e6-4b68-4540-9504-9f81ae489acd	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0103f8a6-e520-4ef2-ad16-e992bdce117e	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	54989d12-a93f-403f-95eb-4c447eea196b	f
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	04e54e75-51bb-4668-99a2-07d84bb3954b	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	2f7da4b4-c35b-4019-a419-fd4b6d0770b1	t
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	355caef3-5c9c-4f6a-bd06-ef97571c08b5	f
\.


--
-- TOC entry 4180 (class 0 OID 16425)
-- Dependencies: 220
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- TOC entry 4239 (class 0 OID 17480)
-- Dependencies: 279
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- TOC entry 4240 (class 0 OID 17485)
-- Dependencies: 280
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4253 (class 0 OID 17807)
-- Dependencies: 293
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4241 (class 0 OID 17494)
-- Dependencies: 281
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 4242 (class 0 OID 17503)
-- Dependencies: 282
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4243 (class 0 OID 17506)
-- Dependencies: 283
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4244 (class 0 OID 17512)
-- Dependencies: 284
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4201 (class 0 OID 16802)
-- Dependencies: 241
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4247 (class 0 OID 17577)
-- Dependencies: 287
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 4223 (class 0 OID 17204)
-- Dependencies: 263
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 4222 (class 0 OID 17201)
-- Dependencies: 262
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 16807)
-- Dependencies: 242
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- TOC entry 4203 (class 0 OID 16816)
-- Dependencies: 243
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 16920)
-- Dependencies: 247
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4208 (class 0 OID 16925)
-- Dependencies: 248
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4221 (class 0 OID 17198)
-- Dependencies: 261
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
\.


--
-- TOC entry 4181 (class 0 OID 16433)
-- Dependencies: 221
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
b396a245-b076-4b42-8d22-5718a2b9efcb	4bd0522d-6268-48d6-85e6-d08570bd2206	f	${role_default-roles}	default-roles-master	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	\N
5b80ef4b-1803-4601-84cb-8561d83de9d4	4bd0522d-6268-48d6-85e6-d08570bd2206	f	${role_admin}	admin	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	\N
867901f0-c0da-4ed0-9b73-907f2e62b6c2	4bd0522d-6268-48d6-85e6-d08570bd2206	f	${role_create-realm}	create-realm	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	\N
eeaaa6f3-903c-4f3f-9a92-0f28912525a3	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_create-client}	create-client	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
77210dfa-c8d8-471b-ac04-83b3eca981d0	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_view-realm}	view-realm	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
07ff1e02-8aad-4321-928a-234cb98c896d	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_view-users}	view-users	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
1390aee6-d13d-43b0-9514-9deda4c1a69c	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_view-clients}	view-clients	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
06f06156-87b1-4158-afe5-893101e0471f	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_view-events}	view-events	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
fe2320ce-fd6d-40d3-8d4d-5d74764f2ca2	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_view-identity-providers}	view-identity-providers	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
7a19e50e-84f0-495b-92ab-dc032fd24cfc	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_view-authorization}	view-authorization	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
54ba3ce1-912c-447f-97fe-14bc07a1faa1	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_manage-realm}	manage-realm	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
5cea39e9-fb3f-4bec-8c62-64c72b669ee8	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_manage-users}	manage-users	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
c26b316f-36da-4f8a-bc1d-63ec8d65539d	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_manage-clients}	manage-clients	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
ed421537-35d9-41d1-99d1-0e4837546632	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_manage-events}	manage-events	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
08c6a639-64bd-4826-b4ce-757e4cba5272	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_manage-identity-providers}	manage-identity-providers	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
24c60820-89f6-42b2-a2a5-c01288d4b60a	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_manage-authorization}	manage-authorization	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
d282dd2a-ced9-4d08-87f4-02a7134e65ea	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_query-users}	query-users	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
608be903-b741-4813-8c74-cf3457c51fcc	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_query-clients}	query-clients	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
61fa77e6-b00e-471e-98a1-8904b5fba82f	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_query-realms}	query-realms	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
ccd3ec4f-06f8-4206-8764-50debffba3d0	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_query-groups}	query-groups	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
e74339dc-7e58-42fe-bd11-4044eddbfb15	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_view-profile}	view-profile	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
7330cde2-fc86-4dc2-953e-9387daee37d3	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_manage-account}	manage-account	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
77c24cf0-ea71-4373-8b79-8f0a94337266	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_manage-account-links}	manage-account-links	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
74ca5497-57b4-4d36-bbf9-b743919318f7	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_view-applications}	view-applications	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
e93475fe-97f1-4472-bfc6-8a0a583cb697	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_view-consent}	view-consent	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
179c9b45-5920-47e4-a48e-ec7f12f3d756	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_manage-consent}	manage-consent	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
637bfacc-6665-44e0-afed-ca56ebd2bbef	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_view-groups}	view-groups	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
cca1f274-f729-4b4d-ac77-54e60800d57a	5a06802a-f187-458d-9d8f-6f984aa8c25c	t	${role_delete-account}	delete-account	4bd0522d-6268-48d6-85e6-d08570bd2206	5a06802a-f187-458d-9d8f-6f984aa8c25c	\N
c1973ed1-137d-4e71-b7be-ba625e63ffe3	0f609102-b1d5-4724-b3d1-d9bd6e11b963	t	${role_read-token}	read-token	4bd0522d-6268-48d6-85e6-d08570bd2206	0f609102-b1d5-4724-b3d1-d9bd6e11b963	\N
ec9cb0c9-4569-4b2b-b1f8-56c328a173aa	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	t	${role_impersonation}	impersonation	4bd0522d-6268-48d6-85e6-d08570bd2206	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	\N
bfa5baaa-38b4-4bae-aa57-a3fe267726d7	4bd0522d-6268-48d6-85e6-d08570bd2206	f	${role_offline-access}	offline_access	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	\N
a9810123-87b4-4fa5-861d-e75ec1dbb47e	4bd0522d-6268-48d6-85e6-d08570bd2206	f	${role_uma_authorization}	uma_authorization	4bd0522d-6268-48d6-85e6-d08570bd2206	\N	\N
76317afc-d012-4cb9-b876-f5da10fbd5ed	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f	${role_default-roles}	default-roles-test	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N	\N
67ec12a7-1ead-4143-aba5-2382db56185b	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_create-client}	create-client	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
39274e71-644d-43e9-bd73-2d8972323737	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_view-realm}	view-realm	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
b62c4f3e-de6f-4936-9891-12bf7981ead5	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_view-users}	view-users	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
82775b62-1825-4781-a0dd-3ef52dde9c0d	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_view-clients}	view-clients	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
553d1f8d-144c-41d5-b7b3-73c4efecf8cd	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_view-events}	view-events	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
54113351-3885-4a4e-8526-d0147c5f0eaf	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_view-identity-providers}	view-identity-providers	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
cd418284-f7c8-4323-a196-d392ffe54777	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_view-authorization}	view-authorization	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
c68a1b2f-5d9d-4966-9ce4-f4d753607927	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_manage-realm}	manage-realm	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
770c49be-a973-437e-8060-7e7a2060d777	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_manage-users}	manage-users	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
751e7651-0bde-4a42-b4b0-efe9639d16a6	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_manage-clients}	manage-clients	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
9577b2c4-0f01-4215-a963-d2769a466ba7	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_manage-events}	manage-events	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
c6cdda2f-0a61-4dec-a4ca-a40e7e33511d	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_manage-identity-providers}	manage-identity-providers	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
aaa7f7e4-0a22-40e1-935d-e60be950afbb	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_manage-authorization}	manage-authorization	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
03f24b02-cf47-4f97-900d-3de252c90c31	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_query-users}	query-users	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
8759774b-9a00-4b14-8ff1-1f2bc6702e07	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_query-clients}	query-clients	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
573d1909-69c6-4bee-a633-5ad02fb19fad	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_query-realms}	query-realms	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
9d0cb0ba-1cd8-4b1f-801b-af1e7a286f3e	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_query-groups}	query-groups	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
17920f63-c1bc-449f-acb6-9a646a69fb1c	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_realm-admin}	realm-admin	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
12bafd12-464c-40d8-829c-d41af3e8ab16	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_create-client}	create-client	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
42606fb4-52a7-4246-b75f-3866b732b825	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_view-realm}	view-realm	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
d74f759d-f556-4cdd-b8f9-8a7f507c6627	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_view-users}	view-users	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
704b5dc3-2ca1-4743-8ae7-0402ba9bf2ee	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_view-clients}	view-clients	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
f47fdc16-e972-46e5-9649-b86cc8266c54	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_view-events}	view-events	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
9e85484d-6004-4282-83dd-ec9d1ead8af6	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_view-identity-providers}	view-identity-providers	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
179b230e-ebc4-4176-a288-c2540d7dd225	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_view-authorization}	view-authorization	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
426b79b3-4ee5-44ec-a25d-9fc32754859a	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_manage-realm}	manage-realm	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
f4ac5355-7b6e-4578-beb1-0ce0285d3ad4	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_manage-users}	manage-users	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
c9823011-8251-4b4b-b6e7-17364e5b8df7	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_manage-clients}	manage-clients	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
f5355cf8-c31d-409b-9a8b-6f69538ae76e	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_manage-events}	manage-events	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
937111d9-dca9-4ec3-9984-9d023686a4bd	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_manage-identity-providers}	manage-identity-providers	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
994e89f0-fa83-4577-919a-5b5eb6225ad2	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_manage-authorization}	manage-authorization	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
deedb12e-a6f9-4cb7-a92d-213edd057f07	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_query-users}	query-users	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
ab0da9c0-c1c9-4cef-8a36-70e486e049aa	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_query-clients}	query-clients	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
1ab67b04-156d-48ac-abb1-dffc63ab02e7	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_query-realms}	query-realms	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
5294e04e-99ca-41f0-950b-dda418abb798	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_query-groups}	query-groups	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
e1730fd1-1448-453b-80b3-683485fc8284	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_view-profile}	view-profile	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
3eb82509-1201-4659-99ff-35716158aff2	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_manage-account}	manage-account	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
458d1414-23e2-4b96-82ba-3958149946a4	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_manage-account-links}	manage-account-links	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
6c23d967-bf53-4b69-80a2-65a1b00ccc64	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_view-applications}	view-applications	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
0c6f7246-342c-4a45-8bc6-a678a8cb9326	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_view-consent}	view-consent	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
b21ab298-6c7f-4947-a1c4-f579197b5c78	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_manage-consent}	manage-consent	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
c2e96a7d-4179-4405-9716-e73d61100741	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_view-groups}	view-groups	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
07a5e8de-98e6-4dde-bce1-71ee419eb8fa	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	t	${role_delete-account}	delete-account	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	b84d0731-6ce0-4574-8314-9ff0cc5ea60f	\N
bb73e9b1-ea38-43ef-9ac6-c8f3cb856b47	d7e60689-15fd-4648-80f8-03b3849edcde	t	${role_impersonation}	impersonation	4bd0522d-6268-48d6-85e6-d08570bd2206	d7e60689-15fd-4648-80f8-03b3849edcde	\N
8664201d-ffc2-4f22-8bda-8f2f9f98012e	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	t	${role_impersonation}	impersonation	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	7bc6e2cf-54a8-4180-9ebb-9a2783fa48f2	\N
130f74df-9be2-4c29-b8b6-810deba9bf60	89614203-f0b6-4e68-81a7-582665ae7363	t	${role_read-token}	read-token	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	89614203-f0b6-4e68-81a7-582665ae7363	\N
5a300429-230d-44ba-a1de-151881babe3b	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f	${role_offline-access}	offline_access	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N	\N
68ecd769-edf8-4b7e-bcd3-fc275dcba02d	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f	${role_uma_authorization}	uma_authorization	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N	\N
90857cb4-1bb5-48d2-824f-a4c3a069f6a5	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f		admin_role	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N	\N
f79e4aa8-53e9-4dae-9982-a222c3023285	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f		user_role	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	\N	\N
\.


--
-- TOC entry 4206 (class 0 OID 16917)
-- Dependencies: 246
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
p8rl4	26.0.0	1735550055
\.


--
-- TOC entry 4220 (class 0 OID 17189)
-- Dependencies: 260
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
f984bb32-db29-409a-8163-93fe6758932d	aa257a34-aba6-490f-9159-c9f3c606be16	0	1735551726	{"authMethod":"openid-connect","redirectUri":"http://localhost:8282/auth/admin/master/console/#/master/users/2220ebb6-019d-4c78-8eaa-806b276bcc82/settings","notes":{"clientId":"aa257a34-aba6-490f-9159-c9f3c606be16","iss":"http://localhost:8282/auth/realms/master","startedAt":"1735551245","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"a305e5aa-75c6-4fa9-a57a-b8d058c09823","response_mode":"query","scope":"openid","userSessionStartedAt":"1735551245","redirect_uri":"http://localhost:8282/auth/admin/master/console/#/master/users/2220ebb6-019d-4c78-8eaa-806b276bcc82/settings","state":"4716a8a2-e4e1-4a0e-aede-cc458db855e8","code_challenge":"vFXEtPZrEQtjHBLoRq-6wkN5UGuMe9YutPlU_rPfUnM"}}	local	local	7
733357bb-1982-402d-a1e3-5c02416e37e8	1072829b-c776-46c3-8e7b-678fffbfe23f	0	1735551768	{"authMethod":"openid-connect","notes":{"clientId":"1072829b-c776-46c3-8e7b-678fffbfe23f","userSessionStartedAt":"1735551768","iss":"http://localhost:8282/auth/realms/master","startedAt":"1735551768","level-of-authentication":"-1"}}	local	local	0
6ddfaff0-bdca-4124-8b56-e4ffbe64b74f	1072829b-c776-46c3-8e7b-678fffbfe23f	0	1735551776	{"authMethod":"openid-connect","notes":{"clientId":"1072829b-c776-46c3-8e7b-678fffbfe23f","userSessionStartedAt":"1735551776","iss":"http://localhost:8282/auth/realms/master","startedAt":"1735551776","level-of-authentication":"-1"}}	local	local	0
f50f442b-1ecc-47e4-90db-76a4a836e19b	1072829b-c776-46c3-8e7b-678fffbfe23f	0	1735551800	{"authMethod":"openid-connect","notes":{"clientId":"1072829b-c776-46c3-8e7b-678fffbfe23f","userSessionStartedAt":"1735551800","iss":"http://localhost:8282/auth/realms/master","startedAt":"1735551800","level-of-authentication":"-1"}}	local	local	0
\.


--
-- TOC entry 4219 (class 0 OID 17184)
-- Dependencies: 259
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
f984bb32-db29-409a-8163-93fe6758932d	2220ebb6-019d-4c78-8eaa-806b276bcc82	4bd0522d-6268-48d6-85e6-d08570bd2206	1735551245	0	{"ipAddress":"192.168.96.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4Ljk2LjEiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTMxLjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1735551245","authenticators-completed":"{\\"1066cdd5-e307-45ae-a088-ec3fab297be7\\":1735551245}"},"state":"LOGGED_IN"}	1735551726	\N	7
733357bb-1982-402d-a1e3-5c02416e37e8	2220ebb6-019d-4c78-8eaa-806b276bcc82	4bd0522d-6268-48d6-85e6-d08570bd2206	1735551768	0	{"ipAddress":"192.168.96.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4Ljk2LjEiLCJvcyI6Ik90aGVyIiwib3NWZXJzaW9uIjoiVW5rbm93biIsImJyb3dzZXIiOiJheGlvcy8xLjcuNSIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","authenticators-completed":"{\\"f3ad1b5d-732d-4a72-b3af-f7449425f052\\":1735551768,\\"6d636c12-9937-425b-acdb-95baca9a2178\\":1735551768}"},"state":"LOGGED_IN"}	1735551768	\N	0
6ddfaff0-bdca-4124-8b56-e4ffbe64b74f	2220ebb6-019d-4c78-8eaa-806b276bcc82	4bd0522d-6268-48d6-85e6-d08570bd2206	1735551776	0	{"ipAddress":"192.168.96.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4Ljk2LjEiLCJvcyI6Ik90aGVyIiwib3NWZXJzaW9uIjoiVW5rbm93biIsImJyb3dzZXIiOiJheGlvcy8xLjcuNSIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","authenticators-completed":"{\\"f3ad1b5d-732d-4a72-b3af-f7449425f052\\":1735551776,\\"6d636c12-9937-425b-acdb-95baca9a2178\\":1735551776}"},"state":"LOGGED_IN"}	1735551776	\N	0
f50f442b-1ecc-47e4-90db-76a4a836e19b	2220ebb6-019d-4c78-8eaa-806b276bcc82	4bd0522d-6268-48d6-85e6-d08570bd2206	1735551800	0	{"ipAddress":"192.168.96.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4Ljk2LjEiLCJvcyI6Ik90aGVyIiwib3NWZXJzaW9uIjoiVW5rbm93biIsImJyb3dzZXIiOiJheGlvcy8xLjcuNSIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","authenticators-completed":"{\\"f3ad1b5d-732d-4a72-b3af-f7449425f052\\":1735551800,\\"6d636c12-9937-425b-acdb-95baca9a2178\\":1735551800}"},"state":"LOGGED_IN"}	1735551800	\N	0
\.


--
-- TOC entry 4259 (class 0 OID 17969)
-- Dependencies: 299
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- TOC entry 4260 (class 0 OID 17980)
-- Dependencies: 300
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- TOC entry 4233 (class 0 OID 17403)
-- Dependencies: 273
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 4199 (class 0 OID 16791)
-- Dependencies: 239
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
595ee851-2b59-4a40-bf2c-5aa421de5c6a	audience resolve	openid-connect	oidc-audience-resolve-mapper	f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	\N
ed4d2dd2-52fd-4392-ac46-e382460bb82a	locale	openid-connect	oidc-usermodel-attribute-mapper	aa257a34-aba6-490f-9159-c9f3c606be16	\N
a18f1ab7-71a3-4821-bb2a-6f768f0dd150	role list	saml	saml-role-list-mapper	\N	14e4a69c-8db9-438a-bacf-8bc9ac9edfb9
22717aa0-a697-4f84-b911-4ef8f8b49fc9	organization	saml	saml-organization-membership-mapper	\N	9aaf8f35-d6d2-42fa-a0a2-439732a9e031
215a1e11-e1fd-43f7-8003-c9f9fa9a7483	full name	openid-connect	oidc-full-name-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
177c2bc4-6014-4d07-b029-2dfe32aa1c06	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
79bafc2e-1a27-4776-8f42-41807c7f0864	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
4a21f1c5-200e-4982-a5e3-6a19fb243a08	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
ed75cc5a-5702-484a-9b62-01c38292066d	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	username	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
7e612c7f-582a-446a-8594-c13e3b1c8207	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
0489474f-2790-4078-96d1-6779ed1f6d1a	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
4adbef89-f749-4f15-a1f1-3ed189119d27	website	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
5359102f-18c2-4684-b892-6abda86b0085	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
828129f4-985a-4133-ab74-0eba29cf9e8b	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
8899eeeb-55bf-4d28-b88e-469e774dcd03	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	37961f47-ccec-47bb-88cc-ecce9f40510f
4d52f5c1-9e9c-467a-83b4-76601fdb7348	email	openid-connect	oidc-usermodel-attribute-mapper	\N	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f
671e99d4-1798-4b25-b581-5b43106d9e50	email verified	openid-connect	oidc-usermodel-property-mapper	\N	dd3e555f-e78f-4db0-ae14-db1e9cac3e7f
e9e2d670-389a-4c12-b20b-56ee5fd97e91	address	openid-connect	oidc-address-mapper	\N	96bc02a0-ba1a-4668-a92d-cb82286537e5
5465963d-f946-47c3-a0c8-aa6f03e173ba	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	996d6706-2401-4a17-abfb-b50f340423cc
54dac630-0419-4ea4-a714-080feed4846c	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	996d6706-2401-4a17-abfb-b50f340423cc
fc877624-f244-468b-961e-30c7206db13c	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0
79383692-d4cc-4742-ac15-394f94d4037a	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0
4e078a92-c04f-4927-abfe-c5eaeeaa9744	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	46fe45bb-7428-4e26-bcd3-bbe55ceb65b0
fa759818-021b-4925-a82e-7b062b7434d3	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	33157526-d4f7-42cd-b0e1-0555576d0cb4
68988084-712d-4605-9d06-5bc26b9b8a76	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	b4756b98-01fe-4849-af2d-8d4bbd916313
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	b4756b98-01fe-4849-af2d-8d4bbd916313
28c2e0b1-cfe2-465c-b34b-49c4770293c9	acr loa level	openid-connect	oidc-acr-mapper	\N	58c25038-39f5-40a5-b55e-34c167137750
3eaefb9b-90ad-47d4-8722-88c0273efeb1	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	5a61479c-dd3b-479a-8eef-d0c61c8ad88f
0d9033ea-8bd9-4e3f-863f-bd7f85520256	sub	openid-connect	oidc-sub-mapper	\N	5a61479c-dd3b-479a-8eef-d0c61c8ad88f
cb11b0e5-037a-426d-8b55-90829aaa7fbb	organization	openid-connect	oidc-organization-membership-mapper	\N	939d2fe5-dc4a-4a43-82f6-ba7813eb57cd
cce771ef-8715-484b-9525-76b8ec18b452	audience resolve	openid-connect	oidc-audience-resolve-mapper	613045ba-3ddd-4ccf-93a6-ad8daa5154f3	\N
0c879b3f-e3ef-4e4a-a733-5c1e77a872da	role list	saml	saml-role-list-mapper	\N	5d7dd29b-fbc7-4c2f-850b-3b4b2b5861f1
f68b1f59-17d9-42e5-9b4b-4cd3bd6feb68	organization	saml	saml-organization-membership-mapper	\N	6e4d86df-bdd6-4f55-b66a-feb5bd019dc2
0586843b-4ac2-4d87-b149-906471545f10	full name	openid-connect	oidc-full-name-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
39209f53-a320-4f78-993c-93ac0f0dd567	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
c8611614-e0e1-4744-8e28-990343c9da6a	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
512b02be-ebb1-4a71-a254-41c4ee1e8728	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	username	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
f3aa8db8-3914-4b04-8ae5-478e4995ffff	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
77dbea6d-3b8c-404b-9194-befe53fcd7be	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
d40bacad-611c-4765-a82c-00d9cdbe393d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
628abb69-e476-4d57-b1b7-581bd5b1213c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
66154db9-4df5-4f1d-81a8-805fc033b7ff	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
5fabee56-a275-4930-9ab2-d4d3478bafac	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	66b2298b-c69a-4ff0-a3ef-9369cd9a86fe
7e78552f-16ec-4d2e-aa86-87d2e8262baa	email	openid-connect	oidc-usermodel-attribute-mapper	\N	d727c2f6-f728-4e33-9d84-59f8e6cae98d
c681ae07-30e8-4040-b6e5-23c0ec11022b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	d727c2f6-f728-4e33-9d84-59f8e6cae98d
3330d0c1-3e5c-4753-8226-7309c3aed1f5	address	openid-connect	oidc-address-mapper	\N	8436ba14-a51c-418d-b73e-affe6553c6d5
002b5bb9-aa41-45ed-b38d-f0447a37ecae	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	3d6f45e3-d668-4fd5-a499-ba4c7086287f
c877b300-cfcb-4b62-99c5-0005455e550f	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	3d6f45e3-d668-4fd5-a499-ba4c7086287f
249c65ed-0410-4480-bfe1-2518dd902f7e	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	a4eb39e6-4b68-4540-9504-9f81ae489acd
58788490-cb17-49b9-9775-17ebdb8553e9	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	a4eb39e6-4b68-4540-9504-9f81ae489acd
d0740786-f8b7-4975-877d-0d3a937b0a30	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	a4eb39e6-4b68-4540-9504-9f81ae489acd
13e861b3-f824-4718-9b28-a66abe26c740	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	0103f8a6-e520-4ef2-ad16-e992bdce117e
c5087e04-9e9e-45d4-82cc-9b1711b01519	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	54989d12-a93f-403f-95eb-4c447eea196b
e1355e48-fe1c-488e-860f-36f58cfd0b5d	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	54989d12-a93f-403f-95eb-4c447eea196b
3fa6c07b-5d62-43de-ae75-09032c81de7b	acr loa level	openid-connect	oidc-acr-mapper	\N	04e54e75-51bb-4668-99a2-07d84bb3954b
d3a7e1a0-df3b-45da-8396-84d63dfef304	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	2f7da4b4-c35b-4019-a419-fd4b6d0770b1
2e835e1c-1fdf-45d6-843b-fe0a8fcb009e	sub	openid-connect	oidc-sub-mapper	\N	2f7da4b4-c35b-4019-a419-fd4b6d0770b1
bbdb37c5-28ef-48de-a1a1-83a891f76959	organization	openid-connect	oidc-organization-membership-mapper	\N	355caef3-5c9c-4f6a-bd06-ef97571c08b5
7ce8216a-a863-477c-86e4-5cd5601b8971	locale	openid-connect	oidc-usermodel-attribute-mapper	34511941-fb4b-43c0-a8b8-c010452ce360	\N
\.


--
-- TOC entry 4200 (class 0 OID 16797)
-- Dependencies: 240
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
ed4d2dd2-52fd-4392-ac46-e382460bb82a	true	introspection.token.claim
ed4d2dd2-52fd-4392-ac46-e382460bb82a	true	userinfo.token.claim
ed4d2dd2-52fd-4392-ac46-e382460bb82a	locale	user.attribute
ed4d2dd2-52fd-4392-ac46-e382460bb82a	true	id.token.claim
ed4d2dd2-52fd-4392-ac46-e382460bb82a	true	access.token.claim
ed4d2dd2-52fd-4392-ac46-e382460bb82a	locale	claim.name
ed4d2dd2-52fd-4392-ac46-e382460bb82a	String	jsonType.label
a18f1ab7-71a3-4821-bb2a-6f768f0dd150	false	single
a18f1ab7-71a3-4821-bb2a-6f768f0dd150	Basic	attribute.nameformat
a18f1ab7-71a3-4821-bb2a-6f768f0dd150	Role	attribute.name
0489474f-2790-4078-96d1-6779ed1f6d1a	true	introspection.token.claim
0489474f-2790-4078-96d1-6779ed1f6d1a	true	userinfo.token.claim
0489474f-2790-4078-96d1-6779ed1f6d1a	picture	user.attribute
0489474f-2790-4078-96d1-6779ed1f6d1a	true	id.token.claim
0489474f-2790-4078-96d1-6779ed1f6d1a	true	access.token.claim
0489474f-2790-4078-96d1-6779ed1f6d1a	picture	claim.name
0489474f-2790-4078-96d1-6779ed1f6d1a	String	jsonType.label
177c2bc4-6014-4d07-b029-2dfe32aa1c06	true	introspection.token.claim
177c2bc4-6014-4d07-b029-2dfe32aa1c06	true	userinfo.token.claim
177c2bc4-6014-4d07-b029-2dfe32aa1c06	lastName	user.attribute
177c2bc4-6014-4d07-b029-2dfe32aa1c06	true	id.token.claim
177c2bc4-6014-4d07-b029-2dfe32aa1c06	true	access.token.claim
177c2bc4-6014-4d07-b029-2dfe32aa1c06	family_name	claim.name
177c2bc4-6014-4d07-b029-2dfe32aa1c06	String	jsonType.label
215a1e11-e1fd-43f7-8003-c9f9fa9a7483	true	introspection.token.claim
215a1e11-e1fd-43f7-8003-c9f9fa9a7483	true	userinfo.token.claim
215a1e11-e1fd-43f7-8003-c9f9fa9a7483	true	id.token.claim
215a1e11-e1fd-43f7-8003-c9f9fa9a7483	true	access.token.claim
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	true	introspection.token.claim
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	true	userinfo.token.claim
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	zoneinfo	user.attribute
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	true	id.token.claim
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	true	access.token.claim
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	zoneinfo	claim.name
34a7df67-62c1-4d26-94cf-3b1cd2bbefce	String	jsonType.label
4a21f1c5-200e-4982-a5e3-6a19fb243a08	true	introspection.token.claim
4a21f1c5-200e-4982-a5e3-6a19fb243a08	true	userinfo.token.claim
4a21f1c5-200e-4982-a5e3-6a19fb243a08	middleName	user.attribute
4a21f1c5-200e-4982-a5e3-6a19fb243a08	true	id.token.claim
4a21f1c5-200e-4982-a5e3-6a19fb243a08	true	access.token.claim
4a21f1c5-200e-4982-a5e3-6a19fb243a08	middle_name	claim.name
4a21f1c5-200e-4982-a5e3-6a19fb243a08	String	jsonType.label
4adbef89-f749-4f15-a1f1-3ed189119d27	true	introspection.token.claim
4adbef89-f749-4f15-a1f1-3ed189119d27	true	userinfo.token.claim
4adbef89-f749-4f15-a1f1-3ed189119d27	website	user.attribute
4adbef89-f749-4f15-a1f1-3ed189119d27	true	id.token.claim
4adbef89-f749-4f15-a1f1-3ed189119d27	true	access.token.claim
4adbef89-f749-4f15-a1f1-3ed189119d27	website	claim.name
4adbef89-f749-4f15-a1f1-3ed189119d27	String	jsonType.label
5359102f-18c2-4684-b892-6abda86b0085	true	introspection.token.claim
5359102f-18c2-4684-b892-6abda86b0085	true	userinfo.token.claim
5359102f-18c2-4684-b892-6abda86b0085	gender	user.attribute
5359102f-18c2-4684-b892-6abda86b0085	true	id.token.claim
5359102f-18c2-4684-b892-6abda86b0085	true	access.token.claim
5359102f-18c2-4684-b892-6abda86b0085	gender	claim.name
5359102f-18c2-4684-b892-6abda86b0085	String	jsonType.label
79bafc2e-1a27-4776-8f42-41807c7f0864	true	introspection.token.claim
79bafc2e-1a27-4776-8f42-41807c7f0864	true	userinfo.token.claim
79bafc2e-1a27-4776-8f42-41807c7f0864	firstName	user.attribute
79bafc2e-1a27-4776-8f42-41807c7f0864	true	id.token.claim
79bafc2e-1a27-4776-8f42-41807c7f0864	true	access.token.claim
79bafc2e-1a27-4776-8f42-41807c7f0864	given_name	claim.name
79bafc2e-1a27-4776-8f42-41807c7f0864	String	jsonType.label
7e612c7f-582a-446a-8594-c13e3b1c8207	true	introspection.token.claim
7e612c7f-582a-446a-8594-c13e3b1c8207	true	userinfo.token.claim
7e612c7f-582a-446a-8594-c13e3b1c8207	profile	user.attribute
7e612c7f-582a-446a-8594-c13e3b1c8207	true	id.token.claim
7e612c7f-582a-446a-8594-c13e3b1c8207	true	access.token.claim
7e612c7f-582a-446a-8594-c13e3b1c8207	profile	claim.name
7e612c7f-582a-446a-8594-c13e3b1c8207	String	jsonType.label
828129f4-985a-4133-ab74-0eba29cf9e8b	true	introspection.token.claim
828129f4-985a-4133-ab74-0eba29cf9e8b	true	userinfo.token.claim
828129f4-985a-4133-ab74-0eba29cf9e8b	birthdate	user.attribute
828129f4-985a-4133-ab74-0eba29cf9e8b	true	id.token.claim
828129f4-985a-4133-ab74-0eba29cf9e8b	true	access.token.claim
828129f4-985a-4133-ab74-0eba29cf9e8b	birthdate	claim.name
828129f4-985a-4133-ab74-0eba29cf9e8b	String	jsonType.label
8899eeeb-55bf-4d28-b88e-469e774dcd03	true	introspection.token.claim
8899eeeb-55bf-4d28-b88e-469e774dcd03	true	userinfo.token.claim
8899eeeb-55bf-4d28-b88e-469e774dcd03	locale	user.attribute
8899eeeb-55bf-4d28-b88e-469e774dcd03	true	id.token.claim
8899eeeb-55bf-4d28-b88e-469e774dcd03	true	access.token.claim
8899eeeb-55bf-4d28-b88e-469e774dcd03	locale	claim.name
8899eeeb-55bf-4d28-b88e-469e774dcd03	String	jsonType.label
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	true	introspection.token.claim
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	true	userinfo.token.claim
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	updatedAt	user.attribute
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	true	id.token.claim
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	true	access.token.claim
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	updated_at	claim.name
b46f359d-acf6-4240-a4ca-a9a7bd2b7ae4	long	jsonType.label
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	true	introspection.token.claim
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	true	userinfo.token.claim
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	username	user.attribute
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	true	id.token.claim
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	true	access.token.claim
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	preferred_username	claim.name
c1b18d8c-cabf-43a8-91d5-38a89ecdace3	String	jsonType.label
ed75cc5a-5702-484a-9b62-01c38292066d	true	introspection.token.claim
ed75cc5a-5702-484a-9b62-01c38292066d	true	userinfo.token.claim
ed75cc5a-5702-484a-9b62-01c38292066d	nickname	user.attribute
ed75cc5a-5702-484a-9b62-01c38292066d	true	id.token.claim
ed75cc5a-5702-484a-9b62-01c38292066d	true	access.token.claim
ed75cc5a-5702-484a-9b62-01c38292066d	nickname	claim.name
ed75cc5a-5702-484a-9b62-01c38292066d	String	jsonType.label
4d52f5c1-9e9c-467a-83b4-76601fdb7348	true	introspection.token.claim
4d52f5c1-9e9c-467a-83b4-76601fdb7348	true	userinfo.token.claim
4d52f5c1-9e9c-467a-83b4-76601fdb7348	email	user.attribute
4d52f5c1-9e9c-467a-83b4-76601fdb7348	true	id.token.claim
4d52f5c1-9e9c-467a-83b4-76601fdb7348	true	access.token.claim
4d52f5c1-9e9c-467a-83b4-76601fdb7348	email	claim.name
4d52f5c1-9e9c-467a-83b4-76601fdb7348	String	jsonType.label
671e99d4-1798-4b25-b581-5b43106d9e50	true	introspection.token.claim
671e99d4-1798-4b25-b581-5b43106d9e50	true	userinfo.token.claim
671e99d4-1798-4b25-b581-5b43106d9e50	emailVerified	user.attribute
671e99d4-1798-4b25-b581-5b43106d9e50	true	id.token.claim
671e99d4-1798-4b25-b581-5b43106d9e50	true	access.token.claim
671e99d4-1798-4b25-b581-5b43106d9e50	email_verified	claim.name
671e99d4-1798-4b25-b581-5b43106d9e50	boolean	jsonType.label
e9e2d670-389a-4c12-b20b-56ee5fd97e91	formatted	user.attribute.formatted
e9e2d670-389a-4c12-b20b-56ee5fd97e91	country	user.attribute.country
e9e2d670-389a-4c12-b20b-56ee5fd97e91	true	introspection.token.claim
e9e2d670-389a-4c12-b20b-56ee5fd97e91	postal_code	user.attribute.postal_code
e9e2d670-389a-4c12-b20b-56ee5fd97e91	true	userinfo.token.claim
e9e2d670-389a-4c12-b20b-56ee5fd97e91	street	user.attribute.street
e9e2d670-389a-4c12-b20b-56ee5fd97e91	true	id.token.claim
e9e2d670-389a-4c12-b20b-56ee5fd97e91	region	user.attribute.region
e9e2d670-389a-4c12-b20b-56ee5fd97e91	true	access.token.claim
e9e2d670-389a-4c12-b20b-56ee5fd97e91	locality	user.attribute.locality
5465963d-f946-47c3-a0c8-aa6f03e173ba	true	introspection.token.claim
5465963d-f946-47c3-a0c8-aa6f03e173ba	true	userinfo.token.claim
5465963d-f946-47c3-a0c8-aa6f03e173ba	phoneNumber	user.attribute
5465963d-f946-47c3-a0c8-aa6f03e173ba	true	id.token.claim
5465963d-f946-47c3-a0c8-aa6f03e173ba	true	access.token.claim
5465963d-f946-47c3-a0c8-aa6f03e173ba	phone_number	claim.name
5465963d-f946-47c3-a0c8-aa6f03e173ba	String	jsonType.label
54dac630-0419-4ea4-a714-080feed4846c	true	introspection.token.claim
54dac630-0419-4ea4-a714-080feed4846c	true	userinfo.token.claim
54dac630-0419-4ea4-a714-080feed4846c	phoneNumberVerified	user.attribute
54dac630-0419-4ea4-a714-080feed4846c	true	id.token.claim
54dac630-0419-4ea4-a714-080feed4846c	true	access.token.claim
54dac630-0419-4ea4-a714-080feed4846c	phone_number_verified	claim.name
54dac630-0419-4ea4-a714-080feed4846c	boolean	jsonType.label
4e078a92-c04f-4927-abfe-c5eaeeaa9744	true	introspection.token.claim
4e078a92-c04f-4927-abfe-c5eaeeaa9744	true	access.token.claim
79383692-d4cc-4742-ac15-394f94d4037a	true	introspection.token.claim
79383692-d4cc-4742-ac15-394f94d4037a	true	multivalued
79383692-d4cc-4742-ac15-394f94d4037a	foo	user.attribute
79383692-d4cc-4742-ac15-394f94d4037a	true	access.token.claim
79383692-d4cc-4742-ac15-394f94d4037a	resource_access.${client_id}.roles	claim.name
79383692-d4cc-4742-ac15-394f94d4037a	String	jsonType.label
fc877624-f244-468b-961e-30c7206db13c	true	introspection.token.claim
fc877624-f244-468b-961e-30c7206db13c	true	multivalued
fc877624-f244-468b-961e-30c7206db13c	foo	user.attribute
fc877624-f244-468b-961e-30c7206db13c	true	access.token.claim
fc877624-f244-468b-961e-30c7206db13c	realm_access.roles	claim.name
fc877624-f244-468b-961e-30c7206db13c	String	jsonType.label
fa759818-021b-4925-a82e-7b062b7434d3	true	introspection.token.claim
fa759818-021b-4925-a82e-7b062b7434d3	true	access.token.claim
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	true	introspection.token.claim
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	true	multivalued
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	foo	user.attribute
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	true	id.token.claim
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	true	access.token.claim
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	groups	claim.name
42805ec8-bd89-4bd0-aa5a-7f3adcfb3600	String	jsonType.label
68988084-712d-4605-9d06-5bc26b9b8a76	true	introspection.token.claim
68988084-712d-4605-9d06-5bc26b9b8a76	true	userinfo.token.claim
68988084-712d-4605-9d06-5bc26b9b8a76	username	user.attribute
68988084-712d-4605-9d06-5bc26b9b8a76	true	id.token.claim
68988084-712d-4605-9d06-5bc26b9b8a76	true	access.token.claim
68988084-712d-4605-9d06-5bc26b9b8a76	upn	claim.name
68988084-712d-4605-9d06-5bc26b9b8a76	String	jsonType.label
28c2e0b1-cfe2-465c-b34b-49c4770293c9	true	introspection.token.claim
28c2e0b1-cfe2-465c-b34b-49c4770293c9	true	id.token.claim
28c2e0b1-cfe2-465c-b34b-49c4770293c9	true	access.token.claim
0d9033ea-8bd9-4e3f-863f-bd7f85520256	true	introspection.token.claim
0d9033ea-8bd9-4e3f-863f-bd7f85520256	true	access.token.claim
3eaefb9b-90ad-47d4-8722-88c0273efeb1	AUTH_TIME	user.session.note
3eaefb9b-90ad-47d4-8722-88c0273efeb1	true	introspection.token.claim
3eaefb9b-90ad-47d4-8722-88c0273efeb1	true	id.token.claim
3eaefb9b-90ad-47d4-8722-88c0273efeb1	true	access.token.claim
3eaefb9b-90ad-47d4-8722-88c0273efeb1	auth_time	claim.name
3eaefb9b-90ad-47d4-8722-88c0273efeb1	long	jsonType.label
cb11b0e5-037a-426d-8b55-90829aaa7fbb	true	introspection.token.claim
cb11b0e5-037a-426d-8b55-90829aaa7fbb	true	multivalued
cb11b0e5-037a-426d-8b55-90829aaa7fbb	true	id.token.claim
cb11b0e5-037a-426d-8b55-90829aaa7fbb	true	access.token.claim
cb11b0e5-037a-426d-8b55-90829aaa7fbb	organization	claim.name
cb11b0e5-037a-426d-8b55-90829aaa7fbb	String	jsonType.label
0c879b3f-e3ef-4e4a-a733-5c1e77a872da	false	single
0c879b3f-e3ef-4e4a-a733-5c1e77a872da	Basic	attribute.nameformat
0c879b3f-e3ef-4e4a-a733-5c1e77a872da	Role	attribute.name
0586843b-4ac2-4d87-b149-906471545f10	true	introspection.token.claim
0586843b-4ac2-4d87-b149-906471545f10	true	userinfo.token.claim
0586843b-4ac2-4d87-b149-906471545f10	true	id.token.claim
0586843b-4ac2-4d87-b149-906471545f10	true	access.token.claim
39209f53-a320-4f78-993c-93ac0f0dd567	true	introspection.token.claim
39209f53-a320-4f78-993c-93ac0f0dd567	true	userinfo.token.claim
39209f53-a320-4f78-993c-93ac0f0dd567	lastName	user.attribute
39209f53-a320-4f78-993c-93ac0f0dd567	true	id.token.claim
39209f53-a320-4f78-993c-93ac0f0dd567	true	access.token.claim
39209f53-a320-4f78-993c-93ac0f0dd567	family_name	claim.name
39209f53-a320-4f78-993c-93ac0f0dd567	String	jsonType.label
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	true	introspection.token.claim
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	true	userinfo.token.claim
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	username	user.attribute
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	true	id.token.claim
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	true	access.token.claim
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	preferred_username	claim.name
3ff23ea3-2cb2-46b0-a197-f65d865b3e9c	String	jsonType.label
512b02be-ebb1-4a71-a254-41c4ee1e8728	true	introspection.token.claim
512b02be-ebb1-4a71-a254-41c4ee1e8728	true	userinfo.token.claim
512b02be-ebb1-4a71-a254-41c4ee1e8728	nickname	user.attribute
512b02be-ebb1-4a71-a254-41c4ee1e8728	true	id.token.claim
512b02be-ebb1-4a71-a254-41c4ee1e8728	true	access.token.claim
512b02be-ebb1-4a71-a254-41c4ee1e8728	nickname	claim.name
512b02be-ebb1-4a71-a254-41c4ee1e8728	String	jsonType.label
5fabee56-a275-4930-9ab2-d4d3478bafac	true	introspection.token.claim
5fabee56-a275-4930-9ab2-d4d3478bafac	true	userinfo.token.claim
5fabee56-a275-4930-9ab2-d4d3478bafac	updatedAt	user.attribute
5fabee56-a275-4930-9ab2-d4d3478bafac	true	id.token.claim
5fabee56-a275-4930-9ab2-d4d3478bafac	true	access.token.claim
5fabee56-a275-4930-9ab2-d4d3478bafac	updated_at	claim.name
5fabee56-a275-4930-9ab2-d4d3478bafac	long	jsonType.label
628abb69-e476-4d57-b1b7-581bd5b1213c	true	introspection.token.claim
628abb69-e476-4d57-b1b7-581bd5b1213c	true	userinfo.token.claim
628abb69-e476-4d57-b1b7-581bd5b1213c	birthdate	user.attribute
628abb69-e476-4d57-b1b7-581bd5b1213c	true	id.token.claim
628abb69-e476-4d57-b1b7-581bd5b1213c	true	access.token.claim
628abb69-e476-4d57-b1b7-581bd5b1213c	birthdate	claim.name
628abb69-e476-4d57-b1b7-581bd5b1213c	String	jsonType.label
66154db9-4df5-4f1d-81a8-805fc033b7ff	true	introspection.token.claim
66154db9-4df5-4f1d-81a8-805fc033b7ff	true	userinfo.token.claim
66154db9-4df5-4f1d-81a8-805fc033b7ff	zoneinfo	user.attribute
66154db9-4df5-4f1d-81a8-805fc033b7ff	true	id.token.claim
66154db9-4df5-4f1d-81a8-805fc033b7ff	true	access.token.claim
66154db9-4df5-4f1d-81a8-805fc033b7ff	zoneinfo	claim.name
66154db9-4df5-4f1d-81a8-805fc033b7ff	String	jsonType.label
77dbea6d-3b8c-404b-9194-befe53fcd7be	true	introspection.token.claim
77dbea6d-3b8c-404b-9194-befe53fcd7be	true	userinfo.token.claim
77dbea6d-3b8c-404b-9194-befe53fcd7be	picture	user.attribute
77dbea6d-3b8c-404b-9194-befe53fcd7be	true	id.token.claim
77dbea6d-3b8c-404b-9194-befe53fcd7be	true	access.token.claim
77dbea6d-3b8c-404b-9194-befe53fcd7be	picture	claim.name
77dbea6d-3b8c-404b-9194-befe53fcd7be	String	jsonType.label
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	true	introspection.token.claim
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	true	userinfo.token.claim
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	locale	user.attribute
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	true	id.token.claim
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	true	access.token.claim
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	locale	claim.name
b0aa35d4-db84-4fcd-a2e2-02067cfe0c3b	String	jsonType.label
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	true	introspection.token.claim
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	true	userinfo.token.claim
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	middleName	user.attribute
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	true	id.token.claim
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	true	access.token.claim
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	middle_name	claim.name
bdcdfd17-5585-4a57-ae3d-6a41c7f95484	String	jsonType.label
c8611614-e0e1-4744-8e28-990343c9da6a	true	introspection.token.claim
c8611614-e0e1-4744-8e28-990343c9da6a	true	userinfo.token.claim
c8611614-e0e1-4744-8e28-990343c9da6a	firstName	user.attribute
c8611614-e0e1-4744-8e28-990343c9da6a	true	id.token.claim
c8611614-e0e1-4744-8e28-990343c9da6a	true	access.token.claim
c8611614-e0e1-4744-8e28-990343c9da6a	given_name	claim.name
c8611614-e0e1-4744-8e28-990343c9da6a	String	jsonType.label
d40bacad-611c-4765-a82c-00d9cdbe393d	true	introspection.token.claim
d40bacad-611c-4765-a82c-00d9cdbe393d	true	userinfo.token.claim
d40bacad-611c-4765-a82c-00d9cdbe393d	website	user.attribute
d40bacad-611c-4765-a82c-00d9cdbe393d	true	id.token.claim
d40bacad-611c-4765-a82c-00d9cdbe393d	true	access.token.claim
d40bacad-611c-4765-a82c-00d9cdbe393d	website	claim.name
d40bacad-611c-4765-a82c-00d9cdbe393d	String	jsonType.label
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	true	introspection.token.claim
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	true	userinfo.token.claim
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	gender	user.attribute
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	true	id.token.claim
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	true	access.token.claim
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	gender	claim.name
f38c9b11-7673-4c47-b0a2-59cfc9a8a7f0	String	jsonType.label
f3aa8db8-3914-4b04-8ae5-478e4995ffff	true	introspection.token.claim
f3aa8db8-3914-4b04-8ae5-478e4995ffff	true	userinfo.token.claim
f3aa8db8-3914-4b04-8ae5-478e4995ffff	profile	user.attribute
f3aa8db8-3914-4b04-8ae5-478e4995ffff	true	id.token.claim
f3aa8db8-3914-4b04-8ae5-478e4995ffff	true	access.token.claim
f3aa8db8-3914-4b04-8ae5-478e4995ffff	profile	claim.name
f3aa8db8-3914-4b04-8ae5-478e4995ffff	String	jsonType.label
7e78552f-16ec-4d2e-aa86-87d2e8262baa	true	introspection.token.claim
7e78552f-16ec-4d2e-aa86-87d2e8262baa	true	userinfo.token.claim
7e78552f-16ec-4d2e-aa86-87d2e8262baa	email	user.attribute
7e78552f-16ec-4d2e-aa86-87d2e8262baa	true	id.token.claim
7e78552f-16ec-4d2e-aa86-87d2e8262baa	true	access.token.claim
7e78552f-16ec-4d2e-aa86-87d2e8262baa	email	claim.name
7e78552f-16ec-4d2e-aa86-87d2e8262baa	String	jsonType.label
c681ae07-30e8-4040-b6e5-23c0ec11022b	true	introspection.token.claim
c681ae07-30e8-4040-b6e5-23c0ec11022b	true	userinfo.token.claim
c681ae07-30e8-4040-b6e5-23c0ec11022b	emailVerified	user.attribute
c681ae07-30e8-4040-b6e5-23c0ec11022b	true	id.token.claim
c681ae07-30e8-4040-b6e5-23c0ec11022b	true	access.token.claim
c681ae07-30e8-4040-b6e5-23c0ec11022b	email_verified	claim.name
c681ae07-30e8-4040-b6e5-23c0ec11022b	boolean	jsonType.label
3330d0c1-3e5c-4753-8226-7309c3aed1f5	formatted	user.attribute.formatted
3330d0c1-3e5c-4753-8226-7309c3aed1f5	country	user.attribute.country
3330d0c1-3e5c-4753-8226-7309c3aed1f5	true	introspection.token.claim
3330d0c1-3e5c-4753-8226-7309c3aed1f5	postal_code	user.attribute.postal_code
3330d0c1-3e5c-4753-8226-7309c3aed1f5	true	userinfo.token.claim
3330d0c1-3e5c-4753-8226-7309c3aed1f5	street	user.attribute.street
3330d0c1-3e5c-4753-8226-7309c3aed1f5	true	id.token.claim
3330d0c1-3e5c-4753-8226-7309c3aed1f5	region	user.attribute.region
3330d0c1-3e5c-4753-8226-7309c3aed1f5	true	access.token.claim
3330d0c1-3e5c-4753-8226-7309c3aed1f5	locality	user.attribute.locality
002b5bb9-aa41-45ed-b38d-f0447a37ecae	true	introspection.token.claim
002b5bb9-aa41-45ed-b38d-f0447a37ecae	true	userinfo.token.claim
002b5bb9-aa41-45ed-b38d-f0447a37ecae	phoneNumber	user.attribute
002b5bb9-aa41-45ed-b38d-f0447a37ecae	true	id.token.claim
002b5bb9-aa41-45ed-b38d-f0447a37ecae	true	access.token.claim
002b5bb9-aa41-45ed-b38d-f0447a37ecae	phone_number	claim.name
002b5bb9-aa41-45ed-b38d-f0447a37ecae	String	jsonType.label
c877b300-cfcb-4b62-99c5-0005455e550f	true	introspection.token.claim
c877b300-cfcb-4b62-99c5-0005455e550f	true	userinfo.token.claim
c877b300-cfcb-4b62-99c5-0005455e550f	phoneNumberVerified	user.attribute
c877b300-cfcb-4b62-99c5-0005455e550f	true	id.token.claim
c877b300-cfcb-4b62-99c5-0005455e550f	true	access.token.claim
c877b300-cfcb-4b62-99c5-0005455e550f	phone_number_verified	claim.name
c877b300-cfcb-4b62-99c5-0005455e550f	boolean	jsonType.label
249c65ed-0410-4480-bfe1-2518dd902f7e	true	introspection.token.claim
249c65ed-0410-4480-bfe1-2518dd902f7e	true	multivalued
249c65ed-0410-4480-bfe1-2518dd902f7e	foo	user.attribute
249c65ed-0410-4480-bfe1-2518dd902f7e	true	access.token.claim
249c65ed-0410-4480-bfe1-2518dd902f7e	realm_access.roles	claim.name
249c65ed-0410-4480-bfe1-2518dd902f7e	String	jsonType.label
58788490-cb17-49b9-9775-17ebdb8553e9	true	introspection.token.claim
58788490-cb17-49b9-9775-17ebdb8553e9	true	multivalued
58788490-cb17-49b9-9775-17ebdb8553e9	foo	user.attribute
58788490-cb17-49b9-9775-17ebdb8553e9	true	access.token.claim
58788490-cb17-49b9-9775-17ebdb8553e9	resource_access.${client_id}.roles	claim.name
58788490-cb17-49b9-9775-17ebdb8553e9	String	jsonType.label
d0740786-f8b7-4975-877d-0d3a937b0a30	true	introspection.token.claim
d0740786-f8b7-4975-877d-0d3a937b0a30	true	access.token.claim
13e861b3-f824-4718-9b28-a66abe26c740	true	introspection.token.claim
13e861b3-f824-4718-9b28-a66abe26c740	true	access.token.claim
c5087e04-9e9e-45d4-82cc-9b1711b01519	true	introspection.token.claim
c5087e04-9e9e-45d4-82cc-9b1711b01519	true	userinfo.token.claim
c5087e04-9e9e-45d4-82cc-9b1711b01519	username	user.attribute
c5087e04-9e9e-45d4-82cc-9b1711b01519	true	id.token.claim
c5087e04-9e9e-45d4-82cc-9b1711b01519	true	access.token.claim
c5087e04-9e9e-45d4-82cc-9b1711b01519	upn	claim.name
c5087e04-9e9e-45d4-82cc-9b1711b01519	String	jsonType.label
e1355e48-fe1c-488e-860f-36f58cfd0b5d	true	introspection.token.claim
e1355e48-fe1c-488e-860f-36f58cfd0b5d	true	multivalued
e1355e48-fe1c-488e-860f-36f58cfd0b5d	foo	user.attribute
e1355e48-fe1c-488e-860f-36f58cfd0b5d	true	id.token.claim
e1355e48-fe1c-488e-860f-36f58cfd0b5d	true	access.token.claim
e1355e48-fe1c-488e-860f-36f58cfd0b5d	groups	claim.name
e1355e48-fe1c-488e-860f-36f58cfd0b5d	String	jsonType.label
3fa6c07b-5d62-43de-ae75-09032c81de7b	true	introspection.token.claim
3fa6c07b-5d62-43de-ae75-09032c81de7b	true	id.token.claim
3fa6c07b-5d62-43de-ae75-09032c81de7b	true	access.token.claim
2e835e1c-1fdf-45d6-843b-fe0a8fcb009e	true	introspection.token.claim
2e835e1c-1fdf-45d6-843b-fe0a8fcb009e	true	access.token.claim
d3a7e1a0-df3b-45da-8396-84d63dfef304	AUTH_TIME	user.session.note
d3a7e1a0-df3b-45da-8396-84d63dfef304	true	introspection.token.claim
d3a7e1a0-df3b-45da-8396-84d63dfef304	true	id.token.claim
d3a7e1a0-df3b-45da-8396-84d63dfef304	true	access.token.claim
d3a7e1a0-df3b-45da-8396-84d63dfef304	auth_time	claim.name
d3a7e1a0-df3b-45da-8396-84d63dfef304	long	jsonType.label
bbdb37c5-28ef-48de-a1a1-83a891f76959	true	introspection.token.claim
bbdb37c5-28ef-48de-a1a1-83a891f76959	true	multivalued
bbdb37c5-28ef-48de-a1a1-83a891f76959	true	id.token.claim
bbdb37c5-28ef-48de-a1a1-83a891f76959	true	access.token.claim
bbdb37c5-28ef-48de-a1a1-83a891f76959	organization	claim.name
bbdb37c5-28ef-48de-a1a1-83a891f76959	String	jsonType.label
7ce8216a-a863-477c-86e4-5cd5601b8971	true	introspection.token.claim
7ce8216a-a863-477c-86e4-5cd5601b8971	true	userinfo.token.claim
7ce8216a-a863-477c-86e4-5cd5601b8971	locale	user.attribute
7ce8216a-a863-477c-86e4-5cd5601b8971	true	id.token.claim
7ce8216a-a863-477c-86e4-5cd5601b8971	true	access.token.claim
7ce8216a-a863-477c-86e4-5cd5601b8971	locale	claim.name
7ce8216a-a863-477c-86e4-5cd5601b8971	String	jsonType.label
\.


--
-- TOC entry 4182 (class 0 OID 16439)
-- Dependencies: 222
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
4bd0522d-6268-48d6-85e6-d08570bd2206	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	92f24f28-49dd-4e1e-bdf3-b09b3fafc1be	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	6547bbde-d926-42e5-afed-e7f3704d52e8	5810424b-ec1e-48dd-85de-205c168795fb	faa666c8-e14d-4dac-be65-6369c1c4c9e8	6eb4fb52-1b5f-41bc-b05d-575cb8c3f176	8a5dad25-b49c-4492-9581-5fb868285313	2592000	f	900	t	f	1065bc41-1617-4ade-967c-f24124ced9ce	0	f	0	0	b396a245-b076-4b42-8d22-5718a2b9efcb
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	60	300	300	\N	\N	\N	t	f	0	\N	test	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	d7e60689-15fd-4648-80f8-03b3849edcde	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e6957db3-7961-4768-b492-b8ace98b6baf	a8857646-4972-40dd-afe2-325739f690ce	a9802acc-42db-43c2-8859-115241bf898d	b0c75072-43b4-4858-a83c-b6ef68b8e37e	48f0279d-6cdc-484f-9a62-c003cee0fe48	2592000	f	900	t	f	6b39aac6-c24b-48ae-8010-d47dc35df05a	0	f	0	0	76317afc-d012-4cb9-b876-f5da10fbd5ed
\.


--
-- TOC entry 4183 (class 0 OID 16456)
-- Dependencies: 223
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	4bd0522d-6268-48d6-85e6-d08570bd2206	
_browser_header.xContentTypeOptions	4bd0522d-6268-48d6-85e6-d08570bd2206	nosniff
_browser_header.referrerPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	no-referrer
_browser_header.xRobotsTag	4bd0522d-6268-48d6-85e6-d08570bd2206	none
_browser_header.xFrameOptions	4bd0522d-6268-48d6-85e6-d08570bd2206	SAMEORIGIN
_browser_header.contentSecurityPolicy	4bd0522d-6268-48d6-85e6-d08570bd2206	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	4bd0522d-6268-48d6-85e6-d08570bd2206	1; mode=block
_browser_header.strictTransportSecurity	4bd0522d-6268-48d6-85e6-d08570bd2206	max-age=31536000; includeSubDomains
bruteForceProtected	4bd0522d-6268-48d6-85e6-d08570bd2206	false
permanentLockout	4bd0522d-6268-48d6-85e6-d08570bd2206	false
maxTemporaryLockouts	4bd0522d-6268-48d6-85e6-d08570bd2206	0
maxFailureWaitSeconds	4bd0522d-6268-48d6-85e6-d08570bd2206	900
minimumQuickLoginWaitSeconds	4bd0522d-6268-48d6-85e6-d08570bd2206	60
waitIncrementSeconds	4bd0522d-6268-48d6-85e6-d08570bd2206	60
quickLoginCheckMilliSeconds	4bd0522d-6268-48d6-85e6-d08570bd2206	1000
maxDeltaTimeSeconds	4bd0522d-6268-48d6-85e6-d08570bd2206	43200
failureFactor	4bd0522d-6268-48d6-85e6-d08570bd2206	30
realmReusableOtpCode	4bd0522d-6268-48d6-85e6-d08570bd2206	false
firstBrokerLoginFlowId	4bd0522d-6268-48d6-85e6-d08570bd2206	c7fc0c90-9231-48f7-9785-8592216baebb
displayName	4bd0522d-6268-48d6-85e6-d08570bd2206	Keycloak
displayNameHtml	4bd0522d-6268-48d6-85e6-d08570bd2206	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	4bd0522d-6268-48d6-85e6-d08570bd2206	RS256
offlineSessionMaxLifespanEnabled	4bd0522d-6268-48d6-85e6-d08570bd2206	false
offlineSessionMaxLifespan	4bd0522d-6268-48d6-85e6-d08570bd2206	5184000
bruteForceProtected	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
permanentLockout	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
maxTemporaryLockouts	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
maxFailureWaitSeconds	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	900
minimumQuickLoginWaitSeconds	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	60
waitIncrementSeconds	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	60
quickLoginCheckMilliSeconds	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	1000
maxDeltaTimeSeconds	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	43200
failureFactor	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	30
realmReusableOtpCode	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
defaultSignatureAlgorithm	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	RS256
offlineSessionMaxLifespanEnabled	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
offlineSessionMaxLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	5184000
actionTokenGeneratedByAdminLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	43200
actionTokenGeneratedByUserLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	300
oauth2DeviceCodeLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	600
oauth2DevicePollingInterval	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	5
webAuthnPolicyRpEntityName	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	keycloak
webAuthnPolicySignatureAlgorithms	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	ES256,RS256
webAuthnPolicyRpId	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	
webAuthnPolicyAttestationConveyancePreference	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyAuthenticatorAttachment	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyRequireResidentKey	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyUserVerificationRequirement	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyCreateTimeout	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
webAuthnPolicyAvoidSameAuthenticatorRegister	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
webAuthnPolicyRpEntityNamePasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	ES256,RS256
webAuthnPolicyRpIdPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	
webAuthnPolicyAttestationConveyancePreferencePasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyRequireResidentKeyPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	not specified
webAuthnPolicyCreateTimeoutPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
cibaBackchannelTokenDeliveryMode	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	poll
cibaExpiresIn	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	120
cibaInterval	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	5
cibaAuthRequestedUserHint	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	login_hint
parRequestUriLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	60
firstBrokerLoginFlowId	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	c15f0e0b-aaf2-4303-bb0d-caece79de2c1
frontendUrl	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	
acr.loa.map	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	{}
displayName	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	
displayNameHtml	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	
organizationsEnabled	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	false
clientSessionIdleTimeout	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
clientSessionMaxLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
clientOfflineSessionIdleTimeout	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
clientOfflineSessionMaxLifespan	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	0
client-policies.profiles	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	{"profiles":[]}
client-policies.policies	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	
_browser_header.xContentTypeOptions	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	nosniff
_browser_header.referrerPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	no-referrer
_browser_header.xRobotsTag	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	none
_browser_header.xFrameOptions	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	SAMEORIGIN
_browser_header.contentSecurityPolicy	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	1; mode=block
_browser_header.strictTransportSecurity	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	max-age=31536000; includeSubDomains
\.


--
-- TOC entry 4225 (class 0 OID 17213)
-- Dependencies: 265
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 16909)
-- Dependencies: 245
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 16464)
-- Dependencies: 224
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
4bd0522d-6268-48d6-85e6-d08570bd2206	jboss-logging
e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	jboss-logging
\.


--
-- TOC entry 4258 (class 0 OID 17915)
-- Dependencies: 298
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 4185 (class 0 OID 16467)
-- Dependencies: 225
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	4bd0522d-6268-48d6-85e6-d08570bd2206
password	password	t	t	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d
\.


--
-- TOC entry 4186 (class 0 OID 16474)
-- Dependencies: 226
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 4204 (class 0 OID 16825)
-- Dependencies: 244
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4187 (class 0 OID 16484)
-- Dependencies: 227
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
5a06802a-f187-458d-9d8f-6f984aa8c25c	/realms/master/account/*
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	/realms/master/account/*
aa257a34-aba6-490f-9159-c9f3c606be16	/admin/master/console/*
b84d0731-6ce0-4574-8314-9ff0cc5ea60f	/realms/test/account/*
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	/realms/test/account/*
34511941-fb4b-43c0-a8b8-c010452ce360	/admin/test/console/*
\.


--
-- TOC entry 4218 (class 0 OID 17148)
-- Dependencies: 258
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 4217 (class 0 OID 17141)
-- Dependencies: 257
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
38d01fda-3f69-460a-b60a-f142ebc67abb	VERIFY_EMAIL	Verify Email	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	VERIFY_EMAIL	50
1024c548-467b-4050-9fbd-6fdfd42856f9	UPDATE_PROFILE	Update Profile	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	UPDATE_PROFILE	40
8e4c264a-524e-49f6-90eb-76dd80e911bd	CONFIGURE_TOTP	Configure OTP	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	CONFIGURE_TOTP	10
2d5b1c14-6b10-4334-bf6d-3905db052412	UPDATE_PASSWORD	Update Password	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	UPDATE_PASSWORD	30
7671d3e7-293b-4fd2-9a40-516afecbb814	TERMS_AND_CONDITIONS	Terms and Conditions	4bd0522d-6268-48d6-85e6-d08570bd2206	f	f	TERMS_AND_CONDITIONS	20
b0acf515-82e8-4e30-a2f7-fae4621bdcea	delete_account	Delete Account	4bd0522d-6268-48d6-85e6-d08570bd2206	f	f	delete_account	60
02a71ad1-90d6-4602-bb47-dc9d9c32989b	delete_credential	Delete Credential	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	delete_credential	100
98399f7e-02fa-4635-a6b4-ec33f68cbd2b	update_user_locale	Update User Locale	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	update_user_locale	1000
43237c4e-252f-4965-8de7-b26b5823d4fa	webauthn-register	Webauthn Register	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	webauthn-register	70
7abec85a-0d25-479f-8003-7197f6319966	webauthn-register-passwordless	Webauthn Register Passwordless	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	webauthn-register-passwordless	80
ca4caaae-0f01-4507-afea-6e149d98c5ee	VERIFY_PROFILE	Verify Profile	4bd0522d-6268-48d6-85e6-d08570bd2206	t	f	VERIFY_PROFILE	90
2d92b09f-e2c7-4da3-83b3-cc93498e60f5	VERIFY_EMAIL	Verify Email	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	VERIFY_EMAIL	50
c7facac3-c91f-4880-9e2d-19fd2af6dced	UPDATE_PROFILE	Update Profile	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	UPDATE_PROFILE	40
ecb67a43-43a4-4de4-af57-c68fb9960915	CONFIGURE_TOTP	Configure OTP	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	CONFIGURE_TOTP	10
cbf4bada-6b0d-4622-a3c7-6e20be860f4e	UPDATE_PASSWORD	Update Password	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	UPDATE_PASSWORD	30
c998aa1b-3b1c-499a-b9a7-6da8a4fd815f	TERMS_AND_CONDITIONS	Terms and Conditions	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f	f	TERMS_AND_CONDITIONS	20
eb7ebb8f-bd0b-4cf4-89c1-3e2efc6766b3	delete_account	Delete Account	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	f	f	delete_account	60
84919d2c-0e0f-45e3-9f28-1e135c383368	delete_credential	Delete Credential	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	delete_credential	100
6028292e-7424-4a82-9127-282135d5bb98	update_user_locale	Update User Locale	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	update_user_locale	1000
104da66f-8674-4999-a575-3b1ecf809707	webauthn-register	Webauthn Register	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	webauthn-register	70
a08750fd-67e7-421c-937b-c57a86da8c89	webauthn-register-passwordless	Webauthn Register Passwordless	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	webauthn-register-passwordless	80
487979ab-3263-40d0-875f-988a8835d9cb	VERIFY_PROFILE	Verify Profile	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	t	f	VERIFY_PROFILE	90
\.


--
-- TOC entry 4255 (class 0 OID 17846)
-- Dependencies: 295
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 4235 (class 0 OID 17430)
-- Dependencies: 275
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4234 (class 0 OID 17415)
-- Dependencies: 274
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4229 (class 0 OID 17353)
-- Dependencies: 269
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- TOC entry 4254 (class 0 OID 17822)
-- Dependencies: 294
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4232 (class 0 OID 17389)
-- Dependencies: 272
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 4230 (class 0 OID 17361)
-- Dependencies: 270
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 4231 (class 0 OID 17375)
-- Dependencies: 271
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 4256 (class 0 OID 17864)
-- Dependencies: 296
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 4261 (class 0 OID 17997)
-- Dependencies: 301
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- TOC entry 4257 (class 0 OID 17874)
-- Dependencies: 297
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 16487)
-- Dependencies: 228
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	7330cde2-fc86-4dc2-953e-9387daee37d3
f94016cd-a3c1-4c18-bf6a-4fbe566dafc1	637bfacc-6665-44e0-afed-ca56ebd2bbef
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	c2e96a7d-4179-4405-9716-e73d61100741
613045ba-3ddd-4ccf-93a6-ad8daa5154f3	3eb82509-1201-4659-99ff-35716158aff2
\.


--
-- TOC entry 4236 (class 0 OID 17445)
-- Dependencies: 276
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 16493)
-- Dependencies: 230
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
my_attribute	admin,client	5dcec00d-f35e-47f0-a6c2-b4a57c4e3fd6	55750f2d-8c58-4e1e-aef5-d3e1ccce470d	\N	\N	\N
my_attribute	admin,client	47beb319-b8d7-4093-989e-1cb8b84dfa14	7d4ec2d1-6039-4bc6-b3d6-cec81b027a54	\N	\N	\N
my_attribute	client	88965489-4cb0-4286-a596-17b451593ac0	18489b97-ccc2-420d-81eb-daadedd43e1f	\N	\N	\N
my_attribute	client	0e59f477-e59f-40e3-80db-941c57d371ed	fe0a2233-ca7f-4cf6-9c2e-d84f2b8b2fd1	\N	\N	\N
\.


--
-- TOC entry 4209 (class 0 OID 16930)
-- Dependencies: 249
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4252 (class 0 OID 17797)
-- Dependencies: 292
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4191 (class 0 OID 16498)
-- Dependencies: 231
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
2220ebb6-019d-4c78-8eaa-806b276bcc82	\N	f3964809-96f8-456d-bc6f-472d9430aa2f	t	t	\N	\N	\N	4bd0522d-6268-48d6-85e6-d08570bd2206	admin	1735550155172	\N	0
5dcec00d-f35e-47f0-a6c2-b4a57c4e3fd6	admin1@test.com	admin1@test.com	t	t	\N	admin	addmin1	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	admin1	1735551366183	\N	0
47beb319-b8d7-4093-989e-1cb8b84dfa14	admin2@test.com	admin2@test.com	t	t	\N	admin	admin2	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	admin2	1735551417983	\N	0
88965489-4cb0-4286-a596-17b451593ac0	user1@test.com	user1@test.com	t	t	\N	user	user1	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	user1	1735551465863	\N	0
0e59f477-e59f-40e3-80db-941c57d371ed	user2@test.com	user2@test.com	t	t	\N	user	user2	e4d8ec9b-fe25-4ade-911c-64f64dc4ad9d	user2	1735551499634	\N	0
\.


--
-- TOC entry 4192 (class 0 OID 16506)
-- Dependencies: 232
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4215 (class 0 OID 17042)
-- Dependencies: 255
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 4216 (class 0 OID 17047)
-- Dependencies: 256
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4193 (class 0 OID 16511)
-- Dependencies: 233
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4224 (class 0 OID 17210)
-- Dependencies: 264
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- TOC entry 4194 (class 0 OID 16516)
-- Dependencies: 234
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- TOC entry 4195 (class 0 OID 16519)
-- Dependencies: 235
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
b396a245-b076-4b42-8d22-5718a2b9efcb	2220ebb6-019d-4c78-8eaa-806b276bcc82
5b80ef4b-1803-4601-84cb-8561d83de9d4	2220ebb6-019d-4c78-8eaa-806b276bcc82
867901f0-c0da-4ed0-9b73-907f2e62b6c2	2220ebb6-019d-4c78-8eaa-806b276bcc82
a9810123-87b4-4fa5-861d-e75ec1dbb47e	2220ebb6-019d-4c78-8eaa-806b276bcc82
bfa5baaa-38b4-4bae-aa57-a3fe267726d7	2220ebb6-019d-4c78-8eaa-806b276bcc82
07ff1e02-8aad-4321-928a-234cb98c896d	2220ebb6-019d-4c78-8eaa-806b276bcc82
06f06156-87b1-4158-afe5-893101e0471f	2220ebb6-019d-4c78-8eaa-806b276bcc82
7a19e50e-84f0-495b-92ab-dc032fd24cfc	2220ebb6-019d-4c78-8eaa-806b276bcc82
1390aee6-d13d-43b0-9514-9deda4c1a69c	2220ebb6-019d-4c78-8eaa-806b276bcc82
77210dfa-c8d8-471b-ac04-83b3eca981d0	2220ebb6-019d-4c78-8eaa-806b276bcc82
fe2320ce-fd6d-40d3-8d4d-5d74764f2ca2	2220ebb6-019d-4c78-8eaa-806b276bcc82
d282dd2a-ced9-4d08-87f4-02a7134e65ea	2220ebb6-019d-4c78-8eaa-806b276bcc82
61fa77e6-b00e-471e-98a1-8904b5fba82f	2220ebb6-019d-4c78-8eaa-806b276bcc82
54ba3ce1-912c-447f-97fe-14bc07a1faa1	2220ebb6-019d-4c78-8eaa-806b276bcc82
ccd3ec4f-06f8-4206-8764-50debffba3d0	2220ebb6-019d-4c78-8eaa-806b276bcc82
5cea39e9-fb3f-4bec-8c62-64c72b669ee8	2220ebb6-019d-4c78-8eaa-806b276bcc82
608be903-b741-4813-8c74-cf3457c51fcc	2220ebb6-019d-4c78-8eaa-806b276bcc82
ed421537-35d9-41d1-99d1-0e4837546632	2220ebb6-019d-4c78-8eaa-806b276bcc82
c26b316f-36da-4f8a-bc1d-63ec8d65539d	2220ebb6-019d-4c78-8eaa-806b276bcc82
ec9cb0c9-4569-4b2b-b1f8-56c328a173aa	2220ebb6-019d-4c78-8eaa-806b276bcc82
08c6a639-64bd-4826-b4ce-757e4cba5272	2220ebb6-019d-4c78-8eaa-806b276bcc82
24c60820-89f6-42b2-a2a5-c01288d4b60a	2220ebb6-019d-4c78-8eaa-806b276bcc82
eeaaa6f3-903c-4f3f-9a92-0f28912525a3	2220ebb6-019d-4c78-8eaa-806b276bcc82
c1973ed1-137d-4e71-b7be-ba625e63ffe3	2220ebb6-019d-4c78-8eaa-806b276bcc82
e74339dc-7e58-42fe-bd11-4044eddbfb15	2220ebb6-019d-4c78-8eaa-806b276bcc82
e93475fe-97f1-4472-bfc6-8a0a583cb697	2220ebb6-019d-4c78-8eaa-806b276bcc82
637bfacc-6665-44e0-afed-ca56ebd2bbef	2220ebb6-019d-4c78-8eaa-806b276bcc82
74ca5497-57b4-4d36-bbf9-b743919318f7	2220ebb6-019d-4c78-8eaa-806b276bcc82
179c9b45-5920-47e4-a48e-ec7f12f3d756	2220ebb6-019d-4c78-8eaa-806b276bcc82
77c24cf0-ea71-4373-8b79-8f0a94337266	2220ebb6-019d-4c78-8eaa-806b276bcc82
cca1f274-f729-4b4d-ac77-54e60800d57a	2220ebb6-019d-4c78-8eaa-806b276bcc82
7330cde2-fc86-4dc2-953e-9387daee37d3	2220ebb6-019d-4c78-8eaa-806b276bcc82
76317afc-d012-4cb9-b876-f5da10fbd5ed	5dcec00d-f35e-47f0-a6c2-b4a57c4e3fd6
90857cb4-1bb5-48d2-824f-a4c3a069f6a5	5dcec00d-f35e-47f0-a6c2-b4a57c4e3fd6
76317afc-d012-4cb9-b876-f5da10fbd5ed	47beb319-b8d7-4093-989e-1cb8b84dfa14
90857cb4-1bb5-48d2-824f-a4c3a069f6a5	47beb319-b8d7-4093-989e-1cb8b84dfa14
76317afc-d012-4cb9-b876-f5da10fbd5ed	88965489-4cb0-4286-a596-17b451593ac0
f79e4aa8-53e9-4dae-9982-a222c3023285	88965489-4cb0-4286-a596-17b451593ac0
76317afc-d012-4cb9-b876-f5da10fbd5ed	0e59f477-e59f-40e3-80db-941c57d371ed
f79e4aa8-53e9-4dae-9982-a222c3023285	0e59f477-e59f-40e3-80db-941c57d371ed
f79e4aa8-53e9-4dae-9982-a222c3023285	47beb319-b8d7-4093-989e-1cb8b84dfa14
f79e4aa8-53e9-4dae-9982-a222c3023285	5dcec00d-f35e-47f0-a6c2-b4a57c4e3fd6
\.


--
-- TOC entry 4189 (class 0 OID 16490)
-- Dependencies: 229
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- TOC entry 4196 (class 0 OID 16533)
-- Dependencies: 236
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
aa257a34-aba6-490f-9159-c9f3c606be16	+
34511941-fb4b-43c0-a8b8-c010452ce360	+
\.


--
-- TOC entry 3711 (class 2606 OID 17589)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3960 (class 2606 OID 17986)
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- TOC entry 3952 (class 2606 OID 17975)
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- TOC entry 3684 (class 2606 OID 17898)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3921 (class 2606 OID 17728)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3923 (class 2606 OID 17927)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3918 (class 2606 OID 17603)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3833 (class 2606 OID 17251)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3881 (class 2606 OID 17526)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3909 (class 2606 OID 17546)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3912 (class 2606 OID 17544)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3901 (class 2606 OID 17542)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3883 (class 2606 OID 17528)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3888 (class 2606 OID 17530)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 17536)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3897 (class 2606 OID 17538)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3905 (class 2606 OID 17540)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3916 (class 2606 OID 17583)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3835 (class 2606 OID 17687)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3768 (class 2606 OID 17704)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3698 (class 2606 OID 17706)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3765 (class 2606 OID 17708)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3756 (class 2606 OID 16837)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3741 (class 2606 OID 16771)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3681 (class 2606 OID 16545)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3752 (class 2606 OID 16839)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3690 (class 2606 OID 16547)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3729 (class 2606 OID 16553)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3669 (class 2606 OID 16557)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 16561)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3744 (class 2606 OID 16775)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3695 (class 2606 OID 16563)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3701 (class 2606 OID 16565)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3686 (class 2606 OID 16567)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 17691)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 17068)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3795 (class 2606 OID 17066)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3792 (class 2606 OID 17064)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3789 (class 2606 OID 17062)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 16569)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3674 (class 2606 OID 17685)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3763 (class 2606 OID 16841)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3867 (class 2606 OID 17409)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3703 (class 2606 OID 16571)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3678 (class 2606 OID 16573)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3727 (class 2606 OID 16575)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3937 (class 2606 OID 17826)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 17367)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3862 (class 2606 OID 17395)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3878 (class 2606 OID 17464)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3872 (class 2606 OID 17434)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3857 (class 2606 OID 17381)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 17419)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3875 (class 2606 OID 17449)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3719 (class 2606 OID 16577)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3805 (class 2606 OID 17076)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3801 (class 2606 OID 17074)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3935 (class 2606 OID 17811)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3931 (class 2606 OID 17801)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3779 (class 2606 OID 16949)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 17218)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 17225)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 17239)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3774 (class 2606 OID 16945)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 17125)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3771 (class 2606 OID 16943)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3817 (class 2606 OID 17904)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3812 (class 2606 OID 17195)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3746 (class 2606 OID 16835)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3750 (class 2606 OID 17118)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3705 (class 2606 OID 17710)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3810 (class 2606 OID 17158)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3807 (class 2606 OID 17156)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 17070)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3945 (class 2606 OID 17873)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3947 (class 2606 OID 17880)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3963 (class 2606 OID 18001)
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- TOC entry 3713 (class 2606 OID 17154)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 17232)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3738 (class 2606 OID 17712)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3667 (class 2606 OID 16389)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3844 (class 2606 OID 17335)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3839 (class 2606 OID 17294)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 17665)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3848 (class 2606 OID 17323)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3929 (class 2606 OID 17786)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3950 (class 2606 OID 17921)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3943 (class 2606 OID 17853)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 17595)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3761 (class 2606 OID 16892)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3672 (class 2606 OID 16581)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3841 (class 2606 OID 17739)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3723 (class 2606 OID 16585)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3782 (class 2606 OID 17990)
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3855 (class 2606 OID 17912)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3941 (class 2606 OID 17908)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3865 (class 2606 OID 17656)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3860 (class 2606 OID 17660)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3784 (class 2606 OID 17988)
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- TOC entry 3954 (class 2606 OID 17994)
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- TOC entry 3956 (class 2606 OID 17979)
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- TOC entry 3958 (class 2606 OID 17977)
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- TOC entry 3693 (class 2606 OID 16593)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3725 (class 2606 OID 17585)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3884 (class 1259 OID 17961)
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3885 (class 1259 OID 17963)
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3787 (class 1259 OID 17937)
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3879 (class 1259 OID 17609)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3790 (class 1259 OID 17613)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3796 (class 1259 OID 17611)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3797 (class 1259 OID 17610)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3793 (class 1259 OID 17612)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3924 (class 1259 OID 17928)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3742 (class 1259 OID 17964)
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- TOC entry 3670 (class 1259 OID 17913)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3919 (class 1259 OID 17653)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3842 (class 1259 OID 17816)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3925 (class 1259 OID 17925)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3747 (class 1259 OID 17813)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3845 (class 1259 OID 17814)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3910 (class 1259 OID 17619)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3913 (class 1259 OID 17887)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3914 (class 1259 OID 17618)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3675 (class 1259 OID 17620)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3676 (class 1259 OID 17621)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3926 (class 1259 OID 17819)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3927 (class 1259 OID 17820)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3682 (class 1259 OID 17914)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3753 (class 1259 OID 17352)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3754 (class 1259 OID 17351)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3886 (class 1259 OID 17713)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3889 (class 1259 OID 17733)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3890 (class 1259 OID 17896)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3891 (class 1259 OID 17715)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3894 (class 1259 OID 17716)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3895 (class 1259 OID 17717)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3898 (class 1259 OID 17718)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3899 (class 1259 OID 17719)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3902 (class 1259 OID 17720)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3903 (class 1259 OID 17721)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3906 (class 1259 OID 17722)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3907 (class 1259 OID 17723)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3827 (class 1259 OID 17939)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3828 (class 1259 OID 17624)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3824 (class 1259 OID 17625)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3775 (class 1259 OID 17627)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3757 (class 1259 OID 17626)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3758 (class 1259 OID 18005)
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- TOC entry 3759 (class 1259 OID 18004)
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- TOC entry 3687 (class 1259 OID 17628)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3688 (class 1259 OID 17629)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3813 (class 1259 OID 17968)
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- TOC entry 3814 (class 1259 OID 17967)
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- TOC entry 3815 (class 1259 OID 17932)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3961 (class 1259 OID 17996)
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- TOC entry 3938 (class 1259 OID 17992)
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- TOC entry 3939 (class 1259 OID 17991)
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- TOC entry 3748 (class 1259 OID 17630)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3696 (class 1259 OID 17633)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3837 (class 1259 OID 17812)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3836 (class 1259 OID 17634)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3699 (class 1259 OID 17637)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3769 (class 1259 OID 17636)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3691 (class 1259 OID 17632)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3766 (class 1259 OID 17638)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3706 (class 1259 OID 17639)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3808 (class 1259 OID 17640)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3873 (class 1259 OID 17641)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3870 (class 1259 OID 17642)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3863 (class 1259 OID 17661)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3853 (class 1259 OID 17662)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3858 (class 1259 OID 17663)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3964 (class 1259 OID 18002)
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- TOC entry 3948 (class 1259 OID 17886)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3846 (class 1259 OID 17815)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3709 (class 1259 OID 17646)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3876 (class 1259 OID 17647)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3772 (class 1259 OID 17894)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3932 (class 1259 OID 17821)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3933 (class 1259 OID 17938)
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- TOC entry 3714 (class 1259 OID 17348)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3715 (class 1259 OID 17935)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3780 (class 1259 OID 17345)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3679 (class 1259 OID 17349)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3720 (class 1259 OID 17342)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3831 (class 1259 OID 17344)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3733 (class 1259 OID 17350)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3736 (class 1259 OID 17343)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3721 (class 1259 OID 17936)
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3802 (class 1259 OID 17649)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3803 (class 1259 OID 17650)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3730 (class 1259 OID 17651)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3739 (class 1259 OID 17652)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3716 (class 1259 OID 17960)
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3717 (class 1259 OID 17962)
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3987 (class 2606 OID 16846)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3981 (class 2606 OID 16776)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3986 (class 2606 OID 16856)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3982 (class 2606 OID 17003)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3973 (class 2606 OID 16601)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3977 (class 2606 OID 16606)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3971 (class 2606 OID 16616)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4029 (class 2606 OID 17854)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3975 (class 2606 OID 16621)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3978 (class 2606 OID 16631)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3968 (class 2606 OID 16636)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 3972 (class 2606 OID 16641)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3969 (class 2606 OID 16656)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3965 (class 2606 OID 16661)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3996 (class 2606 OID 17097)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3997 (class 2606 OID 17092)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3995 (class 2606 OID 17087)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3994 (class 2606 OID 17082)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3979 (class 2606 OID 16671)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4006 (class 2606 OID 17760)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4007 (class 2606 OID 17750)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3983 (class 2606 OID 17745)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4022 (class 2606 OID 17604)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4020 (class 2606 OID 17552)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 4021 (class 2606 OID 17547)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4005 (class 2606 OID 17252)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4000 (class 2606 OID 17112)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 3998 (class 2606 OID 17107)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3999 (class 2606 OID 17102)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4018 (class 2606 OID 17470)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4016 (class 2606 OID 17455)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4025 (class 2606 OID 17827)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4008 (class 2606 OID 17671)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4026 (class 2606 OID 17832)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4027 (class 2606 OID 17837)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4019 (class 2606 OID 17465)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4017 (class 2606 OID 17450)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4028 (class 2606 OID 17859)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4010 (class 2606 OID 17666)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4012 (class 2606 OID 17420)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4014 (class 2606 OID 17435)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4015 (class 2606 OID 17440)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4013 (class 2606 OID 17425)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4009 (class 2606 OID 17676)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3966 (class 2606 OID 16686)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4024 (class 2606 OID 17802)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 3993 (class 2606 OID 16966)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4003 (class 2606 OID 17226)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 4002 (class 2606 OID 17240)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3990 (class 2606 OID 16912)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3970 (class 2606 OID 16696)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3991 (class 2606 OID 16956)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3992 (class 2606 OID 17126)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 3980 (class 2606 OID 16706)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3974 (class 2606 OID 16716)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3984 (class 2606 OID 16851)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3967 (class 2606 OID 16731)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3985 (class 2606 OID 17119)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 4023 (class 2606 OID 17787)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4001 (class 2606 OID 17161)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4030 (class 2606 OID 17867)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4031 (class 2606 OID 17881)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3989 (class 2606 OID 16881)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3976 (class 2606 OID 16751)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 4004 (class 2606 OID 17233)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4011 (class 2606 OID 17410)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3988 (class 2606 OID 16861)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2024-12-30 10:44:11

--
-- PostgreSQL database dump complete
--

