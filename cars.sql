--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    make character varying(50) NOT NULL,
    bhp numeric NOT NULL,
    avatar_url character varying(100) DEFAULT 'https://static.thenounproject.com/png/449586-200.png'::character varying NOT NULL,
    owner integer
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- Name: cars2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars2 (
    id integer NOT NULL,
    name character varying(30),
    bhp numeric,
    avatar_url character varying(100) DEFAULT 'https://static.thenounproject.com/png/449586-200.png'::character varying
);


ALTER TABLE public.cars2 OWNER TO postgres;

--
-- Name: cars2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars2_id_seq OWNER TO postgres;

--
-- Name: cars2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars2_id_seq OWNED BY public.cars2.id;


--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_id_seq OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- Name: fish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price numeric NOT NULL,
    owner integer
);


ALTER TABLE public.fish OWNER TO postgres;

--
-- Name: fish_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fish_id_seq OWNER TO postgres;

--
-- Name: fish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fish_id_seq OWNED BY public.fish.id;


--
-- Name: fishermen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fishermen (
    id integer NOT NULL,
    name character varying(30),
    age numeric
);


ALTER TABLE public.fishermen OWNER TO postgres;

--
-- Name: fishermen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fishermen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fishermen_id_seq OWNER TO postgres;

--
-- Name: fishermen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fishermen_id_seq OWNED BY public.fishermen.id;


--
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_id_seq OWNER TO postgres;

--
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- Name: cars2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars2 ALTER COLUMN id SET DEFAULT nextval('public.cars2_id_seq'::regclass);


--
-- Name: fish id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish ALTER COLUMN id SET DEFAULT nextval('public.fish_id_seq'::regclass);


--
-- Name: fishermen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fishermen ALTER COLUMN id SET DEFAULT nextval('public.fishermen_id_seq'::regclass);


--
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, make, bhp, avatar_url, owner) FROM stdin;
3	james	1	https://static.thenounproject.com/png/449586-200.png	\N
4	james	1	https://static.thenounproject.com/png/449586-200.png	\N
\.


--
-- Data for Name: cars2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars2 (id, name, bhp, avatar_url) FROM stdin;
2	ferarri	800	https://static.thenounproject.com/png/449586-200.png
17	Bugatti Chiron	1024	https://cdn.motor1.com/images/mgl/xW8K2/s1/bugatti-chiron-pur-sport.jpg
\.


--
-- Data for Name: fish; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish (id, name, price, owner) FROM stdin;
1	cod	500	1
2	monkfish	500	2
4	haddock	400	2
5	monkfish2	700	2
\.


--
-- Data for Name: fishermen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fishermen (id, name, age) FROM stdin;
1	Robert	38
2	James	43
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, name) FROM stdin;
1	James Sherry
2	Robert Sherry
\.


--
-- Name: cars2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars2_id_seq', 17, true);


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 4, true);


--
-- Name: fish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fish_id_seq', 5, true);


--
-- Name: fishermen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fishermen_id_seq', 2, true);


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 2, true);


--
-- Name: cars2 cars2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars2
    ADD CONSTRAINT cars2_pkey PRIMARY KEY (id);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: fish fish_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_pkey PRIMARY KEY (id);


--
-- Name: fishermen fishermen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fishermen
    ADD CONSTRAINT fishermen_pkey PRIMARY KEY (id);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: cars cars_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_owner_fkey FOREIGN KEY (owner) REFERENCES public.owners(id);


--
-- Name: fish fish_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_owner_fkey FOREIGN KEY (owner) REFERENCES public.fishermen(id);


--
-- PostgreSQL database dump complete
--

