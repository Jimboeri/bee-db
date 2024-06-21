--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-1.pgdg90+1)
-- Dumped by pg_dump version 11.16 (Debian 11.16-1.pgdg90+1)

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

SET default_with_oids = false;

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
    completed boolean NOT NULL,
    id integer NOT NULL,
    "treatmentType_id" integer NOT NULL,
    colony_id integer NOT NULL,
    "insertDt" timestamp with time zone,
    "removeDt" timestamp with time zone,
    "preVarroa" integer,
    "postVarroa" integer,
    "trNotes" text,
    inspection_id integer
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
41	Can add beek	11	add_beek
42	Can change beek	11	change_beek
43	Can delete beek	11	delete_beek
44	Can view beek	11	view_beek
45	Can add transfer	12	add_transfer
46	Can change transfer	12	change_transfer
47	Can delete transfer	12	delete_transfer
48	Can view transfer	12	view_transfer
49	Can add audit	13	add_audit
50	Can change audit	13	change_audit
51	Can delete audit	13	delete_audit
52	Can view audit	13	view_audit
53	Can add diary	14	add_diary
54	Can change diary	14	change_diary
55	Can delete diary	14	delete_diary
56	Can view diary	14	view_diary
57	Can add config	15	add_config
58	Can change config	15	change_config
59	Can delete config	15	delete_config
60	Can view config	15	view_config
61	Can add message	16	add_message
62	Can change message	16	change_message
63	Can delete message	16	delete_message
64	Can view message	16	view_message
65	Can add feedback	17	add_feedback
66	Can change feedback	17	change_feedback
67	Can delete feedback	17	delete_feedback
68	Can view feedback	17	view_feedback
69	Can add treatment	18	add_treatment
70	Can change treatment	18	change_treatment
71	Can delete treatment	18	delete_treatment
72	Can view treatment	18	view_treatment
73	Can add treatment type	19	add_treatmenttype
74	Can change treatment type	19	change_treatmenttype
75	Can delete treatment type	19	delete_treatmenttype
76	Can view treatment type	19	view_treatmenttype
77	Can add size choice	20	add_sizechoice
78	Can change size choice	20	change_sizechoice
79	Can delete size choice	20	delete_sizechoice
80	Can view size choice	20	view_sizechoice
81	Can add Token	21	add_token
82	Can change Token	21	change_token
83	Can delete Token	21	delete_token
84	Can view Token	21	view_token
85	Can add token	22	add_tokenproxy
86	Can change token	22	change_tokenproxy
87	Can delete token	22	delete_tokenproxy
88	Can view token	22	view_tokenproxy
89	Can add don't send entry	23	add_dontsendentry
90	Can change don't send entry	23	change_dontsendentry
91	Can delete don't send entry	23	delete_dontsendentry
92	Can view don't send entry	23	view_dontsendentry
93	Can add message	24	add_message
94	Can change message	24	change_message
95	Can delete message	24	delete_message
96	Can view message	24	view_message
97	Can add message log	25	add_messagelog
98	Can change message log	25	change_messagelog
99	Can delete message log	25	delete_messagelog
100	Can view message log	25	view_messagelog
101	Can add picture	26	add_picture
102	Can change picture	26	change_picture
103	Can delete picture	26	delete_picture
104	Can view picture	26	view_picture
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$HI0WgyGAVuhZ$PxBpmZJNbeoyPwZmFjk8lZutvu4EB+QOoqoFTWgMRP0=	\N	t	admin			jim@west.net.nz	t	t	2020-12-05 20:28:49.684418+00
10	pbkdf2_sha256$390000$NaQUIVb4SMyMmouudcrGW5$Ah+lXil2mS5E177QGZqAJJ8AOtHzKhFqj49d4jbd0AY=	2022-12-23 10:26:57.094764+00	f	ernst@superbsoftware.co.nz			ernst@superbsoftware.co.nz	f	t	2022-12-23 09:59:33.940097+00
8	pbkdf2_sha256$260000$THWS2IpdSCkyQKMKDqlB3a$w+GfDWT5swclD3KoYr4MPRa6hM4xh+jBGPMkhnCnaV4=	2022-04-05 22:04:26.327016+00	f	greg.borrageiro@xtra.co.nz			greg.borrageiro@xtra.co.nz	f	t	2022-04-05 22:03:59.055161+00
11	pbkdf2_sha256$390000$DU5Lzv9kbrVy0JKHH32ATL$JVR/uxBzeUGByYdbnDfChju/8hGz/cgWGjMdDbQ8Agg=	2022-12-23 19:19:04.420117+00	f	alastair@mairangibay.net			alastair@mairangibay.net	f	t	2022-12-23 19:17:59.552602+00
7	pbkdf2_sha256$390000$4wQzNfB2YsmzAFx0RbqiEy$zCAEitvXyv9gJNbO+cnyLQ2T5XVjNHCTL+9DabH9DV0=	2024-03-28 07:45:18.496775+00	f	vwdundas@gmail.com			vwdundas@gmail.com	f	t	2021-09-22 02:20:11.883456+00
2	pbkdf2_sha256$390000$4LWIgmWem56ScOrIeIT2Xx$Esn0IC/NnWaxrbDFRwmapcfLPGiLRURScqYaukVDCR8=	2024-06-15 02:52:16.468765+00	t	jim	Jim	West	jim@west.net.nz	t	t	2020-12-05 20:29:16.919479+00
5	pbkdf2_sha256$390000$hFQ6kGI9yB4r0idcAVsLKS$u+ncDFNK4tEwJHBJVLf/d7CyeM6RnlSI19+zmiQ4e04=	2022-12-16 20:53:32.407522+00	f	et@west.net.nz			et@west.net.nz	f	t	2021-08-19 03:21:32.787393+00
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
3	W0017		7	\N	\N	0.0000000	\N	0.0000000	\N	\N
4	A8871	Private	8	\N	\N	0.0000000	\N	0.0000000	\N	\N
2	Coatesville	Apiary at Sid & Christine Millers	2			-36.7447300		174.6395300	\N	\N
5	ET-Test		5	\N	\N	0.0000000	\N	0.0000000	\N	\N
6	ET - Test 2		5	\N	\N	0.0000000	\N	0.0000000	\N	\N
1	Torbay	Home apiary	2	171 Glamorgan Rd\r\nTorbay	None	-36.7036100	Back yard	174.7336600	Jim West	021466721
8	Home1	My first Apiary	10	121a Robinson Road	None	-36.7130300	Bottom of hill	174.6218200	Ernst	0211405415
9	27		11	\N	\N	0.0000000	\N	0.0000000	\N	\N
\.


--
-- Data for Name: beedb_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_audit (id, dt, transaction_cd, detail, apiary_id, beek_id, colony_id, colony1_id, transfer_id) FROM stdin;
1	2020-12-12 03:31:00.712934+00	4	New colony entered 	1	2	13	\N	\N
3	2020-12-12 03:35:34.184716+00	3	Swarm caught at Glamorgan dr, Torbay	1	2	15	\N	\N
2	2020-12-12 03:33:27.935984+00	2	Colony Nuc 3 split from H2 	1	2	\N	\N	\N
4	2020-12-16 20:21:33.96795+00	1	Colony sold to Rod Willis 	\N	2	15	\N	\N
5	2021-09-22 02:31:27.023743+00	4	New colony entered 	3	7	16	\N	\N
6	2021-09-22 02:33:45.463857+00	4	New colony entered 	3	7	17	\N	\N
7	2021-09-22 02:36:00.962327+00	3	Swarm caught at Torbay	3	7	18	\N	\N
8	2021-09-22 02:59:05.412216+00	4	New colony entered 	3	7	19	\N	\N
9	2021-10-01 22:46:58.001558+00	2	Colony C2 split from H1 	1	2	20	\N	\N
10	2021-10-01 22:49:10.433398+00	2	Colony QC1 split from H3 	1	2	21	\N	\N
11	2021-10-03 03:27:14.882609+00	1	Colony sold to Greg Borrageiro 	\N	7	19	\N	\N
12	2021-10-15 22:27:49.637514+00	2	Colony QC2 split from H4 	1	2	22	\N	\N
13	2021-10-26 18:56:08.244555+00	3	Swarm caught at Next to H4	1	2	23	\N	\N
14	2021-10-26 18:56:54.035595+00	3	Swarm caught at Next to Andrews fence/wall	1	2	24	\N	\N
15	2021-11-16 23:19:28.389989+00	2	Colony QC3 split from QC1 	1	2	25	\N	\N
16	2021-12-05 02:01:36.126156+00	6	Colony S1 has been combined with S2 	1	2	23	24	\N
17	2021-12-19 02:29:47.747762+00	6	Colony S2 has been combined with C1 	2	2	24	9	\N
18	2022-01-06 00:53:55.816366+00	6	Colony QC2 has been combined with H3 	1	2	22	2	\N
19	2022-01-06 00:56:10.894427+00	4	New colony entered 	1	2	26	\N	\N
20	2022-03-12 08:20:05.047085+00	6	Colony QC1 has been combined with H4 	1	2	21	3	\N
21	2022-09-17 01:27:09.292487+00	2	Colony H3 split from H4 	1	2	27	\N	\N
22	2022-10-24 05:30:35.378978+00	4	New colony entered 	3	7	28	\N	\N
23	2022-11-05 00:05:02.594187+00	4	New colony entered 	5	5	29	\N	\N
24	2022-11-05 00:06:05.834731+00	3	Swarm caught at Left	5	5	30	\N	\N
25	2022-11-05 00:06:41.092355+00	4	New colony entered 	6	5	31	\N	\N
26	2022-12-23 10:14:55.317644+00	4	Colony purchased from Alistar	8	10	32	\N	24
27	2022-12-23 10:16:00.850239+00	5	New colony entered 	8	10	33	\N	25
28	2022-12-25 23:56:16.736674+00	5	New colony entered 	3	7	34	\N	26
29	2022-12-26 00:00:36.442854+00	2	Colony Wooden NUC split from Wooden NUC 	3	7	35	34	27
30	2022-12-27 01:39:17.418249+00	4	Colony purchased from Vic Dundas	1	2	36	\N	28
31	2023-01-07 23:00:16.145104+00	2	Colony Right queen castle split from H4 	1	2	37	3	29
32	2023-01-19 20:40:04.791723+00	7	Colony Vic's nuc moved FROM Torbay TO Coatesville	2	2	36	\N	\N
33	2023-01-23 03:17:40.415555+00	8	Colony Right queen castle has died. Notes: Never got going	\N	2	37	\N	\N
34	2023-02-21 22:51:15.414413+00	2	Colony QC3 split from H3 	1	2	38	27	30
35	2023-03-04 22:01:53.347656+00	5	New colony entered 	3	7	39	\N	31
36	2023-03-04 22:07:25.944199+00	5	New colony entered 	3	7	40	\N	32
37	2023-04-02 06:16:07.393333+00	8	Colony Grey 3/4 Corflute NUC appears to have absconded. Notes: 	\N	7	40	\N	\N
38	2023-04-02 06:18:07.901347+00	8	Colony Art (Multi NUC) has died. Notes: 	\N	7	17	\N	\N
39	2023-04-02 06:18:45.932106+00	8	Colony Corflute NUC appears to have absconded. Notes: 	\N	7	28	\N	\N
40	2023-04-02 06:19:55.485954+00	8	Colony Yellow 3/4 Corflute NUC has died. Notes: 	\N	7	34	\N	\N
41	2023-04-02 06:51:30.656581+00	4	Colony purchased from Alistair Little	3	7	41	\N	33
42	2023-04-09 08:28:29.105407+00	6	Colony Rose has been combined with Pink 3/4 corflute NUC 	3	7	16	39	\N
43	2023-05-13 22:07:16.668791+00	1	Colony sold to Ivan 	\N	2	38	\N	\N
44	2023-08-30 03:47:20.542023+00	1	Colony sold to Greg Borrageiro 	\N	7	41	\N	\N
45	2023-10-28 03:46:45.692017+00	5	New colony entered 	3	7	42	\N	36
46	2023-11-21 04:40:12.825165+00	2	Colony QC3 split from H3 	1	2	43	27	37
47	2023-11-24 22:41:42.173177+00	2	Colony QC2 split from C1 	2	2	44	36	38
48	2023-11-24 22:41:52.116931+00	7	Colony QC2 moved FROM Coatesville TO Torbay	1	2	44	\N	\N
49	2024-02-05 05:19:28.19305+00	1	Colony sold to Robyn Nicholls 	\N	7	42	\N	\N
50	2024-02-05 05:24:31.989754+00	8	Colony Rho Hive appears to have absconded. Notes: Very heavy varroa. Wax moth running rampant,\r\nTake the best 5 frames and put them into Pink NUC along with a red dot queen and remaining bees	\N	7	18	\N	\N
51	2024-02-05 23:25:44.51781+00	2	Colony C2 split from C1 	2	2	45	36	40
52	2024-02-05 23:28:37.957854+00	6	Colony QC2 has been combined with H4 	1	2	44	3	\N
53	2024-02-05 23:29:30.245776+00	8	Colony QC3 has died. Notes: ax moth everywhere. No Q seen	\N	2	43	\N	\N
54	2024-02-05 23:32:47.221087+00	2	Colony QC1 split from H3 	1	2	46	27	41
55	2024-02-06 20:36:34.542707+00	5	New colony entered 	3	7	47	\N	42
56	2024-02-20 22:27:28.278585+00	8	Colony Rho Hive appears to have absconded. Notes: Very heavy varroa. Wax moth running rampant,\r\nTake the best 5 frames and put them into Pink NUC along with a red dot queen and remaining bees	\N	7	18	\N	\N
57	2024-02-20 22:29:28.463873+00	8	Colony Rho Hive appears to have absconded. Notes: Very heavy varroa. Wax moth running rampant,\r\nTake the best 5 frames and put them into Pink NUC along with a red dot queen and remaining bees.\r\n\r\nHive continued to declined and now officially dead	\N	7	18	\N	\N
58	2024-02-20 22:30:56.537542+00	8	Colony Rho Hive has died. Notes: Very heavy varroa. Wax moth running rampant,\r\nTake the best 5 frames and put them into Pink NUC along with a red dot queen and remaining bees.\r\n\r\nHive continued to declined and now officially dead	\N	7	18	\N	\N
\.


--
-- Data for Name: beedb_colony; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_colony (id, "colonyID", descr, apiary_id, status, notes, "lastAction", status_dt, "queenRight", size) FROM stdin;
4	Nuc 1	Left nuc, sold on trademe	1	S	\N	\N	\N	t	3
5	Nuc 2	Right nuc	1	S	\N	\N	\N	t	3
38	QC3	Queen castle from H3	1	S	\N	2023-02-21 22:52:57.69145+00	2023-02-21 22:51:15.245935+00	t	2
15	Swarm 1 2020	Swarm I think from Hive 2	1	S	\N	\N	\N	t	3
12	CN1	Nuc round the corner	2	D	Starved	2021-08-15 00:23:11.164973+00	2021-08-15 00:23:11.164961+00	t	3
11	C3	Right hive	2	D	Starved	2021-08-15 00:23:47.580755+00	2021-08-15 00:23:47.580748+00	t	3
6	QC1	Left queen castle colony	1	D	Combined with Hive 3	2021-08-15 00:25:51.115175+00	2021-08-15 00:25:51.115166+00	t	3
13	Nuc 4	Split and now a nuc	1	D	Can't remember	2021-08-15 00:27:01.811783+00	2021-08-15 00:27:01.811777+00	t	3
7	QC2	Middle QC colony	1	D	Gave queen away, colony could not create new queen	2021-08-15 00:27:43.497988+00	2021-08-15 00:27:43.497981+00	t	3
8	QC3	Right queen castle colony	1	D	Gave queen away, colony could not create new queen	2021-08-15 00:27:55.90714+00	2021-08-15 00:27:55.907131+00	t	3
35	Breeder Hive	Place Wooden NUC  into full depth Brood Box The Red dot mated queen which had been raised in this NUC	3	C	\N	2023-08-25 05:52:41.085773+00	2022-12-26 00:00:36.397889+00	t	3
10	C2	Middle hive	2	D	Seems to have starved 😞	2021-09-25 02:02:31.356215+00	2021-09-25 02:02:31.356206+00	t	3
19	Avo (Avocado)		3	S	\N	2021-09-22 02:59:05.387624+00	2021-09-22 02:59:05.387615+00	t	3
41	Alistair Hive	Bought from Alistair Little Sept,2022. Used as breeder hive at Kaipara. Brought back to Knights Road, 28 March,2023. Full depth,plastic frame	3	S	\N	2023-04-09 08:17:09.091858+00	2023-04-02 06:51:30.48472+00	t	3
23	S1	Swarm caught in Rosemary bush. Put into full hive.\r\nDo not do any updates, there was no queen so was merged with S2	1	M	\N	2021-11-30 22:20:14.707147+00	2021-10-26 18:56:08.133871+00	t	3
24	S2	Caught on back of property	2	M	\N	2021-12-19 02:26:31.536782+00	2021-10-26 18:56:54.008629+00	t	3
22	QC2	Middle queen cell colony	1	M	\N	2021-10-15 22:27:49.546621+00	2021-10-15 22:27:49.546613+00	t	3
2	H3	Hive 3, currently in the middle	1	D	Seemed to just fade away. found it being robbed out so removed all frames and threw them away. Significant wax moth seen.	2022-02-09 20:17:34.642778+00	2022-02-09 20:17:34.642772+00	t	3
26	QC2	Started with a frame with eggs & brood from QC3, and 2 frames with stores from H3	1	D	No queen, will remove frames soon	2022-02-09 20:18:11.206222+00	2022-02-09 20:18:11.206214+00	t	3
21	QC1	Left colony in queen castle	1	M	\N	2021-10-01 22:49:10.416261+00	2021-10-01 22:49:10.416252+00	t	3
20	C2	Split from H1 in Torbay	2	D	Unsure, did not see AFB.  Will get 2nd opinion	2022-03-19 17:35:49.765197+00	2022-03-19 17:35:49.765189+00	t	3
1	H1	Alison's hive, Leftmost one	1	D	Seemed to be disease free, don't know if it was varroa or wasps	2022-03-31 21:36:46.59543+00	2022-03-31 21:36:46.595423+00	t	3
25	QC3	Right hand Queen Castle	1	D	No bees, presume varroa	2022-07-02 23:55:00.600214+00	2022-07-02 23:55:00.600207+00	t	2
9	C1	Rightmost hive	2	D	No food, despite feeding 2 weeks ago. Always a weak colony	2022-09-17 05:53:17.819312+00	2022-09-17 05:53:17.819303+00	t	3
29	Sk-1	First at shakespear	5	C	\N	2022-11-05 00:05:02.501101+00	2022-11-05 00:05:02.501089+00	t	3
30	SK-2	Swarm capture	5	C	\N	2022-11-05 00:06:05.781372+00	2022-11-05 00:06:05.781365+00	t	3
31	TW 1		6	C	\N	2022-11-05 00:06:41.064314+00	2022-11-05 00:06:41.064307+00	t	3
27	H3	Left hive	1	C	\N	2022-11-26 22:52:51.890969+00	2022-09-17 01:27:09.162874+00	t	3
32	A1	Facing House up hill, first on left	8	C	\N	2022-12-23 10:14:55.189469+00	2022-12-23 10:14:55.189454+00	t	3
33	B1	2nd from left, to the right of A1	8	C	\N	2022-12-23 10:16:00.822365+00	2022-12-23 10:16:00.822358+00	t	3
37	Right queen castle	From H4	1	D	Never got going	2023-01-23 03:17:40.402361+00	2023-01-23 03:17:40.402356+00	t	3
43	QC3	Right hand queen castle	1	D	ax moth everywhere. No Q seen	2024-02-05 23:29:30.218666+00	2024-02-05 23:29:30.218655+00	t	3
47	Baby NUC	Hand built NUC with 4 mini frames and a plastic feeder	3	C	\N	2024-02-06 20:36:34.487689+00	2024-02-06 20:36:34.487679+00	t	3
40	Grey 3/4 Corflute NUC	6 framed corflute NUC brought back from Kaipara. (to be returned to Greg)	3	M		2023-04-02 06:16:07.336468+00	2023-04-02 06:16:07.336459+00	t	3
28	Corflute NUC	5 full frames\r\nUsing for queen rearing	3	M		2023-04-02 06:18:45.869729+00	2023-04-02 06:18:45.869722+00	t	3
34	Yellow 3/4 Corflute NUC	3/4 x 6 corflute constructed Dec,2022 for Queen raising	3	D		2023-04-02 06:19:55.458252+00	2023-04-02 06:19:55.458244+00	t	2
18	Rho Hive	building hive. Bottom brood.	3	D	Very heavy varroa. Wax moth running rampant,\r\nTake the best 5 frames and put them into Pink NUC along with a red dot queen and remaining bees.\r\n\r\nHive continued to declined and now officially dead	2024-02-20 22:30:56.458748+00	2024-02-20 22:30:56.458737+00	t	3
16	Rose	Two full boxes of brood, and above used for honey collection. Hive Strong	3	M	\N	2023-01-02 00:08:34.986927+00	2021-09-22 02:31:26.951473+00	t	4
39	Rose Hive	Six frames from Pink NUC (ex Kaipara) combined with Rose 10 frames.	3	C	\N	2023-04-28 03:52:06.841175+00	2023-03-04 22:01:53.038305+00	t	3
36	C1	Left hand colony. Started 2023	2	C	\N	2024-03-01 23:43:29.052739+00	2022-12-27 01:39:17.397203+00	t	3
45	C2	Split Feb 24. Right hand side	2	C	\N	2024-03-01 23:45:38.682124+00	2024-02-05 23:25:44.312183+00	t	3
17	Art (Multi NUC)	Converted to a 3 compartment NUC	3	D		2023-12-17 22:07:37.750544+00	2023-04-02 06:18:07.840346+00	t	2
46	Nuc1	Nuc next to shed	1	C	\N	2024-04-29 04:52:35.502509+00	2024-02-05 23:32:47.14397+00	t	3
42	Move NUC to Box- Full depth Box	Four frames ex Greg full depth hive, plus 5 wooden frames and 1 side feeder	3	S	\N	2024-01-31 07:30:28.753427+00	2023-10-28 03:46:45.563168+00	t	3
44	QC2	Middle colony. Qc with virgin queen from Vic & I grafting	1	M	\N	2023-12-16 23:04:36.758678+00	2023-11-24 22:41:42.01969+00	t	3
3	H4	Hive 4, rightmost hive	1	C	\N	2024-04-29 04:53:31.340098+00	\N	t	3
\.


--
-- Data for Name: beedb_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_config (id, key, "configDt", "configValue", "lastUpdate") FROM stdin;
1	lstDaily	2021-08-15 00:36:43.145528+00	8	2021-08-15 00:36:43.145561+00
2	lstWeekly	2021-08-15 00:36:43.161777+00	8	2021-08-15 00:36:43.161792+00
3	commsWeeklyDay	2024-06-14 08:00:10.668649+00	4	2022-02-27 02:49:57.389384+00
\.


