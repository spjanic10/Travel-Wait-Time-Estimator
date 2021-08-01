--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.6

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: easy_maps_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.easy_maps_address (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    computed_address character varying(255),
    latitude double precision,
    longitude double precision,
    exception text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


--
-- Name: easy_maps_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.easy_maps_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: easy_maps_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.easy_maps_address_id_seq OWNED BY public.easy_maps_address.id;


--
-- Name: notifyme_traveltime; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifyme_traveltime (
    id integer NOT NULL,
    location character varying(200) NOT NULL,
    destination character varying(200) NOT NULL,
    travelling_time integer NOT NULL,
    created timestamp with time zone NOT NULL,
    travel_mode character varying(200) NOT NULL
);


--
-- Name: notifyme_waittime; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifyme_waittime (
    id integer NOT NULL,
    address character varying(200) NOT NULL,
    wait_time integer NOT NULL,
    created timestamp with time zone NOT NULL
);


--
-- Name: polls_traveltime; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.polls_traveltime (
    id integer NOT NULL,
    location character varying(200) NOT NULL,
    destination character varying(200) NOT NULL,
    travelling_time integer NOT NULL,
    created timestamp with time zone NOT NULL,
    travel_mode character varying(200) NOT NULL
);


--
-- Name: polls_traveltime_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.polls_traveltime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polls_traveltime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.polls_traveltime_id_seq OWNED BY public.notifyme_traveltime.id;


--
-- Name: polls_traveltime_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.polls_traveltime_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polls_traveltime_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.polls_traveltime_id_seq1 OWNED BY public.polls_traveltime.id;


--
-- Name: polls_waittime; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.polls_waittime (
    id integer NOT NULL,
    address character varying(200) NOT NULL,
    wait_time integer NOT NULL,
    created timestamp with time zone NOT NULL
);


--
-- Name: polls_waittime_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.polls_waittime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polls_waittime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.polls_waittime_id_seq OWNED BY public.notifyme_waittime.id;


--
-- Name: polls_waittime_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.polls_waittime_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polls_waittime_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.polls_waittime_id_seq1 OWNED BY public.polls_waittime.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: easy_maps_address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_maps_address ALTER COLUMN id SET DEFAULT nextval('public.easy_maps_address_id_seq'::regclass);


--
-- Name: notifyme_traveltime id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifyme_traveltime ALTER COLUMN id SET DEFAULT nextval('public.polls_traveltime_id_seq'::regclass);


--
-- Name: notifyme_waittime id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifyme_waittime ALTER COLUMN id SET DEFAULT nextval('public.polls_waittime_id_seq'::regclass);


--
-- Name: polls_traveltime id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.polls_traveltime ALTER COLUMN id SET DEFAULT nextval('public.polls_traveltime_id_seq1'::regclass);


--
-- Name: polls_waittime id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.polls_waittime ALTER COLUMN id SET DEFAULT nextval('public.polls_waittime_id_seq1'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add travel time	7	add_traveltime
26	Can change travel time	7	change_traveltime
27	Can delete travel time	7	delete_traveltime
28	Can view travel time	7	view_traveltime
29	Can add wait time	8	add_waittime
30	Can change wait time	8	change_waittime
31	Can delete wait time	8	delete_waittime
32	Can view wait time	8	view_waittime
33	Can add EasyMaps Address	9	add_address
34	Can change EasyMaps Address	9	change_address
35	Can delete EasyMaps Address	9	delete_address
36	Can view EasyMaps Address	9	view_address
37	Can add travel time	10	add_traveltime
38	Can change travel time	10	change_traveltime
39	Can delete travel time	10	delete_traveltime
40	Can view travel time	10	view_traveltime
41	Can add wait time	11	add_waittime
42	Can change wait time	11	change_waittime
43	Can delete wait time	11	delete_waittime
44	Can view wait time	11	view_waittime
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$dmiBbsSjHhvp$9XvkT22WeWLYvBKe1AfsIe6uVxPGhYKFs5lYRm9i0Rk=	2021-03-07 00:39:47.268099+00	t	stefan			spjanic5@gmail.com	t	t	2021-03-05 23:05:18.898732+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-05 23:06:57.196241+00	1	Travel time from Ryerson University to Toronto General is 3 minute(s).	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
9	easy_maps	address
7	notifyMe	traveltime
8	notifyMe	waittime
10	polls	traveltime
11	polls	waittime
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-05 22:46:57.965776+00
2	auth	0001_initial	2021-03-05 22:46:58.321507+00
3	admin	0001_initial	2021-03-05 22:46:59.112807+00
4	admin	0002_logentry_remove_auto_add	2021-03-05 22:46:59.368581+00
5	admin	0003_logentry_add_action_flag_choices	2021-03-05 22:46:59.498521+00
6	contenttypes	0002_remove_content_type_name	2021-03-05 22:46:59.693536+00
7	auth	0002_alter_permission_name_max_length	2021-03-05 22:46:59.846738+00
8	auth	0003_alter_user_email_max_length	2021-03-05 22:47:00.001666+00
9	auth	0004_alter_user_username_opts	2021-03-05 22:47:00.128506+00
10	auth	0005_alter_user_last_login_null	2021-03-05 22:47:00.282608+00
11	auth	0006_require_contenttypes_0002	2021-03-05 22:47:00.396465+00
12	auth	0007_alter_validators_add_error_messages	2021-03-05 22:47:00.526571+00
13	auth	0008_alter_user_username_max_length	2021-03-05 22:47:00.685601+00
14	auth	0009_alter_user_last_name_max_length	2021-03-05 22:47:00.841746+00
15	auth	0010_alter_group_name_max_length	2021-03-05 22:47:00.997534+00
16	auth	0011_update_proxy_permissions	2021-03-05 22:47:01.123582+00
17	auth	0012_alter_user_first_name_max_length	2021-03-05 22:47:01.276614+00
18	easy_maps	0001_initial	2021-03-05 22:47:01.43632+00
19	easy_maps	0002_auto_20190329_0541	2021-03-05 22:47:01.673937+00
20	easy_maps	0003_address_timestamp	2021-03-05 22:47:01.85286+00
32	sessions	0001_initial	2021-03-05 22:47:03.980891+00
21	notifyMe	0001_initial	2021-03-05 22:47:02.040874+00
22	notifyMe	0002_auto_20210116_1347	2021-03-05 22:47:02.315465+00
23	notifyMe	0003_waittime	2021-03-05 22:47:02.489041+00
24	notifyMe	0004_auto_20210123_0259	2021-03-05 22:47:02.667906+00
25	notifyMe	0005_rental	2021-03-05 22:47:02.822889+00
26	notifyMe	0006_auto_20210124_0308	2021-03-05 22:47:03.008905+00
27	notifyMe	0007_auto_20210124_0321	2021-03-05 22:47:03.206931+00
28	notifyMe	0008_delete_rental	2021-03-05 22:47:03.364654+00
29	notifyMe	0009_auto_20210127_1820	2021-03-05 22:47:03.52378+00
30	notifyMe	0010_traveltime_travel_mode	2021-03-05 22:47:03.705938+00
31	notifyMe	0011_auto_20210210_1416	2021-03-05 22:47:03.824619+00
33	polls	0001_initial	2021-03-06 23:16:59.240228+00
34	polls	0002_auto_20210116_1347	2021-03-06 23:16:59.509258+00
35	polls	0003_waittime	2021-03-06 23:16:59.679301+00
36	polls	0004_auto_20210123_0259	2021-03-06 23:16:59.852273+00
37	polls	0005_rental	2021-03-06 23:17:00.00226+00
38	polls	0006_auto_20210124_0308	2021-03-06 23:17:00.180445+00
39	polls	0007_auto_20210124_0321	2021-03-06 23:17:00.373373+00
40	polls	0008_delete_rental	2021-03-06 23:17:00.534325+00
41	polls	0009_auto_20210127_1820	2021-03-06 23:17:00.692561+00
42	polls	0010_traveltime_travel_mode	2021-03-06 23:17:00.873817+00
43	polls	0011_auto_20210210_1416	2021-03-06 23:17:00.991502+00
44	polls	0012_auto_20210318_0246	2021-03-18 02:46:48.772483+00
45	polls	0013_auto_20210318_0248	2021-03-18 02:48:11.760739+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
3brus56vorzj7fotokankonz4pgagdbu	.eJxVjDsOwjAQRO_iGln-ZNeGkp4zWLvxBgeQI8VJhbg7iZQCimnmvZm3SrQuJa1N5jRmdVFWnX47pv4pdQf5QfU-6X6qyzyy3hV90KZvU5bX9XD_Dgq1sq0FOXYuYpDAHYBgCHj2PGyB6AwDeLSRPDnjHQzgAoKx1gQWl20W9fkCs4U2hw:1lIJVv:a16DfmiqVA3jcIcrjg0XokW6-_ffDBu3ixOuxKfPuDs	2021-03-19 23:05:43.104463+00
l0lqpo9rkhklnjxpxzlg4euifynvmfpy	.eJxVjMsOwiAURP-FtSH0ggRcuvcbCPeBVA1NSrsy_rtt0oUuZjPnzLxVyutS09plTiOrixrU6bfDTE9pO-BHbvdJ09SWeUS9K_qgXd8mltf1cP8Oau51W1tvDJQYACkI0MDsSApaDluMBwa0gDGWwhCNFeKzK0CRRYrzkNXnC_oOOO4:1lIhSV:9h27mHbZvxFhsmfCFabg3EPgRSegTxut_fDuWQSbHZo	2021-03-21 00:39:47.298913+00
\.


--
-- Data for Name: easy_maps_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.easy_maps_address (id, address, computed_address, latitude, longitude, exception, "timestamp") FROM stdin;
\.


--
-- Data for Name: notifyme_traveltime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifyme_traveltime (id, location, destination, travelling_time, created, travel_mode) FROM stdin;
1	Ryerson University	Toronto General	3	2021-03-05 23:06:57.140874+00	driving
2	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 17:28:48.883975+00	driving
3	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 18:00:10.39691+00	driving
4	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 18:31:38.006419+00	driving
5	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 19:04:14.50273+00	driving
6	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 19:04:44.666562+00	driving
7	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 19:07:40.244038+00	driving
8	Ryerson University, Victoria Street, Toronto, ON, Canada	Markham Stouffville Hospital, Church Street, Markham, ON, Canada	31	2021-03-06 19:08:33.53418+00	driving
9	Ryerson University, Victoria Street, Toronto, ON, Canada	Markham Stouffville Hospital, Church Street, Markham, ON, Canada	31	2021-03-06 19:10:38.990006+00	driving
10	Ryerson University, Victoria Street, Toronto, ON, Canada	South Bruce Grey Health Centre - Walkerton, McGivern Street West, Walkerton, ON, Canada	137	2021-03-06 19:11:00.144619+00	driving
11	Ryerson University, Victoria Street, Toronto, ON, Canada	East Toronto Health Centre, Danforth Avenue, Toronto, ON, Canada	16	2021-03-06 19:11:21.875505+00	driving
12	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 19:13:30.843112+00	driving
\.


--
-- Data for Name: notifyme_waittime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifyme_waittime (id, address, wait_time, created) FROM stdin;
\.


--
-- Data for Name: polls_traveltime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.polls_traveltime (id, location, destination, travelling_time, created, travel_mode) FROM stdin;
1	Ryerson University, Victoria Street, Toronto, ON, Canada	Markham Stouffville Hospital, Church Street, Markham, ON, Canada	31	2021-03-06 23:17:31.854396+00	driving
2	Ryerson University, Victoria Street, Toronto, ON, Canada	CN Tower, Bremner Boulevard, Toronto, ON, Canada	7	2021-03-06 23:19:16.971891+00	driving
3	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-06 23:53:58.823319+00	driving
4	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-07 00:04:27.128236+00	driving
5	Ryerson University, Victoria Street, Toronto, ON, Canada	Sunnybrook Health Sciences Centre, Bayview Avenue, Toronto, ON, Canada	18	2021-03-07 00:05:41.74028+00	driving
6	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	22	2021-03-07 00:06:41.083846+00	driving
7	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	22	2021-03-07 00:07:10.023134+00	driving
8	<br> RYerson	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	22	2021-03-07 00:13:51.622844+00	driving
9	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-07 00:33:15.112207+00	driving
10	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-07 00:39:25.218212+00	driving
11	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-07 00:39:30.313743+00	walking
12	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-07 00:39:34.919069+00	transit
13	Square One Shopping Centre, City Centre Drive, Mississauga, ON, Canada	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	10	2021-03-07 00:41:11.264911+00	driving
14	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-07 00:54:56.087862+00	driving
15	Ryerson University	Markham Stouffville	31	2021-03-07 02:00:47.594684+00	driving
16	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	22	2021-03-07 03:58:28.434835+00	driving
17	Ryerson	Toronto General	866	2021-03-07 20:52:25.212431+00	transit
18	Ryerson University	Toronto General	3	2021-03-09 13:26:20.284238+00	driving
19	Ryerson University	St. Michael's Hospital, Bond Street, Toronto, ON, Canada	2	2021-03-09 13:26:39.410667+00	driving
20	Ryerson University	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-09 13:26:55.546409+00	driving
21	Ryerson University	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	4	2021-03-09 13:27:03.884552+00	driving
22	Ryerson University	Pearson International Airport-Commercial Operations, Britannia Road East, Mississauga, ON, Canada	31	2021-03-09 13:28:21.351377+00	driving
23	Ryerson University	Toronto Lester B. Pearson International Airport Commercial Operations, Britannia Road East, Mississauga, ON, Canada	31	2021-03-09 13:28:30.267536+00	driving
24	Ryerson University	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	22	2021-03-09 13:29:16.038083+00	driving
25	Ryerson University	Pearson International Airport-Commercial Operations, Britannia Road East, Mississauga, ON, Canada	31	2021-03-09 13:29:30.084193+00	driving
26	Ryerson University	Toronto Pearson International Airport (YYZ), Silver Dart Drive, Mississauga, ON, Canada	22	2021-03-09 13:29:45.469073+00	driving
27	Ryerson University	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-09 13:29:57.938858+00	driving
28	Ryerson University	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-09 13:30:21.972592+00	driving
29	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-09 14:02:35.539352+00	driving
30	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	4	2021-03-09 14:31:57.355877+00	driving
31	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	4	2021-03-09 14:32:13.881413+00	driving
32	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	4	2021-03-09 14:32:49.903517+00	driving
33	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	4	2021-03-09 14:36:01.622933+00	driving
34	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	3	2021-03-09 14:36:42.465394+00	driving
35	191 ellis crescent milton ontario	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	41	2021-03-09 14:37:11.603806+00	driving
36	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	37	2021-03-09 14:53:10.377478+00	transit
37	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	40	2021-03-09 14:54:29.970839+00	transit
38	Ryerson University, Victoria Street, Toronto, ON, Canada	Union Station Toronto, Front Street West, Toronto, ON, Canada	7	2021-03-09 14:55:40.008441+00	driving
39	Ryerson University, Victoria Street, Toronto, ON, Canada	Union Station Toronto, Front Street West, Toronto, ON, Canada	7	2021-03-09 14:55:46.340261+00	transit
40	Ryerson University, Victoria Street, Toronto, ON, Canada	Union Station Toronto, Front Street West, Toronto, ON, Canada	7	2021-03-09 15:01:57.007294+00	transit
41	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-16 20:30:07.352774+00	driving
42	Ryerson University, Victoria Street, Toronto, ON, Canada	Sunnybrook Health Sciences Centre, Bayview Avenue, Toronto, ON, Canada	18	2021-03-16 20:31:00.274944+00	driving
43	Redcar Avenue Etobicoke	Silverthorn Collegiate Institute, Mill Road, Etobicoke, ON, Canada	25	2021-03-18 02:28:48.85097+00	transit
44	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 02:41:07.258356+00	driving
45	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 02:41:43.916942+00	driving
46	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 02:42:36.032132+00	driving
47	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 02:47:03.574267+00	driving
48	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 02:47:23.099572+00	transit
49	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 02:47:25.946898+00	transit
50	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	15	2021-03-18 02:48:39.791441+00	transit
51	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	15	2021-03-18 02:48:44.14372+00	transit
52	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	3	2021-03-18 02:49:12.732548+00	walking
53	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	3	2021-03-18 02:56:26.14246+00	walking
54	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 02:56:50.68284+00	driving
55	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:01:00.724823+00	driving
56	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:01:15.455184+00	driving
57	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:03:37.500979+00	driving
58	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:06:55.982894+00	driving
59	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:06:58.621953+00	driving
60	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:07:17.471396+00	driving
61	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:08:30.128601+00	driving
62	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:08:56.301661+00	driving
63	Ryerson	Toronto General	1710	2021-03-18 03:09:22.667503+00	driving
64	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:10:07.898975+00	driving
65	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:11:16.062966+00	driving
66	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:11:39.331608+00	driving
67	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:13:39.652913+00	driving
68	Ryerson	Toronto General	1710	2021-03-18 03:14:16.229119+00	driving
69	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:16:24.303327+00	driving
70	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:16:39.885215+00	driving
71	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:21:04.09677+00	driving
72	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:28:39.539252+00	driving
73	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:29:01.788066+00	driving
74	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:29:26.404807+00	driving
75	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:29:26.418549+00	driving
76	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:29:41.38993+00	driving
77	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:29:57.955643+00	driving
78	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:30:23.415176+00	driving
79	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:31:05.792173+00	driving
80	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:31:17.57634+00	driving
81	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:32:12.352918+00	driving
82	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:32:37.271086+00	driving
83	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:33:02.70996+00	driving
84	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:33:13.314629+00	driving
85	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:33:40.190551+00	driving
86	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:34:00.924597+00	driving
87	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:34:41.243922+00	driving
88	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:35:48.90049+00	driving
89	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:36:02.401618+00	driving
90	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:38:56.06007+00	driving
91	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:39:14.572854+00	driving
92	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:42:05.3559+00	driving
93	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:42:24.027941+00	driving
94	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:43:28.072069+00	driving
95	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:44:16.022392+00	driving
96	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:44:33.393403+00	driving
97	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:44:34.032665+00	driving
98	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 03:44:41.738151+00	driving
99	Ryerson University, Victoria Street, Toronto, ON, Canada	Eaton Centre, Yonge Street, Toronto, ON, Canada	2	2021-03-18 03:50:45.253479+00	driving
100	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General	2	2021-03-18 03:51:03.993053+00	driving
101	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 04:27:00.875095+00	driving
102	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 16:00:46.488729+00	driving
103	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 16:09:36.066106+00	transit
104	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 16:09:47.879311+00	walking
105	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 16:12:59.052129+00	driving
106	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 16:14:07.150567+00	driving
107	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 16:20:35.291368+00	transit
108	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 16:29:32.781712+00	driving
109	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 16:53:32.588548+00	driving
110	Ryerson University, Victoria Street, Toronto, ON, Canada	University of Toronto, King's College Circle, Toronto, ON, Canada	14	2021-03-18 17:04:23.114726+00	transit
111	Ryerson University, Victoria Street, Toronto, ON, Canada	University of Toronto, King's College Circle, Toronto, ON, Canada	18	2021-03-18 17:04:27.301486+00	walking
112	Ryerson University, Victoria Street, Toronto, ON, Canada	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	40	2021-03-18 17:04:39.835469+00	transit
113	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 17:53:05.225699+00	driving
114	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 18:02:53.453378+00	driving
115	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 18:03:10.586746+00	transit
116	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 18:03:12.953935+00	transit
117	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	9	2021-03-18 18:03:15.402206+00	transit
118	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	8	2021-03-18 18:15:24.83882+00	transit
119	Ryerson University, Victoria Street, Toronto, ON, Canada	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	19	2021-03-18 18:42:37.207526+00	driving
120	Ryerson University	Toronto General	2	2021-03-18 18:49:38.366523+00	driving
121	Ryerson University, Victoria Street, Toronto, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	2	2021-03-18 18:49:47.276476+00	driving
122	Ryerson University, Victoria Street, Toronto, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	4	2021-03-18 18:50:43.627746+00	driving
123	Ryerson University, Victoria Street, Toronto, ON, Canada	St. Michael's Hospital, Bond Street, Toronto, ON, Canada	2	2021-03-30 19:47:00.091711+00	driving
124	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	20	2021-03-30 20:23:49.868502+00	driving
125	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	40	2021-03-30 20:28:17.598944+00	transit
126	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	St. Michael's Hospital, Bond Street, Toronto, ON, Canada	41	2021-03-30 20:28:49.709205+00	transit
127	Ryerson University, Victoria Street, Toronto, ON, Canada	St. Joseph's Health Centre, Toronto, The Queensway, Toronto, ON, Canada	49	2021-03-30 20:30:52.507565+00	transit
128	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	39	2021-03-30 20:45:25.724976+00	transit
129	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	39	2021-03-30 20:45:36.122561+00	transit
130	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	39	2021-03-30 20:45:40.308525+00	transit
131	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Ryerson University, Victoria Street, Toronto, ON, Canada	40	2021-03-30 20:49:47.010674+00	transit
132	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	37	2021-03-30 20:50:07.127853+00	transit
133	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 20:51:41.844515+00	transit
134	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 20:52:30.766894+00	transit
135	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	38	2021-03-30 20:53:01.067004+00	transit
136	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 20:53:43.504668+00	transit
137	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 20:55:33.23048+00	transit
138	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Toronto General Hospital, Elizabeth Street, Toronto, ON, Canada	38	2021-03-30 20:58:38.596585+00	transit
139	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 20:59:16.577148+00	transit
140	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 21:00:48.655903+00	transit
141	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 21:01:45.986889+00	transit
142	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 21:03:53.752969+00	transit
143	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 21:05:10.224458+00	transit
144	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	36	2021-03-30 21:06:09.806716+00	transit
145	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	35	2021-03-30 21:07:08.853679+00	transit
146	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	35	2021-03-30 21:10:00.566487+00	transit
147	Kipling Station South Parking Lot, Munster Avenue, Etobicoke, ON, Canada	Mount Sinai Hospital, University Avenue, Toronto, ON, Canada	35	2021-03-30 21:10:40.370273+00	transit
148	Unionville High School, Town Centre Boulevard, Markham, ON, Canada	CF Markville, Highway 7, Markham, ON, Canada	15	2021-03-30 21:11:52.077271+00	transit
149	Unionville High School, Town Centre Boulevard, Markham, ON, Canada	CF Markville, Highway 7, Markham, ON, Canada	20	2021-03-30 21:13:38.814877+00	transit
150	Unionville High School, Town Centre Boulevard, Markham, ON, Canada	Ryerson University, Victoria Street, Toronto, ON, Canada	104	2021-03-30 21:14:51.125022+00	transit
151	Unionville High School, Town Centre Boulevard, Markham, ON, Canada	Ryerson University, Victoria Street, Toronto, ON, Canada	85	2021-03-30 21:20:00.926287+00	transit
152	Unionville High School, Town Centre Boulevard, Markham, ON, Canada	Ryerson University, Victoria Street, Toronto, ON, Canada	85	2021-03-30 21:28:10.626702+00	transit
153	Unionville High School, Town Centre Boulevard, Markham, ON, Canada	CF Markville, Highway 7, Markham, ON, Canada	19	2021-03-30 21:28:43.473481+00	transit
\.


--
-- Data for Name: polls_waittime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.polls_waittime (id, address, wait_time, created) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);


--
-- Name: easy_maps_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.easy_maps_address_id_seq', 1, false);


--
-- Name: polls_traveltime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.polls_traveltime_id_seq', 12, true);


--
-- Name: polls_traveltime_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.polls_traveltime_id_seq1', 153, true);


--
-- Name: polls_waittime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.polls_waittime_id_seq', 1, false);


--
-- Name: polls_waittime_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.polls_waittime_id_seq1', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_maps_address easy_maps_address_address_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_maps_address
    ADD CONSTRAINT easy_maps_address_address_key UNIQUE (address);


--
-- Name: easy_maps_address easy_maps_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.easy_maps_address
    ADD CONSTRAINT easy_maps_address_pkey PRIMARY KEY (id);


--
-- Name: notifyme_traveltime polls_traveltime_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifyme_traveltime
    ADD CONSTRAINT polls_traveltime_pkey PRIMARY KEY (id);


--
-- Name: polls_traveltime polls_traveltime_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.polls_traveltime
    ADD CONSTRAINT polls_traveltime_pkey1 PRIMARY KEY (id);


--
-- Name: notifyme_waittime polls_waittime_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifyme_waittime
    ADD CONSTRAINT polls_waittime_pkey PRIMARY KEY (id);


--
-- Name: polls_waittime polls_waittime_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.polls_waittime
    ADD CONSTRAINT polls_waittime_pkey1 PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_maps_address_address_7f02b933_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX easy_maps_address_address_7f02b933_like ON public.easy_maps_address USING btree (address varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

