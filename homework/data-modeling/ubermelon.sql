--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

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
-- Name: customers; Type: TABLE; Schema: public; Owner: judyjiang
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying,
    address character varying,
    phone character varying
);


ALTER TABLE public.customers OWNER TO judyjiang;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: judyjiang
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO judyjiang;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: judyjiang
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: melon_types; Type: TABLE; Schema: public; Owner: judyjiang
--

CREATE TABLE public.melon_types (
    type_code character varying NOT NULL,
    type_name character varying,
    max_slices integer
);


ALTER TABLE public.melon_types OWNER TO judyjiang;

--
-- Name: melons; Type: TABLE; Schema: public; Owner: judyjiang
--

CREATE TABLE public.melons (
    melon_id integer NOT NULL,
    type_code character varying,
    arrived_at timestamp without time zone,
    storage_id integer,
    slices_in integer
);


ALTER TABLE public.melons OWNER TO judyjiang;

--
-- Name: melons_melon_id_seq; Type: SEQUENCE; Schema: public; Owner: judyjiang
--

CREATE SEQUENCE public.melons_melon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.melons_melon_id_seq OWNER TO judyjiang;

--
-- Name: melons_melon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: judyjiang
--

ALTER SEQUENCE public.melons_melon_id_seq OWNED BY public.melons.melon_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: judyjiang
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    ordered_at timestamp without time zone,
    customer_id integer
);


ALTER TABLE public.orders OWNER TO judyjiang;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: judyjiang
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO judyjiang;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: judyjiang
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: judyjiang
--

CREATE TABLE public.slices (
    slice_id integer NOT NULL,
    melon_id integer,
    order_id integer,
    quantity integer
);


ALTER TABLE public.slices OWNER TO judyjiang;

--
-- Name: slices_slice_id_seq; Type: SEQUENCE; Schema: public; Owner: judyjiang
--

CREATE SEQUENCE public.slices_slice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slices_slice_id_seq OWNER TO judyjiang;

--
-- Name: slices_slice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: judyjiang
--

ALTER SEQUENCE public.slices_slice_id_seq OWNED BY public.slices.slice_id;


--
-- Name: storage_spaces; Type: TABLE; Schema: public; Owner: judyjiang
--

CREATE TABLE public.storage_spaces (
    storage_id integer NOT NULL,
    capacity integer
);


ALTER TABLE public.storage_spaces OWNER TO judyjiang;

--
-- Name: storage_spaces_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: judyjiang
--

CREATE SEQUENCE public.storage_spaces_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_spaces_storage_id_seq OWNER TO judyjiang;

--
-- Name: storage_spaces_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: judyjiang
--

