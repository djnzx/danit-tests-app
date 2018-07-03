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
-- Name: groups_g_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_g_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_g_id_seq OWNER TO postgres;

--
-- Name: groups_g_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_g_id_seq OWNED BY public."group".g_id;


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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    u_name character varying(64),
    u_regdate timestamp without time zone DEFAULT now(),
    u_login character varying(32),
    u_passwd character varying(256),
    u_group integer
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
-- Name: answer a_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer ALTER COLUMN a_id SET DEFAULT nextval('public.answers_a_id_seq'::regclass);


--
-- Name: group g_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group" ALTER COLUMN g_id SET DEFAULT nextval('public.groups_g_id_seq'::regclass);


--
-- Name: question q_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN q_id SET DEFAULT nextval('public.questions_q_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2599, 650, 'A', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2600, 650, 'B', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2601, 650, 'AB', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2602, 650, 'ничего', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2603, 651, '12345678910', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2604, 651, '1234567890', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2605, 651, '01234567890', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2606, 651, '0123456789', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2607, 652, 'd123', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2608, 652, '21d', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2609, 652, '321d', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2610, 652, '321', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2611, 653, '9-8-7-6-5-4-3-2-1-0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2612, 653, '01234567890', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2613, 653, '123456789', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2614, 653, '0-1-2-3-4-5-6-7-8-9', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2615, 654, '5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2616, 654, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2617, 654, 'true', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2618, 654, 'false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2619, 655, '888', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2620, 655, '421', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2621, 655, '444', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2622, 655, 'none of the above', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2623, 656, '9 7 7 hello 7 7hello', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2624, 656, '72 34 34 hello34 34hello', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2625, 656, '9 7 7 hello34 34hello', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2626, 656, '72 7 34 hello34 7hello', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2627, 657, 'c=1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2628, 657, 'c=2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2629, 657, 'c=3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2630, 657, 'c=4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2631, 657, 'c=5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2632, 657, 'c=6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2633, 657, 'c=7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2634, 658, '1 и 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2635, 658, '2 и 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2636, 658, '3 и 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2637, 658, '4 и 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2638, 659, 'a=true и b==true : напечатет "A && B"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2639, 659, 'a=true и b=false : напечатет "notB"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2640, 659, 'a=false и b=true : напечатет "ELSE"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2641, 659, 'a=false и b=false : напечатет "ELSE"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2642, 660, 'Zero', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2643, 660, 'Twelve', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2644, 660, 'Default', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2645, 660, 'ошибка компиляции', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2646, 661, 'java', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2647, 661, 'javac', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2648, 661, 'javajavac', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2649, 661, 'Compile error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2650, 662, 'z', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2651, 662, 'x z', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2652, 662, 'y z', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2653, 662, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2654, 663, 'Apple costs 2 UAH', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2655, 663, 'Other output', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2656, 663, 'Runtime exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2657, 663, 'Complier error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2658, 664, 'It prints f2[0] = 0.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2659, 664, 'It prints f2[0] = NaN', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2660, 664, 'An error at f2 = f1; causes compile to fail.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2661, 664, 'It prints the garbage value.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2662, 665, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2663, 665, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2664, 665, '101', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2665, 665, '111', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2666, 666, '41', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2667, 666, '42', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2668, 666, '50', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2669, 666, '51', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2670, 667, 'i = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2671, 667, 'i = 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2672, 667, 'i = 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2673, 667, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2674, 668, 'i = 1, j = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2675, 668, 'i = 1, j = 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2676, 668, 'i = 3, j = 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2677, 668, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2678, 669, 'I is 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2679, 669, 'I is 0 I is 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2680, 669, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2681, 669, 'None of the above', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2682, 670, '3.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2683, 670, '-3.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2684, 670, 'NaN', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2685, 670, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2686, 670, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2687, 671, 'apa', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2688, 671, 'app', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2689, 671, 'apea', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2690, 671, 'apep', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2691, 672, 'int', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2692, 672, 'byte', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2693, 672, 'long', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2694, 672, 'double', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2695, 673, '2, 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2696, 673, '3, 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2697, 673, '4, 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2698, 673, '1, 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2699, 674, '5 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2700, 674, '8 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2701, 674, '8 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2702, 674, '8 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2703, 675, '1, 2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2704, 675, '2, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2705, 675, '3, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2706, 675, '1, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2707, 676, 'No statement required.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2708, 676, 'import java.io.*;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2709, 676, 'include java.io.*;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2710, 676, 'import java.io.PrintWriter;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2711, 676, 'new java.io.OutputStreamWriter(System.out,true);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2712, 677, 'true true', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2713, 677, 'false true', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2714, 677, 'true false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2715, 677, 'false false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2716, 678, 'slip stream', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2717, 678, 'slipstream stream', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2718, 678, 'stream slip stream', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2719, 678, 'slipstream slip stream', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2720, 679, '7 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2721, 679, '7 14', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2722, 679, '14 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2723, 679, '14 14', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2724, 680, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2725, 680, '"odd" will always be output.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2726, 680, '"even" will always be output.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2727, 680, '"odd" will be output for odd values of x, and "even" for even values.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2728, 681, 'i = 6 and j = 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2729, 681, 'i = 5 and j = 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2730, 681, 'i = 6 and j = 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2731, 681, 'i = 5 and j = 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2732, 682, 'j = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2733, 682, 'j = 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2734, 682, 'j = 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2735, 682, 'j = 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2736, 683, 'float f = 1F;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2737, 683, 'float f = 1.0;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2738, 683, 'float f = "1";', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2739, 683, 'float f = 1.0d;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2740, 684, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2741, 684, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2742, 684, '10', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2743, 684, '10010', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2744, 685, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2745, 685, '"Hello Wold" will be printed', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2746, 685, 'Runtime error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2748, 685, '"before" will be printed``', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2749, 686, 'small', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2751, 686, 'huge', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2753, 686, 'Runtime error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2754, 687, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2756, 687, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2759, 688, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2761, 688, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2762, 689, 'i is 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2764, 689, 'No output is produced.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2767, 690, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2769, 690, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2770, 691, 'baz =', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2772, 691, 'baz = blue', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2775, 692, '10', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2777, 692, '1101', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2778, 693, 'AAACCC', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2780, 693, 'BBBCCC', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2783, 694, 'i = 5 and j = 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2785, 694, 'i = 5 and j = 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2786, 695, 'j = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2788, 695, 'j = 8', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2791, 696, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2793, 696, '4 and 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2794, 697, '0 1 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2796, 697, '2 1 0 1 0 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2799, 698, '0 1 2 1 2 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2801, 698, 'Compilation fails at line 12.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2802, 699, '0 def 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2804, 699, '2 1 0 def def', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2807, 700, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2809, 700, '4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2810, 701, 'int[] scores = {3, 5, 7};', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2812, 701, 'String cats[] = {"Fluffy", "Spot", "Zeus"};', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2814, 701, 'Integer results[] = {new Integer(3), new Integer(5), new Integer(8)};', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2815, 702, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2817, 702, '3, 4, and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2820, 703, '5 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2822, 703, '6 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2823, 704, 'j = -1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2825, 704, 'j = 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2828, 705, 'one two done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2830, 705, 'one two three two three done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2831, 706, 'a', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2833, 706, 'c', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2836, 707, 'It prints "Fred".', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2838, 707, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2839, 708, 'java Myfile 222', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2841, 708, 'java Myfile 1 3 2 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2844, 709, 'i = 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2846, 709, 'Statement causes a compile error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2849, 710, 'There are syntax errors on lines 1 and 6.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2851, 710, 'There is a syntax error on line 6.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2852, 711, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2854, 711, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2857, 712, 'f[0] = 0.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2859, 712, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2860, 713, '1, 2, 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2862, 713, '1, 2, 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2865, 714, 'int b = Math.abs(5.0);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2867, 714, 'int d = Math.abs(5L);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2868, 715, '-2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2870, 715, 'Compile Error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2873, 716, '0.0 <= d < 1.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2875, 716, 'Cannot say.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2876, 717, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2878, 717, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2881, 718, '15 15', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2883, 718, '3 7 5 3 7 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2884, 719, 'true', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2886, 719, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2889, 720, '7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2891, 720, '14', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2892, 721, 'ok', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2894, 721, 'ok dokey', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2896, 721, 'Compilation error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2897, 722, 'x = 6 y = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2899, 722, 'x = 6 y = -1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2902, 723, '0 2 4 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2904, 723, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2905, 724, 'x = 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2907, 724, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2910, 725, '0 to 65535', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2912, 725, '-32768 to 32767', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2913, 726, '9.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2915, 726, 'Compilation fails on line 9.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2918, 727, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2920, 727, 'Compilation Fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2921, 728, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2923, 728, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2925, 728, '5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2926, 729, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2928, 729, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2931, 730, 'ABCD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2933, 730, 'dcba', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2934, 731, 'NULL', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2936, 731, 'Code runs but no output', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2939, 732, 'abcxyz', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2941, 732, 'XyZabc', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2942, 733, '18', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2944, 733, '567', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2947, 734, 'abcdefdef', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2949, 734, 'abcghighi', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2950, 735, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2952, 735, '4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2955, 736, 'элементы коллекции иммутабельны.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2957, 736, 'элементы коллекции доступны через уникальный ключ', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2958, 737, 'It must be marked final.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2960, 737, 'It can be marked public.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2963, 738, '7, 5, 4, 2, 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2965, 738, 'other', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2968, 739, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2970, 739, '99', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2972, 739, 'Compiler error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2973, 740, 'class Test1 will not compile.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2975, 740, 'The Test1 hashCode() method is less efficient than the Test2 hashCode() method.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2978, 741, 'java.util.Set', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2980, 741, 'java.util.Collection', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2981, 742, 'one two three four', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2983, 742, 'four one three two', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2985, 742, 'order in which items will be printed is undefined', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2986, 743, 'java.util.HashSet', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2988, 743, 'java.util.List', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2991, 744, 'Java.util.Set', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2993, 744, 'Java.util.Collection', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2994, 745, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2996, 745, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2999, 746, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3001, 746, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3002, 747, 'x2.equals(x1)', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3004, 747, 'x5.hashCode() != x6.hashCode()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3007, 748, 'Java.util.List', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3009, 748, 'Java.util.Collection', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3010, 749, 'Compilation will succeed.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3012, 749, 'Compilation will fail at line 5.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3015, 750, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3017, 750, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3018, 751, 'Java.util.Map', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3020, 751, 'Java.util.Collection', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2747, 685, '"before Hello World after" will be printed', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2750, 686, 'tiny', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2752, 686, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2755, 687, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2757, 687, 'All statements are correct.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2758, 688, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2760, 688, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2763, 689, 'i is 1 i is 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2765, 689, 'Compilation error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2766, 690, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2768, 690, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2771, 691, 'baz = null', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2773, 691, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2774, 692, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2776, 692, '101', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2779, 693, 'AAADDD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2781, 693, 'BBBDDD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2782, 694, 'i = 6 and j = 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2784, 694, 'i = 6 and j = 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2787, 695, 'j = 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2789, 695, 'The code will run with no output', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2790, 696, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2792, 696, '3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2795, 697, '0 1 2 1 2 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2797, 697, '2 1 2 0 1 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2798, 698, '0 1 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2800, 698, 'Compilation fails at line 11.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2803, 699, '2 1 0 def 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2805, 699, '2 1 0 def 1 def 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2806, 700, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2808, 700, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2811, 701, 'int[][] scores = {2,7,6}, {9,3,45};', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2813, 701, 'boolean results[] = new boolean [] {true, false, true};', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2816, 702, '2, 3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2818, 702, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2819, 703, '5 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2821, 703, '6 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2824, 704, 'j = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2826, 704, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2827, 705, 'done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2829, 705, 'one two three done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2832, 706, 'b', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2834, 706, 'd', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2835, 707, 'It prints "true".', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2837, 707, 'An exception occurs at runtime.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2840, 708, 'java Myfile 1 2 2 3 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2842, 708, 'java Myfile 0 1 2 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2843, 709, 'i = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2845, 709, 'value of i is undetermined', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2847, 709, 'nothing will be printed', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2848, 710, 'There is a syntax error on line 1.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2850, 710, 'There are syntax errors on lines 1, 6, and 8.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2853, 711, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2855, 711, '4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2856, 712, 'f[0] = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2858, 712, 'Compile Error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2861, 713, '2, 4, 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2863, 713, '2, 3, 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2864, 714, 'int a = Math.abs(-5);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2866, 714, 'int c = Math.abs(5.5F);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2869, 715, 'NaN', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2871, 715, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2872, 716, '0.0 < d <= 1.0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2874, 716, 'Compilation fail', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2877, 717, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2879, 717, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2880, 718, '12 15', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2882, 718, '3 4 5 3 7 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2885, 719, 'false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2887, 719, 'An exception is thrown at runtime', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2888, 720, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2890, 720, '8', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2893, 721, 'dokey', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2895, 721, 'No output is produced', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2898, 722, 'x = 7 y = 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2900, 722, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2901, 723, '0 2 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2903, 723, '0 1 2 3 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2906, 724, 'x = 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2908, 724, 'The code runs with no output.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2909, 725, '0 to 32767', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2911, 725, '-256 to 255', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2914, 726, 'bad number', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2916, 726, 'Compilation fails on line 11.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2917, 727, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2919, 727, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2922, 728, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2924, 728, '4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2927, 729, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2929, 729, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2930, 730, 'abcd', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2932, 730, 'dccd', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2935, 731, 'Compile Error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2937, 731, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2938, 732, 'abcXyZ', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2940, 732, 'xyzabc', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2943, 733, '117', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2945, 733, 'Compiler error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2946, 734, 'abcdefghi', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2948, 734, 'abcghidef', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2951, 735, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2953, 735, '5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2954, 736, 'элементы коллекции отсортированы.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2956, 736, 'элементы коллекции уникальны', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2959, 737, 'It can be marked abstract.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2961, 737, 'It can be marked static.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2962, 738, '1, 2, 4, 5, 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2964, 738, '1, 5, 7, 2, 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2966, 738, 'undetermined', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2967, 739, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2969, 739, '100', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2971, 739, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2974, 740, 'The Test1 hashCode() method is more efficient than the Test2 hashCode() method.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2976, 740, 'class Test2 will not compile.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2977, 741, 'java.util.Map', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2979, 741, 'java.util.List', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2982, 742, 'four three two one', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2984, 742, 'one two three four one', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2987, 743, 'java.util.LinkedHashSet', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2989, 743, 'java.util.ArrayList', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2990, 744, 'Java.util.Map', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2992, 744, 'Java.util.List', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2995, 745, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2997, 745, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (2998, 746, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3000, 746, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3003, 747, 'x3.hashCode() == x4.hashCode()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3005, 747, 'x8.equals(x7)', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3006, 748, 'Java.util.Map', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3008, 748, 'Java.util.HashTable', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3011, 749, 'Compilation will fail at line 3.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3013, 749, 'Compilation will fail at line 15.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3014, 750, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3016, 750, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3019, 751, 'Java.util.List', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3021, 751, 'None of the above', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3022, 752, 'java.util.SortedMap', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3024, 752, 'java.util.TreeSet', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3027, 753, '1, 3, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3023, 752, 'java.util.TreeMap', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3025, 752, 'java.util.Hashtable', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3026, 753, '2, 3, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3028, 753, '3, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3031, 754, 'exception finished', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3033, 754, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3034, 755, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3036, 755, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3039, 756, 'two', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3041, 756, 'two done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3043, 756, 'ошибка компиляции', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3044, 757, 'A', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3046, 757, 'C', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3049, 758, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3051, 758, '4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3052, 759, '42', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3054, 759, '43', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3057, 760, 'Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3059, 760, 'Arithmetic Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3060, 761, 'A try statement must have at least one corresponding catch block.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3062, 761, 'An Error that might be thrown in a method must be declared as thrown by that method, or be handled within that method.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3065, 762, 'Line 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3067, 762, 'Line 14', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3068, 763, 'Nothing. The program will not compile because no exceptions are specified.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3070, 763, 'Hello world.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3073, 764, 'Code output: Start Hello world File Not Found.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3075, 764, 'Code output: Start Hello world Catch Here File not found.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3076, 765, 'This program will compile successfully.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3078, 765, 'This program fails to compile due to an error at line 6.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3081, 766, 'The Error class is a RuntimeException.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3083, 766, 'Any statement that can throw an Exception must be enclosed in a try block.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3084, 767, 'finished', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3086, 767, 'An AssertionError is thrown and finished is output.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3089, 768, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3091, 768, 'hello throwit caught finally after', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3092, 769, 'AC', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3094, 769, 'ACD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3097, 770, 'Assertion expression values can be any primitive type.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3099, 770, 'An AssertionError thrown as a result of a failed assertion should always be handled by the enclosing method.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3100, 771, 'finished', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3102, 771, 'An AssertionError is thrown.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3105, 772, 'Line 12', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3107, 772, 'Line 22', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3108, 773, 'Assertions can be enabled or disabled on a class-by-class basis.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3110, 773, 'Assertions are appropriate for checking the validity of arguments in a method.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3113, 774, 'exception caught', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3115, 774, 'Compilation fails because of an error at line 9.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3116, 775, 'The program will not compile.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3118, 775, 'The program will print Hello world, then will print that a RuntimeException has occurred, and then will print Finally executing.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3121, 776, 'Private getter() and setter() methods should not use assertions to verify arguments.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3123, 776, 'It is proper to handle assertion statement failures using a catch (AssertionException ae) block.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3124, 777, 'ABCD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3126, 777, 'C is printed before exiting with an error message.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3129, 778, 'BC', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3131, 778, 'BCD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3132, 779, 'BD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3134, 779, 'BDE', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3137, 780, 'throws Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3139, 780, 'throws RuntimeException', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3140, 781, 'If assertions are compiled into a source file, and if no flags are included at runtime, assertions will execute by default.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3142, 781, 'With the proper use of runtime arguments, it is possible to instruct the VM to disable assertions for a certain class, and to enable assertions for a certain package, at the same time.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3145, 782, 'a=1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3147, 782, 'An exception will be thrown at the runtime', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3148, 783, 'A. protected int a;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3150, 783, 'C. private synchronized int e;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3153, 784, 'Class B''S constructor has no arguments.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3155, 784, 'None of these.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3156, 785, '1 only', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3158, 785, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3161, 786, '0 0 42', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3163, 786, '0 0 0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3164, 787, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3166, 787, 'It prints "AhaUhuExe"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3168, 787, 'It prints "AxaExe"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3169, 788, 'Test( )', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3171, 788, 'public Test( )', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3174, 789, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3176, 789, 'A ClassCastException will occur.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3177, 790, 'Class A', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3179, 790, 'An exception is thrown at line 3.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3182, 791, 'java.lang.Double', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3184, 791, 'java.lang.Character', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3185, 792, 'It can extend exactly one class and implement exactly one interface.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3187, 792, 'It can extend exactly one class or implement exactly one interface.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3190, 793, 'MyOuter.MyInner mi = new MyInner();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3192, 793, 'MyInner mi = new MyOuter.MyInner();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3193, 794, 'public', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3195, 794, 'protected', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3198, 795, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3200, 795, '1 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3201, 796, 'public int method1(int a, int b) {return 0; }', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3203, 796, 'public short method1(int a, int b) { return 0; }', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3206, 797, 'Prints: false,false,true', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3208, 797, 'Prints: true,false,false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3209, 798, 'Foo.Bar b = new Foo.Bar();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3211, 798, 'Bar b = new f.Bar();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3214, 799, 'static', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3216, 799, 'protected', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3219, 800, '2 only', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3221, 800, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3222, 801, '1, 2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3224, 801, '3, 4 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3227, 802, 'abstract', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3229, 802, 'synchronized', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3232, 803, 'private', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3234, 803, 'default access', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3235, 804, 'public static short stop = 23;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3237, 804, 'transient short stop = 23;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3240, 805, 'Tree', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3242, 805, 'Oops', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3243, 806, '4, 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3245, 806, '5, 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3248, 807, 'Compiles but fails at runtime', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3250, 807, 'Prints "complete"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3251, 808, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3029, 753, '1, 2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3030, 754, 'finally', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3032, 754, 'finally exception finished', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3035, 755, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3037, 755, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3038, 756, 'one', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3040, 756, 'one done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3042, 756, 'one two done', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3045, 757, 'B', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3047, 757, 'D', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3048, 758, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3050, 758, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3053, 759, '42.5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3055, 759, 'bad number', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3056, 760, 'finished', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3058, 760, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3061, 761, 'Multiple catch statements can catch the same class of exception more than once.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3063, 761, 'Except in case of VM shutdown, if a try block starts to execute, a corresponding finally block will always start to execute.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3064, 762, 'Line 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3066, 762, 'Line 12', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3069, 763, 'Nothing. The program will not compile because no catch clauses are specified.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3071, 763, 'Hello world Finally executing', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3072, 764, 'The code will not compile.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3074, 764, 'Code output: Start Hello world End of file exception.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3077, 765, 'This program fails to compile due to an error at line 4.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3079, 765, 'This program fails to compile due to an error at line 18.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3080, 766, 'catch(X x) can catch subclasses of X where X is a subclass of Exception.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3082, 766, 'Any statement that can throw an Error must be enclosed in a try block.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3085, 767, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3087, 767, 'An AssertionError is thrown with the message "assertion failed."', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3088, 768, 'hello throwit caught', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3090, 768, 'hello throwit RuntimeException caught after', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3093, 769, 'BC', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3095, 769, 'ABCD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3096, 770, 'Assertion expressions should not contain side effects.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3098, 770, 'Assertions should be used for enforcing preconditions on public methods.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3101, 771, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3103, 771, 'An AssertionError is thrown and finished is output.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3104, 772, 'Line 11', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3106, 772, 'Line 14', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3109, 773, 'Conditional compilation is used to allow tested classes to run at full speed.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3111, 773, 'The programmer can choose to execute a return statement or to throw an exception if an assertion fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3112, 774, 'Ex0 caught', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3114, 774, 'Compilation fails because of an error at line 2.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3117, 775, 'The program will print Hello world, then will print that a RuntimeException has occurred, then will print Done with try block, and then will print Finally executing.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3119, 775, 'The program will print Hello world, then will print Finally executing, then will print that a RuntimeException has occurred.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3120, 776, 'It is sometimes good practice to throw an AssertionError explicitly.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3122, 776, 'If an AssertionError is thrown in a try-catch block, the finally block will be bypassed.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3125, 777, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3127, 777, 'BC is printed before exiting with an error message.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3128, 778, 'AB', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3130, 778, 'ABC', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3133, 779, 'BCD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3135, 779, 'BCDE', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3136, 780, 'No code is necessary.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3138, 780, 'catch ( Exception e )', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3141, 781, 'As of Java version 1.4, assertion statements are compiled by default.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3143, 781, 'When evaluating command-line arguments, the VM gives -ea flags precedence over -da flags.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3144, 782, 'a=0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3146, 782, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3149, 783, 'B. transient int b = 3;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3151, 783, 'D. volatile int d;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3152, 784, 'Class B''S constructor is public.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3154, 784, 'Class B''S constructor includes a call to this( ).', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3157, 785, '2 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3159, 785, '3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3160, 786, 'null null 42', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3162, 786, '0 42 42', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3165, 787, 'An error occurs at runtime.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3167, 787, 'It prints "AhaExeUhu"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3170, 788, 'Test(void)', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3172, 788, 'public Test(void)', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3173, 789, 'i = 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3175, 789, 'i = 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3178, 790, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3180, 790, 'The code executes with no output.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3181, 791, 'java.lang.String', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3183, 791, 'java.lang.StringBuffer', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3186, 792, 'It can extend exactly one class and can implement multiple interfaces.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3188, 792, 'It can implement multiple interfaces regardless of whether it also extends a class.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3189, 793, 'MyOuter.MyInner m = new MyOuter.MyInner();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3191, 793, 'MyOuter m = new MyOuter();
MyOuter.MyInner mi = m.new MyOuter.MyInner();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3194, 794, 'private', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3196, 794, 'transient', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3197, 795, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3199, 795, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3202, 796, 'private int method1(int a, int b) { return 0; }', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3204, 796, 'static protected int method1(int a, int b) { return 0; }', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3205, 797, 'Prints: false,false,false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3207, 797, 'Prints: false,true,false', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3210, 798, 'Foo.Bar b = f.new Bar();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3212, 798, 'Bar b = f.new Bar();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3213, 799, 'final', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3215, 799, 'private', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3217, 799, 'volatile', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3218, 800, '1 only', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3220, 800, '3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3223, 801, '2, 3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3225, 801, '1, 2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3226, 802, 'public', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3228, 802, 'protected', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3230, 802, 'default access', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3231, 803, 'public', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3233, 803, 'protected', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3236, 804, 'protected short stop = 23;', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3238, 804, 'final void madness(short stop);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3239, 805, 'Pine', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3241, 805, 'Forest', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3244, 806, '4, 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3246, 806, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3247, 807, 'It compiles and runs printing nothing', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3249, 807, 'Compile Error', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3252, 808, '2 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3254, 808, '4 and 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3255, 809, 'Boo f = new Boo(24) { };', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3257, 809, 'Bar f = new Boo(String s) { };', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3260, 810, 'It does not have access to nonstatic members of the enclosing class.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3262, 810, 'It must extend the enclosing class.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3263, 811, 'Runnable r = new Runnable() { };', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3265, 811, 'Runnable r = new Runnable { public void run(){}};', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3268, 812, 'It prints "Zippo".', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3270, 812, 'Compilation fails because of an error on line 2.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3273, 813, '45 38', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3275, 813, 'An exception occurs at runtime.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3276, 814, 'result = 1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3278, 814, 'result = 11', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3281, 815, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3283, 815, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3286, 816, 'BaseBase', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3288, 816, 'The code runs with no output', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3289, 817, '0 2 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3291, 817, 'Compilation fails at line 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3294, 818, 'Thread t = new Thread(X); t.start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3296, 818, 'Thread t = new Thread(); x.run();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3297, 819, 'ошибка компиляции', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3299, 819, 'Напечатает "Thread one. Thread two."', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3302, 820, 'напечатает "Inside Thread Inside Runnable"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3304, 820, 'An exception at runtime', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3305, 821, 'случится DeadLock', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3307, 821, 'ошибка компиляцмм', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3310, 822, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3312, 822, '2 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3313, 823, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3315, 823, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3317, 823, '3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3318, 824, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3320, 824, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3323, 825, 'To call wait(), an object must own the lock on the thread.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3325, 825, 'The notify() method causes a thread to immediately release its locks.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3326, 826, '1, 2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3328, 826, '3, 4 and 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3331, 827, 'start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3333, 827, 'main();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3334, 828, 'ABBCAD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3336, 828, 'CDADACB', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3338, 828, 'Output not determined.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3339, 829, 'Compilation fails.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3341, 829, '0..1..2..3..', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3344, 830, 'If a class has synchronized code, multiple threads can still access the nonsynchronized code.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3346, 830, 'When a thread sleeps, it releases its locks.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3347, 831, 'notify()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3349, 831, 'InputStream access', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3352, 832, 'Wrap a synchronize(this) around the call to f.increase().', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3354, 832, 'Synchronize the increase() method', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3355, 833, 'main() will finish before starting threads.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3357, 833, 'main() will finish after one thread.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3360, 834, 'If a thread is blocked in the wait method of an object, and another thread executes the notify method on the same object, it is still possible that the first thread might never resume execution.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3362, 834, 'If two threads are blocked in the wait method of one object, and another thread executes the notify method on the same object, then the first thread that executed the wait call first definitely resumes execution as a direct and sole consequence of the notify call.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3363, 835, 'wait()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3365, 835, 'notifyall()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3368, 836, 'Thread', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3370, 836, 'Class', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3371, 837, 'It will print the numbers 0 to 19 sequentially', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3373, 837, 'It will print the numbers 1 to 20, but the order cannot be determined', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3376, 838, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3378, 838, '3 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3379, 839, 'public class MyRunnable extends Runnable{public void run(){}}', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3381, 839, 'public class MyRunnable implements Runnable{public void run(){}}', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3384, 840, 'Errors at lines 8 and 9 cause compilation to fail.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3386, 840, 'The program prints pairs of values for x and y that are always the same on the same line (for example, "x=1, y=1". In addition, each value appears once (for example, "x=1, y=1" followed by "x=2, y=2")', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3387, 841, 'What will be the output of the program?', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3389, 841, 'This code will not compile due to line 6.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3391, 841, '1..2..3..', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3392, 842, 'The code fails to compile in the main() method', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3394, 842, 'Only the text "In run" will be displayed', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3397, 843, 'Runtime exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3399, 843, 'Will print in this order: x = 1 y = 1 x = 2 y = 2 x = 3 y = 3 x = 4 y = 4 x = 5 y = 5... but the output will be produced by first one thread then the other. This is guaranteed by the synchronised code.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3402, 844, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3404, 844, '2 and 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3405, 845, 'ACCBAD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3407, 845, 'CDDACB', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3410, 846, 'public void run()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3412, 846, 'void run(int priority)', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3413, 847, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3415, 847, '4 and 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3418, 848, 'after line 14', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3420, 848, 'after line 15, when main() completes', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3421, 849, 'After line 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3423, 849, 'After the start() method completes', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3426, 850, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3428, 850, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3429, 851, 'just after line 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3431, 851, 'just after line 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3434, 852, 'The garbage collector uses a mark and sweep algorithm.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3436, 852, 'If object 1 refers to object 2, then object 2 can''t be garbage collected.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3437, 853, 'Memory is reclaimed by calling Runtime.gc().', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3439, 853, 'An OutOfMemory error is only thrown if a single block of memory cannot be found that is large enough for a particular requirement.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3442, 854, 'x.finalize()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3444, 854, 'Only the garbage collection system can destroy an object.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3445, 855, 'Calling the SetPriority() method on a Thread object.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3447, 855, 'Calling notify() method on an object.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3450, 856, 'construct();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3452, 856, 'register();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3453, 857, 'new Runnable(MyRunnable).start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3455, 857, 'new Thread(new MyRunnable()).start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3253, 808, '3 and 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3256, 809, 'Boo f = new Bar() { };', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3258, 809, 'Boo f = new Boo.Bar(String s) { };', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3259, 810, 'You must have a reference to an instance of the enclosing class in order to instantiate it.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3261, 810, 'It''s variables and methods must be static.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3264, 811, 'Runnable r = new Runnable(public void run() { });', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3266, 811, 'System.out.println(new Runnable() {public void run() { }});', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3267, 812, 'An exception occurs at runtime at line 3.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3269, 812, 'Compilation fails because of an error on line 1.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3271, 812, 'Compilation fails because of an error on line 3.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3272, 813, '57 22', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3274, 813, '45 57', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3277, 814, 'result = 10', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3279, 814, 'result = 11010', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3280, 815, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3282, 815, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3284, 815, 'Runtime Exception', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3285, 816, 'Base', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3287, 816, 'Compilation fails', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3290, 817, '0 2 4 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3292, 817, 'Compilation fails at line 10', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3293, 818, 'Thread t = new Thread(X);', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3295, 818, 'X run = new X(); Thread t = new Thread(run); t.start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3298, 819, 'An exception occurs at runtime.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3300, 819, 'Не знаю / не понятно.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3301, 820, 'напечатает "Inside Thread Inside Thread"', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3303, 820, 'не откомпилируется', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3306, 821, '12 12 12 12', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3308, 821, 'поведение не определено', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3309, 822, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3311, 822, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3314, 823, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3316, 823, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3319, 824, '2 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3321, 824, '2 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3322, 825, 'The notifyAll() method must be called from a synchronized context.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3324, 825, 'The notify() method is defined in class java.lang.Thread.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3327, 826, '2, 5 and 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3329, 826, '4, 5 and 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3330, 827, 'run();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3332, 827, 'stop();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3335, 828, 'ABCBCAD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3337, 828, 'Output determined by the underlying platform.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3340, 829, '1..2..3..', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3342, 829, '0..1..2..', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3343, 830, 'A static method cannot be synchronized.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3345, 830, 'Variables can be protected from concurrent access problems by marking them with the synchronized keyword.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3348, 831, 'wait()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3350, 831, 'sleep()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3351, 832, 'Synchronize the run method.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3353, 832, 'The existing code will cause a runtime exception.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3356, 833, 'main() will finish in the middle of one thread.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3358, 833, 'Cannot be determined.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3359, 834, 'If only one thread is blocked in the wait method of an object, and another thread executes the modify on that same object, then the first thread immediately resumes execution.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3361, 834, 'If a thread is blocked in the wait method of an object, and another thread executes the notify method on the same object, then the first thread definitely resumes execution as a direct and sole consequence of the notify call.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3364, 835, 'notify()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3366, 835, 'exits synchronized code', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3367, 836, 'Object', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3369, 836, 'Runnable', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3372, 837, 'It will print the numbers 1 to 20 sequentially', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3374, 837, 'The code will not compile.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3375, 838, '1 and 2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3377, 838, '1 and 4', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3380, 839, 'public class MyRunnable extends Object{public void run(){}}', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3382, 839, 'public class MyRunnable implements Runnable{void run(){}}', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3383, 840, 'An error at line 11 causes compilation to fail', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3385, 840, 'The program prints pairs of values for x and y that might not always be the same on the same line (for example, "x=2, y=1")', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3388, 841, 'This code will not compile due to line 5.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3390, 841, '1..2..', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3393, 842, 'The code fails to compile in the run() method', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3395, 842, 'The text "In run" followed by "Leaving run" will be displayed', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3396, 843, 'Compilation error.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3398, 843, 'Will print in this order: x = 1 y = 1 x = 2 y = 2 x = 3 y = 3 x = 4 y = 4 x = 5 y = 5... but the output will be produced by both threads running simultaneously.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3400, 843, 'Will print in this order: x = 1 y = 2 x = 3 y = 4 x = 5 y = 6 x = 7 y = 8...', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3401, 844, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3403, 844, '1 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3406, 845, 'ABBCAD', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3408, 845, 'Indeterminate output', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3409, 846, 'void run()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3411, 846, 'public void start()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3414, 847, '3 and 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3416, 847, '1 and 3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3417, 848, 'after line 12', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3419, 848, 'after line 7, when doBar() completes', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3422, 849, 'After line 8', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3424, 849, 'When the instance running this code is made eligible for garbage collection.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3425, 850, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3427, 850, '2', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3430, 851, 'just after line 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3432, 851, 'just after line 8', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3433, 852, 'Calling Runtime.gc() will cause eligible objects to be garbage collected.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3435, 852, 'If an object can be accessed from a live thread, it can''t be garbage collected.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3438, 853, 'Objects are not collected if they are accessible from live threads.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3440, 853, 'Objects that have finalize() methods always have their finalize() methods called before the program ends.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3441, 854, 'x.delete()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3443, 854, 'Runtime.getRuntime().gc()', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3446, 855, 'Calling the wait() method on an object.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3448, 855, 'Calling read() method on an InputStream object.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3449, 856, 'run();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3451, 856, 'start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3454, 857, 'new Thread(MyRunnable).run();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3456, 857, 'new MyRunnable().start();', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3457, 858, 'after line 5', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3459, 858, 'after line 7', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3462, 859, '1', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3464, 859, '3', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3458, 858, 'after line 6', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3460, 858, 'There is no way to be absolutely certain.', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3461, 859, '0', 0);
INSERT INTO public.answer (a_id, a_question_id, a_text, a_type) VALUES (3463, 859, '2', 0);


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."group" (g_id, g_name) VALUES (1, 'FS1');
INSERT INTO public."group" (g_id, g_name) VALUES (2, 'FS2');
INSERT INTO public."group" (g_id, g_name) VALUES (3, 'FS3');
INSERT INTO public."group" (g_id, g_name) VALUES (4, 'FS4');
INSERT INTO public."group" (g_id, g_name) VALUES (5, 'FS5');
INSERT INTO public."group" (g_id, g_name) VALUES (6, 'FS6');
INSERT INTO public."group" (g_id, g_name) VALUES (7, 'FS7');


--
-- Data for Name: process; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (1, 9, '2018-07-03 13:14:53.935033+03', 650, 2599);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (2, 9, '2018-07-03 13:15:11.517027+03', 650, 0);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (3, 9, '2018-07-03 13:21:45.506861+03', 650, 0);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (4, 9, '2018-07-03 13:21:47.18304+03', 650, 0);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (5, 9, '2018-07-03 13:22:39.38602+03', 650, 2599);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (6, 9, '2018-07-03 13:22:41.372938+03', 650, 2600);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (7, 9, '2018-07-03 13:22:42.945855+03', 650, 2601);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (8, 9, '2018-07-03 13:22:44.533839+03', 650, 2602);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (9, 9, '2018-07-03 13:23:38.413573+03', 650, 2599);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (10, 9, '2018-07-03 14:18:52.224026+03', 651, 2603);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (11, 9, '2018-07-03 14:18:57.382636+03', 652, 2608);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (12, 9, '2018-07-03 14:19:00.667502+03', 653, 0);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (13, 8, '2018-07-03 14:19:43.682507+03', 650, 2602);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (14, 8, '2018-07-03 14:19:47.371275+03', 651, 2606);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (15, 8, '2018-07-03 14:19:53.957209+03', 652, 2609);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (16, 8, '2018-07-03 14:20:03.196307+03', 653, 2614);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (17, 9, '2018-07-03 14:20:56.987895+03', 653, 2614);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (18, 9, '2018-07-03 14:20:59.389292+03', 654, 2617);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (19, 9, '2018-07-03 14:22:26.290322+03', 655, 0);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (20, 10, '2018-07-03 14:27:16.893247+03', 653, 2614);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (21, 10, '2018-07-03 14:27:18.72882+03', 654, 2618);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (22, 10, '2018-07-03 14:27:29.701638+03', 654, 2618);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (23, 10, '2018-07-03 14:27:40.503487+03', 654, 2618);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (24, 10, '2018-07-03 14:27:44.648175+03', 654, 2618);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (25, 10, '2018-07-03 14:29:18.148874+03', 650, 0);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (26, 10, '2018-07-03 14:29:21.060807+03', 651, 2606);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (27, 10, '2018-07-03 14:29:23.536+03', 652, 2607);
INSERT INTO public.process (p_id, p_user, p_date, p_question, p_answer) VALUES (28, 10, '2018-07-03 14:29:27.160245+03', 655, 2620);


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (652, '0003', '`        int i=2;
         switch (i) {
             case 3:
                 System.out.print("3");
             case 2:
                 System.out.print("2");
             case 1:
                 System.out.print("1");
             default:
                 System.out.print("d");
         }`
', '2018-06-20 00:17:27.529905+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (653, '0004', '`        for (int i = 0; i > -10; i--) {
             System.out.print(i);
         }`

', '2018-06-20 00:17:27.53627+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (654, '0005', '`        System.out.println(5&1);`

', '2018-06-20 00:17:27.54192+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (655, '0006', '`        System.out.print(8>1);
         System.out.print(8>>1);
         System.out.print(8>>>1);
`
', '2018-06-20 00:17:27.550199+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (656, '0008', '`public class Test008 {
     public static void main(String [] args) {
         Test008 s = new Test008();
         s.start();
     }

     void start() {
         int a = 3;
         int b = 4;
         System.out.print(" " + 7 + 2 + " ");
         System.out.print(a + b);
         System.out.print(" " + a + b + " ");
         System.out.print(hello() + a + b + " ");
         System.out.println(a + b + hello());
     }

     String hello() {
         return "hello";
     }
 }
`

', '2018-06-20 00:17:27.555404+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (657, '0009', '`
    boolean [] b = new boolean[3];
    int c = 0;

    public static void main(String [] args) {
        Test009 ba = new Test009();
        ba.set(ba.b, 0);
        ba.set(ba.b, 2);
        ba.test();
    }

    void set(boolean []x, int i) {
        x[i] = true;
        ++c;
    }

    void test() {
        if ( b[0] && b[1] | b[2] )  c++;
        if ( b[1] && b[(++c - 2)] ) c+=7;
        System.out.println("c=" + c);
    }`
', '2018-06-20 00:17:27.559903+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (658, '0010', '1. 3/2
2. 3<2
3. 3*4
4. 3<<2
', '2018-06-20 00:17:27.567567+03', 'какие выражения эквивалентны ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (659, '0011', '`
    public static void test( boolean a, boolean b) {
        if (a) {
            System.out.println("A");
        } else if (a && b) {
            System.out.println( "A && B");
        } else {
            if (!b) {
                System.out.println( "notB") ;
            }
            else {
                System.out.println( "ELSE" ) ;
            }
        }
    }`
', '2018-06-20 00:17:27.571666+03', 'как поведет себя эта функция');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (660, '0012', '`
        Float f = new Float("12");
        switch (f) {
            case 12: System.out.println("Twelve");
            case 0: System.out.println("Zero");
            default: System.out.println("Default");
        }`
', '2018-06-20 00:17:27.576231+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (661, '0025', '`
public class Test025 {
    public static void stringReplace (String text) {
        text = text.replace (''j'' , ''c''); /* Line 5 */
    }

    public static void bufferReplace (StringBuffer text) {
        text = text.append ("c");  /* Line 9 */
    }

    public static void main (String args[]) {
        String textString = new String ("java");
        StringBuffer textBuffer = new StringBuffer ("java"); /* Line 14 */
        stringReplace(textString);
        bufferReplace(textBuffer);
        System.out.println (textString + textBuffer);
    }
}`

', '2018-06-20 00:17:27.582161+03', 'что сучится');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (662, '0026', '`
public class Test026 {
    public static void main(String [] args) {
        Boolean b1 = new Boolean("false");
        boolean b2;
        b2 = b1.booleanValue();
        if (!b2) {
            b2 = true;
            System.out.print("x ");
        }
        if (b1 & b2) /* Line 13 */ {
            System.out.print("y ");
        }
        System.out.println("z");
    }
}`

', '2018-06-20 00:17:27.586455+03', 'What will be the output of the program (in jdk1.6 or above)?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (663, '0027', '`
public class Test027 {
    public static void main(String[] args) {
        String s="Apple "+
                "costs " +
                + ''2'' +
                " UAH";
        System.out.println(s);
    }
}`
', '2018-06-20 00:17:27.591226+03', 'what will be printed');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (664, '0032', '`
public class Test032 {
    public static void main(String[] args) {
        float f1[ ], f2[ ];
        f1 = new float[10];
        f2 = f1;
        System.out.println("f2[0] = " + f2[0]);
    }
}
`

', '2018-06-20 00:17:27.595574+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (665, '0036', '`
public class Test036 {
    static boolean b1, b2;
    public static void main(String [] args) {
        int x = 0;
        if ( !b1 ) {
            if ( !b2 ) {
                b1 = true;
                x++;
                if ( 5 > 6 ) {
                    x++;
                }
                if ( !b1 )
                    x = x + 10;
                else if ( b2 = true )
                    x = x + 100;
                else if ( b1 | b2 )
                    x = x + 1000;
            }
        }
        System.out.println(x);
    }
}`

', '2018-06-20 00:17:27.600564+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (666, '0037', '`
public class Test037 {
    static boolean b;
    public static void main(String [] args) {
        short hand = 42;
        if ( hand < 50 && !b )
            hand++;
        if ( hand > 50 );
        else if ( hand > 40 ) {
            hand += 7;
            hand++;
        }
        else
            --hand;
        System.out.println(hand);
    }
}`

', '2018-06-20 00:17:27.606509+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (667, '0038', '`
public class Test038 {
    public static void main(String[] args) {
        int i = 0;
        while(1) {
            if(i == 4) {
                break;
            }
            ++i;
        }
        System.out.println("i = " + i);
    }
}
`
', '2018-06-20 00:17:27.6124+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (668, '0039', '`
public class Test039 {
    public static void main(String[] args) {
        int i = 0, j = 5;
        tp:
        for (; ; ) {
            i++;
            for (; ; ) {
                if (i > --j) {
                    break tp;
                }
            }
            System.out.println("i =" + i + ", j = " + j);
        }
    }
}`

', '2018-06-20 00:17:27.617499+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (669, '0040', '`
public class Test040 {
    public static void main(String[] args) {
        int i = 0;
        label:
        if (i < 2) {
            System.out.print("I is " + i);
            i++;
            continue label;
        }
    }
}`
', '2018-06-20 00:17:27.622543+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (672, '0052', '`
public class Test052 {
    returnType methodA(byte x, double y) {
        return (long)x / y * 2;
    }
}`

', '2018-06-20 00:17:27.636589+03', 'What is the widest valid returnType for methodA');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (651, '0002', '`        for (int i = 0; i < 10; i++) {
             System.out.print(i);
         }`', '2018-06-20 00:17:27.522414+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (670, '0049', '`
public class Test049 {
    public static void main(String[] args) {
        double value = -9.0;
        System.out.println( Math.sqrt(value));
    }
}`

', '2018-06-20 00:17:27.627381+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (671, '0050', '`
public class Test050 {
    public static void main(String[] args) {
        String a = "newspaper";
        a = a.substring(5,7);
        char b = a.charAt(1);
        a = a + b;
        System.out.println(a);
    }
}`

', '2018-06-20 00:17:27.632818+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (673, '0053', '
`
public class Test053 {
    public static void main(String[] args) {
        float[] f = new float(3);
        float f2[] = new float[];
        float[]f1 = new float[3];
        float f3[] = new float[3];
        float f5[] = {1.0f, 2.0f, 2.0f};
    }
}`

', '2018-06-20 00:17:27.641013+03', 'Which two cause a compiler error?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (675, '0057', '`
public class Test057 {
    public static void main(String [] args) {
        float f = 42.0f;
        float [] f1 = new float[2];
        float [] f2 = new float[2];
        float [] f3 = f1;
        long x = 42;
        f1[0] = 42.0f;
    }
}`
1. f1 == f2
2. f1 == f3
3. f2 == f1[1]
4. x == f1[0]
5. f == f1[0]

', '2018-06-20 00:17:27.6503+03', 'which three statements are true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (678, '0075', '`
public class Test075 {
    public static void main(String [] args) {
        Test075 p = new Test075();
        p.start();
    }

    void start() {
        String s1 = "slip";
        String s2 = fix(s1);
        System.out.println(s1 + " " + s2);
    }

    String fix(String s1) {
        s1 = s1 + "stream";
        System.out.print(s1 + " ");
        return "stream";
    }
}`

', '2018-06-20 00:17:27.66231+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (680, '0077', '`
public class Test077 {
    public void test(int x) {
        int odd = 1;
        if(odd) /* Line 4 */ {
            System.out.println("odd");
        } else {
            System.out.println("even");
        }
    }
}`

', '2018-06-20 00:17:27.668725+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (682, '0079', '`
public class Test079 {
    public static void main(String args[]) {
        int i = 1, j = 0;
        switch(i) {
            case 2: j += 6;
            case 4: j += 1;
            default: j += 2;
            case 0: j += 4;
        }
        System.out.println("j = " + j);
    }
}`

', '2018-06-20 00:17:27.675798+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (684, '0089', '`
public class Test089 {
    public static void main(String [] args)
    {
        int result = 0;
        Boolean b1 = new Boolean("TRUE");
        Boolean b2 = new Boolean("true");
        Boolean b3 = new Boolean("tRuE");
        Boolean b4 = new Boolean("false");
        if (b1 == b2)  /* Line 10 */
            result = 1;
        if (b1.equals(b2) ) /* Line 12 */
            result = result + 10;
        if (b2 == b4)  /* Line 14 */
            result = result + 100;
        if (b2.equals(b4) ) /* Line 16 */
            result = result + 1000;
        if (b2.equals(b3) ) /* Line 18 */
            result = result + 10000;
        System.out.println("result = " + result);
    }
}
`

', '2018-06-20 00:17:27.682557+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (688, '0096', '`
16*4
16>>2
16/2^2
16>>>2
`

', '2018-06-20 00:17:27.697702+03', 'Which two statements are equivalent?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (690, '0100', '`
run
import
default
implement`

', '2018-06-20 00:17:27.704781+03', 'Which of the following are Java reserved words?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (692, '0107', '`
public class Test107 {
    public static void main(String [] args ) {
        int result = 0;
        Test107 oc = new Test107();
        Object o = oc;
        if (o == oc)
            result = 1;
        if (o != oc)
            result = result + 10;
        if (o.equals(oc) )
            result = result + 100;
        if (oc.equals(o) )
            result = result + 1000;
        System.out.println("result = " + result);
    }
}`

', '2018-06-20 00:17:27.711269+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (694, '0109', '`
public class Test109 {
    public static void main(String[] args) {
        int i = 1, j = 10;
        do {
            if(i++ > --j) /* Line 4 */ {
                continue;
            }
        } while (i < 5);
        System.out.println("i = " + i + "and j = " + j); /* Line 9 */
    }
}`

', '2018-06-20 00:17:27.718166+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (696, '0114', '`
switch(x) {
    default:
        System.out.println("Hello");
}

byte
long
char
float
Short
Long
`

', '2018-06-20 00:17:27.726058+03', 'Which two are acceptable types for x?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (698, '0116', '`
public class Test116 {
    final static short x = 2;
    public static int y = 0;
    public static void main(String [] args) {
        for (int z=0; z < 3; z++) {
            switch (z) {
                case y: System.out.print("0 ");   /* Line 11 */
                case x-1: System.out.print("1 "); /* Line 12 */
                case x: System.out.print("2 ");
            }
        }
    }
}`

', '2018-06-20 00:17:27.734212+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (700, '0130', '`
The result is less than 0.0.
The result is greater than or equal to 0.0.
The result is less than 1.0.
The result is greater than 1.0.
The result is greater than or equal to 1.0.
`

', '2018-06-20 00:17:27.741879+03', 'What two statements are true about the result obtained from calling Math.random()?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (703, '0134', '`
class Test134 {
    public static void main(String [] args) {
        int x= 0;
        int y= 0;
        for (int z = 0; z < 5; z++) {
            if (( ++x > 2 ) && (++y > 2)) {
                x++;
            }
        }
        System.out.println(x + " " + y);
    }
}`

', '2018-06-20 00:17:27.75451+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (705, '0136', '`
for(int i = 0; i < 3; i++) {
    switch(i) {
        case 0: break;
        case 1: System.out.print("one ");
        case 2: System.out.print("two ");
        case 3: System.out.print("three ");
    }
}
System.out.println("done");`

', '2018-06-20 00:17:27.761861+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (707, '0142', '`
public class Test142 {
    public static void main (String [] args) {
        Object o = new Object() /* Line 5 */ {
            public boolean equals(Object obj) {
                return true;
            }
        };      /* Line 11 */
        System.out.println(o.equals("Fred"));
    }
}`

', '2018-06-20 00:17:27.779127+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (709, '0149', '`int i = (int) Math.random();`

', '2018-06-20 00:17:27.790011+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (710, '0152', '`
public class While {
    public void loop() {
        int x= 0;
        while ( 1 ) /* Line 6 */
        {
            System.out.print("x plus one is " + (x + 1)); /* Line 8 */
        }
    }
}`

', '2018-06-20 00:17:27.796812+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (712, '0154', '`
public class Test {
    private static float[] f = new float[2];
    public static void main (String[] args)
    {
        System.out.println("f[0] = " + f[0]);
    }
}`

', '2018-06-20 00:17:27.806145+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (714, '0186', '
', '2018-06-20 00:17:27.814662+03', 'Which of the following would compile without error?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (716, '0190', '`Double d = Math.random();`

', '2018-06-20 00:17:27.822282+03', 'Which statement is true given the following?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (718, '0192', '`
class PassA
{
    public static void main(String [] args)
    {
        PassA p = new PassA();
        p.start();
    }

    void start()
    {
        long [] a1 = {3,4,5};
        long [] a2 = fix(a1);
        System.out.print(a1[0] + a1[1] + a1[2] + " ");
        System.out.println(a2[0] + a2[1] + a2[2]);
    }

    long [] fix(long [] a3)
    {
        a3[1] = 7;
        return a3;
    }
}`

', '2018-06-20 00:17:27.830769+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (853, '0124', '
', '2018-06-20 00:17:28.238183+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (674, '0056', '`
class Test056 {
    public static void main(String [] args) {
        int x=0;
        int y=0;
        for (int z = 0; z < 5; z++) {
            if (( ++x > 2 ) || (++y > 2)) {
                x++;
            }
        }
        System.out.println(x + " " + y);
    }
}`

', '2018-06-20 00:17:27.64516+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (676, '0062', '`
import java.io.File;

public class Test062 {
    public static void main(String[]args)throws Exception {
        java.io.PrintWriter out = new java.io.PrintWriter(new File("1.txt"));
        new java.io.OutputStreamWriter(System.out);
        out.println("Hello");
    }
}`

', '2018-06-20 00:17:27.654109+03', 'What line of code should added or removed to make this program compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (677, '0074', '`
public class Test074 {
    public static void main(String [] args) {
        Test074 p = new Test074();
        p.start();
    }

    void start() {
        boolean b1 = false;
        boolean b2 = fix(b1);
        System.out.println(b1 + " " + b2);
    }

    boolean fix(boolean b1) {
        b1 = true;
        return b1;
    }
}`

', '2018-06-20 00:17:27.658323+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (679, '0076', '`
public class Test076 {
    static int s;
    public static void main(String [] args) {
        Test076 p = new Test076();
        p.start();
        System.out.println(s);
    }

    void start() {
        int x = 7;
        twice(x);
        System.out.print(x + " ");
    }

    void twice(int x) {
        x = x*2;
        s = x;
    }
}`

', '2018-06-20 00:17:27.665683+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (681, '0078', '`
public class Test078 {
    public static void main(String[] args) {
        int i = 1, j = 10;
        do {
            if(i > j) {
                break;
            }
            j--;
        } while (++i < 5);
        System.out.println("i = " + i + " and j = " + j);

    }
}`

', '2018-06-20 00:17:27.672601+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (683, '0082', '
', '2018-06-20 00:17:27.679414+03', 'Which is valid declaration of a float?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (685, '0090', '`
public class Test090 {
    public static void print() {
        System.out.print("Hello World ");
    }

    public static void main(String[] args) {
        System.out.print("before ");
        Test211 t=null;
        ((Test211)t).print();
        System.out.println("after");
    }
}`

', '2018-06-20 00:17:27.685646+03', 'What will be happened ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (686, '0094', '`
public class Test094 {
    public static void main(String [] args) {
        int x=20;
        String sup = (x < 15) ? "small" : (x < 22)? "tiny" : "huge";
        System.out.println(sup);
    }
}`

', '2018-06-20 00:17:27.690495+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (687, '0095', '`
public class Test095 {
    public static void main(String[] args) {
        byte w = (int)888.8;
        byte x = (byte)1000L;
        long y = (byte)100;
        byte z = (byte)100L;
    }
}`

', '2018-06-20 00:17:27.694128+03', 'Which of the following are legal lines of code?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (689, '0097', '`
public class Test097 {
    public static void main(String [] args) {
        int i = 1;
        do while ( i < 1 )
            System.out.print("i is " + i);
        while ( i > 1 ) ;
    }
}`

', '2018-06-20 00:17:27.701013+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (691, '0101', 'And the command line invocation: java Test red green blue
`
public class Test101 {
    public static void main (String[] args) {
        String foo = args[1];
        String bar = args[2];
        String baz = args[3];
        System.out.println("baz = " + baz); /* Line 8 */
    }
}`

', '2018-06-20 00:17:27.707862+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (693, '0108', '`
public class Test108 {
    public static void main(String[] args) {
        String s = "foo";
        Object o = (Object)s;
        if (s.equals(o)) {
            System.out.print("AAA");
        } else {
            System.out.print("BBB");
        }
        if (o.equals(s)) {
            System.out.print("CCC");
        } else {
            System.out.print("DDD");
        }
    }
}`

', '2018-06-20 00:17:27.714552+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (695, '0110', '`
public class Test110 {
    static int j;
    static void methodA(int i){
        boolean b;
        do {
            b = i<10 | methodB(4); /* Line 9 */
            b = i<10 || methodB(8);  /* Line 10 */
        } while (!b);
    }

    static boolean methodB(int i) {
        j += i;
        return true;
    }

    public static void main(String[] args) {
        methodA(0);
        System.out.println( "j = " + j );
    }
}`

', '2018-06-20 00:17:27.721728+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (697, '0115', '`
public Test115 {
    final static short x = 2;
    public static int y = 0;
    public static void main(String [] args) {
        for (int z=0; z < 3; z++){
            switch (z){
                case x: System.out.print("0 ");
                case x-1: System.out.print("1 ");
                case x-2: System.out.print("2 ");
            }
        }
    }
}`

', '2018-06-20 00:17:27.729769+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (699, '0117', '`
public class Test117 {
    final static short x = 2;
    public static int y = 0;
    public static void main(String [] args) {
        for (int z=0; z < 4; z++) {
            switch (z) {
                case x: System.out.print("0 ");
                default: System.out.print("def ");
                case x-1: System.out.print("1 ");
                            break;
                case x-2: System.out.print("2 ");
            }
        }
    }
}`

', '2018-06-20 00:17:27.737678+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (701, '0131', '
', '2018-06-20 00:17:27.745872+03', 'Which cause a compiler error?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (702, '0132', '`
private int getArea();
public float getVol(float x);
public void main(String [] args);
public static void main(String [] args);
boolean setFlag(Boolean [] test);
`

', '2018-06-20 00:17:27.750521+03', 'Which three are valid method signatures in an interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (704, '0135', '`
public class Test135 {
    public static void main(String[] args) {
        int i = 1, j = -1;
        switch (i) {
            case 0, 1: j = 1; /* Line 4 */
            case 2: j = 2;
            default: j = 0;
        }
        System.out.println("j = " + j);
    }
}`

', '2018-06-20 00:17:27.758504+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (706, '0137', '`
boolean bool = true;
if(bool = false) /* Line 2 */{
    System.out.println("a");
} else if(bool) /* Line 6 */ {
    System.out.println("b");
} else if(!bool) /* Line 10 */{
    System.out.println("c"); /* Line 12 */
}
else {
    System.out.println("d");
}`

', '2018-06-20 00:17:27.766756+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (708, '0148', '`
public class Myfile {
    public static void main (String[] args) {
        String biz = args[1];
        String baz = args[2];
        String rip = args[3];
        System.out.println("Arg is " + rip);
    }
}`

', '2018-06-20 00:17:27.784069+03', 'Select how you would start the program to cause it to print: Arg is 2');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (711, '0153', '`
int I = 0;
    outer:
    while (true) {
        I++;
        inner:
        for (int j = 0; j < 10; j++) {
            I += j;
            if (j == 3)
                continue inner;
            break outer;
        }
        continue outer;
    }
System.out.println(I);`

', '2018-06-20 00:17:27.800426+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (713, '0180', '`
notify();
notifyAll();
isInterrupted();
synchronized();
interrupt();
wait(long msecs);
sleep(long msecs);
yield();
`

', '2018-06-20 00:17:27.810902+03', 'Which three are methods of the Object class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (715, '0188', '`System.out.println(Math.sqrt(-4D));`

', '2018-06-20 00:17:27.818378+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (855, '0181', '``

', '2018-06-20 00:17:28.243469+03', 'Which cannot directly cause a thread to stop executing?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (717, '0191', '`
public class Test
{
    public int aMethod()
    {
        static int i = 0;
        i++;
        return i;
    }
    public static void main(String args[])
    {
        Test test = new Test();
        test.aMethod();
        int j = test.aMethod();
        System.out.println(j);
    }
}`

', '2018-06-20 00:17:27.826675+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (719, '0193', '`
class Equals
{
    public static void main(String [] args)
    {
        int x = 100;
        double y = 100.1;
        boolean b = (x = y); /* Line 7 */
        System.out.println(b);
    }
}`

', '2018-06-20 00:17:27.835378+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (721, '0195', '`
class SSBool
{
    public static void main(String [] args)
    {
        boolean b1 = true;
        boolean b2 = false;
        boolean b3 = true;
        if ( b1 & b2 | b2 & b3 | b2 ) /* Line 8 */
            System.out.print("ok ");
        if ( b1 & b2 | b2 & b3 | b2 | b1 ) /*Line 10*/
            System.out.println("dokey");
    }
}`

', '2018-06-20 00:17:27.843365+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (722, '0196', '`
int x = l, y = 6;
while (y--)
{
    x++;
}
System.out.println("x = " + x +" y = " + y);`

', '2018-06-20 00:17:27.848343+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (724, '0198', '`
int x = 3;
int y = 1;
if (x = y) /* Line 3 */
{
    System.out.println("x =" + x);
}`

', '2018-06-20 00:17:27.855758+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (726, '0208', '`
try
{
    Float f1 = new Float("3.0");
    int x = f1.intValue();
    byte b = f1.byteValue();
    double d = f1.doubleValue();
    System.out.println(x + b + d);
}
catch (NumberFormatException e) /* Line 9 */
{
    System.out.println("bad number"); /* Line 11 */
}`

', '2018-06-20 00:17:27.862448+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (728, '0211', '''
public class Test211 {
    static int x;

    static boolean catch1() {
        x++;
        return true;
    }

    public static void main(String[] args) {
        x=0;
        if ((catch1() | catch1()) || catch1())
        x++;
        System.out.println(x);
    }
}''

', '2018-06-20 00:17:27.868842+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (729, '0210', '`
public class Test210 {
    public static void main(String[] args) {
        String s = "hello";
        Object o = s;
        if (o.equals(s)) {
            System.out.println("A");
        } else {
            System.out.println("B");
        }
        if(s.equals(o)) {
            System.out.println("C");
        } else {
            System.out.println("D");
        }
    }
}

A
B
C
D
`

', '2018-06-20 00:17:27.872816+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (731, '0119', '`
public class Test {
    public static void main (String args[]) {
        String str = NULL;
        System.out.println(str);
    }
}`

', '2018-06-20 00:17:27.878832+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (733, '0169', '`
class Test169 {
    public static void main(String[] args) {
        int i1 = 5;
        int i2 = 6;
        String s1 = "7";
        System.out.println(i1 + i2 + s1);
    }
}`

', '2018-06-20 00:17:27.884537+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (735, '0187', '`
String x = new String("xyz");
String y = "abc";
x = x + y;`

', '2018-06-20 00:17:27.89073+03', 'How many String objects have been created?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (737, '0015', '', '2018-06-20 00:17:27.897884+03', 'какие выражения истинны для method-local inner class');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (740, '0043', '
`class Test1 {
     public int value;
     public int hashCode() { return 42; }
 }
 class Test2 {
     public int value;
     public int hashcode() { return (int)(value^5); }
 }
`

', '2018-06-20 00:17:27.908501+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (742, '0084', '`
TreeSet map = new TreeSet();
map.add("one");
map.add("two");
map.add("three");
map.add("four");
map.add("one");
Iterator it = map.iterator();
while (it.hasNext() ) {
    System.out.print( it.next() + " " );
}`

', '2018-06-20 00:17:27.913373+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (743, '0118', '
', '2018-06-20 00:17:27.916531+03', 'Which collection class allows you to grow or shrink its size and provides indexed access to its elements, but whose methods are not synchronized?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (745, '0141', '`
The value returned by hashcode() is used in some collection classes to help locate objects.
The hashcode() method is required to return a positive int value.
The hashcode() method in the String class is the one inherited from Object.
Two new empty String objects will produce identical hashcodes.
`

', '2018-06-20 00:17:27.920938+03', 'Which of the following statements about the hashcode() method are incorrect?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (747, '0156', '`
x = 0;
if (x1.hashCode() != x2.hashCode() )  x = x + 1;
if (x3.equals(x4) )  x = x + 10;
if (!x5.equals(x6) ) x = x + 100;
if (x7.hashCode() == x8.hashCode() )  x = x + 1000;
System.out.println("x = " + x);`

', '2018-06-20 00:17:27.925149+03', 'Assuming that the equals() and hashCode() methods are properly implemented, if the output is "x = 1111", which of the following statements will always be true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (749, '0178', '`
package foo;
import java.util.Vector; /* Line 2 */
private class MyVector extends Vector
{
    int i = 1; /* Line 5 */
    public MyVector()
    {
        i = 2;
    }
}
public class MyNewVector extends MyVector
{
    public MyNewVector ()
    {
        i = 4; /* Line 15 */
    }
    public static void main (String args [])
    {
        MyVector v = new MyNewVector(); /* Line 19 */
    }
}`

', '2018-06-20 00:17:27.934005+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (751, '0201', '
', '2018-06-20 00:17:27.940893+03', 'You need to store elements in a collection that guarantees that no duplicates are stored. Which one of the following interfaces provide that capability?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (753, '0204', '`
The Iterator interface declares only three methods: hasNext, next and remove.
The ListIterator interface extends both the List and Iterator interfaces.
The ListIterator interface provides forward and backward iteration capabilities.
The ListIterator interface provides the ability to modify the List during iteration.
The ListIterator interface provides the ability to determine its position in the List.
`

', '2018-06-20 00:17:27.946755+03', 'Which of the following are true statements?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (755, '0020', '`
public class Test020 {
    public void one() {
        assert false; // 1
        assert false; // 2
    }

    public void two() {
        while(true) {
            assert false; // 3
        }
        assert false; // 4
    }
}`

', '2018-06-20 00:17:27.955081+03', 'в какой месте будет ошибка компиляции');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (757, '0022', '
A.	In an assert statement, the expression after the colon ( : ) can be any Java expression.
B.	If a switch block has no default, adding an assert default is considered appropriate.
C.	In an assert statement, if the expression after the colon ( : ) does not have a value, the assert''s error message will be empty.
D.	It is appropriate to handle assertion failures using a catch clause.
', '2018-06-20 00:17:27.961818+03', 'Which of the following statements is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (759, '0024', '`
public class NFE
{
    public static void main(String [] args)
    {
    String s = "42";
        try
        {
            s = s.concat(".5");  /* Line 8 */
            double d = Double.parseDouble(s);
            s = Double.toString(d);
            int x = (int) Math.ceil(Double.valueOf(s).doubleValue());
            System.out.println(x);
        }
        catch (NumberFormatException e)
        {
            System.out.println("bad number");
        }
    }
}`

', '2018-06-20 00:17:27.968395+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (761, '0042', '
', '2018-06-20 00:17:27.974935+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (857, '0183', '`
public class MyRunnable implements Runnable
{
    public void run()
    {
        // some code here
    }
}
`

', '2018-06-20 00:17:28.24693+03', 'which of these will create and start this thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (720, '0194', '`
class Bitwise
{
    public static void main(String [] args)
    {
        int x = 11 & 9;
        int y = x ^ 3;
        System.out.println( y | 12 );
    }
}`

', '2018-06-20 00:17:27.838914+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (723, '0197', '`
for (int i = 0; i < 4; i += 2)
{
    System.out.print(i + " ");
}
System.out.println(i); /* Line 5 */`

', '2018-06-20 00:17:27.852384+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (725, '0203', '
', '2018-06-20 00:17:27.859122+03', 'What is the numerical range of char?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (727, '0209', '`
public class Test209 {
    static int x;

    boolean catch() {
        x++;
        return true;
    }

    public static void main(String[] args) {
        x=0;
        if ((catch() | catch()) || catch())
            x++;
        System.out.println(x);
    }
}`

', '2018-06-20 00:17:27.865908+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (730, '0070', '`
String a = "ABCD";
String b = a.toLowerCase();
b.replace(''a'',''d'');
b.replace(''b'',''c'');
System.out.println(b);
`

', '2018-06-20 00:17:27.875961+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (732, '0128', '`
String x = "xyz";
x.toUpperCase(); /* Line 2 */
String y = x.replace(''Y'', ''y'');
y = y + "abc";
System.out.println(y);`

', '2018-06-20 00:17:27.881511+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (734, '0170', '`
public class StringRef {
    public static void main(String [] args) {
        String s1 = "abc";
        String s2 = "def";
        String s3 = s2;   /* Line 7 */
        s2 = "ghi";
        System.out.println(s1 + s2 + s3);
    }
}
`

', '2018-06-20 00:17:27.887549+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (736, '0014', '', '2018-06-20 00:17:27.894478+03', 'какие выражения действительны java.util.ArrayList?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (738, '0028', '`public class Quizz2 {
     public static void main(String[] args) {
         int[] numbers = {1,5,7,2,4};
         Queue<Integer> myQueue = new PriorityQueue<>();
         int index = 0;
         while(index < numbers.length) {
             myQueue.add(numbers[index]);
             index++;
         }
         System.out.println(myQueue);
     }
 }`

', '2018-06-20 00:17:27.901119+03', 'What will be printer');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (739, '0029', '`public class Quizz3 {
     public static void main(String[] args) {
         HashSet<Short> set = new HashSet<>();
         System.out.println(set.size());
         for (short i = 0; i < 100; i++) {
             set.add(i);
             set.remove(i-1);
         }
         System.out.println(set.size());
     }
 }`

', '2018-06-20 00:17:27.905012+03', 'What will be printed');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (741, '0061', '
', '2018-06-20 00:17:27.910807+03', 'You need to store elements in a collection that guarantees that no duplicates are stored and all elements can be accessed in natural order. Which interface provides that capability?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (744, '0140', '
', '2018-06-20 00:17:27.918708+03', 'Which interface provides the capability to store objects using a key-value pair?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (746, '0155', '`
If the equals() method returns true, the hashCode() comparison == must return true.
If the equals() method returns false, the hashCode() comparison != must return true.
If the hashCode() comparison == returns true, the equals() method must return true.
If the hashCode() comparison == returns true, the equals() method might return true.
`

', '2018-06-20 00:17:27.923087+03', 'Which two statements are true about comparing two instances of the same class, given that the equals() and hashCode() methods have been properly overridden?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (748, '0177', '
', '2018-06-20 00:17:27.928318+03', 'Which interface does java.util.Hashtable implement?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (750, '0179', '`
hashCode() doesn''t have to be overridden if equals() is.
equals() doesn''t have to be overridden if hashCode() is.
hashCode() can always return the same value, regardless of the object that invoked it.
equals() can be true even if it''s comparing different objects.
`

', '2018-06-20 00:17:27.937928+03', 'What two statements are true about properly overridden hashCode() and equals() methods?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (752, '0202', '
', '2018-06-20 00:17:27.9437+03', 'Which collection class allows you to access its elements by associating a key with an element''s value, and provides synchronization?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (754, '0013', '`
public class Test012 {
    public static void aMethod() throws Exception {
        try {
            throw new Exception();
        }
        finally {
            System.out.print("finally ");
        }
    }

    public static void main(String args[]) {
        try {
            aMethod();
        }
        catch (Exception e) {
            System.out.print("exception ");
        }
        System.out.print("finished");
    }
}`

', '2018-06-20 00:17:27.951487+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (756, '0021', '`
public class Test022 {
    public static int y;

    public static void two(int x) {
        System.out.print("two ");
        y = x;
    }

    public static int one(int z) {
        System.out.print("one ");
        return y = z;
    }

    public static void main(String [] args ) {
        int t = 0;
        assert t > 0 : one(7);
        assert t > 1 : two(8);
        System.out.println("done ");
    }
}`

', '2018-06-20 00:17:27.95776+03', 'что напечатает программа');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (758, '0023', '`
public class Test2
{
    public static int x;
    public static int foo(int y)
    {
        return y * 2;
    }
    public static void main(String [] args)
    {
        int z = 5;
        assert z > 0; /* Line 11 */
        assert z > 2: foo(z); /* Line 12 */
        if ( z < 7 )
            assert z > 4; /* Line 14 */

        switch (z)
        {
            case 4: System.out.println("4 ");
            case 5: System.out.println("5 ");
            default: assert z < 10;
        }

        if ( z < 10 )
            assert z > 4: z++; /* Line 22 */
        System.out.println(z);
    }
}`

', '2018-06-20 00:17:27.965446+03', 'which line is an example of an inappropriate use of assertions');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (760, '0041', '`
try {
    int x = 0;
    int y = 5 / x;
}
catch (Exception e) {
    System.out.println("Exception");
}
catch (ArithmeticException ae) {
    System.out.println(" Arithmetic Exception");
}
System.out.println("finished");
`

', '2018-06-20 00:17:27.971474+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (762, '0048', '`
public class Test {
    public void foo()
    {
        assert false; /* Line 5 */
        assert false; /* Line 6 */
    }
    public void bar()
    {
        while(true)
        {
            assert false; /* Line 12 */
        }
        assert false;  /* Line 14 */
    }
}`

', '2018-06-20 00:17:27.97849+03', 'What causes compilation to fail?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (764, '0059', '`
System.out.print("Start ");
try {
    System.out.print("Hello world");
    throw new FileNotFoundException();
}
System.out.print(" Catch Here "); /* Line 7 */
catch(EOFException e) {
    System.out.print("End of file exception");
} catch(FileNotFoundException e) {
    System.out.print("File not found");
}`

', '2018-06-20 00:17:27.984073+03', 'and given that EOFException and FileNotFoundException are both subclasses of IOException, and further assuming this block of code is placed into a class, which statement is most true concerning this code?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (766, '0081', '
', '2018-06-20 00:17:27.991892+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (768, '0098', '`
public class RTExcept {
    public static void throwit () {
        System.out.print("throwit ");
        throw new RuntimeException();
    }
    public static void main(String [] args) {
        try {
            System.out.print("hello ");
            throwit();
        } catch (Exception re ) {
            System.out.print("caught ");
        } finally {
            System.out.print("finally ");
        }
        System.out.println("after ");
    }
}
`

', '2018-06-20 00:17:28.002694+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (770, '0106', '
', '2018-06-20 00:17:28.010857+03', 'Which statement is true ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (763, '0058', '`
public class MyProgram {
    public static void main(String args[]){
        try {
            System.out.print("Hello world ");
        }
        finally {
            System.out.println("Finally executing ");
        }
    }
}`

', '2018-06-20 00:17:27.980997+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (765, '0080', '`
public class MyProgram {
    public static void main(String args[]) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream("test.txt");
            out.write(122);
        } catch(IOException io) {
            System.out.println("IO Error.");
        } finally {
            out.close();
        }
    }
}
`

', '2018-06-20 00:17:27.98712+03', 'and given that all methods of class FileOutputStream, including close(), throw an IOException, which of these is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (767, '0088', '`
public class Test {
    public static void main(String[] args) {
        int x = 0;
        assert (x > 0) ? "assertion failed" : "assertion passed" ;
        System.out.println("finished");
    }
}`

', '2018-06-20 00:17:27.996819+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (769, '0099', '`
public class X {
    public static void main(String[] args) {
        try {
            badMethod();
            System.out.print("A");
        } catch (Exception ex) {
            System.out.print("B");
        }
        finally {
            System.out.print("C");
        }
        System.out.print("D");
    }
    public static void badMethod() {}
}`

', '2018-06-20 00:17:28.006811+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (771, '0125', '`
public class Test {
    public static void main(String[] args) {
        int x = 0;
        assert (x > 0) : "assertion failed"; /* Line 6 */
        System.out.println("finished");
    }
}`

', '2018-06-20 00:17:28.013192+03', 'What will be the output of the program (when you run with the -ea option) ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (773, '0127', '
', '2018-06-20 00:17:28.017921+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (775, '0139', '`
public class MyProgram {
    public static void throwit() {
        throw new RuntimeException();
    }

