--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    middle_name text
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: installs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.installs (
    pc_id integer NOT NULL,
    soft_id integer NOT NULL
);


ALTER TABLE public.installs OWNER TO postgres;

--
-- Name: pcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pcs (
    id integer NOT NULL,
    employee_id integer,
    room_id integer NOT NULL,
    note text,
    ip_addr inet NOT NULL,
    mac_addr macaddr NOT NULL
);


ALTER TABLE public.pcs OWNER TO postgres;

--
-- Name: pcs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pcs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pcs_id_seq OWNER TO postgres;

--
-- Name: pcs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pcs_id_seq OWNED BY public.pcs.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    num integer NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: software; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.software (
    id integer NOT NULL,
    name text NOT NULL,
    version text,
    expires timestamp without time zone
);


ALTER TABLE public.software OWNER TO postgres;

--
-- Name: software_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.software_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_id_seq OWNER TO postgres;

--
-- Name: software_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.software_id_seq OWNED BY public.software.id;


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: pcs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcs ALTER COLUMN id SET DEFAULT nextval('public.pcs_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: software id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software ALTER COLUMN id SET DEFAULT nextval('public.software_id_seq'::regclass);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, name, surname, middle_name) FROM stdin;
1	Артур	Марков	Максимович
2	Максим	Смирнова	Сергеевич
3	Максим	Марков	Александрович
4	Анна	Потапов	Александровна
5	Анна	Гришина	Александровна
6	Михаил	Потапов	Даниилович
7	Михаил	Гришина	Данииловна
8	Анна	Дроздова	Александрович
9	Илья	Егоров	Лукинична
10	Илья	Потапов	Лукинична
\.


--
-- Data for Name: installs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.installs (pc_id, soft_id) FROM stdin;
15	4
13	4
20	2
27	3
8	3
3	3
14	1
17	1
2	5
16	4
30	2
1	1
24	5
30	1
18	4
7	1
28	4
28	4
11	5
8	4
17	5
17	2
4	3
7	1
10	5
29	5
29	1
26	4
7	1
30	1
11	1
5	4
10	4
18	1
16	2
16	3
20	1
3	5
13	3
25	2
21	3
7	3
18	4
11	3
17	2
9	1
26	2
13	4
16	4
17	2
20	2
27	4
24	2
17	4
26	1
18	5
7	4
9	3
4	5
16	5
\.


--
-- Data for Name: pcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pcs (id, employee_id, room_id, note, ip_addr, mac_addr) FROM stdin;
1	7	8	Большая царапина сверху	192.168.1.238	00:16:3e:6b:09:bb
2	1	11	Обновили в прошлом году	192.168.1.79	00:16:3e:29:37:96
3	3	6	Большая царапина сверху	192.168.1.167	00:16:3e:1b:ee:e5
4	4	9	Работает так себе	192.168.1.120	00:16:3e:48:20:47
5	7	15	Заберу себе, когда спишут	192.168.1.178	00:16:3e:42:25:90
6	4	5	Большая царапина сверху	192.168.1.145	00:16:3e:76:15:04
7	2	4	Работает так себе	192.168.1.62	00:16:3e:30:f7:04
8	3	8	Обновили в прошлом году	192.168.1.118	00:16:3e:38:7a:02
9	2	6	Работает так себе	192.168.1.244	00:16:3e:10:50:fb
10	10	12	Работает так себе	192.168.1.251	00:16:3e:3a:96:12
11	4	8	Большая царапина сверху	192.168.1.229	00:16:3e:1b:62:48
12	6	10	Работает так себе	192.168.1.242	00:16:3e:73:92:ba
13	8	13	Работает так себе	192.168.1.17	00:16:3e:68:f6:f1
14	9	12	Большая царапина сверху	192.168.1.29	00:16:3e:01:9d:51
15	6	1	Большая царапина сверху	192.168.1.215	00:16:3e:0d:90:a0
16	6	8	Заберу себе, когда спишут	192.168.1.112	00:16:3e:4f:49:77
17	9	1	Заберу себе, когда спишут	192.168.1.210	00:16:3e:37:1f:9e
18	4	9	Заберу себе, когда спишут	192.168.1.60	00:16:3e:6e:6b:ed
19	5	11	Работает так себе	192.168.1.45	00:16:3e:46:57:4a
20	2	12	Большая царапина сверху	192.168.1.194	00:16:3e:70:54:92
21	4	5	Как такое можно было вообще закупить	192.168.1.15	00:16:3e:53:9b:e7
22	1	9	Большая царапина сверху	192.168.1.173	00:16:3e:39:98:fa
23	9	8	Замена в следующем году	192.168.1.126	00:16:3e:54:88:01
24	9	1	Как такое можно было вообще закупить	192.168.1.241	00:16:3e:52:ea:64
25	7	9	Замена в следующем году	192.168.1.216	00:16:3e:2a:6c:ac
26	8	2	Заберу себе, когда спишут	192.168.1.231	00:16:3e:24:d2:0f
27	8	12	Обновили в прошлом году	192.168.1.4	00:16:3e:7d:f2:47
28	4	12	Замена в следующем году	192.168.1.71	00:16:3e:74:e7:3e
29	7	12	Замена в следующем году	192.168.1.126	00:16:3e:0b:0a:ac
30	5	8	Большая царапина сверху	192.168.1.73	00:16:3e:12:60:34
31	6	2	Заберу себе, когда спишут	192.168.1.39	00:16:3e:2b:f0:2e
32	6	2	Работает так себе	192.168.1.134	00:16:3e:4e:47:c6
33	10	14	Заберу себе, когда спишут	192.168.1.226	00:16:3e:78:bd:41
34	1	8	Замена в следующем году	192.168.1.202	00:16:3e:6f:99:71
35	2	10	Большая царапина сверху	192.168.1.78	00:16:3e:56:83:1a
36	6	9	Обновили в прошлом году	192.168.1.193	00:16:3e:4d:07:12
37	9	2	Замена в следующем году	192.168.1.45	00:16:3e:7d:be:c7
38	8	10	Большая царапина сверху	192.168.1.146	00:16:3e:75:a0:f2
39	9	13	Большая царапина сверху	192.168.1.74	00:16:3e:58:02:17
40	4	15	Большая царапина сверху	192.168.1.170	00:16:3e:07:5b:f0
41	2	11	Большая царапина сверху	192.168.1.54	00:16:3e:0a:bc:b5
42	6	11	Большая царапина сверху	192.168.1.124	00:16:3e:36:7b:9b
43	6	4	Замена в следующем году	192.168.1.20	00:16:3e:20:b2:79
44	8	14	Как такое можно было вообще закупить	192.168.1.139	00:16:3e:3b:72:98
45	1	10	Замена в следующем году	192.168.1.171	00:16:3e:0f:12:46
46	4	11	Как такое можно было вообще закупить	192.168.1.200	00:16:3e:15:94:e8
47	3	10	Обновили в прошлом году	192.168.1.185	00:16:3e:44:29:4a
48	9	1	Заберу себе, когда спишут	192.168.1.18	00:16:3e:10:ef:b2
49	5	6	Замена в следующем году	192.168.1.115	00:16:3e:06:f6:e0
50	5	7	Заберу себе, когда спишут	192.168.1.25	00:16:3e:1b:a9:a1
51	6	3	Работает так себе	192.168.1.16	00:16:3e:3c:10:dc
52	10	2	Работает так себе	192.168.1.215	00:16:3e:1d:e9:2d
53	7	4	Замена в следующем году	192.168.1.188	00:16:3e:75:f3:ec
54	6	1	Замена в следующем году	192.168.1.190	00:16:3e:3e:1a:b5
55	3	1	Как такое можно было вообще закупить	192.168.1.160	00:16:3e:5c:66:dc
56	6	9	Заберу себе, когда спишут	192.168.1.95	00:16:3e:5e:85:1b
57	5	11	Работает так себе	192.168.1.43	00:16:3e:5b:0d:04
58	3	1	Как такое можно было вообще закупить	192.168.1.31	00:16:3e:6a:9e:12
59	8	2	Замена в следующем году	192.168.1.210	00:16:3e:0b:98:f4
60	2	13	Заберу себе, когда спишут	192.168.1.125	00:16:3e:49:c2:26
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, num) FROM stdin;
1	9
2	5
3	11
4	45
5	4
6	28
7	13
8	49
9	31
10	46
11	22
12	3
13	30
14	36
15	17
\.


--
-- Data for Name: software; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.software (id, name, version, expires) FROM stdin;
1	Skype	4	\N
2	The Bat	3	\N
3	Visio 2016	2	\N
4	Far Manager	2	\N
5	HexChat	5	\N
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 10, true);


--
-- Name: pcs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pcs_id_seq', 60, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 15, true);


--
-- Name: software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.software_id_seq', 5, true);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: pcs pcs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcs
    ADD CONSTRAINT pcs_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: software software_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software
    ADD CONSTRAINT software_pkey PRIMARY KEY (id);


--
-- Name: installs installs_pc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installs
    ADD CONSTRAINT installs_pc_id_fkey FOREIGN KEY (pc_id) REFERENCES public.pcs(id);


--
-- Name: installs installs_soft_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installs
    ADD CONSTRAINT installs_soft_id_fkey FOREIGN KEY (soft_id) REFERENCES public.software(id);


--
-- Name: pcs pcs_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcs
    ADD CONSTRAINT pcs_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: pcs pcs_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcs
    ADD CONSTRAINT pcs_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- PostgreSQL database dump complete
--