ALTER SEQUENCE public.storage_spaces_storage_id_seq OWNED BY public.storage_spaces.storage_id;


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: melons melon_id; Type: DEFAULT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.melons ALTER COLUMN melon_id SET DEFAULT nextval('public.melons_melon_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: slices slice_id; Type: DEFAULT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.slices ALTER COLUMN slice_id SET DEFAULT nextval('public.slices_slice_id_seq'::regclass);


--
-- Name: storage_spaces storage_id; Type: DEFAULT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.storage_spaces ALTER COLUMN storage_id SET DEFAULT nextval('public.storage_spaces_storage_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: judyjiang
--

COPY public.customers (customer_id, name, address, phone) FROM stdin;
1	Ryan Lindsey	9644 John Alley Apt. 581\nWest Bradleyville, ME 43655	(791)051-5332
2	Alexander Andrade	5191 Terri Mount Suite 151\nMccormickport, WI 93782	+1-004-555-0979
3	David Perez	Unit 9407 Box 8737\nDPO AA 32179	1444290366
4	Eric Kelly DVM	67101 Aaron Walks Apt. 539\nMcmahonburgh, WV 54935	001-220-947-6504x4727
5	Lindsey Braun	1580 James Court\nWest Megan, IA 47643	683-573-2253
\.


--
-- Data for Name: melon_types; Type: TABLE DATA; Schema: public; Owner: judyjiang
--

COPY public.melon_types (type_code, type_name, max_slices) FROM stdin;
cas	Casaba	10
cren	Crenshaw	25
wat	Watermelon	50
\.


--
-- Data for Name: melons; Type: TABLE DATA; Schema: public; Owner: judyjiang
--

COPY public.melons (melon_id, type_code, arrived_at, storage_id, slices_in) FROM stdin;
1	cas	2021-08-16 00:00:00	11	5
2	cas	2021-07-29 00:00:00	3	5
3	cas	2021-07-25 00:00:00	16	5
4	wat	2021-07-28 00:00:00	19	33
5	cren	2021-07-26 00:00:00	18	23
6	cren	2021-07-19 00:00:00	2	15
7	cren	2021-08-08 00:00:00	16	13
8	cas	2021-08-02 00:00:00	16	8
9	wat	2021-08-15 00:00:00	14	38
10	cas	2021-07-29 00:00:00	10	10
11	wat	2021-08-10 00:00:00	12	26
12	wat	2021-07-23 00:00:00	11	36
13	wat	2021-07-27 00:00:00	10	44
14	cas	2021-07-20 00:00:00	17	10
15	cren	2021-08-13 00:00:00	5	17
16	cas	2021-08-03 00:00:00	10	7
17	cas	2021-07-23 00:00:00	11	7
18	cas	2021-07-26 00:00:00	3	5
19	cas	2021-08-12 00:00:00	14	6
20	wat	2021-07-29 00:00:00	18	28
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: judyjiang
--

COPY public.orders (order_id, ordered_at, customer_id) FROM stdin;
1	2021-08-12 00:00:00	1
2	2021-08-13 00:00:00	1
3	2021-08-11 00:00:00	1
4	2021-08-15 00:00:00	2
5	2021-08-15 00:00:00	2
6	2021-08-16 00:00:00	2
7	2021-08-13 00:00:00	3
8	2021-08-15 00:00:00	3
9	2021-08-11 00:00:00	3
10	2021-08-13 00:00:00	4
11	2021-08-13 00:00:00	4
12	2021-08-12 00:00:00	4
13	2021-08-11 00:00:00	5
14	2021-08-15 00:00:00	5
15	2021-08-13 00:00:00	5
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: judyjiang
--

COPY public.slices (slice_id, melon_id, order_id, quantity) FROM stdin;
1	15	1	6
2	19	1	5
3	20	2	14
4	1	2	3
5	17	3	3
6	9	3	25
7	17	4	6
8	4	4	30
9	8	5	3
10	19	5	4
11	1	6	3
12	11	6	26
13	19	7	1
14	5	7	17
15	7	8	3
16	15	8	15
17	2	9	1
18	16	9	3
19	2	10	4
20	7	10	9
21	12	11	34
22	11	11	7
23	9	12	34
24	11	12	26
25	14	13	10
26	17	13	2
27	12	14	28
28	10	14	5
29	9	15	36
30	11	15	6
\.


--
-- Data for Name: storage_spaces; Type: TABLE DATA; Schema: public; Owner: judyjiang
--

COPY public.storage_spaces (storage_id, capacity) FROM stdin;
1	500
2	500
3	500
4	500
5	500
6	500
7	500
8	500
9	500
10	500
11	500
12	500
13	500
14	500
15	500
16	500
17	500
18	500
19	500
20	500
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: judyjiang
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 5, true);


--
-- Name: melons_melon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: judyjiang
--

SELECT pg_catalog.setval('public.melons_melon_id_seq', 20, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: judyjiang
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 15, true);


--
-- Name: slices_slice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: judyjiang
--

SELECT pg_catalog.setval('public.slices_slice_id_seq', 30, true);


--
-- Name: storage_spaces_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: judyjiang
--

SELECT pg_catalog.setval('public.storage_spaces_storage_id_seq', 20, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: melon_types melon_types_pkey; Type: CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.melon_types
    ADD CONSTRAINT melon_types_pkey PRIMARY KEY (type_code);


--
-- Name: melons melons_pkey; Type: CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.melons
    ADD CONSTRAINT melons_pkey PRIMARY KEY (melon_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (slice_id);


--
-- Name: storage_spaces storage_spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.storage_spaces
    ADD CONSTRAINT storage_spaces_pkey PRIMARY KEY (storage_id);


--
-- Name: melons melons_storage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.melons
    ADD CONSTRAINT melons_storage_id_fkey FOREIGN KEY (storage_id) REFERENCES public.storage_spaces(storage_id);


--
-- Name: melons melons_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.melons
    ADD CONSTRAINT melons_type_code_fkey FOREIGN KEY (type_code) REFERENCES public.melon_types(type_code);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: slices slices_melon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_melon_id_fkey FOREIGN KEY (melon_id) REFERENCES public.melons(melon_id);


--
-- Name: slices slices_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: judyjiang
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- PostgreSQL database dump complete
--

