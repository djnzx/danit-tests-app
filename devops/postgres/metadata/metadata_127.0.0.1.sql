--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    a_id integer NOT NULL,
    a_user integer,
    a_number integer
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_a_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_a_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_a_id_seq OWNER TO postgres;

--
-- Name: account_a_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_a_id_seq OWNED BY public.account.a_id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    ad_id integer NOT NULL,
    ad_name character varying(128)
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_ad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_ad_id_seq OWNER TO postgres;

--
-- Name: address_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_ad_id_seq OWNED BY public.address.ad_id;


--
-- Name: answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer (
    a_id integer NOT NULL,
    a_question_id integer,
    a_text character varying(512),
    a_type integer DEFAULT 0
);


ALTER TABLE public.answer OWNER TO postgres;

--
-- Name: answers_a_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answers_a_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_a_id_seq OWNER TO postgres;

--
-- Name: answers_a_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answers_a_id_seq OWNED BY public.answer.a_id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    g_id integer NOT NULL,
    g_name character varying(32)
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- Name: manymany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manymany (
    mm_id integer NOT NULL,
    mm_user integer,
    mm_addr integer
);


ALTER TABLE public.manymany OWNER TO postgres;

--
-- Name: manymanay_mm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manymanay_mm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manymanay_mm_id_seq OWNER TO postgres;

--
-- Name: manymanay_mm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manymanay_mm_id_seq OWNED BY public.manymany.mm_id;


--
-- Name: one; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.one (
    o_id integer,
    o_name character varying(10)
);


ALTER TABLE public.one OWNER TO postgres;

--
-- Name: process_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.process_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.process_p_id_seq OWNER TO postgres;

--
-- Name: process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.process (
    p_id integer DEFAULT nextval('public.process_p_id_seq'::regclass) NOT NULL,
    p_user integer,
    p_date timestamp with time zone DEFAULT now(),
    p_question integer,
    p_answer integer
);


ALTER TABLE public.process OWNER TO postgres;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    q_id integer NOT NULL,
    q_number character varying(4),
    q_text character varying(2048),
    q_date_add timestamp with time zone DEFAULT now(),
    q_header character varying(256)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: questions_q_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_q_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_q_id_seq OWNER TO postgres;

--
-- Name: questions_q_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_q_id_seq OWNED BY public.question.q_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    r_id integer NOT NULL,
    r_name character varying(32)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_r_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_r_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_r_id_seq OWNER TO postgres;

--
-- Name: role_r_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_r_id_seq OWNED BY public.role.r_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    u_name character varying(64),
    u_regdate timestamp without time zone DEFAULT now(),
    u_login character varying(32),
    u_passwd character varying(256),
    u_group integer,
    u_role integer DEFAULT 1,
    u_e1 integer,
    u_e2 integer,
    u_e3 character varying(128),
    u_p4 character varying(128)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_u_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_u_id_seq OWNER TO postgres;

--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: account a_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN a_id SET DEFAULT nextval('public.account_a_id_seq'::regclass);


--
-- Name: address ad_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN ad_id SET DEFAULT nextval('public.address_ad_id_seq'::regclass);


--
-- Name: answer a_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer ALTER COLUMN a_id SET DEFAULT nextval('public.answers_a_id_seq'::regclass);


--
-- Name: manymany mm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manymany ALTER COLUMN mm_id SET DEFAULT nextval('public.manymanay_mm_id_seq'::regclass);


--
-- Name: question q_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN q_id SET DEFAULT nextval('public.questions_q_id_seq'::regclass);


--
-- Name: role r_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN r_id SET DEFAULT nextval('public.role_r_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (a_id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (ad_id);


--
-- Name: answer answers_a_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answers_a_id_pk PRIMARY KEY (a_id);


--
-- Name: group groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT groups_pkey PRIMARY KEY (g_id);


--
-- Name: manymany manymany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manymany
    ADD CONSTRAINT manymany_pkey PRIMARY KEY (mm_id);


--
-- Name: process process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.process
    ADD CONSTRAINT process_pkey PRIMARY KEY (p_id);


--
-- Name: question questions_q_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT questions_q_id_pk PRIMARY KEY (q_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (r_id);


--
-- Name: users users_u_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_u_id_pk PRIMARY KEY (u_id);


--
-- Name: manymany manymany_address_ad_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manymany
    ADD CONSTRAINT manymany_address_ad_id_fk FOREIGN KEY (mm_addr) REFERENCES public.address(ad_id);


--
-- Name: manymany manymany_users_u_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manymany
    ADD CONSTRAINT manymany_users_u_id_fk FOREIGN KEY (mm_user) REFERENCES public.users(u_id);


--
-- PostgreSQL database dump complete
--

