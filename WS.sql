--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 12.3

-- Started on 2020-07-31 00:09:33

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

--
-- TOC entry 198 (class 1259 OID 16410)
-- Name: Fsys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fsys" (
    "SystemName" text NOT NULL,
    "Name" text
);


ALTER TABLE public."Fsys" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: Rols; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rols" (
    "Date_start" date NOT NULL,
    "Date_end" date NOT NULL,
    "Name" character varying(50) NOT NULL,
    "SystemName" character varying(50) NOT NULL,
    mail character varying(50) NOT NULL
);


ALTER TABLE public."Rols" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16402)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    log character varying(25) NOT NULL,
    pas character varying(50) NOT NULL,
    "Surname" character varying(50) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Otchestvo" character varying(50),
    birtday date NOT NULL,
    "Gender" character varying(20) NOT NULL,
    "Tel" character varying(11) NOT NULL,
    "Role" character varying(50) NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16438)
-- Name: Zakaz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Zakaz" (
    "Number" integer NOT NULL,
    "DateTime" timestamp(6) with time zone NOT NULL,
    "Zakazchick" character varying(50) NOT NULL,
    "AddressDep" character varying(100) NOT NULL,
    "AddressName" character varying(100) NOT NULL,
    "StatusZ" character varying(25) NOT NULL,
    transport character varying(50) NOT NULL,
    "Operator" character varying(50) NOT NULL
);


ALTER TABLE public."Zakaz" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16436)
-- Name: Zakaz_Number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Zakaz_Number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Zakaz_Number_seq" OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 199
-- Name: Zakaz_Number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Zakaz_Number_seq" OWNED BY public."Zakaz"."Number";


--
-- TOC entry 201 (class 1259 OID 16444)
-- Name: transport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transport (
    "Marka" character varying(20) NOT NULL,
    "Model" character varying(25) NOT NULL,
    "YearPr" integer NOT NULL,
    "RegNumber" character varying(15) NOT NULL,
    "DateReg" date NOT NULL,
    "DateSpis" date
);


ALTER TABLE public.transport OWNER TO postgres;

--
-- TOC entry 2687 (class 2604 OID 16441)
-- Name: Zakaz Number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zakaz" ALTER COLUMN "Number" SET DEFAULT nextval('public."Zakaz_Number_seq"'::regclass);


--
-- TOC entry 2834 (class 0 OID 16410)
-- Dependencies: 198
-- Data for Name: Fsys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Fsys" ("SystemName", "Name") FROM stdin;
Заказчик	Человек, который заказывает услугу
\.


--
-- TOC entry 2832 (class 0 OID 16394)
-- Dependencies: 196
-- Data for Name: Rols; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rols" ("Date_start", "Date_end", "Name", "SystemName", mail) FROM stdin;
2020-06-20	2020-06-21	Человек, который заказывает услугу	Заказчик	comf@yandex.ru
\.


--
-- TOC entry 2833 (class 0 OID 16402)
-- Dependencies: 197
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (log, pas, "Surname", "Name", "Otchestvo", birtday, "Gender", "Tel", "Role") FROM stdin;
comf@yandex.ru	22as215s	Brak	Anna		2002-02-12	g	222558	Заказчик
comf2@yandex.ru	22as215s	Купина	Илона		1999-02-12	g	2555555	Оператор
\.


--
-- TOC entry 2836 (class 0 OID 16438)
-- Dependencies: 200
-- Data for Name: Zakaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Zakaz" ("Number", "DateTime", "Zakazchick", "AddressDep", "AddressName", "StatusZ", transport, "Operator") FROM stdin;
1	2020-06-20 13:40:00+03	comf@yandex.ru	Москва	Нижний Новгород	в пути	554SD	comf2@yandex.ru
\.


--
-- TOC entry 2837 (class 0 OID 16444)
-- Dependencies: 201
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport ("Marka", "Model", "YearPr", "RegNumber", "DateReg", "DateSpis") FROM stdin;
Лада	Фокус250	2018	554SD	2019-05-20	2020-01-15
\.


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 199
-- Name: Zakaz_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Zakaz_Number_seq"', 1, false);


--
-- TOC entry 2697 (class 2606 OID 16417)
-- Name: Fsys Fsyst_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fsys"
    ADD CONSTRAINT "Fsyst_pk" PRIMARY KEY ("SystemName");


--
-- TOC entry 2699 (class 2606 OID 16450)
-- Name: Fsys Name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fsys"
    ADD CONSTRAINT "Name" UNIQUE ("Name");


--
-- TOC entry 2705 (class 2606 OID 16461)
-- Name: transport RG; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT "RG" UNIQUE ("RegNumber");


--
-- TOC entry 2689 (class 2606 OID 16435)
-- Name: Rols Rols_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rols"
    ADD CONSTRAINT "Rols_pkey" PRIMARY KEY ("SystemName");


--
-- TOC entry 2695 (class 2606 OID 16426)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (log);


--
-- TOC entry 2701 (class 2606 OID 16443)
-- Name: Zakaz Zakaz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zakaz"
    ADD CONSTRAINT "Zakaz_pkey" PRIMARY KEY ("Number");


--
-- TOC entry 2691 (class 2606 OID 16490)
-- Name: Rols mail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rols"
    ADD CONSTRAINT mail UNIQUE (mail);


--
-- TOC entry 2693 (class 2606 OID 16452)
-- Name: Rols name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rols"
    ADD CONSTRAINT name UNIQUE ("Name");


--
-- TOC entry 2703 (class 2606 OID 16459)
-- Name: Zakaz transportRN; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zakaz"
    ADD CONSTRAINT "transportRN" UNIQUE (transport);


--
-- TOC entry 2707 (class 2606 OID 16448)
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY ("RegNumber");


--
-- TOC entry 2709 (class 2606 OID 16491)
-- Name: Rols email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rols"
    ADD CONSTRAINT email FOREIGN KEY (mail) REFERENCES public."Users"(log) NOT VALID;


--
-- TOC entry 2708 (class 2606 OID 16453)
-- Name: Rols fk_rols_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rols"
    ADD CONSTRAINT fk_rols_name FOREIGN KEY ("Name") REFERENCES public."Fsys"("Name") NOT VALID;


--
-- TOC entry 2710 (class 2606 OID 16462)
-- Name: Zakaz transport; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zakaz"
    ADD CONSTRAINT transport FOREIGN KEY (transport) REFERENCES public.transport("RegNumber") NOT VALID;


-- Completed on 2020-07-31 00:09:35

--
-- PostgreSQL database dump complete
--