    public static void main(String args[]){
        try {
            System.out.println("Hello world ");
            throwit();
            System.out.println("Done with try block ");
        } finally {
            System.out.println("Finally executing ");
        }
    }
}`

', '2018-06-20 00:17:28.024841+03', 'Which answer most closely indicates the behavior of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (777, '0175', '`
public class X {
    public static void main(String [] args)
    {
        try
        {
            badMethod();
            System.out.print("A");
        }
        catch (Exception ex)
        {
            System.out.print("B");
        }
        finally
        {
            System.out.print("C");
        }
        System.out.print("D");
    }
    public static void badMethod()
    {
        throw new Error(); /* Line 22 */
    }
}`

', '2018-06-20 00:17:28.030984+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (779, '0199', '`
public class X
{
    public static void main(String [] args)
    {
        try
        {
            badMethod();
            System.out.print("A");
        }
        catch (RuntimeException ex) /* Line 10 */
        {
            System.out.print("B");
        }
        catch (Exception ex1)
        {
            System.out.print("C");
        }
        finally
        {
            System.out.print("D");
        }
        System.out.print("E");
    }
    public static void badMethod()
    {
        throw new RuntimeException();
    }
}`

', '2018-06-20 00:17:28.035727+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (781, '0207', '
', '2018-06-20 00:17:28.040711+03', 'Which of the following statements is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (783, '0031', '
', '2018-06-20 00:17:28.045447+03', 'Which of the following class level (nonlocal) variable declarations will not compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (785, '0034', '`
public class NewTreeSet extends java.util.TreeSet {
    public static void main(String [] args) {
        java.util.TreeSet t = new java.util.TreeSet();
        t.clear();
    }

