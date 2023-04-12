--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: fish; Type: TABLE; Schema: public; Owner: jamessherry
--

CREATE TABLE public.fish (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.fish OWNER TO jamessherry;

--
-- Name: fish_id_seq; Type: SEQUENCE; Schema: public; Owner: jamessherry
--

CREATE SEQUENCE public.fish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fish_id_seq OWNER TO jamessherry;

--
-- Name: fish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamessherry
--

ALTER SEQUENCE public.fish_id_seq OWNED BY public.fish.id;


--
-- Name: owners; Type: TABLE; Schema: public; Owner: jamessherry
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.owners OWNER TO jamessherry;

--
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: jamessherry
--

CREATE SEQUENCE public.owners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_id_seq OWNER TO jamessherry;

--
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamessherry
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- Name: pets; Type: TABLE; Schema: public; Owner: jamessherry
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    weight numeric,
    owner integer
);


ALTER TABLE public.pets OWNER TO jamessherry;

--
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: jamessherry
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pets_id_seq OWNER TO jamessherry;

--
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamessherry
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- Name: cars2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars2 ALTER COLUMN id SET DEFAULT nextval('public.cars2_id_seq'::regclass);


--
-- Name: fish id; Type: DEFAULT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.fish ALTER COLUMN id SET DEFAULT nextval('public.fish_id_seq'::regclass);


--
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, make, bhp, avatar_url, owner) FROM stdin;
3	james	1	https://static.thenounproject.com/png/449586-200.png	\N
4	james	1	https://static.thenounproject.com/png/449586-200.png	\N
5	mini	234	https://static.thenounproject.com/png/449586-200.png	\N
6	citroen	234	https://static.thenounproject.com/png/449586-200.png	2
\.


--
-- Data for Name: cars2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars2 (id, name, bhp, avatar_url) FROM stdin;
2	ferarri	800	https://static.thenounproject.com/png/449586-200.png
17	Bugatti Chiron	1024	https://cdn.motor1.com/images/mgl/xW8K2/s1/bugatti-chiron-pur-sport.jpg
\.


--
-- Data for Name: fish; Type: TABLE DATA; Schema: public; Owner: jamessherry
--

COPY public.fish (id, name, price) FROM stdin;
2	cod	500
3	haddock	400
4	monkfish	700
5	cod	500
6	haddock	400
7	monkfish	700
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: jamessherry
--

COPY public.owners (id, name) FROM stdin;
1	James Sherry
2	Robert Sherry
\.


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: jamessherry
--

COPY public.pets (id, name, type, weight, owner) FROM stdin;
\.


--
-- Name: cars2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars2_id_seq', 17, true);


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 9, true);


--
-- Name: fish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamessherry
--

SELECT pg_catalog.setval('public.fish_id_seq', 7, true);


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamessherry
--

SELECT pg_catalog.setval('public.owners_id_seq', 2, true);


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamessherry
--

SELECT pg_catalog.setval('public.pets_id_seq', 8, true);


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
-- Name: fish fish_pkey; Type: CONSTRAINT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_pkey PRIMARY KEY (id);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- Name: cars cars_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_owner_fkey FOREIGN KEY (owner) REFERENCES public.owners(id);


--
-- Name: pets fk_owner; Type: FK CONSTRAINT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT fk_owner FOREIGN KEY (owner) REFERENCES public.pets(id);


--
-- PostgreSQL database dump complete
--

