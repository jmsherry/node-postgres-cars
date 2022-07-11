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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: owners; Type: TABLE; Schema: public; Owner: jamessherry
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50)
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
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: jamessherry
--

COPY public.owners (id, name, email) FROM stdin;
1	tom	tom@yahoo.com
2	jane	jane@gmail.com
3	adam	adam@yahoo.com
4	andy	andy@gmail.com
\.


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: jamessherry
--

COPY public.pets (id, name, type, weight, owner) FROM stdin;
2	fluffytail	rabbit	2.1	1
3	fido	dog	23.2	3
4	rover	dog	44.6	2
5	whiskers	cat	4.5	3
6	shergar	horse	600	1
7	squealer	pig	300	1
1	tiddles	cat	4	2
\.


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamessherry
--

SELECT pg_catalog.setval('public.owners_id_seq', 4, true);


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamessherry
--

SELECT pg_catalog.setval('public.pets_id_seq', 8, true);


--
-- Name: owners owners_email_key; Type: CONSTRAINT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_email_key UNIQUE (email);


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
-- Name: pets fk_owner; Type: FK CONSTRAINT; Schema: public; Owner: jamessherry
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT fk_owner FOREIGN KEY (owner) REFERENCES public.pets(id);


--
-- PostgreSQL database dump complete
--