    public void clear() {
        TreeMap m = new TreeMap();
        m.clear();
    }
}
`
1. No statement is required
2. import java.util.*;
3. import.java.util.Tree*;
4. import java.util.TreeSet;
5. import java.util.TreeMap;

', '2018-06-20 00:17:28.05056+03', 'which two statements, added independently at beginning of the program, allow the code to compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (787, '0044', '`
public class Test044 {
    Test044() {
        System.out.print("Aha");
    }

    class Inner {
        Inner() {
            System.out.print("Uhu");
        }

        public void go() {
            System.out.print("Exe");
        }
    }

    void makeInner() {
        (new Inner() {}).go();
    }

    public static void main (String [] args) {
        Test044 f = new Test044();
        f.makeInner();
    }
}`

', '2018-06-20 00:17:28.054852+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (788, '0051', '`public class Test { }`

', '2018-06-20 00:17:28.057152+03', 'What is the prototype of the default constructor?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (790, '0055', '`
public class A {
    void A() /* Line 3 */ {
        System.out.println("Class A");
    }
    public static void main(String[] args)
    {
        new A();
    }
}`

', '2018-06-20 00:17:28.061361+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (792, '0063', '
', '2018-06-20 00:17:28.065246+03', 'Which is true about an anonymous inner class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (794, '0071', '
', '2018-06-20 00:17:28.070337+03', 'You want subclasses in any package to have access to members of a superclass. Which is the most restrictive access that accomplishes this objective?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (796, '0073', '`
class A {
    protected int method1(int a, int b) {
        return 0;
    }
}`

', '2018-06-20 00:17:28.075544+03', 'Which is valid in a class that extends class A?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (798, '0085', '`
class Foo {
    class Bar{ }
}
class Test {
    public static void main (String [] args) {
        Foo f = new Foo();
        /* Line 10: Missing statement ? */
    }
}`

', '2018-06-20 00:17:28.080978+03', 'which statement, inserted at line 10, creates an instance of Bar?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (801, '0093', '`
1. The default constructor initialises method variables.
2. The default constructor has the same access as its class.
3. The default constructor invokes the no-arg constructor of the superclass.
4. If a class lacks a no-arg constructor, the compiler always creates a default constructor.
5. The compiler creates a default constructor only when there are no other constructors for the class.`

', '2018-06-20 00:17:28.08967+03', 'Which three statements are true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (804, '0113', '
', '2018-06-20 00:17:28.098808+03', 'Which is a valid declaration within an interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (806, '0133', '`
class Super {
    public Integer getLength() {
        return new Integer(4);
    }
}

