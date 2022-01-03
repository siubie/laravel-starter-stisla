--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

ALTER TABLE ONLY baru.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
ALTER TABLE ONLY baru.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
ALTER TABLE ONLY baru.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
ALTER TABLE ONLY baru.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
ALTER TABLE ONLY baru.menu_items DROP CONSTRAINT menu_items_menu_group_id_foreign;
DROP INDEX baru.personal_access_tokens_tokenable_type_tokenable_id_index;
DROP INDEX baru.password_resets_email_index;
DROP INDEX baru.model_has_roles_model_id_model_type_index;
DROP INDEX baru.model_has_permissions_model_id_model_type_index;
ALTER TABLE ONLY baru.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY baru.users DROP CONSTRAINT users_email_unique;
ALTER TABLE ONLY baru.roles DROP CONSTRAINT roles_pkey;
ALTER TABLE ONLY baru.roles DROP CONSTRAINT roles_name_guard_name_unique;
ALTER TABLE ONLY baru.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
ALTER TABLE ONLY baru.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
ALTER TABLE ONLY baru.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
ALTER TABLE ONLY baru.permissions DROP CONSTRAINT permissions_pkey;
ALTER TABLE ONLY baru.permissions DROP CONSTRAINT permissions_name_guard_name_unique;
ALTER TABLE ONLY baru.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
ALTER TABLE ONLY baru.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
ALTER TABLE ONLY baru.migrations DROP CONSTRAINT migrations_pkey;
ALTER TABLE ONLY baru.menu_items DROP CONSTRAINT menu_items_route_unique;
ALTER TABLE ONLY baru.menu_items DROP CONSTRAINT menu_items_pkey;
ALTER TABLE ONLY baru.menu_items DROP CONSTRAINT menu_items_name_unique;
ALTER TABLE ONLY baru.menu_groups DROP CONSTRAINT menu_groups_pkey;
ALTER TABLE ONLY baru.menu_groups DROP CONSTRAINT menu_groups_name_unique;
ALTER TABLE ONLY baru.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
ALTER TABLE ONLY baru.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
ALTER TABLE baru.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.menu_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.menu_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE baru.failed_jobs ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE baru.users_id_seq;
DROP TABLE baru.users;
DROP SEQUENCE baru.roles_id_seq;
DROP TABLE baru.roles;
DROP TABLE baru.role_has_permissions;
DROP SEQUENCE baru.personal_access_tokens_id_seq;
DROP TABLE baru.personal_access_tokens;
DROP SEQUENCE baru.permissions_id_seq;
DROP TABLE baru.permissions;
DROP TABLE baru.password_resets;
DROP TABLE baru.model_has_roles;
DROP TABLE baru.model_has_permissions;
DROP SEQUENCE baru.migrations_id_seq;
DROP TABLE baru.migrations;
DROP SEQUENCE baru.menu_items_id_seq;
DROP TABLE baru.menu_items;
DROP SEQUENCE baru.menu_groups_id_seq;
DROP TABLE baru.menu_groups;
DROP SEQUENCE baru.failed_jobs_id_seq;
DROP TABLE baru.failed_jobs;
DROP SCHEMA baru;
--
-- Name: baru; Type: SCHEMA; Schema: -; Owner: devpostgre
--

CREATE SCHEMA baru;


ALTER SCHEMA baru OWNER TO devpostgre;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: failed_jobs; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE baru.failed_jobs OWNER TO devpostgre;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.failed_jobs_id_seq OWNER TO devpostgre;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.failed_jobs_id_seq OWNED BY baru.failed_jobs.id;


