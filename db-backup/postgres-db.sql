--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: beedb_apiary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_apiary (
    id integer NOT NULL,
    "apiaryID" character varying(50) NOT NULL,
    descr text,
    beek_id integer NOT NULL,
    address text,
    hazards text,
    latitude numeric(12,7) NOT NULL,
    location text,
    longitude numeric(12,7) NOT NULL,
    "ownerResident" character varying(200),
    "residentPhone" character varying(50)
);


ALTER TABLE public.beedb_apiary OWNER TO postgres;

--
-- Name: beedb_apiary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_apiary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_apiary_id_seq OWNER TO postgres;

--
-- Name: beedb_apiary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_apiary_id_seq OWNED BY public.beedb_apiary.id;


--
-- Name: beedb_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_audit (
    id integer NOT NULL,
    dt timestamp with time zone,
    transaction_cd integer NOT NULL,
    detail text,
    apiary_id integer,
    beek_id integer NOT NULL,
    colony_id integer,
    colony1_id integer,
    transfer_id integer
);


ALTER TABLE public.beedb_audit OWNER TO postgres;

--
-- Name: beedb_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_audit_id_seq OWNER TO postgres;

--
-- Name: beedb_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_audit_id_seq OWNED BY public.beedb_audit.id;


--
-- Name: beedb_colony; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_colony (
    id integer NOT NULL,
    "colonyID" character varying(50) NOT NULL,
    descr text,
    apiary_id integer NOT NULL,
    status character varying(1) NOT NULL,
    notes text,
    "lastAction" timestamp with time zone,
    status_dt timestamp with time zone,
    "queenRight" boolean NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.beedb_colony OWNER TO postgres;

--
-- Name: beedb_colony_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_colony_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_colony_id_seq OWNER TO postgres;

--
-- Name: beedb_colony_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_colony_id_seq OWNED BY public.beedb_colony.id;


--
-- Name: beedb_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_config (
    id integer NOT NULL,
    key character varying(500) NOT NULL,
    "configDt" timestamp with time zone,
    "configValue" double precision,
    "lastUpdate" timestamp with time zone
);


ALTER TABLE public.beedb_config OWNER TO postgres;

--
-- Name: beedb_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_config_id_seq OWNER TO postgres;

--
-- Name: beedb_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_config_id_seq OWNED BY public.beedb_config.id;


--
-- Name: beedb_diary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_diary (
    id integer NOT NULL,
    "createdDt" timestamp with time zone,
    "startDt" timestamp with time zone,
    "dueDt" timestamp with time zone NOT NULL,
    "notifyDt" timestamp with time zone,
    subject character varying(100),
    details text,
    apiary_id integer,
    beek_id integer NOT NULL,
    colony_id integer,
    completed boolean NOT NULL
);


ALTER TABLE public.beedb_diary OWNER TO postgres;

--
-- Name: beedb_diary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_diary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_diary_id_seq OWNER TO postgres;

--
-- Name: beedb_diary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_diary_id_seq OWNED BY public.beedb_diary.id;


--
-- Name: beedb_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_feedback (
    id integer NOT NULL,
    subject character varying(100) NOT NULL,
    detail text,
    "feedbackType" character varying(1) NOT NULL,
    status character varying(1),
    "devComment" text,
    "createdDt" timestamp with time zone NOT NULL,
    "lstStatusDt" timestamp with time zone,
    "lstCommentDt" timestamp with time zone,
    beek_id integer NOT NULL
);


ALTER TABLE public.beedb_feedback OWNER TO postgres;

--
-- Name: beedb_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_feedback_id_seq OWNER TO postgres;

--
-- Name: beedb_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_feedback_id_seq OWNED BY public.beedb_feedback.id;


--
-- Name: beedb_inspection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_inspection (
    id integer NOT NULL,
    dt timestamp with time zone,
    notes text,
    numbers integer NOT NULL,
    colony_id integer NOT NULL,
    disease integer NOT NULL,
    eggs integer NOT NULL,
    queen_seen boolean NOT NULL,
    temper integer NOT NULL,
    varroa integer NOT NULL,
    weight integer NOT NULL,
    size integer
);


ALTER TABLE public.beedb_inspection OWNER TO postgres;

--
-- Name: beedb_inspection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_inspection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_inspection_id_seq OWNER TO postgres;

--
-- Name: beedb_inspection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_inspection_id_seq OWNED BY public.beedb_inspection.id;


--
-- Name: beedb_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_message (
    id integer NOT NULL,
    subject character varying(100) NOT NULL,
    body text,
    processed boolean NOT NULL,
    "createdDt" timestamp with time zone NOT NULL,
    "processedDt" timestamp with time zone,
    beek_id integer NOT NULL,
    html text
);


ALTER TABLE public.beedb_message OWNER TO postgres;

--
-- Name: beedb_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_message_id_seq OWNER TO postgres;

--
-- Name: beedb_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_message_id_seq OWNED BY public.beedb_message.id;


--
-- Name: beedb_picture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_picture (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    img character varying(100) NOT NULL,
    "uploadDt" timestamp with time zone NOT NULL,
    apiary_id integer,
    beek_id integer,
    colony_id integer,
    inspection_id integer
);


ALTER TABLE public.beedb_picture OWNER TO postgres;

--
-- Name: beedb_picture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.beedb_picture ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.beedb_picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: beedb_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_profile (
    id integer NOT NULL,
    "phoneNumber" character varying(50),
    user_id integer NOT NULL,
    "bkRegistration" character varying(10),
    "lastApiary_id" integer,
    address text,
    "inspectDiaryAdd" boolean NOT NULL,
    "inspectHealthIndex" boolean NOT NULL,
    "inspectManualIndex" boolean NOT NULL,
    "inspectPeriodAutumn" integer NOT NULL,
    "inspectPeriodSpring" integer NOT NULL,
    "inspectPeriodSummer" integer NOT NULL,
    "inspectPeriodWinter" integer NOT NULL,
    "commsInspectionReminder" boolean NOT NULL,
    "commsWeeklySummary" boolean NOT NULL,
    "commsLstWeeklyEmail" timestamp with time zone
);


ALTER TABLE public.beedb_profile OWNER TO postgres;

--
-- Name: beedb_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_profile_id_seq OWNER TO postgres;

--
-- Name: beedb_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_profile_id_seq OWNED BY public.beedb_profile.id;


--
-- Name: beedb_sizechoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_sizechoice (
    id integer NOT NULL,
    size integer NOT NULL,
    type character varying(10) NOT NULL,
    value integer NOT NULL,
    text character varying(40) NOT NULL
);


ALTER TABLE public.beedb_sizechoice OWNER TO postgres;

--
-- Name: beedb_sizechoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_sizechoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_sizechoice_id_seq OWNER TO postgres;

--
-- Name: beedb_sizechoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_sizechoice_id_seq OWNED BY public.beedb_sizechoice.id;


--
-- Name: beedb_transfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_transfer (
    id integer NOT NULL,
    dt timestamp with time zone,
    outgoing boolean NOT NULL,
    beek_name character varying(50),
    beek_registration character varying(50),
    beek_email character varying(50),
    beek_phone character varying(50),
    beek_address text,
    notes text,
    cost numeric(8,2),
    colony_id integer,
    transaction integer NOT NULL,
    location character varying(200),
    size integer NOT NULL
);


ALTER TABLE public.beedb_transfer OWNER TO postgres;

--
-- Name: beedb_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_transfer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_transfer_id_seq OWNER TO postgres;

--
-- Name: beedb_transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_transfer_id_seq OWNED BY public.beedb_transfer.id;


--
-- Name: beedb_treatment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_treatment (
    id integer NOT NULL,
    completed boolean NOT NULL,
    "insertDt" timestamp with time zone,
    "removeDt" timestamp with time zone,
    "trNotes" text,
    colony_id integer NOT NULL,
    inspection_id integer,
    "treatmentType_id" integer NOT NULL,
    "postVarroa" integer NOT NULL,
    "preVarroa" integer NOT NULL
);


ALTER TABLE public.beedb_treatment OWNER TO postgres;

--
-- Name: beedb_treatment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_treatment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_treatment_id_seq OWNER TO postgres;

--
-- Name: beedb_treatment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_treatment_id_seq OWNED BY public.beedb_treatment.id;


--
-- Name: beedb_treatmenttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beedb_treatmenttype (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    manufacturer character varying(100) NOT NULL,
    organic boolean NOT NULL,
    "requireRemoval" boolean NOT NULL,
    "daysInHive" integer,
    url character varying(200),
    description text NOT NULL,
    instructions text NOT NULL
);


ALTER TABLE public.beedb_treatmenttype OWNER TO postgres;

--
-- Name: beedb_treatmenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beedb_treatmenttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beedb_treatmenttype_id_seq OWNER TO postgres;

--
-- Name: beedb_treatmenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beedb_treatmenttype_id_seq OWNED BY public.beedb_treatmenttype.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: mailer_dontsendentry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mailer_dontsendentry (
    id bigint NOT NULL,
    to_address character varying(254) NOT NULL,
    when_added timestamp with time zone NOT NULL
);


ALTER TABLE public.mailer_dontsendentry OWNER TO postgres;

--
-- Name: mailer_dontsendentry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mailer_dontsendentry ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mailer_dontsendentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mailer_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mailer_message (
    id bigint NOT NULL,
    message_data text NOT NULL,
    when_added timestamp with time zone NOT NULL,
    priority smallint NOT NULL,
    CONSTRAINT mailer_message_priority_4f7b1370_check CHECK ((priority >= 0))
);


ALTER TABLE public.mailer_message OWNER TO postgres;

--
-- Name: mailer_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mailer_message ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mailer_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mailer_messagelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mailer_messagelog (
    id bigint NOT NULL,
    message_data text NOT NULL,
    when_added timestamp with time zone NOT NULL,
    priority smallint NOT NULL,
    when_attempted timestamp with time zone NOT NULL,
    result character varying(1) NOT NULL,
    log_message text NOT NULL,
    message_id text,
    CONSTRAINT mailer_messagelog_priority_5e712cf3_check CHECK ((priority >= 0))
);


ALTER TABLE public.mailer_messagelog OWNER TO postgres;

--
-- Name: mailer_messagelog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mailer_messagelog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mailer_messagelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: beedb_apiary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_apiary ALTER COLUMN id SET DEFAULT nextval('public.beedb_apiary_id_seq'::regclass);


--
-- Name: beedb_audit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit ALTER COLUMN id SET DEFAULT nextval('public.beedb_audit_id_seq'::regclass);


--
-- Name: beedb_colony id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_colony ALTER COLUMN id SET DEFAULT nextval('public.beedb_colony_id_seq'::regclass);


--
-- Name: beedb_config id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_config ALTER COLUMN id SET DEFAULT nextval('public.beedb_config_id_seq'::regclass);


--
-- Name: beedb_diary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_diary ALTER COLUMN id SET DEFAULT nextval('public.beedb_diary_id_seq'::regclass);


--
-- Name: beedb_feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_feedback ALTER COLUMN id SET DEFAULT nextval('public.beedb_feedback_id_seq'::regclass);


--
-- Name: beedb_inspection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_inspection ALTER COLUMN id SET DEFAULT nextval('public.beedb_inspection_id_seq'::regclass);


--
-- Name: beedb_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_message ALTER COLUMN id SET DEFAULT nextval('public.beedb_message_id_seq'::regclass);


--
-- Name: beedb_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_profile ALTER COLUMN id SET DEFAULT nextval('public.beedb_profile_id_seq'::regclass);


--
-- Name: beedb_sizechoice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_sizechoice ALTER COLUMN id SET DEFAULT nextval('public.beedb_sizechoice_id_seq'::regclass);


--
-- Name: beedb_transfer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_transfer ALTER COLUMN id SET DEFAULT nextval('public.beedb_transfer_id_seq'::regclass);


--
-- Name: beedb_treatment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment ALTER COLUMN id SET DEFAULT nextval('public.beedb_treatment_id_seq'::regclass);


--
-- Name: beedb_treatmenttype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatmenttype ALTER COLUMN id SET DEFAULT nextval('public.beedb_treatmenttype_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
25	Can add profile	7	add_profile
26	Can change profile	7	change_profile
27	Can delete profile	7	delete_profile
28	Can view profile	7	view_profile
29	Can add apiary	8	add_apiary
30	Can change apiary	8	change_apiary
31	Can delete apiary	8	delete_apiary
32	Can view apiary	8	view_apiary
33	Can add colony	9	add_colony
34	Can change colony	9	change_colony
35	Can delete colony	9	delete_colony
36	Can view colony	9	view_colony
37	Can add inspection	10	add_inspection
38	Can change inspection	10	change_inspection
39	Can delete inspection	10	delete_inspection
40	Can view inspection	10	view_inspection
41	Can add transfer	11	add_transfer
42	Can change transfer	11	change_transfer
43	Can delete transfer	11	delete_transfer
44	Can view transfer	11	view_transfer
45	Can add audit	12	add_audit
46	Can change audit	12	change_audit
47	Can delete audit	12	delete_audit
48	Can view audit	12	view_audit
49	Can add diary	13	add_diary
50	Can change diary	13	change_diary
51	Can delete diary	13	delete_diary
52	Can view diary	13	view_diary
53	Can add config	14	add_config
54	Can change config	14	change_config
55	Can delete config	14	delete_config
56	Can view config	14	view_config
57	Can add message	15	add_message
58	Can change message	15	change_message
59	Can delete message	15	delete_message
60	Can view message	15	view_message
61	Can add feedback	16	add_feedback
62	Can change feedback	16	change_feedback
63	Can delete feedback	16	delete_feedback
64	Can view feedback	16	view_feedback
65	Can add treatment type	17	add_treatmenttype
66	Can change treatment type	17	change_treatmenttype
67	Can delete treatment type	17	delete_treatmenttype
68	Can view treatment type	17	view_treatmenttype
69	Can add treatment	18	add_treatment
70	Can change treatment	18	change_treatment
71	Can delete treatment	18	delete_treatment
72	Can view treatment	18	view_treatment
73	Can add size choice	19	add_sizechoice
74	Can change size choice	19	change_sizechoice
75	Can delete size choice	19	delete_sizechoice
76	Can view size choice	19	view_sizechoice
77	Can add Token	20	add_token
78	Can change Token	20	change_token
79	Can delete Token	20	delete_token
80	Can view Token	20	view_token
81	Can add token	21	add_tokenproxy
82	Can change token	21	change_tokenproxy
83	Can delete token	21	delete_tokenproxy
84	Can view token	21	view_tokenproxy
85	Can add don't send entry	22	add_dontsendentry
86	Can change don't send entry	22	change_dontsendentry
87	Can delete don't send entry	22	delete_dontsendentry
88	Can view don't send entry	22	view_dontsendentry
89	Can add message	23	add_message
90	Can change message	23	change_message
91	Can delete message	23	delete_message
92	Can view message	23	view_message
93	Can add message log	24	add_messagelog
94	Can change message log	24	change_messagelog
95	Can delete message log	24	delete_messagelog
96	Can view message log	24	view_messagelog
97	Can add image	25	add_image
98	Can change image	25	change_image
99	Can delete image	25	delete_image
100	Can view image	25	view_image
101	Can add picture	26	add_picture
102	Can change picture	26	change_picture
103	Can delete picture	26	delete_picture
104	Can view picture	26	view_picture
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$izdMa9UfNDOwjejiiFBs3q$yCJH0JTPcf09l1raBY1yKc9Ou2xRc0ulLdtSXD8icHE=	2022-10-03 20:06:33.583355+00	t	admin1			jim@west.kiwi	t	t	2022-10-03 19:57:31.781069+00
5	pbkdf2_sha256$390000$ZsZtv49T7gmJVlZu3dlpwS$bZjNZb4Ze64cpJwC0pbc3V08/NaYvroaAy4A6/p5jfk=	2022-11-01 01:46:02.23714+00	f	surf@west.net.nz			surf@west.net.nz	f	t	2022-10-09 00:54:28.208296+00
4	pbkdf2_sha256$600000$mTNtfYxyDrXioPZITJQWAm$n9hfEGzg9/9ZoGTfxxlAWVRkAD3c36VHYFAZDHeGAC8=	2023-10-25 06:54:46.956738+00	t	jim	Jim		jim@west.net.nz	t	t	2022-10-03 20:08:12+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: beedb_apiary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_apiary (id, "apiaryID", descr, beek_id, address, hazards, latitude, location, longitude, "ownerResident", "residentPhone") FROM stdin;
2	Cromwell		5	\N	\N	0.0000000	\N	0.0000000	\N	\N
1	Glenfield		4			-36.7818900		174.7360300	\N	\N
3	Browns Bay	Test apiary in BB	4		Public	-36.7131300	By memorial	174.7497000	Jimbo	021333444
\.


--
-- Data for Name: beedb_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_audit (id, dt, transaction_cd, detail, apiary_id, beek_id, colony_id, colony1_id, transfer_id) FROM stdin;
1	2022-10-03 20:11:49.563126+00	3	Swarm caught at dsf	1	4	1	\N	\N
2	2022-10-03 20:12:04.643809+00	4	New colony entered 	1	4	2	\N	\N
3	2022-10-04 22:49:06.311371+00	4	Colony purchased from John	1	4	3	\N	\N
4	2022-10-09 01:07:17.792045+00	4	New colony entered 	2	5	4	\N	\N
5	2022-10-09 01:07:31.50018+00	4	New colony entered 	2	5	5	\N	\N
6	2022-11-14 19:45:44.477098+00	4	New colony entered 	3	4	6	\N	\N
7	2022-11-14 19:46:12.98199+00	3	Swarm caught at Laft	3	4	7	\N	\N
8	2022-11-16 00:32:21.216022+00	7	Colony G1 moved FROM Glenfield TO Browns Bay	3	4	1	\N	\N
9	2022-11-16 00:34:24.499065+00	6	Colony G1 has been combined with B1 	3	4	1	6	\N
10	2022-11-16 00:42:42.031439+00	4	Colony purchased from Bruce	1	4	8	\N	8
11	2022-11-16 01:07:29.065866+00	3	Swarm caught at Rothsay bay	3	4	9	\N	9
12	2022-11-16 01:18:14.134936+00	1	Colony sold to Basil 	\N	4	9	\N	\N
13	2022-11-16 01:24:35.697221+00	2	Colony B5 split from B1 	3	4	10	\N	\N
14	2022-11-16 01:27:57.749975+00	2	Colony B6 split from B1 	3	4	11	6	12
15	2022-11-16 01:31:24+00	5	New colony entered	1	4	12	\N	13
18	2022-11-16 01:38:39.918065+00	6	Colony G3 has been combined with G4 	1	4	3	8	\N
19	2022-11-16 01:39:28.293022+00	7	Colony B2 moved FROM Browns Bay TO Glenfield	1	4	7	\N	\N
20	2022-11-16 03:48:13.088813+00	8	Colony GG1 appears to have absconded. Notes: Just buggered off	\N	4	12	\N	\N
21	2022-12-16 21:15:24.127887+00	3	Swarm caught at lkj	3	4	13	\N	14
\.


--
-- Data for Name: beedb_colony; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_colony (id, "colonyID", descr, apiary_id, status, notes, "lastAction", status_dt, "queenRight", size) FROM stdin;
2	G2	Second	1	C	\N	2022-11-01 01:41:12.793775+00	2022-10-03 20:12:04.637489+00	t	3
5	Crom2		2	A	Clueless	2022-11-01 21:58:03.960071+00	2022-11-01 21:58:03.960066+00	t	3
4	Crom1	!st Hive	2	C	\N	2022-11-01 22:01:06.738037+00	2022-10-09 01:07:17.783734+00	t	4
6	B1		3	C	\N	2022-11-14 19:45:44.466831+00	2022-11-14 19:45:44.466822+00	t	3
1	G1	Swarm col	3	M	\N	2022-11-16 00:32:21.226902+00	2022-10-03 20:11:49.553837+00	t	3
8	G4	Yellow colony	1	C	\N	2022-11-16 00:42:42.020998+00	2022-11-16 00:42:42.020986+00	t	3
9	B4	From swarm call	3	S	\N	2022-11-16 01:07:29.058796+00	2022-11-16 01:07:29.05879+00	t	3
10	B5	A split from skjhfdcskjh B1	3	A	Just buggered off	2022-11-16 01:27:23.878972+00	2022-11-16 01:27:23.878966+00	t	3
11	B6	Split from B1 kldkjsfkjhcsf	3	C	\N	2022-11-16 01:27:57.742702+00	2022-11-16 01:27:57.742695+00	t	3
3	G3	Purchase colony	1	M		2022-10-04 22:49:06+00	2022-10-04 22:49:06+00	t	3
7	B2	Swarm	1	C	\N	2022-11-16 01:39:28.299595+00	2022-11-14 19:46:12.971063+00	t	3
12	GG1	Initial creation to test	1	A	Just buggered off	2022-11-16 03:48:13.084067+00	2022-11-16 03:48:13.084061+00	t	3
13	kjlhlk		3	C	\N	2022-12-16 21:15:24.111118+00	2022-12-16 21:15:24.11111+00	t	3
\.


--
-- Data for Name: beedb_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_config (id, key, "configDt", "configValue", "lastUpdate") FROM stdin;
1	lstDaily	2022-10-03 19:53:54.108212+00	8	2022-10-03 19:53:54.108219+00
2	lstWeekly	2022-10-03 19:53:54.114127+00	8	2022-10-03 19:53:54.114133+00
3	commsWeeklyDay	2022-11-18 19:22:14.06504+00	4	2022-10-03 19:53:54.125404+00
\.


--
-- Data for Name: beedb_diary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_diary (id, "createdDt", "startDt", "dueDt", "notifyDt", subject, details, apiary_id, beek_id, colony_id, completed) FROM stdin;
1	2022-10-09 01:08:09.873959+00	\N	2022-10-15 11:00:00+00	\N	Check soon		\N	5	5	f
3	2022-10-15 03:05:34.898236+00	\N	2022-10-21 11:00:00+00	\N	reminder 1		2	5	4	f
5	2022-10-31 03:33:50.66961+00	\N	2022-11-06 11:00:00+00	\N	Check if alive	cdzscd	\N	4	3	t
6	2022-10-31 03:39:45.078263+00	\N	2022-11-06 11:00:00+00	\N	Check for life	Help...	\N	4	3	f
7	2022-10-31 03:43:43+00	\N	2022-11-06 11:00:00+00	\N	Check 3	Reminder note	\N	4	3	f
8	2022-10-31 19:02:32.008944+00	\N	2022-11-06 11:00:00+00	\N	iuy		\N	4	2	t
9	2022-10-31 19:15:08.258819+00	\N	2022-11-06 11:00:00+00	\N	rem 1	rem com	\N	4	2	t
10	2022-10-31 22:04:04.332413+00	\N	2022-11-29 11:00:00+00	\N	rem 14	rem 14 com	\N	4	2	t
15	2022-10-31 22:38:37.17702+00	\N	2022-11-03 11:00:00+00	\N	bcvx	bvcxbvcxv	\N	4	2	t
14	2022-10-31 22:38:07.07622+00	\N	2022-11-03 11:00:00+00	\N	bcvx	bvcxbvcxv	\N	4	2	t
13	2022-10-31 22:37:06.136406+00	\N	2022-11-03 11:00:00+00	\N	bcvx	bvcxbvcxv	\N	4	2	t
12	2022-10-31 22:33:50.775164+00	\N	2022-11-03 11:00:00+00	\N	bcvx	bvcxbvcxv	\N	4	2	t
11	2022-10-31 22:14:48.765622+00	\N	2022-10-31 11:00:00+00	\N	gfs	sfdg	\N	4	2	t
16	2022-11-01 01:46:58.855364+00	\N	2022-11-22 11:00:00+00	\N	Bring sugar shake	adas	\N	5	4	f
4	2022-10-15 21:58:12.975491+00	\N	2022-10-21 11:00:00+00	\N	Look again for Q		\N	4	2	t
17	2022-11-04 00:24:40.880922+00	\N	2022-11-09 11:00:00+00	\N	Re-inspact		\N	4	2	f
2	2022-10-12 21:56:12.686022+00	\N	2022-10-18 11:00:00+00	\N	Remove bayvarol		\N	4	1	t
18	2022-11-16 00:44:41.327561+00	\N	2022-11-22 11:00:00+00	\N	Bring second super	Possibly needed	\N	4	8	f
19	2022-12-16 21:18:46.957406+00	\N	2022-12-23 11:00:00+00	\N	iugy		\N	4	11	t
\.


--
-- Data for Name: beedb_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_feedback (id, subject, detail, "feedbackType", status, "devComment", "createdDt", "lstStatusDt", "lstCommentDt", beek_id) FROM stdin;
2	fb2	sfgfsgd	F	N	\N	2022-11-17 05:42:25.96334+00	\N	\N	4
1	fb1	sfsdfd	F	I	adm fb	2022-11-17 05:34:18.209641+00	2022-11-17 19:11:46.180165+00	2022-11-17 05:35:41.710629+00	4
\.


--
-- Data for Name: beedb_inspection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_inspection (id, dt, notes, numbers, colony_id, disease, eggs, queen_seen, temper, varroa, weight, size) FROM stdin;
2	2022-10-08 11:00:00+00		4	5	0	4	f	0	0	3	3
3	2022-10-12 11:00:00+00	OK	1	1	0	0	t	0	0	0	3
1	2022-10-08 11:00:00+00	Blah	1	4	0	1	t	0	0	1	3
4	2022-10-15 11:00:00+00	General inspection	0	2	0	0	f	0	0	0	3
5	2022-10-27 11:00:00+00		1	3	0	0	t	0	2	0	3
6	2022-10-27 11:00:00+00		2	3	3	1	t	5	3	1	3
7	2022-10-30 11:00:00+00	Hoping	4	3	0	3	t	1	4	1	3
8	2022-10-30 11:00:00+00	Just trying	4	3	3	4	t	5	4	4	3
9	2022-10-30 11:00:00+00	Try OA	4	3	3	4	t	5	4	5	3
10	2022-10-23 11:00:00+00	Treatment note	4	3	3	4	t	5	4	4	3
11	2022-10-03 11:00:00+00	Treatment note	3	3	0	0	f	0	3	0	3
12	2022-10-30 11:00:00+00	fb	0	3	0	0	f	0	0	0	3
27	2022-10-31 11:00:00+00	tr 11	0	2	5	1	t	0	2	0	3
28	2022-10-30 11:00:00+00	ins 14	1	2	1	1	t	1	1	1	3
29	2022-10-31 11:00:00+00	Com 15	1	2	0	0	t	0	2	0	3
30	2022-10-31 11:00:00+00	xcvb	0	2	0	0	t	0	2	0	3
34	2022-10-31 11:00:00+00	I 1	1	2	0	0	t	0	5	0	3
35	2022-10-31 11:00:00+00	All good	1	4	1	1	t	1	1	1	3
37	2022-11-04 11:00:00+00	fhg	0	3	0	1	f	0	0	2	3
36	2022-11-03 11:00:00+00	Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr	4	2	0	0	f	0	0	0	3
38	2022-11-15 11:00:00+00	OK for a start	2	8	3	2	f	3	3	3	3
39	2022-12-16 11:00:00+00	yctfdudx	2	11	0	2	t	5	1	1	3
\.


--
-- Data for Name: beedb_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_message (id, subject, body, processed, "createdDt", "processedDt", beek_id, html) FROM stdin;
2	Action Required to Complete the Account Creation on the Bee Database system	Hello surf@west.net.nz!\n\nTo confirm your registration, visit the following link:\n\nhttp://localhost:8005/beedb/activate/(NQ%5B0-9A-Za-z_%5C-%5D+)/(bd15as-7a10da63716731295320ef0146c0fe38%5B0-9A-Za-z%5D%7B1,13%7D-%5B0-9A-Za-z%5D%7B1,20%7D)/\n\nWelcome to Beedb	t	2022-10-09 00:54:28.534189+00	2022-10-09 01:06:01.871733+00	5	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nActivation confirmation\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n\n  <p>Hello!</p>\n\n  <h1>Confirm your email address</h1>\n\n  <p>We just need to confirm that  is your email address. Click below to confirm.</p>\n\n  <a class = "maillink" href="http://localhost:8005/beedb/activate/(NQ%5B0-9A-Za-z_%5C-%5D+)/(bd15as-7a10da63716731295320ef0146c0fe38%5B0-9A-Za-z%5D%7B1,13%7D-%5B0-9A-Za-z%5D%7B1,20%7D)/">Confirm address</a>\n\n  <p class="explain">If you have received this message in error it probably means someone has tried to register on our system as you. Don't worry, just ignore this email and the registration will be invalidated.</p>\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <a href="http://beedb.west.net.nz">Your bee and beehive management system</a>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
3	Weekly summary from Bee-db	\N	t	2023-02-15 02:54:15.557716+00	2023-02-15 03:27:56.731131+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
4	Weekly summary from Bee-db	\N	t	2023-02-15 03:15:07.663332+00	2023-02-15 03:28:00.394926+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
5	Weekly summary from Bee-db	\N	t	2023-02-15 03:16:46.956708+00	2023-02-15 03:28:04.253949+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
6	Weekly summary from Bee-db	\N	t	2023-02-15 03:20:35.939609+00	2023-02-15 03:28:07.925287+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
7	Weekly summary from Bee-db	\N	t	2023-02-15 03:22:03.98138+00	2023-02-15 03:28:11.612088+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
8	Weekly summary from Bee-db	\N	t	2023-02-15 03:23:40.59878+00	2023-02-15 03:28:15.304721+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
9	Weekly summary from Bee-db	\N	t	2023-02-15 03:26:57.918631+00	2023-02-15 03:28:18.999398+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
10	Weekly summary from Bee-db	\N	t	2023-02-15 03:27:51.772634+00	2023-02-15 03:28:22.756197+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
11	Weekly summary from Bee-db	\N	t	2023-02-15 03:29:46.58439+00	2023-02-15 03:29:51.44481+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
12	Weekly summary from Bee-db	\N	t	2023-02-15 03:32:46.357196+00	2023-02-15 03:32:51.630364+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
13	Weekly summary from Bee-db	\N	t	2023-04-29 23:11:36.764945+00	2023-04-29 23:11:43.372596+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
14	Weekly summary from Bee-db	\N	t	2023-04-30 03:21:26.265973+00	2023-04-30 03:21:32.667243+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
15	Weekly summary from Bee-db	\N	t	2023-06-07 01:42:56.703521+00	2023-08-06 02:29:08.208947+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
16	Weekly summary from Bee-db	\N	t	2023-06-12 04:08:52.521128+00	2023-08-06 02:29:12.50104+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
17	Weekly summary from Bee-db	\N	t	2023-08-06 02:29:02.156348+00	2023-08-06 02:29:16.828333+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
18	Weekly summary from Bee-db	\N	t	2023-10-25 06:53:25.857571+00	2023-10-25 06:53:32.884208+00	4	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/3">Browns Bay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/6">B1</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/11">B6</a> - Split from B1 kldkjsfkjhcsf\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/39">Sat 17 Dec 2022</a>\n                </div>\n                <div class="indent2">Comment: yctfdudx</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/13">kjlhlk</a> - \n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="http://localhost:8005/beedb/apiary/1">Glenfield</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/7">B2</a> - Swarm\n              \n                <div class="indent">This colony has no inspection records</div>\n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/2">G2</a> - Second\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/36">Fri 04 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: Colony id dire straights ffghdf gfhd hgf hgff hgf gfhd hgf gf hgf hgf hgf hgfd hgf hgf\r\n* fjkfdgjkhgfdskjhgfdskhv\r\n * dfgfds\r\n* adjmfdkjhgdfr</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/17">Re-inspact</a> - Due by: Thu 10 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="http://localhost:8005/beedb/colony/8">G4</a> - Yellow colony\n              \n                <div class="indent">\n                  Last inspection: <a href="http://localhost:8005/beedb/inspection/38">Wed 16 Nov 2022</a>\n                </div>\n                <div class="indent2">Comment: OK for a start</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="http://localhost:8005/beedb/diary/18">Bring second super</a> - Due by: Wed 23 Nov 2022\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="http://localhost:8005/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="http://localhost:8005/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
\.


--
-- Data for Name: beedb_picture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_picture (id, title, img, "uploadDt", apiary_id, beek_id, colony_id, inspection_id) FROM stdin;
1	dork	images/4/3/passport3.jpg	2023-02-14 22:02:17.282949+00	3	4	\N	\N
2	wine	images/4/3/IMG_20220324_134227.jpg	2023-02-14 22:04:42.462983+00	3	4	\N	\N
3	test	images/4/1/2019_0103_080759_007.JPG	2023-04-29 23:13:55.254983+00	1	4	\N	\N
4	yyy	images/4/1/8/IMG-20220315-WA0039.jpg	2023-04-30 03:26:19.026431+00	1	4	8	\N
5	ttt	images/4/1/8/IMG-20220314-WA0004.jpg	2023-04-30 03:29:08.569993+00	1	4	8	\N
\.


--
-- Data for Name: beedb_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_profile (id, "phoneNumber", user_id, "bkRegistration", "lastApiary_id", address, "inspectDiaryAdd", "inspectHealthIndex", "inspectManualIndex", "inspectPeriodAutumn", "inspectPeriodSpring", "inspectPeriodSummer", "inspectPeriodWinter", "commsInspectionReminder", "commsWeeklySummary", "commsLstWeeklyEmail") FROM stdin;
1	\N	1	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
6	\N	5	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
5	\N	4	\N	\N		t	t	f	14	7	14	60	f	t	\N
\.


--
-- Data for Name: beedb_sizechoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_sizechoice (id, size, type, value, text) FROM stdin;
17	3	Number	4	Very few bees
18	3	Number	5	No bees
19	4	Number	0	Not Recorded
20	4	Number	1	Most frames with bees
21	4	Number	2	8 or more frames with bees
22	4	Number	3	Only a few frames with bees
23	4	Number	4	Very few bees
24	4	Number	5	No bees
25	5	Number	0	Not Recorded
26	5	Number	1	20 or more frames with bees
27	5	Number	2	10 or more frames with bees
28	5	Number	3	Only a few frames with bees
29	5	Number	4	Very few bees
30	5	Number	5	No bees
31	1	Weight	0	Not Recorded
32	1	Weight	1	Good honey stores
33	1	Weight	2	Some stored honey
34	1	Weight	3	Some nectar
35	1	Weight	4	A little nectar
36	1	Weight	5	No stores
37	2	Weight	0	Not Recorded
38	2	Weight	1	Good honey stores
39	2	Weight	2	Some stored honey
40	2	Weight	3	Some nectar
41	2	Weight	4	A little nectar
42	2	Weight	5	No stores
43	3	Weight	0	Not Recorded
44	3	Weight	1	10 kg or more
45	3	Weight	2	5 - 10 kg
1	1	Number	0	Not Recorded
2	1	Number	1	Bees on all frames
3	1	Number	2	Good bee numbers
4	1	Number	3	A frame of bees
5	1	Number	4	Very few bees
6	1	Number	5	No bees
7	2	Number	0	Not Recorded
8	2	Number	1	Bees on all frames
9	2	Number	2	Good bee numbers
10	2	Number	3	A single frame of bees
11	2	Number	4	Very few bees
12	2	Number	5	No bees
13	3	Number	0	Not Recorded
14	3	Number	1	Bees on all frames
15	3	Number	2	Bees on most frames
46	3	Weight	3	A few frames with honey/nectar
47	3	Weight	4	A bit of nectar/honey
48	3	Weight	5	No stores
49	4	Weight	0	Not Recorded
50	4	Weight	1	20kg or more honey
51	4	Weight	2	10 - 20 kg honey
52	4	Weight	3	Honey on 5 or more frames
53	4	Weight	4	Not much honey/nectar
54	4	Weight	5	No stores
55	5	Weight	0	Not Recorded
56	5	Weight	1	20kg or more honey
57	5	Weight	2	10 - 20 kg honey
58	5	Weight	3	Honey on 5 or more frames
59	5	Weight	4	Not much honey/nectar
60	5	Weight	5	No stores
16	3	Number	3	Only a few frames with bees
\.


--
-- Data for Name: beedb_transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_transfer (id, dt, outgoing, beek_name, beek_registration, beek_email, beek_phone, beek_address, notes, cost, colony_id, transaction, location, size) FROM stdin;
2	2022-10-03 20:12:04.640843+00	t	\N	\N	\N	\N	\N		\N	2	4	\N	3
3	2022-10-03 11:00:00+00	t	John	A2211	john@west.net.nz	02102334455	676 jhgwjh		50.00	3	2	\N	2
4	2022-10-09 01:07:17.788279+00	t	\N	\N	\N	\N	\N		\N	4	4	\N	3
5	2022-10-09 01:07:31.496803+00	t	\N	\N	\N	\N	\N		\N	5	4	\N	3
6	2022-11-14 19:45:44.472923+00	t	\N	\N	\N	\N	\N		\N	6	4	\N	2
7	2022-11-13 11:00:00+00	t	\N	\N	\N	\N	\N		\N	7	3	Laft	1
1	2022-10-02 11:00:00+00	t	ertre	reew	ertt@gmail.com	fdg45643565346	fgdhd\r\nhgjytu	Test buy	1.00	1	3	dsf	1
8	2022-11-15 11:00:00+00	t	Bruce	A1234	bruce@wewewe.com	0212344556	Unknown	Nice deal	20.00	8	2	\N	3
9	2022-11-15 11:00:00+00	t	\N	\N	\N	\N	\N	Easy swarm to collect	\N	9	3	Rothsay bay	2
10	2022-11-15 11:00:00+00	t	Basil	Y6655	basil@trewrew.com	021466722	24 hjgfs\r\nhgsa\r\njhgdas 0099	Just sell it	100.00	9	1	\N	0
11	2022-11-16 01:24:35.694013+00	t	\N	\N	\N	\N	\N	To prevent swarming	\N	10	5	\N	3
12	2022-11-16 01:27:57.746286+00	t	\N	\N	\N	\N	\N	ewwb  jkn jknb jbk bj jb jb,j kjkb jbk jk jk jk jk jk njk	\N	11	5	\N	3
13	2022-11-16 01:31:24.241932+00	t	\N	\N	\N	\N	\N	blah hhsdcjcdflkn kj juk hjkl	\N	12	4	\N	3
14	2022-12-15 11:00:00+00	t	\N	\N	\N	\N	\N		\N	13	3	lkj	1
\.


--
-- Data for Name: beedb_treatment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_treatment (id, completed, "insertDt", "removeDt", "trNotes", colony_id, inspection_id, "treatmentType_id", "postVarroa", "preVarroa") FROM stdin;
6	f	2022-10-31 11:00:00+00	2022-12-22 11:00:00+00	bcvb	2	\N	1	0	2
7	t	2022-10-31 11:00:00+00	2022-10-31 11:00:00+00	OA applied	2	\N	3	0	5
8	t	2022-10-31 11:00:00+00	2022-10-31 11:00:00+00	OAV done	4	\N	3	0	1
10	t	2022-10-31 11:00:00+00	2022-10-31 11:00:00+00	OA Applied	4	\N	3	0	4
11	f	2022-10-31 11:00:00+00	2022-12-22 11:00:00+00	BV added	4	\N	1	0	3
13	f	2022-11-01 11:00:00+00	2022-11-29 11:00:00+00	Strips added	4	\N	2	0	3
14	t	2022-11-01 11:00:00+00	2022-12-24 11:00:00+00	All done	4	\N	1	1	4
12	f	2022-09-05 12:00:00+00	2022-10-27 11:00:00+00	BV added	4	\N	1	0	3
15	t	2022-11-03 11:00:00+00	2022-11-03 11:00:00+00		2	\N	3	0	0
17	t	2022-12-16 11:00:00+00	2023-02-06 11:00:00+00	fyfd	11	\N	1	1	1
16	t	2022-11-15 11:00:00+00	2022-12-13 11:00:00+00	Pro-active treatment	8	\N	2	0	0
\.


--
-- Data for Name: beedb_treatmenttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_treatmenttype (id, name, manufacturer, organic, "requireRemoval", "daysInHive", url, description, instructions) FROM stdin;
1	Bayvarol	Bayer	f	t	52	https://resources.bayer.com.au/usr/ProductAdmin/upload/msds/file2917.pdf	Plastic strips with Flumethrin as the active ingredient	4 strips per brood box (10 frames).
2	Glycerine/oxalic acid cardboard strips	Home made	t	t	28	https://hhh.west.net	Cardboard soaked in a glycerin & oxalic acid solution	Place 4 stips per brood box (10 frames) bent over a frame in a staple formnation
3	Oxalic acid vapourisation	N/A	t	f	\N	\N	OA vapourised in the hive using heat	Just do it
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-10-03 20:06:54.087611+00	2	jim@west.net.nz	3		4	1
2	2022-10-03 20:08:12.301224+00	4	jim	1	[{"added": {}}]	4	1
3	2022-10-03 20:08:37.203655+00	4	jim	2	[{"changed": {"fields": ["First name", "Email address", "Staff status", "Superuser status"]}}]	4	1
4	2022-10-15 21:52:02.654733+00	1	Bayvarol	1	[{"added": {}}]	17	4
5	2022-10-15 21:54:15.287914+00	2	Glycerine/oxalic acid cardboard strips	1	[{"added": {}}]	17	4
6	2022-10-26 00:21:03.917796+00	3	Oxalic acid vapourisation	1	[{"added": {}}]	17	4
7	2022-10-31 03:44:26.096097+00	7	Beek: jim, Subject: Check 3	2	[]	13	4
8	2022-10-31 03:44:48.140084+00	5	Bayvarol in G2	3		18	4
9	2022-10-31 03:44:48.14345+00	4	Glycerine/oxalic acid cardboard strips in G3	3		18	4
10	2022-10-31 03:44:48.146566+00	3	Oxalic acid vapourisation in G3	3		18	4
11	2022-10-31 03:44:48.149558+00	2	Bayvarol in G3	3		18	4
12	2022-10-31 03:44:48.152616+00	1	Glycerine/oxalic acid cardboard strips in G2	3		18	4
13	2022-10-31 21:23:23.830981+00	22	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 83.3	3		10	4
14	2022-10-31 21:23:23.836633+00	21	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 33.3	3		10	4
15	2022-10-31 21:23:23.839342+00	20	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 61.5	3		10	4
16	2022-10-31 21:23:23.842222+00	19	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 63.6	3		10	4
17	2022-10-31 21:23:23.845245+00	18	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 33.3	3		10	4
18	2022-10-31 21:23:23.849497+00	17	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 70.0	3		10	4
19	2022-10-31 21:23:23.852876+00	16	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 83.3	3		10	4
20	2022-10-31 21:23:23.855713+00	15	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 83.3	3		10	4
21	2022-10-31 21:23:23.858498+00	14	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 83.3	3		10	4
22	2022-10-31 21:23:23.861062+00	13	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 66.7	3		10	4
23	2022-10-31 21:44:53.016691+00	25	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 66.7	3		10	4
24	2022-10-31 21:44:53.02033+00	24	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 46.2	3		10	4
25	2022-10-31 21:44:53.023164+00	23	Date: 2022-10-31 11:00:00+00:00, Colony: G2, health: 89.3	3		10	4
26	2022-11-16 00:40:26.342769+00	1	Colony: G1	2	[{"changed": {"fields": ["Beek name", "Beek registration", "Beek email", "Beek phone", "Beek address", "Notes", "Cost"]}}]	11	4
27	2022-11-16 01:32:55.728823+00	15	Date: 2022-11-16 14:31:24+13:00, beek: jim, Col: GG1, Tr code: 5 	2	[{"changed": {"fields": ["Transaction cd", "Detail"]}}]	12	4
28	2022-11-16 01:38:04.966576+00	3	G3	2	[{"changed": {"fields": ["Status"]}}]	9	4
29	2022-11-16 01:38:18.572012+00	17	Date: 2022-11-16 01:36:16.781579+00:00, beek: jim, Col: G3, Tr code: 6 	3		12	4
30	2022-11-16 01:38:18.576434+00	16	Date: 2022-11-16 01:36:07.962952+00:00, beek: jim, Col: G3, Tr code: 6 	3		12	4
31	2022-11-20 17:44:47.498339+00	1	Title: Test1, uploaded 2022-11-21 06:44:22+13:00	1	[{"added": {}}]	25	4
32	2022-11-20 17:45:56.680132+00	1	Title: Test1, uploaded 2022-11-21 06:44:22+13:00	2	[{"changed": {"fields": ["Apiary"]}}]	25	4
33	2023-02-14 01:15:31.272125+00	2	Title: www, uploaded 2023-02-14 13:58:39+13:00	2	[{"changed": {"fields": ["Beek", "Apiary"]}}]	25	4
34	2023-02-15 02:53:47.148459+00	5	jim	2	[{"changed": {"fields": ["Do you want weekly summary emails?"]}}]	7	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	beedb	profile
8	beedb	apiary
9	beedb	colony
10	beedb	inspection
11	beedb	transfer
12	beedb	audit
13	beedb	diary
14	beedb	config
15	beedb	message
16	beedb	feedback
17	beedb	treatmenttype
18	beedb	treatment
19	beedb	sizechoice
20	authtoken	token
21	authtoken	tokenproxy
22	mailer	dontsendentry
23	mailer	message
24	mailer	messagelog
25	beedb	image
26	beedb	picture
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-10-03 19:53:27.165338+00
2	auth	0001_initial	2022-10-03 19:53:27.312019+00
3	admin	0001_initial	2022-10-03 19:53:27.354644+00
4	admin	0002_logentry_remove_auto_add	2022-10-03 19:53:27.369103+00
5	admin	0003_logentry_add_action_flag_choices	2022-10-03 19:53:27.380161+00
6	contenttypes	0002_remove_content_type_name	2022-10-03 19:53:27.41293+00
7	auth	0002_alter_permission_name_max_length	2022-10-03 19:53:27.434596+00
8	auth	0003_alter_user_email_max_length	2022-10-03 19:53:27.452984+00
9	auth	0004_alter_user_username_opts	2022-10-03 19:53:27.467916+00
10	auth	0005_alter_user_last_login_null	2022-10-03 19:53:27.485485+00
11	auth	0006_require_contenttypes_0002	2022-10-03 19:53:27.490663+00
12	auth	0007_alter_validators_add_error_messages	2022-10-03 19:53:27.511943+00
13	auth	0008_alter_user_username_max_length	2022-10-03 19:53:27.54305+00
14	auth	0009_alter_user_last_name_max_length	2022-10-03 19:53:27.572196+00
15	auth	0010_alter_group_name_max_length	2022-10-03 19:53:27.598063+00
16	auth	0011_update_proxy_permissions	2022-10-03 19:53:27.627186+00
17	auth	0012_alter_user_first_name_max_length	2022-10-03 19:53:27.654719+00
18	beedb	0001_initial	2022-10-03 19:53:27.730893+00
19	beedb	0002_auto_20200816_1659	2022-10-03 19:53:27.762417+00
20	beedb	0003_auto_20200816_2028	2022-10-03 19:53:27.850951+00
21	beedb	0004_auto_20200816_2032	2022-10-03 19:53:27.858457+00
22	beedb	0005_auto_20200816_2052	2022-10-03 19:53:27.893015+00
23	beedb	0006_auto_20200816_2055	2022-10-03 19:53:27.91767+00
24	beedb	0007_auto_20200816_2056	2022-10-03 19:53:27.95604+00
25	beedb	0008_auto_20200816_2058	2022-10-03 19:53:27.979733+00
26	beedb	0009_auto_20201205_1240	2022-10-03 19:53:28.008914+00
27	beedb	0010_auto_20201205_1241	2022-10-03 19:53:28.023758+00
28	beedb	0011_colony_status	2022-10-03 19:53:28.037591+00
29	beedb	0012_auto_20201208_1101	2022-10-03 19:53:28.110029+00
30	beedb	0013_auto_20201208_1105	2022-10-03 19:53:28.139627+00
31	beedb	0014_auto_20201208_1107	2022-10-03 19:53:28.157504+00
32	beedb	0015_apiary_beeknew	2022-10-03 19:53:28.190019+00
33	beedb	0016_auto_20201208_1712	2022-10-03 19:53:28.220477+00
34	beedb	0017_auto_20201208_1713	2022-10-03 19:53:28.252794+00
35	beedb	0018_remove_apiary_beekold	2022-10-03 19:53:28.281443+00
36	beedb	0019_apiary_beeknew1	2022-10-03 19:53:28.309025+00
37	beedb	0020_auto_20201209_1642	2022-10-03 19:53:28.352594+00
38	beedb	0021_auto_20201209_1644	2022-10-03 19:53:28.383564+00
39	beedb	0022_auto_20201210_1415	2022-10-03 19:53:28.445759+00
40	beedb	0023_auto_20201210_1659	2022-10-03 19:53:28.46122+00
41	beedb	0024_auto_20201212_1231	2022-10-03 19:53:28.534111+00
42	beedb	0025_auto_20201213_1055	2022-10-03 19:53:28.615239+00
43	beedb	0026_diary_completed	2022-10-03 19:53:28.665734+00
44	beedb	0027_auto_20201213_1230	2022-10-03 19:53:28.680544+00
45	beedb	0028_auto_20201213_1719	2022-10-03 19:53:28.705425+00
46	beedb	0029_auto_20210418_0930	2022-10-03 19:53:28.785426+00
47	beedb	0030_auto_20210613_1115	2022-10-03 19:53:28.809661+00
48	beedb	0031_config	2022-10-03 19:53:28.841098+00
49	beedb	0032_colony_notes	2022-10-03 19:53:28.873997+00
50	beedb	0033_auto_20210815_1051	2022-10-03 19:53:28.913059+00
51	beedb	0034_auto_20210815_1113	2022-10-03 19:53:28.956386+00
52	beedb	0035_message	2022-10-03 19:53:29.01488+00
53	beedb	0036_message_html	2022-10-03 19:53:29.043602+00
54	beedb	0037_audit_colony1	2022-10-03 19:53:29.081366+00
55	beedb	0038_auto_20211205_1554	2022-10-03 19:53:29.11694+00
56	beedb	0039_auto_20220114_1651	2022-10-03 19:53:29.249389+00
57	beedb	0040_auto_20220212_1534	2022-10-03 19:53:29.30464+00
58	beedb	0041_remove_profile_weeklysummary	2022-10-03 19:53:29.322765+00
59	beedb	0042_profile_commslstweeklyemail	2022-10-03 19:53:29.342271+00
60	beedb	0043_auto_20220321_1723	2022-10-03 19:53:29.414289+00
61	beedb	0044_alter_feedback_status	2022-10-03 19:53:29.446734+00
62	beedb	0045_alter_feedback_status	2022-10-03 19:53:29.476283+00
63	beedb	0046_treatment_treatmenttype	2022-10-03 19:53:29.559818+00
64	beedb	0047_auto_20220325_1700	2022-10-03 19:53:29.70384+00
65	beedb	0048_inspection_adddiary	2022-10-03 19:53:29.715961+00
66	beedb	0049_sizechoice	2022-10-03 19:53:29.729073+00
67	beedb	0050_alter_sizechoice_text	2022-10-03 19:53:29.740549+00
68	beedb	0051_auto_20220402_1740	2022-10-03 19:53:29.793809+00
69	beedb	0052_alter_sizechoice_options	2022-10-03 19:53:29.802673+00
70	beedb	0053_auto_20220402_1814	2022-10-03 19:53:29.837118+00
71	beedb	0054_auto_20220403_1100	2022-10-03 19:53:29.865724+00
72	beedb	0055_inspection_size	2022-10-03 19:53:29.943895+00
73	beedb	0056_auto_20220408_1336	2022-10-03 19:53:29.976388+00
74	beedb	0057_auto_20220408_1655	2022-10-03 19:53:30.005218+00
75	sessions	0001_initial	2022-10-03 19:53:30.038101+00
76	beedb	0058_inspection_addtreatment_treatment_postvarroa_and_more	2022-10-19 02:37:52.683399+00
77	authtoken	0001_initial	2022-10-26 00:38:52.104943+00
78	authtoken	0002_auto_20160226_1747	2022-10-26 00:38:52.164605+00
79	authtoken	0003_tokenproxy	2022-10-26 00:38:52.170419+00
80	beedb	0059_rename_treatment_treatment_treatmenttype	2022-10-26 00:38:52.217913+00
81	mailer	0001_initial	2022-10-26 00:38:52.283928+00
82	mailer	0002_auto_20150720_1433	2022-10-26 00:38:52.290195+00
83	mailer	0003_messagelog_message_id	2022-10-26 00:38:52.300532+00
84	mailer	0004_auto_20190920_1512	2022-10-26 00:38:52.367825+00
85	mailer	0005_id_bigautofield	2022-10-26 00:38:52.438931+00
86	beedb	0060_alter_treatment_insertdt_alter_treatment_postvarroa_and_more	2022-10-27 21:44:19.477473+00
87	beedb	0061_alter_treatment_completed_alter_treatment_insertdt	2022-10-30 03:00:58.98434+00
88	beedb	0062_remove_inspection_adddiary_and_more	2022-10-31 21:20:13.006908+00
89	beedb	0063_rename_notes_treatment_trnotes	2022-10-31 21:44:32.287439+00
90	beedb	0064_alter_diary_duedt	2022-11-04 23:07:38.176784+00
91	beedb	0065_audit_transfer_alter_diary_duedt	2022-11-16 00:21:51.743188+00
92	beedb	0066_alter_apiary_latitude_alter_apiary_longitude_and_more	2022-11-20 17:43:48.338805+00
93	beedb	0067_picture_alter_diary_duedt_delete_image	2023-02-14 22:02:03.29904+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7xleaxmd0ns4refnso0rzg6xhdrp2cdv	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1ohKnl:Fhid1QvAl1RHv0aL7z8n3JAONXVjd6ERnJUZ8e28PXM	2022-10-23 01:08:21.854258+00
en5sm82tdvt7y5zaziwfmmhsqa2955w0	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1oijhb:gD45L5p9jJl3ZABE7kBzCaNiPFXQLI97iXI6wLIsSx0	2022-10-26 21:55:47.403537+00
jat0ovg7kr3s4qjzqocjkfrvnim3w3al	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1opa4o:5udfBHgOPK_XYx1cGQr5CnJa_9V_Q_Z7MnsoeBM_glk	2022-11-14 19:04:02.460595+00
fb63bnxidewyyfbibm46poggr64ltlr9	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1opzcN:623K-Csu99CLDhztQcbp9N24JRJqUramUbGv4BtgoZ8	2022-11-15 22:20:23.545765+00
6tewt050ii6x2jfndamo00fznf2a8k5n	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1oqh73:Fhv5Blkm_LFx6a88pX5o2Bk0MBff2dNjvKewSES5GrQ	2022-11-17 20:46:57.538425+00
89oxwb76eqzlxjvs8xzgqb8xbrb78v5r	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1ovsmG:kXsac6ofs5FXrDuGqsveEaKp1gFNnUxbRERTWTpMvXA	2022-12-02 04:14:56.259856+00
qbmsl9z8iqzy97u3pflhykng2lanxqqb	.eJxVjEEOwiAQRe_C2hBAKINL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIK06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9-ajSVO5LJ1oFWyxeCgnaPCGjyb7AZUJSTrIZ1V1jlYCl55YwBBQwDx_gDvEzeA:1pRPCg:RP2bVYq_UB2a-r8yWKGXrGR4M2iHWCEnDYZZmEDnhso	2023-02-27 03:08:30.099088+00
gi4v4m9me9ksshp7gh0lumg53ras41t7	.eJxVjMsOwiAQRf-FtSEwbXm4dO83kJkBpGogKe3K-O_apAvd3nPOfYmA21rC1tMS5ijOYhSn342QH6nuIN6x3prkVtdlJrkr8qBdXltMz8vh_h0U7OVbO0us2JJRyuYMmGHgIWuO2emYk0EPA3nSyZGf3BStQgRlRkYwNgGI9wcCijhb:1psytI:IfOQ7hh0OEvxFvuLXBfFBzlRFyqPlX3HnfwM3vdtKqI	2023-05-14 04:42:28.902148+00
t04ebm6yummf9se2f36f2kb73gq4m1l6	.eJxVjMsOwiAQRf-FtSEwbXm4dO83kJkBpGogKe3K-O_apAvd3nPOfYmA21rC1tMS5ijOYhSn342QH6nuIN6x3prkVtdlJrkr8qBdXltMz8vh_h0U7OVbO0us2JJRyuYMmGHgIWuO2emYk0EPA3nSyZGf3BStQgRlRkYwNgGI9wcCijhb:1qSTWE:uSk_x9gFIylmZzqesWShczeVlkSGGRSJ0mSE0TGkD3M	2023-08-20 02:29:22.075625+00
68y00jvrvb3u8d5da18hz2ao0d0j41xm	.eJxVjMsOwiAQRf-FtSEwbXm4dO83kJkBpGogKe3K-O_apAvd3nPOfYmA21rC1tMS5ijOYhSn342QH6nuIN6x3prkVtdlJrkr8qBdXltMz8vh_h0U7OVbO0us2JJRyuYMmGHgIWuO2emYk0EPA3nSyZGf3BStQgRlRkYwNgGI9wcCijhb:1qSWdT:2GoQpFQchAYW1_OYI4DbFFvEKN9oLPV_QoUARunnZ1I	2023-08-20 05:49:03.998533+00
gkxgv17ttl4sbdx4jrbn118dxwdq5did	.eJxVjMsOwiAQRf-FtSEwbXm4dO83kJkBpGogKe3K-O_apAvd3nPOfYmA21rC1tMS5ijOYhSn342QH6nuIN6x3prkVtdlJrkr8qBdXltMz8vh_h0U7OVbO0us2JJRyuYMmGHgIWuO2emYk0EPA3nSyZGf3BStQgRlRkYwNgGI9wcCijhb:1qSWe0:89RUp8hh9nEHDOwMTD90pdIfgwVlkdylgj3T0uRI24Y	2023-08-20 05:49:36.422979+00
ydue5oab3rtix0ls7frrmouznf85rr8l	.eJxVjMsOwiAQRf-FtSEwbXm4dO83kJkBpGogKe3K-O_apAvd3nPOfYmA21rC1tMS5ijOYhSn342QH6nuIN6x3prkVtdlJrkr8qBdXltMz8vh_h0U7OVbO0us2JJRyuYMmGHgIWuO2emYk0EPA3nSyZGf3BStQgRlRkYwNgGI9wcCijhb:1qvXmw:pt5Emxz4Pv44tE7c0MHy1NImgmBikL9jhtrx21MhOoo	2023-11-08 06:54:46.960771+00
\.


--
-- Data for Name: mailer_dontsendentry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mailer_dontsendentry (id, to_address, when_added) FROM stdin;
\.


--
-- Data for Name: mailer_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mailer_message (id, message_data, when_added, priority) FROM stdin;
\.


--
-- Data for Name: mailer_messagelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mailer_messagelog (id, message_data, when_added, priority, when_attempted, result, log_message, message_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: beedb_apiary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_apiary_id_seq', 3, true);


--
-- Name: beedb_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_audit_id_seq', 21, true);


--
-- Name: beedb_colony_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_colony_id_seq', 13, true);


--
-- Name: beedb_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_config_id_seq', 3, true);


--
-- Name: beedb_diary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_diary_id_seq', 19, true);


--
-- Name: beedb_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_feedback_id_seq', 2, true);


--
-- Name: beedb_inspection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_inspection_id_seq', 39, true);


--
-- Name: beedb_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_message_id_seq', 18, true);


--
-- Name: beedb_picture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_picture_id_seq', 5, true);


--
-- Name: beedb_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_profile_id_seq', 6, true);


--
-- Name: beedb_sizechoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_sizechoice_id_seq', 60, true);


--
-- Name: beedb_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_transfer_id_seq', 14, true);


--
-- Name: beedb_treatment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_treatment_id_seq', 17, true);


--
-- Name: beedb_treatmenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_treatmenttype_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 34, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 93, true);


--
-- Name: mailer_dontsendentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mailer_dontsendentry_id_seq', 1, false);


--
-- Name: mailer_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mailer_message_id_seq', 1, false);


--
-- Name: mailer_messagelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mailer_messagelog_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: beedb_apiary beedb_apiary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_apiary
    ADD CONSTRAINT beedb_apiary_pkey PRIMARY KEY (id);


--
-- Name: beedb_audit beedb_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit
    ADD CONSTRAINT beedb_audit_pkey PRIMARY KEY (id);


--
-- Name: beedb_colony beedb_colony_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_colony
    ADD CONSTRAINT beedb_colony_pkey PRIMARY KEY (id);


--
-- Name: beedb_config beedb_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_config
    ADD CONSTRAINT beedb_config_pkey PRIMARY KEY (id);


--
-- Name: beedb_diary beedb_diary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_diary
    ADD CONSTRAINT beedb_diary_pkey PRIMARY KEY (id);


--
-- Name: beedb_feedback beedb_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_feedback
    ADD CONSTRAINT beedb_feedback_pkey PRIMARY KEY (id);


--
-- Name: beedb_inspection beedb_inspection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_inspection
    ADD CONSTRAINT beedb_inspection_pkey PRIMARY KEY (id);


--
-- Name: beedb_message beedb_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_message
    ADD CONSTRAINT beedb_message_pkey PRIMARY KEY (id);


--
-- Name: beedb_picture beedb_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_picture
    ADD CONSTRAINT beedb_picture_pkey PRIMARY KEY (id);


--
-- Name: beedb_profile beedb_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_profile
    ADD CONSTRAINT beedb_profile_pkey PRIMARY KEY (id);


--
-- Name: beedb_profile beedb_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_profile
    ADD CONSTRAINT beedb_profile_user_id_key UNIQUE (user_id);


--
-- Name: beedb_sizechoice beedb_sizechoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_sizechoice
    ADD CONSTRAINT beedb_sizechoice_pkey PRIMARY KEY (id);


--
-- Name: beedb_transfer beedb_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_transfer
    ADD CONSTRAINT beedb_transfer_pkey PRIMARY KEY (id);


--
-- Name: beedb_treatment beedb_treatment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT beedb_treatment_pkey PRIMARY KEY (id);


--
-- Name: beedb_treatmenttype beedb_treatmenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatmenttype
    ADD CONSTRAINT beedb_treatmenttype_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mailer_dontsendentry mailer_dontsendentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mailer_dontsendentry
    ADD CONSTRAINT mailer_dontsendentry_pkey PRIMARY KEY (id);


--
-- Name: mailer_message mailer_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mailer_message
    ADD CONSTRAINT mailer_message_pkey PRIMARY KEY (id);


--
-- Name: mailer_messagelog mailer_messagelog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mailer_messagelog
    ADD CONSTRAINT mailer_messagelog_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: beedb_apiary_beeknew1_id_69c97968; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_apiary_beeknew1_id_69c97968 ON public.beedb_apiary USING btree (beek_id);


--
-- Name: beedb_audit_apiary_id_b1d1cb78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_audit_apiary_id_b1d1cb78 ON public.beedb_audit USING btree (apiary_id);


--
-- Name: beedb_audit_beek_id_92e0862e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_audit_beek_id_92e0862e ON public.beedb_audit USING btree (beek_id);


--
-- Name: beedb_audit_colony1_id_8e8399e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_audit_colony1_id_8e8399e6 ON public.beedb_audit USING btree (colony1_id);


--
-- Name: beedb_audit_colony_id_ace41e39; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_audit_colony_id_ace41e39 ON public.beedb_audit USING btree (colony_id);


--
-- Name: beedb_audit_transfer_id_2ecc4280; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_audit_transfer_id_2ecc4280 ON public.beedb_audit USING btree (transfer_id);


--
-- Name: beedb_colony_apiary_id_0cc6317b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_colony_apiary_id_0cc6317b ON public.beedb_colony USING btree (apiary_id);


--
-- Name: beedb_diary_apiary_id_3a7f132a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_diary_apiary_id_3a7f132a ON public.beedb_diary USING btree (apiary_id);


--
-- Name: beedb_diary_beek_id_e186d877; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_diary_beek_id_e186d877 ON public.beedb_diary USING btree (beek_id);


--
-- Name: beedb_diary_colony_id_56075bce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_diary_colony_id_56075bce ON public.beedb_diary USING btree (colony_id);


--
-- Name: beedb_feedback_beek_id_1005502e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_feedback_beek_id_1005502e ON public.beedb_feedback USING btree (beek_id);


--
-- Name: beedb_inspection_colony_id_b67f553a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_inspection_colony_id_b67f553a ON public.beedb_inspection USING btree (colony_id);


--
-- Name: beedb_message_beek_id_033feaf4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_message_beek_id_033feaf4 ON public.beedb_message USING btree (beek_id);


--
-- Name: beedb_picture_apiary_id_f46f94a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_picture_apiary_id_f46f94a2 ON public.beedb_picture USING btree (apiary_id);


--
-- Name: beedb_picture_beek_id_2b146dac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_picture_beek_id_2b146dac ON public.beedb_picture USING btree (beek_id);


--
-- Name: beedb_picture_colony_id_0b202e6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_picture_colony_id_0b202e6f ON public.beedb_picture USING btree (colony_id);


--
-- Name: beedb_picture_inspection_id_7c099382; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_picture_inspection_id_7c099382 ON public.beedb_picture USING btree (inspection_id);


--
-- Name: beedb_profile_lastApiary_id_a3dc106c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "beedb_profile_lastApiary_id_a3dc106c" ON public.beedb_profile USING btree ("lastApiary_id");


--
-- Name: beedb_transfer_colony_id_8f1dd51c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_transfer_colony_id_8f1dd51c ON public.beedb_transfer USING btree (colony_id);


--
-- Name: beedb_treatment_colony_id_512d5163; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_treatment_colony_id_512d5163 ON public.beedb_treatment USING btree (colony_id);


--
-- Name: beedb_treatment_inspection_id_681fcee3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_treatment_inspection_id_681fcee3 ON public.beedb_treatment USING btree (inspection_id);


--
-- Name: beedb_treatment_treatment_id_67c4d364; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beedb_treatment_treatment_id_67c4d364 ON public.beedb_treatment USING btree ("treatmentType_id");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mailer_messagelog_priority_5e712cf3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mailer_messagelog_priority_5e712cf3 ON public.mailer_messagelog USING btree (priority);


--
-- Name: mailer_messagelog_when_added_627461e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mailer_messagelog_when_added_627461e6 ON public.mailer_messagelog USING btree (when_added);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_apiary beedb_apiary_beek_id_9f7049de_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_apiary
    ADD CONSTRAINT beedb_apiary_beek_id_9f7049de_fk_auth_user_id FOREIGN KEY (beek_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_audit beedb_audit_apiary_id_b1d1cb78_fk_beedb_apiary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit
    ADD CONSTRAINT beedb_audit_apiary_id_b1d1cb78_fk_beedb_apiary_id FOREIGN KEY (apiary_id) REFERENCES public.beedb_apiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_audit beedb_audit_beek_id_92e0862e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit
    ADD CONSTRAINT beedb_audit_beek_id_92e0862e_fk_auth_user_id FOREIGN KEY (beek_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_audit beedb_audit_colony1_id_8e8399e6_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit
    ADD CONSTRAINT beedb_audit_colony1_id_8e8399e6_fk_beedb_colony_id FOREIGN KEY (colony1_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_audit beedb_audit_colony_id_ace41e39_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit
    ADD CONSTRAINT beedb_audit_colony_id_ace41e39_fk_beedb_colony_id FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_audit beedb_audit_transfer_id_2ecc4280_fk_beedb_transfer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_audit
    ADD CONSTRAINT beedb_audit_transfer_id_2ecc4280_fk_beedb_transfer_id FOREIGN KEY (transfer_id) REFERENCES public.beedb_transfer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_colony beedb_colony_apiary_id_0cc6317b_fk_beedb_apiary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_colony
    ADD CONSTRAINT beedb_colony_apiary_id_0cc6317b_fk_beedb_apiary_id FOREIGN KEY (apiary_id) REFERENCES public.beedb_apiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_diary beedb_diary_apiary_id_3a7f132a_fk_beedb_apiary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_diary
    ADD CONSTRAINT beedb_diary_apiary_id_3a7f132a_fk_beedb_apiary_id FOREIGN KEY (apiary_id) REFERENCES public.beedb_apiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_diary beedb_diary_beek_id_e186d877_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_diary
    ADD CONSTRAINT beedb_diary_beek_id_e186d877_fk_auth_user_id FOREIGN KEY (beek_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_diary beedb_diary_colony_id_56075bce_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_diary
    ADD CONSTRAINT beedb_diary_colony_id_56075bce_fk_beedb_colony_id FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_feedback beedb_feedback_beek_id_1005502e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_feedback
    ADD CONSTRAINT beedb_feedback_beek_id_1005502e_fk_auth_user_id FOREIGN KEY (beek_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_inspection beedb_inspection_colony_id_b67f553a_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_inspection
    ADD CONSTRAINT beedb_inspection_colony_id_b67f553a_fk_beedb_colony_id FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_message beedb_message_beek_id_033feaf4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_message
    ADD CONSTRAINT beedb_message_beek_id_033feaf4_fk_auth_user_id FOREIGN KEY (beek_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_picture beedb_picture_apiary_id_f46f94a2_fk_beedb_apiary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_picture
    ADD CONSTRAINT beedb_picture_apiary_id_f46f94a2_fk_beedb_apiary_id FOREIGN KEY (apiary_id) REFERENCES public.beedb_apiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_picture beedb_picture_beek_id_2b146dac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_picture
    ADD CONSTRAINT beedb_picture_beek_id_2b146dac_fk_auth_user_id FOREIGN KEY (beek_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_picture beedb_picture_colony_id_0b202e6f_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_picture
    ADD CONSTRAINT beedb_picture_colony_id_0b202e6f_fk_beedb_colony_id FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_picture beedb_picture_inspection_id_7c099382_fk_beedb_inspection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_picture
    ADD CONSTRAINT beedb_picture_inspection_id_7c099382_fk_beedb_inspection_id FOREIGN KEY (inspection_id) REFERENCES public.beedb_inspection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_profile beedb_profile_lastApiary_id_a3dc106c_fk_beedb_apiary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_profile
    ADD CONSTRAINT "beedb_profile_lastApiary_id_a3dc106c_fk_beedb_apiary_id" FOREIGN KEY ("lastApiary_id") REFERENCES public.beedb_apiary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_profile beedb_profile_user_id_3706d4ee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_profile
    ADD CONSTRAINT beedb_profile_user_id_3706d4ee_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_transfer beedb_transfer_colony_id_8f1dd51c_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_transfer
    ADD CONSTRAINT beedb_transfer_colony_id_8f1dd51c_fk_beedb_colony_id FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_treatment beedb_treatment_colony_id_512d5163_fk_beedb_colony_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT beedb_treatment_colony_id_512d5163_fk_beedb_colony_id FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_treatment beedb_treatment_inspection_id_681fcee3_fk_beedb_inspection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT beedb_treatment_inspection_id_681fcee3_fk_beedb_inspection_id FOREIGN KEY (inspection_id) REFERENCES public.beedb_inspection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: beedb_treatment beedb_treatment_treatmentType_id_101dd554_fk_beedb_tre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT "beedb_treatment_treatmentType_id_101dd554_fk_beedb_tre" FOREIGN KEY ("treatmentType_id") REFERENCES public.beedb_treatmenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