--
-- Data for Name: beedb_diary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_diary (id, "createdDt", "startDt", "dueDt", "notifyDt", subject, details, apiary_id, beek_id, colony_id, completed) FROM stdin;
1	2020-12-27 00:09:22.736691+00	2020-12-26 11:00:00+00	2020-12-27 11:00:00+00	\N	Add another super		2	2	10	t
3	2021-01-04 23:16:45.952061+00	2021-01-16 11:00:00+00	2021-01-16 11:00:00+00	\N	Have another look for Q		1	2	7	t
2	2021-01-04 23:14:33.816048+00	2021-01-05 11:00:00+00	2021-01-05 11:00:00+00	\N	Remove capping		1	2	1	t
7	2021-03-12 23:55:59.308188+00	2021-04-23 12:00:00+00	2021-04-23 12:00:00+00	\N	Remove Bayvarol		2	2	12	f
10	2021-03-28 04:39:02.847673+00	2021-03-26 11:00:00+00	2021-03-26 11:00:00+00	\N	Check queen accepted	Saw queen, looking fine	1	2	2	t
5	2021-03-12 23:52:19.894571+00	2021-05-21 12:00:00+00	2021-05-21 12:00:00+00	\N	Remove Apivar		2	2	10	t
4	2021-03-12 23:50:12.328031+00	2021-05-21 12:00:00+00	2021-05-21 12:00:00+00	\N	Remove apivar		2	2	9	t
8	2021-03-28 04:35:49.245838+00	2021-05-28 12:00:00+00	2021-05-28 12:00:00+00	\N	Remove Apivar		1	2	1	t
9	2021-03-28 04:38:32.180044+00	2021-05-28 12:00:00+00	2021-05-28 12:00:00+00	\N	Remove apivar		1	2	2	t
11	2021-03-28 04:42:49.657006+00	2021-05-28 12:00:00+00	2021-05-28 12:00:00+00	\N	Remove Apivar		1	2	3	t
6	2021-03-12 23:53:57.543163+00	2021-05-21 12:00:00+00	2021-05-21 12:00:00+00	\N	Remove Apivar		2	2	11	t
12	2021-07-30 04:12:25.804252+00	2021-09-09 12:00:00+00	2021-09-09 12:00:00+00	\N	Remove Bayvarol		1	2	1	t
13	2021-07-30 04:26:17.490178+00	2021-09-09 12:00:00+00	2021-09-09 12:00:00+00	\N	Remove Bayvarol		1	2	2	t
14	2021-07-30 04:28:29.696523+00	2021-09-09 12:00:00+00	2021-09-09 12:00:00+00	\N	Remove Bayvarol		1	2	3	t
17	2021-10-09 00:13:35.910137+00	2021-10-08 11:00:00+00	2021-10-15 11:00:00+00	\N	Bring smoker fuel		2	2	9	t
16	2021-10-01 22:57:39.151545+00	2021-10-29 11:00:00+00	2021-10-29 11:00:00+00	\N	Check for queen	Did not find queen, but eggs &  brood present	1	2	21	t
34	2022-12-27 01:35:25.23597+00	\N	2022-12-28 11:00:00+00	\N	Extract honey		\N	2	27	t
21	2021-11-30 22:22:46.381054+00	2021-12-14 11:00:00+00	2021-12-14 11:00:00+00	\N	Check for queen & eggs	Found eggs, did not see queen	1	2	3	t
22	2021-11-30 22:24:39.836421+00	2021-12-14 11:00:00+00	2021-12-14 11:00:00+00	\N	Check for queen & eggs	No queen seen :-(	1	2	21	t
18	2021-10-15 22:28:27.12672+00	2021-11-13 11:00:00+00	2021-11-13 11:00:00+00	\N	Check for queen & eggs	No queen or eggs seen	1	2	22	t
23	2021-11-30 22:25:38.021961+00	2021-12-14 11:00:00+00	2021-12-14 11:00:00+00	\N	Check for queen & eggs	Found Queen and marked her	1	2	25	t
15	2021-09-25 02:00:24.826932+00	2021-09-24 12:00:00+00	2021-11-05 11:00:00+00	\N	Remove Bayvarol		2	2	9	t
24	2022-03-18 17:42:16.056702+00	\N	2022-05-19 12:00:00+00	\N	Remove Apivar		1	2	1	f
25	2022-03-18 17:42:47.844558+00	\N	2022-05-19 12:00:00+00	\N	Remove Apivar		1	2	3	t
26	2022-03-31 21:38:42.160159+00	\N	2022-05-01 12:00:00+00	\N	Pack away queen castle		\N	2	25	t
27	2022-07-02 23:54:20.545666+00	\N	2022-07-09 12:00:00+00	\N	Check syrup		\N	2	9	t
28	2022-08-20 00:15:26.016331+00	\N	2022-09-30 11:00:00+00	\N	Remove bayvarol	Will be 6 weeks	\N	2	9	f
29	2022-08-20 00:15:58.945046+00	\N	2022-09-16 12:00:00+00	\N	Bring barley straw		2	2	9	t
30	2022-08-20 00:16:16.170318+00	\N	2022-08-16 12:00:00+00	\N	Bring smoker fuel		2	2	9	t
32	2022-09-17 01:30:10.708052+00	\N	2022-10-07 11:00:00+00	\N	Check for queen	No queen found	\N	2	3	t
31	2022-08-21 00:13:31.261268+00	\N	2022-10-09 11:00:00+00	\N	Remove bayvarol		\N	2	3	t
33	2022-10-13 01:19:09.067787+00	\N	2022-11-02 11:00:00+00	\N	Check for brood	Vic's queen cell should have hatched & mated by now	\N	2	3	t
19	2021-10-25 02:33:43.912088+00	2021-10-10 11:00:00+00	2021-10-10 11:00:00+00	\N	Transfer to Artichoke	Transfer 3 frames of larvae and brood to Artichoke Hive	3	7	16	t
20	2021-10-25 02:39:07.266132+00	2021-10-10 11:00:00+00	2021-10-10 11:00:00+00	\N	Transfer from Artichoke	3 frames heavy in eggs, brood & larvae moved from Rose hive and placed in upper brood box	3	7	17	t
35	2023-01-07 22:58:44.771032+00	\N	2023-01-21 11:00:00+00	\N	Check for eggs	Yup, lots of eggs seen	\N	2	3	t
36	2023-02-11 05:33:50.785424+00	\N	2023-02-10 11:00:00+00	\N	Check for eggs / queen cells		\N	2	3	t
38	2023-02-21 22:52:32.032595+00	\N	2023-02-22 11:00:00+00	\N	Check that queen released		\N	2	27	t
37	2023-02-11 05:35:42.404465+00	\N	2023-03-03 11:00:00+00	\N	Check for brood	See if we have a new queen	\N	2	3	t
40	2023-02-22 01:40:48.262767+00	\N	2023-03-03 11:00:00+00	\N	Check for egg	Need to see if new queen laying	\N	2	27	t
39	2023-02-22 01:39:44.112866+00	\N	2023-03-15 11:00:00+00	\N	Check for queen and brood	Need to see if queen cell worked.	\N	2	38	t
41	2023-05-06 00:59:52.86904+00	\N	2023-05-06 12:00:00+00	\N	Feed	Need food	\N	2	36	t
47	2023-11-21 04:42:56.216049+00	\N	2023-12-21 11:00:00+00	\N	Check for eggs	Nothing on 12/16, give another week	\N	2	43	t
42	2023-05-27 02:23:16.531047+00	\N	2023-05-23 12:00:00+00	\N	Sugar shake required		\N	7	35	t
43	2023-08-20 03:29:01.009595+00	\N	2023-08-26 12:00:00+00	\N	Take out smoker lighter		2	2	36	t
44	2023-10-07 22:38:21.297637+00	\N	2023-10-01 11:00:00+00	\N	Gloves	Bring more gloves	\N	2	36	t
48	2023-11-24 22:40:47.480961+00	\N	2023-11-30 11:00:00+00	\N	Do varroa check		\N	2	36	t
45	2023-11-21 04:39:32.386299+00	\N	2023-12-07 11:00:00+00	\N	Check for eggs	Some eggs & larvae, not great tho	\N	2	3	t
46	2023-11-21 04:41:56.14065+00	\N	2023-12-07 11:00:00+00	\N	Check for eggs	Good brood, 8 frames worth	\N	2	27	t
49	2023-12-24 00:15:24.963988+00	\N	2024-01-05 11:00:00+00	\N	Check for eggs		\N	2	44	t
50	2024-01-21 19:33:07.191903+00	\N	2024-01-23 11:00:00+00	\N	Put Q in lower box		\N	2	27	t
51	2024-03-31 00:42:21.470318+00	\N	2024-03-31 11:00:00+00	\N	Feed syrup		\N	2	3	t
52	2024-03-31 00:43:30.168481+00	\N	2024-03-31 11:00:00+00	\N	Feed syrup		\N	2	46	t
53	2024-03-31 00:44:37.562209+00	\N	2024-03-31 11:00:00+00	\N	Feed syrup		\N	2	27	t
55	2024-04-13 00:33:01.706041+00	\N	2024-04-19 12:00:00+00	\N	Bring green queen marking pen		\N	2	45	t
56	2024-04-13 00:33:22.180335+00	\N	2024-04-26 12:00:00+00	\N	Feed syrup		2	2	45	t
54	2024-04-13 00:30:14.252661+00	\N	2024-04-26 12:00:00+00	\N	Feed syrup		\N	2	36	t
57	2024-05-18 00:52:20.96527+00	\N	2024-06-20 12:00:00+00	\N	Feed syrup		\N	2	46	f
\.


--
-- Data for Name: beedb_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_feedback (id, subject, detail, "feedbackType", status, "devComment", "createdDt", "lstStatusDt", "lstCommentDt", beek_id) FROM stdin;
2	Photo's for inspections	Photo's for inspections would be nice	R	N	\N	2023-04-29 21:55:23.743479+00	\N	\N	2
1	fb1	dgsfdfgf	F	A	Test comment archived	2022-11-17 05:29:52.567315+00	2023-04-29 21:55:49.306705+00	2023-04-29 21:55:49.306695+00	2
\.


--
-- Data for Name: beedb_inspection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_inspection (id, dt, notes, numbers, colony_id, disease, eggs, queen_seen, temper, varroa, weight, size) FROM stdin;
3	2020-12-05 11:00:00+00	Just check top brood box\r\nStarted storing nectar in honey super\r\nAdded 2nd super just in case	1	11	1	2	t	1	0	2	1
1	2020-12-05 20:36:50+00	Only inspected top brood box\r\nPossible supercedure cells\r\nNo activity in honey super	2	9	1	2	t	1	0	3	1
2	2020-12-05 11:00:00+00	Just checked top brood box\r\nNo activity in honey super	2	10	1	2	f	1	0	2	1
4	2020-12-05 11:00:00+00	No Queen\r\nAdded frame with brood and eggs from H1\r\nI think this one is a gonner\r\nDO NOT DO ANYMORE TO THIS NUC	4	12	1	5	f	1	0	5	1
5	2020-12-06 11:00:00+00	Looks good, ready for sale.	3	4	1	1	t	1	0	4	1
6	2020-12-06 11:00:00+00	Looks good\r\nReady for sale	3	5	1	1	t	1	0	4	1
8	2020-11-20 11:00:00+00	Queen left cage and started laying	2	10	0	3	t	1	0	3	1
7	2020-11-20 11:00:00+00	Nothing in honey super	1	9	0	1	f	1	0	3	1
9	2020-11-20 11:00:00+00	Queen left cage, laying	0	11	0	3	t	1	0	3	1
10	2020-11-14 11:00:00+00	Removed queen and caged her, taken to Coatesville	4	8	0	1	t	1	0	0	1
11	2020-11-14 11:00:00+00	Queen taken and caged, off to Coatesville	4	7	0	1	t	0	0	0	1
12	2020-11-07 11:00:00+00	Queen removed, caged and given to H1	4	6	0	1	t	1	0	0	1
13	2020-11-07 11:00:00+00	Added caged queen from QC1	1	1	0	2	t	1	0	2	1
14	2020-11-07 11:00:00+00	Added caged queen from QC1	1	1	0	2	t	1	0	2	1
15	2020-12-15 11:00:00+00	Queen definitely there, too many bees for the small colony tho	4	6	1	1	f	1	0	4	1
17	2020-12-15 11:00:00+00	Queen is there, but did not see her. Larvae present but not brood yet	4	8	1	0	f	1	0	0	1
16	2020-12-15 11:00:00+00	New queen there, but did not see her. Larvae present but not brood yet	4	7	0	3	f	1	0	0	1
19	2020-12-26 11:00:00+00	Good honey, but not ready for extraction yet	0	10	0	0	f	0	0	0	1
20	2020-12-26 11:00:00+00	Started bring in honey, slower than other hives	0	9	0	0	f	0	0	0	1
21	2020-12-26 11:00:00+00	Saw the queen, quite dark. Did not mark her as no marking pen. But nuc is working noa	3	12	0	2	t	1	0	4	1
18	2020-12-26 11:00:00+00	Took 6 frames for comb honey, bring in plenty honey now.\r\nGot 32 boxes of honey comb from this extraction	2	11	0	1	f	1	0	0	1
22	2021-01-01 11:00:00+00	Added comb cappings for them to clean out	0	1	0	0	f	0	0	1	1
23	2021-01-04 11:00:00+00	Saw queen & marked her	4	6	0	1	t	0	0	0	1
24	2021-01-04 11:00:00+00	Looked for Q but did not see her. Not sure about eggs, but brood is there. Saw a mature queen cell, left it just in case	4	7	0	0	f	0	0	0	1
25	2021-01-04 11:00:00+00	Looked for q, did not see her, but good eggs, brood & stores	4	8	0	0	f	0	0	0	1
26	2021-01-12 11:00:00+00	6 - 7 frames can be extracted nothing I. Nothing in 2nd super. Removed cappings	1	1	0	0	f	1	0	1	1
27	2021-01-12 11:00:00+00	Good stores in top super	1	2	0	0	f	0	0	1	1
28	2021-01-12 11:00:00+00	OK honey. There is a 5th super, but not drawn out at all	1	3	0	0	f	0	0	1	1
29	2021-01-12 11:00:00+00	No queen, no brood	4	7	0	5	f	0	0	4	1
30	2021-01-12 11:00:00+00	Looked for queen did nor see her, but eggs were present. Dropped frame 😒	0	8	0	0	f	0	0	0	1
31	2021-01-16 11:00:00+00	Looking OK. Some honey	1	9	1	1	t	3	1	1	1
32	2021-01-16 11:00:00+00	Looking OK, 7 frames extractable	1	10	1	1	f	3	2	1	1
33	2021-01-16 11:00:00+00	Grumpy bees, maybe 7 frames to extract	1	11	1	1	t	5	1	1	1
34	2021-01-16 11:00:00+00	Saw Queen, a dark one. Marked white	3	12	1	3	t	1	0	4	1
35	2021-01-31 11:00:00+00	One super ready to extract, other super untouched. Undersupered the full one with the empty box	0	1	0	0	f	0	0	0	1
36	2021-01-31 11:00:00+00	No brood seen, must have killed the Q last visit	4	8	0	5	f	0	0	4	1
37	2021-01-31 11:00:00+00	Blue Q seen. Very little happening in bottom brood box, but hive looks OK. Only a few frames possible for extraction.\r\nSwapped out base and gave kid painted box as bottom brood chamber	1	2	1	2	t	1	2	1	1
38	2021-01-31 11:00:00+00	Looks fine, maybe a box & a bit of frames to extract	1	3	1	1	f	3	2	1	1
39	2021-03-12 11:00:00+00	Added Apivar\r\nNot really inspected 😔	2	9	0	0	f	3	0	2	1
40	2021-03-12 11:00:00+00	Inspected top box, Queen is laying\r\nAdded Apivar	2	10	0	3	t	3	0	3	1
41	2021-03-12 11:00:00+00	Q laying well, but not much stores\r\nAdded Apivar	2	11	0	1	t	1	0	4	1
42	2021-03-12 11:00:00+00	Q is laying\r\nAdded Bayvarol	4	12	0	3	t	1	0	4	1
43	2021-03-19 11:00:00+00	Added Apivar strips	2	1	0	0	f	3	0	2	1
44	2021-03-19 11:00:00+00	Removed Q and combined with Queen castle 1 (left one).\r\nAdded Apivar strips	2	2	1	1	t	1	0	1	1
45	2021-03-26 11:00:00+00	New queen (dirty white marking) seen and eggs visible	2	2	0	3	t	0	0	0	1
46	2021-03-19 11:00:00+00	Added apivar, looks OK but a bit light	2	3	0	1	f	1	0	3	1
47	2021-03-26 11:00:00+00	Put cappings on top from extraction, only a few kg though	0	3	0	0	f	0	0	0	1
48	2021-03-19 11:00:00+00	Saw the queen, did not expect the colony to survive!	4	7	1	1	t	1	0	4	1
49	2021-04-30 12:00:00+00	Just a quick look as it was a bit quiet, but queen was there so all good I hope	0	9	0	0	t	0	0	0	1
50	2021-06-19 12:00:00+00	Looking OK for winter	3	10	0	4	t	1	0	3	1
51	2021-07-29 12:00:00+00	Put in Bayvarol\r\nRemoved entrance reducer	2	1	1	1	t	1	0	4	1
52	2021-05-21 12:00:00+00	Removed Apivar.\r\nCleaned frames and swapped top & bottom brood chambers	2	1	0	3	f	3	0	3	1
53	2021-07-29 12:00:00+00	Removed Apivar	3	2	0	0	f	0	0	0	1
54	2021-07-29 12:00:00+00	Added Bayvarol\r\nSwapped top & bottom brood chambers\r\nRemoved entrance reducer	2	2	1	1	t	1	0	3	1
55	2021-05-28 12:00:00+00	Removed Apivar	2	3	0	0	f	0	0	0	1
56	2021-07-29 12:00:00+00	Looking OK, some drone brood\r\nAdded Bayvarol\r\nSwapped top & bottom brood chambers\r\nRemoved entrance reducer	2	3	1	1	f	1	0	3	1
57	2021-09-17 12:00:00+00	Removed Bayvarol. Good pattern, and no swarm cells seen. Added super of drawn comb	1	1	1	1	f	1	0	2	1
58	2021-09-17 12:00:00+00	Good brood pattern. Removed Bayvarol. No swarm cells. Added super with foundation	1	2	1	1	f	1	0	2	1
59	2021-09-17 12:00:00+00	Removed Bayvarol. No swarm cells. Added super of foundation	2	3	1	1	f	1	0	2	1
155	2022-01-08 11:00:00+00	Looking much better. All activity in brood chamber, no storage in honey super	1	9	0	2	t	3	0	2	1
60	2021-09-18 12:00:00+00	Bayvarol removed, heavy brood & larvae in both boxes. Queen excluder and honey super added. Entrance fully opened	2	17	1	1	f	5	0	2	1
61	2021-09-21 12:00:00+00	Bayvarol removed (9th week). Not fully inspected due aggressive bees. Queen excluder and Honey super added	2	16	0	1	f	5	0	2	1
62	2021-09-21 12:00:00+00	Looking weak. I thought there was Bayvarol in the hive, but NO. Did not do it before surgery.\r\nRemoved top feeder as did not seem to be eating the syrup, suspect old straw may be the issue.\r\nReduced to single box	4	9	0	4	t	1	0	4	1
63	2021-09-24 12:00:00+00	Added 2 frame feeder and top feeder, hope there is enough food now.\r\nPut in Bayvarol, hope not too late	4	9	1	3	f	1	0	4	1
64	2021-09-24 12:00:00+00	Looks poor. removed top feeder as did not seem to be eating syrup. Was no Bayvarol, must have forgot before going into surgery	4	10	1	4	t	1	0	5	1
65	2021-09-27 11:00:00+00	Bayvarol removed, honey super & Queen excluder inserted. No to a full inspection due aggressive nature of bees	2	18	0	2	f	5	0	2	1
66	2021-09-27 11:00:00+00	Bayvarol removed. 20 frames removed and inserted into Greg's boxes. 3 queen cells removed, Hive set up ready to move to Greg's house.	1	19	0	1	t	5	0	1	1
67	2021-10-01 11:00:00+00	Split hive, took queen to new colony at Coatesville.	1	1	1	1	t	1	0	2	1
68	2021-10-01 11:00:00+00	Took 3 frames with queen cells into QC1. Otherwise looking good. Started to draw out honey super	1	2	1	1	t	1	0	2	1
69	2021-10-01 11:00:00+00	Doing OK, some practice queen cells seen, but no filled ones. Have not started to draw out honey super	1	3	1	1	f	1	0	2	1
70	2021-10-08 11:00:00+00	Building up nicely, a whole frame of eggs so queen is working well. Filled up feeder as still needs some help	3	20	1	1	f	1	0	4	1
71	2021-10-08 11:00:00+00	Brood seems to be building up, but added more sugar syrup as definately needs it	3	9	1	3	t	1	0	4	1
72	2021-10-02 11:00:00+00	brood including drones on a number of upper frames, very little larve. Where is the Queen	2	17	1	4	f	3	0	2	1
73	2021-10-08 11:00:00+00	A little brood, mainly drone cells. The honey super cleaned but no honey. Lots of honey in the brood boxes	2	17	1	4	f	3	0	2	1
74	2021-10-02 11:00:00+00	Plenty of activity in the brood boxes, two full honey frames added to lower brood box, No activity in honey super	2	18	1	2	t	0	0	3	1
75	2021-10-08 11:00:00+00	Activity increasing. Plenty of brood and larvae in upper brood box. Added honey had been eaten. No activity in honey super.	2	18	1	2	f	3	0	2	1
76	2021-10-08 11:00:00+00	lots of eggs, larvae and brood both upper & lower Brood boxes. Honey super drawn and honey starting to be deposited	1	16	1	1	f	3	0	1	1
77	2021-10-15 11:00:00+00	Looks like this hive swarmed last week. No eggs & larvae. Some queen cells (suprising!) \r\nCheck again in 2 weeks	2	2	1	5	f	1	0	3	1
78	2021-10-15 11:00:00+00	No eggs seen. Quite a few queen cells seen, some looked like swarm cells & others like supercedure cells. Took 3 frames with (supercedure?) cells and put in QC2. Check again in 2 weeks	2	3	1	5	f	1	0	3	1
79	2021-10-15 11:00:00+00	No eggs seen. Too soon, need patience	4	21	0	5	f	1	0	5	1
80	2021-10-16 11:00:00+00	Added more syrup	0	9	0	0	f	0	0	0	1
81	2021-10-16 11:00:00+00	Building well, was building silly comb. Removed frame feeder.\r\nAdded queen excluder and honey super. No a 2 level colony.	3	20	0	0	f	0	0	0	1
82	2021-10-24 11:00:00+00	Honey Super half full of honey. Upper brood box recovered from removal of 3 frames and looking full of brood	1	16	0	1	f	1	0	1	1
83	2021-10-24 11:00:00+00	What a turnaround. Upper brood box full of spotty brood eggs & larvae, Unmarked Queen spotted. Honey super fully drawn and honey being deposited	1	17	0	2	t	3	0	2	1
84	2021-10-24 11:00:00+00	Hive damp (position) and a lot of little ants in lid. Good brood & larvae in upper brood but very little activity in the Honey super	2	18	0	1	f	3	0	2	1
86	2021-10-24 11:00:00+00	Building strongly	0	20	1	1	f	3	0	4	1
85	2021-10-24 11:00:00+00	Building slowly. Still some syrup in feeders so left it	3	9	0	3	t	1	0	0	1
87	2021-10-29 11:00:00+00	No queen or brood, might have swarmed	2	1	1	5	f	1	0	1	1
88	2021-10-29 11:00:00+00	No eggs or larvae seen, think hive swarmed	2	2	1	5	f	1	0	3	1
89	2021-10-29 11:00:00+00	No eggs or larvae seen, think the hive swarmed	2	3	1	5	f	1	0	3	1
90	2021-10-29 11:00:00+00	Did not see queen, but eggs &  brood present	4	21	1	1	f	1	0	4	1
91	2021-10-29 11:00:00+00	No eggs or brood	4	22	0	5	f	1	0	0	1
92	2021-10-29 11:00:00+00	Saw q and marked her Yellow. Combined with S1	3	24	1	1	t	1	0	4	1
94	2021-10-29 11:00:00+00	Honey super half full. A second honey super added. Upper brood box checked. Good eggs, larvae and brood	1	16	0	1	f	3	0	1	1
93	2021-10-29 11:00:00+00	Honey being deposited in honey super. Upper brood box checked and AFB match stick test done. All good, Spotty brood, eggs and larvae sighted	1	17	0	2	f	3	0	1	1
95	2021-10-29 11:00:00+00	White dot Queen sighted. Very little happening in honey super. Upper brood checked and good for eggs, larvae and brood	1	18	0	1	t	3	0	2	1
96	2021-11-05 11:00:00+00	Not very good yet. Removed feeders and Bayvarol.	3	9	0	3	f	1	0	4	1
97	2021-11-05 11:00:00+00	White dot Queen. Small but looking ok	3	20	0	1	t	1	0	4	1
98	2021-11-05 11:00:00+00	Saw Queen &  marked her Yellow. But no eggs or larvae. Check in a week	1	1	0	5	t	1	0	1	1
99	2021-11-05 11:00:00+00	No queen or eggs seen	2	2	0	0	f	1	0	3	1
100	2021-11-05 11:00:00+00	No queen or eggs seen	2	3	0	0	f	1	0	4	1
101	2021-11-05 11:00:00+00	Saw &  marked queen yellow. All frames full of brood	4	21	0	1	t	1	0	0	1
102	2021-11-05 11:00:00+00	No queen or eggs seen	4	22	0	5	f	1	0	0	1
103	2021-11-05 11:00:00+00	Good brood and larvae in upper brood box. Lower honey super half full while bees are busy in upper brood	1	16	0	1	f	3	0	1	1
104	2021-11-05 11:00:00+00	Good brood patterns and larvae in upper  brood box. The honey super drawn out but no honey as yet.	2	18	0	1	f	3	0	2	1
106	2021-11-05 11:00:00+00	Check a couple of brood for AFB - okay.\r\nThe brood is very spotty and only mature larvae. Things don't seem right	2	17	0	3	f	3	0	2	1
107	2021-11-16 11:00:00+00	Saw eggs, larvae & brrod. Phew, the hive is OK	1	1	0	2	f	1	0	2	1
108	2021-11-16 11:00:00+00	Saw eggs, larvae & brood. Also saw Queen and marked her yellow.	2	2	0	2	t	1	0	3	1
156	2022-01-08 11:00:00+00	Doing fine, lots of nectar, not mu h capped. Added extra super	1	20	0	1	t	1	0	1	1
110	2021-11-16 11:00:00+00	Looking good. Took 2 frames from here and put them in H4.	3	24	0	1	t	1	0	4	1
111	2021-11-16 11:00:00+00	Overloaded with bees so will split and create another QC. Saw the queen & tried to cage her, but in getting ready I lost sight of her 😒. Took 2 frames so only one left, but lots of bees.	4	21	0	1	t	1	0	0	1
112	2021-11-16 11:00:00+00	White dot Queen. Hive still pathetic. Requeen when possible	3	9	0	2	t	1	0	4	1
113	2021-11-16 11:00:00+00	Looking OK. White queen	2	20	0	1	t	1	0	3	1
114	2021-11-17 11:00:00+00	Good egg, larvae and brood. Two frames with eggs & larvae transferred to Art hive. Lower honey super half full and upper started to be filled	1	16	0	1	f	3	0	1	1
115	2021-11-19 11:00:00+00	Lots of egg, larvae and brood in upper brood box.  Bees are now filling the honey super.	2	18	0	1	f	3	0	2	1
116	2021-11-17 11:00:00+00	While I found two frames with eggs and larvae. Nothing else. Suspect eggs are old. No bee activity m\r\nnearby, Transferred two frames from rose Hive to help spark Queen activity	2	17	0	4	f	3	0	3	1
117	2021-11-19 11:00:00+00	I think I saw an unmarked queen but no chance to mark. The two transferred frames seem okay. Nothing doing in the honey super	2	17	0	3	t	3	0	3	1
118	2021-11-30 11:00:00+00	Building well	2	24	0	1	t	1	0	3	1
119	2021-11-30 11:00:00+00	No eggs, reduced to single storey, Saw a queen cell that had hatched so there is hope.	3	3	0	5	f	1	0	4	1
120	2021-11-30 11:00:00+00	Looking good	4	22	0	1	t	1	0	4	1
121	2021-11-30 11:00:00+00	No queen or eggs seen. Think I killed her by accident on last inspection. Saw a queen cell so there is hope	4	21	0	5	f	1	0	4	1
122	2021-11-30 11:00:00+00	A split from QC1. Saw a queen cell	4	25	0	5	f	1	0	4	1
123	2021-11-27 11:00:00+00	The hive just not right. Checked for varoa - nil, AFB nil, Switch the Brood boxes and place the bee escape between them in an attempt to hatch the remaining brood cells	3	17	0	4	f	1	1	3	1
124	2021-12-07 11:00:00+00	Lower Honey super nearly all capped, upper honey super partially sealed. Add a third honey super	1	16	0	1	f	3	0	1	1
125	2021-12-07 11:00:00+00	Lower brood box  saw new eggs, brood and larvae. Queen not sighted. Remove upper brood box, bin 8 frames. Leave honey super on	3	17	0	3	f	3	0	4	1
126	2021-12-07 11:00:00+00	Honey supper just about full but only a little  sealed.  Probably needs an additional honey super soon	1	18	0	1	f	3	0	1	1
127	2021-12-10 11:00:00+00	Looks like it may have swarmed, no eggs or queen seen. There were queen cells tho. Fair brood still, good stores. Going to move to Coatesville and combine with weak hive there	3	24	1	5	f	1	0	3	1
128	2021-12-10 11:00:00+00	Looking good and building well	1	1	1	2	t	1	0	1	1
129	2021-12-10 11:00:00+00	No queen or eggs seen. Added frame from QC2 with I think a queen cell. Removed honey super	2	2	1	5	f	1	0	2	1
130	2021-12-10 11:00:00+00	Looked for queen as was going to cage and give to H3. Did not find her. Took frame with queen cell and gave to H3	4	22	1	1	f	0	0	4	1
131	2021-12-18 11:00:00+00	Looks better than before, Queen laying well. Combined with @S2	3	9	0	1	t	1	0	3	1
132	2021-12-18 11:00:00+00	Still no queen or eggs. Combined with @C1	3	24	0	5	f	1	0	3	1
133	2021-12-18 11:00:00+00	Looking good and busy. Added honey super. Now 1 brood box and 2 supers	2	20	0	1	f	1	0	2	1
134	2021-12-18 11:00:00+00	Check out the honey supers. Bottom full moved to top with bee escape seperating. Middle 3/4 full, now new bottom and old top 1/2 full now middle	1	16	0	0	f	3	0	1	1
135	2021-12-18 11:00:00+00	Had a good look for the Queen,not sighted. However a filled Queen cell being fed spotted. Still brood and old larvae on two central frames	4	17	0	4	f	1	0	4	1
136	2021-12-18 11:00:00+00	Check out honey super which is 1/2 full of sealed honery comb. A second honey super added.	1	18	0	1	f	3	0	1	1
137	2021-12-23 11:00:00+00	Definately a queen there, but brood is all over the place	2	2	1	2	f	1	0	2	1
139	2021-12-23 11:00:00+00	Definately a queen there, but did not see her	4	25	0	1	f	1	0	0	1
140	2021-12-23 11:00:00+00	No queen or eggs seen	4	21	0	5	f	1	0	0	1
141	2021-12-23 11:00:00+00	No queen or eggs seen	4	22	0	5	f	1	0	0	1
142	2021-12-22 11:00:00+00	Hive very busy. Remove full honey super and replace with new honey super. Take the other filled honey super and place it above bee escape in preparation for next week's harvesting	1	16	0	0	f	3	0	1	1
143	2021-12-22 11:00:00+00	The new upper honey super being drawn out and the lower honey super 3/4 full. Swop them over.	1	18	0	0	f	3	0	1	1
144	2021-12-23 11:00:00+00	Very quiet with a liittle larvae on two central frames. Did note the possible queen cell sealed. hoping for positive results.	4	17	0	4	f	1	0	4	1
145	2021-12-31 11:00:00+00	The queen cell empty. No brood or larvae. Lets hope the Queen was out mating	4	17	0	5	f	1	0	0	1
148	2022-01-05 11:00:00+00	Looks OK but not stunning. Took a frame with eggs & brood and put into QC1	1	1	1	2	f	1	2	2	1
149	2022-01-05 11:00:00+00	Nothing happening. Added frame with eggs & brood from H1. Not sure if there are enough bees to keep it going	5	21	0	5	f	1	0	5	1
150	2022-01-05 11:00:00+00	Nothing in bottom box, so removed it. Some old looking brood and a few larvae, very strange. Have combined with QC2 in a single box, holding fingers	3	2	0	5	f	1	0	4	1
151	2022-01-05 11:00:00+00	Saw queen and marked her yellow. Took a frame with eggs to try and restart QC2	4	25	0	1	t	1	0	0	1
152	2022-01-07 11:00:00+00	Now down to one brood box. No eggs or larvae. Too late to merge with another particular with health risk. will let the hive die out.	5	17	0	5	f	1	0	4	1
153	2022-01-07 11:00:00+00	Remove one empty honey super. Check top brood box, good brood patterns. One honey super almst full, lower one nearly drawn out and being filled	1	16	0	1	f	3	0	1	1
154	2022-01-07 11:00:00+00	Upper brood - good brood patterns. Lwer Honey super - nearly fully drawn and commence being filled, Upper honey super nearly full. remove last honey super	1	16	0	1	f	3	0	1	1
109	2021-11-16 11:00:00+00	Definitely queenless. Took 2 frames from the swarm colony with eggs & larvae. Hopefully they can make a new queen	2	3	0	5	f	3	0	3	1
157	2022-01-11 11:00:00+00	Strange, some larvae, did not see eggs or queen. May be too soon after combining	3	2	0	4	f	1	0	4	1
138	2021-12-23 11:00:00+00	Saw brood & eggs, but did not see Queen. Added a queen excluder & honey super, but do not expect anything for a while.	3	3	0	3	f	1	0	3	1
158	2022-01-11 11:00:00+00	Saw Q & marked her yellow. Maybe too soon as I did not see any eggs	3	3	1	5	t	3	0	5	1
159	2022-01-25 11:00:00+00	Looking fine	4	25	0	2	t	1	0	4	1
160	2022-01-25 11:00:00+00	Saw empty Queen cells, but no queen or eggs yet	4	26	0	5	f	1	0	4	1
161	2022-01-25 11:00:00+00	No queen or eggs seen, patience needed	4	21	0	5	f	1	0	4	1
162	2022-01-25 11:00:00+00	Looking OK, but not much honey, kind of as expected at this time of year	1	1	0	2	t	1	0	1	1
163	2022-01-28 11:00:00+00	Varoa check, possibly 2. Brood and larvae in both upper and lower brood boxes plus a lot of honey in upper. Upper honey boxes , lower being drawn out and upper 50% full. Queen not seen,	1	16	0	1	f	1	2	1	1
164	2022-01-20 11:00:00+00	hive had been robbed, Take out remaining frames and strip down,  Hive dead and now decommissioned	5	17	0	5	f	0	0	5	1
165	2022-01-20 11:00:00+00	Full inspection. Brood and larvae principally lower brood box but a little in upper. While spot Queen seen, Upper honey super 2/3 full, Lower honey super being drawn out.	1	18	0	2	t	3	1	1	1
166	2022-01-20 11:00:00+00	Brood boxes upper a liitle brood and a lot of honey, lower good brood and larvae. Upper honey 2/3 full, Lower honey\r\njust being drawn out	1	18	1	2	t	3	1	1	1
167	2022-01-20 11:00:00+00	Brood boxes upper a liitle brood and a lot of honey, lower good brood and larvae. Upper honey 2/3 full, Lower honey\r\njust being drawn out	1	18	1	2	t	3	1	1	1
168	2022-01-20 11:00:00+00	Brood boxes upper a liitle brood and a lot of honey, lower good brood and larvae. Upper honey 2/3 full, Lower honey\r\njust being drawn out	1	18	1	2	t	3	1	1	1
169	2022-02-08 11:00:00+00	OK, not great. Removed honey super, nothing happening there	2	9	0	2	f	1	0	3	1
170	2022-02-08 11:00:00+00	White Q, should replace. Could extract 6 frames. Removed a honey super	1	20	0	1	t	1	0	1	1
171	2022-02-25 11:00:00+00	Brood quite spotty, good bee numbers tho. Should replace the queen	2	9	1	3	t	3	0	3	1
172	2022-02-25 11:00:00+00	Some dead brood in cells, did not detect afb. Strange 'dwarf' bees seen? Should replace Q	1	20	3	3	t	1	0	2	1
173	2022-03-04 11:00:00+00	Brood only on 4 frames, and no honey stores. May have to feed a bit later.	3	3	0	3	t	1	0	4	1
174	2022-03-04 11:00:00+00	Saw the queen, nice & light amber. Marked her with a yellow dot. Colony looking good	4	21	0	2	t	1	0	0	1
175	2022-03-04 11:00:00+00	Saw the queen, colony looking good.	0	25	0	1	t	1	0	0	1
176	2022-03-04 11:00:00+00	Place bee escape below upper honey super.\r\nLooks like 6.5 frames ready for processing	1	18	0	0	f	0	0	0	1
177	2022-02-20 11:00:00+00	Checked through the hive. Brood & larvae on bottom two supers + honey. Upper honey frame 5 frames, lower nothing	1	18	0	2	f	3	0	1	1
178	2022-03-04 11:00:00+00	Checking for honey, 8 frames ready,\r\nClose the entry too half as predatory wasp spotted  working around	1	16	0	0	f	1	0	1	1
179	2022-02-20 11:00:00+00	Good brood patterns plus honey on brood frames. 5 frames of honey ready in upper honey super, lower honey frames being drawn.	1	16	0	1	f	3	1	1	1
180	2022-03-08 11:00:00+00	Destroyed existing queen and added new queen in a cage from Torbay, QC1	2	9	0	2	t	1	0	0	1
181	2022-03-08 11:00:00+00	Removed queen, and caged her. Took to Coatesville H1	0	21	0	0	t	0	0	0	1
182	2022-03-11 11:00:00+00	Take 9 full or partially full frames from upper honey super.  Extract approx. 10 kg honey	1	16	0	0	f	0	0	0	1
183	2022-03-11 11:00:00+00	remove 6 frames partial or full from upper honey super,  Approximately 5 kg of honey	1	18	0	0	f	0	0	0	1
184	2022-03-12 11:00:00+00	Queen is out of her cage, but did not see her & saw no eggs.	0	9	0	0	f	0	0	3	1
185	2022-03-17 11:00:00+00	Added Apivar	0	1	0	0	f	0	0	0	1
186	2022-03-17 11:00:00+00	Added Apivar. Looked good, lots of bees	0	3	0	0	f	0	0	0	1
187	2022-03-26 11:00:00+00	Hive checked out , Apivar inserted and the hive reduced to two brood supers. 3 honey frames removed and stored in freezer	1	18	0	2	t	3	0	1	1
188	2022-03-26 11:00:00+00	Hive reduced to two brood boxes, apivar inserted and honey frames shuffled around.\r\nGood brood and larvae	1	16	0	1	f	0	0	1	1
189	2022-03-31 11:00:00+00	Dead. Wasps or varroa	0	1	1	5	f	0	0	5	1
190	2022-03-31 11:00:00+00	No queen, and no brood. Will leave it to fade away	4	25	0	5	f	0	0	0	1
191	2022-03-31 11:00:00+00	Looks OK. Not much stores tho	2	9	1	3	t	1	0	4	1
192	2022-04-09 12:00:00+00	Busting with bees, added additional super so they can put some stores away	1	3	1	1	t	1	0	3	3
193	2022-04-14 12:00:00+00	Queen migrated to the upper brood box with reasonable brood on 5 frames. Good honey supplies. Lower brood old brood and some honey	2	16	0	2	t	3	0	1	3
194	2022-04-14 12:00:00+00	Principally larvae and brood on top brood box. Good honey stocks	2	18	0	2	f	3	0	1	3
195	2022-04-29 12:00:00+00	Looking OK. Could do with more stores tho	3	9	1	3	t	1	0	2	3
196	2022-04-29 12:00:00+00	Heaps of bees, bringing in some stores	2	3	1	1	f	1	0	3	4
197	2022-05-10 12:00:00+00	Kim Kneijber came to run a 24hr Apisan check on hive, Some useful tips provided.Namely drop to one level, insulation and treatment in earlier (mid Feb)	3	16	0	3	f	0	0	0	3
198	2022-05-10 12:00:00+00	Kim Kneijber came to run a 24hr Apisan check on hive, Some useful tips provided.Namely drop to one level, insulation and treatment in earlier (mid Feb)	2	18	0	3	t	1	0	0	3
199	2022-05-11 12:00:00+00	Kim, removed 24 hr treatment and observed 15 mite from the hive. Also red ants which reqire treatment	2	16	1	3	f	1	3	1	3
200	2022-05-11 12:00:00+00	Kim removed the treatment and sticky pad. Found 8 mite and a red ant. Suggested ant poison. Otherwise hive okay	2	18	3	3	f	1	4	1	3
201	2022-05-13 12:00:00+00	Drop to 1 high, 9 frames using cardboard sheeting to give insulation.	3	16	0	3	f	1	0	2	3
202	2022-05-13 12:00:00+00	Drop to 1 high super with 9 frames and using cardboard as insulation	2	18	0	3	f	1	0	2	3
203	2022-05-21 12:00:00+00	Looking good, bringing in extra honey in top box. No varroa on a sugar shake test	1	3	1	1	t	3	1	2	4
338	2023-03-22 11:00:00+00	Two frames of Corflute NUC transferred	0	35	0	1	t	1	0	2	2
204	2022-05-21 12:00:00+00	Suprise, there was brrod & larvae. Saw the queen & marked her yellow, quite a black bee.	3	25	1	3	t	1	0	3	2
205	2022-05-21 12:00:00+00	Looking OK. Put on a feeder with some nectar. Removed Apivar. Reduced to 1 level	3	9	1	3	t	1	1	3	3
206	2022-05-27 12:00:00+00	Remove Apisan strips and add Coreflute for insulation. Two central frames with larvae and brood. The hive appeared happy	3	17	0	3	t	1	0	2	3
207	2022-05-27 12:00:00+00	Apisan strips removed, coreflute added to increase insulation. Two frames with brood and larvae. The hive appeared happy.	3	18	0	3	t	1	0	2	3
208	2022-06-27 12:00:00+00	Looks small, and no stores. Gave them 5 l of 1:1 syrup in a top feeder	3	9	1	3	t	1	0	5	3
209	2022-06-24 12:00:00+00	Looking strong. Almost too good to be true, keep an eye on stores	1	3	1	1	t	1	0	2	4
210	2022-06-10 12:00:00+00	Two frames good brood and larve. Unmarked Queen spotted.  Hive is appearing to winter well	2	16	0	3	t	1	0	3	3
211	2022-07-22 12:00:00+00	3 middle frames good brood and larve. Queen not seen.  Still honey frames for feed. Hive wintering well.	2	16	0	1	f	1	0	3	3
212	2022-06-10 12:00:00+00	Only two frames with brood and larve. Old Queen spotted.	3	18	0	0	t	0	0	0	3
213	2022-07-22 12:00:00+00	Only two frames with part brood and a little larve. Still good honey frames available for feed. Queen not seen and hive appears to be in decline.	3	18	0	4	f	1	0	0	3
214	2022-07-29 12:00:00+00	Small, but OK brood amount for qty of bees.\r\nGave 6kg 1:1 syrup	3	9	1	3	t	1	0	4	3
215	2022-07-29 12:00:00+00	Looking strong. Only one varroa on a test. But not much stores, need to keep an eye on it	1	3	1	1	t	1	2	3	4
216	2022-07-29 12:00:00+00	Put in 4 Bayvarol strips. Hive looks good, with brood and larvae. Openned up entrance to about 1 inch	2	16	0	1	f	3	0	2	3
217	2022-08-10 12:00:00+00	Insert 4 Bayvarol strips. Hive seems to be okay, with old queen spotted + plenty of stores	3	18	0	3	t	1	0	3	3
218	2022-08-19 12:00:00+00	Small but looks healthy. Have not touched syrup in top feeder, left it in case. Added a frame feeder with 3kg syrup. Put in Bayvarol	3	9	1	3	t	1	0	4	3
219	2022-08-20 12:00:00+00	Added Bayvarol,  hope not too late. Looks v strong but was stunned by varroa numbers. 2 weeks ago we saw 1, today 16.	1	3	1	1	f	1	5	4	4
220	2022-08-31 12:00:00+00	Hive hanging in with larvae and brood cells on two frames. Added a full honey frame. Queen not seen.	3	18	0	3	f	3	0	0	3
221	2022-08-31 12:00:00+00	Hive busy. good brood and larvae on 3 frames. Possible drone brood cells Added 2nd frame with 2 honey frames and drawn frames,	1	16	0	1	f	3	0	0	3
222	2022-08-31 12:00:00+00	Looks good, no queen cells seen. Saw no deformed wing either	1	3	1	2	f	1	0	4	4
223	2022-09-03 12:00:00+00	Still v small. Added some more syrup	3	9	1	3	t	1	0	4	3
224	2022-09-07 12:00:00+00	AFB check (all good), two frames with part brood and larvae. A queen cell on one frame. Add frame of sugar/water solution and vitamen pattie	3	18	0	3	f	1	0	3	3
225	2022-09-07 12:00:00+00	Checked for AFB - all good, growth in eggs,larvae and brood. Upper brood box appears to be honey deposits, Add sugar/water solution and a vitamin pattie	1	16	0	1	f	1	0	3	3
226	2022-09-16 12:00:00+00	Split so now single brood chamber. No queen as Q went to H3. Saw some basic Q cells	1	3	1	1	t	3	0	4	4
227	2022-09-25 11:00:00+00	Still not much foraging. Gave a pollen patty and some 2:1 syrup	2	27	0	5	t	1	0	4	3
228	2022-09-15 12:00:00+00	AFB and general check. Looking good. Queen laying in top brood box	2	16	0	1	f	1	0	0	3
229	2022-10-03 11:00:00+00	Bayvarol treatment removed. Good brood, larvae and eggs in both boxes. Add honey super. Fully open entrance. Feed more sugar syrup	2	16	0	1	f	1	0	0	3
230	2022-09-21 12:00:00+00	Queen cell disapeared. Sugar solution and pattie added Still only two frames of brood	3	18	0	3	t	1	0	0	3
231	2022-10-03 11:00:00+00	Queen captured and remarked with yellow dot. Add more sugar syrup. Needs to be requeened and better check for disease	3	18	3	2	t	1	0	0	3
232	2022-10-07 11:00:00+00	No evidence of a laying queen. Saw some empty q cells though	2	3	1	5	f	1	0	3	4
233	2022-10-04 11:00:00+00	Heaps of pollen coming in, much of the syrup eaten. Looking like it is building nicely	2	27	1	2	t	1	0	3	3
236	2022-10-10 11:00:00+00	Building well. Added a honey super over a queen excluder. Removed top feeder	2	27	1	2	f	1	0	3	3
235	2022-10-12 11:00:00+00	Inspection done by Vic Dundas who inserted 2 of his queen cells. He removed the Bayvarol but also said he saw a queen on one of the frames. Added a top feeder, will get Alison to add some syrup soon.	2	3	0	5	f	0	0	0	4
237	2022-10-23 11:00:00+00	Check on honey super, Bees starting to draw out the frames. One frame replaced	1	16	0	1	f	1	0	0	3
238	2022-10-10 11:00:00+00	Place Queen Cell between brood cells	3	18	0	3	f	1	0	0	3
239	2022-10-23 11:00:00+00	No sign of virgin queen nor old yellow dot queen	3	18	0	4	f	1	0	0	3
240	2022-10-10 11:00:00+00	A queen cell inserted	1	28	0	0	f	3	0	0	3
241	2022-10-23 11:00:00+00	Brood on 2 frames. Lots of honey. No sign of virgin Queen	1	28	0	0	f	3	0	0	3
242	2022-10-31 11:00:00+00	Inspection by Vic. Saw the Queen &  marked her red. Good brood so must have been mated for a while	1	3	1	1	t	1	1	3	4
243	2022-10-31 11:00:00+00	Inspection by Vic. Did not see queen, but 7 frames with good brood. No varroa on a sugar shake test	2	27	1	1	f	1	1	4	3
234	2022-10-10 11:00:00+00	No evidence of any queen. Saw a likely queen cell though. But going to put in one of Vic's queen cells on Thurs	2	3	1	5	f	1	0	3	4
244	2022-10-12 11:00:00+00	Removed bayvarol, looking good	2	27	1	1	f	1	0	4	3
246	2022-11-07 11:00:00+00	Mated Queen marked with red dot. Sugar test - zero Varroa. Good brood patterns on two frames plus eggs & larvae on another. Open up two entrances.Honey super added.	2	18	1	2	t	3	1	3	3
247	2022-11-07 11:00:00+00	Bottom two supers full of brood, hive very strong. Honey super almost full and now being capped. Add a second honey super. Sugar test - 1 varroa	1	16	1	1	f	3	2	1	3
248	2022-11-03 11:00:00+00	Queen caged and given to Greg B.\r\nCorflute frames taken up to Kaipara for grafting purposes	2	28	0	2	t	0	0	0	3
249	2022-11-04 11:00:00+00	Two frames only and a few bees. Back from Kaipara. Will prepare for Queen raising	4	28	0	5	f	1	0	0	3
250	2022-11-12 11:00:00+00	Inspection by Vic. Good brood but bee number not huge yet. Good pollen coming in. Building nicely 5 frames with brood.	2	3	1	1	t	1	0	4	4
251	2022-11-12 11:00:00+00	Inspection by Vic. 9 frames with brood, most of honey super drawn out. Looking strong	1	27	1	1	t	1	0	3	3
252	2022-11-12 11:00:00+00	Corflute brought back from Kaipara with lots of Kaiapara bees on 2 full frames of brood, 1 honey, 1 pollen and feeder. QC inserted	2	28	0	2	f	0	0	0	3
253	2022-11-12 11:00:00+00	2nd honey super added. 4 brood frames and bees taken out as base for wooden triple NUC.\r\nLower honey super almost full	1	16	1	1	f	3	2	1	3
254	2022-11-12 11:00:00+00	Check for queen. Just not seen and no eggs or young larvae. I think I damaged it while marking	2	18	0	2	f	0	0	0	3
255	2022-11-14 11:00:00+00	Queen not seen. Place two QC in hoping one will requeen	2	18	0	2	f	0	0	0	3
256	2022-11-18 11:00:00+00	Remove bozies. QC empty so hopefully virgin queen is running around	2	18	0	4	f	3	1	0	3
257	2022-11-13 11:00:00+00	The L & R cells loaded with frames from Rose hive. Mated queen added to L and QC into R	0	17	0	1	f	0	0	0	2
258	2022-11-18 11:00:00+00	L looking okay with red dot mated queen. \r\nR bozie removed and tried adding bees. A little weak.	3	17	0	4	f	0	1	0	2
259	2022-11-18 11:00:00+00	Looking okay, bozie removed	1	28	0	0	f	0	0	0	3
260	2022-11-26 11:00:00+00	Looks good. Added a honey super	1	27	1	1	f	1	0	2	3
261	2022-11-26 11:00:00+00	Red Queen seen. 5 frames brood, not grown much since 2 weeks ago	3	3	1	1	t	1	0	4	4
262	2022-12-04 11:00:00+00	Queen appears to be laying. Marked with red dot.	1	28	1	3	t	3	0	0	3
263	2022-12-04 11:00:00+00	Left - strong,Queen laying well\r\nRight - no queen. random drone brood	1	17	0	1	f	1	0	0	2
264	2022-11-23 11:00:00+00	No Queen seen. Take a frame of eggs and larvae from Rose hive and insert in lower brood box	2	18	0	3	f	0	0	0	3
265	2022-12-04 11:00:00+00	Good brood and larvae on 4th frame. Thought I saw a queen, good part black. Hive appeared a little stronger	2	18	0	3	f	3	0	0	3
266	2022-12-06 11:00:00+00	Queen sighted, not sure if she is laying.\r\nJust the one frame with larvae	2	18	0	3	t	3	0	3	3
267	2022-12-06 11:00:00+00	Transfer Left compartment to Jim's NUC.	0	17	0	0	f	0	0	0	2
268	2022-12-06 11:00:00+00	Red dot queen seen, unsure whether she was laying	1	28	0	0	t	0	0	0	3
269	2022-12-09 11:00:00+00	Looking strong. Honey super is filling up, hopefully a good harvest before new year	1	27	1	1	f	1	1	1	3
270	2022-12-09 11:00:00+00	Hive not really building at all. Still only 5 frames of brood, and brood pattern a bit spotty. Put a empty, drawn out frame in the middle of the brood, maybe that will help things along.	3	3	1	2	t	1	2	4	4
271	2022-12-09 11:00:00+00	Check on honey supers. Lower manipulated to organised all frames to be capped.	1	16	0	0	f	0	0	0	3
272	2022-12-09 11:00:00+00	Check on progress. Hive appears a little stronger but unmarked queen not seen	2	18	0	2	f	1	0	0	3
273	2022-12-23 11:00:00+00	Queen not seen, but eggs, larvae and brood on now 5 frames. Starting to build nicely	2	18	1	2	f	1	1	2	3
274	2022-12-21 11:00:00+00	Take two frames off for Christmas Honey comb presents. Manipulate other honey frames	1	16	0	1	f	3	1	1	3
275	2022-12-17 11:00:00+00	Checked for virgin Queen development. Not sighted. Lots of brood and old larvae.	1	28	0	1	f	1	1	2	3
276	2022-12-22 11:00:00+00	Checked virgin queen progress. Not sighted	1	28	0	1	f	1	1	2	3
277	2022-12-12 11:00:00+00	Queen cells placed in left and right compartments.  The left compartment had two frames of bees, brood and larvae from Ross hive	3	17	0	3	f	0	0	0	2
278	2022-12-17 11:00:00+00	Left NUC - virgin queen spotted\r\nRight NUC - eggs but no sign of virgin / mated queen	1	17	0	3	f	1	0	0	2
279	2022-12-21 11:00:00+00	Left NUC - Queen not seen\r\nRight NUC - ditto, but think I can see eggs	3	17	0	3	f	1	0	0	2
281	2022-12-26 11:00:00+00	Not building at all well. Might re-queen early next year if Vic has a spare.	3	3	1	2	f	1	0	4	4
282	2022-12-26 11:00:00+00	Building really well, 4 - 5 frames with eggs / brood	2	36	0	1	t	1	0	3	3
280	2022-12-26 11:00:00+00	Looking nice. Added bee escape, will take off some honey in 2 days.	1	27	1	1	f	1	0	1	3
283	2022-12-30 11:00:00+00	Cage empty, but no sign of virgin queen. A lot of the brood hatched	2	35	0	4	f	1	0	0	2
284	2022-12-30 11:00:00+00	Check for queen - not sighted. Brood hatching, no sign of eggs and young larvae.	0	28	0	3	f	1	0	0	3
285	2022-12-30 11:00:00+00	left- Laying queen. Tried to mark but flew away. Right - No sign of queen, no sign of eggs or young larvae	0	17	0	4	f	1	0	0	2
286	2022-12-30 11:00:00+00	Six frames of brood and mature larvae. Queen not seen. (Good search) What's going on.\r\nOnly a little honey in honey super	2	18	0	2	f	1	0	0	3
287	2023-01-07 11:00:00+00	Looking good still. Added the wets back on, a bit late, extraction was over a week ago.	1	27	1	1	t	1	0	1	3
288	2023-01-07 11:00:00+00	No eggs seen. There was 2 swarm cells so I took these and put in a queen castle. Also looked like there was a hatched supercedure cell, so will give it 2 weeks and see if I get a new queen.	2	3	1	4	f	3	0	4	4
289	2023-01-07 11:00:00+00	Principally to check the wets. Place another honey super on below wets and bee escape.	1	16	0	0	f	5	0	0	4
290	2023-01-07 11:00:00+00	left - a number of queen cells. Two well developed left in place.     \r\nRight - numbers dwindling,	0	17	0	4	f	0	0	0	2
292	2023-01-07 11:00:00+00	Just about all brood hatched. Bees drawing out introduced frames. otherwise nothing happening	2	28	0	4	f	1	0	0	3
291	2023-01-07 11:00:00+00	Not a lot happening. I now question whether I should have split the two full NUCs (1 corflute, the other wooden) No sign of introduced queen	3	35	0	4	f	1	0	0	2
293	2023-01-13 11:00:00+00	I think this was a mistake, unlikely to survive.	4	37	0	5	f	0	0	0	3
294	2023-01-13 11:00:00+00	No eggs seen, looks like a queen cell or so have hatched. Added a frame from nuc with eggs & larvae just in case.	1	3	1	4	f	1	0	3	4
295	2023-01-13 11:00:00+00	Looking good, took a frame for H4, don't think it will be missed.	1	36	0	1	f	1	0	3	3
296	2023-01-16 11:00:00+00	Put into a full box, and gave them a frame feeder with some syrup that was there. Added 3 drawn frames and left a entrance reducer on with a medium sized entry. Going to rename to C1	2	36	0	1	t	1	0	4	3
297	2023-01-21 11:00:00+00	Did not see the queen, but plenty of eggs & larvae. Bringing in some nectar so hope for another honey crop	1	27	1	1	f	1	0	1	3
298	2023-01-21 11:00:00+00	New Q in the hive, looks to be laying well. Will leave her a bit before marking her to see if she keeps up the good start.	2	3	1	3	t	1	0	3	4
299	2023-02-02 11:00:00+00	Starting to build. 6 frames with brood or eggs. Removed the feeder & added a drawn frame. Still just 1 level.	2	36	1	2	t	1	0	3	3
300	2023-02-06 11:00:00+00	Good eggs, larvae and brood with honey on outer frames of bottom two boxes. Lower honey super half full honey. Top honey super -bbees slowly drawing out frames	1	16	1	1	f	3	0	2	4
301	2023-02-06 11:00:00+00	Brood box with 4 frames of larvae & brood.  Queen spotted, almost black, escaped marking. Possible Chalkbrood. A little honey in top box	2	18	3	2	t	3	0	3	3
302	2023-02-06 11:00:00+00	The Corflute hive (very weak) recombined with wooden NUC. No sign of VQ	3	35	0	4	f	1	1	2	2
303	2023-02-06 11:00:00+00	The left hive transferred to Yellow NUC including a new red dot queen. The right hive cleaned out due wax moth. Decommissioning Multi NUC for cleaning	3	17	0	3	f	0	0	3	2
304	2023-02-06 11:00:00+00	Three frames taken from Multi NUC and a further three empty frames added. A poorly marked red dot queen should have been transferred	3	34	0	3	f	3	0	0	2
305	2023-02-04 11:00:00+00	Still looking strong	1	27	1	1	f	1	2	1	3
306	2023-02-04 11:00:00+00	Boohoo. Looking good, saw Queen but killed her while trying to mark her. Very grumpy.	2	3	1	1	t	1	1	3	4
307	2023-02-10 11:00:00+00	No eggs, saw 3 queen cells. Now wait & see	2	3	1	5	f	1	0	3	4
308	2023-02-19 11:00:00+00	Removed queen and put in a new mated queen from Vic. Original queen put into QC3	1	27	0	0	t	0	0	0	3
309	2023-02-21 11:00:00+00	Romoved existing yellow dot queen (& disposed of her). Added a queen cell from Vic	2	38	0	0	t	0	0	0	2
310	2023-02-21 11:00:00+00	New queen had got out of cage.	0	27	0	0	f	0	0	0	3
311	2023-02-11 11:00:00+00	Removed feeded and added an empty frame. Looks like the colony building OK	0	36	1	2	t	1	0	3	3
312	2023-02-27 11:00:00+00	Eight frames with eggs,larvae and brood. Move one honey frame to lower brood. Place the bee escape between brood and honey super, Place 2 strips of Apivar in lower brood. close up entrance to one openning.	2	18	0	1	f	1	1	4	3
313	2023-02-27 11:00:00+00	Remove upper honey super. Check virgin queens, 3 operating. Close up entrance.	1	16	0	1	f	3	1	2	4
314	2023-02-27 11:00:00+00	QC open but no sign of virgin queen. One strip of Apivar placed centrally	2	28	0	3	f	0	0	0	3
315	2023-02-27 11:00:00+00	Nuc has been robbed out.  A wax moth frame removed earlier. I will decommission unit.	4	34	0	5	f	0	0	0	2
316	2023-02-27 11:00:00+00	Qc open but queen not seen. Considering merging with Corflute NUC	3	35	0	3	f	1	0	0	2
318	2023-03-03 11:00:00+00	New Queen laying. 5 frames we could extract, removed top super as empty.	1	27	1	2	t	1	0	2	3
317	2023-03-03 11:00:00+00	Saw 2 frames with eggs, so we have a queen mated & laying. Removed honey super.	2	3	1	3	f	1	0	4	4
319	2023-03-01 11:00:00+00	Honey Super removed. Apivar inserted on both brood frames  queen excluder inserted between brood box and cage queens on upper brood. Entrance closed up	1	16	1	1	f	3	0	3	4
320	2023-03-01 11:00:00+00	A little light on bees. monitoring progress of virgin queens - none seen. Apivar inserted	3	35	0	3	f	0	0	0	2
321	2023-02-28 11:00:00+00	NUC decomissioned, cleaned and readied for new use	5	34	0	0	f	0	0	0	2
322	2023-03-01 11:00:00+00	QC empty but V queen not seen. 3 of the 6 frames heavy with bees. 1 Apivar inserted	0	40	0	3	f	1	1	0	3
323	2023-03-01 11:00:00+00	QC hatched but queen not seen. hive busy. One Apivar inserted	2	39	0	2	f	1	1	0	3
324	2023-02-14 11:00:00+00	Decommisioned	0	17	0	0	f	0	0	0	2
325	2023-03-01 11:00:00+00	Hive reduced to one brood box and entrance down to one entry point.	0	18	0	0	f	0	0	0	3
326	2023-03-03 11:00:00+00	Inspected with Vic. Looks OK, but only 5 frames with brood and not much in the way of stores. Plenty of activity though.	2	36	1	2	t	1	0	4	3
327	2023-03-10 11:00:00+00	Queen marked, red dot, place some water/sugar solution in feeder. General inspection with good eggs & larvae	2	39	0	3	t	1	0	0	1
328	2023-03-10 11:00:00+00	No sign of any Queens, hive starting to wane,	2	40	1	4	f	3	0	0	3
329	2023-03-10 11:00:00+00	Queen, striped, marked with red dot. Frame shuffled and a frame inserted mid-way to be drawnout and hopefully laid on	2	28	1	3	t	1	1	4	3
330	2023-03-11 11:00:00+00	Did not see Q, but is laying well. Did a CO2 varroa test with Vic, 2 varroa seen	2	3	1	1	f	1	2	4	4
331	2023-03-18 11:00:00+00	6 frames with brood, Q laying nicely. Did not try & mark her, bit nervous of trying again. Added Apivar	2	3	1	1	t	1	0	4	4
332	2023-03-18 11:00:00+00	Removed honey super, not enough to extract. Stored honey in black honey storage box. 8 Frames with brood. Added Apivar treatment	1	27	1	1	f	1	0	1	3
333	2023-03-18 11:00:00+00	Saw Q, but is not laying, maybe too early. Added a frame of honey stores as there was nothing for them to work on.	4	38	0	5	t	0	0	5	2
334	2023-03-18 11:00:00+00	OK, but not strong. Added apivar	2	36	1	2	t	1	4	4	3
335	2023-03-24 11:00:00+00	Hive bees merged with Pink NUC. NUC emptied, cleaned and returned to Greg	3	40	0	0	f	0	0	0	3
336	2023-03-24 11:00:00+00	Two frames of bees from Grey NUC transferred using air freshener as a medium	2	39	0	1	t	0	1	0	1
337	2023-03-22 11:00:00+00	No Queen, NUC in decline. Transfer bees to the wooden NUC using air freshener as a medium. NUC decommissioned and cleaned	0	28	0	0	f	0	0	0	3
339	2023-04-08 12:00:00+00	Looking OK, saw the Q and gave her a RED dot.	1	3	1	2	t	1	0	4	4
340	2023-04-08 12:00:00+00	Saw the Q and gace her a RED dot	2	38	1	3	t	1	0	2	2
341	2023-04-08 12:00:00+00	Saw the Q, but she is not laying at the moment, just a few larvae seen. Hope all ok!!!	2	27	1	4	t	1	0	4	3
342	2023-03-31 11:00:00+00	Settling hive down. Take 5 VQ out of roller cages and place in cage boxes and breeder frame. Placed in upper brood box	1	41	0	1	t	3	0	0	3
343	2023-04-09 12:00:00+00	Looking OK, no stores but active forraging	3	36	1	3	t	1	0	5	3
344	2023-04-27 12:00:00+00	Shuffle frames so all brood in bottom box including red dot queen with two honey frames on outside. Place top feeder and then box with empty & honey frames	2	39	1	2	t	3	1	2	3
345	2023-04-27 12:00:00+00	Shuffle frames, brood in low box then top feeder then second box with honey +3 caged queens.	2	41	1	2	t	3	1	3	3
346	2023-04-27 12:00:00+00	Place top feeder on and part fill with 50/50 Sugar/water. NUC looking good	2	35	1	2	t	3	1	5	2
347	2023-04-27 12:00:00+00	A little light on stores. Partly fill side feeder	2	18	1	2	f	1	1	3	3
348	2023-05-01 12:00:00+00	Looking poorly. Added 2 frames of honey. Also put on a top feeder with comb honey from 3 years ago.	3	27	1	4	t	1	0	5	3
349	2023-05-01 12:00:00+00	Building nicely, added a honey frame as there was not much stores.	2	3	1	2	t	1	0	4	4
350	2023-05-01 12:00:00+00	Queen seen, but not much brood. Replaced one frame with a frame of honey.	3	38	0	3	t	1	0	3	2
351	2023-05-05 12:00:00+00	Nō stores, need to feed straight away	3	36	1	4	t	1	0	5	3
352	2023-05-11 12:00:00+00	Good brood, a little larvae but no eggs seen. Bees grumpy, Varroa strips removed. A little 50/50 water/sugar added in the top feeder	2	18	3	2	f	5	0	2	3
353	2023-05-11 12:00:00+00	Good brood and larvae.  A little honey on outer frames/ Apivar strips removed. A little sugar/water added	2	35	1	1	t	3	1	3	2
354	2023-05-11 12:00:00+00	good brood, larvae and eggs. good stores of honey. A cup full of bees dead in top feeder tray. Treatment removed	0	41	0	0	f	0	0	0	3
355	2023-05-11 12:00:00+00	Apivar strips removed. Reasonable brood and larvae. Honey frames available	2	39	0	2	t	1	0	2	3
356	2023-05-13 12:00:00+00	Looking good	1	3	1	2	t	1	1	3	4
357	2023-05-13 12:00:00+00	Looking poorly, did not see queen even though only a few bees. Unlikely to survive I think	3	27	1	4	f	1	1	3	3
358	2023-05-13 12:00:00+00	Did varroa check (co2) no varroa. Gave 12kg 1:1 syrup	2	36	1	2	t	1	1	3	3
359	2023-05-26 12:00:00+00	Queen red dot nearly disappeared. Needs to be remarked. sugar shake undertaken - Zero. Plenty of feed. Bees have tunneled another entrance. Temporary fix undertaken. Hive reasonably strong	2	39	1	2	t	1	1	2	3
360	2023-05-26 12:00:00+00	Hive appears to have weakened. Sugar shake undertaken. 21 Varroa. Two Bayvarol strips inserted. Plenty of feed. Bees not venturing into the upper box (separated by top feeder\r\n) A bit of mold and possible wax moth appearing	2	41	3	2	t	3	5	2	3
361	2023-05-26 12:00:00+00	Queen not seen. Good brood and larvae. Add a frame of honey and 0.5 litre of Sugar/Water solution. Hive looking pretty good	2	18	0	2	f	5	0	0	3
362	2023-05-26 12:00:00+00	Bee numbers seem to have fallen. Queen seen\r\nA frame of honey inserted	2	35	0	2	t	5	0	0	2
363	2023-05-30 12:00:00+00	Saw the queen, but still very little brood. However some larvae seen. Removed top feeder and then added a frame feeder with 2:1 syrup	4	27	0	4	t	1	0	4	3
364	2023-05-30 12:00:00+00	Hive looks strong, but very little stores. Lots of foraging. Added a top feeder with left-over honey comb.	2	3	0	2	t	1	0	4	4
365	2023-06-13 12:00:00+00	Looking fine. Plenty of stores and some brood	2	36	0	3	t	1	0	2	3
366	2023-06-14 12:00:00+00	Queen seen.  hive appears to be in decline. Take top box and feeder off.	3	41	3	3	t	1	0	0	3
367	2023-06-14 12:00:00+00	Queen not seen, but young larvae visible. Remove top box with stored honey frames. Top up feeder with 1/1 sugar water. Hive appears to be wintering okay.	2	39	1	1	f	3	0	1	3
368	2023-06-14 12:00:00+00	queen seen. Dead bees outside. Larvae visible.\r\nFeed a little 1/1 sugar/water in top feeder. Hive appears to be wintering well	2	35	0	2	t	3	2	2	2
369	2023-06-14 12:00:00+00	A very dark queen spotted for the first time. 4 to 5 frames of brood and larvae. Add a little 1/1 sugar/ water solution. Hive appears to be wintering okay. Dead bees outside the entrance	2	18	0	3	t	5	2	3	3
371	2023-07-03 12:00:00+00	Hive going well. Opened up a few more honey frames. No signs of mild due.	2	39	1	1	f	1	0	2	3
370	2023-07-03 12:00:00+00	Numbers continue to dwindle. Place more honey frames and introduce solid/corflute frame to assist in keeping the heat in. Mill due present	3	41	3	3	f	1	0	3	3
372	2023-07-03 12:00:00+00	Hive looking good. Add more sugar/water in top feeder. and place insulation in.	2	35	1	3	t	1	1	2	2
373	2023-07-03 12:00:00+00	Add honey frames for feed, Good numbers and pollen going in	2	18	1	2	f	1	0	3	3
374	2023-07-14 12:00:00+00	Hive looks better, putting some stores away. Added a brood frame from other hive to help out and filled up the frame feeder with 2:1 syrup.	3	27	1	3	t	1	0	3	3
375	2023-07-14 12:00:00+00	Hive still looks strong.\r\nTook a frame with brood out & gave it to H3.\r\nAdded a second storey to the brood chamber.\r\nRemoved top feeder, they had taken all the honey there.	2	3	1	0	t	1	0	3	4
376	2023-07-22 12:00:00+00	Down to one frame of brood. Mold on some frames. Place side feeder with sugar/water, 1/1. Queen still there. Colony wings in good order	4	41	0	4	t	1	1	4	3
377	2023-07-22 12:00:00+00	Colony looks good. 5 frames with brood. No mold. Place pea straw in top feeder and add 1 litres of sugar/water solution	2	39	0	1	f	1	1	3	3
378	2023-07-22 12:00:00+00	Two full frames of brood. Add a frame of honey and place sugar/water in top feeder. Colony looks good, Queen spotted	2	35	1	1	t	1	1	2	2
379	2023-07-22 12:00:00+00	Colony looking good. 5 frames with brood. Added a frame of honey and sugar/water solution to side feeder	2	18	1	2	f	1	1	2	3
469	2024-01-06 11:00:00+00	Checked through and all appears okay, possibly a lack of space	1	42	0	2	t	3	0	0	3
380	2023-08-12 12:00:00+00	Looking OK, small size, 3 good frames of brood. Gave a little syrup and put in 2 OA strips. Did not check varroa as I forgot gear	3	36	0	1	t	1	0	2	3
381	2023-08-14 12:00:00+00	Replace 3 full depth frames with 3/4 frames with a raise base below. Small larvae on a second frame. Add 2/1 sugar / water solution	3	41	0	3	t	1	1	3	3
382	2023-08-14 12:00:00+00	Hive going well. Drone cells seen.  Feed more 2/1 sugar/water. Possible QC removed. Consider a 2nd brood box for next inspection	2	18	1	1	f	3	1	2	3
383	2023-08-14 12:00:00+00	Two full frames of brood. NUC looking strong. Add sugar / water solution. Consider increasing to full depth box.	1	35	0	1	t	3	1	2	2
384	2023-08-14 12:00:00+00	A lot of honey stores, Add a 2nd brood box.\r\nHive looks strong	2	39	1	1	f	3	1	1	3
385	2023-08-19 12:00:00+00	Building OK. 3 good frames of brood and fair bee numbers. Filled up single frame feeder with 1:1 syrup. Added OA glycerine strips	2	27	1	0	t	1	0	2	3
386	2023-08-19 12:00:00+00	7 - 8 frames good brood, including 2 in upper storey. Good bee numbers and good stores. Some drone brood seen.	1	3	1	1	t	1	0	3	4
389	2023-08-24 12:00:00+00	Couldn't find the Queen. Placed 4 Varroa strips. Opened up entrance	2	18	0	2	f	3	0	3	3
388	2023-08-24 12:00:00+00	10 mites counted. 3 varroa strips placed in hive. Double the entrance size	2	39	3	1	t	3	4	3	3
387	2023-08-24 12:00:00+00	Wooden NUC transferred into full depth box. Feed with 2/1, Varroa strips placed. Entrance opened to 1 full slot	2	35	1	3	t	3	2	3	3
390	2023-08-26 12:00:00+00	Looking strong. Added honey super	1	3	1	1	f	1	0	3	4
391	2023-08-26 12:00:00+00	Building nicely. Filled frame feeder with 1:1 syrup.	2	27	0	1	f	1	0	3	3
392	2023-08-26 12:00:00+00	Looking OK. Filled frame feeder with 1:1 syrup	3	36	0	3	t	1	0	4	3
393	2023-08-28 12:00:00+00	hive moved to a new location for breeding purposes	0	35	0	0	f	0	0	0	3
394	2023-08-30 12:00:00+00	Check out hive. Going well. Bees appear in good order	1	39	0	1	t	3	0	3	3
396	2023-08-30 12:00:00+00	Bees a bit aggressive, put down from to foraging  bees from Breeder hive returning to this hive. Hive very busy with a number in upper box. Sugar /water solution added	1	18	0	1	f	5	0	3	3
395	2023-08-30 12:00:00+00	Hive appears to have recovered from move, minus foraging bees. Add 2/1 sugar/water. Queen spotted. Pollen pattie placed on top of frames	2	35	0	1	t	3	0	3	3
397	2023-09-08 12:00:00+00	Building OK. Removed frame feeder, added queen excluder and honey super. No varroa found with CO2 test	2	27	0	1	f	1	1	2	3
398	2023-09-08 12:00:00+00	Strong hive, but 4 varroa with a CO2 test. Need to watch closely	1	3	1	1	f	1	3	2	4
399	2023-09-16 12:00:00+00	Still strong & busy. Reversed top & bottom brood chambers, early swarm prevention. Some drone brood, no queen cell seen. Did not see queen.	1	3	1	2	f	1	0	3	4
400	2023-09-16 12:00:00+00	Looking OK.	2	27	1	1	f	1	0	4	3
401	2023-09-16 12:00:00+00	Hive nice & busy, but only 3 - 4 frames with brood. Added 2l 1:1 syrup.	3	36	1	3	t	1	0	4	3
402	2023-10-07 11:00:00+00	Building nicely. Remove feeder and added drawn frame to center of brood nest. Added honey super w plastic frames.	1	36	0	2	f	1	0	3	3
403	2023-10-03 11:00:00+00	Looking strong. Some honey going into honey super. Reversed brood boxes. Lots of drone brood	1	3	0	2	f	1	0	3	4
404	2023-10-03 11:00:00+00	Looking fine	1	27	0	1	f	1	0	3	3
405	2023-10-20 11:00:00+00	Looking good. Started drawing out honey super (plastic frames) & storing nectar. Fair stores in brood chamber too. Good drone brood. Pulled some and no varroa seen.	1	36	1	2	t	1	0	2	3
406	2023-10-16 11:00:00+00	Queen spotted and remarked  - red dot, honey super added. Hive strong, varroa treatment removed	1	39	0	1	t	3	0	1	3
407	2023-10-22 11:00:00+00	Do a sugar shake and a comb test on drone cells. Move two honey frames up into honey super and replace with new frames	1	39	1	1	f	3	2	2	3
408	2023-10-16 11:00:00+00	Varroa treatment removed, 3/4 frame super placed above queen excluder (heavy with good brood) and replaced with full depth super. Feed with 1/1 sugar/water	1	35	0	1	t	3	0	0	3
409	2023-10-21 11:00:00+00	do a sugar test  (2) and comb test on drones (1). Bees cleaning newly into full depth	0	35	1	1	f	3	2	1	3
410	2023-10-16 11:00:00+00	queen spotted and marked with red dot. Varroa Treatment removed. Honey super added	0	18	0	1	t	3	0	0	3
411	2023-10-21 11:00:00+00	Do a sugar test (3) and drone comb test (3). Place 4 strips of Oxalic Acid on the two brood frames	1	18	1	1	t	3	3	3	3
412	2023-10-20 11:00:00+00	Looking really strong. Brood box very busy. Started storing nectar in honey super, but none capped yet. Added 2nd honey super to give space.	1	27	1	2	t	1	0	2	3
413	2023-10-20 11:00:00+00	Looks like this hive has swarmed. Saw no eggs, only mature brood. However saw a hatched queen cell, so need to leave a few days & then re-check.	2	3	1	5	f	1	0	4	4
414	2023-10-24 11:00:00+00	Remove 4 of the brood frames in the honey super and give to Greg's hive. Replace with empty frames	1	35	0	1	f	3	0	0	3
415	2023-10-27 11:00:00+00	Check out upper brood box and see 2 frames of brood. Top up feeder with 1/1 sugar/water. Introduced honey frames being drawn out	1	35	1	1	f	3	2	1	3
416	2023-10-25 11:00:00+00	Four frames reasonable bee numbers. No queen, roar from hive,	0	42	0	2	f	3	0	3	3
417	2023-11-02 11:00:00+00	Check out 6 frames (1 transferred from Breeder hive) 4 QC noted, Good unsealed honey but sparce on Pollen,	2	42	0	3	f	3	0	0	3
418	2023-11-06 11:00:00+00	Golden Queen spotted, probably virgin. Marked with green dot. One QC cut out and placed in Rose Hive, 2nd brood box. Two other QC left insitue	1	42	0	4	f	1	0	0	3
419	2023-11-02 11:00:00+00	Good search for queen, not seen. No eggs just a little mature larvae. Has the hive swarmed?	2	39	1	2	f	3	0	3	3
420	2023-11-06 11:00:00+00	Again check for Queen and eggs. Nil;  Transfer a reasonable QC from NUC and place in 2nd brood box mid frame	2	39	0	4	f	3	0	2	3
421	2023-11-06 11:00:00+00	Hive busy, Red dot Queen seen. Honey flow into Honey super slow	1	18	0	1	t	3	0	2	3
516	2024-04-28 12:00:00+00	Fed some 1:1 syrup. Did not open hive up.	0	27	0	0	f	0	0	0	3
422	2023-11-04 11:00:00+00	Preparing for grafting,  Restrict Queen to lower brood box. Place Queen breeding frame mid upper brood box. Top up side feeder with 1/1 water/ sugar	1	35	0	1	t	3	0	1	3
423	2023-11-03 11:00:00+00	Looking strong but quite a few queen cells. Took 3 frames from brood chamber, 1 into H4, and 2 for a queen castle	1	27	1	2	f	1	0	2	3
424	2023-11-10 11:00:00+00	NO EGGS SEEN, argh. Must have done something on last inspection. But still heaps of bees and good honey in first honey super	1	27	1	5	f	1	0	1	3
425	2023-11-03 11:00:00+00	No eggs, must have swarmed. Lots of open queen cells. Patience is required	2	3	1	5	f	1	0	4	4
426	2023-11-10 11:00:00+00	Definately some eggs & larvae, seems to be coming right.	2	3	1	4	f	1	0	4	4
427	2023-11-10 11:00:00+00	Looking good, honey super mostly drawn out. Added 2nd honey super.	1	36	1	1	t	1	0	2	3
428	2023-11-10 11:00:00+00	Swing bottom brood box 180, install closed cloak board then upper brood box plus ramp leading uo tp the raised entrance. After 6 hours, graft into Q, rearing frame (48 cups)	1	35	0	1	t	3	0	1	3
429	2023-11-11 11:00:00+00	25 hours after grafting, remove cloak tin and close bottom entrance. It looks like 20+ QC have taken.  Top up feed	1	35	0	1	f	5	0	1	3
430	2023-11-14 11:00:00+00	Check for rogue QCs, one removed.  21 cups filled with QCs. top up water/sugar	1	35	0	1	f	5	0	0	3
431	2023-11-18 11:00:00+00	Saw a queen, but she is not laying at all well, cannot have mated properly. Will replace with queen cell	1	3	0	4	t	1	0	4	4
432	2023-11-20 11:00:00+00	Found queen and disposed of her. Added Queen cell, hatch date should be 24/11	1	3	0	5	t	1	0	0	4
433	2023-11-18 11:00:00+00	Definately no queen, no eggs or larvae. Will add queen cell	1	27	0	5	f	1	0	1	3
434	2023-11-20 11:00:00+00	Added queen cell	0	27	0	0	f	0	0	0	3
435	2023-11-18 11:00:00+00	No eggs, no queen	3	43	0	5	f	0	0	0	3
436	2023-11-20 11:00:00+00	Added queen cell	0	43	0	0	f	0	0	0	3
437	2023-11-24 11:00:00+00	Looking good, took 2 frames of brood & eggs to start a queen castle	1	36	1	1	t	1	0	1	3
438	2023-12-07 11:00:00+00	A golden queen spotted, marked with a green dot	1	42	0	4	t	1	0	4	3
439	2023-12-07 11:00:00+00	Red queen spotted, bees appeared agitated. Remove varroa treatment. Sugar shake undertaken 12. Honey take low	1	18	3	2	t	3	4	3	3
440	2023-12-07 11:00:00+00	Lower brood box going well, then queen excluder. Two frames of honey nearing full.	1	39	3	1	f	3	4	2	3
441	2023-12-07 11:00:00+00	Sugar shake undertaken - 12. Brood frames good and very good honey flow.	0	35	3	1	f	3	4	1	3
442	2023-12-16 11:00:00+00	Going great! 2 supers full of honey/nectar, added 3rd super. Did an OA vaporisation.	1	36	1	2	t	1	3	1	3
443	2023-12-15 11:00:00+00	Not a great colony, varroa count (CO2) was 15, probably says why. Did an OA vaporisation.	3	3	1	0	f	1	4	4	4
444	2023-12-15 11:00:00+00	Looking good, plenty of honey. Added 2nd brood chamber as I want to use for queen rearing.	1	27	1	1	f	1	3	1	3
445	2023-12-16 11:00:00+00	Queen started laying, probably less than a week	1	44	1	3	f	1	0	3	3
446	2023-12-15 11:00:00+00	No egg or larvae yet	0	43	1	5	f	1	0	4	3
447	2023-12-16 11:00:00+00	The queen is starting to lay reasonably well	1	42	0	3	t	0	0	3	3
448	2023-12-16 11:00:00+00	The third oxalic vapour treatment	1	39	0	0	f	3	0	2	3
449	2023-12-16 11:00:00+00	third oxalic vapour treatment, One 3/4 frame box full  of honey remove and replaced by an empty box	0	35	0	1	f	3	0	1	3
450	2023-12-16 11:00:00+00	Third oxalic vapour applied.  Honey flow slow  possibility due varroa infestation	2	18	3	2	f	3	0	2	3
451	2023-12-16 11:00:00+00	Multi NUC (Queen Castle) re commissioned early December and two QCs inserted. Larvae in both but queens not seen, In the left QCs	3	17	0	0	f	0	0	0	2
452	2023-12-23 11:00:00+00	Did see a queen, so must have brought one over from QC2. Lots of stores but brood is worrying	3	3	0	4	t	1	0	3	4
453	2023-12-19 11:00:00+00	Added 2 frames from QC2, hopefully with the queen	0	3	0	0	f	0	0	0	4
454	2023-12-19 11:00:00+00	Took 2 frames, hopefully with the queen fo #H4. Will see if they create a new queen.	0	44	0	0	f	0	0	0	3
455	2023-12-23 11:00:00+00	Look like they are making a queen cell	3	44	0	5	f	1	0	0	3
456	2023-12-23 11:00:00+00	WooHoo, saw some eggs & larvae. just took ages to get going	2	43	0	3	f	0	0	0	3
457	2023-12-23 11:00:00+00	Pleanty of brood, but I saw no eggs & new larvae. Filled to 2nd brood chamber with honey. Wonder if the queen is still there :-(	1	27	0	5	f	1	0	1	3
458	2023-12-27 11:00:00+00	Add a box of wet frames in a full depth box	0	18	0	0	f	0	0	0	3
459	2023-12-28 11:00:00+00	Building nicely	1	42	0	2	t	0	0	0	3
460	2023-12-27 11:00:00+00	an empty box, then a top feeder and a full 3/4 wet frames added to hive following honey extraction	1	39	0	1	f	0	0	0	3
461	2023-12-28 11:00:00+00	An empty box, top feeder with wax strippings and 3/4 box full of wet frames added to the stack.	1	39	0	1	f	0	0	0	3
462	2024-01-04 11:00:00+00	Still strong. Took box of wets off. Sagar shake count was 3 varroa. Saw 2 replacement QC but destroyed them as planning to requeen later. Did not see Q, but did see eggs. Bees a bit feisty.	1	36	1	2	f	3	2	1	3
463	2024-01-01 11:00:00+00	Only 1 frame of brood. But saw the Q & gave her a green dot	3	3	1	0	t	1	0	3	4
464	2024-01-01 11:00:00+00	Saw new Q & gave her a green dot	1	27	1	1	t	1	0	1	3
465	2024-01-06 11:00:00+00	Still only 1 frame of brood. Added clean drawn out frame next to frame with brood, see if she likes that one. Did an OA vapourisation just in case, not enough bees to sugar shake	3	3	0	3	t	1	0	3	4
466	2024-01-06 11:00:00+00	No eggs so far, possible queen cell seen	3	44	0	5	f	0	0	0	3
467	2024-01-06 11:00:00+00	May have seen a queen, but a small one if so. Did not see eggs/larvae	2	43	0	5	f	0	0	0	3
468	2024-01-06 11:00:00+00	Did not see Q, but lots of eggs/larvae in bottom chamber, only one brood frame in upper chamber. Forgot to sugar shake test, but did an OA vapourisation as a precaution	1	27	1	1	f	1	0	1	3
470	2024-01-06 11:00:00+00	Unmarked seen spotted in brood box. sugar shake undertaken {2} Honey supers well underway	1	39	1	1	t	5	2	1	3
471	2024-01-05 11:00:00+00	full inspection. Brood heavy both upper and lower. Hive very strong. Insert breeder frame middle upper brood. Honey supers going well	1	35	0	1	f	5	0	1	3
472	2023-12-31 11:00:00+00	Bee numbers seem to be down, sugar shake give 20+, honey intake slow.	2	18	3	2	t	3	5	2	3
473	2024-01-10 11:00:00+00	Queen found, attempted to remark with red dot and isolated in bottom brood box. Two honey boxes filled but need capping. Wet cleaned up and bee escape placed for its removal	1	35	0	1	t	5	0	1	3
474	2024-01-21 11:00:00+00	Queen still there and has started laying in a different few frames. 2 frames with brood on. Still looking weak, but possibly building	3	3	1	3	t	1	0	4	4
475	2024-01-20 11:00:00+00	Setting up for queen grafting, could not find the queen but put in a cloake board to keep her either up or down.	1	27	1	1	f	1	0	1	3
476	2024-01-20 11:00:00+00	Did not find a queen, but eggs & larvae on 2 of the frames. She must be there	2	44	0	3	f	1	0	4	3
477	2024-01-20 11:00:00+00	Definitely eggs & larvae, but did not see the queen this time	3	43	0	3	f	1	0	5	3
478	2024-01-19 11:00:00+00	Hive still looking strong, Saw a possible QC & destroyed it, will re-queen when I have some from grafting. Took out 1 frame sealed honey	1	36	1	2	f	1	0	1	3
479	2024-01-29 11:00:00+00	prepare hive for transfer to robyn Ncholl.  Hive has Chalk brood, approx 1% of brood. Add sugar/ water solution and shorten entrance	2	42	3	3	t	1	0	4	3
480	2024-01-30 11:00:00+00	2nd treatment of oxalic vapourization. Varroa  i think manageable	1	39	3	2	f	3	4	1	3
481	2024-01-27 11:00:00+00	Split hive, lower brood box to Rosie Howard. Contains red dot queen, Possible DWS.Very high varroa count. Upper brood box with 1 QC, commence oxalic vapour treatment	2	35	5	2	t	5	5	1	3
482	2024-01-30 11:00:00+00	2nd treatment of vapourised oxalic acid	1	35	5	2	f	5	5	1	3
483	2024-02-03 11:00:00+00	Saw Q and destroyed her as I will requeen.in 2 day. Also split hive. High varroa, must treat	1	36	0	2	t	1	4	1	3
484	2024-02-03 11:00:00+00	Check out hive, one brod box going well. Un marked queen sighted	1	39	0	1	t	3	0	1	3
485	2024-02-03 11:00:00+00	No queen seen. Little brood and hive in decline require to requeen	2	35	3	4	f	3	0	4	3
486	2024-02-05 11:00:00+00	Wax moth infestation. Added some frames from H3 as reducing that hive to 1 brood box. Also combined to centre queen castle as no QC evident there. Gave them heaps of smoke so we will see what happens	3	3	5	4	f	1	0	4	4
487	2024-02-05 11:00:00+00	Removed 5 queen cells. Removed Cloake board. Split to create a queen castle (left) and added one of the queen cells. Reduced to single brood chamber, distributed frames to H4 and QC1, some back to stores, some need cleaning.	1	27	1	2	t	1	0	1	3
488	2024-02-05 11:00:00+00	Put in Queen cell	1	36	0	0	f	0	0	1	3
489	2024-02-05 11:00:00+00	Added queen cell	3	45	0	0	f	0	0	0	3
490	2024-02-05 11:00:00+00	Jim's QC placed in central wooden frame. Heres hoping	0	35	0	0	f	0	0	0	3
491	2024-02-12 11:00:00+00	Looks a bit better with the extra resources provided. No wax moth seen. Added oxalic acid strips	2	3	1	3	t	1	3	4	4
492	2024-02-12 11:00:00+00	Looking OK, not much honey to remove though.	2	27	1	3	t	1	3	1	3
493	2024-02-12 11:00:00+00	Queen cell I put in was empty. But saw no queen and also saw 5 new queen cells the bees have raised. Left all cells in place.	1	46	0	5	f	0	0	4	3
494	2024-02-19 11:00:00+00	Remove Oxalic acid Strips. Take off wets and top feeder. Preparing for winter	1	39	5	4	f	1	0	2	3
495	2024-02-20 11:00:00+00	Remove unmarked queen and replace with original green dot queen. one brood box, 3 Apivar strips inserted, Note large sealed queen cell. Entrance down sized. Honey super now a mixture of wets and partial honey frames	2	39	5	4	t	3	5	1	3
496	2024-02-26 11:00:00+00	Box being robbed. Queen dead. Colony on its way out	4	47	0	5	f	0	0	0	3
497	2024-02-26 11:00:00+00	Green dot queen out of cage and active, not a lot of larvae	2	39	0	4	t	1	0	3	3
498	2024-02-26 11:00:00+00	No queen seen, no larvae or brood. A little wax moth trails. Insert 3 x Apivar	2	35	0	4	f	3	0	3	3
499	2024-03-01 11:00:00+00	Huge wax moth infestation. Reduced to a 6 frame nuc. Queen seen and some brood, wonder if the hiveware was the problem. Added Apivar	3	3	5	4	t	1	0	4	4
500	2024-03-01 11:00:00+00	Looking OK, added Apivar	2	27	0	3	t	1	0	3	3
501	2024-03-01 11:00:00+00	Saw a new queen. not laying yet. Added Apivar strip	3	46	0	5	t	1	0	4	3
502	2024-03-01 11:00:00+00	New queen in there & laying, but did not see her. Added Apivar	1	36	1	3	f	1	0	3	3
503	2024-03-01 11:00:00+00	Saw a queen, i think. Quite black, and some eggs so only just started laying. Added Apivar	2	45	1	3	t	1	0	4	3
504	2024-03-15 11:00:00+00	Going nicely, saw new queen and gave her a green dot	2	36	1	2	t	1	0	3	3
505	2024-03-15 11:00:00+00	Definitely a queen there but could not find her. Otherwise looking fine	2	45	1	3	f	1	0	4	3
506	2024-03-15 11:00:00+00	Still doubtful. Give it a few weeks	3	3	3	2	t	1	0	4	4
507	2024-03-15 11:00:00+00	Saw the queen & gave few a green dot. Not strong tho	3	46	1	3	t	1	0	5	3
508	2024-03-15 11:00:00+00	Ok	2	27	1	2	t	1	0	3	3
509	2024-03-30 11:00:00+00	Queen definately laying, but it all looks weak. Should feed	3	3	3	3	t	1	0	5	4
510	2024-03-30 11:00:00+00	Only a single frame (out of 3) with brood. Needs to be fed.	4	46	0	3	t	1	0	5	3
511	2024-03-30 11:00:00+00	Looking OK, but not strong. Needs to be fed	2	27	3	3	t	1	0	3	3
512	2024-04-12 12:00:00+00	Looks OK, but no stores. Fed some syrup	0	36	1	3	t	1	0	5	3
513	2024-04-12 12:00:00+00	Saw queen, no marking, but did not have pen. Bring next time. No stores so fed some syrup.	0	45	1	3	t	1	0	5	3
514	2024-04-26 12:00:00+00	Saw queen & gave her a green dot. Fed some 1:1 syrup. Looking OK	2	45	1	3	t	1	0	4	3
515	2024-04-26 12:00:00+00	Looking small but OK .fed some 1:1 syrup	3	36	1	3	t	1	0	4	3
517	2024-04-28 12:00:00+00	Small but looks OK. Moved to a nuc and fed with 1:1 syrup	3	46	1	3	t	1	0	5	3
518	2024-04-28 12:00:00+00	Looking OK, fed with some sugar syrup	3	3	1	3	t	1	0	4	4
519	2024-05-17 12:00:00+00	Looks fine for this time of year. Gave some syrup.\r\nQueen is laying & pollen coming in.	2	45	1	3	t	3	0	3	3
520	2024-05-17 12:00:00+00	Looks OK, but not much stores. Gave a full single frame feeder worth of syrup. But queen is there & is laying a bit	3	36	1	3	t	3	0	4	3
521	2024-05-17 12:00:00+00	Looks OK, definately recovering	2	3	1	3	t	1	0	3	3
522	2024-05-17 12:00:00+00	Only a single frame with bees, should keep feeding. Gave a full single frame feeder of syrup	3	46	1	4	t	1	0	5	3
523	2024-05-17 12:00:00+00	Look OK for this time of year.	2	27	1	3	t	1	0	3	3
524	2024-06-14 12:00:00+00	Looking fine. Good brood on 3 frames and honey on 5-6 frames.	2	27	1	2	t	1	0	2	3
525	2024-06-14 12:00:00+00	Looking OK. 8 frames in hive ATM, and a frame feeder, but I did not put anything in the feeder.	1	3	1	3	t	1	0	3	3
526	2024-06-14 12:00:00+00	Bees on 2 frames, so a small increase. Added thick syrup to the feeder. I think this colony may make it through.	3	46	1	3	t	1	0	5	3
527	2024-06-14 12:00:00+00	Looks OK. Fed some thick syrup. 3 frames w brood	2	36	1	3	t	1	0	4	3
528	2024-06-14 12:00:00+00	Looking good for this time of year. Fed a little thick syrup	2	45	1	3	t	1	0	2	3
\.


--
-- Data for Name: beedb_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_message (id, subject, body, processed, "createdDt", "processedDt", beek_id, html) FROM stdin;
268	Weekly summary from Bee-db	\N	t	2023-02-15 07:03:36.146562+00	2023-02-15 07:03:41.020325+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
269	Weekly summary from Bee-db	\N	t	2023-02-16 08:56:02.795984+00	2023-02-16 08:56:08.233859+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
270	Weekly summary from Bee-db	\N	t	2023-02-17 08:00:14.831607+00	2023-02-17 08:00:18.615581+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
271	Weekly summary from Bee-db	\N	t	2023-02-24 08:00:00.486456+00	2023-02-24 08:00:04.923935+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/311">Sun 12 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Removed feeded and added an empty frame. Looks like the colony building OK</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/310">Wed 22 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: New queen had got out of cage.</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/40">Check for egg</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/309">Wed 22 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Romoved existing yellow dot queen (&amp; disposed of her). Added a queen cell from Vic</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/39">Check for queen and brood</a> - Due by: Thu 16 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
272	Weekly summary from Bee-db	\N	t	2023-04-09 00:11:10.141593+00	2023-04-09 00:11:16.370916+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/334">Sun 19 Mar 2023</a>\n                </div>\n                <div class="indent2">Comment: OK, but not strong. Added apivar</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/341">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q, but she is not layiong at the moment, just a few larvae seen. Hope all ok!!!</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/339">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, saw the Q and gave her a RED dot.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/340">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q and gace her a RED dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
273	Weekly summary from Bee-db	\N	t	2023-04-14 08:00:04.637322+00	2023-04-14 08:00:09.102555+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/343">Mon 10 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, no stores but active forraging</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/341">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q, but she is not laying at the moment, just a few larvae seen. Hope all ok!!!</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/339">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, saw the Q and gave her a RED dot.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/340">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q and gace her a RED dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
274	Weekly summary from Bee-db	\N	t	2023-04-19 07:56:48.417618+00	2023-04-19 07:56:54.958466+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/343">Mon 10 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, no stores but active forraging</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/341">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q, but she is not laying at the moment, just a few larvae seen. Hope all ok!!!</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/339">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, saw the Q and gave her a RED dot.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/340">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q and gace her a RED dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
275	Weekly summary from Bee-db	\N	t	2023-04-21 08:00:07.070844+00	2023-04-21 08:00:12.126983+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/343">Mon 10 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, no stores but active forraging</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/341">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q, but she is not laying at the moment, just a few larvae seen. Hope all ok!!!</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/339">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, saw the Q and gave her a RED dot.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/340">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q and gace her a RED dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
276	Weekly summary from Bee-db	\N	t	2023-04-28 08:00:08.632835+00	2023-04-28 08:00:12.456699+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/343">Mon 10 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, no stores but active forraging</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/341">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q, but she is not laying at the moment, just a few larvae seen. Hope all ok!!!</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/339">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, saw the Q and gave her a RED dot.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/340">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q and gace her a RED dot</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
277	Weekly summary from Bee-db	\N	t	2023-04-29 18:33:42.119635+00	2023-04-29 18:33:47.773258+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/343">Mon 10 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, no stores but active forraging</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/341">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q, but she is not laying at the moment, just a few larvae seen. Hope all ok!!!</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/339">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, saw the Q and gave her a RED dot.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/340">Sun 09 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the Q and gace her a RED dot</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
278	Weekly summary from Bee-db	\N	t	2023-05-05 08:00:14.73533+00	2023-05-05 08:00:20.063593+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/343">Mon 10 Apr 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, no stores but active forraging</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/348">Tue 02 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking poorly. Added 2 frames of honey. Also put on a top feeder with comb honey from 3 years ago.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/349">Tue 02 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Building nicely, added a honey frame as there was not much stores.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/38">QC3</a> - Queen castle from H3\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/350">Tue 02 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Queen seen, but not much brood. Replaced one frame with a frame of honey.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
279	Weekly summary from Bee-db	\N	t	2023-05-16 22:34:49.972428+00	2024-03-29 03:53:45.761516+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/358">Sun 14 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Did varroa check (co2) no varroa. Gave 12kg 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/357">Sun 14 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking poorly, did not see queen even though only a few bees. Unlikely to survive I think</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/356">Sun 14 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking good</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
280	Weekly summary from Bee-db	\N	t	2023-06-25 20:49:19.910706+00	2024-03-29 03:53:50.56373+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/365">Wed 14 Jun 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking fine. Plenty of stores and some brood</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/363">Wed 31 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the queen, but still very little brood. However some larvae seen. Removed top feeder and then added a frame feeder with 2:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/364">Wed 31 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Hive looks strong, but very little stores. Lots of foraging. Added a top feeder with left-over honey comb.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
282	Weekly summary from Bee-db	\N	t	2023-08-20 01:05:00.22754+00	2024-03-29 03:53:54.620848+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/380">Sun 13 Aug 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, small size, 3 good frames of brood. Gave a little syrup and put in 2 OA strips. Did not check varroa as I forgot gear</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/374">Sat 15 Jul 2023</a>\n                </div>\n                <div class="indent2">Comment: Hive looks better, putting some stores away. Added a brood frame from other hive to help out and filled up the frame feeder with 2:1 syrup.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/375">Sat 15 Jul 2023</a>\n                </div>\n                <div class="indent2">Comment: Hive still looks strong.\r\nTook a frame with brood out &amp; gave it to H3.\r\nAdded a second storey to the brood chamber.\r\nRemoved top feeder, they had taken all the honey there.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
283	Weekly summary from Bee-db	\N	t	2023-10-09 07:42:08.70506+00	2024-03-29 03:53:58.813267+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/402">Sun 08 Oct 2023</a>\n                </div>\n                <div class="indent2">Comment: Building nicely. Remove feeder and added drawn frame to center of brood nest. Added honey super w plastic frames.</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/44">Gloves</a> - Due by: Mon 02 Oct 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/404">Wed 04 Oct 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking fine</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/403">Wed 04 Oct 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking strong. Some honey going into honey super. Reversed brood boxes. Lots of drone brood</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
284	Weekly summary from Bee-db	\N	t	2024-03-29 03:49:57.002506+00	2024-03-29 03:54:02.914718+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/504">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Going nicely, saw new queen and gave her a green dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/505">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Definitely a queen there but could not find her. Otherwise looking fine</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/508">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Ok</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/506">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Still doubtful. Give it a few weeks</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">QC1</a> - Left hand queen castle\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/507">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw the queen &amp; gave few a green dot. Not strong tho</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
285	Weekly summary from Bee-db	\N	t	2024-03-29 03:53:39.838525+00	2024-03-29 03:54:06.828341+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/504">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Going nicely, saw new queen and gave her a green dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/505">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Definitely a queen there but could not find her. Otherwise looking fine</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/508">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Ok</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/506">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Still doubtful. Give it a few weeks</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">QC1</a> - Left hand queen castle\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/507">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw the queen &amp; gave few a green dot. Not strong tho</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
286	Weekly summary from Bee-db	\N	t	2024-03-29 08:00:07.376374+00	2024-03-29 08:00:12.310392+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/504">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Going nicely, saw new queen and gave her a green dot</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/505">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Definitely a queen there but could not find her. Otherwise looking fine</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/508">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Ok</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/506">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Still doubtful. Give it a few weeks</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">QC1</a> - Left hand queen castle\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/507">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw the queen &amp; gave few a green dot. Not strong tho</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
287	Weekly summary from Bee-db	\N	t	2024-04-05 08:00:12.605462+00	2024-04-05 08:00:17.810673+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/504">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Going nicely, saw new queen and gave her a green dot</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/505">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Definitely a queen there but could not find her. Otherwise looking fine</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/511">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, but not strong. Needs to be fed</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/509">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Queen definately laying, but it all looks weak. Should feed</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">QC1</a> - Left hand queen castle\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/510">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame (out of 3) with brood. Needs to be fed.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
288	Weekly summary from Bee-db	\N	t	2024-04-12 08:00:12.510141+00	2024-04-12 08:00:17.694636+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/504">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Going nicely, saw new queen and gave her a green dot</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/505">Sat 16 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Definitely a queen there but could not find her. Otherwise looking fine</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/511">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, but not strong. Needs to be fed</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/509">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Queen definately laying, but it all looks weak. Should feed</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">QC1</a> - Left hand queen castle\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/510">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame (out of 3) with brood. Needs to be fed.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
289	Weekly summary from Bee-db	\N	t	2024-04-28 20:49:49.603198+00	2024-04-28 20:49:55.656506+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/511">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, but not strong. Needs to be fed</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/509">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Queen definately laying, but it all looks weak. Should feed</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">QC1</a> - Left hand queen castle\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/510">Sun 31 Mar 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame (out of 3) with brood. Needs to be fed.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
290	Weekly summary from Bee-db	\N	t	2024-05-03 08:00:08.133018+00	2024-05-03 08:00:13.805723+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/516">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Fed some 1:1 syrup. Did not open hive up.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/518">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, fed with some sugar syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/517">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Small but looks OK. Moved to a nuc and fed with 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
291	Weekly summary from Bee-db	\N	t	2024-05-07 02:55:22.509045+00	2024-05-07 02:55:30.180059+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/516">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Fed some 1:1 syrup. Did not open hive up.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/518">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, fed with some sugar syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/517">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Small but looks OK. Moved to a nuc and fed with 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
292	Weekly summary from Bee-db	\N	t	2024-05-10 04:52:17.952391+00	2024-05-10 04:52:24.917599+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/516">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Fed some 1:1 syrup. Did not open hive up.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/518">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, fed with some sugar syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/517">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Small but looks OK. Moved to a nuc and fed with 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
293	Weekly summary from Bee-db	\N	t	2024-05-10 08:00:01.653192+00	2024-05-10 08:00:07.087848+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/516">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Fed some 1:1 syrup. Did not open hive up.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/518">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, fed with some sugar syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/517">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Small but looks OK. Moved to a nuc and fed with 1:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
294	Weekly summary from Bee-db	\N	t	2024-05-17 08:00:15.723592+00	2024-05-17 08:00:29.933799+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/516">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Fed some 1:1 syrup. Did not open hive up.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/518">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, fed with some sugar syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/517">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Small but looks OK. Moved to a nuc and fed with 1:1 syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
295	Weekly summary from Bee-db	\N	t	2024-05-17 21:48:41.358669+00	2024-05-17 21:48:48.615255+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/515">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking small but OK .fed some 1:1 syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/514">Sat 27 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Saw queen &amp; gave her a green dot. Fed some 1:1 syrup. Looking OK</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/516">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Fed some 1:1 syrup. Did not open hive up.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/518">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK, fed with some sugar syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/517">Mon 29 Apr 2024</a>\n                </div>\n                <div class="indent2">Comment: Small but looks OK. Moved to a nuc and fed with 1:1 syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
296	Weekly summary from Bee-db	\N	t	2024-05-24 08:00:10.220308+00	2024-05-24 08:00:27.097639+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/520">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, but not much stores. Gave a full single frame feeder worth of syrup. But queen is there &amp; is laying a bit</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/519">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks fine for this time of year. Gave some syrup.\r\nQueen is laying &amp; pollen coming in.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/523">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Look OK for this time of year.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/521">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, definately recovering</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/522">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame with bees, should keep feeding. Gave a full single frame feeder of syrup</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/57">Feed syrup</a> - Due by: Fri 21 Jun 2024\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
297	Weekly summary from Bee-db	\N	t	2024-05-31 08:00:11.486309+00	2024-05-31 08:00:17.334586+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/520">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, but not much stores. Gave a full single frame feeder worth of syrup. But queen is there &amp; is laying a bit</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/519">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks fine for this time of year. Gave some syrup.\r\nQueen is laying &amp; pollen coming in.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/523">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Look OK for this time of year.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/521">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, definately recovering</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/522">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame with bees, should keep feeding. Gave a full single frame feeder of syrup</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/57">Feed syrup</a> - Due by: Fri 21 Jun 2024\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
298	Weekly summary from Bee-db	\N	t	2024-06-07 08:00:09.326485+00	2024-06-07 08:00:14.910551+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/520">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, but not much stores. Gave a full single frame feeder worth of syrup. But queen is there &amp; is laying a bit</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/519">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks fine for this time of year. Gave some syrup.\r\nQueen is laying &amp; pollen coming in.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/523">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Look OK for this time of year.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/521">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, definately recovering</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/522">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame with bees, should keep feeding. Gave a full single frame feeder of syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/57">Feed syrup</a> - Due by: Fri 21 Jun 2024\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
299	Weekly summary from Bee-db	\N	t	2024-06-14 08:00:10.606906+00	2024-06-14 08:00:16.596217+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/520">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, but not much stores. Gave a full single frame feeder worth of syrup. But queen is there &amp; is laying a bit</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/519">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks fine for this time of year. Gave some syrup.\r\nQueen is laying &amp; pollen coming in.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/523">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Look OK for this time of year.</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/521">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK, definately recovering</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/522">Sat 18 May 2024</a>\n                </div>\n                <div class="indent2">Comment: Only a single frame with bees, should keep feeding. Gave a full single frame feeder of syrup</div>\n                \n                  <div class="indent2 warning">You are overdue for an inspection. Your inspection preferences can be updated <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a></div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/57">Feed syrup</a> - Due by: Fri 21 Jun 2024\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
300	Weekly summary from Bee-db	\N	t	2024-06-17 22:47:37.320184+00	2024-06-17 22:47:43.543+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Left hand colony. Started 2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/527">Sat 15 Jun 2024</a>\n                </div>\n                <div class="indent2">Comment: Looks OK. Fed some thick syrup. 3 frames w brood</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/45">C2</a> - Split Feb 24. Right hand side\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/528">Sat 15 Jun 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking good for this time of year. Fed a little thick syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/524">Sat 15 Jun 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking fine. Good brood on 3 frames and honey on 5-6 frames.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/525">Sat 15 Jun 2024</a>\n                </div>\n                <div class="indent2">Comment: Looking OK. 8 frames in hive ATM, and a frame feeder, but I did not put anything in the feeder.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/46">Nuc1</a> - Nuc next to shed\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/526">Sat 15 Jun 2024</a>\n                </div>\n                <div class="indent2">Comment: Bees on 2 frames, so a small increase. Added thick syrup to the feeder. I think this colony may make it through.</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/57">Feed syrup</a> - Due by: Fri 21 Jun 2024\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
281	Weekly summary from Bee-db	\N	t	2023-07-02 08:25:28.720874+00	2024-03-29 03:54:10.779076+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/365">Wed 14 Jun 2023</a>\n                </div>\n                <div class="indent2">Comment: Looking fine. Plenty of stores and some brood</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/363">Wed 31 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Saw the queen, but still very little brood. However some larvae seen. Removed top feeder and then added a frame feeder with 2:1 syrup</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/364">Wed 31 May 2023</a>\n                </div>\n                <div class="indent2">Comment: Hive looks strong, but very little stores. Lots of foraging. Added a top feeder with left-over honey comb.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
125	Weekly summary from Bee-db	\N	t	2023-02-14 22:58:34.202167+00	2023-02-15 07:03:09.753717+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
126	Weekly summary from Bee-db	\N	t	2023-02-14 22:59:37.67584+00	2023-02-15 07:03:13.497277+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
127	Weekly summary from Bee-db	\N	t	2023-02-14 23:00:41.106501+00	2023-02-15 07:03:17.180544+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
128	Weekly summary from Bee-db	\N	t	2023-02-14 23:01:44.526864+00	2023-02-15 07:03:20.872257+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
129	Weekly summary from Bee-db	\N	t	2023-02-14 23:02:47.808993+00	2023-02-15 07:03:24.559558+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
130	Weekly summary from Bee-db	\N	t	2023-02-14 23:03:51.169715+00	2023-02-15 07:03:28.253617+00	2	<!doctype html>\n<html>\n\n<head>\n  <meta name="viewport" content="width=device-width" />\n  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n\n  <title>\n    \nWeekly summary\n\n  </title>\n  <style>\n    body {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n\n    .descr {\n      font-style: italic;\n    }\n\n    .topic {\n      font-family: Monospace;\n      color: blue;\n    }\n\n    .payload {\n      color: #0b772f;\n    }\n\n    .bold {\n      font-weight: bold;\n    }\n\n    table.node-details {\n      border: 1px solid black;\n      border-collapse: collapse;\n    }\n\n    td.node-details {\n      border: 1px solid black;\n    }\n\n    .maillink {\n      background-color: #36f44f;\n      color: white;\n      padding: 14px 25px;\n      text-align: center;\n      text-decoration: none;\n      display: inline-block;\n      border-radius: 10px;\n      font-weight: bold;\n    }\n\n    .warning {\n      color: orange;\n    }\n\n    div.indent {\n      text-indent: 20px;\n    }\n\n    div.indent2 {\n      text-indent: 50px;\n    }\n\n    div.notice {\n      border: 2px solid black;\n      border-radius: 5px;\n      background-color: rgb(211, 211, 211);\n    }\n\n    /* -------------------------------------\n          HEADER, FOOTER, MAIN\n      ------------------------------------- */\n    .main {\n      background: #ffffff;\n      border-radius: 3px;\n      width: 100%;\n    }\n\n    .wrapper {\n      box-sizing: border-box;\n      padding: 20px;\n    }\n\n    .content-block {\n      padding-bottom: 10px;\n      padding-top: 10px;\n    }\n\n    .footer {\n      clear: both;\n      Margin-top: 10px;\n      text-align: center;\n      width: 100%;\n    }\n\n    .footer td,\n    .footer p,\n    .footer span,\n    .footer a {\n      color: #999999;\n      font-size: 12px;\n      text-align: center;\n    }\n\n    /* unsure why this is a good thing !   */\n    .apple-link a {\n      color: inherit !important;\n      font-family: inherit !important;\n      font-size: inherit !important;\n      font-weight: inherit !important;\n      line-height: inherit !important;\n      text-decoration: none !important;\n    }\n\n    table.footer {\n      border: 0;\n      cellpadding: 0;\n      cellspacing: 0;\n    }\n\n    .signature {\n      font-family: Verdana, Geneva, Arial, sans-serif;\n    }\n  </style>\n\n</head>\n\n<body>\n  \n  <p>Hi Jim</p>\n\n<div id="apiaries" class="container-fluid">  \n  \n    <div>\n      \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/2">Coatesville</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/36">C1</a> - Originally a nuc from Vic with 2 frames brood. Moved to Coatesville 17/1/2023\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/299">Fri 03 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Starting to build. 6 frames with brood or eggs. Removed the feeder &amp; added a drawn frame. Still just 1 level.</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n        <div>\n          <h2>Apiary: <a href="https://beedb.west.net.nz/beedb/apiary/1">Torbay</a></h2>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/27">H3</a> - Left hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/305">Sun 05 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: Still looking strong</div>\n                \n                \n              \n\n              \n              \n            </div>\n            <br>\n          \n            <div id="colony">\n              <b>Colony:</b> <a href="https://beedb.west.net.nz/beedb/colony/3">H4</a> - Hive 4, rightmost hive\n              \n                <div class="indent">\n                  Last inspection: <a href="https://beedb.west.net.nz/beedb/inspection/307">Sat 11 Feb 2023</a>\n                </div>\n                <div class="indent2">Comment: No eggs, saw 3 queen cells. Now wait &amp; see</div>\n                \n                \n              \n\n              \n                <div class="indent bold">\n                  Reminders\n                </div>\n                \n                  <div class="indent2">\n                    <a href="https://beedb.west.net.nz/beedb/diary/37">Check for brood</a> - Due by: Sat 04 Mar 2023\n                  </div>\n                \n              </div>\n              \n              \n            </div>\n            <br>\n          \n          </div>\n        \n    </div>\n  \n</div>\n\n<div class="notice">\n  This email is being sent to you as per your settings in the Bee database system. You can turn on and off these emails <a href="https://beedb.west.net.nz/beedb/inspectPrefDetail/">here</a>,\n  and adjust your inspections timing preferences <a href="https://beedb.west.net.nz/beedb/commsPrefDetail/">here</a>.\n</div>\n\n\n  <!-- START Signature -->\n  <div class="signature">\n    <p>Cheers</p>\n\n    \n      <p>Your bee and beehive management system</p>\n    \n  </div>\n  <!-- END Signature -->\n</body>\n\n</html>\n
\.


--
-- Data for Name: beedb_picture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_picture (id, title, img, "uploadDt", apiary_id, beek_id, colony_id, inspection_id) FROM stdin;
1	2020	images/2/1/IMG_20200427_113340__01.jpg	2023-02-14 23:47:37.369205+00	1	2	\N	\N
2	Coatesville	images/2/2/IMG20230410105836.jpg	2023-04-10 22:00:07.977445+00	2	2	\N	\N
\.


--
-- Data for Name: beedb_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_profile (id, "phoneNumber", user_id, "bkRegistration", "lastApiary_id", address, "inspectDiaryAdd", "inspectHealthIndex", "inspectManualIndex", "inspectPeriodAutumn", "inspectPeriodSpring", "inspectPeriodSummer", "inspectPeriodWinter", "commsInspectionReminder", "commsWeeklySummary", "commsLstWeeklyEmail") FROM stdin;
4	\N	5	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
6	\N	7	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
7	\N	1	\N	\N		t	t	f	14	7	14	60	f	f	\N
1	021466721	2	A8417	\N	171 Glamorgan Dr\r\nTorbay\r\nAuckland \r\n0630	t	t	f	14	7	14	60	f	t	\N
8	\N	8	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
10	\N	10	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
11	\N	11	\N	\N	\N	t	t	f	14	7	14	60	f	f	\N
\.


--
-- Data for Name: beedb_sizechoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_sizechoice (id, size, type, value, text) FROM stdin;
7	2	Number	0	Not Recorded
8	2	Number	1	Bees on all frames
9	2	Number	2	Good bee numbers
10	2	Number	3	A single frame of bees
11	2	Number	4	Very few bees
52	4	Weight	3	Honey on 5 or more frames
53	4	Weight	4	Not much honey/nectar
54	4	Weight	5	No stores
12	2	Number	5	No bees
55	5	Weight	0	Not Recorded
56	5	Weight	1	20kg or more honey
13	3	Number	0	Not Recorded
57	5	Weight	2	10 - 20 kg honey
14	3	Number	1	Bees on all frames
58	5	Weight	3	Honey on 5 or more frames
15	3	Number	2	Bees on most frames
59	5	Weight	4	Not much honey/nectar
16	3	Number	3	Only a few frames with bees
60	5	Weight	5	No stores
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
1	1	Number	0	Not Recorded
2	1	Number	1	Bees on all frames
3	1	Number	2	Good bee numbers
4	1	Number	3	A frame of bees
5	1	Number	4	Very few bees
6	1	Number	5	No bees
37	2	Weight	0	Not Recorded
38	2	Weight	1	Good honey stores
39	2	Weight	2	Some stored honey
40	2	Weight	3	Some nectar
41	2	Weight	4	A little nectar
42	2	Weight	5	No stores
43	3	Weight	0	Not Recorded
44	3	Weight	1	10 kg or more
45	3	Weight	2	5 - 10 kg
46	3	Weight	3	A few frames with honey/nectar
47	3	Weight	4	A bit of nectar/honey
48	3	Weight	5	No stores
49	4	Weight	0	Not Recorded
50	4	Weight	1	20kg or more honey
51	4	Weight	2	10 - 20 kg honey
\.


--
-- Data for Name: beedb_transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_transfer (id, dt, outgoing, beek_name, beek_registration, beek_email, beek_phone, beek_address, notes, cost, colony_id, transaction, location, size) FROM stdin;
1	2020-12-06 11:00:00+00	t	Brandon Reynolds	A9O64	Gaggleofgirls@icloud.com	0224292813			100.00	4	1	\N	0
2	2020-12-09 11:00:00+00	t	Brandon Reynolds	A9O64	Gaggleofgirls@icloud.com	0224292813			100.00	5	1	\N	0
3	2020-12-12 03:31:00.704966+00	t	\N	\N	\N	\N	\N	Initial set up to track actions	\N	13	4	\N	4
5	2020-12-11 11:00:00+00	t	\N	\N	\N	\N	\N		\N	15	3	Glamorgan dr, Torbay	2
4	2020-12-12 03:33:27.927731+00	t	\N	\N	\N	\N	\N		\N	\N	5	\N	2
6	2020-11-03 11:00:00+00	t	Rod Willis	A8507	\N	021855172	77 Calgary St, Mt Eden		100.00	15	1	\N	0
7	2021-09-22 02:31:26.973894+00	t	\N	\N	\N	\N	\N		\N	16	4	\N	3
8	2021-09-22 02:33:45.455583+00	t	\N	\N	\N	\N	\N		\N	17	4	\N	3
9	2020-10-21 11:00:00+00	t	\N	\N	\N	\N	\N		\N	18	3	Torbay	2
10	2021-09-22 02:59:05.404085+00	t	\N	\N	\N	\N	\N		\N	19	4	\N	2
11	2021-10-01 22:46:57.993103+00	t	\N	\N	\N	\N	\N		\N	20	5	\N	2
12	2021-10-01 22:49:10.425032+00	t	\N	\N	\N	\N	\N	3 Frames with queen cells	\N	21	5	\N	1
13	2021-10-02 11:00:00+00	t	Greg Borrageiro	A8871	\N	\N	60 Redwing Street\r\nBrowns Bay		\N	19	1	\N	0
14	2021-10-15 22:27:49.57066+00	t	\N	\N	\N	\N	\N	Started with 3 frames from H4, each frame looked like it had queen cells on it.	\N	22	5	\N	1
15	2021-10-25 11:00:00+00	t	\N	\N	\N	\N	\N		\N	23	3	Next to H4	2
16	2021-10-25 11:00:00+00	t	\N	\N	\N	\N	\N		\N	24	3	Next to Andrews fence/wall	2
17	2021-11-16 23:19:28.31202+00	t	\N	\N	\N	\N	\N	Started with 2 frames from QC1	\N	25	5	\N	1
18	2022-01-06 00:56:10.827938+00	t	\N	\N	\N	\N	\N		\N	26	4	\N	1
19	2022-09-17 01:27:09.234258+00	t	\N	\N	\N	\N	\N	Split from H4 with existing Queen	\N	27	5	\N	1
20	2022-10-24 05:30:35.337415+00	t	\N	\N	\N	\N	\N	Bees ex Kaipara hive	\N	28	4	\N	3
21	2022-11-05 00:05:02.527693+00	t	\N	\N	\N	\N	\N		\N	29	4	\N	3
22	2022-11-04 11:00:00+00	t	\N	\N	\N	\N	\N		\N	30	3	Left	2
23	2022-11-05 00:06:41.084157+00	t	\N	\N	\N	\N	\N		\N	31	4	\N	3
24	2018-12-22 11:00:00+00	t	Alistar	?	ernst@superbsoftware.co.nz	?	?		0.00	32	2	\N	4
25	2022-12-23 10:16:00.841967+00	t	\N	\N	\N	\N	\N		\N	33	4	\N	4
26	2022-12-25 23:56:16.728432+00	t	\N	\N	\N	\N	\N	Due availability of a V Queen, and the strength of the Corflute NUC decided to split it	\N	34	4	\N	1
27	2022-12-26 00:00:36.421676+00	t	\N	\N	\N	\N	\N		\N	35	5	\N	3
28	2022-12-09 11:00:00+00	t	Vic Dundas	Gg	Vic@Gmail.com	00000	Ffff		0.00	36	2	\N	1
29	2023-01-07 23:00:16.136753+00	t	\N	\N	\N	\N	\N	2 frames from H4, one with 2 'swarm cells'. Lets see if anything comes from it.	\N	37	5	\N	1
30	2023-02-21 22:51:15.334012+00	t	\N	\N	\N	\N	\N	Put original queen in from H3	\N	38	5	\N	1
31	2023-03-04 22:01:53.093708+00	t	\N	\N	\N	\N	\N		\N	39	4	\N	3
32	2023-03-04 22:07:25.932912+00	t	\N	\N	\N	\N	\N	3 of the 6 frames busy with bees	\N	40	4	\N	3
33	2023-03-27 11:00:00+00	t	Alistair Little	W0017	Alittle@gmail.com	0274725914	75 Knights Road,, Rothesay Bay\r\nRothesay Bay		200.00	41	2	\N	1
34	2023-05-13 12:00:00+00	t	Ivan	\N	\N	\N		Gave to Brian Gray / Ivan	0.00	38	1	\N	0
35	2023-08-29 12:00:00+00	t	Greg Borrageiro	A8871	greg.borrageiro@outlook.com	+64212523850	60 Redwing Road\r\nBrowns Bay\r\nAuckland	Hive survived the winter despite heavy varroa initially. Starting to build nicely	0.00	41	1	\N	0
36	2023-10-28 03:46:45.588122+00	t	\N	\N	\N	\N	\N	Greg returning equipment previously transferred to him late August	\N	42	4	\N	1
37	2023-11-21 04:40:12.767244+00	t	\N	\N	\N	\N	\N		\N	43	5	\N	1
38	2023-11-24 22:41:42.104332+00	t	\N	\N	\N	\N	\N		\N	44	5	\N	1
39	2024-02-04 11:00:00+00	t	Robyn Nicholls	F0605	\N	\N	130 Taylors Road\r\nMount Albert	Bees free. All equipment replaced	0.01	42	1	\N	0
40	2024-02-05 23:25:44.448788+00	t	\N	\N	\N	\N	\N		\N	45	5	\N	1
41	2024-02-05 23:32:47.174828+00	t	\N	\N	\N	\N	\N	Added queen cell from my QC breeding attempt	\N	46	5	\N	1
42	2024-02-06 20:36:34.531425+00	t	\N	\N	\N	\N	\N	Bees brushed from 3 frames of Rose Hive and Jim's 2 QC added	\N	47	4	\N	1
\.


--
-- Data for Name: beedb_treatment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_treatment (completed, id, "treatmentType_id", colony_id, "insertDt", "removeDt", "preVarroa", "postVarroa", "trNotes", inspection_id) FROM stdin;
t	3	1	3	2022-08-07 12:00:00+00	2022-10-12 11:00:00+00	5	1	Treatment seems successful	\N
t	4	1	27	2022-08-07 12:00:00+00	2022-10-12 11:00:00+00	2	1		\N
t	5	7	3	2023-03-18 11:00:00+00	2023-05-06 12:00:00+00	0	1		\N
t	6	7	27	2023-03-18 11:00:00+00	2023-05-06 12:00:00+00	0	1		\N
t	7	7	36	2023-03-18 11:00:00+00	2023-05-06 12:00:00+00	4	1		\N
t	8	1	41	2023-05-26 12:00:00+00	2023-07-22 12:00:00+00	5	0		\N
t	9	6	36	2023-08-12 12:00:00+00	2023-09-23 12:00:00+00	0	0	2 strips put in	\N
t	13	6	39	2023-08-24 12:00:00+00	2023-10-16 11:00:00+00	4	0		\N
t	12	6	35	2023-08-24 12:00:00+00	2023-10-05 11:00:00+00	2	0	removed 17/10/23	\N
t	14	6	18	2023-08-24 12:00:00+00	2023-10-05 11:00:00+00	0	0	removed 17/10/23	\N
t	10	6	27	2023-08-19 12:00:00+00	2023-09-30 11:00:00+00	0	0	2 strips added	\N
t	11	6	3	2023-08-19 12:00:00+00	2023-09-30 11:00:00+00	0	0	4 strips added, 2 in each box.	\N
t	15	6	18	2023-10-21 11:00:00+00	2023-12-02 11:00:00+00	3	4		\N
t	16	4	39	2023-12-10 11:00:00+00	2023-12-10 11:00:00+00	4	0		\N
t	17	4	35	2023-12-10 11:00:00+00	2023-12-10 11:00:00+00	4	0	Treated both 9th & 11th	\N
t	18	4	18	2023-12-10 11:00:00+00	2023-12-10 11:00:00+00	4	0	Treated 9th & 11th	\N
t	19	4	36	2023-12-16 11:00:00+00	2023-12-16 11:00:00+00	3	0		\N
t	20	4	3	2023-12-15 11:00:00+00	2023-12-15 11:00:00+00	4	0		\N
t	21	4	35	2023-12-16 11:00:00+00	2023-12-16 11:00:00+00	0	0		\N
t	22	4	18	2023-12-16 11:00:00+00	2023-12-16 11:00:00+00	0	0		\N
t	23	4	3	2023-12-16 11:00:00+00	2023-12-16 11:00:00+00	0	0		\N
t	24	4	36	2024-01-04 11:00:00+00	2024-01-04 11:00:00+00	2	0		\N
t	25	4	3	2024-01-06 11:00:00+00	2024-01-06 11:00:00+00	0	0		\N
t	26	4	27	2024-01-06 11:00:00+00	2024-01-06 11:00:00+00	0	0		\N
t	28	4	35	2024-01-30 11:00:00+00	2024-01-30 11:00:00+00	5	0		\N
f	30	6	35	2024-02-03 11:00:00+00	2024-03-16 11:00:00+00	0	0		\N
t	36	6	39	2024-02-19 11:00:00+00	2024-02-19 11:00:00+00	0	0	High incident og DWV	\N
t	29	6	39	2024-02-03 11:00:00+00	2024-02-19 11:00:00+00	0	0		\N
f	37	7	39	2024-02-20 11:00:00+00	2024-04-09 12:00:00+00	5	0	3 new strips inserted	\N
t	27	6	18	2023-12-31 11:00:00+00	2024-02-11 11:00:00+00	5	0	3 x vapourisation did not seem to slow varroa growth. Place 4 strips per brood frame	\N
f	38	7	35	2024-02-26 11:00:00+00	2024-04-15 12:00:00+00	0	0		\N
t	33	6	3	2024-02-12 11:00:00+00	2024-03-25 11:00:00+00	3	0		\N
t	35	6	46	2024-02-12 11:00:00+00	2024-03-25 11:00:00+00	0	0		\N
t	34	6	27	2024-02-12 11:00:00+00	2024-03-25 11:00:00+00	3	0		\N
t	31	6	36	2024-02-05 11:00:00+00	2024-03-18 11:00:00+00	0	0		\N
t	32	6	45	2024-02-05 11:00:00+00	2024-03-18 11:00:00+00	0	0		\N
t	43	7	45	2024-03-01 11:00:00+00	2024-05-19 12:00:00+00	0	0		\N
t	42	7	36	2024-03-01 11:00:00+00	2024-05-19 12:00:00+00	0	0		\N
t	39	7	3	2024-03-01 11:00:00+00	2024-05-19 12:00:00+00	0	0		\N
t	41	7	46	2024-03-01 11:00:00+00	2024-05-19 12:00:00+00	0	0		\N
t	40	7	27	2024-03-01 11:00:00+00	2024-05-19 12:00:00+00	0	0		\N
\.


--
-- Data for Name: beedb_treatmenttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beedb_treatmenttype (id, name, manufacturer, organic, "requireRemoval", "daysInHive", url, description, instructions) FROM stdin;
1	Bayvarol	Bayer	f	t	56	https://www.ecrotek.co.nz/product/bayvarol-strips-per-strip-packet	Plastic strips that contain Flumethrin.	Treatment is 4 strips per brood box, i.e. 10 frames.\r\nJust bend back the two tabs and hook the strips over the top edge of the wooden frame. A single treatment of the bee colonies is sufficient. Strips should not be re-used.\r\nLeave in hive for 6 - 8 weeks
2	Apitraz	Calier	f	t	70	https://www.ecrotek.co.nz/product/apitraz-easy-varroa-strip-10-pack-note-click-product-to-view-expiry-info	Apitraz® is an Amitraz based product for the treatment of Varroa Destructor in Apis Melifera. There is a 2 week withholding period, you must remove the strips 2 weeks before adding any honey supers	Apply 2 strips per brood box (10 frames). Leave strips in for 10 weeks.
3	Formic Pro	NOD	f	f	7	\N	Formic Pro (previously known as MAQS+) is a formic acid polysaccharide gel strip wrapped in a vapour releasing wick, developed for the treatment and control of Varroa mites in honeybees (Apis mellifera).\r\nCan be used during the honey flow.	Apply 2 strip to the lower brood box. Strips do not need to be removes, but remnants can be scraped away by beekeeper after 7 days.\r\nTemperature must be between 10C and 29.5C.\r\nNo honey should be harvested until 3 weeks after treatment applied.
4	Oxalic Acid Vapourisation	N/A	t	f	\N	\N	Oxalic acid is vapourised using heat and applied to the brood chambers. Can be used with honey supers on.	N.B> Ensure you are using good PPE, personal protective equipment.\r\nEither use a commercial vapouriser and blow the vapour into the hive. Or use a heating plate. I this method the oxalic acid (OA) is placed on the plate, the plate is inserted into the botton of the hive and then heated to vapourised the OA.
5	Apistan	Vita	f	t	42	\N	Tau fluvalinate	Insert 2 strips per brood box (10 frames) for 6 weeks.\r\n\r\nDo not use which honey supers on
7	Apivar	Veto-pharma – France	f	t	49	https://apivar.co.nz/	Apivar® is a contact miticide and the active ingredient, Amitraz, is distributed throughout the hive by bees contacting the strips and then contacting other bees.	Each application requires 2 new rigid strips per brood chamber. It is important to maintain this dosage as it provides the necessary strip surface area to ensure that the bees are able to distribute enough active ingredient throughout the colony to provide optimum efficacy.\r\n\r\nEach strip can be easily suspended between the frames, from the topbars, using a toothpick or match through the hole provided. Alternatively you can use the pop-up triangular tag to hang the strip from the top of the frame.
6	Oxalic acid & Glycerine soaked cardboard strips	Home made	t	t	42	\N	Cardboard soaked in a solution of glycerine & oxalic acid	Apply 2 strips bent into a staple per brood box(10 frames). Remove after 6 weeks.\r\nCan be used in the honey flow.
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-12-08 00:38:05.097059+00	1	Jim West	1	[{"added": {}}]	11	2
2	2020-12-08 00:38:13.001896+00	2	Coatesville	2	[{"changed": {"fields": ["Beeknew"]}}]	8	2
3	2020-12-08 00:38:18.628736+00	1	Torbay	2	[{"changed": {"fields": ["Beeknew"]}}]	8	2
4	2020-12-08 00:39:39.968892+00	2	Rod Willis	1	[{"added": {}}]	11	2
5	2020-12-09 03:40:19.478429+00	2	Coatesville	2	[{"changed": {"fields": ["Beeknew1"]}}]	8	2
6	2020-12-09 03:40:24.821608+00	1	Torbay	2	[{"changed": {"fields": ["Beeknew1"]}}]	8	2
7	2020-12-10 01:19:29.925374+00	1	jim	1	[{"added": {}}]	7	2
8	2020-12-12 03:37:05.601575+00	14	Nuc 3	3		9	2
9	2021-08-17 22:24:07.891547+00	3	et@west.net.nz	3		4	2
10	2021-08-19 03:21:00.10259+00	4	et@west.net.nz	3		4	2
11	2022-02-27 02:52:15.354995+00	7	admin	1	[{"added": {}}]	7	2
12	2022-11-02 02:49:41.020698+00	1	Bayvarol	1	[{"added": {}}]	19	2
13	2022-11-02 02:53:28.969094+00	2	Apitraz	1	[{"added": {}}]	19	2
14	2022-11-02 02:59:37.197826+00	3	Formic Pro	1	[{"added": {}}]	19	2
15	2022-11-02 03:06:06.521292+00	4	Oxalic Acid Vapourisation	1	[{"added": {}}]	19	2
16	2022-11-02 03:10:37.076743+00	5	Apistan	1	[{"added": {}}]	19	2
17	2022-11-02 03:12:40.40241+00	6	Oxalic acid & Glycerine soaked cardboard strips	1	[{"added": {}}]	19	2
18	2022-11-02 03:15:20.152603+00	2	Bayvarol in H4	3		18	2
19	2022-12-16 01:22:17.825274+00	6	surf@west.net.nz	3		4	2
20	2022-12-16 01:23:42.690682+00	5	et@west.net.nz	2	[{"changed": {"fields": ["password"]}}]	4	2
21	2022-12-16 01:28:55.317583+00	9	roderick@west.net.nz	3		4	2
22	2023-02-15 07:02:53.954931+00	267	Message object (267)	3		16	2
23	2023-02-15 07:02:54.216424+00	266	Message object (266)	3		16	2
24	2023-02-15 07:02:54.274264+00	265	Message object (265)	3		16	2
25	2023-02-15 07:02:54.331914+00	264	Message object (264)	3		16	2
26	2023-02-15 07:02:54.389688+00	263	Message object (263)	3		16	2
27	2023-02-15 07:02:54.447415+00	262	Message object (262)	3		16	2
28	2023-02-15 07:02:54.505246+00	261	Message object (261)	3		16	2
29	2023-02-15 07:02:54.562812+00	260	Message object (260)	3		16	2
30	2023-02-15 07:02:54.620465+00	259	Message object (259)	3		16	2
31	2023-02-15 07:02:54.678229+00	258	Message object (258)	3		16	2
32	2023-02-15 07:02:54.757327+00	257	Message object (257)	3		16	2
33	2023-02-15 07:02:54.85901+00	256	Message object (256)	3		16	2
34	2023-02-15 07:02:54.897389+00	255	Message object (255)	3		16	2
35	2023-02-15 07:02:54.954939+00	254	Message object (254)	3		16	2
36	2023-02-15 07:02:55.07065+00	253	Message object (253)	3		16	2
37	2023-02-15 07:02:55.128354+00	252	Message object (252)	3		16	2
38	2023-02-15 07:02:55.18596+00	251	Message object (251)	3		16	2
39	2023-02-15 07:02:55.243372+00	250	Message object (250)	3		16	2
40	2023-02-15 07:02:55.301343+00	249	Message object (249)	3		16	2
41	2023-02-15 07:02:55.35909+00	248	Message object (248)	3		16	2
42	2023-02-15 07:02:55.416253+00	247	Message object (247)	3		16	2
43	2023-02-15 07:02:55.47394+00	246	Message object (246)	3		16	2
44	2023-02-15 07:02:55.531822+00	245	Message object (245)	3		16	2
45	2023-02-15 07:02:55.589388+00	244	Message object (244)	3		16	2
46	2023-02-15 07:02:55.747431+00	243	Message object (243)	3		16	2
47	2023-02-15 07:02:55.899367+00	242	Message object (242)	3		16	2
48	2023-02-15 07:02:55.924448+00	241	Message object (241)	3		16	2
49	2023-02-15 07:02:55.982115+00	240	Message object (240)	3		16	2
50	2023-02-15 07:02:56.039815+00	239	Message object (239)	3		16	2
51	2023-02-15 07:02:56.097543+00	238	Message object (238)	3		16	2
52	2023-02-15 07:02:56.155291+00	237	Message object (237)	3		16	2
53	2023-02-15 07:02:56.212931+00	236	Message object (236)	3		16	2
54	2023-02-15 07:02:56.27066+00	235	Message object (235)	3		16	2
55	2023-02-15 07:02:56.32811+00	204	Message object (204)	3		16	2
56	2023-02-15 07:02:56.385976+00	203	Message object (203)	3		16	2
57	2023-02-15 07:02:56.443731+00	202	Message object (202)	3		16	2
58	2023-02-15 07:02:56.50137+00	201	Message object (201)	3		16	2
59	2023-02-15 07:02:56.559149+00	200	Message object (200)	3		16	2
60	2023-02-15 07:02:56.616758+00	199	Message object (199)	3		16	2
61	2023-02-15 07:02:56.674538+00	198	Message object (198)	3		16	2
62	2023-02-15 07:02:56.732198+00	197	Message object (197)	3		16	2
63	2023-02-15 07:02:56.789947+00	196	Message object (196)	3		16	2
64	2023-02-15 07:02:56.847585+00	195	Message object (195)	3		16	2
65	2023-02-15 07:02:56.905275+00	194	Message object (194)	3		16	2
66	2023-02-15 07:02:56.96301+00	193	Message object (193)	3		16	2
67	2023-02-15 07:02:57.020589+00	192	Message object (192)	3		16	2
68	2023-02-15 07:02:57.078507+00	191	Message object (191)	3		16	2
69	2023-02-15 07:02:57.089906+00	190	Message object (190)	3		16	2
70	2023-02-15 07:02:57.101454+00	189	Message object (189)	3		16	2
71	2023-02-15 07:02:57.112971+00	188	Message object (188)	3		16	2
72	2023-02-15 07:02:57.124467+00	187	Message object (187)	3		16	2
73	2023-02-15 07:02:57.136066+00	186	Message object (186)	3		16	2
74	2023-02-15 07:02:57.147549+00	185	Message object (185)	3		16	2
75	2023-02-15 07:02:57.159268+00	184	Message object (184)	3		16	2
76	2023-02-15 07:02:57.170701+00	183	Message object (183)	3		16	2
77	2023-02-15 07:02:57.182159+00	182	Message object (182)	3		16	2
78	2023-02-15 07:02:57.193668+00	181	Message object (181)	3		16	2
79	2023-02-15 07:02:57.205408+00	180	Message object (180)	3		16	2
80	2023-02-15 07:02:57.216896+00	179	Message object (179)	3		16	2
81	2023-02-15 07:02:57.228477+00	178	Message object (178)	3		16	2
82	2023-02-15 07:02:57.240009+00	177	Message object (177)	3		16	2
83	2023-02-15 07:02:57.251541+00	176	Message object (176)	3		16	2
84	2023-02-15 07:02:57.26315+00	175	Message object (175)	3		16	2
85	2023-02-15 07:02:57.27463+00	174	Message object (174)	3		16	2
86	2023-02-15 07:02:57.286166+00	173	Message object (173)	3		16	2
87	2023-02-15 07:02:57.297698+00	172	Message object (172)	3		16	2
88	2023-02-15 07:02:57.309007+00	171	Message object (171)	3		16	2
89	2023-02-15 07:02:57.320476+00	170	Message object (170)	3		16	2
90	2023-02-15 07:02:57.332302+00	169	Message object (169)	3		16	2
91	2023-02-15 07:02:57.343585+00	168	Message object (168)	3		16	2
92	2023-02-15 07:02:57.355165+00	167	Message object (167)	3		16	2
93	2023-02-15 07:02:57.366723+00	166	Message object (166)	3		16	2
94	2023-02-15 07:02:57.378277+00	165	Message object (165)	3		16	2
95	2023-02-15 07:02:57.389988+00	164	Message object (164)	3		16	2
96	2023-02-15 07:02:57.401518+00	163	Message object (163)	3		16	2
97	2023-02-15 07:02:57.413062+00	162	Message object (162)	3		16	2
98	2023-02-15 07:02:57.424638+00	161	Message object (161)	3		16	2
99	2023-02-15 07:02:57.436206+00	160	Message object (160)	3		16	2
100	2023-02-15 07:02:57.447676+00	159	Message object (159)	3		16	2
101	2023-02-15 07:02:57.459332+00	158	Message object (158)	3		16	2
102	2023-02-15 07:02:57.470893+00	157	Message object (157)	3		16	2
103	2023-02-15 07:02:57.48235+00	156	Message object (156)	3		16	2
104	2023-02-15 07:02:57.493884+00	155	Message object (155)	3		16	2
105	2023-02-15 07:02:57.505426+00	154	Message object (154)	3		16	2
106	2023-02-15 07:02:57.516976+00	153	Message object (153)	3		16	2
107	2023-02-15 07:02:57.528493+00	152	Message object (152)	3		16	2
108	2023-02-15 07:02:57.540131+00	151	Message object (151)	3		16	2
109	2023-02-15 07:02:57.551567+00	150	Message object (150)	3		16	2
110	2023-02-15 07:02:57.563104+00	149	Message object (149)	3		16	2
111	2023-02-15 07:02:57.574705+00	148	Message object (148)	3		16	2
112	2023-02-15 07:02:57.586194+00	147	Message object (147)	3		16	2
113	2023-02-15 07:02:57.597713+00	146	Message object (146)	3		16	2
114	2023-02-15 07:02:57.609255+00	145	Message object (145)	3		16	2
115	2023-02-15 07:02:57.62088+00	144	Message object (144)	3		16	2
116	2023-02-15 07:02:57.63242+00	143	Message object (143)	3		16	2
117	2023-02-15 07:02:57.643877+00	142	Message object (142)	3		16	2
118	2023-02-15 07:02:57.655384+00	141	Message object (141)	3		16	2
119	2023-02-15 07:02:57.667127+00	140	Message object (140)	3		16	2
120	2023-02-15 07:02:57.678631+00	139	Message object (139)	3		16	2
121	2023-02-15 07:02:57.690164+00	138	Message object (138)	3		16	2
122	2023-02-15 07:03:06.718473+00	137	Message object (137)	3		16	2
123	2023-02-15 07:03:06.773512+00	136	Message object (136)	3		16	2
124	2023-02-15 07:03:06.784892+00	135	Message object (135)	3		16	2
125	2023-02-15 07:03:06.796395+00	134	Message object (134)	3		16	2
126	2023-02-15 07:03:06.80795+00	133	Message object (133)	3		16	2
127	2023-02-15 07:03:06.81958+00	132	Message object (132)	3		16	2
128	2023-02-15 07:03:06.831127+00	131	Message object (131)	3		16	2
129	2023-02-15 07:03:06.842535+00	130	Message object (130)	3		16	2
130	2023-02-15 07:03:06.85424+00	129	Message object (129)	3		16	2
131	2023-02-15 07:03:06.865784+00	128	Message object (128)	3		16	2
132	2023-02-15 07:03:06.877085+00	127	Message object (127)	3		16	2
133	2023-02-15 07:03:06.888624+00	126	Message object (126)	3		16	2
134	2023-02-15 07:03:06.900601+00	125	Message object (125)	3		16	2
135	2023-02-15 07:03:06.912148+00	124	Message object (124)	3		16	2
136	2023-02-15 07:03:06.923678+00	123	Message object (123)	3		16	2
137	2023-02-15 07:03:06.935328+00	122	Message object (122)	3		16	2
138	2023-02-15 07:03:06.946874+00	121	Message object (121)	3		16	2
139	2023-02-15 07:03:06.958374+00	120	Message object (120)	3		16	2
140	2023-02-15 07:03:06.969919+00	119	Message object (119)	3		16	2
141	2023-02-15 07:03:06.98144+00	118	Message object (118)	3		16	2
142	2023-02-15 07:03:06.993004+00	117	Message object (117)	3		16	2
143	2023-02-15 07:03:07.004365+00	116	Message object (116)	3		16	2
144	2023-02-15 07:03:07.016076+00	115	Message object (115)	3		16	2
145	2023-02-15 07:03:07.027602+00	114	Message object (114)	3		16	2
146	2023-02-15 07:03:07.039155+00	113	Message object (113)	3		16	2
147	2023-02-15 07:03:07.050688+00	112	Message object (112)	3		16	2
148	2023-02-15 07:03:07.062239+00	111	Message object (111)	3		16	2
149	2023-02-15 07:03:07.073768+00	110	Message object (110)	3		16	2
150	2023-02-15 07:03:07.085312+00	109	Message object (109)	3		16	2
151	2023-02-15 07:03:07.096862+00	108	Message object (108)	3		16	2
152	2023-02-15 07:03:07.108377+00	107	Message object (107)	3		16	2
153	2023-02-15 07:03:07.119872+00	106	Message object (106)	3		16	2
154	2023-02-15 07:03:07.13141+00	105	Message object (105)	3		16	2
155	2023-02-15 07:03:07.142995+00	104	Message object (104)	3		16	2
156	2023-02-15 07:03:07.154582+00	103	Message object (103)	3		16	2
157	2023-02-15 07:03:07.166158+00	102	Message object (102)	3		16	2
158	2023-02-15 07:03:07.1777+00	101	Message object (101)	3		16	2
159	2023-02-15 07:03:07.189367+00	100	Message object (100)	3		16	2
160	2023-02-15 07:03:07.200552+00	99	Message object (99)	3		16	2
161	2023-02-15 07:03:07.2123+00	98	Message object (98)	3		16	2
162	2023-02-15 07:03:07.223709+00	97	Message object (97)	3		16	2
163	2023-02-15 07:03:07.235312+00	96	Message object (96)	3		16	2
164	2023-02-15 07:03:07.246871+00	95	Message object (95)	3		16	2
165	2023-02-15 07:03:07.258384+00	94	Message object (94)	3		16	2
166	2023-02-15 07:03:07.269864+00	93	Message object (93)	3		16	2
167	2023-02-15 07:03:07.281476+00	92	Message object (92)	3		16	2
168	2023-02-15 07:03:07.293005+00	91	Message object (91)	3		16	2
169	2023-02-15 07:03:07.304461+00	90	Message object (90)	3		16	2
170	2023-02-15 07:03:07.316078+00	89	Message object (89)	3		16	2
171	2023-02-15 07:03:07.327798+00	88	Message object (88)	3		16	2
172	2023-02-15 07:03:07.339347+00	87	Message object (87)	3		16	2
173	2023-02-15 07:03:07.350903+00	86	Message object (86)	3		16	2
174	2023-02-15 07:03:07.362399+00	85	Message object (85)	3		16	2
175	2023-02-15 07:03:07.37389+00	84	Message object (84)	3		16	2
176	2023-02-15 07:03:07.385479+00	83	Message object (83)	3		16	2
177	2023-02-15 07:03:07.397038+00	82	Message object (82)	3		16	2
178	2023-02-15 07:03:07.408577+00	81	Message object (81)	3		16	2
179	2023-02-15 07:03:07.420076+00	80	Message object (80)	3		16	2
180	2023-02-15 07:03:07.431592+00	79	Message object (79)	3		16	2
181	2023-02-15 07:03:07.443187+00	78	Message object (78)	3		16	2
182	2023-02-15 07:03:07.4547+00	77	Message object (77)	3		16	2
183	2023-02-15 07:03:07.466228+00	76	Message object (76)	3		16	2
184	2023-02-15 07:03:07.477687+00	75	Message object (75)	3		16	2
185	2023-02-15 07:03:07.489315+00	74	Message object (74)	3		16	2
186	2023-02-15 07:03:07.500843+00	73	Message object (73)	3		16	2
187	2023-02-15 07:03:07.512308+00	72	Message object (72)	3		16	2
188	2023-02-15 07:03:07.523863+00	71	Message object (71)	3		16	2
189	2023-02-15 07:03:07.535586+00	70	Message object (70)	3		16	2
190	2023-02-15 07:03:07.54707+00	69	Message object (69)	3		16	2
191	2023-02-15 07:03:07.558616+00	68	Message object (68)	3		16	2
192	2023-02-15 07:03:07.570174+00	67	Message object (67)	3		16	2
193	2023-02-15 07:03:07.581575+00	65	Message object (65)	3		16	2
194	2023-02-15 07:03:07.593246+00	64	Message object (64)	3		16	2
195	2023-02-15 07:03:07.604769+00	63	Message object (63)	3		16	2
196	2023-02-15 07:03:07.616313+00	62	Message object (62)	3		16	2
197	2023-02-15 07:03:07.627885+00	61	Message object (61)	3		16	2
198	2023-02-15 07:03:07.639431+00	60	Message object (60)	3		16	2
199	2023-02-15 07:03:07.650989+00	59	Message object (59)	3		16	2
200	2023-02-15 07:03:07.662292+00	58	Message object (58)	3		16	2
201	2023-02-15 07:03:07.674014+00	57	Message object (57)	3		16	2
202	2023-02-15 07:03:07.685564+00	56	Message object (56)	3		16	2
203	2023-02-15 07:03:07.697057+00	55	Message object (55)	3		16	2
204	2023-02-15 07:03:07.70862+00	54	Message object (54)	3		16	2
205	2023-02-15 07:03:07.720197+00	53	Message object (53)	3		16	2
206	2023-02-15 07:03:07.731724+00	52	Message object (52)	3		16	2
207	2023-02-15 07:03:07.743302+00	51	Message object (51)	3		16	2
208	2023-02-15 07:03:07.754867+00	50	Message object (50)	3		16	2
209	2023-02-15 07:03:07.766345+00	49	Message object (49)	3		16	2
210	2023-02-15 07:03:07.777903+00	48	Message object (48)	3		16	2
211	2023-02-15 07:03:07.789393+00	47	Message object (47)	3		16	2
212	2023-02-15 07:03:07.800922+00	46	Message object (46)	3		16	2
213	2023-02-15 07:03:07.814359+00	45	Message object (45)	3		16	2
214	2023-02-15 07:03:07.823952+00	44	Message object (44)	3		16	2
215	2023-02-15 07:03:07.835495+00	43	Message object (43)	3		16	2
216	2023-02-15 07:03:07.847028+00	42	Message object (42)	3		16	2
217	2023-02-15 07:03:07.858909+00	41	Message object (41)	3		16	2
218	2023-02-15 07:03:07.870036+00	40	Message object (40)	3		16	2
219	2023-02-15 07:03:07.881631+00	39	Message object (39)	3		16	2
220	2023-02-15 07:03:07.893301+00	38	Message object (38)	3		16	2
221	2023-02-15 07:03:07.904808+00	37	Message object (37)	3		16	2
222	2023-02-15 07:03:14.598955+00	36	Message object (36)	3		16	2
223	2023-02-15 07:03:14.655209+00	35	Message object (35)	3		16	2
224	2023-02-15 07:03:14.666743+00	34	Message object (34)	3		16	2
225	2023-02-15 07:03:14.678408+00	33	Message object (33)	3		16	2
226	2023-02-15 07:03:14.689892+00	32	Message object (32)	3		16	2
227	2023-02-15 07:03:14.701512+00	31	Message object (31)	3		16	2
228	2023-02-15 07:03:14.713023+00	30	Message object (30)	3		16	2
229	2023-02-15 07:03:14.724557+00	29	Message object (29)	3		16	2
230	2023-02-15 07:03:14.736057+00	28	Message object (28)	3		16	2
231	2023-02-15 07:03:14.747637+00	27	Message object (27)	3		16	2
232	2023-02-15 07:03:14.759213+00	26	Message object (26)	3		16	2
233	2023-02-15 07:03:14.770702+00	25	Message object (25)	3		16	2
234	2023-02-15 07:03:14.782226+00	24	Message object (24)	3		16	2
235	2023-02-15 07:03:14.793747+00	23	Message object (23)	3		16	2
236	2023-02-15 07:03:14.805327+00	22	Message object (22)	3		16	2
237	2023-02-15 07:03:14.81686+00	21	Message object (21)	3		16	2
238	2023-02-15 07:03:14.828403+00	20	Message object (20)	3		16	2
239	2023-02-15 07:03:14.83994+00	19	Message object (19)	3		16	2
240	2023-02-15 07:03:14.851385+00	18	Message object (18)	3		16	2
241	2023-02-15 07:03:14.863143+00	17	Message object (17)	3		16	2
242	2023-02-15 07:03:14.874187+00	16	Message object (16)	3		16	2
243	2023-02-15 07:03:14.885719+00	15	Message object (15)	3		16	2
244	2023-02-15 07:03:14.897262+00	14	Message object (14)	3		16	2
245	2023-02-15 07:03:14.908795+00	13	Message object (13)	3		16	2
246	2023-02-15 07:03:14.920206+00	12	Message object (12)	3		16	2
247	2023-02-15 07:03:14.932101+00	11	Message object (11)	3		16	2
248	2023-02-15 07:03:14.943859+00	10	Message object (10)	3		16	2
249	2023-02-15 07:03:14.955421+00	9	Message object (9)	3		16	2
250	2023-02-15 07:03:14.966982+00	8	Message object (8)	3		16	2
251	2023-02-15 07:03:14.978383+00	7	Message object (7)	3		16	2
252	2023-02-15 07:03:14.990012+00	6	Message object (6)	3		16	2
253	2023-02-15 07:03:15.001396+00	5	Message object (5)	3		16	2
254	2023-02-15 07:03:15.013151+00	4	Message object (4)	3		16	2
255	2023-02-15 07:03:15.024643+00	3	Message object (3)	3		16	2
256	2023-02-15 07:03:15.036196+00	1	Message object (1)	3		16	2
257	2023-03-18 22:07:20.212124+00	7	Apivar	1	[{"added": {}}]	19	2
258	2023-08-20 03:22:54.244253+00	6	Oxalic acid & Glycerine soaked cardboard strips	2	[{"changed": {"fields": ["Instructions"]}}]	19	2
259	2023-08-20 03:23:11.70265+00	6	Oxalic acid & Glycerine soaked cardboard strips	2	[{"changed": {"fields": ["DaysInHive"]}}]	19	2
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
11	beedb	beek
12	beedb	transfer
13	beedb	audit
14	beedb	diary
15	beedb	config
16	beedb	message
17	beedb	feedback
18	beedb	treatment
19	beedb	treatmenttype
20	beedb	sizechoice
21	authtoken	token
22	authtoken	tokenproxy
23	mailer	dontsendentry
24	mailer	message
25	mailer	messagelog
26	beedb	picture
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-05 20:26:53.135111+00
2	auth	0001_initial	2020-12-05 20:26:53.439109+00
3	admin	0001_initial	2020-12-05 20:26:53.985854+00
4	admin	0002_logentry_remove_auto_add	2020-12-05 20:26:54.06808+00
5	admin	0003_logentry_add_action_flag_choices	2020-12-05 20:26:54.084683+00
6	contenttypes	0002_remove_content_type_name	2020-12-05 20:26:54.108366+00
7	auth	0002_alter_permission_name_max_length	2020-12-05 20:26:54.117568+00
8	auth	0003_alter_user_email_max_length	2020-12-05 20:26:54.126514+00
9	auth	0004_alter_user_username_opts	2020-12-05 20:26:54.142383+00
10	auth	0005_alter_user_last_login_null	2020-12-05 20:26:54.151486+00
11	auth	0006_require_contenttypes_0002	2020-12-05 20:26:54.162189+00
12	auth	0007_alter_validators_add_error_messages	2020-12-05 20:26:54.175785+00
13	auth	0008_alter_user_username_max_length	2020-12-05 20:26:54.221266+00
14	auth	0009_alter_user_last_name_max_length	2020-12-05 20:26:54.244309+00
15	auth	0010_alter_group_name_max_length	2020-12-05 20:26:54.260746+00
16	auth	0011_update_proxy_permissions	2020-12-05 20:26:54.275873+00
17	auth	0012_alter_user_first_name_max_length	2020-12-05 20:26:54.284392+00
18	beedb	0001_initial	2020-12-05 20:26:54.439289+00
19	beedb	0002_auto_20200816_1659	2020-12-05 20:26:54.512517+00
20	beedb	0003_auto_20200816_2028	2020-12-05 20:26:54.682527+00
21	beedb	0004_auto_20200816_2032	2020-12-05 20:26:54.799462+00
22	beedb	0005_auto_20200816_2052	2020-12-05 20:26:54.823818+00
23	beedb	0006_auto_20200816_2055	2020-12-05 20:26:54.843584+00
24	beedb	0007_auto_20200816_2056	2020-12-05 20:26:54.860427+00
25	beedb	0008_auto_20200816_2058	2020-12-05 20:26:54.87688+00
26	sessions	0001_initial	2020-12-05 20:26:54.950793+00
27	beedb	0009_auto_20201205_1240	2020-12-05 20:32:12.251484+00
28	beedb	0010_auto_20201205_1241	2020-12-05 20:32:12.297248+00
29	beedb	0011_colony_status	2020-12-05 20:32:12.312581+00
30	beedb	0012_auto_20201208_1101	2020-12-08 00:37:08.85669+00
31	beedb	0013_auto_20201208_1105	2020-12-08 00:37:08.942434+00
32	beedb	0014_auto_20201208_1107	2020-12-08 00:37:08.964361+00
33	beedb	0015_apiary_beeknew	2020-12-08 00:37:08.987936+00
34	beedb	0016_auto_20201208_1712	2020-12-08 04:19:52.683959+00
35	beedb	0017_auto_20201208_1713	2020-12-08 04:19:52.719036+00
36	beedb	0018_remove_apiary_beekold	2020-12-08 04:19:52.748824+00
37	beedb	0019_apiary_beeknew1	2020-12-09 03:40:07.095862+00
38	beedb	0020_auto_20201209_1642	2020-12-09 03:44:03.346914+00
39	beedb	0021_auto_20201209_1644	2020-12-09 03:46:12.692882+00
40	beedb	0022_auto_20201210_1415	2020-12-10 01:18:44.167156+00
41	beedb	0023_auto_20201210_1659	2020-12-10 04:01:49.924136+00
42	beedb	0024_auto_20201212_1231	2020-12-12 03:30:04.222496+00
43	beedb	0025_auto_20201213_1055	2020-12-13 04:46:00.13119+00
44	beedb	0026_diary_completed	2020-12-13 04:46:00.469098+00
45	beedb	0027_auto_20201213_1230	2020-12-13 04:46:00.488197+00
46	beedb	0028_auto_20201213_1719	2020-12-13 04:46:00.530907+00
47	beedb	0029_auto_20210418_0930	2021-05-14 23:59:20.584388+00
48	beedb	0030_auto_20210515_1158	2021-05-14 23:59:20.659398+00
49	beedb	0030_auto_20210613_1115	2021-08-15 00:22:25.747507+00
50	beedb	0031_config	2021-08-15 00:22:26.114624+00
51	beedb	0032_colony_notes	2021-08-15 00:22:26.144233+00
52	beedb	0033_auto_20210815_1051	2021-08-15 00:22:26.175045+00
53	beedb	0034_auto_20210815_1113	2021-08-15 00:22:26.194186+00
54	beedb	0035_merge_20210815_1222	2021-08-15 00:22:26.20473+00
55	beedb	0035_message	2021-08-19 03:19:55.105077+00
56	beedb	0036_merge_0035_merge_20210815_1222_0035_message	2021-08-19 03:19:55.13116+00
57	beedb	0036_message_html	2021-10-30 02:47:46.142056+00
58	beedb	0037_merge_20211030_1547	2021-10-30 02:47:46.174362+00
59	beedb	0037_audit_colony1	2021-12-05 01:57:34.394454+00
60	beedb	0038_merge_0037_audit_colony1_0037_merge_20211030_1547	2021-12-05 01:57:34.420327+00
61	beedb	0038_auto_20211205_1554	2022-01-23 04:53:12.608857+00
62	beedb	0039_auto_20220114_1651	2022-01-23 04:53:12.823636+00
63	beedb	0040_merge_20220123_1752	2022-01-23 04:53:12.834381+00
64	beedb	0041_alter_profile_inspectperiodsummer	2022-01-23 04:53:12.858987+00
65	beedb	0040_auto_20220212_1534	2022-02-15 00:10:44.569288+00
66	beedb	0041_remove_profile_weeklysummary	2022-02-15 00:10:44.606479+00
67	beedb	0042_profile_commslstweeklyemail	2022-02-15 00:10:44.652232+00
68	beedb	0043_merge_20220215_1310	2022-02-15 00:10:44.683638+00
69	beedb	0044_alter_diary_duedt	2022-02-27 02:50:34.405055+00
70	beedb	0043_auto_20220321_1723	2022-03-23 01:53:37.365278+00
71	beedb	0044_alter_feedback_status	2022-03-23 01:53:37.395904+00
72	beedb	0045_alter_feedback_status	2022-03-23 01:53:37.422763+00
73	beedb	0046_merge_20220323_1453	2022-03-23 01:53:37.431401+00
74	beedb	0046_treatment_treatmenttype	2022-03-24 20:49:14.020522+00
75	beedb	0047_merge_20220325_0949	2022-03-24 20:49:14.028913+00
76	beedb	0047_auto_20220325_1700	2022-03-26 02:37:46.297355+00
77	beedb	0048_inspection_adddiary	2022-03-26 02:37:46.391571+00
78	beedb	0049_merge_20220326_1537	2022-03-26 02:37:46.402504+00
79	beedb	0049_sizechoice	2022-04-08 05:00:06.749866+00
80	beedb	0050_alter_sizechoice_text	2022-04-08 05:00:06.777522+00
81	beedb	0051_auto_20220402_1740	2022-04-08 05:00:06.823215+00
82	beedb	0052_alter_sizechoice_options	2022-04-08 05:00:06.832489+00
83	beedb	0053_auto_20220402_1814	2022-04-08 05:00:06.856008+00
84	beedb	0054_auto_20220403_1100	2022-04-08 05:00:06.879479+00
85	beedb	0055_inspection_size	2022-04-08 05:00:06.900117+00
86	beedb	0056_auto_20220408_1336	2022-04-08 05:00:06.921893+00
87	beedb	0057_merge_20220408_1659	2022-04-08 05:00:06.931196+00
88	beedb	0057_auto_20220408_1655	2022-10-15 21:39:38.671662+00
89	beedb	0058_merge_20221016_1039	2022-10-15 21:39:38.743979+00
90	beedb	0059_treatment_postvarroa_treatment_prevarroa_and_more	2022-11-01 22:26:05.897451+00
91	authtoken	0001_initial	2022-11-02 01:35:36.191212+00
92	authtoken	0002_auto_20160226_1747	2022-11-02 01:35:36.280714+00
93	authtoken	0003_tokenproxy	2022-11-02 01:35:36.292228+00
94	beedb	0058_inspection_addtreatment_treatment_postvarroa_and_more	2022-11-02 01:39:28.782456+00
95	beedb	0059_rename_treatment_treatment_treatmenttype	2022-11-02 01:39:28.893466+00
96	beedb	0060_alter_treatment_insertdt_alter_treatment_postvarroa_and_more	2022-11-02 01:39:28.965781+00
97	beedb	0061_alter_treatment_completed_alter_treatment_insertdt	2022-11-02 01:39:29.000981+00
98	beedb	0062_remove_inspection_adddiary_and_more	2022-11-02 01:39:29.022117+00
99	beedb	0063_rename_notes_treatment_trnotes	2022-11-02 01:39:29.03791+00
100	beedb	0064_merge_20221102_1435	2022-11-02 01:39:29.048729+00
101	beedb	0065_remove_treatment_notes_alter_treatment_postvarroa_and_more	2022-11-02 02:17:35.104298+00
102	mailer	0001_initial	2022-11-02 02:17:35.429438+00
103	mailer	0002_auto_20150720_1433	2022-11-02 02:17:35.441301+00
104	mailer	0003_messagelog_message_id	2022-11-02 02:17:35.449507+00
105	mailer	0004_auto_20190920_1512	2022-11-02 02:17:35.685554+00
106	mailer	0005_id_bigautofield	2022-11-02 02:17:35.997166+00
107	beedb	0066_alter_diary_duedt	2022-11-04 23:08:09.711914+00
108	beedb	0064_alter_diary_duedt	2022-11-16 03:33:06.925811+00
109	beedb	0065_audit_transfer_alter_diary_duedt	2022-11-16 03:33:07.308586+00
110	beedb	0067_merge_20221116_1632	2022-11-16 03:33:07.317167+00
111	beedb	0068_alter_diary_duedt	2022-11-18 04:09:58.807852+00
112	beedb	0066_alter_apiary_latitude_alter_apiary_longitude_and_more	2023-02-14 22:35:54.414605+00
113	beedb	0067_picture_alter_diary_duedt_delete_image	2023-02-14 22:35:54.686163+00
114	beedb	0069_merge_20230215_1135	2023-02-14 22:35:54.694256+00
115	beedb	0070_alter_diary_duedt	2023-04-09 00:16:10.613961+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
3j8gits335i2x7bbjwvbj4vc5ow4f214	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1km0X9:usl48zEDNmZ3Ml9-4Qgyk3Iz_kJXnVahvnElykLoO1Y	2020-12-20 20:21:27.955856+00
s46pwqvha4zcaumydtj6cwfn843pi6ix	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1km0cw:5NV5ji1NB3g9rT-5a6xlhnFc45pB-oaHA7nP4BknATg	2020-12-20 20:27:26.069985+00
44ienb1lchebeubsvbl9j94w6ocd3ays	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1km0kE:ksFkOuVF512LSuOYEOIqk6YDE5wHnMzE0oW2VYDX2Qg	2020-12-20 20:34:58.117796+00
5xp76034lrbx18ozmvcy4a3lfx5ub0q4	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1krA6R:uXrm4KDCX4171N4eF8PMlMNtO5BjcuJ6fO0-e_7mDDk	2021-01-04 01:35:11.213636+00
549gehc67scha4uqf4hxu5lg77szn28o	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1ktGm0:e6V05cxhEQ8Xu2hJW3lzaTvwtU0YmbzNp6mzIgsTAtQ	2021-01-09 21:06:48.392997+00
cq15zye1a8hjvfks2snku341ahe7kgbx	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1kwZ1x:Ia_cphkWGF614Ypw1v5LtE4GwV8hfWhO8dQW7Bc4vL8	2021-01-18 23:12:53.317016+00
m1zwbx7najntvetqhqlwmonohnzp4lqc	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1kzQwe:Z0q7KTfvz_-eAUwnmHzfBL3SzKO7igZkn4UXymcbQ74	2021-01-26 21:11:16.86938+00
p4ov2jhgtu0uwtxt6u9w34myr14dtzlt	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1l5iD4:UUqZ7Y5UcZw745XRvaKqW6wpuDiYEFrdVGV6Fn2HPnk	2021-02-13 04:50:10.190565+00
s9zakd1r3810x8q8435p0o7yb3a08lpp	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1l6Lur:JyVya9kSUBJzevIB0QZMtP4NJcB3OqI2_0OGNjhTgmE	2021-02-14 23:14:01.82281+00
296bswcmimipkqd3vw6pl97yfpayhm53	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lKrVE:U9tyGx-Vtbxilq4iDlxebM7vcKr3CbX1L8JzorVCh6U	2021-03-26 23:47:32.992422+00
r4en3c0l3o463g7583zgu1robfjall5h	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lQN64:T2ZEAHUfp6pQv_2Ea1-iiOBE-G93H5hOjJqu84MEPo4	2021-04-11 04:32:20.687384+00
0z27sz5nx9qm3d2903zifn83am3q9fch	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lXzNG:bzl2K4N6b9BpCtsquKvhqwnUtGLJhme52L6Ck_xzsGQ	2021-05-02 04:49:34.134432+00
yzast878mdluvmmzaa1ac5g6ybuegaqg	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lcb2L:VG-xMGWNLCn61tFE9Hscq6lXS9wRjUR8D_QavvMbd10	2021-05-14 21:51:01.168649+00
sqejypqef0jg669pl396h7b1ch4t7xgc	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lhhgy:2ZrjDK8MmppYpJO7_MQ6hWDZAwx3Im3SxtfJJ2qmDIw	2021-05-28 23:58:04.956239+00
nrsnvubspu2ga5v3f7sy99hujioinb3x	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lhjkE:mLjSr1sHHC12xfsxofRsKd6mLa0WBgqcZqw1W-zHxjs	2021-05-29 02:09:34.814136+00
hg3pyr86u66hqx65naojpusrjbr64q7h	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1lumNg:pPH78L61RZDLAYHm-j0aNaLD6NCIJeYp0kYozQYWqNM	2021-07-04 01:36:12.771033+00
g7torajee8hqfj3vxbq7t9nkkhbp4sc4	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1m9IZ2:MUyWS-ZTxsuIHjhFunGG2fVHtos0wcVtj7CgAk_Hj5U	2021-08-13 02:47:56.785286+00
v79ys0oq9jkr63fmggsthugklnh2f4pm	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1m9Jpi:dbC-IHuoZtQbqEYPsyGFHHbGlRf4GaqGhq7SWyJSnp8	2021-08-13 04:09:14.272488+00
4p6445ik3cphdkyyd2ihsaejc75vxftu	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1mA4cK:G_JAmplXqpdi-92Vh2EfDvglQOzJQLu-7n1FQhYMEKA	2021-08-15 06:06:32.443544+00
aqm4waewsivohkwsobt0uuwpep34twql	.eJxVjEEOwiAQRe_C2pBQYGBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwsziLSZx-t0jpkdsO-E7t1mXqbV3mKHdFHnTIa-f8vBzu30GlUb91KugjIE2sFKrois2qsNJosVBGAGud04VAM5EFj54gRjbeqgTGZPH-AOwQN_g:1mFm0W:V4ANSftA2Q2T3tZNGYhOTzS7EuZfbaM-JGM-VfkbKRg	2021-08-30 23:27:04.123524+00
czk10nahjkix6q6a7a12ul7b07kxkknq	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mIjlf:UE6zPUOTZJg-WXGm1_fZimZp_E9GvQvZTdKvFZvEzk8	2021-09-08 03:39:59.187858+00
f51at1t9x9pg12776cqgsvgy1kjk8sfb	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mRO2O:F8_fzE9XdU5qTT6XFGXgK6n5lSvvnWtWsYo8fKTNGkI	2021-10-02 00:17:00.20528+00
gb6bfnr6cfi219demociga8fi5nmd1px	.eJxVjMsOwiAQRf-FtSED5VFduu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mL8OL0u0VMD647oDvWW5Op1XWZo9wVedAup0b8vB7u30HBXr519uqcrdGkKQIC8jBizoNlZnTRA1ilveWkHKJ2I5ChISVUBqxHA0q8P_v9OA8:1mSrtt:_gsIpUKvcX0nmU6t76ejog1pnraramNSEbCnV04XQg4	2021-10-06 02:22:21.054772+00
gxjhze8r39de0g8yewavcl389tt9hnon	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mTwua:1LRlqMti7bECchUm5ymrOUU73pacxWKFRZRNDSEOVLs	2021-10-09 01:55:32.616593+00
4quvuief5cfvkbdjpnsnzv6w0uiliujc	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mZ27v:L7Gb4xa3xorouWPYfTDqlauiDNW4oftFxNEXeaN5kHA	2021-10-23 02:30:19.448682+00
9bvrk30i2zirqvsvmaie8wdcxce3g4d7	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mbsQS:XXr9z35W7YOiKexfy-E5UduN221BswIJyvswVz9OzWo	2021-10-30 22:45:12.56699+00
ue6f47754n0u3rel3hago5u3qq5cyedy	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mfRb9:nonOaIGq0tXdeNx9rG5cVTTmdY4doTqTSYzwwlW-ho8	2021-11-09 18:54:59.029034+00
ql2hxvvjgcg6fdj6q0m51klcs9u0uxny	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mjCG5:LglV04-bcgJdTDP8CQTUqZ3ojmPNy71CHN7Q4INNNK4	2021-11-20 03:20:45.772+00
yhq9fkp5bisgx84piyec3oiiiwhah8bw	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mn7dK:tDV12nzKqXlDTySZ8QCaIa2M43ncPJ0FdhYVrzk_J2s	2021-11-30 23:12:58.061137+00
vren4j63c111r7aljoczl9zfaxkxntbn	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1msCma:4Wc-VcWN8P6camhGcX5Dg_g8uEmc7zBDd99bcaZwIm4	2021-12-14 23:43:32.20615+00
kg26roawv29vnbfxl2cfe6ceckehdl48	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1mvomv:nQe7nVcdxRZhNr_sycukvfyVsf79h0uPa6IjRcewlvI	2021-12-24 22:54:49.34924+00
o2vh2tfw39wzzo4ivoektuettuylcpxb	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1n0WPF:3z46gnTYOZwLqTD9wbkooZ6WOy5Jv6cX_OesNceKumk	2022-01-06 22:17:49.072578+00
7x8lal4iholil7e8z4nseqyp36iry4tr	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1n6KGC:kJgcS2QWeUmQeQsIdLer1L0mGHnHu-l31HdnUDwejc0	2022-01-22 22:32:28.306345+00
mifn1n711f2estutkoyaiqebvondc3mz	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1n6L5t:amHqbSb2FzTEPsUs5tUpv7dtpNOG-bd-N6ZFRx9Md6s	2022-01-22 23:25:53.681285+00
o7jsre39vb5hyn4v18a1y07qjwdf2z8w	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nBUsd:JstfBN9zeHMskv4Bv4jAim_PYOyvChd5bagzy86jzNA	2022-02-06 04:53:31.367363+00
1z2sndbiyiw6zfp5mjjvyuuaiumtynp9	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nCV2E:q9vwwNs0MUoUtIkdyJMQ5_mEzELNE9kHZBb7Jm32OUs	2022-02-08 23:15:34.193922+00
yvka6o8gbcl6i0eqtskmashkejk90ili	.eJxVjMsOwiAQRf-FtSED5VFduu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mL8OL0u0VMD647oDvWW5Op1XWZo9wVedAup0b8vB7u30HBXr519uqcrdGkKQIC8jBizoNlZnTRA1ilveWkHKJ2I5ChISVUBqxHA0q8P_v9OA8:1nDd99:UZFfsAAPF3Rdcc0h-ULR9fhl4MDekodm4vlp8GRS0Wk	2022-02-12 02:07:23.30258+00
8zxlylfzjgduukaan5oxph9n6vkhnich	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nHZTC:QaQWT6_ImYJiwSkAAamjKMmx_MWu3RNm2xOeF8BYn9M	2022-02-22 23:00:22.615148+00
4tcxw22oii1x9hz8rz3tlaye2spcaw2z	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nHbs1:tyOrAb8GT84jQlr8rwHlzBu03ACywV2xm1urLXdmzmA	2022-02-23 01:34:09.315306+00
46t9iwvybb49lw69kvekf4igw0y1md45	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nNkpH:CxtC8mcNEeuFT296TnCgd4kVXWDfIjiwcm3FndBcZNU	2022-03-12 00:20:43.890183+00
761p1q0nz3qusul1vi5z8qbm8r177mqe	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nO9ex:s8fTU_drY3NYf7kDaw49ai_KA0KkTkU-i8KB2cDc-_o	2022-03-13 02:51:43.55542+00
zlpwb2szdn8is4euwgmapkd2cvhzmlim	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nUhVl:bMFX2dBdOayppnirz3tv3pxhJKpx6iCwDvlmxxX4wK4	2022-03-31 04:13:17.334267+00
8zphs2x3vuh7a32l2b0d3n8pepg3ul7f	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nVGaK:YYPxW0jqDLnJPJ-c8JiF-B85uVMrYl_IyA356QjZeFA	2022-04-01 17:40:20.104267+00
l8ie448exdv2nnw8e2zpkm1dgqhf8hn1	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nXDyg:z80p05GCL1LMm8anTbfvABsmlIMNNYZBwGFgkRoFL78	2022-04-07 03:17:34.181218+00
g43s7exy7o2zwa0ol3hhg4rvuringxv7	.eJxVjMsOwiAQRf-FtSED5VFduu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mL8OL0u0VMD647oDvWW5Op1XWZo9wVedAup0b8vB7u30HBXr519uqcrdGkKQIC8jBizoNlZnTRA1ilveWkHKJ2I5ChISVUBqxHA0q8P_v9OA8:1nYLZf:kdhn4elKCBR35Kwf4kd9Vr1J3sHxiiN-LaYB0IJBGEg	2022-04-10 05:36:23.924679+00
f2skatc0wiabw2agxj3uct4bd1o39g9z	.eJxVjDsOwjAQBe_iGln-reNQ0nMGy7te4wBypDipEHeHSCmgfTPzXiKmba1x67zEKYuzCOL0u2GiB7cd5Htqt1nS3NZlQrkr8qBdXufMz8vh_h3U1Ou3pqK0UXmAEorWxgZylMCQ8gzkdQAAbwMOZL2m0bIjLI7LiNmx14ji_QHYYTgF:1nbrHm:IxmPjIa0OwUCFRNeGxbpoNTA5M2lGf6t5vFs17LHUFA	2022-04-19 22:04:26.352429+00
x5i596zkkiy7s6cxzd090n9h9os8pgtq	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1ncgfc:nGhEdhGvGOABq5fyc76mf-3Qwcpqw7xHnnuC07Clbp8	2022-04-22 04:56:28.964114+00
cbouvqtn60npjmxtdhfftlr9qydjn5t7	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nkbPr:clGI18c84WeRHO2VF7L_Mu9S4CopmUhIpWASWFsg2G4	2022-05-14 00:56:55.388329+00
wl2o4wkkn1zgs99f2e0rp8nyx4ahsvcd	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nsXbV:k8wBCZEoPwdrAV1qasnH8fdoLJDsvYbdx1sLkuapTgg	2022-06-04 22:29:45.807481+00
q1pxzikx2hvwj6fk3ck4k5infpkxk7zr	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nuV5D:Oci0XAGiEztjHvIvBbk8x_dXBvRWU9L0kKXxu5AsIg0	2022-06-10 08:12:31.873499+00
xmd2ovnv7ap38ulrh75tki13uvsjh7pm	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1pCNwl:KylfFDy69EvGSGhhVfnRV3-LM9iG7A70aAJgVw7bqjI	2023-01-16 16:45:59.255598+00
2bdrcmsscsijqp70rp090t4og1yqe2vy	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1nz6hy:yJWiIP5l0WHUiy1WbK2JcZv4R-86f-BTtk3Iv3c8XWM	2022-06-23 01:11:34.755874+00
valx2553h9b9chjzvn81x956hghvaysl	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1o1EnK:WMwZeVrOjK4oepAnHIhtFAN1G8iE8SkbCvz4n-48-rk	2022-06-28 22:13:54.61783+00
hs7jf7ew4aar94gsbo02vk44c84ceyhv	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1o7muR:MctgwiwnfjHP3t54MranE7nfV4PClUSQKlV5THuLHzI	2022-07-16 23:52:19.605154+00
ycknfxthxvu63033b69f936th4cw9nxz	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1oHa4i:y1pQnIHZhTOh-yvtreleL3sTHZLsAt4wTu4tbjreSIA	2022-08-13 00:11:24.579058+00
fe223gde7wzj5eflzku3ns1579y2idsw	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1oHr0O:9eBi6k7YwSLfV-5ZyTpcw-ZFAl1QKMzGvkWpE_iOdck	2022-08-13 18:16:04.543562+00
sxhjfurlcn60r3ktcu5t5iazdp300mku	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1oPBCN:ycKcRdyZxDGgzBozI3XTsb172HX9EkzpM38ef5loG5Y	2022-09-02 23:14:43.441345+00
wqn5gq4d14ob5wea0fpmsudtfhtndgbm	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1oPC5m:pEDsqCQjkf1s0wJi6uiTkbdBINpXlrGoBve4No5VkSU	2022-09-03 00:11:58.376306+00
5691w497h61bnauqowcyuzem393qd327	.eJxVjEEOwiAQRe_C2pBSKB1cuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uz6tXpd0tID6k74DvW26xprusyJb0r-qBNX2eW5-Vw_w4KtvKtLYZuCOyld5AtSUgu2ZEcQ04A4DIg2-wCWk-jHwCDCWxZxBtyvjPq_QHrhTf3:1oUv0B:EiV3LvHmxV851dr18fgBFIX8EfdYSi3UUYaPFNJyC_I	2022-09-18 19:09:51.470895+00
srd2ra7rkn7xnvxy2sb5p6stni9lts5k	.eJxVjMsOwiAQRf-FtSED5VFduu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mL8OL0u0VMD647oDvWW5Op1XWZo9wVedAup0b8vB7u30HBXr519uqcrdGkKQIC8jBizoNlZnTRA1ilveWkHKJ2I5ChISVUBqxHA0q8P_v9OA8:1oW8j9:mIm_z5mzz0XXiDtaJ3EIVZVuciLG9mrDBBXgt1K3KH4	2022-09-22 04:01:19.087504+00
53nw1vdr3xw3kzjmrg3y7n9ehqvi2qnn	.eJxVjEEOwiAQRe_C2pABWygu3XsGMgyDVA1NSrsy3l1IutC__O_lvYXHfct-r7z6OYqL0OL0-wWkJ5cO4gPLfZG0lG2dg-yKPGiVtyXy63q4f4GMNfdsaq41hgbN7gzgzAhxUmwHmJwKQMoy4UiU0Da3DTiGmBJoUoat-HwB7V843g:1oZMl8:Z20Om51lRcpvV3FH6KxTsjdgGn3djmDCSS2EU9fn4N8	2022-10-01 01:36:42.078408+00
zgv59xjshs72w5lliblkkejhafaaey4n	.eJxVjEEOwiAQRe_C2pABWygu3XsGMgyDVA1NSrsy3l1IutC__O_lvYXHfct-r7z6OYqL0OL0-wWkJ5cO4gPLfZG0lG2dg-yKPGiVtyXy63q4f4GMNfdsaq41hgbN7gzgzAhxUmwHmJwKQMoy4UiU0Da3DTiGmBJoUoat-HwB7V843g:1od36x:r8BWcOIarPjK7Pptc4TaEIdgac23aMyShZh31J1yRDQ	2022-10-11 05:26:27.644806+00
dephql9abthembscc93rg6rjf6k3ajfh	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1ojldX:2TTF57N6aYa9WHSQIhM4924eLu6wa7OFQyizr_6BAIY	2022-10-29 18:11:51.79044+00
lxneh1rfzkkjyrknnq8q0sj55p28jczu	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1ojlw3:DSmtovVWRe6ePyuTKP-YPED4TsusAPhzezQXPjmxeFc	2022-10-29 18:30:59.435598+00
6ss0gs0ykfc98itsquacf52cqfvqvmkh	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1ophmY:RcebkjbpCy_O1KUw-YnTqxbZg4pNrgTmzfY_E9NWUjg	2022-11-15 03:17:42.572005+00
dv54qph8xryr37thns10faorgm41tb0s	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1or5xt:-3VFGWpni_O1b0pV9W9jzsEU-pgiuLc5QZL3U4iuwiA	2022-11-18 23:19:09.126731+00
cogehz0js6mfh8fyy6oxi6j88iw43sdb	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1or6iA:sD4US_JvVdeHbGbrm9rd8EqhjPcEBblHT-eDqfJmSBI	2022-11-19 00:06:58.217505+00
64dittuoewdsh38s8zbk5rqoh69v2dc4	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1osvtO:Zs29JECW-zswRBf8WNBbo0r3FBVJOxRbzaem25PP82E	2022-11-24 00:58:06.36574+00
r8wx4exbpjgmld6f5nr3nf83b6akvk5g	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1owCjH:D9Wt1UEdrXuvRGQdAxXYrB0l6yoFoLK_VI8R-HQEguQ	2022-12-03 01:33:11.84507+00
qmorc7h1uhlmg3jatp69b0dknd55ib2i	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1oz40i:upvzYPraP9jG_GE5-rkLxD1FZnEINcXNXiG1nG4AiiQ	2022-12-10 22:51:00.920558+00
fam90vsxzx81rxob5l91k5m39gqcgtd8	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1p59eZ:KFMc3aqI5VbyrpIyQnkI4bEpz1JRgUNWsZQ6GK8aPfs	2022-12-27 18:05:19.078238+00
rhx0h2p7qgrayq0kfqtn2i8yoczbrcy6	.eJxVjEEOgjAQRe_StWloGUrr0r1naGaYGYsaSCisjHdXEha6_e-9_zIZt7XkrcqSRzZn4xpz-h0Jh4dMO-E7TrfZDvO0LiPZXbEHrfY6szwvh_t3ULCWb009JOiGJJjEBUqxCb0iYJAukgQkbDUSguNWgT0oN855BfLcg3o27w8a1zjD:1p8erK:_bT0k_Ayp_q9BV2eVU5lLGpjuO8b2bZILTu1bBa3U1U	2023-01-06 10:00:58.543614+00
b1d1mvbyh0xxchy26url1h00tul84z3r	.eJxVjEEOgjAQRe_StWloGUrr0r1naGaYGYsaSCisjHdXEha6_e-9_zIZt7XkrcqSRzZn4xpz-h0Jh4dMO-E7TrfZDvO0LiPZXbEHrfY6szwvh_t3ULCWb009JOiGJJjEBUqxCb0iYJAukgQkbDUSguNWgT0oN855BfLcg3o27w8a1zjD:1p8fF9:CmUHRFSvgcsIj7nQZyKZv8G3GTublGloOYR_54oHNHw	2023-01-06 10:25:35.620987+00
f1fn8ztnij82fwy0gzsotr2j7zzkdtyg	.eJxVjEEOgjAQRe_StWloGUrr0r1naGaYGYsaSCisjHdXEha6_e-9_zIZt7XkrcqSRzZn4xpz-h0Jh4dMO-E7TrfZDvO0LiPZXbEHrfY6szwvh_t3ULCWb009JOiGJJjEBUqxCb0iYJAukgQkbDUSguNWgT0oN855BfLcg3o27w8a1zjD:1p8fGT:wYI3PeCw1qEy82OL78H6OntuLotQSQpWs5zlhMEzHRI	2023-01-06 10:26:57.137494+00
dvmfpxo5rcspk6cztmpvuq8rwknw0892	.eJxVjMsOwiAQRf-FtSFAecy4dO83EBhAqgaS0q6M_65NutDtPefcF_NhW6vfRl78nNiZSclOv2MM9MhtJ-ke2q1z6m1d5sh3hR908GtP-Xk53L-DGkb91rbkYJIVJC0kEFhiVE6i1mBCntDJCGAMTohFocogChWiCM5IpTQa9v4A_H43bg:1p8nZQ:__KyY9pWboAQmDfhRrlCxFyDEP7X5ZcKo2F3bsWG0RY	2023-01-06 19:19:04.428919+00
67x4l4n5so5vbfcirfe1oqb1pvegfop1	.eJxVjEEOwiAQRe_C2hCBoYBL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIJ06_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir9_aBEjF52xRDw7ozMCajFIQAL31iopmGNCZpI2lEJTRhSEnBOedKUq8P9t-N34:1pEyZ2:NUw6B9F7qDgc-BXK00-my1A8BNnX3x0QYR-Lfq4f_L0	2023-01-23 20:16:12.911054+00
o7syer067kit32hyh1uxksauosa5rhe1	.eJxVjM0OwiAQhN-FsyHA8iMevfsMZGFBqoYmpT0Z312a9KCnycw3M28WcFtr2HpewkTswhQ7_WYR0zO3HdAD233maW7rMkW-V_hBO7_NlF_Xo_t3ULHXsfaatMECKp-xWAfeAQlhkonaSytBW2VBovdSiuF1Fq44SwkTEA1lny-5DDcP:1pIbhG:MeB0R4HKBMmgbJ7xSBuONDM2RBA3dJlzC10HWnyikC8	2023-02-02 20:39:42.788092+00
z7avaeqi4gza4ic8ez3u89gfuvrzckxj	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pNm99:5ki7XpIu-LBO9z-X6FY62L_HQ93wF6ZjA84xFE35r_Q	2023-02-17 02:49:51.765953+00
dz1z9e5k7p3gn29nre8rjlo9t6tp1kbb	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pNmAK:NZ66QAERnCXpkuwQYoi1Dt9aZreQl7kRCzOBY3lCJt4	2023-02-17 02:51:04.389974+00
n8r2muuvrwzobmpv6x7f5w4wuc75deh2	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pUbSe:b-t5mKm8YqNqMZdvZ60diUQUz_DVbNWfcpxTiW1yZ8s	2023-03-07 22:50:12.195708+00
7bi09e1gt4i0fz5ga6gq0prwlpdfzqz7	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pV58V:iEyRcHIOWFjkT7QeY_vJd7K6mXZG4PP9FurxiQiBYFA	2023-03-09 06:31:23.155654+00
r61zhy3zl5hcba1qwdvluagcgjspjh8r	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pZJ9m:tenELBERr2jSPVzbnZov70cFBbKWCxBuJc_dlyxc8Hg	2023-03-20 22:18:10.718204+00
7ajr7ifli2pdjqh80adj8xuu4xu2491e	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pdeck:W676-vyWE6VHXgMvihvPRljrpWu-_o2sOs0RLEL6RMM	2023-04-01 22:02:02.586982+00
4u55r2eo3j9sf7lskxup5djh9cuny8kr	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pdfi6:tVAgJtUQqEoXFsfHrVCvzOIhnwOQsqnbkYb2PAhfyA8	2023-04-01 23:11:38.416748+00
ccjkx7qsx8acgo7urlohys6taet0xm0l	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1plIZl:pQJ2ujRZgNrglKMQpwJUVxNWRu1jYKoVi35-2836WZY	2023-04-23 00:06:33.621937+00
789ng7ndezdmqmynr1z2bfymrlz4ecpe	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pleKr:SzQa7ofFD6dQAlUZ52enQNXCJpva_Og6rBTsrgyQLWw	2023-04-23 23:20:37.680864+00
f7qnasu29vr0ij7efbrc72mgejxia0ik	.eJxVjMEOgjAQBf-lZ9MsVFbq0bvf0LzuroIamlA4Gf_dkHDQ68xk3i5hXYa0VpvTqO7sTu7wyzLkadMm9IHpXryUaZnH7LfE77b6a1F7Xfb2bzCgDtu2azsEKIJAGsKRb43EVns1JUQK1Ahb7jlbZiIWBkUAPceoEs19vv3tOLA:1pqhwE:796lJ6ZSr2Oe6v3d-TytRrLYJACEhQSVIftwpYU1S5s	2023-05-07 22:12:06.753493+00
k1iuz2xcmwmp2lkjx3w3ro8vxomuyznw	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pssU5:pZJRhts9wB4_AXZVGDNJa5LAM8_TOWYSpmn5OXltXMk	2023-05-13 21:52:01.932302+00
81fl1wmid8ntovgptzfcwrfxlgx3hj2x	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pv5pP:j5Tk5kyn4ywZYws04YMPHCpJZygo0gOAmy9xQUcaFxk	2023-05-20 00:31:11.426703+00
75z94gzv1aiyco3qffin4v0vmexnt7nc	.eJxVjMEOgjAQBf-lZ9MsVFbq0bvf0LzuroIamlA4Gf_dkHDQ68xk3i5hXYa0VpvTqO7sTu7wyzLkadMm9IHpXryUaZnH7LfE77b6a1F7Xfb2bzCgDtu2azsEKIJAGsKRb43EVns1JUQK1Ahb7jlbZiIWBkUAPceoEs19vv3tOLA:1pxKtl:QIsEGDEt2cCKbvQBrI-TfUSSq56kXsCirvT4uwG32eE	2023-05-26 05:00:57.435646+00
ccoo9yzg39yqgc87gid31q694vkkzhvs	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1pxxMg:SVzJLzkS0gcLPVTmZUPhUUM5jyAJWeaB8jo0nbOUkDg	2023-05-27 22:05:22.253297+00
u3q3rvlt0ux620va6t2suoyj1d6x0vyb	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1q4A19:v9WrOSG2V_s3-XPuzRzVAwQ0Y5C7TYJOJxQBTA9aT6Q	2023-06-14 00:48:47.756645+00
t271mah4jyj8z7kwf9jo1jwdtoxn3shy	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1q9HBJ:s5wM6JgFtyzMP-PwjpomSdO3XQlULgv_kp3RueYsR48	2023-06-28 03:28:25.421253+00
qabgdbb1ncdoph1ldm0f7tjyjs7rz8r7	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qKTVA:Pf0HRk3cZK5Dw_EEj3O-ZF0BwmtP38CCitmIRLSO3q8	2023-07-29 00:51:12.252251+00
m136fiw2l10okifhejh6l24tgknvndkv	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qQ1jl:DpDFc09LdBDRlygwd9PwpVuDHiUdrn2S478ChIXZjxo	2023-08-13 08:25:13.919527+00
pgc5h80rk14qqgd7hm320gmnbe7hjpvu	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qVKn3:kDwWxaszVXH13krqesWx0o4KhZ83raoVeyNYjlgQZr8	2023-08-27 23:46:33.517312+00
dm6y8lq5n76isai3kw87nlajxev7vaul	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qWqYY:WaM6Il_li4XBGsETTrEf0ZuReBLGxhVNrQizMnDfSXE	2023-09-01 03:53:50.380618+00
kf6knhybqf4a9qwvgjlz049fdi6derc4	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qXYzM:UxgccA37lR6Umvq6wMH-F149bguUaihJ3pm_MqbMQdE	2023-09-03 03:20:28.064771+00
fncapr3b1wsevetiqltvtzksszd1pasy	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qdezy:gsD3MH1MFY3jsg9WQ8R4oyKDuUMwNFPVixZRZOlitjM	2023-09-19 22:58:18.352228+00
scz22mx429bjhozsza53pev78fljulb6	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qepFe:xqo-h11gtiODQ7570S4-_4CYkDm96vJnYi0jawAXOPc	2023-09-23 04:07:18.457029+00
sk2kbib7dnytziszn6rlxpo34e39795m	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qm6nZ:Cog-v3Jr4i4DUQTx_cnen0qS1dUFrSCnfwd-n9xHAn0	2023-10-13 06:16:25.973882+00
k19lrhg8jln8af06jpu70wer6nabe9yw	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qtyX2:O9sQA_A075PD8_eGYQxOv3ZCFKKAN_pj0f-_FJsJw0U	2023-11-03 23:03:52.355245+00
9fq5vtav5blxm8n9llsecdima6fwqgk3	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1qvQYZ:hYghNi055l5GODKnr0nRwpLjL-ogHYOm6UooOCGyM5A	2023-11-07 23:11:27.618486+00
v8g2szueyl9l318o5m4420db2ll6dick	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1r1ZaG:AuGGFoD5ugwzHwEII98cipyYVEaWzUbmpGZ4DgshUQA	2023-11-24 22:02:36.949299+00
usqnbnxf2wn1t48s5lqmhg5a6lht0831	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1r1ezZ:qrs4Dxgowj7Y4Q7ft1Erz4L-hca3WiSE0J08Eq9kc8U	2023-11-25 03:49:05.297996+00
568ss0hbc263zl3441kmq350d7e0774x	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rEcIk:pgOrMrB0zrQXSTksh-9J-P4G8-wL8EyYtnvvyG-pCVY	2023-12-30 21:34:26.952884+00
r22x5xcm8atqcqp653bkotvk4gmi70lq	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rEdWw:7k7X-CweI6cWgMXKP6IOHtvLELiecxu10w6Bzt5yMkY	2023-12-30 22:53:10.166966+00
yj6hl48x3ha05xs4ol8ss3kv3rx68s2g	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rLVWS:cgGjhi0JWLYn8YZGxoA-5TVHnPgr20c6ZehNmJlHaig	2024-01-18 21:45:04.749358+00
0gqhpd1w4u6odsa86vuc0mbjkss6gvd3	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rMEg0:xqIIx--OzQZbzXFsW60jWLzjVOS5NZhNjryM2LdN5cw	2024-01-20 21:57:56.672968+00
35bpsmxbiian4peblyabr56tsod8qmr0	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rRdTm:KUu0NOZnfezrLypXnrty9X-c7Q7gxfvgLlH7eTXEI5E	2024-02-04 19:27:38.512867+00
v1jrv94zosqvd58uewsmikmaf1pyptqn	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rWP3I:0RmjkJ1qpt6S_oH95w9nBtjQhYBLXMaoq5jaDJ015Mc	2024-02-17 23:04:00.229386+00
rag7hfojvdlv2e2z3b0ii0iw33twxfag	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rX8Kn:eokbDzRrh_F4qiCutyDB7MLJRqY2mr367bbcsQ9LiUg	2024-02-19 23:25:05.068739+00
u6kwqgx5rj1p2galdi8ieix4z5p2r24o	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rgBLK:LHFH3ISm4CGMW96QCSY6BYav0lFMW37vxG_RxV3jEXo	2024-03-15 22:27:02.463095+00
yye0wgfg30fylu4unt0chqv8700l6tn8	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rgCWU:waqUIP78K5AQj0Vgc1mjvsnM-E-40wZ8U3mKVKt7cKk	2024-03-15 23:42:38.614826+00
otbzpyk9zrzcr8h6da54m4oji1241pc4	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rlIWL:T-9faojQJkUDx89ysCVB3WnHM_6RlvL2fnEStYImUPg	2024-03-30 01:07:33.667571+00
rgtt9u3af8llb2t93q2pfjd49ekt463n	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rqjFf:71TMcD4WPaeo9_o_6Hjd_vnI4M8WYDXs9CD4SUphYAQ	2024-04-14 00:40:47.50007+00
t6jj9a1ky7c9hxmm0to2t5s9mia6dal8	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rtwhH:HYGlh9N-816966hjEJRpI2cYJV1u0zKtjjV5h6ASEWU	2024-04-22 21:38:35.293647+00
n9ih79tt2gtzk0c7dr7ri2m08gemint2	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1rvQKo:oBqpDZ1TR4GMCp2O5kzGqguRuHQEL7ZL6TbuCId6J-g	2024-04-26 23:29:30.910363+00
sampsj930hce8eljmq6joy7etylh1hzp	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1s0VaA:o6cXwBBdpPFlaRICPitVmijQSwjA3i7OqcxB-doEdwM	2024-05-11 00:06:22.762386+00
mwhd9r0gtlbcvv6gpgiqg7ulwklj14hb	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1s1IyG:a0VSSEVMMo98To3ep7ZAOP9mrQ-q3CpTgsEcVpGcric	2024-05-13 04:50:32.996601+00
nzhdrvwnl2t1qu7ehw75evc3qp819g7y	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1s86W7:DQ2exNwjydxUbxNdZCttS9hvN4NOwo_xJY0e75y5hPs	2024-05-31 22:57:35.267077+00
70o7c7sgvci1c989vsdpa3w1v20n0hmr	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1s88E7:m-m8o4tQsOOMSuEwFC1s2EKxZZMHV_r9HqXWL1nJ9A8	2024-06-01 00:47:07.15137+00
n2f58t0ckbqt124bs1rrtm2po9sv94ng	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1sII5h:PMkTXuy4dJUEAGGb99qVVn5lM3zMvKmqhnML9s-8NKQ	2024-06-29 01:20:25.839439+00
01usixqjw6fc8mp40rra1czpqr91ve4q	.eJxVjEsOgkAQBe8yazOBpufn0r1nmHTTrYMaSBhYGe8uJCx0-6rqvU2mdSl5rTrnQczZgDn9bkz9U8cdyIPG-2T7aVzmge2u2INWe51EX5fD_TsoVMtWUxdSougaZgFU7xxTE7xnTAIbUAdArbobR8CkbQcUQ4gBgzAiivl8AdYPN1Q:1sIJWa:7NS85KEIdNKQktm9MV3ag-T91eRqDfngAtuEllsK4_A	2024-06-29 02:52:16.480746+00
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

SELECT pg_catalog.setval('public.auth_user_id_seq', 11, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: beedb_apiary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_apiary_id_seq', 9, true);


--
-- Name: beedb_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_audit_id_seq', 58, true);


--
-- Name: beedb_colony_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_colony_id_seq', 47, true);


--
-- Name: beedb_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_config_id_seq', 3, true);


--
-- Name: beedb_diary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_diary_id_seq', 57, true);


--
-- Name: beedb_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_feedback_id_seq', 2, true);


--
-- Name: beedb_inspection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_inspection_id_seq', 528, true);


--
-- Name: beedb_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_message_id_seq', 300, true);


--
-- Name: beedb_picture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_picture_id_seq', 2, true);


--
-- Name: beedb_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_profile_id_seq', 11, true);


--
-- Name: beedb_sizechoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_sizechoice_id_seq', 60, true);


--
-- Name: beedb_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_transfer_id_seq', 42, true);


--
-- Name: beedb_treatment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_treatment_id_seq', 43, true);


--
-- Name: beedb_treatmenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beedb_treatmenttype_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 259, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 115, true);


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
-- Name: beedb_treatment beedb_treatment_colony_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT beedb_treatment_colony_id_fkey FOREIGN KEY (colony_id) REFERENCES public.beedb_colony(id) ON DELETE CASCADE;


--
-- Name: beedb_treatment beedb_treatment_inspection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT beedb_treatment_inspection_id_fkey FOREIGN KEY (inspection_id) REFERENCES public.beedb_inspection(id) ON DELETE SET NULL;


--
-- Name: beedb_treatment beedb_treatment_treatmentType_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beedb_treatment
    ADD CONSTRAINT "beedb_treatment_treatmentType_id_fkey" FOREIGN KEY ("treatmentType_id") REFERENCES public.beedb_treatmenttype(id) ON DELETE CASCADE;


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