--
-- Name: menu_groups; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.menu_groups (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    permission_name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE baru.menu_groups OWNER TO devpostgre;

--
-- Name: menu_groups_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.menu_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.menu_groups_id_seq OWNER TO devpostgre;

--
-- Name: menu_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.menu_groups_id_seq OWNED BY baru.menu_groups.id;


--
-- Name: menu_items; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.menu_items (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    route character varying(255) NOT NULL,
    permission_name character varying(255) NOT NULL,
    menu_group_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE baru.menu_items OWNER TO devpostgre;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.menu_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.menu_items_id_seq OWNER TO devpostgre;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.menu_items_id_seq OWNED BY baru.menu_items.id;


--
-- Name: migrations; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE baru.migrations OWNER TO devpostgre;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.migrations_id_seq OWNER TO devpostgre;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.migrations_id_seq OWNED BY baru.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE baru.model_has_permissions OWNER TO devpostgre;

--
-- Name: model_has_roles; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE baru.model_has_roles OWNER TO devpostgre;

--
-- Name: password_resets; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE baru.password_resets OWNER TO devpostgre;

--
-- Name: permissions; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE baru.permissions OWNER TO devpostgre;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.permissions_id_seq OWNER TO devpostgre;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.permissions_id_seq OWNED BY baru.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE baru.personal_access_tokens OWNER TO devpostgre;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.personal_access_tokens_id_seq OWNER TO devpostgre;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.personal_access_tokens_id_seq OWNED BY baru.personal_access_tokens.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE baru.role_has_permissions OWNER TO devpostgre;

--
-- Name: roles; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE baru.roles OWNER TO devpostgre;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.roles_id_seq OWNER TO devpostgre;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.roles_id_seq OWNED BY baru.roles.id;


--
-- Name: users; Type: TABLE; Schema: baru; Owner: devpostgre
--

CREATE TABLE baru.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text
);


ALTER TABLE baru.users OWNER TO devpostgre;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: baru; Owner: devpostgre
--

CREATE SEQUENCE baru.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE baru.users_id_seq OWNER TO devpostgre;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: baru; Owner: devpostgre
--

ALTER SEQUENCE baru.users_id_seq OWNED BY baru.users.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.failed_jobs ALTER COLUMN id SET DEFAULT nextval('baru.failed_jobs_id_seq'::regclass);


--
-- Name: menu_groups id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_groups ALTER COLUMN id SET DEFAULT nextval('baru.menu_groups_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_items ALTER COLUMN id SET DEFAULT nextval('baru.menu_items_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.migrations ALTER COLUMN id SET DEFAULT nextval('baru.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.permissions ALTER COLUMN id SET DEFAULT nextval('baru.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('baru.personal_access_tokens_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.roles ALTER COLUMN id SET DEFAULT nextval('baru.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.users ALTER COLUMN id SET DEFAULT nextval('baru.users_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: menu_groups; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.menu_groups (id, name, permission_name, icon, created_at, updated_at) FROM stdin;
1	Dashboard	dashboard	fas fa-tachometer-alt	\N	\N
2	Users Management	user.management	fas fa-users	\N	\N
3	Role Management	role.permission.management	fas fa-user-tag	\N	\N
4	Menu Management	menu.management	fas fa-bars	\N	\N
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.menu_items (id, name, route, permission_name, menu_group_id, created_at, updated_at) FROM stdin;
1	Dashboard	dashboard	dashboard	1	\N	\N
2	User List	user-management/user	user.index	2	\N	\N
3	Role List	role-and-permission/role	role.index	3	\N	\N
4	Permission List	role-and-permission/permission	permission.index	3	\N	\N
5	Permission To Role	role-and-permission/assign	assign.index	3	\N	\N
6	User To Role	role-and-permission/assign-user	assign.user.index	3	\N	\N
7	Menu Group	menu-management/menu-group	menu-group.index	4	\N	\N
8	Menu Item	menu-management/menu-item	menu-item.index	4	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2014_10_12_200000_add_two_factor_columns_to_users_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2021_10_26_232900_create_permission_tables	1
7	2021_12_30_215143_create_menu_groups_table	1
8	2021_12_31_002402_create_menu_items_table	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.model_has_roles (role_id, model_type, model_id) FROM stdin;
2	App\\Models\\User	1
1	App\\Models\\User	2
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	dashboard	web	2022-01-03 02:33:17	2022-01-03 02:33:17
2	user.management	web	2022-01-03 02:33:17	2022-01-03 02:33:17
3	role.permission.management	web	2022-01-03 02:33:17	2022-01-03 02:33:17
4	menu.management	web	2022-01-03 02:33:17	2022-01-03 02:33:17
5	user.index	web	2022-01-03 02:33:17	2022-01-03 02:33:17
6	user.create	web	2022-01-03 02:33:17	2022-01-03 02:33:17
7	user.edit	web	2022-01-03 02:33:17	2022-01-03 02:33:17
8	user.destroy	web	2022-01-03 02:33:17	2022-01-03 02:33:17
9	user.import	web	2022-01-03 02:33:17	2022-01-03 02:33:17
10	user.export	web	2022-01-03 02:33:17	2022-01-03 02:33:17
11	role.index	web	2022-01-03 02:33:17	2022-01-03 02:33:17
12	role.create	web	2022-01-03 02:33:17	2022-01-03 02:33:17
13	role.edit	web	2022-01-03 02:33:17	2022-01-03 02:33:17
14	role.destroy	web	2022-01-03 02:33:17	2022-01-03 02:33:17
15	role.import	web	2022-01-03 02:33:17	2022-01-03 02:33:17
16	role.export	web	2022-01-03 02:33:17	2022-01-03 02:33:17
17	permission.index	web	2022-01-03 02:33:17	2022-01-03 02:33:17
18	permission.create	web	2022-01-03 02:33:17	2022-01-03 02:33:17
19	permission.edit	web	2022-01-03 02:33:17	2022-01-03 02:33:17
20	permission.destroy	web	2022-01-03 02:33:17	2022-01-03 02:33:17
21	permission.import	web	2022-01-03 02:33:17	2022-01-03 02:33:17
22	permission.export	web	2022-01-03 02:33:17	2022-01-03 02:33:17
23	assign.index	web	2022-01-03 02:33:17	2022-01-03 02:33:17
24	assign.create	web	2022-01-03 02:33:17	2022-01-03 02:33:17
25	assign.edit	web	2022-01-03 02:33:17	2022-01-03 02:33:17
26	assign.destroy	web	2022-01-03 02:33:17	2022-01-03 02:33:17
27	assign.user.index	web	2022-01-03 02:33:17	2022-01-03 02:33:17
28	assign.user.create	web	2022-01-03 02:33:17	2022-01-03 02:33:17
29	assign.user.edit	web	2022-01-03 02:33:17	2022-01-03 02:33:17
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.role_has_permissions (permission_id, role_id) FROM stdin;
1	1
2	1
5	1
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
10	2
11	2
12	2
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	user	web	2022-01-03 02:33:17	2022-01-03 02:33:17
2	super-admin	web	2022-01-03 02:33:17	2022-01-03 02:33:17
3	Soko	web	2022-01-03 02:34:18	2022-01-03 02:34:18
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: baru; Owner: devpostgre
--

COPY baru.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, two_factor_secret, two_factor_recovery_codes) FROM stdin;
1	SuperAdmin	superadmin@gmail.com	\N	$2y$10$.C/l7dxfCPGz7SP22KxYDOVrTNWL8WC4hRadMxdJd2B9Wn1erMfLe	\N	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
2	user	user@gmail.com	\N	$2y$10$1U4awz5YzIGAE7CYgXHGAuwf5SD3qZsXe3wQlfspBl1Pp2Sx.Wp6G	\N	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
3	Juanita O'Keefe	cleta26@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	nJp673zbhj	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
4	Judah Jaskolski	dickens.murphy@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	cEfWBWKpyo	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
5	Mr. Virgil Doyle	berge.doyle@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	Mpm6CH1KQj	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
6	Prof. Drake Padberg Jr.	kody36@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	7VW4zAOxZV	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
7	Prof. Alyce Schinner MD	sipes.haskell@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	3pvMyVUJ7Q	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
8	Mr. Curt Stracke	yost.holly@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	sYf4U0tGSu	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
9	Constance Block	ora.donnelly@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	6CDTSqXN62	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
10	Royce Kemmer	kennedy38@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	DMMbtLamMI	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
11	Emile Goldner	jon.schimmel@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	ZPKOjkXhiM	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
12	Logan Bode Jr.	karl.gulgowski@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	YEiTgoebkF	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
13	Rollin Kozey	wendy.gerhold@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	IJq7ICA2Ev	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
14	Nigel Simonis	akohler@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	7e9W34K13n	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
15	Dr. Dominic Dickens DDS	katlynn95@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	F5DOkim6HP	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
16	Trinity Ankunding	hirthe.kayleigh@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	jERO1YD9e5	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
17	Dr. Billie Streich	carolyn44@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	f40oVt9rmm	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
18	Gregorio Schaefer	zdubuque@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	gmnxKBVpm6	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
19	Terrell Hammes	hane.linwood@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	SAHWbZ7Tw8	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
20	Kali Schultz Sr.	lonzo.shields@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	ud2B0QYaEc	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
21	Dr. Mohamed Bauch	brekke.glen@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	XdfSoBWHd5	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
22	Phyllis Hill	abdiel41@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	PUaBupwI60	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
23	Paolo McClure	adell54@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	lIZbTWxkrN	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
24	Prof. Erick Emmerich	laltenwerth@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	z2dYl1uDnU	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
25	Miss Eula Dare DDS	jaskolski.ursula@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	UZiGPQLgUX	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
26	Jon Keeling	cassie.pollich@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	E1hj24JyYd	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
27	Dr. Pearl Kuhlman	rohan.erick@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	CYef6zrUTR	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
28	Caterina Abshire III	bkrajcik@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	HeCKVms714	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
29	Janice Runolfsson	pouros.ford@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	wOOPVgdr0l	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
30	Therese Zboncak III	zieme.letitia@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	x9H1saK5fr	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
31	Van Krajcik	oleta.dare@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	DYhve0puLU	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
32	Margarett Lockman	walter.delia@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	BAYeVfw836	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
33	Dr. Werner Doyle MD	iwehner@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	LOgpq2Ai2U	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
34	Camden O'Reilly	maeve.lind@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	lH485WkeWm	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
35	Miss Audreanne Purdy Jr.	bettie30@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	2Dv3pxxnPn	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
36	Mr. Gregory Schaden Sr.	dhagenes@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	cFsMb66fbO	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
37	Jewel Olson	uschneider@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	KKFbtKRDyK	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
38	Arlo Osinski	corine33@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	SHb9F12kna	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
39	Eloy McCullough I	jalen.stroman@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	hPdFWiQVXv	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
40	Johathan Durgan	gweissnat@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	uMgrEq7gB2	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
41	Sigrid Ankunding	fahey.fidel@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	RtljSij4C7	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
42	Margarette O'Hara	helga.maggio@example.org	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	NZih1aH2pt	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
43	Leon Monahan	gertrude08@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	e4WFCjyvJF	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
44	Isabel Senger	wreilly@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	w8h2VDgRiQ	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
45	Tabitha O'Kon	kellie.gibson@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	cNlHKfW8yw	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
46	Randal Spencer	flatley.esmeralda@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	K6igTQXF4G	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
47	Carlie Hartmann	nikolas54@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	5lIU3nUR0b	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
48	Maximillian Kohler	elise71@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	MdoRUG68PK	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
49	Briana Volkman	ncremin@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	2XKx4bPS3g	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
50	Dr. Adalberto Graham II	fdaniel@example.com	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	Jsvyr225OM	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
51	Citlalli Heathcote	vstiedemann@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	Ja0NN2pd4D	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
52	Bernardo Morar	quitzon.lon@example.net	2022-01-03 02:33:17	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	cbdpTzhggk	2022-01-03 02:33:17	2022-01-03 02:33:17	\N	\N
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.failed_jobs_id_seq', 1, false);


--
-- Name: menu_groups_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.menu_groups_id_seq', 4, true);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.menu_items_id_seq', 8, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.migrations_id_seq', 8, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.permissions_id_seq', 29, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.personal_access_tokens_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.roles_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: baru; Owner: devpostgre
--

SELECT pg_catalog.setval('baru.users_id_seq', 52, true);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: menu_groups menu_groups_name_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_groups
    ADD CONSTRAINT menu_groups_name_unique UNIQUE (name);


--
-- Name: menu_groups menu_groups_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_groups
    ADD CONSTRAINT menu_groups_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_name_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_items
    ADD CONSTRAINT menu_items_name_unique UNIQUE (name);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_route_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_items
    ADD CONSTRAINT menu_items_route_unique UNIQUE (route);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: baru; Owner: devpostgre
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON baru.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: baru; Owner: devpostgre
--

CREATE INDEX model_has_roles_model_id_model_type_index ON baru.model_has_roles USING btree (model_id, model_type);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: baru; Owner: devpostgre
--

CREATE INDEX password_resets_email_index ON baru.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: baru; Owner: devpostgre
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON baru.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: menu_items menu_items_menu_group_id_foreign; Type: FK CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.menu_items
    ADD CONSTRAINT menu_items_menu_group_id_foreign FOREIGN KEY (menu_group_id) REFERENCES baru.menu_groups(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES baru.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES baru.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES baru.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: baru; Owner: devpostgre
--

ALTER TABLE ONLY baru.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES baru.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