public class Sub extends Super {
    public Long getLength() {
        return new Long(5);
    }

    public static void main(String[] args) {
        Super sooper = new Super();
        Sub sub = new Sub();
        System.out.println(
        sooper.getLength().toString() + "," + sub.getLength().toString() );
    }
}`

', '2018-06-20 00:17:28.105805+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (808, '0151', '`
final abstract class Test {}
public static interface Test {}
final public class Test {}
protected abstract class Test {}
protected interface Test {}
abstract public class Test {}
`

', '2018-06-20 00:17:28.112325+03', 'Which two of the following are legal declarations for nonnested classes and interfaces?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (810, '0158', '
', '2018-06-20 00:17:28.117929+03', 'Which statement is true about a static nested class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (849, '0046', '`
class Test {
    private Demo d;
    void start()
    {
        d = new Demo();
        this.takeDemo(d); /* Line 7 */
    } /* Line 8 */
    void takeDemo(Demo demo)
    {
        demo = null;
        demo = new Demo();
    }
}
`

', '2018-06-20 00:17:28.229317+03', 'When is the Demo object eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (772, '0126', '`
public class Test2 {
    public static int x;
    public static int foo(int y) {
        return y * 2;
    }
    public static void main(String [] args) {
        int z = 5;
        assert z > 0; /* Line 11 */
        assert z > 2: foo(z); /* Line 12 */
        if ( z < 7 )
            assert z > 4; /* Line 14 */

        switch (z) {
            case 4: System.out.println("4 ");
            case 5: System.out.println("5 ");
            default: assert z < 10;
        }

        if ( z < 10 )
            assert z > 4: z++; /* Line 22 */
        System.out.println(z);
    }
}`

', '2018-06-20 00:17:28.015951+03', 'Which line is an example of an inappropriate use of assertions?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (774, '0138', '`
class Exc0 extends Exception { }
class Exc1 extends Exc0 { } /* Line 2 */
public class Test {
    public static void main(String args[]) {
        try
        {
            throw new Exc1(); /* Line 9 */
        }
        catch (Exc0 e0) /* Line 11 */
        {
            System.out.println("Ex0 caught");
        }
        catch (Exception e)
        {
            System.out.println("exception caught");
        }
    }
}`

', '2018-06-20 00:17:28.020094+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (776, '0167', '
', '2018-06-20 00:17:28.028262+03', 'Which of the following statements is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (778, '0176', '`
public class X
{
    public static void main(String [] args)
    {
        try
        {
            badMethod(); /* Line 7 */
            System.out.print("A");
        }
        catch (Exception ex) /* Line 10 */
        {
            System.out.print("B"); /* Line 12 */
        }
        finally /* Line 14 */
        {
            System.out.print("C"); /* Line 16 */
        }
        System.out.print("D"); /* Line 18 */
    }
    public static void badMethod()
    {
        throw new RuntimeException();
    }
}`

', '2018-06-20 00:17:28.033744+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (780, '0200', '`
public class ExceptionTest
{
    class TestException extends Exception {}
    public void runTest() throws TestException {}
    public void test() /* Point X */
    {
        runTest();
    }
}`

', '2018-06-20 00:17:28.03808+03', 'At Point X on line 5, which code is necessary to make the code compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (782, '0007', '`class A {
    final int get(int a, int b) { return 0; }
}
class B extends A {
    int get(int a, int b) { return 1; }
}
public class Test07{
    public static void main(String args[])
    {
        B b = new B();
        System.out.println("a=" + b.get(0, 1));
    }`

', '2018-06-20 00:17:28.04341+03', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (784, '0033', '`
class A {
    A() {}
}

class B extends A { }
`

', '2018-06-20 00:17:28.048024+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (786, '0035', '`class Two {
     byte x;
 }

 class PassO {
     public static void main(String [] args) {
         PassO p = new PassO();
         p.start();
     }

     void start() {
         Two t = new Two();
         System.out.print(t.x + " ");
         Two t2 = fix(t);
         System.out.println(t.x + " " + t2.x);
     }

     Two fix(Two tt) {
         tt.x = 42;
         return tt;
     }
 }`

', '2018-06-20 00:17:28.052459+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (789, '0054', '`
public class Test {
    public static void main(String args[]) {
        class Foo {
            public int i = 3;
        }
        Object o = (Object)new Foo();
        Foo foo = (Foo)o;
        System.out.println("i = " + foo.i);
    }
}`

', '2018-06-20 00:17:28.059046+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (791, '0060', '
', '2018-06-20 00:17:28.063154+03', 'Which class does not override the equals() and hashCode() methods, inheriting them directly from class Object?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (793, '0064', '`
public class MyOuter {
    public static class MyInner {
        public static void foo() { }
    }
}`

', '2018-06-20 00:17:28.067826+03', 'which statement, if placed in a class other than MyOuter or MyInner, instantiates an instance of the nested class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (795, '0072', '`
interface Base {
    boolean m1 ();
    byte m2(short s);
}

1. interface Base2 implements Base {}
2. abstract class Class2 extends Base { public boolean m1(){ return true; }}
3. abstract class Class2 implements Base {}
4. abstract class Class2 implements Base { public boolean m1(){ return (7 > 4); }}
5. abstract class Class2 implements Base { protected boolean m1(){ return (5 > 7) }}
`

', '2018-06-20 00:17:28.072833+03', 'which two code fragments will compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (797, '0083', '`
class H {
    public static void main (String[] args) {
        Object x = new Vector().elements();
        System.out.print((x instanceof Enumeration)+",");
        System.out.print((x instanceof Iterator)+",");
        System.out.print(x instanceof ListIterator);
    }
}`

', '2018-06-20 00:17:28.078689+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (799, '0091', '
', '2018-06-20 00:17:28.083306+03', 'Given a method in a class, what access modifier do you use to restrict access to that method to only the other members of the same class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (800, '0092', '`
interface DoMath {
    double getArea(int rad);
}
interface MathPlus {
    double getVol(int b, int h);
}

1. class AllMath extends DoMath { double getArea(int r); }
2. interface AllMath implements MathPlus { double getVol(int x, int y); }
3. interface AllMath extends DoMath { float getAvg(int h, int l); }
4. class AllMath implements MathPlus { double getArea(int rad); }
5. abstract class AllMath implements DoMath, MathPlus { public double getArea(int rad) { return rad * rad * 3.14; } }`

', '2018-06-20 00:17:28.086581+03', 'which two code fragments inserted at end of the program, will allow to compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (802, '0111', '
', '2018-06-20 00:17:28.092397+03', 'What is the most restrictive access modifier that will allow members of one class to have access to members of another class in the same package?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (803, '0112', '
', '2018-06-20 00:17:28.095956+03', 'You want a class to have access to members of another class in the same package. Which is the most restrictive access that accomplishes this objective?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (805, '0129', '`
class Tree { }
class Pine extends Tree { }
class Oak extends Tree { }
public class Forest1 {
    public static void main (String [] args){
        Tree tree = new Pine();
        if( tree instanceof Pine )
            System.out.println ("Pine");
        else if( tree instanceof Tree )
            System.out.println ("Tree");
        else if( tree instanceof Oak )
            System.out.println ( "Oak" );
        else
            System.out.println ("Oops ");
    }
}`

', '2018-06-20 00:17:28.102663+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (807, '0150', '`
class A {
    public A(int x){}
}
class B extends A { }
public class test {
    public static void main (String args []) {
        A a = new B();
        System.out.println("complete");
    }
}`

', '2018-06-20 00:17:28.109924+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (809, '0157', '`
class Boo {
    Boo(String s) { }
    Boo() { }
}
class Bar extends Boo {
    Bar() { }
    Bar(String s) {super(s);}
    void zoo()
    {
    // insert code here
    }
}`

', '2018-06-20 00:17:28.115412+03', 'which one create an anonymous inner class from within class Bar?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (811, '0159', '
', '2018-06-20 00:17:28.12057+03', 'Which constructs an anonymous inner class instance?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (847, '0206', '`
Deadlock will not occur if wait()/notify() is used
A thread will resume execution as soon as its sleep duration expires.
Synchronization can prevent two objects from being accessed by the same thread.
The wait() method is overloaded to accept a duration.
The notify() method is overloaded to accept a duration.
Both wait() and notify() must be called from a synchronized context.
`

', '2018-06-20 00:17:28.225727+03', 'Which two statements are true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (812, '0160', '`
public class Test160 {
    public static void main (String [] args) {
        class Horse {
            public String name; // 1
            public Horse(String s) {
                name = s;
            }
        }
        Object obj = new Horse("Zippo"); // 2
        Horse h = (Horse) obj; // 3
        System.out.println(h.name);
    }
}`

', '2018-06-20 00:17:28.123043+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (813, '0161', '`
public abstract class AbstractTest {
    public int getNum() {
        return 45;
    }
    public abstract class Bar {
        public int getNum() {
            return 38;
        }
    }
    public static void main (String [] args) {
        AbstractTest t = new AbstractTest() {
            public int getNum() {
                return 22;
            }
        };
        AbstractTest.Bar f = t.new Bar() {
            public int getNum() {
                return 57;
            }
        };

        System.out.println(f.getNum() + " " + t.getNum());
    }
}`

', '2018-06-20 00:17:28.125879+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (815, '0171', '`
class Super{
    public int i = 0;

    public Super(String text) /* Line 4 */{
        i = 1;
    }
}

class Sub extends Super{
    public Sub(String text)
    {
        i = 2;
    }

    public static void main(String args[])
    {
        Sub sub = new Sub("Hello");
        System.out.println(sub.i);
    }
}`

', '2018-06-20 00:17:28.131172+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (816, '0172', '`
class Base
{
    Base()
    {
        System.out.print("Base");
    }
}
public class Alpha extends Base
{
    public static void main(String[] args)
    {
        new Alpha(); /* Line 12 */
        new Base(); /* Line 13 */
    }
}`

', '2018-06-20 00:17:28.134479+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (818, '0016', '`
public class X implements Runnable {
    public void run() {
        System.out.println("hello");
    }
}`
как запустить этот код ?
', '2018-06-20 00:17:28.140709+03', 'Есть код');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (820, '0018', '`class MyThread extends Thread {
     MyThread() {}
     MyThread(Runnable r) {super(r); }
     public void run() {
         System.out.print("Inside a Thread ");
     }
 }

 class MyRunnable implements Runnable {
     public void run() {
         System.out.print("Inside Runnable");
     }
 }

 class Test018 {
     public static void main(String[] args) {
         new MyThread().start();
         new MyThread(new MyRunnable()).start();
     }
 }
`
', '2018-06-20 00:17:28.152906+03', 'что будет результатом выполнения');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (822, '0065', '`
Thread(Runnable r, String name)
Thread()
Thread(int priority)
Thread(Runnable r, ThreadGroup g)
Thread(Runnable r, int priority)
`

', '2018-06-20 00:17:28.160166+03', 'Which two are valid constructors for Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (825, '0068', '
', '2018-06-20 00:17:28.169184+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (827, '0087', '
', '2018-06-20 00:17:28.177012+03', 'Which will contain the body of the thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (830, '0104', '
', '2018-06-20 00:17:28.184561+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (832, '0121', '`
public class SyncTest {
    public static void main (String [] args) {
        Thread t = new Thread() {
            Foo f = new Foo();
            public void run() {
                f.increase(20);
            }
        };
    t.start();
    }
}
class Foo {
    private int data = 23;
    public void increase(int amt) {
        int x = data;
        data = x + amt;
    }
}`

', '2018-06-20 00:17:28.189553+03', 'What will be the output of the program? and assuming that data must be protected from corruption, what ”if ....” can you add to the preceding code to ensure the integrity of data?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (834, '0123', '``

', '2018-06-20 00:17:28.19534+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (836, '0144', '
', '2018-06-20 00:17:28.199707+03', 'Which class or interface defines the wait(), notify(),and notifyAll() methods?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (838, '0146', '`
Extend java.lang.Thread and override the run() method.
Extend java.lang.Runnable and override the start() method.
Implement java.lang.Thread and implement the run() method.
Implement java.lang.Runnable and implement the run() method.
Implement java.lang.Thread and implement the start() method.
`

', '2018-06-20 00:17:28.20448+03', 'Which two can be used to create a new Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (840, '0162', '`
public class Q126 implements Runnable {
    private int x;
    private int y;

    public static void main(String [] args) {
        Q126 that = new Q126();
        (new Thread(that)).start( ); /* Line 8 */
        (new Thread(that)).start( ); /* Line 9 */
    }
    public synchronized void run( ) /* Line 11 */{
        for (;;) /* Line 13 */{
            x++;
            y++;
            System.out.println("x = " + x + "y = " + y);
        }
    }
}`

', '2018-06-20 00:17:28.2093+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (843, '0165', '`
public class Test165 implements Runnable {
    private int x;
    private int y;

    public synchronized void run() {
        for(int i = 0; i < 10; i++) {
            x++; y++;
            System.out.println("x = " + x + ", y = " + y);
        }
    }

    public static void main(String p[]) {
        Test165 that = new Test165();
        (new Thread(that)).start();
        (new Thread(that)).start();
    }
}`

', '2018-06-20 00:17:28.217534+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (844, '0174', '`
You can extend the Runnable interface as long as you override the public run() method.
The class must contain a method called run() from which all code for that thread will be initiated.
The class must contain an empty public void method named run().
The class must contain a public void method named runnable().
The class definition must include the words implements Threads and contain a method called run().
The mandatory method must be public, with a return type of void, must be called run(), and cannot take any arguments.
`

', '2018-06-20 00:17:28.21992+03', 'Which two statements are true for any concrete class implementing the java.lang.Runnable interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (846, '0205', '
', '2018-06-20 00:17:28.224072+03', 'Which method must be defined by a class implementing the java.lang.Runnable interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (848, '0045', '`
class Bar { }
class Test {
    Bar doBar() {
        Bar b = new Bar(); // 6
        return b; // 7
    }
    public static void main (String args[]) {
        Test t = new Test();  // 11
        Bar newBar = t.doBar();  // 12
        System.out.println("newBar");
        newBar = new Bar(); // 14
        System.out.println("finishing"); // 15
    }
}
`

', '2018-06-20 00:17:28.227509+03', 'At what point is the Bar object, created on line 6, eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (850, '0047', '`
public class X {
    public static void main(String [] args)
    {
        X x = new X();
        X x2 = m1(x); /* Line 6 */
        X x4 = new X();
        x2 = x4; /* Line 8 */
        doComplexStuff();
    }
    static X m1(X mx)
    {
        mx = new X();
        return mx;
    }
}
`

', '2018-06-20 00:17:28.231315+03', 'After line 8 runs. how many objects are eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (852, '0105', '
', '2018-06-20 00:17:28.235721+03', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (854, '0166', '
', '2018-06-20 00:17:28.240365+03', 'What allows the programmer to destroy an object x?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (856, '0182', '``

', '2018-06-20 00:17:28.24522+03', 'Which method registers a thread in a thread scheduler?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (858, '0184', '`
void start() {
    A a = new A();
    B b = new B();
    a.s(b);
    b = null; /* Line 5 */
    a = null;  /* Line 6 */
    System.out.println("start completed"); /* Line 7 */
}
`

', '2018-06-20 00:17:28.249157+03', 'When is the B object, created in line 3, eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (814, '0168', '`
public class WrapTest {
    public static void main(String [] args) {
        int result = 0;
        short s = 42;
        Long x = new Long("42");
        Long y = new Long(42);
        Short z = new Short("42");
        Short x2 = new Short(s);
        Integer y2 = new Integer("42");
        Integer z2 = new Integer(42);

        if (x == y) /* Line 13 */
            result = 1;
        if (x.equals(y) ) /* Line 15 */
            result = result + 10;
        if (x.equals(z) ) /* Line 17 */
            result = result + 100;
        if (x.equals(x2) ) /* Line 19 */
            result = result + 1000;
        if (x.equals(z2) ) /* Line 21 */
            result = result + 10000;
       System.out.println("result = " + result);
    }
}`

', '2018-06-20 00:17:28.12843+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (817, '0173', '`
import java.util.*;
public class NewTreeSet2 extends NewTreeSet
{
    public static void main(String [] args)
    {
        NewTreeSet2 t = new NewTreeSet2();
        t.count();
    }
}
protected class NewTreeSet
{
    void count()
    {
        for (int x = 0; x < 7; x++,x++ )
        {
            System.out.print(" " + x);
        }
    }
}`

', '2018-06-20 00:17:28.137302+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (819, '0017', '`
public class Test017 extends Thread {
    public static void main(String [] args) {
        Test017 t = new Test017();
        t.start();
        System.out.print("one. ");
        t.start();
        System.out.print("two. ");
    }

    public void run() {
        System.out.print("Thread ");
    }
}`
', '2018-06-20 00:17:28.144116+03', 'что будет результатом выполнения');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (821, '0019', '`
public class Test019 implements Runnable {
    int x, y;
    public void run() {
        for(int i = 0; i < 1000; i++)
            synchronized(this) {
                x = 11;
                y = 11;
            }
        System.out.print(x + " " + y + " ");
    }

    public static void main(String args[]) {
        Test019 run = new Test019();
        Thread t1 = new Thread(run);
        Thread t2 = new Thread(run);
        t1.start();
        t2.start();
    }
}`
', '2018-06-20 00:17:28.15611+03', 'что напечатает программа');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (823, '0066', '`
start()
wait()
notify()
run()
terminate()
`

', '2018-06-20 00:17:28.162934+03', 'Which two of the following methods are defined in class Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (824, '0067', '`
1. When an interrupted exception occurs.
2. When a thread of higher priority is ready (becomes runnable).
3. When the thread creates a new thread.
4. When the stop() method is called.`

', '2018-06-20 00:17:28.166146+03', 'Under which conditions will a currently executing thread stop?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (826, '0086', '
`
1. yield()
2. wait()
3. notify()
4. notifyAll()
5. sleep(1000)
6. aLiveThread.join()
7. Thread.killThread()
`

', '2018-06-20 00:17:28.172164+03', 'Which three guarantee that a thread will leave the running state?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (828, '0102', '`
public class Test102 extends Thread {
    final StringBuffer sb1 = new StringBuffer();
    final StringBuffer sb2 = new StringBuffer();

    public static void main(String args[]) {
        final Test102 h = new Test102();

        new Thread() {
            public void run() {
                synchronized(this) {
                    h.sb1.append("A");
                    h.sb2.append("B");
                    System.out.print(h.sb1);
                    System.out.print(h.sb2);
                }
            }
        }.start();

        new Thread() {
            public void run() {
                synchronized(this) {
                    h.sb1.append("D");
                    h.sb2.append("C");
                    System.out.print(h.sb2);
                    System.out.print(h.sb1);
                }
            }
        }.start();
    }
}`

', '2018-06-20 00:17:28.17957+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (829, '0103', '`
class MyThread extends Thread {
    public static void main(String [] args) {
        MyThread t = new MyThread();
        Thread x = new Thread(t);
        x.start(); /* Line 7 */
    }
    public void run() {
        for(int i = 0; i < 3; ++i) {
            System.out.print(i + "..");
        }
    }
}`

', '2018-06-20 00:17:28.182102+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (831, '0120', '
', '2018-06-20 00:17:28.187114+03', 'Which of the following will not directly cause a thread to stop?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (833, '0122', '`
class Test122  {
static final StringBuffer sb1 = new StringBuffer();
static final StringBuffer sb2 = new StringBuffer();
public static void main(String[] args) {
    new Thread() {
        public void run() {
            synchronized(sb1) {
                sb1.append("A");
                sb2.append("B");
            }
        }
    }.start();

    new Thread() {
        public void run() {
            synchronized(sb1) {
                sb1.append("C");
                sb2.append("D");
            }
        }
    }.start(); /* Line 28 */

    System.out.println (sb1 + " " + sb2);
    }
}`

', '2018-06-20 00:17:28.192726+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (835, '0143', '
', '2018-06-20 00:17:28.197598+03', 'Which of the following will directly stop the execution of a Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (837, '0145', '`
public class ThreadDemo {
    private int count = 1;
    public synchronized void doSomething() {
        for (int i = 0; i < 10; i++)
            System.out.println(count++);
    }
    public static void main(String[] args) {
        ThreadDemo demo = new ThreadDemo();
        Thread a1 = new A(demo);
        Thread a2 = new A(demo);
        a1.start();
        a2.start();
    }
}
class A extends Thread {
    ThreadDemo demo;
    public A(ThreadDemo td) {
        demo = td;
    }
    public void run() {
        demo.doSomething();
    }
}`

', '2018-06-20 00:17:28.2019+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (839, '0147', '`
Runnable target = new MyRunnable();
Thread myThread = new Thread(target);
`
Which of the following classes can be used to create the target, so that the preceding code compiles correctly?

', '2018-06-20 00:17:28.207058+03', 'The following block of code creates a Thread using a Runnable target:');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (841, '0163', '`
class MyThread extends Thread {
    public static void main(String [] args) {
        MyThread t = new MyThread(); /* Line 5 */
        t.run();  /* Line 6 */
    }

    public void run() {
        for(int i=1; i < 3; ++i)
        {
            System.out.print(i + "..");
        }
    }
}`

', '2018-06-20 00:17:28.211629+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (842, '0164', '`
public class ThreadTest extends Thread {
    public void run() {
        System.out.println("In run");
        yield();
        System.out.println("Leaving run");
    }
    public static void main(String []argv) {
        (new ThreadTest()).start();
    }
}`

', '2018-06-20 00:17:28.215038+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (845, '0189', '`
public class Test
{
    public static void main(String[] args)
    {
        final StringBuffer a = new StringBuffer();
        final StringBuffer b = new StringBuffer();

        new Thread()
        {
            public void run()
            {
                System.out.print(a.append("A"));
                synchronized(b)
                {
                    System.out.print(b.append("B"));
                }
            }
        }.start();

        new Thread()
        {
            public void run()
            {
                System.out.print(b.append("C"));
                synchronized(a)
                {
                    System.out.print(a.append("D"));
                }
            }
        }.start();
    }
}`

', '2018-06-20 00:17:28.222219+03', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (851, '0069', '`
public Object m() {
    Object o = new Float(3.14F);
    Object[] oa = new Object[l];
    oa[0] = o; /* Line 5 */
    o = null;  /* Line 6 */
    oa[0] = null; /* Line 7 */
    return o; /* Line 8 */
}`

', '2018-06-20 00:17:28.233524+03', 'garbage collector');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (859, '0185', '`
class X2
{
    public X2 x;
    public static void main(String [] args)
    {
        X2 x2 = new X2();  /* Line 6 */
        X2 x3 = new X2();  /* Line 7 */
        x2.x = x3;
        x3.x = x2;
        x2 = new X2();
        x3 = x2; /* Line 11 */
        doComplexStuff();
    }
}`

', '2018-06-20 00:17:28.251335+03', 'after line 11 runs, how many objects are eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (860, '0030', '`
public class Quizz5 {
    public static void main(String[] args) {
        ArrayList<Integer> a = new ArrayList<>();
        System.out.println(a.getClass().getSimpleName());

        Set<Integer> s = new HashSet<Integer>();
        System.out.println(s.getClass().getSimpleName());

        Map<Integer, String> x1 = new HashMap<>();
        System.out.println(x1.getClass().getSimpleName());

        Map<Integer, String> x = new HashMap<Integer, String>() {{
            put(1, "A");
            put(2, "B");
            put(3, "C");
        }};
        System.out.println(x.getClass().getSimpleName());
        System.out.println(x.getClass().getName());
        Map<Integer, String> x2 = new HashMap<Integer, String>() {{
            put(1, "A");
            put(2, "B");
            put(3, "C");
        }};
        System.out.println(x2.getClass().getName());
    }
}`', '2018-06-20 00:17:28.254022+03', 'What will be printed');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (650, '0001', '`         int i=3;
         if (i<5) {
             System.out.print("A");
         } if (i<10) {
             System.out.print("B");
         }`', '2018-06-20 00:17:27.494078+03', 'что будет распечатано при попытке выполнить следующий код?');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (1, 'Dima', '2018-06-09 17:08:25.976', 'a1', 'p1', 2);
INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (2, 'Masha', '2018-06-09 17:08:29.856', 'a2', 'p2', 2);
INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (3, 'Ira', '2018-06-09 17:08:31.748', 'a3', 'p3', 2);
INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (4, 'Alex', '2018-06-09 17:08:34.014', 'a4', 'p4', 2);
INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (8, 'Alex Rykhalskiy', '2018-07-02 21:43:32.387793', 'alexey.rykhalskiy@gmail.com', 'Z9T9hpjpwiY0sfM9gpSaeg==', 6);
INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (9, 'Dima', '2018-07-02 22:40:35.420593', 'dima@gmail.com', '37N2MWK0D8KLepiKVRcV8Q==', 4);
INSERT INTO public.users (u_id, u_name, u_regdate, u_login, u_passwd, u_group) VALUES (10, 'Romario', '2018-07-03 14:25:02.014821', 'roma@x', 'S9yYXLxfqiNkxJWcgTIB8w==', 3);


--
-- Name: answers_a_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answers_a_id_seq', 3464, true);


--
-- Name: groups_g_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_g_id_seq', 7, true);


--
-- Name: process_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.process_p_id_seq', 28, true);


--
-- Name: questions_q_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_q_id_seq', 860, true);


--
-- Name: users_u_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_u_id_seq', 10, true);


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
-- Name: users users_u_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_u_id_pk PRIMARY KEY (u_id);


--
-- PostgreSQL database dump complete
--

