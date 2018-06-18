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
-- Name: med; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE med WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE med OWNER TO postgres;

\connect med

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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id smallint NOT NULL,
    address1 character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20),
    number smallint,
    city_id smallint NOT NULL,
    postal_code character varying(15),
    phone character varying(20) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id smallint NOT NULL,
    city character varying(50) NOT NULL,
    last_update timestamp without time zone NOT NULL,
    state_id smallint NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;


--
-- Name: consult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consult (
    date timestamp without time zone,
    history text,
    payment_id integer,
    employee_id smallint NOT NULL,
    exam_id integer,
    treatment_id integer NOT NULL,
    consult_id integer NOT NULL,
    report text
);


ALTER TABLE public.consult OWNER TO postgres;

--
-- Name: consult_consult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consult_consult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consult_consult_id_seq OWNER TO postgres;

--
-- Name: consult_consult_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consult_consult_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consult_consult_id_seq1 OWNER TO postgres;

--
-- Name: consult_consult_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consult_consult_id_seq1 OWNED BY public.consult.consult_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id smallint NOT NULL,
    country character varying(50) NOT NULL,
    country_pt character varying(50) NOT NULL,
    initial character varying(2),
    last_update timestamp without time zone NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    sex character(1) NOT NULL,
    address_id smallint NOT NULL,
    mail character varying(50) NOT NULL,
    date date NOT NULL,
    salary double precision NOT NULL,
    specialty character varying(25) NOT NULL,
    create_date date NOT NULL,
    active boolean NOT NULL,
    password character varying(255) NOT NULL,
    employee_id smallint NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam (
    type character varying(25),
    description text,
    exam_id integer NOT NULL
);


ALTER TABLE public.exam OWNER TO postgres;

--
-- Name: exam_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_exam_id_seq OWNER TO postgres;

--
-- Name: exam_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exam_exam_id_seq OWNED BY public.exam.exam_id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    sex character(1) NOT NULL,
    address_id smallint NOT NULL,
    mail character varying(50) NOT NULL,
    date date NOT NULL,
    create_date date NOT NULL,
    active boolean NOT NULL,
    patient_id integer NOT NULL
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patient_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_patient_id_seq OWNER TO postgres;

--
-- Name: patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patient_patient_id_seq OWNED BY public.patient.patient_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    amount numeric(5,2) NOT NULL,
    payment_date date,
    payment_id integer NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state (
    state_id smallint NOT NULL,
    state character varying(75) NOT NULL,
    uf character varying(2),
    ibge smallint NOT NULL,
    country_id smallint,
    last_update timestamp without time zone NOT NULL
);


ALTER TABLE public.state OWNER TO postgres;

--
-- Name: state_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.state_state_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_state_id_seq OWNER TO postgres;

--
-- Name: state_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.state_state_id_seq OWNED BY public.state.state_id;


--
-- Name: treatment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment (
    date_start date,
    date_end date,
    patient_id integer,
    treatment_id integer NOT NULL,
    description text
);


ALTER TABLE public.treatment OWNER TO postgres;

--
-- Name: treatment_treatment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treatment_treatment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treatment_treatment_id_seq OWNER TO postgres;

--
-- Name: treatment_treatment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treatment_treatment_id_seq OWNED BY public.treatment.treatment_id;


--
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: city city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- Name: consult consult_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consult ALTER COLUMN consult_id SET DEFAULT nextval('public.consult_consult_id_seq1'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: exam exam_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam ALTER COLUMN exam_id SET DEFAULT nextval('public.exam_exam_id_seq'::regclass);


--
-- Name: patient patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient ALTER COLUMN patient_id SET DEFAULT nextval('public.patient_patient_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: state state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state ALTER COLUMN state_id SET DEFAULT nextval('public.state_state_id_seq'::regclass);


--
-- Name: treatment treatment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment ALTER COLUMN treatment_id SET DEFAULT nextval('public.treatment_treatment_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (address_id, address1, address2, district, number, city_id, postal_code, phone) FROM stdin;
1	rua	\N	nada	555	2869	86430	5555555
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_id, city, last_update, state_id) FROM stdin;
1	Afonso Cláudio	2018-06-16 00:00:00	8
2	Água Doce do Norte	2018-06-16 00:00:00	8
3	Águia Branca	2018-06-16 00:00:00	8
4	Alegre	2018-06-16 00:00:00	8
5	Alfredo Chaves	2018-06-16 00:00:00	8
6	Alto Rio Novo	2018-06-16 00:00:00	8
7	Anchieta	2018-06-16 00:00:00	8
8	Apiacá	2018-06-16 00:00:00	8
9	Aracruz	2018-06-16 00:00:00	8
10	Atilio Vivacqua	2018-06-16 00:00:00	8
11	Baixo Guandu	2018-06-16 00:00:00	8
12	Barra de São Francisco	2018-06-16 00:00:00	8
13	Boa Esperança	2018-06-16 00:00:00	8
14	Bom Jesus do Norte	2018-06-16 00:00:00	8
15	Brejetuba	2018-06-16 00:00:00	8
16	Cachoeiro de Itapemirim	2018-06-16 00:00:00	8
17	Cariacica	2018-06-16 00:00:00	8
18	Castelo	2018-06-16 00:00:00	8
19	Colatina	2018-06-16 00:00:00	8
20	Conceição da Barra	2018-06-16 00:00:00	8
21	Conceição do Castelo	2018-06-16 00:00:00	8
22	Divino de São Lourenço	2018-06-16 00:00:00	8
23	Domingos Martins	2018-06-16 00:00:00	8
24	Dores do Rio Preto	2018-06-16 00:00:00	8
25	Ecoporanga	2018-06-16 00:00:00	8
26	Fundão	2018-06-16 00:00:00	8
27	Governador Lindenberg	2018-06-16 00:00:00	8
28	Guaçuí	2018-06-16 00:00:00	8
29	Guarapari	2018-06-16 00:00:00	8
30	Ibatiba	2018-06-16 00:00:00	8
31	Ibiraçu	2018-06-16 00:00:00	8
32	Ibitirama	2018-06-16 00:00:00	8
33	Iconha	2018-06-16 00:00:00	8
34	Irupi	2018-06-16 00:00:00	8
35	Itaguaçu	2018-06-16 00:00:00	8
36	Itapemirim	2018-06-16 00:00:00	8
37	Itarana	2018-06-16 00:00:00	8
38	Iúna	2018-06-16 00:00:00	8
39	Jaguaré	2018-06-16 00:00:00	8
40	Jerônimo Monteiro	2018-06-16 00:00:00	8
41	João Neiva	2018-06-16 00:00:00	8
42	Laranja da Terra	2018-06-16 00:00:00	8
43	Linhares	2018-06-16 00:00:00	8
44	Mantenópolis	2018-06-16 00:00:00	8
45	Marataízes	2018-06-16 00:00:00	8
46	Marechal Floriano	2018-06-16 00:00:00	8
47	Marilândia	2018-06-16 00:00:00	8
48	Mimoso do Sul	2018-06-16 00:00:00	8
49	Montanha	2018-06-16 00:00:00	8
50	Mucurici	2018-06-16 00:00:00	8
51	Muniz Freire	2018-06-16 00:00:00	8
52	Muqui	2018-06-16 00:00:00	8
53	Nova Venécia	2018-06-16 00:00:00	8
54	Pancas	2018-06-16 00:00:00	8
55	Pedro Canário	2018-06-16 00:00:00	8
56	Pinheiros	2018-06-16 00:00:00	8
57	Piúma	2018-06-16 00:00:00	8
58	Ponto Belo	2018-06-16 00:00:00	8
59	Presidente Kennedy	2018-06-16 00:00:00	8
60	Rio Bananal	2018-06-16 00:00:00	8
61	Rio Novo do Sul	2018-06-16 00:00:00	8
62	Santa Leopoldina	2018-06-16 00:00:00	8
63	Santa Maria de Jetibá	2018-06-16 00:00:00	8
64	Santa Teresa	2018-06-16 00:00:00	8
65	São Domingos do Norte	2018-06-16 00:00:00	8
66	São Gabriel da Palha	2018-06-16 00:00:00	8
67	São José do Calçado	2018-06-16 00:00:00	8
68	São Mateus	2018-06-16 00:00:00	8
69	São Roque do Canaã	2018-06-16 00:00:00	8
70	Serra	2018-06-16 00:00:00	8
71	Sooretama	2018-06-16 00:00:00	8
72	Vargem Alta	2018-06-16 00:00:00	8
73	Venda Nova do Imigrante	2018-06-16 00:00:00	8
74	Viana	2018-06-16 00:00:00	8
75	Vila Pavão	2018-06-16 00:00:00	8
76	Vila Valério	2018-06-16 00:00:00	8
77	Vila Velha	2018-06-16 00:00:00	8
78	Vitória	2018-06-16 00:00:00	8
79	Acrelândia	2018-06-16 00:00:00	1
80	Assis Brasil	2018-06-16 00:00:00	1
81	Brasiléia	2018-06-16 00:00:00	1
82	Bujari	2018-06-16 00:00:00	1
83	Capixaba	2018-06-16 00:00:00	1
84	Cruzeiro do Sul	2018-06-16 00:00:00	1
85	Epitaciolândia	2018-06-16 00:00:00	1
86	Feijó	2018-06-16 00:00:00	1
87	Jordão	2018-06-16 00:00:00	1
88	Mâncio Lima	2018-06-16 00:00:00	1
89	Manoel Urbano	2018-06-16 00:00:00	1
90	Marechal Thaumaturgo	2018-06-16 00:00:00	1
91	Plácido de Castro	2018-06-16 00:00:00	1
92	Porto Acre	2018-06-16 00:00:00	1
93	Porto Walter	2018-06-16 00:00:00	1
94	Rio Branco	2018-06-16 00:00:00	1
95	Rodrigues Alves	2018-06-16 00:00:00	1
96	Santa Rosa do Purus	2018-06-16 00:00:00	1
97	Sena Madureira	2018-06-16 00:00:00	1
98	Senador Guiomard	2018-06-16 00:00:00	1
99	Tarauacá	2018-06-16 00:00:00	1
100	Xapuri	2018-06-16 00:00:00	1
101	Água Branca	2018-06-16 00:00:00	2
102	Anadia	2018-06-16 00:00:00	2
103	Arapiraca	2018-06-16 00:00:00	2
104	Atalaia	2018-06-16 00:00:00	2
105	Barra de Santo Antônio	2018-06-16 00:00:00	2
106	Barra de São Miguel	2018-06-16 00:00:00	2
107	Batalha	2018-06-16 00:00:00	2
108	Belém	2018-06-16 00:00:00	2
109	Belo Monte	2018-06-16 00:00:00	2
110	Boca da Mata	2018-06-16 00:00:00	2
111	Branquinha	2018-06-16 00:00:00	2
112	Cacimbinhas	2018-06-16 00:00:00	2
113	Cajueiro	2018-06-16 00:00:00	2
114	Campestre	2018-06-16 00:00:00	2
115	Campo Alegre	2018-06-16 00:00:00	2
116	Campo Grande	2018-06-16 00:00:00	2
117	Canapi	2018-06-16 00:00:00	2
118	Capela	2018-06-16 00:00:00	2
119	Carneiros	2018-06-16 00:00:00	2
120	Chã Preta	2018-06-16 00:00:00	2
121	Coité do Nóia	2018-06-16 00:00:00	2
122	Colônia Leopoldina	2018-06-16 00:00:00	2
123	Coqueiro Seco	2018-06-16 00:00:00	2
124	Coruripe	2018-06-16 00:00:00	2
125	Craíbas	2018-06-16 00:00:00	2
126	Delmiro Gouveia	2018-06-16 00:00:00	2
127	Dois Riachos	2018-06-16 00:00:00	2
128	Estrela de Alagoas	2018-06-16 00:00:00	2
129	Feira Grande	2018-06-16 00:00:00	2
130	Feliz Deserto	2018-06-16 00:00:00	2
131	Flexeiras	2018-06-16 00:00:00	2
132	Girau do Ponciano	2018-06-16 00:00:00	2
133	Ibateguara	2018-06-16 00:00:00	2
134	Igaci	2018-06-16 00:00:00	2
135	Igreja Nova	2018-06-16 00:00:00	2
136	Inhapi	2018-06-16 00:00:00	2
137	Jacaré dos Homens	2018-06-16 00:00:00	2
138	Jacuípe	2018-06-16 00:00:00	2
139	Japaratinga	2018-06-16 00:00:00	2
140	Jaramataia	2018-06-16 00:00:00	2
141	Jequiá da Praia	2018-06-16 00:00:00	2
142	Joaquim Gomes	2018-06-16 00:00:00	2
143	Jundiá	2018-06-16 00:00:00	2
144	Junqueiro	2018-06-16 00:00:00	2
145	Lagoa da Canoa	2018-06-16 00:00:00	2
146	Limoeiro de Anadia	2018-06-16 00:00:00	2
147	Maceió	2018-06-16 00:00:00	2
148	Major Isidoro	2018-06-16 00:00:00	2
149	Mar Vermelho	2018-06-16 00:00:00	2
150	Maragogi	2018-06-16 00:00:00	2
151	Maravilha	2018-06-16 00:00:00	2
152	Marechal Deodoro	2018-06-16 00:00:00	2
153	Maribondo	2018-06-16 00:00:00	2
154	Mata Grande	2018-06-16 00:00:00	2
155	Matriz de Camaragibe	2018-06-16 00:00:00	2
156	Messias	2018-06-16 00:00:00	2
157	Minador do Negrão	2018-06-16 00:00:00	2
158	Monteirópolis	2018-06-16 00:00:00	2
159	Murici	2018-06-16 00:00:00	2
160	Novo Lino	2018-06-16 00:00:00	2
161	Olho d`Água das Flores	2018-06-16 00:00:00	2
162	Olho d`Água do Casado	2018-06-16 00:00:00	2
163	Olho d`Água Grande	2018-06-16 00:00:00	2
164	Olivença	2018-06-16 00:00:00	2
165	Ouro Branco	2018-06-16 00:00:00	2
166	Palestina	2018-06-16 00:00:00	2
167	Palmeira dos Índios	2018-06-16 00:00:00	2
168	Pão de Açúcar	2018-06-16 00:00:00	2
169	Pariconha	2018-06-16 00:00:00	2
170	Paripueira	2018-06-16 00:00:00	2
171	Passo de Camaragibe	2018-06-16 00:00:00	2
172	Paulo Jacinto	2018-06-16 00:00:00	2
173	Penedo	2018-06-16 00:00:00	2
174	Piaçabuçu	2018-06-16 00:00:00	2
175	Pilar	2018-06-16 00:00:00	2
176	Pindoba	2018-06-16 00:00:00	2
177	Piranhas	2018-06-16 00:00:00	2
178	Poço das Trincheiras	2018-06-16 00:00:00	2
179	Porto Calvo	2018-06-16 00:00:00	2
180	Porto de Pedras	2018-06-16 00:00:00	2
181	Porto Real do Colégio	2018-06-16 00:00:00	2
182	Quebrangulo	2018-06-16 00:00:00	2
183	Rio Largo	2018-06-16 00:00:00	2
184	Roteiro	2018-06-16 00:00:00	2
185	Santa Luzia do Norte	2018-06-16 00:00:00	2
186	Santana do Ipanema	2018-06-16 00:00:00	2
187	Santana do Mundaú	2018-06-16 00:00:00	2
188	São Brás	2018-06-16 00:00:00	2
189	São José da Laje	2018-06-16 00:00:00	2
190	São José da Tapera	2018-06-16 00:00:00	2
191	São Luís do Quitunde	2018-06-16 00:00:00	2
192	São Miguel dos Campos	2018-06-16 00:00:00	2
193	São Miguel dos Milagres	2018-06-16 00:00:00	2
194	São Sebastião	2018-06-16 00:00:00	2
195	Satuba	2018-06-16 00:00:00	2
196	Senador Rui Palmeira	2018-06-16 00:00:00	2
197	Tanque d`Arca	2018-06-16 00:00:00	2
198	Taquarana	2018-06-16 00:00:00	2
199	Teotônio Vilela	2018-06-16 00:00:00	2
200	Traipu	2018-06-16 00:00:00	2
201	União dos Palmares	2018-06-16 00:00:00	2
202	Viçosa	2018-06-16 00:00:00	2
203	Amapá	2018-06-16 00:00:00	4
204	Calçoene	2018-06-16 00:00:00	4
205	Cutias	2018-06-16 00:00:00	4
206	Ferreira Gomes	2018-06-16 00:00:00	4
207	Itaubal	2018-06-16 00:00:00	4
208	Laranjal do Jari	2018-06-16 00:00:00	4
209	Macapá	2018-06-16 00:00:00	4
210	Mazagão	2018-06-16 00:00:00	4
211	Oiapoque	2018-06-16 00:00:00	4
212	Pedra Branca do Amaparí	2018-06-16 00:00:00	4
213	Porto Grande	2018-06-16 00:00:00	4
214	Pracuúba	2018-06-16 00:00:00	4
215	Santana	2018-06-16 00:00:00	4
216	Serra do Navio	2018-06-16 00:00:00	4
217	Tartarugalzinho	2018-06-16 00:00:00	4
218	Vitória do Jari	2018-06-16 00:00:00	4
219	Alvarães	2018-06-16 00:00:00	3
220	Amaturá	2018-06-16 00:00:00	3
221	Anamã	2018-06-16 00:00:00	3
222	Anori	2018-06-16 00:00:00	3
223	Apuí	2018-06-16 00:00:00	3
224	Atalaia do Norte	2018-06-16 00:00:00	3
225	Autazes	2018-06-16 00:00:00	3
226	Barcelos	2018-06-16 00:00:00	3
227	Barreirinha	2018-06-16 00:00:00	3
228	Benjamin Constant	2018-06-16 00:00:00	3
229	Beruri	2018-06-16 00:00:00	3
230	Boa Vista do Ramos	2018-06-16 00:00:00	3
231	Boca do Acre	2018-06-16 00:00:00	3
232	Borba	2018-06-16 00:00:00	3
233	Caapiranga	2018-06-16 00:00:00	3
234	Canutama	2018-06-16 00:00:00	3
235	Carauari	2018-06-16 00:00:00	3
236	Careiro	2018-06-16 00:00:00	3
237	Careiro da Várzea	2018-06-16 00:00:00	3
238	Coari	2018-06-16 00:00:00	3
239	Codajás	2018-06-16 00:00:00	3
240	Eirunepé	2018-06-16 00:00:00	3
241	Envira	2018-06-16 00:00:00	3
242	Fonte Boa	2018-06-16 00:00:00	3
243	Guajará	2018-06-16 00:00:00	3
244	Humaitá	2018-06-16 00:00:00	3
245	Ipixuna	2018-06-16 00:00:00	3
246	Iranduba	2018-06-16 00:00:00	3
247	Itacoatiara	2018-06-16 00:00:00	3
248	Itamarati	2018-06-16 00:00:00	3
249	Itapiranga	2018-06-16 00:00:00	3
250	Japurá	2018-06-16 00:00:00	3
251	Juruá	2018-06-16 00:00:00	3
252	Jutaí	2018-06-16 00:00:00	3
253	Lábrea	2018-06-16 00:00:00	3
254	Manacapuru	2018-06-16 00:00:00	3
255	Manaquiri	2018-06-16 00:00:00	3
256	Manaus	2018-06-16 00:00:00	3
257	Manicoré	2018-06-16 00:00:00	3
258	Maraã	2018-06-16 00:00:00	3
259	Maués	2018-06-16 00:00:00	3
260	Nhamundá	2018-06-16 00:00:00	3
261	Nova Olinda do Norte	2018-06-16 00:00:00	3
262	Novo Airão	2018-06-16 00:00:00	3
263	Novo Aripuanã	2018-06-16 00:00:00	3
264	Parintins	2018-06-16 00:00:00	3
265	Pauini	2018-06-16 00:00:00	3
266	Presidente Figueiredo	2018-06-16 00:00:00	3
267	Rio Preto da Eva	2018-06-16 00:00:00	3
268	Santa Isabel do Rio Negro	2018-06-16 00:00:00	3
269	Santo Antônio do Içá	2018-06-16 00:00:00	3
270	São Gabriel da Cachoeira	2018-06-16 00:00:00	3
271	São Paulo de Olivença	2018-06-16 00:00:00	3
272	São Sebastião do Uatumã	2018-06-16 00:00:00	3
273	Silves	2018-06-16 00:00:00	3
274	Tabatinga	2018-06-16 00:00:00	3
275	Tapauá	2018-06-16 00:00:00	3
276	Tefé	2018-06-16 00:00:00	3
277	Tonantins	2018-06-16 00:00:00	3
278	Uarini	2018-06-16 00:00:00	3
279	Urucará	2018-06-16 00:00:00	3
280	Urucurituba	2018-06-16 00:00:00	3
281	Abaíra	2018-06-16 00:00:00	5
282	Abaré	2018-06-16 00:00:00	5
283	Acajutiba	2018-06-16 00:00:00	5
284	Adustina	2018-06-16 00:00:00	5
285	Água Fria	2018-06-16 00:00:00	5
286	Aiquara	2018-06-16 00:00:00	5
287	Alagoinhas	2018-06-16 00:00:00	5
288	Alcobaça	2018-06-16 00:00:00	5
289	Almadina	2018-06-16 00:00:00	5
290	Amargosa	2018-06-16 00:00:00	5
291	Amélia Rodrigues	2018-06-16 00:00:00	5
292	América Dourada	2018-06-16 00:00:00	5
293	Anagé	2018-06-16 00:00:00	5
294	Andaraí	2018-06-16 00:00:00	5
295	Andorinha	2018-06-16 00:00:00	5
296	Angical	2018-06-16 00:00:00	5
297	Anguera	2018-06-16 00:00:00	5
298	Antas	2018-06-16 00:00:00	5
299	Antônio Cardoso	2018-06-16 00:00:00	5
300	Antônio Gonçalves	2018-06-16 00:00:00	5
301	Aporá	2018-06-16 00:00:00	5
302	Apuarema	2018-06-16 00:00:00	5
303	Araças	2018-06-16 00:00:00	5
304	Aracatu	2018-06-16 00:00:00	5
305	Araci	2018-06-16 00:00:00	5
306	Aramari	2018-06-16 00:00:00	5
307	Arataca	2018-06-16 00:00:00	5
308	Aratuípe	2018-06-16 00:00:00	5
309	Aurelino Leal	2018-06-16 00:00:00	5
310	Baianópolis	2018-06-16 00:00:00	5
311	Baixa Grande	2018-06-16 00:00:00	5
312	Banzaê	2018-06-16 00:00:00	5
313	Barra	2018-06-16 00:00:00	5
314	Barra da Estiva	2018-06-16 00:00:00	5
315	Barra do Choça	2018-06-16 00:00:00	5
316	Barra do Mendes	2018-06-16 00:00:00	5
317	Barra do Rocha	2018-06-16 00:00:00	5
318	Barreiras	2018-06-16 00:00:00	5
319	Barro Alto	2018-06-16 00:00:00	5
320	Barro Preto (antigo Gov. Lomanto Jr.)	2018-06-16 00:00:00	5
321	Barrocas	2018-06-16 00:00:00	5
322	Belmonte	2018-06-16 00:00:00	5
323	Belo Campo	2018-06-16 00:00:00	5
324	Biritinga	2018-06-16 00:00:00	5
325	Boa Nova	2018-06-16 00:00:00	5
326	Boa Vista do Tupim	2018-06-16 00:00:00	5
327	Bom Jesus da Lapa	2018-06-16 00:00:00	5
328	Bom Jesus da Serra	2018-06-16 00:00:00	5
329	Boninal	2018-06-16 00:00:00	5
330	Bonito	2018-06-16 00:00:00	5
331	Boquira	2018-06-16 00:00:00	5
332	Botuporã	2018-06-16 00:00:00	5
333	Brejões	2018-06-16 00:00:00	5
334	Brejolândia	2018-06-16 00:00:00	5
335	Brotas de Macaúbas	2018-06-16 00:00:00	5
336	Brumado	2018-06-16 00:00:00	5
337	Buerarema	2018-06-16 00:00:00	5
338	Buritirama	2018-06-16 00:00:00	5
339	Caatiba	2018-06-16 00:00:00	5
340	Cabaceiras do Paraguaçu	2018-06-16 00:00:00	5
341	Cachoeira	2018-06-16 00:00:00	5
342	Caculé	2018-06-16 00:00:00	5
343	Caém	2018-06-16 00:00:00	5
344	Caetanos	2018-06-16 00:00:00	5
345	Caetité	2018-06-16 00:00:00	5
346	Cafarnaum	2018-06-16 00:00:00	5
347	Cairu	2018-06-16 00:00:00	5
348	Caldeirão Grande	2018-06-16 00:00:00	5
349	Camacan	2018-06-16 00:00:00	5
350	Camaçari	2018-06-16 00:00:00	5
351	Camamu	2018-06-16 00:00:00	5
352	Campo Alegre de Lourdes	2018-06-16 00:00:00	5
353	Campo Formoso	2018-06-16 00:00:00	5
354	Canápolis	2018-06-16 00:00:00	5
355	Canarana	2018-06-16 00:00:00	5
356	Canavieiras	2018-06-16 00:00:00	5
357	Candeal	2018-06-16 00:00:00	5
358	Candeias	2018-06-16 00:00:00	5
359	Candiba	2018-06-16 00:00:00	5
360	Cândido Sales	2018-06-16 00:00:00	5
361	Cansanção	2018-06-16 00:00:00	5
362	Canudos	2018-06-16 00:00:00	5
363	Capela do Alto Alegre	2018-06-16 00:00:00	5
364	Capim Grosso	2018-06-16 00:00:00	5
365	Caraíbas	2018-06-16 00:00:00	5
366	Caravelas	2018-06-16 00:00:00	5
367	Cardeal da Silva	2018-06-16 00:00:00	5
368	Carinhanha	2018-06-16 00:00:00	5
369	Casa Nova	2018-06-16 00:00:00	5
370	Castro Alves	2018-06-16 00:00:00	5
371	Catolândia	2018-06-16 00:00:00	5
372	Catu	2018-06-16 00:00:00	5
373	Caturama	2018-06-16 00:00:00	5
374	Central	2018-06-16 00:00:00	5
375	Chorrochó	2018-06-16 00:00:00	5
376	Cícero Dantas	2018-06-16 00:00:00	5
377	Cipó	2018-06-16 00:00:00	5
378	Coaraci	2018-06-16 00:00:00	5
379	Cocos	2018-06-16 00:00:00	5
380	Conceição da Feira	2018-06-16 00:00:00	5
381	Conceição do Almeida	2018-06-16 00:00:00	5
382	Conceição do Coité	2018-06-16 00:00:00	5
383	Conceição do Jacuípe	2018-06-16 00:00:00	5
384	Conde	2018-06-16 00:00:00	5
385	Condeúba	2018-06-16 00:00:00	5
386	Contendas do Sincorá	2018-06-16 00:00:00	5
387	Coração de Maria	2018-06-16 00:00:00	5
388	Cordeiros	2018-06-16 00:00:00	5
389	Coribe	2018-06-16 00:00:00	5
390	Coronel João Sá	2018-06-16 00:00:00	5
391	Correntina	2018-06-16 00:00:00	5
392	Cotegipe	2018-06-16 00:00:00	5
393	Cravolândia	2018-06-16 00:00:00	5
394	Crisópolis	2018-06-16 00:00:00	5
395	Cristópolis	2018-06-16 00:00:00	5
396	Cruz das Almas	2018-06-16 00:00:00	5
397	Curaçá	2018-06-16 00:00:00	5
398	Dário Meira	2018-06-16 00:00:00	5
399	Dias d`Ávila	2018-06-16 00:00:00	5
400	Dom Basílio	2018-06-16 00:00:00	5
401	Dom Macedo Costa	2018-06-16 00:00:00	5
402	Elísio Medrado	2018-06-16 00:00:00	5
403	Encruzilhada	2018-06-16 00:00:00	5
404	Entre Rios	2018-06-16 00:00:00	5
405	Érico Cardoso	2018-06-16 00:00:00	5
406	Esplanada	2018-06-16 00:00:00	5
407	Euclides da Cunha	2018-06-16 00:00:00	5
408	Eunápolis	2018-06-16 00:00:00	5
409	Fátima	2018-06-16 00:00:00	5
410	Feira da Mata	2018-06-16 00:00:00	5
411	Feira de Santana	2018-06-16 00:00:00	5
412	Filadélfia	2018-06-16 00:00:00	5
413	Firmino Alves	2018-06-16 00:00:00	5
414	Floresta Azul	2018-06-16 00:00:00	5
415	Formosa do Rio Preto	2018-06-16 00:00:00	5
416	Gandu	2018-06-16 00:00:00	5
417	Gavião	2018-06-16 00:00:00	5
418	Gentio do Ouro	2018-06-16 00:00:00	5
419	Glória	2018-06-16 00:00:00	5
420	Gongogi	2018-06-16 00:00:00	5
421	Governador Mangabeira	2018-06-16 00:00:00	5
422	Guajeru	2018-06-16 00:00:00	5
423	Guanambi	2018-06-16 00:00:00	5
424	Guaratinga	2018-06-16 00:00:00	5
425	Heliópolis	2018-06-16 00:00:00	5
426	Iaçu	2018-06-16 00:00:00	5
427	Ibiassucê	2018-06-16 00:00:00	5
428	Ibicaraí	2018-06-16 00:00:00	5
429	Ibicoara	2018-06-16 00:00:00	5
430	Ibicuí	2018-06-16 00:00:00	5
431	Ibipeba	2018-06-16 00:00:00	5
432	Ibipitanga	2018-06-16 00:00:00	5
433	Ibiquera	2018-06-16 00:00:00	5
434	Ibirapitanga	2018-06-16 00:00:00	5
435	Ibirapuã	2018-06-16 00:00:00	5
436	Ibirataia	2018-06-16 00:00:00	5
437	Ibitiara	2018-06-16 00:00:00	5
438	Ibititá	2018-06-16 00:00:00	5
439	Ibotirama	2018-06-16 00:00:00	5
440	Ichu	2018-06-16 00:00:00	5
441	Igaporã	2018-06-16 00:00:00	5
442	Igrapiúna	2018-06-16 00:00:00	5
443	Iguaí	2018-06-16 00:00:00	5
444	Ilhéus	2018-06-16 00:00:00	5
445	Inhambupe	2018-06-16 00:00:00	5
446	Ipecaetá	2018-06-16 00:00:00	5
447	Ipiaú	2018-06-16 00:00:00	5
448	Ipirá	2018-06-16 00:00:00	5
449	Ipupiara	2018-06-16 00:00:00	5
450	Irajuba	2018-06-16 00:00:00	5
451	Iramaia	2018-06-16 00:00:00	5
452	Iraquara	2018-06-16 00:00:00	5
453	Irará	2018-06-16 00:00:00	5
454	Irecê	2018-06-16 00:00:00	5
455	Itabela	2018-06-16 00:00:00	5
456	Itaberaba	2018-06-16 00:00:00	5
457	Itabuna	2018-06-16 00:00:00	5
458	Itacaré	2018-06-16 00:00:00	5
459	Itaeté	2018-06-16 00:00:00	5
460	Itagi	2018-06-16 00:00:00	5
461	Itagibá	2018-06-16 00:00:00	5
462	Itagimirim	2018-06-16 00:00:00	5
463	Itaguaçu da Bahia	2018-06-16 00:00:00	5
464	Itaju do Colônia	2018-06-16 00:00:00	5
465	Itajuípe	2018-06-16 00:00:00	5
466	Itamaraju	2018-06-16 00:00:00	5
467	Itamari	2018-06-16 00:00:00	5
468	Itambé	2018-06-16 00:00:00	5
469	Itanagra	2018-06-16 00:00:00	5
470	Itanhém	2018-06-16 00:00:00	5
471	Itaparica	2018-06-16 00:00:00	5
472	Itapé	2018-06-16 00:00:00	5
473	Itapebi	2018-06-16 00:00:00	5
474	Itapetinga	2018-06-16 00:00:00	5
475	Itapicuru	2018-06-16 00:00:00	5
476	Itapitanga	2018-06-16 00:00:00	5
477	Itaquara	2018-06-16 00:00:00	5
478	Itarantim	2018-06-16 00:00:00	5
479	Itatim	2018-06-16 00:00:00	5
480	Itiruçu	2018-06-16 00:00:00	5
481	Itiúba	2018-06-16 00:00:00	5
482	Itororó	2018-06-16 00:00:00	5
483	Ituaçu	2018-06-16 00:00:00	5
484	Ituberá	2018-06-16 00:00:00	5
485	Iuiú	2018-06-16 00:00:00	5
486	Jaborandi	2018-06-16 00:00:00	5
487	Jacaraci	2018-06-16 00:00:00	5
488	Jacobina	2018-06-16 00:00:00	5
489	Jaguaquara	2018-06-16 00:00:00	5
490	Jaguarari	2018-06-16 00:00:00	5
491	Jaguaripe	2018-06-16 00:00:00	5
492	Jandaíra	2018-06-16 00:00:00	5
493	Jequié	2018-06-16 00:00:00	5
494	Jeremoabo	2018-06-16 00:00:00	5
495	Jiquiriçá	2018-06-16 00:00:00	5
496	Jitaúna	2018-06-16 00:00:00	5
497	João Dourado	2018-06-16 00:00:00	5
498	Juazeiro	2018-06-16 00:00:00	5
499	Jucuruçu	2018-06-16 00:00:00	5
500	Jussara	2018-06-16 00:00:00	5
501	Jussari	2018-06-16 00:00:00	5
502	Jussiape	2018-06-16 00:00:00	5
503	Lafaiete Coutinho	2018-06-16 00:00:00	5
504	Lagoa Real	2018-06-16 00:00:00	5
505	Laje	2018-06-16 00:00:00	5
506	Lajedão	2018-06-16 00:00:00	5
507	Lajedinho	2018-06-16 00:00:00	5
508	Lajedo do Tabocal	2018-06-16 00:00:00	5
509	Lamarão	2018-06-16 00:00:00	5
510	Lapão	2018-06-16 00:00:00	5
511	Lauro de Freitas	2018-06-16 00:00:00	5
512	Lençóis	2018-06-16 00:00:00	5
513	Licínio de Almeida	2018-06-16 00:00:00	5
514	Livramento de Nossa Senhora	2018-06-16 00:00:00	5
515	Luís Eduardo Magalhães	2018-06-16 00:00:00	5
516	Macajuba	2018-06-16 00:00:00	5
517	Macarani	2018-06-16 00:00:00	5
518	Macaúbas	2018-06-16 00:00:00	5
519	Macururé	2018-06-16 00:00:00	5
520	Madre de Deus	2018-06-16 00:00:00	5
521	Maetinga	2018-06-16 00:00:00	5
522	Maiquinique	2018-06-16 00:00:00	5
523	Mairi	2018-06-16 00:00:00	5
524	Malhada	2018-06-16 00:00:00	5
525	Malhada de Pedras	2018-06-16 00:00:00	5
526	Manoel Vitorino	2018-06-16 00:00:00	5
527	Mansidão	2018-06-16 00:00:00	5
528	Maracás	2018-06-16 00:00:00	5
529	Maragogipe	2018-06-16 00:00:00	5
530	Maraú	2018-06-16 00:00:00	5
531	Marcionílio Souza	2018-06-16 00:00:00	5
532	Mascote	2018-06-16 00:00:00	5
533	Mata de São João	2018-06-16 00:00:00	5
534	Matina	2018-06-16 00:00:00	5
535	Medeiros Neto	2018-06-16 00:00:00	5
536	Miguel Calmon	2018-06-16 00:00:00	5
537	Milagres	2018-06-16 00:00:00	5
538	Mirangaba	2018-06-16 00:00:00	5
539	Mirante	2018-06-16 00:00:00	5
540	Monte Santo	2018-06-16 00:00:00	5
541	Morpará	2018-06-16 00:00:00	5
542	Morro do Chapéu	2018-06-16 00:00:00	5
543	Mortugaba	2018-06-16 00:00:00	5
544	Mucugê	2018-06-16 00:00:00	5
545	Mucuri	2018-06-16 00:00:00	5
546	Mulungu do Morro	2018-06-16 00:00:00	5
547	Mundo Novo	2018-06-16 00:00:00	5
548	Muniz Ferreira	2018-06-16 00:00:00	5
549	Muquém de São Francisco	2018-06-16 00:00:00	5
550	Muritiba	2018-06-16 00:00:00	5
551	Mutuípe	2018-06-16 00:00:00	5
552	Nazaré	2018-06-16 00:00:00	5
553	Nilo Peçanha	2018-06-16 00:00:00	5
554	Nordestina	2018-06-16 00:00:00	5
555	Nova Canaã	2018-06-16 00:00:00	5
556	Nova Fátima	2018-06-16 00:00:00	5
557	Nova Ibiá	2018-06-16 00:00:00	5
558	Nova Itarana	2018-06-16 00:00:00	5
559	Nova Redenção	2018-06-16 00:00:00	5
560	Nova Soure	2018-06-16 00:00:00	5
561	Nova Viçosa	2018-06-16 00:00:00	5
562	Novo Horizonte	2018-06-16 00:00:00	5
563	Novo Triunfo	2018-06-16 00:00:00	5
564	Olindina	2018-06-16 00:00:00	5
565	Oliveira dos Brejinhos	2018-06-16 00:00:00	5
566	Ouriçangas	2018-06-16 00:00:00	5
567	Ourolândia	2018-06-16 00:00:00	5
568	Palmas de Monte Alto	2018-06-16 00:00:00	5
569	Palmeiras	2018-06-16 00:00:00	5
570	Paramirim	2018-06-16 00:00:00	5
571	Paratinga	2018-06-16 00:00:00	5
572	Paripiranga	2018-06-16 00:00:00	5
573	Pau Brasil	2018-06-16 00:00:00	5
574	Paulo Afonso	2018-06-16 00:00:00	5
575	Pé de Serra	2018-06-16 00:00:00	5
576	Pedrão	2018-06-16 00:00:00	5
577	Pedro Alexandre	2018-06-16 00:00:00	5
578	Piatã	2018-06-16 00:00:00	5
579	Pilão Arcado	2018-06-16 00:00:00	5
580	Pindaí	2018-06-16 00:00:00	5
581	Pindobaçu	2018-06-16 00:00:00	5
582	Pintadas	2018-06-16 00:00:00	5
583	Piraí do Norte	2018-06-16 00:00:00	5
584	Piripá	2018-06-16 00:00:00	5
585	Piritiba	2018-06-16 00:00:00	5
586	Planaltino	2018-06-16 00:00:00	5
587	Planalto	2018-06-16 00:00:00	5
588	Poções	2018-06-16 00:00:00	5
589	Pojuca	2018-06-16 00:00:00	5
590	Ponto Novo	2018-06-16 00:00:00	5
591	Porto Seguro	2018-06-16 00:00:00	5
592	Potiraguá	2018-06-16 00:00:00	5
593	Prado	2018-06-16 00:00:00	5
594	Presidente Dutra	2018-06-16 00:00:00	5
595	Presidente Jânio Quadros	2018-06-16 00:00:00	5
596	Presidente Tancredo Neves	2018-06-16 00:00:00	5
597	Queimadas	2018-06-16 00:00:00	5
598	Quijingue	2018-06-16 00:00:00	5
599	Quixabeira	2018-06-16 00:00:00	5
600	Rafael Jambeiro	2018-06-16 00:00:00	5
601	Remanso	2018-06-16 00:00:00	5
602	Retirolândia	2018-06-16 00:00:00	5
603	Riachão das Neves	2018-06-16 00:00:00	5
604	Riachão do Jacuípe	2018-06-16 00:00:00	5
605	Riacho de Santana	2018-06-16 00:00:00	5
606	Ribeira do Amparo	2018-06-16 00:00:00	5
607	Ribeira do Pombal	2018-06-16 00:00:00	5
608	Ribeirão do Largo	2018-06-16 00:00:00	5
609	Rio de Contas	2018-06-16 00:00:00	5
610	Rio do Antônio	2018-06-16 00:00:00	5
611	Rio do Pires	2018-06-16 00:00:00	5
612	Rio Real	2018-06-16 00:00:00	5
613	Rodelas	2018-06-16 00:00:00	5
614	Ruy Barbosa	2018-06-16 00:00:00	5
615	Salinas da Margarida	2018-06-16 00:00:00	5
616	Salvador	2018-06-16 00:00:00	5
617	Santa Bárbara	2018-06-16 00:00:00	5
618	Santa Brígida	2018-06-16 00:00:00	5
619	Santa Cruz Cabrália	2018-06-16 00:00:00	5
620	Santa Cruz da Vitória	2018-06-16 00:00:00	5
621	Santa Inês	2018-06-16 00:00:00	5
622	Santa Luzia	2018-06-16 00:00:00	5
623	Santa Maria da Vitória	2018-06-16 00:00:00	5
624	Santa Rita de Cássia	2018-06-16 00:00:00	5
625	Santa Teresinha	2018-06-16 00:00:00	5
626	Santaluz	2018-06-16 00:00:00	5
627	Santana	2018-06-16 00:00:00	5
628	Santanópolis	2018-06-16 00:00:00	5
629	Santo Amaro	2018-06-16 00:00:00	5
630	Santo Antônio de Jesus	2018-06-16 00:00:00	5
631	Santo Estêvão	2018-06-16 00:00:00	5
632	São Desidério	2018-06-16 00:00:00	5
633	São Domingos	2018-06-16 00:00:00	5
634	São Felipe	2018-06-16 00:00:00	5
635	São Félix	2018-06-16 00:00:00	5
636	São Félix do Coribe	2018-06-16 00:00:00	5
637	São Francisco do Conde	2018-06-16 00:00:00	5
638	São Gabriel	2018-06-16 00:00:00	5
639	São Gonçalo dos Campos	2018-06-16 00:00:00	5
640	São José da Vitória	2018-06-16 00:00:00	5
641	São José do Jacuípe	2018-06-16 00:00:00	5
642	São Miguel das Matas	2018-06-16 00:00:00	5
643	São Sebastião do Passé	2018-06-16 00:00:00	5
644	Sapeaçu	2018-06-16 00:00:00	5
645	Sátiro Dias	2018-06-16 00:00:00	5
646	Saubara	2018-06-16 00:00:00	5
647	Saúde	2018-06-16 00:00:00	5
648	Seabra	2018-06-16 00:00:00	5
649	Sebastião Laranjeiras	2018-06-16 00:00:00	5
650	Senhor do Bonfim	2018-06-16 00:00:00	5
651	Sento Sé	2018-06-16 00:00:00	5
652	Serra do Ramalho	2018-06-16 00:00:00	5
653	Serra Dourada	2018-06-16 00:00:00	5
654	Serra Preta	2018-06-16 00:00:00	5
655	Serrinha	2018-06-16 00:00:00	5
656	Serrolândia	2018-06-16 00:00:00	5
657	Simões Filho	2018-06-16 00:00:00	5
658	Sítio do Mato	2018-06-16 00:00:00	5
659	Sítio do Quinto	2018-06-16 00:00:00	5
660	Sobradinho	2018-06-16 00:00:00	5
661	Souto Soares	2018-06-16 00:00:00	5
662	Tabocas do Brejo Velho	2018-06-16 00:00:00	5
663	Tanhaçu	2018-06-16 00:00:00	5
664	Tanque Novo	2018-06-16 00:00:00	5
665	Tanquinho	2018-06-16 00:00:00	5
666	Taperoá	2018-06-16 00:00:00	5
667	Tapiramutá	2018-06-16 00:00:00	5
668	Teixeira de Freitas	2018-06-16 00:00:00	5
669	Teodoro Sampaio	2018-06-16 00:00:00	5
670	Teofilândia	2018-06-16 00:00:00	5
671	Teolândia	2018-06-16 00:00:00	5
672	Terra Nova	2018-06-16 00:00:00	5
673	Tremedal	2018-06-16 00:00:00	5
674	Tucano	2018-06-16 00:00:00	5
675	Uauá	2018-06-16 00:00:00	5
676	Ubaíra	2018-06-16 00:00:00	5
677	Ubaitaba	2018-06-16 00:00:00	5
678	Ubatã	2018-06-16 00:00:00	5
679	Uibaí	2018-06-16 00:00:00	5
680	Umburanas	2018-06-16 00:00:00	5
681	Una	2018-06-16 00:00:00	5
682	Urandi	2018-06-16 00:00:00	5
683	Uruçuca	2018-06-16 00:00:00	5
684	Utinga	2018-06-16 00:00:00	5
685	Valença	2018-06-16 00:00:00	5
686	Valente	2018-06-16 00:00:00	5
687	Várzea da Roça	2018-06-16 00:00:00	5
688	Várzea do Poço	2018-06-16 00:00:00	5
689	Várzea Nova	2018-06-16 00:00:00	5
690	Varzedo	2018-06-16 00:00:00	5
691	Vera Cruz	2018-06-16 00:00:00	5
692	Vereda	2018-06-16 00:00:00	5
693	Vitória da Conquista	2018-06-16 00:00:00	5
694	Wagner	2018-06-16 00:00:00	5
695	Wanderley	2018-06-16 00:00:00	5
696	Wenceslau Guimarães	2018-06-16 00:00:00	5
697	Xique-Xique	2018-06-16 00:00:00	5
698	Abaiara	2018-06-16 00:00:00	6
699	Acarape	2018-06-16 00:00:00	6
700	Acaraú	2018-06-16 00:00:00	6
701	Acopiara	2018-06-16 00:00:00	6
702	Aiuaba	2018-06-16 00:00:00	6
703	Alcântaras	2018-06-16 00:00:00	6
704	Altaneira	2018-06-16 00:00:00	6
705	Alto Santo	2018-06-16 00:00:00	6
706	Amontada	2018-06-16 00:00:00	6
707	Antonina do Norte	2018-06-16 00:00:00	6
708	Apuiarés	2018-06-16 00:00:00	6
709	Aquiraz	2018-06-16 00:00:00	6
710	Aracati	2018-06-16 00:00:00	6
711	Aracoiaba	2018-06-16 00:00:00	6
712	Ararendá	2018-06-16 00:00:00	6
713	Araripe	2018-06-16 00:00:00	6
714	Aratuba	2018-06-16 00:00:00	6
715	Arneiroz	2018-06-16 00:00:00	6
716	Assaré	2018-06-16 00:00:00	6
717	Aurora	2018-06-16 00:00:00	6
718	Baixio	2018-06-16 00:00:00	6
719	Banabuiú	2018-06-16 00:00:00	6
720	Barbalha	2018-06-16 00:00:00	6
721	Barreira	2018-06-16 00:00:00	6
722	Barro	2018-06-16 00:00:00	6
723	Barroquinha	2018-06-16 00:00:00	6
724	Baturité	2018-06-16 00:00:00	6
725	Beberibe	2018-06-16 00:00:00	6
726	Bela Cruz	2018-06-16 00:00:00	6
727	Boa Viagem	2018-06-16 00:00:00	6
728	Brejo Santo	2018-06-16 00:00:00	6
729	Camocim	2018-06-16 00:00:00	6
730	Campos Sales	2018-06-16 00:00:00	6
731	Canindé	2018-06-16 00:00:00	6
732	Capistrano	2018-06-16 00:00:00	6
733	Caridade	2018-06-16 00:00:00	6
734	Cariré	2018-06-16 00:00:00	6
735	Caririaçu	2018-06-16 00:00:00	6
736	Cariús	2018-06-16 00:00:00	6
737	Carnaubal	2018-06-16 00:00:00	6
738	Cascavel	2018-06-16 00:00:00	6
739	Catarina	2018-06-16 00:00:00	6
740	Catunda	2018-06-16 00:00:00	6
741	Caucaia	2018-06-16 00:00:00	6
742	Cedro	2018-06-16 00:00:00	6
743	Chaval	2018-06-16 00:00:00	6
744	Choró	2018-06-16 00:00:00	6
745	Chorozinho	2018-06-16 00:00:00	6
746	Coreaú	2018-06-16 00:00:00	6
747	Crateús	2018-06-16 00:00:00	6
748	Crato	2018-06-16 00:00:00	6
749	Croatá	2018-06-16 00:00:00	6
750	Cruz	2018-06-16 00:00:00	6
751	Deputado Irapuan Pinheiro	2018-06-16 00:00:00	6
752	Ererê	2018-06-16 00:00:00	6
753	Eusébio	2018-06-16 00:00:00	6
754	Farias Brito	2018-06-16 00:00:00	6
755	Forquilha	2018-06-16 00:00:00	6
756	Fortaleza	2018-06-16 00:00:00	6
757	Fortim	2018-06-16 00:00:00	6
758	Frecheirinha	2018-06-16 00:00:00	6
759	General Sampaio	2018-06-16 00:00:00	6
760	Graça	2018-06-16 00:00:00	6
761	Granja	2018-06-16 00:00:00	6
762	Granjeiro	2018-06-16 00:00:00	6
763	Groaíras	2018-06-16 00:00:00	6
764	Guaiúba	2018-06-16 00:00:00	6
765	Guaraciaba do Norte	2018-06-16 00:00:00	6
766	Guaramiranga	2018-06-16 00:00:00	6
767	Hidrolândia	2018-06-16 00:00:00	6
768	Horizonte	2018-06-16 00:00:00	6
769	Ibaretama	2018-06-16 00:00:00	6
770	Ibiapina	2018-06-16 00:00:00	6
771	Ibicuitinga	2018-06-16 00:00:00	6
772	Icapuí	2018-06-16 00:00:00	6
773	Icó	2018-06-16 00:00:00	6
774	Iguatu	2018-06-16 00:00:00	6
775	Independência	2018-06-16 00:00:00	6
776	Ipaporanga	2018-06-16 00:00:00	6
777	Ipaumirim	2018-06-16 00:00:00	6
778	Ipu	2018-06-16 00:00:00	6
779	Ipueiras	2018-06-16 00:00:00	6
780	Iracema	2018-06-16 00:00:00	6
781	Irauçuba	2018-06-16 00:00:00	6
782	Itaiçaba	2018-06-16 00:00:00	6
783	Itaitinga	2018-06-16 00:00:00	6
784	Itapagé	2018-06-16 00:00:00	6
785	Itapipoca	2018-06-16 00:00:00	6
786	Itapiúna	2018-06-16 00:00:00	6
787	Itarema	2018-06-16 00:00:00	6
788	Itatira	2018-06-16 00:00:00	6
789	Jaguaretama	2018-06-16 00:00:00	6
790	Jaguaribara	2018-06-16 00:00:00	6
791	Jaguaribe	2018-06-16 00:00:00	6
792	Jaguaruana	2018-06-16 00:00:00	6
793	Jardim	2018-06-16 00:00:00	6
794	Jati	2018-06-16 00:00:00	6
795	Jijoca de Jericoacoara	2018-06-16 00:00:00	6
796	Juazeiro do Norte	2018-06-16 00:00:00	6
797	Jucás	2018-06-16 00:00:00	6
798	Lavras da Mangabeira	2018-06-16 00:00:00	6
799	Limoeiro do Norte	2018-06-16 00:00:00	6
800	Madalena	2018-06-16 00:00:00	6
801	Maracanaú	2018-06-16 00:00:00	6
802	Maranguape	2018-06-16 00:00:00	6
803	Marco	2018-06-16 00:00:00	6
804	Martinópole	2018-06-16 00:00:00	6
805	Massapê	2018-06-16 00:00:00	6
806	Mauriti	2018-06-16 00:00:00	6
807	Meruoca	2018-06-16 00:00:00	6
808	Milagres	2018-06-16 00:00:00	6
809	Milhã	2018-06-16 00:00:00	6
810	Miraíma	2018-06-16 00:00:00	6
811	Missão Velha	2018-06-16 00:00:00	6
812	Mombaça	2018-06-16 00:00:00	6
813	Monsenhor Tabosa	2018-06-16 00:00:00	6
814	Morada Nova	2018-06-16 00:00:00	6
815	Moraújo	2018-06-16 00:00:00	6
816	Morrinhos	2018-06-16 00:00:00	6
817	Mucambo	2018-06-16 00:00:00	6
818	Mulungu	2018-06-16 00:00:00	6
819	Nova Olinda	2018-06-16 00:00:00	6
820	Nova Russas	2018-06-16 00:00:00	6
821	Novo Oriente	2018-06-16 00:00:00	6
822	Ocara	2018-06-16 00:00:00	6
823	Orós	2018-06-16 00:00:00	6
824	Pacajus	2018-06-16 00:00:00	6
825	Pacatuba	2018-06-16 00:00:00	6
826	Pacoti	2018-06-16 00:00:00	6
827	Pacujá	2018-06-16 00:00:00	6
828	Palhano	2018-06-16 00:00:00	6
829	Palmácia	2018-06-16 00:00:00	6
830	Paracuru	2018-06-16 00:00:00	6
831	Paraipaba	2018-06-16 00:00:00	6
832	Parambu	2018-06-16 00:00:00	6
833	Paramoti	2018-06-16 00:00:00	6
834	Pedra Branca	2018-06-16 00:00:00	6
835	Penaforte	2018-06-16 00:00:00	6
836	Pentecoste	2018-06-16 00:00:00	6
837	Pereiro	2018-06-16 00:00:00	6
838	Pindoretama	2018-06-16 00:00:00	6
839	Piquet Carneiro	2018-06-16 00:00:00	6
840	Pires Ferreira	2018-06-16 00:00:00	6
841	Poranga	2018-06-16 00:00:00	6
842	Porteiras	2018-06-16 00:00:00	6
843	Potengi	2018-06-16 00:00:00	6
844	Potiretama	2018-06-16 00:00:00	6
845	Quiterianópolis	2018-06-16 00:00:00	6
846	Quixadá	2018-06-16 00:00:00	6
847	Quixelô	2018-06-16 00:00:00	6
848	Quixeramobim	2018-06-16 00:00:00	6
849	Quixeré	2018-06-16 00:00:00	6
850	Redenção	2018-06-16 00:00:00	6
851	Reriutaba	2018-06-16 00:00:00	6
852	Russas	2018-06-16 00:00:00	6
853	Saboeiro	2018-06-16 00:00:00	6
854	Salitre	2018-06-16 00:00:00	6
855	Santa Quitéria	2018-06-16 00:00:00	6
856	Santana do Acaraú	2018-06-16 00:00:00	6
857	Santana do Cariri	2018-06-16 00:00:00	6
858	São Benedito	2018-06-16 00:00:00	6
859	São Gonçalo do Amarante	2018-06-16 00:00:00	6
860	São João do Jaguaribe	2018-06-16 00:00:00	6
861	São Luís do Curu	2018-06-16 00:00:00	6
862	Senador Pompeu	2018-06-16 00:00:00	6
863	Senador Sá	2018-06-16 00:00:00	6
864	Sobral	2018-06-16 00:00:00	6
865	Solonópole	2018-06-16 00:00:00	6
866	Tabuleiro do Norte	2018-06-16 00:00:00	6
867	Tamboril	2018-06-16 00:00:00	6
868	Tarrafas	2018-06-16 00:00:00	6
869	Tauá	2018-06-16 00:00:00	6
870	Tejuçuoca	2018-06-16 00:00:00	6
871	Tianguá	2018-06-16 00:00:00	6
872	Trairi	2018-06-16 00:00:00	6
873	Tururu	2018-06-16 00:00:00	6
874	Ubajara	2018-06-16 00:00:00	6
875	Umari	2018-06-16 00:00:00	6
876	Umirim	2018-06-16 00:00:00	6
877	Uruburetama	2018-06-16 00:00:00	6
878	Uruoca	2018-06-16 00:00:00	6
879	Varjota	2018-06-16 00:00:00	6
880	Várzea Alegre	2018-06-16 00:00:00	6
881	Viçosa do Ceará	2018-06-16 00:00:00	6
882	Brasília	2018-06-16 00:00:00	7
883	Abadia de Goiás	2018-06-16 00:00:00	9
884	Abadiânia	2018-06-16 00:00:00	9
885	Acreúna	2018-06-16 00:00:00	9
886	Adelândia	2018-06-16 00:00:00	9
887	Água Fria de Goiás	2018-06-16 00:00:00	9
888	Água Limpa	2018-06-16 00:00:00	9
889	Águas Lindas de Goiás	2018-06-16 00:00:00	9
890	Alexânia	2018-06-16 00:00:00	9
891	Aloândia	2018-06-16 00:00:00	9
892	Alto Horizonte	2018-06-16 00:00:00	9
893	Alto Paraíso de Goiás	2018-06-16 00:00:00	9
894	Alvorada do Norte	2018-06-16 00:00:00	9
895	Amaralina	2018-06-16 00:00:00	9
896	Americano do Brasil	2018-06-16 00:00:00	9
897	Amorinópolis	2018-06-16 00:00:00	9
898	Anápolis	2018-06-16 00:00:00	9
899	Anhanguera	2018-06-16 00:00:00	9
900	Anicuns	2018-06-16 00:00:00	9
901	Aparecida de Goiânia	2018-06-16 00:00:00	9
902	Aparecida do Rio Doce	2018-06-16 00:00:00	9
903	Aporé	2018-06-16 00:00:00	9
904	Araçu	2018-06-16 00:00:00	9
905	Aragarças	2018-06-16 00:00:00	9
906	Aragoiânia	2018-06-16 00:00:00	9
907	Araguapaz	2018-06-16 00:00:00	9
908	Arenópolis	2018-06-16 00:00:00	9
909	Aruanã	2018-06-16 00:00:00	9
910	Aurilândia	2018-06-16 00:00:00	9
911	Avelinópolis	2018-06-16 00:00:00	9
912	Baliza	2018-06-16 00:00:00	9
913	Barro Alto	2018-06-16 00:00:00	9
914	Bela Vista de Goiás	2018-06-16 00:00:00	9
915	Bom Jardim de Goiás	2018-06-16 00:00:00	9
916	Bom Jesus de Goiás	2018-06-16 00:00:00	9
917	Bonfinópolis	2018-06-16 00:00:00	9
918	Bonópolis	2018-06-16 00:00:00	9
919	Brazabrantes	2018-06-16 00:00:00	9
920	Britânia	2018-06-16 00:00:00	9
921	Buriti Alegre	2018-06-16 00:00:00	9
922	Buriti de Goiás	2018-06-16 00:00:00	9
923	Buritinópolis	2018-06-16 00:00:00	9
924	Cabeceiras	2018-06-16 00:00:00	9
925	Cachoeira Alta	2018-06-16 00:00:00	9
926	Cachoeira de Goiás	2018-06-16 00:00:00	9
927	Cachoeira Dourada	2018-06-16 00:00:00	9
928	Caçu	2018-06-16 00:00:00	9
929	Caiapônia	2018-06-16 00:00:00	9
930	Caldas Novas	2018-06-16 00:00:00	9
931	Caldazinha	2018-06-16 00:00:00	9
932	Campestre de Goiás	2018-06-16 00:00:00	9
933	Campinaçu	2018-06-16 00:00:00	9
934	Campinorte	2018-06-16 00:00:00	9
935	Campo Alegre de Goiás	2018-06-16 00:00:00	9
936	Campo Limpo de Goiás	2018-06-16 00:00:00	9
937	Campos Belos	2018-06-16 00:00:00	9
938	Campos Verdes	2018-06-16 00:00:00	9
939	Carmo do Rio Verde	2018-06-16 00:00:00	9
940	Castelândia	2018-06-16 00:00:00	9
941	Catalão	2018-06-16 00:00:00	9
942	Caturaí	2018-06-16 00:00:00	9
943	Cavalcante	2018-06-16 00:00:00	9
944	Ceres	2018-06-16 00:00:00	9
945	Cezarina	2018-06-16 00:00:00	9
946	Chapadão do Céu	2018-06-16 00:00:00	9
947	Cidade Ocidental	2018-06-16 00:00:00	9
948	Cocalzinho de Goiás	2018-06-16 00:00:00	9
949	Colinas do Sul	2018-06-16 00:00:00	9
950	Córrego do Ouro	2018-06-16 00:00:00	9
951	Corumbá de Goiás	2018-06-16 00:00:00	9
952	Corumbaíba	2018-06-16 00:00:00	9
953	Cristalina	2018-06-16 00:00:00	9
954	Cristianópolis	2018-06-16 00:00:00	9
955	Crixás	2018-06-16 00:00:00	9
956	Cromínia	2018-06-16 00:00:00	9
957	Cumari	2018-06-16 00:00:00	9
958	Damianópolis	2018-06-16 00:00:00	9
959	Damolândia	2018-06-16 00:00:00	9
960	Davinópolis	2018-06-16 00:00:00	9
961	Diorama	2018-06-16 00:00:00	9
962	Divinópolis de Goiás	2018-06-16 00:00:00	9
963	Doverlândia	2018-06-16 00:00:00	9
964	Edealina	2018-06-16 00:00:00	9
965	Edéia	2018-06-16 00:00:00	9
966	Estrela do Norte	2018-06-16 00:00:00	9
967	Faina	2018-06-16 00:00:00	9
968	Fazenda Nova	2018-06-16 00:00:00	9
969	Firminópolis	2018-06-16 00:00:00	9
970	Flores de Goiás	2018-06-16 00:00:00	9
971	Formosa	2018-06-16 00:00:00	9
972	Formoso	2018-06-16 00:00:00	9
973	Gameleira de Goiás	2018-06-16 00:00:00	9
974	Goianápolis	2018-06-16 00:00:00	9
975	Goiandira	2018-06-16 00:00:00	9
976	Goianésia	2018-06-16 00:00:00	9
977	Goiânia	2018-06-16 00:00:00	9
978	Goianira	2018-06-16 00:00:00	9
979	Goiás	2018-06-16 00:00:00	9
980	Goiatuba	2018-06-16 00:00:00	9
981	Gouvelândia	2018-06-16 00:00:00	9
982	Guapó	2018-06-16 00:00:00	9
983	Guaraíta	2018-06-16 00:00:00	9
984	Guarani de Goiás	2018-06-16 00:00:00	9
985	Guarinos	2018-06-16 00:00:00	9
986	Heitoraí	2018-06-16 00:00:00	9
987	Hidrolândia	2018-06-16 00:00:00	9
988	Hidrolina	2018-06-16 00:00:00	9
989	Iaciara	2018-06-16 00:00:00	9
990	Inaciolândia	2018-06-16 00:00:00	9
991	Indiara	2018-06-16 00:00:00	9
992	Inhumas	2018-06-16 00:00:00	9
993	Ipameri	2018-06-16 00:00:00	9
994	Ipiranga de Goiás	2018-06-16 00:00:00	9
995	Iporá	2018-06-16 00:00:00	9
996	Israelândia	2018-06-16 00:00:00	9
997	Itaberaí	2018-06-16 00:00:00	9
998	Itaguari	2018-06-16 00:00:00	9
999	Itaguaru	2018-06-16 00:00:00	9
1000	Itajá	2018-06-16 00:00:00	9
1001	Itapaci	2018-06-16 00:00:00	9
1002	Itapirapuã	2018-06-16 00:00:00	9
1003	Itapuranga	2018-06-16 00:00:00	9
1004	Itarumã	2018-06-16 00:00:00	9
1005	Itauçu	2018-06-16 00:00:00	9
1006	Itumbiara	2018-06-16 00:00:00	9
1007	Ivolândia	2018-06-16 00:00:00	9
1008	Jandaia	2018-06-16 00:00:00	9
1009	Jaraguá	2018-06-16 00:00:00	9
1010	Jataí	2018-06-16 00:00:00	9
1011	Jaupaci	2018-06-16 00:00:00	9
1012	Jesúpolis	2018-06-16 00:00:00	9
1013	Joviânia	2018-06-16 00:00:00	9
1014	Jussara	2018-06-16 00:00:00	9
1015	Lagoa Santa	2018-06-16 00:00:00	9
1016	Leopoldo de Bulhões	2018-06-16 00:00:00	9
1017	Luziânia	2018-06-16 00:00:00	9
1018	Mairipotaba	2018-06-16 00:00:00	9
1019	Mambaí	2018-06-16 00:00:00	9
1020	Mara Rosa	2018-06-16 00:00:00	9
1021	Marzagão	2018-06-16 00:00:00	9
1022	Matrinchã	2018-06-16 00:00:00	9
1023	Maurilândia	2018-06-16 00:00:00	9
1024	Mimoso de Goiás	2018-06-16 00:00:00	9
1025	Minaçu	2018-06-16 00:00:00	9
1026	Mineiros	2018-06-16 00:00:00	9
1027	Moiporá	2018-06-16 00:00:00	9
1028	Monte Alegre de Goiás	2018-06-16 00:00:00	9
1029	Montes Claros de Goiás	2018-06-16 00:00:00	9
1030	Montividiu	2018-06-16 00:00:00	9
1031	Montividiu do Norte	2018-06-16 00:00:00	9
1032	Morrinhos	2018-06-16 00:00:00	9
1033	Morro Agudo de Goiás	2018-06-16 00:00:00	9
1034	Mossâmedes	2018-06-16 00:00:00	9
1035	Mozarlândia	2018-06-16 00:00:00	9
1036	Mundo Novo	2018-06-16 00:00:00	9
1037	Mutunópolis	2018-06-16 00:00:00	9
1038	Nazário	2018-06-16 00:00:00	9
1039	Nerópolis	2018-06-16 00:00:00	9
1040	Niquelândia	2018-06-16 00:00:00	9
1041	Nova América	2018-06-16 00:00:00	9
1042	Nova Aurora	2018-06-16 00:00:00	9
1043	Nova Crixás	2018-06-16 00:00:00	9
1044	Nova Glória	2018-06-16 00:00:00	9
1045	Nova Iguaçu de Goiás	2018-06-16 00:00:00	9
1046	Nova Roma	2018-06-16 00:00:00	9
1047	Nova Veneza	2018-06-16 00:00:00	9
1048	Novo Brasil	2018-06-16 00:00:00	9
1049	Novo Gama	2018-06-16 00:00:00	9
1050	Novo Planalto	2018-06-16 00:00:00	9
1051	Orizona	2018-06-16 00:00:00	9
1052	Ouro Verde de Goiás	2018-06-16 00:00:00	9
1053	Ouvidor	2018-06-16 00:00:00	9
1054	Padre Bernardo	2018-06-16 00:00:00	9
1055	Palestina de Goiás	2018-06-16 00:00:00	9
1056	Palmeiras de Goiás	2018-06-16 00:00:00	9
1057	Palmelo	2018-06-16 00:00:00	9
1058	Palminópolis	2018-06-16 00:00:00	9
1059	Panamá	2018-06-16 00:00:00	9
1060	Paranaiguara	2018-06-16 00:00:00	9
1061	Paraúna	2018-06-16 00:00:00	9
1062	Perolândia	2018-06-16 00:00:00	9
1063	Petrolina de Goiás	2018-06-16 00:00:00	9
1064	Pilar de Goiás	2018-06-16 00:00:00	9
1065	Piracanjuba	2018-06-16 00:00:00	9
1066	Piranhas	2018-06-16 00:00:00	9
1067	Pirenópolis	2018-06-16 00:00:00	9
1068	Pires do Rio	2018-06-16 00:00:00	9
1069	Planaltina	2018-06-16 00:00:00	9
1070	Pontalina	2018-06-16 00:00:00	9
1071	Porangatu	2018-06-16 00:00:00	9
1072	Porteirão	2018-06-16 00:00:00	9
1073	Portelândia	2018-06-16 00:00:00	9
1074	Posse	2018-06-16 00:00:00	9
1075	Professor Jamil	2018-06-16 00:00:00	9
1076	Quirinópolis	2018-06-16 00:00:00	9
1077	Rialma	2018-06-16 00:00:00	9
1078	Rianápolis	2018-06-16 00:00:00	9
1079	Rio Quente	2018-06-16 00:00:00	9
1080	Rio Verde	2018-06-16 00:00:00	9
1081	Rubiataba	2018-06-16 00:00:00	9
1082	Sanclerlândia	2018-06-16 00:00:00	9
1083	Santa Bárbara de Goiás	2018-06-16 00:00:00	9
1084	Santa Cruz de Goiás	2018-06-16 00:00:00	9
1085	Santa Fé de Goiás	2018-06-16 00:00:00	9
1086	Santa Helena de Goiás	2018-06-16 00:00:00	9
1087	Santa Isabel	2018-06-16 00:00:00	9
1088	Santa Rita do Araguaia	2018-06-16 00:00:00	9
1089	Santa Rita do Novo Destino	2018-06-16 00:00:00	9
1090	Santa Rosa de Goiás	2018-06-16 00:00:00	9
1091	Santa Tereza de Goiás	2018-06-16 00:00:00	9
1092	Santa Terezinha de Goiás	2018-06-16 00:00:00	9
1093	Santo Antônio da Barra	2018-06-16 00:00:00	9
1094	Santo Antônio de Goiás	2018-06-16 00:00:00	9
1095	Santo Antônio do Descoberto	2018-06-16 00:00:00	9
1096	São Domingos	2018-06-16 00:00:00	9
1097	São Francisco de Goiás	2018-06-16 00:00:00	9
1098	São João d`Aliança	2018-06-16 00:00:00	9
1099	São João da Paraúna	2018-06-16 00:00:00	9
1100	São Luís de Montes Belos	2018-06-16 00:00:00	9
1101	São Luíz do Norte	2018-06-16 00:00:00	9
1102	São Miguel do Araguaia	2018-06-16 00:00:00	9
1103	São Miguel do Passa Quatro	2018-06-16 00:00:00	9
1104	São Patrício	2018-06-16 00:00:00	9
1105	São Simão	2018-06-16 00:00:00	9
1106	Senador Canedo	2018-06-16 00:00:00	9
1107	Serranópolis	2018-06-16 00:00:00	9
1108	Silvânia	2018-06-16 00:00:00	9
1109	Simolândia	2018-06-16 00:00:00	9
1110	Sítio d`Abadia	2018-06-16 00:00:00	9
1111	Taquaral de Goiás	2018-06-16 00:00:00	9
1112	Teresina de Goiás	2018-06-16 00:00:00	9
1113	Terezópolis de Goiás	2018-06-16 00:00:00	9
1114	Três Ranchos	2018-06-16 00:00:00	9
1115	Trindade	2018-06-16 00:00:00	9
1116	Trombas	2018-06-16 00:00:00	9
1117	Turvânia	2018-06-16 00:00:00	9
1118	Turvelândia	2018-06-16 00:00:00	9
1119	Uirapuru	2018-06-16 00:00:00	9
1120	Uruaçu	2018-06-16 00:00:00	9
1121	Uruana	2018-06-16 00:00:00	9
1122	Urutaí	2018-06-16 00:00:00	9
1123	Valparaíso de Goiás	2018-06-16 00:00:00	9
1124	Varjão	2018-06-16 00:00:00	9
1125	Vianópolis	2018-06-16 00:00:00	9
1126	Vicentinópolis	2018-06-16 00:00:00	9
1127	Vila Boa	2018-06-16 00:00:00	9
1128	Vila Propício	2018-06-16 00:00:00	9
1129	Açailândia	2018-06-16 00:00:00	10
1130	Afonso Cunha	2018-06-16 00:00:00	10
1131	Água Doce do Maranhão	2018-06-16 00:00:00	10
1132	Alcântara	2018-06-16 00:00:00	10
1133	Aldeias Altas	2018-06-16 00:00:00	10
1134	Altamira do Maranhão	2018-06-16 00:00:00	10
1135	Alto Alegre do Maranhão	2018-06-16 00:00:00	10
1136	Alto Alegre do Pindaré	2018-06-16 00:00:00	10
1137	Alto Parnaíba	2018-06-16 00:00:00	10
1138	Amapá do Maranhão	2018-06-16 00:00:00	10
1139	Amarante do Maranhão	2018-06-16 00:00:00	10
1140	Anajatuba	2018-06-16 00:00:00	10
1141	Anapurus	2018-06-16 00:00:00	10
1142	Apicum-Açu	2018-06-16 00:00:00	10
1143	Araguanã	2018-06-16 00:00:00	10
1144	Araioses	2018-06-16 00:00:00	10
1145	Arame	2018-06-16 00:00:00	10
1146	Arari	2018-06-16 00:00:00	10
1147	Axixá	2018-06-16 00:00:00	10
1148	Bacabal	2018-06-16 00:00:00	10
1149	Bacabeira	2018-06-16 00:00:00	10
1150	Bacuri	2018-06-16 00:00:00	10
1151	Bacurituba	2018-06-16 00:00:00	10
1152	Balsas	2018-06-16 00:00:00	10
1153	Barão de Grajaú	2018-06-16 00:00:00	10
1154	Barra do Corda	2018-06-16 00:00:00	10
1155	Barreirinhas	2018-06-16 00:00:00	10
1156	Bela Vista do Maranhão	2018-06-16 00:00:00	10
1157	Belágua	2018-06-16 00:00:00	10
1158	Benedito Leite	2018-06-16 00:00:00	10
1159	Bequimão	2018-06-16 00:00:00	10
1160	Bernardo do Mearim	2018-06-16 00:00:00	10
1161	Boa Vista do Gurupi	2018-06-16 00:00:00	10
1162	Bom Jardim	2018-06-16 00:00:00	10
1163	Bom Jesus das Selvas	2018-06-16 00:00:00	10
1164	Bom Lugar	2018-06-16 00:00:00	10
1165	Brejo	2018-06-16 00:00:00	10
1166	Brejo de Areia	2018-06-16 00:00:00	10
1167	Buriti	2018-06-16 00:00:00	10
1168	Buriti Bravo	2018-06-16 00:00:00	10
1169	Buriticupu	2018-06-16 00:00:00	10
1170	Buritirana	2018-06-16 00:00:00	10
1171	Cachoeira Grande	2018-06-16 00:00:00	10
1172	Cajapió	2018-06-16 00:00:00	10
1173	Cajari	2018-06-16 00:00:00	10
1174	Campestre do Maranhão	2018-06-16 00:00:00	10
1175	Cândido Mendes	2018-06-16 00:00:00	10
1176	Cantanhede	2018-06-16 00:00:00	10
1177	Capinzal do Norte	2018-06-16 00:00:00	10
1178	Carolina	2018-06-16 00:00:00	10
1179	Carutapera	2018-06-16 00:00:00	10
1180	Caxias	2018-06-16 00:00:00	10
1181	Cedral	2018-06-16 00:00:00	10
1182	Central do Maranhão	2018-06-16 00:00:00	10
1183	Centro do Guilherme	2018-06-16 00:00:00	10
1184	Centro Novo do Maranhão	2018-06-16 00:00:00	10
1185	Chapadinha	2018-06-16 00:00:00	10
1186	Cidelândia	2018-06-16 00:00:00	10
1187	Codó	2018-06-16 00:00:00	10
1188	Coelho Neto	2018-06-16 00:00:00	10
1189	Colinas	2018-06-16 00:00:00	10
1190	Conceição do Lago-Açu	2018-06-16 00:00:00	10
1191	Coroatá	2018-06-16 00:00:00	10
1192	Cururupu	2018-06-16 00:00:00	10
1193	Davinópolis	2018-06-16 00:00:00	10
1194	Dom Pedro	2018-06-16 00:00:00	10
1195	Duque Bacelar	2018-06-16 00:00:00	10
1196	Esperantinópolis	2018-06-16 00:00:00	10
1197	Estreito	2018-06-16 00:00:00	10
1198	Feira Nova do Maranhão	2018-06-16 00:00:00	10
1199	Fernando Falcão	2018-06-16 00:00:00	10
1200	Formosa da Serra Negra	2018-06-16 00:00:00	10
1201	Fortaleza dos Nogueiras	2018-06-16 00:00:00	10
1202	Fortuna	2018-06-16 00:00:00	10
1203	Godofredo Viana	2018-06-16 00:00:00	10
1204	Gonçalves Dias	2018-06-16 00:00:00	10
1205	Governador Archer	2018-06-16 00:00:00	10
1206	Governador Edison Lobão	2018-06-16 00:00:00	10
1207	Governador Eugênio Barros	2018-06-16 00:00:00	10
1208	Governador Luiz Rocha	2018-06-16 00:00:00	10
1209	Governador Newton Bello	2018-06-16 00:00:00	10
1210	Governador Nunes Freire	2018-06-16 00:00:00	10
1211	Graça Aranha	2018-06-16 00:00:00	10
1212	Grajaú	2018-06-16 00:00:00	10
1213	Guimarães	2018-06-16 00:00:00	10
1214	Humberto de Campos	2018-06-16 00:00:00	10
1215	Icatu	2018-06-16 00:00:00	10
1216	Igarapé do Meio	2018-06-16 00:00:00	10
1217	Igarapé Grande	2018-06-16 00:00:00	10
1218	Imperatriz	2018-06-16 00:00:00	10
1219	Itaipava do Grajaú	2018-06-16 00:00:00	10
1220	Itapecuru Mirim	2018-06-16 00:00:00	10
1221	Itinga do Maranhão	2018-06-16 00:00:00	10
1222	Jatobá	2018-06-16 00:00:00	10
1223	Jenipapo dos Vieiras	2018-06-16 00:00:00	10
1224	João Lisboa	2018-06-16 00:00:00	10
1225	Joselândia	2018-06-16 00:00:00	10
1226	Junco do Maranhão	2018-06-16 00:00:00	10
1227	Lago da Pedra	2018-06-16 00:00:00	10
1228	Lago do Junco	2018-06-16 00:00:00	10
1229	Lago dos Rodrigues	2018-06-16 00:00:00	10
1230	Lago Verde	2018-06-16 00:00:00	10
1231	Lagoa do Mato	2018-06-16 00:00:00	10
1232	Lagoa Grande do Maranhão	2018-06-16 00:00:00	10
1233	Lajeado Novo	2018-06-16 00:00:00	10
1234	Lima Campos	2018-06-16 00:00:00	10
1235	Loreto	2018-06-16 00:00:00	10
1236	Luís Domingues	2018-06-16 00:00:00	10
1237	Magalhães de Almeida	2018-06-16 00:00:00	10
1238	Maracaçumé	2018-06-16 00:00:00	10
1239	Marajá do Sena	2018-06-16 00:00:00	10
1240	Maranhãozinho	2018-06-16 00:00:00	10
1241	Mata Roma	2018-06-16 00:00:00	10
1242	Matinha	2018-06-16 00:00:00	10
1243	Matões	2018-06-16 00:00:00	10
1244	Matões do Norte	2018-06-16 00:00:00	10
1245	Milagres do Maranhão	2018-06-16 00:00:00	10
1246	Mirador	2018-06-16 00:00:00	10
1247	Miranda do Norte	2018-06-16 00:00:00	10
1248	Mirinzal	2018-06-16 00:00:00	10
1249	Monção	2018-06-16 00:00:00	10
1250	Montes Altos	2018-06-16 00:00:00	10
1251	Morros	2018-06-16 00:00:00	10
1252	Nina Rodrigues	2018-06-16 00:00:00	10
1253	Nova Colinas	2018-06-16 00:00:00	10
1254	Nova Iorque	2018-06-16 00:00:00	10
1255	Nova Olinda do Maranhão	2018-06-16 00:00:00	10
1256	Olho d`Água das Cunhãs	2018-06-16 00:00:00	10
1257	Olinda Nova do Maranhão	2018-06-16 00:00:00	10
1258	Paço do Lumiar	2018-06-16 00:00:00	10
1259	Palmeirândia	2018-06-16 00:00:00	10
1260	Paraibano	2018-06-16 00:00:00	10
1261	Parnarama	2018-06-16 00:00:00	10
1262	Passagem Franca	2018-06-16 00:00:00	10
1263	Pastos Bons	2018-06-16 00:00:00	10
1264	Paulino Neves	2018-06-16 00:00:00	10
1265	Paulo Ramos	2018-06-16 00:00:00	10
1266	Pedreiras	2018-06-16 00:00:00	10
1267	Pedro do Rosário	2018-06-16 00:00:00	10
1268	Penalva	2018-06-16 00:00:00	10
1269	Peri Mirim	2018-06-16 00:00:00	10
1270	Peritoró	2018-06-16 00:00:00	10
1271	Pindaré-Mirim	2018-06-16 00:00:00	10
1272	Pinheiro	2018-06-16 00:00:00	10
1273	Pio XII	2018-06-16 00:00:00	10
1274	Pirapemas	2018-06-16 00:00:00	10
1275	Poção de Pedras	2018-06-16 00:00:00	10
1276	Porto Franco	2018-06-16 00:00:00	10
1277	Porto Rico do Maranhão	2018-06-16 00:00:00	10
1278	Presidente Dutra	2018-06-16 00:00:00	10
1279	Presidente Juscelino	2018-06-16 00:00:00	10
1280	Presidente Médici	2018-06-16 00:00:00	10
1281	Presidente Sarney	2018-06-16 00:00:00	10
1282	Presidente Vargas	2018-06-16 00:00:00	10
1283	Primeira Cruz	2018-06-16 00:00:00	10
1284	Raposa	2018-06-16 00:00:00	10
1285	Riachão	2018-06-16 00:00:00	10
1286	Ribamar Fiquene	2018-06-16 00:00:00	10
1287	Rosário	2018-06-16 00:00:00	10
1288	Sambaíba	2018-06-16 00:00:00	10
1289	Santa Filomena do Maranhão	2018-06-16 00:00:00	10
1290	Santa Helena	2018-06-16 00:00:00	10
1291	Santa Inês	2018-06-16 00:00:00	10
1292	Santa Luzia	2018-06-16 00:00:00	10
1293	Santa Luzia do Paruá	2018-06-16 00:00:00	10
1294	Santa Quitéria do Maranhão	2018-06-16 00:00:00	10
1295	Santa Rita	2018-06-16 00:00:00	10
1296	Santana do Maranhão	2018-06-16 00:00:00	10
1297	Santo Amaro do Maranhão	2018-06-16 00:00:00	10
1298	Santo Antônio dos Lopes	2018-06-16 00:00:00	10
1299	São Benedito do Rio Preto	2018-06-16 00:00:00	10
1300	São Bento	2018-06-16 00:00:00	10
1301	São Bernardo	2018-06-16 00:00:00	10
1302	São Domingos do Azeitão	2018-06-16 00:00:00	10
1303	São Domingos do Maranhão	2018-06-16 00:00:00	10
1304	São Félix de Balsas	2018-06-16 00:00:00	10
1305	São Francisco do Brejão	2018-06-16 00:00:00	10
1306	São Francisco do Maranhão	2018-06-16 00:00:00	10
1307	São João Batista	2018-06-16 00:00:00	10
1308	São João do Carú	2018-06-16 00:00:00	10
1309	São João do Paraíso	2018-06-16 00:00:00	10
1310	São João do Soter	2018-06-16 00:00:00	10
1311	São João dos Patos	2018-06-16 00:00:00	10
1312	São José de Ribamar	2018-06-16 00:00:00	10
1313	São José dos Basílios	2018-06-16 00:00:00	10
1314	São Luís	2018-06-16 00:00:00	10
1315	São Luís Gonzaga do Maranhão	2018-06-16 00:00:00	10
1316	São Mateus do Maranhão	2018-06-16 00:00:00	10
1317	São Pedro da Água Branca	2018-06-16 00:00:00	10
1318	São Pedro dos Crentes	2018-06-16 00:00:00	10
1319	São Raimundo das Mangabeiras	2018-06-16 00:00:00	10
1320	São Raimundo do Doca Bezerra	2018-06-16 00:00:00	10
1321	São Roberto	2018-06-16 00:00:00	10
1322	São Vicente Ferrer	2018-06-16 00:00:00	10
1323	Satubinha	2018-06-16 00:00:00	10
1324	Senador Alexandre Costa	2018-06-16 00:00:00	10
1325	Senador La Rocque	2018-06-16 00:00:00	10
1326	Serrano do Maranhão	2018-06-16 00:00:00	10
1327	Sítio Novo	2018-06-16 00:00:00	10
1328	Sucupira do Norte	2018-06-16 00:00:00	10
1329	Sucupira do Riachão	2018-06-16 00:00:00	10
1330	Tasso Fragoso	2018-06-16 00:00:00	10
1331	Timbiras	2018-06-16 00:00:00	10
1332	Timon	2018-06-16 00:00:00	10
1333	Trizidela do Vale	2018-06-16 00:00:00	10
1334	Tufilândia	2018-06-16 00:00:00	10
1335	Tuntum	2018-06-16 00:00:00	10
1336	Turiaçu	2018-06-16 00:00:00	10
1337	Turilândia	2018-06-16 00:00:00	10
1338	Tutóia	2018-06-16 00:00:00	10
1339	Urbano Santos	2018-06-16 00:00:00	10
1340	Vargem Grande	2018-06-16 00:00:00	10
1341	Viana	2018-06-16 00:00:00	10
1342	Vila Nova dos Martírios	2018-06-16 00:00:00	10
1343	Vitória do Mearim	2018-06-16 00:00:00	10
1344	Vitorino Freire	2018-06-16 00:00:00	10
1345	Zé Doca	2018-06-16 00:00:00	10
1346	Acorizal	2018-06-16 00:00:00	13
1347	Água Boa	2018-06-16 00:00:00	13
1348	Alta Floresta	2018-06-16 00:00:00	13
1349	Alto Araguaia	2018-06-16 00:00:00	13
1350	Alto Boa Vista	2018-06-16 00:00:00	13
1351	Alto Garças	2018-06-16 00:00:00	13
1352	Alto Paraguai	2018-06-16 00:00:00	13
1353	Alto Taquari	2018-06-16 00:00:00	13
1354	Apiacás	2018-06-16 00:00:00	13
1355	Araguaiana	2018-06-16 00:00:00	13
1356	Araguainha	2018-06-16 00:00:00	13
1357	Araputanga	2018-06-16 00:00:00	13
1358	Arenápolis	2018-06-16 00:00:00	13
1359	Aripuanã	2018-06-16 00:00:00	13
1360	Barão de Melgaço	2018-06-16 00:00:00	13
1361	Barra do Bugres	2018-06-16 00:00:00	13
1362	Barra do Garças	2018-06-16 00:00:00	13
1363	Bom Jesus do Araguaia	2018-06-16 00:00:00	13
1364	Brasnorte	2018-06-16 00:00:00	13
1365	Cáceres	2018-06-16 00:00:00	13
1366	Campinápolis	2018-06-16 00:00:00	13
1367	Campo Novo do Parecis	2018-06-16 00:00:00	13
1368	Campo Verde	2018-06-16 00:00:00	13
1369	Campos de Júlio	2018-06-16 00:00:00	13
1370	Canabrava do Norte	2018-06-16 00:00:00	13
1371	Canarana	2018-06-16 00:00:00	13
1372	Carlinda	2018-06-16 00:00:00	13
1373	Castanheira	2018-06-16 00:00:00	13
1374	Chapada dos Guimarães	2018-06-16 00:00:00	13
1375	Cláudia	2018-06-16 00:00:00	13
1376	Cocalinho	2018-06-16 00:00:00	13
1377	Colíder	2018-06-16 00:00:00	13
1378	Colniza	2018-06-16 00:00:00	13
1379	Comodoro	2018-06-16 00:00:00	13
1380	Confresa	2018-06-16 00:00:00	13
1381	Conquista d`Oeste	2018-06-16 00:00:00	13
1382	Cotriguaçu	2018-06-16 00:00:00	13
1383	Cuiabá	2018-06-16 00:00:00	13
1384	Curvelândia	2018-06-16 00:00:00	13
1386	Denise	2018-06-16 00:00:00	13
1387	Diamantino	2018-06-16 00:00:00	13
1388	Dom Aquino	2018-06-16 00:00:00	13
1389	Feliz Natal	2018-06-16 00:00:00	13
1390	Figueirópolis d`Oeste	2018-06-16 00:00:00	13
1391	Gaúcha do Norte	2018-06-16 00:00:00	13
1392	General Carneiro	2018-06-16 00:00:00	13
1393	Glória d`Oeste	2018-06-16 00:00:00	13
1394	Guarantã do Norte	2018-06-16 00:00:00	13
1395	Guiratinga	2018-06-16 00:00:00	13
1396	Indiavaí	2018-06-16 00:00:00	13
1397	Ipiranga do Norte	2018-06-16 00:00:00	13
1398	Itanhangá	2018-06-16 00:00:00	13
1399	Itaúba	2018-06-16 00:00:00	13
1400	Itiquira	2018-06-16 00:00:00	13
1401	Jaciara	2018-06-16 00:00:00	13
1402	Jangada	2018-06-16 00:00:00	13
1403	Jauru	2018-06-16 00:00:00	13
1404	Juara	2018-06-16 00:00:00	13
1405	Juína	2018-06-16 00:00:00	13
1406	Juruena	2018-06-16 00:00:00	13
1407	Juscimeira	2018-06-16 00:00:00	13
1408	Lambari d`Oeste	2018-06-16 00:00:00	13
1409	Lucas do Rio Verde	2018-06-16 00:00:00	13
1410	Luciára	2018-06-16 00:00:00	13
1411	Marcelândia	2018-06-16 00:00:00	13
1412	Matupá	2018-06-16 00:00:00	13
1413	Mirassol d`Oeste	2018-06-16 00:00:00	13
1414	Nobres	2018-06-16 00:00:00	13
1415	Nortelândia	2018-06-16 00:00:00	13
1416	Nossa Senhora do Livramento	2018-06-16 00:00:00	13
1417	Nova Bandeirantes	2018-06-16 00:00:00	13
1418	Nova Brasilândia	2018-06-16 00:00:00	13
1419	Nova Canaã do Norte	2018-06-16 00:00:00	13
1420	Nova Guarita	2018-06-16 00:00:00	13
1421	Nova Lacerda	2018-06-16 00:00:00	13
1422	Nova Marilândia	2018-06-16 00:00:00	13
1423	Nova Maringá	2018-06-16 00:00:00	13
1424	Nova Monte verde	2018-06-16 00:00:00	13
1425	Nova Mutum	2018-06-16 00:00:00	13
1426	Nova Olímpia	2018-06-16 00:00:00	13
1427	Nova Santa Helena	2018-06-16 00:00:00	13
1428	Nova Ubiratã	2018-06-16 00:00:00	13
1429	Nova Xavantina	2018-06-16 00:00:00	13
1559	Sonora	2018-06-16 00:00:00	12
1430	Novo Horizonte do Norte	2018-06-16 00:00:00	13
1431	Novo Mundo	2018-06-16 00:00:00	13
1432	Novo Santo Antônio	2018-06-16 00:00:00	13
1433	Novo São Joaquim	2018-06-16 00:00:00	13
1434	Paranaíta	2018-06-16 00:00:00	13
1435	Paranatinga	2018-06-16 00:00:00	13
1436	Pedra Preta	2018-06-16 00:00:00	13
1437	Peixoto de Azevedo	2018-06-16 00:00:00	13
1438	Planalto da Serra	2018-06-16 00:00:00	13
1439	Poconé	2018-06-16 00:00:00	13
1440	Pontal do Araguaia	2018-06-16 00:00:00	13
1441	Ponte Branca	2018-06-16 00:00:00	13
1442	Pontes e Lacerda	2018-06-16 00:00:00	13
1443	Porto Alegre do Norte	2018-06-16 00:00:00	13
1444	Porto dos Gaúchos	2018-06-16 00:00:00	13
1445	Porto Esperidião	2018-06-16 00:00:00	13
1446	Porto Estrela	2018-06-16 00:00:00	13
1447	Poxoréo	2018-06-16 00:00:00	13
1448	Primavera do Leste	2018-06-16 00:00:00	13
1449	Querência	2018-06-16 00:00:00	13
1450	Reserva do Cabaçal	2018-06-16 00:00:00	13
1451	Ribeirão Cascalheira	2018-06-16 00:00:00	13
1452	Ribeirãozinho	2018-06-16 00:00:00	13
1453	Rio Branco	2018-06-16 00:00:00	13
1454	Rondolândia	2018-06-16 00:00:00	13
1455	Rondonópolis	2018-06-16 00:00:00	13
1456	Rosário Oeste	2018-06-16 00:00:00	13
1457	Salto do Céu	2018-06-16 00:00:00	13
1458	Santa Carmem	2018-06-16 00:00:00	13
1459	Santa Cruz do Xingu	2018-06-16 00:00:00	13
1460	Santa Rita do Trivelato	2018-06-16 00:00:00	13
1461	Santa Terezinha	2018-06-16 00:00:00	13
1462	Santo Afonso	2018-06-16 00:00:00	13
1463	Santo Antônio do Leste	2018-06-16 00:00:00	13
1464	Santo Antônio do Leverger	2018-06-16 00:00:00	13
1465	São Félix do Araguaia	2018-06-16 00:00:00	13
1466	São José do Povo	2018-06-16 00:00:00	13
1467	São José do Rio Claro	2018-06-16 00:00:00	13
1468	São José do Xingu	2018-06-16 00:00:00	13
1469	São José dos Quatro Marcos	2018-06-16 00:00:00	13
1470	São Pedro da Cipa	2018-06-16 00:00:00	13
1471	Sapezal	2018-06-16 00:00:00	13
1472	Serra Nova Dourada	2018-06-16 00:00:00	13
1473	Sinop	2018-06-16 00:00:00	13
1474	Sorriso	2018-06-16 00:00:00	13
1475	Tabaporã	2018-06-16 00:00:00	13
1476	Tangará da Serra	2018-06-16 00:00:00	13
1477	Tapurah	2018-06-16 00:00:00	13
1478	Terra Nova do Norte	2018-06-16 00:00:00	13
1479	Tesouro	2018-06-16 00:00:00	13
1480	Torixoréu	2018-06-16 00:00:00	13
1481	União do Sul	2018-06-16 00:00:00	13
1482	Vale de São Domingos	2018-06-16 00:00:00	13
1483	Várzea Grande	2018-06-16 00:00:00	13
1484	Vera	2018-06-16 00:00:00	13
1485	Vila Bela da Santíssima Trindade	2018-06-16 00:00:00	13
1486	Vila Rica	2018-06-16 00:00:00	13
1487	Água Clara	2018-06-16 00:00:00	12
1488	Alcinópolis	2018-06-16 00:00:00	12
1489	Amambaí	2018-06-16 00:00:00	12
1490	Anastácio	2018-06-16 00:00:00	12
1491	Anaurilândia	2018-06-16 00:00:00	12
1492	Angélica	2018-06-16 00:00:00	12
1493	Antônio João	2018-06-16 00:00:00	12
1494	Aparecida do Taboado	2018-06-16 00:00:00	12
1495	Aquidauana	2018-06-16 00:00:00	12
1496	Aral Moreira	2018-06-16 00:00:00	12
1497	Bandeirantes	2018-06-16 00:00:00	12
1498	Bataguassu	2018-06-16 00:00:00	12
1500	Bela Vista	2018-06-16 00:00:00	12
1501	Bodoquena	2018-06-16 00:00:00	12
1502	Bonito	2018-06-16 00:00:00	12
1503	Brasilândia	2018-06-16 00:00:00	12
1504	Caarapó	2018-06-16 00:00:00	12
1505	Camapuã	2018-06-16 00:00:00	12
1506	Campo Grande	2018-06-16 00:00:00	12
1507	Caracol	2018-06-16 00:00:00	12
1508	Cassilândia	2018-06-16 00:00:00	12
1509	Chapadão do Sul	2018-06-16 00:00:00	12
1510	Corguinho	2018-06-16 00:00:00	12
1511	Coronel Sapucaia	2018-06-16 00:00:00	12
1512	Corumbá	2018-06-16 00:00:00	12
1513	Costa Rica	2018-06-16 00:00:00	12
1514	Coxim	2018-06-16 00:00:00	12
1515	Deodápolis	2018-06-16 00:00:00	12
1516	Dois Irmãos do Buriti	2018-06-16 00:00:00	12
1517	Douradina	2018-06-16 00:00:00	12
1518	Dourados	2018-06-16 00:00:00	12
1519	Eldorado	2018-06-16 00:00:00	12
1520	Fátima do Sul	2018-06-16 00:00:00	12
1521	Figueirão	2018-06-16 00:00:00	12
1522	Glória de Dourados	2018-06-16 00:00:00	12
1523	Guia Lopes da Laguna	2018-06-16 00:00:00	12
1524	Iguatemi	2018-06-16 00:00:00	12
1525	Inocência	2018-06-16 00:00:00	12
1526	Itaporã	2018-06-16 00:00:00	12
1527	Itaquiraí	2018-06-16 00:00:00	12
1528	Ivinhema	2018-06-16 00:00:00	12
1529	Japorã	2018-06-16 00:00:00	12
1530	Jaraguari	2018-06-16 00:00:00	12
1531	Jardim	2018-06-16 00:00:00	12
1532	Jateí	2018-06-16 00:00:00	12
1533	Juti	2018-06-16 00:00:00	12
1534	Ladário	2018-06-16 00:00:00	12
1535	Laguna Carapã	2018-06-16 00:00:00	12
1536	Maracaju	2018-06-16 00:00:00	12
1537	Miranda	2018-06-16 00:00:00	12
1538	Mundo Novo	2018-06-16 00:00:00	12
1539	Naviraí	2018-06-16 00:00:00	12
1540	Nioaque	2018-06-16 00:00:00	12
1541	Nova Alvorada do Sul	2018-06-16 00:00:00	12
1542	Nova Andradina	2018-06-16 00:00:00	12
1543	Novo Horizonte do Sul	2018-06-16 00:00:00	12
1544	Paranaíba	2018-06-16 00:00:00	12
1545	Paranhos	2018-06-16 00:00:00	12
1546	Pedro Gomes	2018-06-16 00:00:00	12
1547	Ponta Porã	2018-06-16 00:00:00	12
1548	Porto Murtinho	2018-06-16 00:00:00	12
1549	Ribas do Rio Pardo	2018-06-16 00:00:00	12
1550	Rio Brilhante	2018-06-16 00:00:00	12
1551	Rio Negro	2018-06-16 00:00:00	12
1552	Rio Verde de Mato Grosso	2018-06-16 00:00:00	12
1553	Rochedo	2018-06-16 00:00:00	12
1554	Santa Rita do Pardo	2018-06-16 00:00:00	12
1555	São Gabriel do Oeste	2018-06-16 00:00:00	12
1556	Selvíria	2018-06-16 00:00:00	12
1557	Sete Quedas	2018-06-16 00:00:00	12
1558	Sidrolândia	2018-06-16 00:00:00	12
1560	Tacuru	2018-06-16 00:00:00	12
1561	Taquarussu	2018-06-16 00:00:00	12
1562	Terenos	2018-06-16 00:00:00	12
1563	Três Lagoas	2018-06-16 00:00:00	12
1564	Vicentina	2018-06-16 00:00:00	12
1565	Abadia dos Dourados	2018-06-16 00:00:00	11
1566	Abaeté	2018-06-16 00:00:00	11
1567	Abre Campo	2018-06-16 00:00:00	11
1568	Acaiaca	2018-06-16 00:00:00	11
1569	Açucena	2018-06-16 00:00:00	11
1570	Água Boa	2018-06-16 00:00:00	11
1571	Água Comprida	2018-06-16 00:00:00	11
1572	Aguanil	2018-06-16 00:00:00	11
1573	Águas Formosas	2018-06-16 00:00:00	11
1574	Águas Vermelhas	2018-06-16 00:00:00	11
1575	Aimorés	2018-06-16 00:00:00	11
1576	Aiuruoca	2018-06-16 00:00:00	11
1577	Alagoa	2018-06-16 00:00:00	11
1578	Albertina	2018-06-16 00:00:00	11
1579	Além Paraíba	2018-06-16 00:00:00	11
1580	Alfenas	2018-06-16 00:00:00	11
1581	Alfredo Vasconcelos	2018-06-16 00:00:00	11
1582	Almenara	2018-06-16 00:00:00	11
1583	Alpercata	2018-06-16 00:00:00	11
1584	Alpinópolis	2018-06-16 00:00:00	11
1585	Alterosa	2018-06-16 00:00:00	11
1586	Alto Caparaó	2018-06-16 00:00:00	11
1587	Alto Jequitibá	2018-06-16 00:00:00	11
1588	Alto Rio Doce	2018-06-16 00:00:00	11
1589	Alvarenga	2018-06-16 00:00:00	11
1590	Alvinópolis	2018-06-16 00:00:00	11
1591	Alvorada de Minas	2018-06-16 00:00:00	11
1592	Amparo do Serra	2018-06-16 00:00:00	11
1593	Andradas	2018-06-16 00:00:00	11
1594	Andrelândia	2018-06-16 00:00:00	11
1595	Angelândia	2018-06-16 00:00:00	11
1596	Antônio Carlos	2018-06-16 00:00:00	11
1597	Antônio Dias	2018-06-16 00:00:00	11
1598	Antônio Prado de Minas	2018-06-16 00:00:00	11
1599	Araçaí	2018-06-16 00:00:00	11
1600	Aracitaba	2018-06-16 00:00:00	11
1601	Araçuaí	2018-06-16 00:00:00	11
1602	Araguari	2018-06-16 00:00:00	11
1603	Arantina	2018-06-16 00:00:00	11
1604	Araponga	2018-06-16 00:00:00	11
1605	Araporã	2018-06-16 00:00:00	11
1606	Arapuá	2018-06-16 00:00:00	11
1607	Araújos	2018-06-16 00:00:00	11
1608	Araxá	2018-06-16 00:00:00	11
1609	Arceburgo	2018-06-16 00:00:00	11
1610	Arcos	2018-06-16 00:00:00	11
1611	Areado	2018-06-16 00:00:00	11
1612	Argirita	2018-06-16 00:00:00	11
1613	Aricanduva	2018-06-16 00:00:00	11
1614	Arinos	2018-06-16 00:00:00	11
1615	Astolfo Dutra	2018-06-16 00:00:00	11
1616	Ataléia	2018-06-16 00:00:00	11
1617	Augusto de Lima	2018-06-16 00:00:00	11
1618	Baependi	2018-06-16 00:00:00	11
1619	Baldim	2018-06-16 00:00:00	11
1620	Bambuí	2018-06-16 00:00:00	11
1621	Bandeira	2018-06-16 00:00:00	11
1622	Bandeira do Sul	2018-06-16 00:00:00	11
1623	Barão de Cocais	2018-06-16 00:00:00	11
1624	Barão de Monte Alto	2018-06-16 00:00:00	11
1625	Barbacena	2018-06-16 00:00:00	11
1626	Barra Longa	2018-06-16 00:00:00	11
1627	Barroso	2018-06-16 00:00:00	11
1628	Bela Vista de Minas	2018-06-16 00:00:00	11
1629	Belmiro Braga	2018-06-16 00:00:00	11
1630	Belo Horizonte	2018-06-16 00:00:00	11
1631	Belo Oriente	2018-06-16 00:00:00	11
1632	Belo Vale	2018-06-16 00:00:00	11
1633	Berilo	2018-06-16 00:00:00	11
1634	Berizal	2018-06-16 00:00:00	11
1635	Bertópolis	2018-06-16 00:00:00	11
1636	Betim	2018-06-16 00:00:00	11
1637	Bias Fortes	2018-06-16 00:00:00	11
1638	Bicas	2018-06-16 00:00:00	11
1639	Biquinhas	2018-06-16 00:00:00	11
1640	Boa Esperança	2018-06-16 00:00:00	11
1641	Bocaina de Minas	2018-06-16 00:00:00	11
1642	Bocaiúva	2018-06-16 00:00:00	11
1643	Bom Despacho	2018-06-16 00:00:00	11
1644	Bom Jardim de Minas	2018-06-16 00:00:00	11
1645	Bom Jesus da Penha	2018-06-16 00:00:00	11
1646	Bom Jesus do Amparo	2018-06-16 00:00:00	11
1647	Bom Jesus do Galho	2018-06-16 00:00:00	11
1648	Bom Repouso	2018-06-16 00:00:00	11
1649	Bom Sucesso	2018-06-16 00:00:00	11
1650	Bonfim	2018-06-16 00:00:00	11
1651	Bonfinópolis de Minas	2018-06-16 00:00:00	11
1652	Bonito de Minas	2018-06-16 00:00:00	11
1653	Borda da Mata	2018-06-16 00:00:00	11
1654	Botelhos	2018-06-16 00:00:00	11
1655	Botumirim	2018-06-16 00:00:00	11
1656	Brás Pires	2018-06-16 00:00:00	11
1657	Brasilândia de Minas	2018-06-16 00:00:00	11
1658	Brasília de Minas	2018-06-16 00:00:00	11
1659	Brasópolis	2018-06-16 00:00:00	11
1660	Braúnas	2018-06-16 00:00:00	11
1661	Brumadinho	2018-06-16 00:00:00	11
1662	Bueno Brandão	2018-06-16 00:00:00	11
1663	Buenópolis	2018-06-16 00:00:00	11
1664	Bugre	2018-06-16 00:00:00	11
1665	Buritis	2018-06-16 00:00:00	11
1666	Buritizeiro	2018-06-16 00:00:00	11
1667	Cabeceira Grande	2018-06-16 00:00:00	11
1668	Cabo Verde	2018-06-16 00:00:00	11
1669	Cachoeira da Prata	2018-06-16 00:00:00	11
1670	Cachoeira de Minas	2018-06-16 00:00:00	11
1671	Cachoeira de Pajeú	2018-06-16 00:00:00	11
1672	Cachoeira Dourada	2018-06-16 00:00:00	11
1673	Caetanópolis	2018-06-16 00:00:00	11
1674	Caeté	2018-06-16 00:00:00	11
1675	Caiana	2018-06-16 00:00:00	11
1676	Cajuri	2018-06-16 00:00:00	11
1677	Caldas	2018-06-16 00:00:00	11
1678	Camacho	2018-06-16 00:00:00	11
1679	Camanducaia	2018-06-16 00:00:00	11
1680	Cambuí	2018-06-16 00:00:00	11
1681	Cambuquira	2018-06-16 00:00:00	11
1682	Campanário	2018-06-16 00:00:00	11
1683	Campanha	2018-06-16 00:00:00	11
1684	Campestre	2018-06-16 00:00:00	11
1685	Campina Verde	2018-06-16 00:00:00	11
1686	Campo Azul	2018-06-16 00:00:00	11
1687	Campo Belo	2018-06-16 00:00:00	11
1688	Campo do Meio	2018-06-16 00:00:00	11
1689	Campo Florido	2018-06-16 00:00:00	11
1690	Campos Altos	2018-06-16 00:00:00	11
1691	Campos Gerais	2018-06-16 00:00:00	11
1692	Cana Verde	2018-06-16 00:00:00	11
1693	Canaã	2018-06-16 00:00:00	11
1694	Canápolis	2018-06-16 00:00:00	11
1695	Candeias	2018-06-16 00:00:00	11
1696	Cantagalo	2018-06-16 00:00:00	11
1697	Caparaó	2018-06-16 00:00:00	11
1698	Capela Nova	2018-06-16 00:00:00	11
1699	Capelinha	2018-06-16 00:00:00	11
1700	Capetinga	2018-06-16 00:00:00	11
1701	Capim Branco	2018-06-16 00:00:00	11
1702	Capinópolis	2018-06-16 00:00:00	11
1703	Capitão Andrade	2018-06-16 00:00:00	11
1704	Capitão Enéas	2018-06-16 00:00:00	11
1705	Capitólio	2018-06-16 00:00:00	11
1706	Caputira	2018-06-16 00:00:00	11
1707	Caraí	2018-06-16 00:00:00	11
1708	Caranaíba	2018-06-16 00:00:00	11
1709	Carandaí	2018-06-16 00:00:00	11
1710	Carangola	2018-06-16 00:00:00	11
1711	Caratinga	2018-06-16 00:00:00	11
1712	Carbonita	2018-06-16 00:00:00	11
1713	Careaçu	2018-06-16 00:00:00	11
1714	Carlos Chagas	2018-06-16 00:00:00	11
1715	Carmésia	2018-06-16 00:00:00	11
1716	Carmo da Cachoeira	2018-06-16 00:00:00	11
1717	Carmo da Mata	2018-06-16 00:00:00	11
1718	Carmo de Minas	2018-06-16 00:00:00	11
1719	Carmo do Cajuru	2018-06-16 00:00:00	11
1720	Carmo do Paranaíba	2018-06-16 00:00:00	11
1721	Carmo do Rio Claro	2018-06-16 00:00:00	11
1722	Carmópolis de Minas	2018-06-16 00:00:00	11
1723	Carneirinho	2018-06-16 00:00:00	11
1724	Carrancas	2018-06-16 00:00:00	11
1725	Carvalhópolis	2018-06-16 00:00:00	11
1726	Carvalhos	2018-06-16 00:00:00	11
1727	Casa Grande	2018-06-16 00:00:00	11
1728	Cascalho Rico	2018-06-16 00:00:00	11
1729	Cássia	2018-06-16 00:00:00	11
1730	Cataguases	2018-06-16 00:00:00	11
1731	Catas Altas	2018-06-16 00:00:00	11
1732	Catas Altas da Noruega	2018-06-16 00:00:00	11
1733	Catuji	2018-06-16 00:00:00	11
1734	Catuti	2018-06-16 00:00:00	11
1735	Caxambu	2018-06-16 00:00:00	11
1736	Cedro do Abaeté	2018-06-16 00:00:00	11
1737	Central de Minas	2018-06-16 00:00:00	11
1738	Centralina	2018-06-16 00:00:00	11
1739	Chácara	2018-06-16 00:00:00	11
1740	Chalé	2018-06-16 00:00:00	11
1741	Chapada do Norte	2018-06-16 00:00:00	11
1742	Chapada Gaúcha	2018-06-16 00:00:00	11
1743	Chiador	2018-06-16 00:00:00	11
1744	Cipotânea	2018-06-16 00:00:00	11
1745	Claraval	2018-06-16 00:00:00	11
1746	Claro dos Poções	2018-06-16 00:00:00	11
1747	Cláudio	2018-06-16 00:00:00	11
1748	Coimbra	2018-06-16 00:00:00	11
1749	Coluna	2018-06-16 00:00:00	11
1750	Comendador Gomes	2018-06-16 00:00:00	11
1751	Comercinho	2018-06-16 00:00:00	11
1752	Conceição da Aparecida	2018-06-16 00:00:00	11
1753	Conceição da Barra de Minas	2018-06-16 00:00:00	11
1754	Conceição das Alagoas	2018-06-16 00:00:00	11
1755	Conceição das Pedras	2018-06-16 00:00:00	11
1756	Conceição de Ipanema	2018-06-16 00:00:00	11
1757	Conceição do Mato Dentro	2018-06-16 00:00:00	11
1758	Conceição do Pará	2018-06-16 00:00:00	11
1759	Conceição do Rio Verde	2018-06-16 00:00:00	11
1760	Conceição dos Ouros	2018-06-16 00:00:00	11
1761	Cônego Marinho	2018-06-16 00:00:00	11
1762	Confins	2018-06-16 00:00:00	11
1763	Congonhal	2018-06-16 00:00:00	11
1764	Congonhas	2018-06-16 00:00:00	11
1765	Congonhas do Norte	2018-06-16 00:00:00	11
1766	Conquista	2018-06-16 00:00:00	11
1767	Conselheiro Lafaiete	2018-06-16 00:00:00	11
1768	Conselheiro Pena	2018-06-16 00:00:00	11
1769	Consolação	2018-06-16 00:00:00	11
1770	Contagem	2018-06-16 00:00:00	11
1771	Coqueiral	2018-06-16 00:00:00	11
1772	Coração de Jesus	2018-06-16 00:00:00	11
1773	Cordisburgo	2018-06-16 00:00:00	11
1774	Cordislândia	2018-06-16 00:00:00	11
1775	Corinto	2018-06-16 00:00:00	11
1776	Coroaci	2018-06-16 00:00:00	11
1777	Coromandel	2018-06-16 00:00:00	11
1778	Coronel Fabriciano	2018-06-16 00:00:00	11
1779	Coronel Murta	2018-06-16 00:00:00	11
1780	Coronel Pacheco	2018-06-16 00:00:00	11
1781	Coronel Xavier Chaves	2018-06-16 00:00:00	11
1782	Córrego Danta	2018-06-16 00:00:00	11
1783	Córrego do Bom Jesus	2018-06-16 00:00:00	11
1784	Córrego Fundo	2018-06-16 00:00:00	11
1785	Córrego Novo	2018-06-16 00:00:00	11
1786	Couto de Magalhães de Minas	2018-06-16 00:00:00	11
1787	Crisólita	2018-06-16 00:00:00	11
1788	Cristais	2018-06-16 00:00:00	11
1789	Cristália	2018-06-16 00:00:00	11
1790	Cristiano Otoni	2018-06-16 00:00:00	11
1791	Cristina	2018-06-16 00:00:00	11
1792	Crucilândia	2018-06-16 00:00:00	11
1793	Cruzeiro da Fortaleza	2018-06-16 00:00:00	11
1794	Cruzília	2018-06-16 00:00:00	11
1795	Cuparaque	2018-06-16 00:00:00	11
1796	Curral de Dentro	2018-06-16 00:00:00	11
1797	Curvelo	2018-06-16 00:00:00	11
1798	Datas	2018-06-16 00:00:00	11
1799	Delfim Moreira	2018-06-16 00:00:00	11
1800	Delfinópolis	2018-06-16 00:00:00	11
1801	Delta	2018-06-16 00:00:00	11
1802	Descoberto	2018-06-16 00:00:00	11
1803	Desterro de Entre Rios	2018-06-16 00:00:00	11
1804	Desterro do Melo	2018-06-16 00:00:00	11
1805	Diamantina	2018-06-16 00:00:00	11
1806	Diogo de Vasconcelos	2018-06-16 00:00:00	11
1807	Dionísio	2018-06-16 00:00:00	11
1808	Divinésia	2018-06-16 00:00:00	11
1809	Divino	2018-06-16 00:00:00	11
1810	Divino das Laranjeiras	2018-06-16 00:00:00	11
1811	Divinolândia de Minas	2018-06-16 00:00:00	11
1812	Divinópolis	2018-06-16 00:00:00	11
1813	Divisa Alegre	2018-06-16 00:00:00	11
1814	Divisa Nova	2018-06-16 00:00:00	11
1815	Divisópolis	2018-06-16 00:00:00	11
1816	Dom Bosco	2018-06-16 00:00:00	11
1817	Dom Cavati	2018-06-16 00:00:00	11
1818	Dom Joaquim	2018-06-16 00:00:00	11
1819	Dom Silvério	2018-06-16 00:00:00	11
1820	Dom Viçoso	2018-06-16 00:00:00	11
1821	Dona Eusébia	2018-06-16 00:00:00	11
1822	Dores de Campos	2018-06-16 00:00:00	11
1823	Dores de Guanhães	2018-06-16 00:00:00	11
1824	Dores do Indaiá	2018-06-16 00:00:00	11
1825	Dores do Turvo	2018-06-16 00:00:00	11
1826	Doresópolis	2018-06-16 00:00:00	11
1827	Douradoquara	2018-06-16 00:00:00	11
1828	Durandé	2018-06-16 00:00:00	11
1829	Elói Mendes	2018-06-16 00:00:00	11
1830	Engenheiro Caldas	2018-06-16 00:00:00	11
1831	Engenheiro Navarro	2018-06-16 00:00:00	11
1832	Entre Folhas	2018-06-16 00:00:00	11
1833	Entre Rios de Minas	2018-06-16 00:00:00	11
1834	Ervália	2018-06-16 00:00:00	11
1835	Esmeraldas	2018-06-16 00:00:00	11
1836	Espera Feliz	2018-06-16 00:00:00	11
1837	Espinosa	2018-06-16 00:00:00	11
1838	Espírito Santo do Dourado	2018-06-16 00:00:00	11
1839	Estiva	2018-06-16 00:00:00	11
1840	Estrela Dalva	2018-06-16 00:00:00	11
1841	Estrela do Indaiá	2018-06-16 00:00:00	11
1842	Estrela do Sul	2018-06-16 00:00:00	11
1843	Eugenópolis	2018-06-16 00:00:00	11
1844	Ewbank da Câmara	2018-06-16 00:00:00	11
1845	Extrema	2018-06-16 00:00:00	11
1846	Fama	2018-06-16 00:00:00	11
1847	Faria Lemos	2018-06-16 00:00:00	11
1848	Felício dos Santos	2018-06-16 00:00:00	11
1849	Felisburgo	2018-06-16 00:00:00	11
1850	Felixlândia	2018-06-16 00:00:00	11
1851	Fernandes Tourinho	2018-06-16 00:00:00	11
1852	Ferros	2018-06-16 00:00:00	11
1853	Fervedouro	2018-06-16 00:00:00	11
1854	Florestal	2018-06-16 00:00:00	11
1855	Formiga	2018-06-16 00:00:00	11
1856	Formoso	2018-06-16 00:00:00	11
1857	Fortaleza de Minas	2018-06-16 00:00:00	11
1858	Fortuna de Minas	2018-06-16 00:00:00	11
1859	Francisco Badaró	2018-06-16 00:00:00	11
1860	Francisco Dumont	2018-06-16 00:00:00	11
1861	Francisco Sá	2018-06-16 00:00:00	11
1862	Franciscópolis	2018-06-16 00:00:00	11
1863	Frei Gaspar	2018-06-16 00:00:00	11
1864	Frei Inocêncio	2018-06-16 00:00:00	11
1865	Frei Lagonegro	2018-06-16 00:00:00	11
1866	Fronteira	2018-06-16 00:00:00	11
1867	Fronteira dos Vales	2018-06-16 00:00:00	11
1868	Fruta de Leite	2018-06-16 00:00:00	11
1869	Frutal	2018-06-16 00:00:00	11
1870	Funilândia	2018-06-16 00:00:00	11
1871	Galiléia	2018-06-16 00:00:00	11
1872	Gameleiras	2018-06-16 00:00:00	11
1873	Glaucilândia	2018-06-16 00:00:00	11
1874	Goiabeira	2018-06-16 00:00:00	11
1875	Goianá	2018-06-16 00:00:00	11
1876	Gonçalves	2018-06-16 00:00:00	11
1877	Gonzaga	2018-06-16 00:00:00	11
1878	Gouveia	2018-06-16 00:00:00	11
1879	Governador Valadares	2018-06-16 00:00:00	11
1880	Grão Mogol	2018-06-16 00:00:00	11
1881	Grupiara	2018-06-16 00:00:00	11
1882	Guanhães	2018-06-16 00:00:00	11
1883	Guapé	2018-06-16 00:00:00	11
1884	Guaraciaba	2018-06-16 00:00:00	11
1885	Guaraciama	2018-06-16 00:00:00	11
1886	Guaranésia	2018-06-16 00:00:00	11
1887	Guarani	2018-06-16 00:00:00	11
1888	Guarará	2018-06-16 00:00:00	11
1889	Guarda-Mor	2018-06-16 00:00:00	11
1890	Guaxupé	2018-06-16 00:00:00	11
1891	Guidoval	2018-06-16 00:00:00	11
1892	Guimarânia	2018-06-16 00:00:00	11
1893	Guiricema	2018-06-16 00:00:00	11
1894	Gurinhatã	2018-06-16 00:00:00	11
1895	Heliodora	2018-06-16 00:00:00	11
1896	Iapu	2018-06-16 00:00:00	11
1897	Ibertioga	2018-06-16 00:00:00	11
1898	Ibiá	2018-06-16 00:00:00	11
1899	Ibiaí	2018-06-16 00:00:00	11
1900	Ibiracatu	2018-06-16 00:00:00	11
1901	Ibiraci	2018-06-16 00:00:00	11
1902	Ibirité	2018-06-16 00:00:00	11
1903	Ibitiúra de Minas	2018-06-16 00:00:00	11
1904	Ibituruna	2018-06-16 00:00:00	11
1905	Icaraí de Minas	2018-06-16 00:00:00	11
1906	Igarapé	2018-06-16 00:00:00	11
1907	Igaratinga	2018-06-16 00:00:00	11
1908	Iguatama	2018-06-16 00:00:00	11
1909	Ijaci	2018-06-16 00:00:00	11
1910	Ilicínea	2018-06-16 00:00:00	11
1911	Imbé de Minas	2018-06-16 00:00:00	11
1912	Inconfidentes	2018-06-16 00:00:00	11
1913	Indaiabira	2018-06-16 00:00:00	11
1914	Indianópolis	2018-06-16 00:00:00	11
1915	Ingaí	2018-06-16 00:00:00	11
1916	Inhapim	2018-06-16 00:00:00	11
1917	Inhaúma	2018-06-16 00:00:00	11
1918	Inimutaba	2018-06-16 00:00:00	11
1919	Ipaba	2018-06-16 00:00:00	11
1920	Ipanema	2018-06-16 00:00:00	11
1921	Ipatinga	2018-06-16 00:00:00	11
1922	Ipiaçu	2018-06-16 00:00:00	11
1923	Ipuiúna	2018-06-16 00:00:00	11
1924	Iraí de Minas	2018-06-16 00:00:00	11
1925	Itabira	2018-06-16 00:00:00	11
1927	Itabirito	2018-06-16 00:00:00	11
1928	Itacambira	2018-06-16 00:00:00	11
1929	Itacarambi	2018-06-16 00:00:00	11
1930	Itaguara	2018-06-16 00:00:00	11
1931	Itaipé	2018-06-16 00:00:00	11
1932	Itajubá	2018-06-16 00:00:00	11
1933	Itamarandiba	2018-06-16 00:00:00	11
1934	Itamarati de Minas	2018-06-16 00:00:00	11
1935	Itambacuri	2018-06-16 00:00:00	11
1936	Itambé do Mato Dentro	2018-06-16 00:00:00	11
1937	Itamogi	2018-06-16 00:00:00	11
1938	Itamonte	2018-06-16 00:00:00	11
1939	Itanhandu	2018-06-16 00:00:00	11
1940	Itanhomi	2018-06-16 00:00:00	11
1941	Itaobim	2018-06-16 00:00:00	11
1942	Itapagipe	2018-06-16 00:00:00	11
1943	Itapecerica	2018-06-16 00:00:00	11
1944	Itapeva	2018-06-16 00:00:00	11
1945	Itatiaiuçu	2018-06-16 00:00:00	11
1946	Itaú de Minas	2018-06-16 00:00:00	11
1947	Itaúna	2018-06-16 00:00:00	11
1948	Itaverava	2018-06-16 00:00:00	11
1949	Itinga	2018-06-16 00:00:00	11
1950	Itueta	2018-06-16 00:00:00	11
1951	Ituiutaba	2018-06-16 00:00:00	11
1952	Itumirim	2018-06-16 00:00:00	11
1953	Iturama	2018-06-16 00:00:00	11
1954	Itutinga	2018-06-16 00:00:00	11
1955	Jaboticatubas	2018-06-16 00:00:00	11
1956	Jacinto	2018-06-16 00:00:00	11
1957	Jacuí	2018-06-16 00:00:00	11
1958	Jacutinga	2018-06-16 00:00:00	11
1959	Jaguaraçu	2018-06-16 00:00:00	11
1960	Jaíba	2018-06-16 00:00:00	11
1961	Jampruca	2018-06-16 00:00:00	11
1962	Janaúba	2018-06-16 00:00:00	11
1963	Januária	2018-06-16 00:00:00	11
1964	Japaraíba	2018-06-16 00:00:00	11
1965	Japonvar	2018-06-16 00:00:00	11
1966	Jeceaba	2018-06-16 00:00:00	11
1967	Jenipapo de Minas	2018-06-16 00:00:00	11
1968	Jequeri	2018-06-16 00:00:00	11
1969	Jequitaí	2018-06-16 00:00:00	11
1970	Jequitibá	2018-06-16 00:00:00	11
1971	Jequitinhonha	2018-06-16 00:00:00	11
1972	Jesuânia	2018-06-16 00:00:00	11
1973	Joaíma	2018-06-16 00:00:00	11
1974	Joanésia	2018-06-16 00:00:00	11
1975	João Monlevade	2018-06-16 00:00:00	11
1976	João Pinheiro	2018-06-16 00:00:00	11
1977	Joaquim Felício	2018-06-16 00:00:00	11
1978	Jordânia	2018-06-16 00:00:00	11
1979	José Gonçalves de Minas	2018-06-16 00:00:00	11
1980	José Raydan	2018-06-16 00:00:00	11
1981	Josenópolis	2018-06-16 00:00:00	11
1982	Juatuba	2018-06-16 00:00:00	11
1983	Juiz de Fora	2018-06-16 00:00:00	11
1984	Juramento	2018-06-16 00:00:00	11
1985	Juruaia	2018-06-16 00:00:00	11
1986	Juvenília	2018-06-16 00:00:00	11
1987	Ladainha	2018-06-16 00:00:00	11
1988	Lagamar	2018-06-16 00:00:00	11
1989	Lagoa da Prata	2018-06-16 00:00:00	11
1990	Lagoa dos Patos	2018-06-16 00:00:00	11
1991	Lagoa Dourada	2018-06-16 00:00:00	11
1992	Lagoa Formosa	2018-06-16 00:00:00	11
1993	Lagoa Grande	2018-06-16 00:00:00	11
1994	Lagoa Santa	2018-06-16 00:00:00	11
1995	Lajinha	2018-06-16 00:00:00	11
1996	Lambari	2018-06-16 00:00:00	11
1997	Lamim	2018-06-16 00:00:00	11
1998	Laranjal	2018-06-16 00:00:00	11
1999	Lassance	2018-06-16 00:00:00	11
2000	Lavras	2018-06-16 00:00:00	11
2001	Leandro Ferreira	2018-06-16 00:00:00	11
2002	Leme do Prado	2018-06-16 00:00:00	11
2003	Leopoldina	2018-06-16 00:00:00	11
2004	Liberdade	2018-06-16 00:00:00	11
2005	Lima Duarte	2018-06-16 00:00:00	11
2006	Limeira do Oeste	2018-06-16 00:00:00	11
2007	Lontra	2018-06-16 00:00:00	11
2008	Luisburgo	2018-06-16 00:00:00	11
2009	Luislândia	2018-06-16 00:00:00	11
2010	Luminárias	2018-06-16 00:00:00	11
2011	Luz	2018-06-16 00:00:00	11
2012	Machacalis	2018-06-16 00:00:00	11
2013	Machado	2018-06-16 00:00:00	11
2014	Madre de Deus de Minas	2018-06-16 00:00:00	11
2015	Malacacheta	2018-06-16 00:00:00	11
2016	Mamonas	2018-06-16 00:00:00	11
2017	Manga	2018-06-16 00:00:00	11
2018	Manhuaçu	2018-06-16 00:00:00	11
2019	Manhumirim	2018-06-16 00:00:00	11
2020	Mantena	2018-06-16 00:00:00	11
2021	Mar de Espanha	2018-06-16 00:00:00	11
2022	Maravilhas	2018-06-16 00:00:00	11
2023	Maria da Fé	2018-06-16 00:00:00	11
2024	Mariana	2018-06-16 00:00:00	11
2025	Marilac	2018-06-16 00:00:00	11
2026	Mário Campos	2018-06-16 00:00:00	11
2027	Maripá de Minas	2018-06-16 00:00:00	11
2028	Marliéria	2018-06-16 00:00:00	11
2029	Marmelópolis	2018-06-16 00:00:00	11
2030	Martinho Campos	2018-06-16 00:00:00	11
2031	Martins Soares	2018-06-16 00:00:00	11
2032	Mata Verde	2018-06-16 00:00:00	11
2033	Materlândia	2018-06-16 00:00:00	11
2034	Mateus Leme	2018-06-16 00:00:00	11
2035	Mathias Lobato	2018-06-16 00:00:00	11
2036	Matias Barbosa	2018-06-16 00:00:00	11
2037	Matias Cardoso	2018-06-16 00:00:00	11
2038	Matipó	2018-06-16 00:00:00	11
2039	Mato Verde	2018-06-16 00:00:00	11
2040	Matozinhos	2018-06-16 00:00:00	11
2041	Matutina	2018-06-16 00:00:00	11
2042	Medeiros	2018-06-16 00:00:00	11
2043	Medina	2018-06-16 00:00:00	11
2044	Mendes Pimentel	2018-06-16 00:00:00	11
2045	Mercês	2018-06-16 00:00:00	11
2046	Mesquita	2018-06-16 00:00:00	11
2047	Minas Novas	2018-06-16 00:00:00	11
2048	Minduri	2018-06-16 00:00:00	11
2049	Mirabela	2018-06-16 00:00:00	11
2050	Miradouro	2018-06-16 00:00:00	11
2051	Miraí	2018-06-16 00:00:00	11
2052	Miravânia	2018-06-16 00:00:00	11
2053	Moeda	2018-06-16 00:00:00	11
2054	Moema	2018-06-16 00:00:00	11
2055	Monjolos	2018-06-16 00:00:00	11
2056	Monsenhor Paulo	2018-06-16 00:00:00	11
2057	Montalvânia	2018-06-16 00:00:00	11
2058	Monte Alegre de Minas	2018-06-16 00:00:00	11
2059	Monte Azul	2018-06-16 00:00:00	11
2060	Monte Belo	2018-06-16 00:00:00	11
2061	Monte Carmelo	2018-06-16 00:00:00	11
2062	Monte Formoso	2018-06-16 00:00:00	11
2063	Monte Santo de Minas	2018-06-16 00:00:00	11
2064	Monte Sião	2018-06-16 00:00:00	11
2065	Montes Claros	2018-06-16 00:00:00	11
2066	Montezuma	2018-06-16 00:00:00	11
2067	Morada Nova de Minas	2018-06-16 00:00:00	11
2068	Morro da Garça	2018-06-16 00:00:00	11
2069	Morro do Pilar	2018-06-16 00:00:00	11
2070	Munhoz	2018-06-16 00:00:00	11
2071	Muriaé	2018-06-16 00:00:00	11
2072	Mutum	2018-06-16 00:00:00	11
2073	Muzambinho	2018-06-16 00:00:00	11
2074	Nacip Raydan	2018-06-16 00:00:00	11
2075	Nanuque	2018-06-16 00:00:00	11
2076	Naque	2018-06-16 00:00:00	11
2077	Natalândia	2018-06-16 00:00:00	11
2078	Natércia	2018-06-16 00:00:00	11
2079	Nazareno	2018-06-16 00:00:00	11
2080	Nepomuceno	2018-06-16 00:00:00	11
2081	Ninheira	2018-06-16 00:00:00	11
2082	Nova Belém	2018-06-16 00:00:00	11
2083	Nova Era	2018-06-16 00:00:00	11
2084	Nova Lima	2018-06-16 00:00:00	11
2085	Nova Módica	2018-06-16 00:00:00	11
2086	Nova Ponte	2018-06-16 00:00:00	11
2087	Nova Porteirinha	2018-06-16 00:00:00	11
2088	Nova Resende	2018-06-16 00:00:00	11
2089	Nova Serrana	2018-06-16 00:00:00	11
2090	Nova União	2018-06-16 00:00:00	11
2091	Novo Cruzeiro	2018-06-16 00:00:00	11
2092	Novo Oriente de Minas	2018-06-16 00:00:00	11
2093	Novorizonte	2018-06-16 00:00:00	11
2094	Olaria	2018-06-16 00:00:00	11
2095	Olhos-d`Água	2018-06-16 00:00:00	11
2096	Olímpio Noronha	2018-06-16 00:00:00	11
2097	Oliveira	2018-06-16 00:00:00	11
2098	Oliveira Fortes	2018-06-16 00:00:00	11
2099	Onça de Pitangui	2018-06-16 00:00:00	11
2100	Oratórios	2018-06-16 00:00:00	11
2101	Orizânia	2018-06-16 00:00:00	11
2102	Ouro Branco	2018-06-16 00:00:00	11
2103	Ouro Fino	2018-06-16 00:00:00	11
2104	Ouro Preto	2018-06-16 00:00:00	11
2105	Ouro Verde de Minas	2018-06-16 00:00:00	11
2106	Padre Carvalho	2018-06-16 00:00:00	11
2107	Padre Paraíso	2018-06-16 00:00:00	11
2108	Pai Pedro	2018-06-16 00:00:00	11
2109	Paineiras	2018-06-16 00:00:00	11
2110	Pains	2018-06-16 00:00:00	11
2111	Paiva	2018-06-16 00:00:00	11
2112	Palma	2018-06-16 00:00:00	11
2113	Palmópolis	2018-06-16 00:00:00	11
2114	Papagaios	2018-06-16 00:00:00	11
2115	Pará de Minas	2018-06-16 00:00:00	11
2116	Paracatu	2018-06-16 00:00:00	11
2117	Paraguaçu	2018-06-16 00:00:00	11
2118	Paraisópolis	2018-06-16 00:00:00	11
2119	Paraopeba	2018-06-16 00:00:00	11
2120	Passa Quatro	2018-06-16 00:00:00	11
2121	Passa Tempo	2018-06-16 00:00:00	11
2122	Passabém	2018-06-16 00:00:00	11
2123	Passa-Vinte	2018-06-16 00:00:00	11
2124	Passos	2018-06-16 00:00:00	11
2125	Patis	2018-06-16 00:00:00	11
2126	Patos de Minas	2018-06-16 00:00:00	11
2127	Patrocínio	2018-06-16 00:00:00	11
2128	Patrocínio do Muriaé	2018-06-16 00:00:00	11
2129	Paula Cândido	2018-06-16 00:00:00	11
2130	Paulistas	2018-06-16 00:00:00	11
2131	Pavão	2018-06-16 00:00:00	11
2132	Peçanha	2018-06-16 00:00:00	11
2133	Pedra Azul	2018-06-16 00:00:00	11
2134	Pedra Bonita	2018-06-16 00:00:00	11
2135	Pedra do Anta	2018-06-16 00:00:00	11
2136	Pedra do Indaiá	2018-06-16 00:00:00	11
2137	Pedra Dourada	2018-06-16 00:00:00	11
2138	Pedralva	2018-06-16 00:00:00	11
2139	Pedras de Maria da Cruz	2018-06-16 00:00:00	11
2140	Pedrinópolis	2018-06-16 00:00:00	11
2141	Pedro Leopoldo	2018-06-16 00:00:00	11
2142	Pedro Teixeira	2018-06-16 00:00:00	11
2143	Pequeri	2018-06-16 00:00:00	11
2144	Pequi	2018-06-16 00:00:00	11
2145	Perdigão	2018-06-16 00:00:00	11
2146	Perdizes	2018-06-16 00:00:00	11
2147	Perdões	2018-06-16 00:00:00	11
2148	Periquito	2018-06-16 00:00:00	11
2149	Pescador	2018-06-16 00:00:00	11
2150	Piau	2018-06-16 00:00:00	11
2151	Piedade de Caratinga	2018-06-16 00:00:00	11
2152	Piedade de Ponte Nova	2018-06-16 00:00:00	11
2153	Piedade do Rio Grande	2018-06-16 00:00:00	11
2154	Piedade dos Gerais	2018-06-16 00:00:00	11
2155	Pimenta	2018-06-16 00:00:00	11
2156	Pingo-d`Água	2018-06-16 00:00:00	11
2157	Pintópolis	2018-06-16 00:00:00	11
2158	Piracema	2018-06-16 00:00:00	11
2159	Pirajuba	2018-06-16 00:00:00	11
2160	Piranga	2018-06-16 00:00:00	11
2161	Piranguçu	2018-06-16 00:00:00	11
2162	Piranguinho	2018-06-16 00:00:00	11
2163	Pirapetinga	2018-06-16 00:00:00	11
2164	Pirapora	2018-06-16 00:00:00	11
2165	Piraúba	2018-06-16 00:00:00	11
2166	Pitangui	2018-06-16 00:00:00	11
2167	Piumhi	2018-06-16 00:00:00	11
2168	Planura	2018-06-16 00:00:00	11
2169	Poço Fundo	2018-06-16 00:00:00	11
2170	Poços de Caldas	2018-06-16 00:00:00	11
2171	Pocrane	2018-06-16 00:00:00	11
2172	Pompéu	2018-06-16 00:00:00	11
2173	Ponte Nova	2018-06-16 00:00:00	11
2174	Ponto Chique	2018-06-16 00:00:00	11
2175	Ponto dos Volantes	2018-06-16 00:00:00	11
2176	Porteirinha	2018-06-16 00:00:00	11
2177	Porto Firme	2018-06-16 00:00:00	11
2178	Poté	2018-06-16 00:00:00	11
2179	Pouso Alegre	2018-06-16 00:00:00	11
2180	Pouso Alto	2018-06-16 00:00:00	11
2181	Prados	2018-06-16 00:00:00	11
2182	Prata	2018-06-16 00:00:00	11
2183	Pratápolis	2018-06-16 00:00:00	11
2184	Pratinha	2018-06-16 00:00:00	11
2185	Presidente Bernardes	2018-06-16 00:00:00	11
2186	Presidente Juscelino	2018-06-16 00:00:00	11
2187	Presidente Kubitschek	2018-06-16 00:00:00	11
2188	Presidente Olegário	2018-06-16 00:00:00	11
2189	Prudente de Morais	2018-06-16 00:00:00	11
2190	Quartel Geral	2018-06-16 00:00:00	11
2191	Queluzito	2018-06-16 00:00:00	11
2192	Raposos	2018-06-16 00:00:00	11
2193	Raul Soares	2018-06-16 00:00:00	11
2194	Recreio	2018-06-16 00:00:00	11
2195	Reduto	2018-06-16 00:00:00	11
2196	Resende Costa	2018-06-16 00:00:00	11
2197	Resplendor	2018-06-16 00:00:00	11
2198	Ressaquinha	2018-06-16 00:00:00	11
2199	Riachinho	2018-06-16 00:00:00	11
2200	Riacho dos Machados	2018-06-16 00:00:00	11
2201	Ribeirão das Neves	2018-06-16 00:00:00	11
2202	Ribeirão Vermelho	2018-06-16 00:00:00	11
2203	Rio Acima	2018-06-16 00:00:00	11
2204	Rio Casca	2018-06-16 00:00:00	11
2205	Rio do Prado	2018-06-16 00:00:00	11
2206	Rio Doce	2018-06-16 00:00:00	11
2207	Rio Espera	2018-06-16 00:00:00	11
2208	Rio Manso	2018-06-16 00:00:00	11
2209	Rio Novo	2018-06-16 00:00:00	11
2210	Rio Paranaíba	2018-06-16 00:00:00	11
2211	Rio Pardo de Minas	2018-06-16 00:00:00	11
2212	Rio Piracicaba	2018-06-16 00:00:00	11
2213	Rio Pomba	2018-06-16 00:00:00	11
2214	Rio Preto	2018-06-16 00:00:00	11
2215	Rio Vermelho	2018-06-16 00:00:00	11
2216	Ritápolis	2018-06-16 00:00:00	11
2217	Rochedo de Minas	2018-06-16 00:00:00	11
2218	Rodeiro	2018-06-16 00:00:00	11
2219	Romaria	2018-06-16 00:00:00	11
2220	Rosário da Limeira	2018-06-16 00:00:00	11
2221	Rubelita	2018-06-16 00:00:00	11
2222	Rubim	2018-06-16 00:00:00	11
2223	Sabará	2018-06-16 00:00:00	11
2224	Sabinópolis	2018-06-16 00:00:00	11
2225	Sacramento	2018-06-16 00:00:00	11
2226	Salinas	2018-06-16 00:00:00	11
2227	Salto da Divisa	2018-06-16 00:00:00	11
2228	Santa Bárbara	2018-06-16 00:00:00	11
2229	Santa Bárbara do Leste	2018-06-16 00:00:00	11
2230	Santa Bárbara do Monte Verde	2018-06-16 00:00:00	11
2231	Santa Bárbara do Tugúrio	2018-06-16 00:00:00	11
2232	Santa Cruz de Minas	2018-06-16 00:00:00	11
2233	Santa Cruz de Salinas	2018-06-16 00:00:00	11
2234	Santa Cruz do Escalvado	2018-06-16 00:00:00	11
2235	Santa Efigênia de Minas	2018-06-16 00:00:00	11
2236	Santa Fé de Minas	2018-06-16 00:00:00	11
2237	Santa Helena de Minas	2018-06-16 00:00:00	11
2238	Santa Juliana	2018-06-16 00:00:00	11
2239	Santa Luzia	2018-06-16 00:00:00	11
2240	Santa Margarida	2018-06-16 00:00:00	11
2241	Santa Maria de Itabira	2018-06-16 00:00:00	11
2242	Santa Maria do Salto	2018-06-16 00:00:00	11
2243	Santa Maria do Suaçuí	2018-06-16 00:00:00	11
2244	Santa Rita de Caldas	2018-06-16 00:00:00	11
2245	Santa Rita de Ibitipoca	2018-06-16 00:00:00	11
2246	Santa Rita de Jacutinga	2018-06-16 00:00:00	11
2247	Santa Rita de Minas	2018-06-16 00:00:00	11
2248	Santa Rita do Itueto	2018-06-16 00:00:00	11
2249	Santa Rita do Sapucaí	2018-06-16 00:00:00	11
2250	Santa Rosa da Serra	2018-06-16 00:00:00	11
2251	Santa Vitória	2018-06-16 00:00:00	11
2252	Santana da Vargem	2018-06-16 00:00:00	11
2253	Santana de Cataguases	2018-06-16 00:00:00	11
2254	Santana de Pirapama	2018-06-16 00:00:00	11
2255	Santana do Deserto	2018-06-16 00:00:00	11
2256	Santana do Garambéu	2018-06-16 00:00:00	11
2257	Santana do Jacaré	2018-06-16 00:00:00	11
2258	Santana do Manhuaçu	2018-06-16 00:00:00	11
2259	Santana do Paraíso	2018-06-16 00:00:00	11
2260	Santana do Riacho	2018-06-16 00:00:00	11
2261	Santana dos Montes	2018-06-16 00:00:00	11
2262	Santo Antônio do Amparo	2018-06-16 00:00:00	11
2263	Santo Antônio do Aventureiro	2018-06-16 00:00:00	11
2264	Santo Antônio do Grama	2018-06-16 00:00:00	11
2265	Santo Antônio do Itambé	2018-06-16 00:00:00	11
2266	Santo Antônio do Jacinto	2018-06-16 00:00:00	11
2267	Santo Antônio do Monte	2018-06-16 00:00:00	11
2268	Santo Antônio do Retiro	2018-06-16 00:00:00	11
2269	Santo Antônio do Rio Abaixo	2018-06-16 00:00:00	11
2270	Santo Hipólito	2018-06-16 00:00:00	11
2271	Santos Dumont	2018-06-16 00:00:00	11
2272	São Bento Abade	2018-06-16 00:00:00	11
2273	São Brás do Suaçuí	2018-06-16 00:00:00	11
2274	São Domingos das Dores	2018-06-16 00:00:00	11
2275	São Domingos do Prata	2018-06-16 00:00:00	11
2276	São Félix de Minas	2018-06-16 00:00:00	11
2277	São Francisco	2018-06-16 00:00:00	11
2278	São Francisco de Paula	2018-06-16 00:00:00	11
2279	São Francisco de Sales	2018-06-16 00:00:00	11
2280	São Francisco do Glória	2018-06-16 00:00:00	11
2281	São Geraldo	2018-06-16 00:00:00	11
2282	São Geraldo da Piedade	2018-06-16 00:00:00	11
2283	São Geraldo do Baixio	2018-06-16 00:00:00	11
2284	São Gonçalo do Abaeté	2018-06-16 00:00:00	11
2285	São Gonçalo do Pará	2018-06-16 00:00:00	11
2286	São Gonçalo do Rio Abaixo	2018-06-16 00:00:00	11
2287	São Gonçalo do Rio Preto	2018-06-16 00:00:00	11
2288	São Gonçalo do Sapucaí	2018-06-16 00:00:00	11
2289	São Gotardo	2018-06-16 00:00:00	11
2290	São João Batista do Glória	2018-06-16 00:00:00	11
2291	São João da Lagoa	2018-06-16 00:00:00	11
2292	São João da Mata	2018-06-16 00:00:00	11
2293	São João da Ponte	2018-06-16 00:00:00	11
2294	São João das Missões	2018-06-16 00:00:00	11
2295	São João del Rei	2018-06-16 00:00:00	11
2296	São João do Manhuaçu	2018-06-16 00:00:00	11
2297	São João do Manteninha	2018-06-16 00:00:00	11
2298	São João do Oriente	2018-06-16 00:00:00	11
2299	São João do Pacuí	2018-06-16 00:00:00	11
2300	São João do Paraíso	2018-06-16 00:00:00	11
2301	São João Evangelista	2018-06-16 00:00:00	11
2302	São João Nepomuceno	2018-06-16 00:00:00	11
2303	São Joaquim de Bicas	2018-06-16 00:00:00	11
2304	São José da Barra	2018-06-16 00:00:00	11
2305	São José da Lapa	2018-06-16 00:00:00	11
2306	São José da Safira	2018-06-16 00:00:00	11
2307	São José da Varginha	2018-06-16 00:00:00	11
2308	São José do Alegre	2018-06-16 00:00:00	11
2309	São José do Divino	2018-06-16 00:00:00	11
2310	São José do Goiabal	2018-06-16 00:00:00	11
2311	São José do Jacuri	2018-06-16 00:00:00	11
2312	São José do Mantimento	2018-06-16 00:00:00	11
2313	São Lourenço	2018-06-16 00:00:00	11
2314	São Miguel do Anta	2018-06-16 00:00:00	11
2315	São Pedro da União	2018-06-16 00:00:00	11
2316	São Pedro do Suaçuí	2018-06-16 00:00:00	11
2317	São Pedro dos Ferros	2018-06-16 00:00:00	11
2318	São Romão	2018-06-16 00:00:00	11
2319	São Roque de Minas	2018-06-16 00:00:00	11
2320	São Sebastião da Bela Vista	2018-06-16 00:00:00	11
2321	São Sebastião da Vargem Alegre	2018-06-16 00:00:00	11
2322	São Sebastião do Anta	2018-06-16 00:00:00	11
2323	São Sebastião do Maranhão	2018-06-16 00:00:00	11
2324	São Sebastião do Oeste	2018-06-16 00:00:00	11
2325	São Sebastião do Paraíso	2018-06-16 00:00:00	11
2326	São Sebastião do Rio Preto	2018-06-16 00:00:00	11
2327	São Sebastião do Rio Verde	2018-06-16 00:00:00	11
2328	São Thomé das Letras	2018-06-16 00:00:00	11
2329	São Tiago	2018-06-16 00:00:00	11
2330	São Tomás de Aquino	2018-06-16 00:00:00	11
2331	São Vicente de Minas	2018-06-16 00:00:00	11
2332	Sapucaí-Mirim	2018-06-16 00:00:00	11
2333	Sardoá	2018-06-16 00:00:00	11
2334	Sarzedo	2018-06-16 00:00:00	11
2335	Sem-Peixe	2018-06-16 00:00:00	11
2336	Senador Amaral	2018-06-16 00:00:00	11
2337	Senador Cortes	2018-06-16 00:00:00	11
2338	Senador Firmino	2018-06-16 00:00:00	11
2339	Senador José Bento	2018-06-16 00:00:00	11
2340	Senador Modestino Gonçalves	2018-06-16 00:00:00	11
2341	Senhora de Oliveira	2018-06-16 00:00:00	11
2342	Senhora do Porto	2018-06-16 00:00:00	11
2343	Senhora dos Remédios	2018-06-16 00:00:00	11
2344	Sericita	2018-06-16 00:00:00	11
2345	Seritinga	2018-06-16 00:00:00	11
2346	Serra Azul de Minas	2018-06-16 00:00:00	11
2347	Serra da Saudade	2018-06-16 00:00:00	11
2348	Serra do Salitre	2018-06-16 00:00:00	11
2349	Serra dos Aimorés	2018-06-16 00:00:00	11
2350	Serrania	2018-06-16 00:00:00	11
2351	Serranópolis de Minas	2018-06-16 00:00:00	11
2352	Serranos	2018-06-16 00:00:00	11
2353	Serro	2018-06-16 00:00:00	11
2354	Sete Lagoas	2018-06-16 00:00:00	11
2355	Setubinha	2018-06-16 00:00:00	11
2356	Silveirânia	2018-06-16 00:00:00	11
2357	Silvianópolis	2018-06-16 00:00:00	11
2358	Simão Pereira	2018-06-16 00:00:00	11
2359	Simonésia	2018-06-16 00:00:00	11
2360	Sobrália	2018-06-16 00:00:00	11
2361	Soledade de Minas	2018-06-16 00:00:00	11
2362	Tabuleiro	2018-06-16 00:00:00	11
2363	Taiobeiras	2018-06-16 00:00:00	11
2364	Taparuba	2018-06-16 00:00:00	11
2365	Tapira	2018-06-16 00:00:00	11
2366	Tapiraí	2018-06-16 00:00:00	11
2367	Taquaraçu de Minas	2018-06-16 00:00:00	11
2368	Tarumirim	2018-06-16 00:00:00	11
2369	Teixeiras	2018-06-16 00:00:00	11
2370	Teófilo Otoni	2018-06-16 00:00:00	11
2371	Timóteo	2018-06-16 00:00:00	11
2372	Tiradentes	2018-06-16 00:00:00	11
2373	Tiros	2018-06-16 00:00:00	11
2374	Tocantins	2018-06-16 00:00:00	11
2375	Tocos do Moji	2018-06-16 00:00:00	11
2376	Toledo	2018-06-16 00:00:00	11
2377	Tombos	2018-06-16 00:00:00	11
2378	Três Corações	2018-06-16 00:00:00	11
2379	Três Marias	2018-06-16 00:00:00	11
2380	Três Pontas	2018-06-16 00:00:00	11
2381	Tumiritinga	2018-06-16 00:00:00	11
2382	Tupaciguara	2018-06-16 00:00:00	11
2383	Turmalina	2018-06-16 00:00:00	11
2384	Turvolândia	2018-06-16 00:00:00	11
2385	Ubá	2018-06-16 00:00:00	11
2386	Ubaí	2018-06-16 00:00:00	11
2387	Ubaporanga	2018-06-16 00:00:00	11
2388	Uberaba	2018-06-16 00:00:00	11
2389	Uberlândia	2018-06-16 00:00:00	11
2390	Umburatiba	2018-06-16 00:00:00	11
2391	Unaí	2018-06-16 00:00:00	11
2392	União de Minas	2018-06-16 00:00:00	11
2393	Uruana de Minas	2018-06-16 00:00:00	11
2394	Urucânia	2018-06-16 00:00:00	11
2395	Urucuia	2018-06-16 00:00:00	11
2396	Vargem Alegre	2018-06-16 00:00:00	11
2397	Vargem Bonita	2018-06-16 00:00:00	11
2398	Vargem Grande do Rio Pardo	2018-06-16 00:00:00	11
2399	Varginha	2018-06-16 00:00:00	11
2400	Varjão de Minas	2018-06-16 00:00:00	11
2401	Várzea da Palma	2018-06-16 00:00:00	11
2402	Varzelândia	2018-06-16 00:00:00	11
2403	Vazante	2018-06-16 00:00:00	11
2404	Verdelândia	2018-06-16 00:00:00	11
2405	Veredinha	2018-06-16 00:00:00	11
2406	Veríssimo	2018-06-16 00:00:00	11
2407	Vermelho Novo	2018-06-16 00:00:00	11
2408	Vespasiano	2018-06-16 00:00:00	11
2409	Viçosa	2018-06-16 00:00:00	11
2410	Vieiras	2018-06-16 00:00:00	11
2411	Virgem da Lapa	2018-06-16 00:00:00	11
2412	Virgínia	2018-06-16 00:00:00	11
2413	Virginópolis	2018-06-16 00:00:00	11
2414	Virgolândia	2018-06-16 00:00:00	11
2415	Visconde do Rio Branco	2018-06-16 00:00:00	11
2416	Volta Grande	2018-06-16 00:00:00	11
2417	Wenceslau Braz	2018-06-16 00:00:00	11
2418	Abaetetuba	2018-06-16 00:00:00	14
2419	Abel Figueiredo	2018-06-16 00:00:00	14
2420	Acará	2018-06-16 00:00:00	14
2421	Afuá	2018-06-16 00:00:00	14
2422	Água Azul do Norte	2018-06-16 00:00:00	14
2423	Alenquer	2018-06-16 00:00:00	14
2424	Almeirim	2018-06-16 00:00:00	14
2425	Altamira	2018-06-16 00:00:00	14
2426	Anajás	2018-06-16 00:00:00	14
2427	Ananindeua	2018-06-16 00:00:00	14
2428	Anapu	2018-06-16 00:00:00	14
2429	Augusto Corrêa	2018-06-16 00:00:00	14
2430	Aurora do Pará	2018-06-16 00:00:00	14
2431	Aveiro	2018-06-16 00:00:00	14
2432	Bagre	2018-06-16 00:00:00	14
2433	Baião	2018-06-16 00:00:00	14
2434	Bannach	2018-06-16 00:00:00	14
2435	Barcarena	2018-06-16 00:00:00	14
2436	Belém	2018-06-16 00:00:00	14
2437	Belterra	2018-06-16 00:00:00	14
2438	Benevides	2018-06-16 00:00:00	14
2439	Bom Jesus do Tocantins	2018-06-16 00:00:00	14
2440	Bonito	2018-06-16 00:00:00	14
2441	Bragança	2018-06-16 00:00:00	14
2442	Brasil Novo	2018-06-16 00:00:00	14
2443	Brejo Grande do Araguaia	2018-06-16 00:00:00	14
2444	Breu Branco	2018-06-16 00:00:00	14
2445	Breves	2018-06-16 00:00:00	14
2446	Bujaru	2018-06-16 00:00:00	14
2447	Cachoeira do Arari	2018-06-16 00:00:00	14
2448	Cachoeira do Piriá	2018-06-16 00:00:00	14
2449	Cametá	2018-06-16 00:00:00	14
2450	Canaã dos Carajás	2018-06-16 00:00:00	14
2451	Capanema	2018-06-16 00:00:00	14
2452	Capitão Poço	2018-06-16 00:00:00	14
2453	Castanhal	2018-06-16 00:00:00	14
2454	Chaves	2018-06-16 00:00:00	14
2455	Colares	2018-06-16 00:00:00	14
2456	Conceição do Araguaia	2018-06-16 00:00:00	14
2457	Concórdia do Pará	2018-06-16 00:00:00	14
2458	Cumaru do Norte	2018-06-16 00:00:00	14
2459	Curionópolis	2018-06-16 00:00:00	14
2460	Curralinho	2018-06-16 00:00:00	14
2461	Curuá	2018-06-16 00:00:00	14
2462	Curuçá	2018-06-16 00:00:00	14
2463	Dom Eliseu	2018-06-16 00:00:00	14
2464	Eldorado dos Carajás	2018-06-16 00:00:00	14
2465	Faro	2018-06-16 00:00:00	14
2466	Floresta do Araguaia	2018-06-16 00:00:00	14
2467	Garrafão do Norte	2018-06-16 00:00:00	14
2468	Goianésia do Pará	2018-06-16 00:00:00	14
2469	Gurupá	2018-06-16 00:00:00	14
2470	Igarapé-Açu	2018-06-16 00:00:00	14
2471	Igarapé-Miri	2018-06-16 00:00:00	14
2472	Inhangapi	2018-06-16 00:00:00	14
2473	Ipixuna do Pará	2018-06-16 00:00:00	14
2474	Irituia	2018-06-16 00:00:00	14
2475	Itaituba	2018-06-16 00:00:00	14
2476	Itupiranga	2018-06-16 00:00:00	14
2477	Jacareacanga	2018-06-16 00:00:00	14
2478	Jacundá	2018-06-16 00:00:00	14
2479	Juruti	2018-06-16 00:00:00	14
2480	Limoeiro do Ajuru	2018-06-16 00:00:00	14
2481	Mãe do Rio	2018-06-16 00:00:00	14
2482	Magalhães Barata	2018-06-16 00:00:00	14
2483	Marabá	2018-06-16 00:00:00	14
2484	Maracanã	2018-06-16 00:00:00	14
2485	Marapanim	2018-06-16 00:00:00	14
2486	Marituba	2018-06-16 00:00:00	14
2487	Medicilândia	2018-06-16 00:00:00	14
2488	Melgaço	2018-06-16 00:00:00	14
2489	Mocajuba	2018-06-16 00:00:00	14
2490	Moju	2018-06-16 00:00:00	14
2491	Monte Alegre	2018-06-16 00:00:00	14
2492	Muaná	2018-06-16 00:00:00	14
2493	Nova Esperança do Piriá	2018-06-16 00:00:00	14
2494	Nova Ipixuna	2018-06-16 00:00:00	14
2495	Nova Timboteua	2018-06-16 00:00:00	14
2496	Novo Progresso	2018-06-16 00:00:00	14
2497	Novo Repartimento	2018-06-16 00:00:00	14
2498	Óbidos	2018-06-16 00:00:00	14
2499	Oeiras do Pará	2018-06-16 00:00:00	14
2500	Oriximiná	2018-06-16 00:00:00	14
2501	Ourém	2018-06-16 00:00:00	14
2502	Ourilândia do Norte	2018-06-16 00:00:00	14
2503	Pacajá	2018-06-16 00:00:00	14
2504	Palestina do Pará	2018-06-16 00:00:00	14
2505	Paragominas	2018-06-16 00:00:00	14
2506	Parauapebas	2018-06-16 00:00:00	14
2507	Pau d`Arco	2018-06-16 00:00:00	14
2508	Peixe-Boi	2018-06-16 00:00:00	14
2509	Piçarra	2018-06-16 00:00:00	14
2510	Placas	2018-06-16 00:00:00	14
2511	Ponta de Pedras	2018-06-16 00:00:00	14
2512	Portel	2018-06-16 00:00:00	14
2513	Porto de Moz	2018-06-16 00:00:00	14
2514	Prainha	2018-06-16 00:00:00	14
2515	Primavera	2018-06-16 00:00:00	14
2516	Quatipuru	2018-06-16 00:00:00	14
2517	Redenção	2018-06-16 00:00:00	14
2518	Rio Maria	2018-06-16 00:00:00	14
2519	Rondon do Pará	2018-06-16 00:00:00	14
2520	Rurópolis	2018-06-16 00:00:00	14
2521	Salinópolis	2018-06-16 00:00:00	14
2522	Salvaterra	2018-06-16 00:00:00	14
2523	Santa Bárbara do Pará	2018-06-16 00:00:00	14
2524	Santa Cruz do Arari	2018-06-16 00:00:00	14
2525	Santa Isabel do Pará	2018-06-16 00:00:00	14
2526	Santa Luzia do Pará	2018-06-16 00:00:00	14
2527	Santa Maria das Barreiras	2018-06-16 00:00:00	14
2528	Santa Maria do Pará	2018-06-16 00:00:00	14
2529	Santana do Araguaia	2018-06-16 00:00:00	14
2530	Santarém	2018-06-16 00:00:00	14
2531	Santarém Novo	2018-06-16 00:00:00	14
2532	Santo Antônio do Tauá	2018-06-16 00:00:00	14
2533	São Caetano de Odivelas	2018-06-16 00:00:00	14
2534	São Domingos do Araguaia	2018-06-16 00:00:00	14
2535	São Domingos do Capim	2018-06-16 00:00:00	14
2536	São Félix do Xingu	2018-06-16 00:00:00	14
2537	São Francisco do Pará	2018-06-16 00:00:00	14
2538	São Geraldo do Araguaia	2018-06-16 00:00:00	14
2539	São João da Ponta	2018-06-16 00:00:00	14
2540	São João de Pirabas	2018-06-16 00:00:00	14
2541	São João do Araguaia	2018-06-16 00:00:00	14
2542	São Miguel do Guamá	2018-06-16 00:00:00	14
2543	São Sebastião da Boa Vista	2018-06-16 00:00:00	14
2544	Sapucaia	2018-06-16 00:00:00	14
2545	Senador José Porfírio	2018-06-16 00:00:00	14
2546	Soure	2018-06-16 00:00:00	14
2547	Tailândia	2018-06-16 00:00:00	14
2548	Terra Alta	2018-06-16 00:00:00	14
2549	Terra Santa	2018-06-16 00:00:00	14
2550	Tomé-Açu	2018-06-16 00:00:00	14
2551	Tracuateua	2018-06-16 00:00:00	14
2552	Trairão	2018-06-16 00:00:00	14
2553	Tucumã	2018-06-16 00:00:00	14
2554	Tucuruí	2018-06-16 00:00:00	14
2555	Ulianópolis	2018-06-16 00:00:00	14
2556	Uruará	2018-06-16 00:00:00	14
2557	Vigia	2018-06-16 00:00:00	14
2558	Viseu	2018-06-16 00:00:00	14
2559	Vitória do Xingu	2018-06-16 00:00:00	14
2560	Xinguara	2018-06-16 00:00:00	14
2561	Água Branca	2018-06-16 00:00:00	15
2562	Aguiar	2018-06-16 00:00:00	15
2563	Alagoa Grande	2018-06-16 00:00:00	15
2564	Alagoa Nova	2018-06-16 00:00:00	15
2565	Alagoinha	2018-06-16 00:00:00	15
2566	Alcantil	2018-06-16 00:00:00	15
2567	Algodão de Jandaíra	2018-06-16 00:00:00	15
2568	Alhandra	2018-06-16 00:00:00	15
2569	Amparo	2018-06-16 00:00:00	15
2570	Aparecida	2018-06-16 00:00:00	15
2571	Araçagi	2018-06-16 00:00:00	15
2572	Arara	2018-06-16 00:00:00	15
2573	Araruna	2018-06-16 00:00:00	15
2574	Areia	2018-06-16 00:00:00	15
2575	Areia de Baraúnas	2018-06-16 00:00:00	15
2576	Areial	2018-06-16 00:00:00	15
2577	Aroeiras	2018-06-16 00:00:00	15
2578	Assunção	2018-06-16 00:00:00	15
2579	Baía da Traição	2018-06-16 00:00:00	15
2580	Bananeiras	2018-06-16 00:00:00	15
2581	Baraúna	2018-06-16 00:00:00	15
2582	Barra de Santa Rosa	2018-06-16 00:00:00	15
2583	Barra de Santana	2018-06-16 00:00:00	15
2584	Barra de São Miguel	2018-06-16 00:00:00	15
2585	Bayeux	2018-06-16 00:00:00	15
2586	Belém	2018-06-16 00:00:00	15
2587	Belém do Brejo do Cruz	2018-06-16 00:00:00	15
2588	Bernardino Batista	2018-06-16 00:00:00	15
2589	Boa Ventura	2018-06-16 00:00:00	15
2590	Boa Vista	2018-06-16 00:00:00	15
2591	Bom Jesus	2018-06-16 00:00:00	15
2592	Bom Sucesso	2018-06-16 00:00:00	15
2593	Bonito de Santa Fé	2018-06-16 00:00:00	15
2594	Boqueirão	2018-06-16 00:00:00	15
2595	Borborema	2018-06-16 00:00:00	15
2596	Brejo do Cruz	2018-06-16 00:00:00	15
2597	Brejo dos Santos	2018-06-16 00:00:00	15
2598	Caaporã	2018-06-16 00:00:00	15
2599	Cabaceiras	2018-06-16 00:00:00	15
2600	Cabedelo	2018-06-16 00:00:00	15
2601	Cachoeira dos Índios	2018-06-16 00:00:00	15
2602	Cacimba de Areia	2018-06-16 00:00:00	15
2603	Cacimba de Dentro	2018-06-16 00:00:00	15
2604	Cacimbas	2018-06-16 00:00:00	15
2605	Caiçara	2018-06-16 00:00:00	15
2606	Cajazeiras	2018-06-16 00:00:00	15
2607	Cajazeirinhas	2018-06-16 00:00:00	15
2608	Caldas Brandão	2018-06-16 00:00:00	15
2609	Camalaú	2018-06-16 00:00:00	15
2610	Campina Grande	2018-06-16 00:00:00	15
2611	Campo de Santana	2018-06-16 00:00:00	15
2612	Capim	2018-06-16 00:00:00	15
2613	Caraúbas	2018-06-16 00:00:00	15
2614	Carrapateira	2018-06-16 00:00:00	15
2615	Casserengue	2018-06-16 00:00:00	15
2616	Catingueira	2018-06-16 00:00:00	15
2617	Catolé do Rocha	2018-06-16 00:00:00	15
2618	Caturité	2018-06-16 00:00:00	15
2619	Conceição	2018-06-16 00:00:00	15
2620	Condado	2018-06-16 00:00:00	15
2621	Conde	2018-06-16 00:00:00	15
2622	Congo	2018-06-16 00:00:00	15
2623	Coremas	2018-06-16 00:00:00	15
2624	Coxixola	2018-06-16 00:00:00	15
2625	Cruz do Espírito Santo	2018-06-16 00:00:00	15
2626	Cubati	2018-06-16 00:00:00	15
2627	Cuité	2018-06-16 00:00:00	15
2628	Cuité de Mamanguape	2018-06-16 00:00:00	15
2629	Cuitegi	2018-06-16 00:00:00	15
2630	Curral de Cima	2018-06-16 00:00:00	15
2631	Curral Velho	2018-06-16 00:00:00	15
2632	Damião	2018-06-16 00:00:00	15
2633	Desterro	2018-06-16 00:00:00	15
2634	Diamante	2018-06-16 00:00:00	15
2635	Dona Inês	2018-06-16 00:00:00	15
2636	Duas Estradas	2018-06-16 00:00:00	15
2637	Emas	2018-06-16 00:00:00	15
2638	Esperança	2018-06-16 00:00:00	15
2639	Fagundes	2018-06-16 00:00:00	15
2640	Frei Martinho	2018-06-16 00:00:00	15
2641	Gado Bravo	2018-06-16 00:00:00	15
2642	Guarabira	2018-06-16 00:00:00	15
2643	Gurinhém	2018-06-16 00:00:00	15
2644	Gurjão	2018-06-16 00:00:00	15
2645	Ibiara	2018-06-16 00:00:00	15
2646	Igaracy	2018-06-16 00:00:00	15
2647	Imaculada	2018-06-16 00:00:00	15
2648	Ingá	2018-06-16 00:00:00	15
2649	Itabaiana	2018-06-16 00:00:00	15
2650	Itaporanga	2018-06-16 00:00:00	15
2651	Itapororoca	2018-06-16 00:00:00	15
2652	Itatuba	2018-06-16 00:00:00	15
2653	Jacaraú	2018-06-16 00:00:00	15
2654	Jericó	2018-06-16 00:00:00	15
2655	João Pessoa	2018-06-16 00:00:00	15
2656	Juarez Távora	2018-06-16 00:00:00	15
2657	Juazeirinho	2018-06-16 00:00:00	15
2658	Junco do Seridó	2018-06-16 00:00:00	15
2659	Juripiranga	2018-06-16 00:00:00	15
2660	Juru	2018-06-16 00:00:00	15
2661	Lagoa	2018-06-16 00:00:00	15
2662	Lagoa de Dentro	2018-06-16 00:00:00	15
2663	Lagoa Seca	2018-06-16 00:00:00	15
2664	Lastro	2018-06-16 00:00:00	15
2665	Livramento	2018-06-16 00:00:00	15
2666	Logradouro	2018-06-16 00:00:00	15
2667	Lucena	2018-06-16 00:00:00	15
2668	Mãe d`Água	2018-06-16 00:00:00	15
2669	Malta	2018-06-16 00:00:00	15
2670	Mamanguape	2018-06-16 00:00:00	15
2671	Manaíra	2018-06-16 00:00:00	15
2672	Marcação	2018-06-16 00:00:00	15
2673	Mari	2018-06-16 00:00:00	15
2674	Marizópolis	2018-06-16 00:00:00	15
2675	Massaranduba	2018-06-16 00:00:00	15
2676	Mataraca	2018-06-16 00:00:00	15
2677	Matinhas	2018-06-16 00:00:00	15
2678	Mato Grosso	2018-06-16 00:00:00	15
2679	Maturéia	2018-06-16 00:00:00	15
2680	Mogeiro	2018-06-16 00:00:00	15
2681	Montadas	2018-06-16 00:00:00	15
2682	Monte Horebe	2018-06-16 00:00:00	15
2683	Monteiro	2018-06-16 00:00:00	15
2684	Mulungu	2018-06-16 00:00:00	15
2685	Natuba	2018-06-16 00:00:00	15
2686	Nazarezinho	2018-06-16 00:00:00	15
2687	Nova Floresta	2018-06-16 00:00:00	15
2688	Nova Olinda	2018-06-16 00:00:00	15
2689	Nova Palmeira	2018-06-16 00:00:00	15
2690	Olho d`Água	2018-06-16 00:00:00	15
2691	Olivedos	2018-06-16 00:00:00	15
2692	Ouro Velho	2018-06-16 00:00:00	15
2693	Parari	2018-06-16 00:00:00	15
2694	Passagem	2018-06-16 00:00:00	15
2695	Patos	2018-06-16 00:00:00	15
2696	Paulista	2018-06-16 00:00:00	15
2697	Pedra Branca	2018-06-16 00:00:00	15
2698	Pedra Lavrada	2018-06-16 00:00:00	15
2699	Pedras de Fogo	2018-06-16 00:00:00	15
2700	Pedro Régis	2018-06-16 00:00:00	15
2701	Piancó	2018-06-16 00:00:00	15
2702	Picuí	2018-06-16 00:00:00	15
2703	Pilar	2018-06-16 00:00:00	15
2704	Pilões	2018-06-16 00:00:00	15
2705	Pilõezinhos	2018-06-16 00:00:00	15
2706	Pirpirituba	2018-06-16 00:00:00	15
2707	Pitimbu	2018-06-16 00:00:00	15
2708	Pocinhos	2018-06-16 00:00:00	15
2709	Poço Dantas	2018-06-16 00:00:00	15
2710	Poço de José de Moura	2018-06-16 00:00:00	15
2711	Pombal	2018-06-16 00:00:00	15
2712	Prata	2018-06-16 00:00:00	15
2713	Princesa Isabel	2018-06-16 00:00:00	15
2714	Puxinanã	2018-06-16 00:00:00	15
2715	Queimadas	2018-06-16 00:00:00	15
2716	Quixabá	2018-06-16 00:00:00	15
2717	Remígio	2018-06-16 00:00:00	15
2718	Riachão	2018-06-16 00:00:00	15
2719	Riachão do Bacamarte	2018-06-16 00:00:00	15
2720	Riachão do Poço	2018-06-16 00:00:00	15
2721	Riacho de Santo Antônio	2018-06-16 00:00:00	15
2722	Riacho dos Cavalos	2018-06-16 00:00:00	15
2723	Rio Tinto	2018-06-16 00:00:00	15
2724	Salgadinho	2018-06-16 00:00:00	15
2725	Salgado de São Félix	2018-06-16 00:00:00	15
2726	Santa Cecília	2018-06-16 00:00:00	15
2727	Santa Cruz	2018-06-16 00:00:00	15
2728	Santa Helena	2018-06-16 00:00:00	15
2729	Santa Inês	2018-06-16 00:00:00	15
2730	Santa Luzia	2018-06-16 00:00:00	15
2731	Santa Rita	2018-06-16 00:00:00	15
2732	Santa Teresinha	2018-06-16 00:00:00	15
2733	Santana de Mangueira	2018-06-16 00:00:00	15
2734	Santana dos Garrotes	2018-06-16 00:00:00	15
2735	Santarém	2018-06-16 00:00:00	15
2736	Santo André	2018-06-16 00:00:00	15
2737	São Bentinho	2018-06-16 00:00:00	15
2738	São Bento	2018-06-16 00:00:00	15
2739	São Domingos de Pombal	2018-06-16 00:00:00	15
2740	São Domingos do Cariri	2018-06-16 00:00:00	15
2741	São Francisco	2018-06-16 00:00:00	15
2742	São João do Cariri	2018-06-16 00:00:00	15
2743	São João do Rio do Peixe	2018-06-16 00:00:00	15
2744	São João do Tigre	2018-06-16 00:00:00	15
2745	São José da Lagoa Tapada	2018-06-16 00:00:00	15
2746	São José de Caiana	2018-06-16 00:00:00	15
2747	São José de Espinharas	2018-06-16 00:00:00	15
2748	São José de Piranhas	2018-06-16 00:00:00	15
2749	São José de Princesa	2018-06-16 00:00:00	15
2750	São José do Bonfim	2018-06-16 00:00:00	15
2751	São José do Brejo do Cruz	2018-06-16 00:00:00	15
2752	São José do Sabugi	2018-06-16 00:00:00	15
2753	São José dos Cordeiros	2018-06-16 00:00:00	15
2754	São José dos Ramos	2018-06-16 00:00:00	15
2755	São Mamede	2018-06-16 00:00:00	15
2756	São Miguel de Taipu	2018-06-16 00:00:00	15
2757	São Sebastião de Lagoa de Roça	2018-06-16 00:00:00	15
2758	São Sebastião do Umbuzeiro	2018-06-16 00:00:00	15
2759	Sapé	2018-06-16 00:00:00	15
2760	Seridó	2018-06-16 00:00:00	15
2761	Serra Branca	2018-06-16 00:00:00	15
2762	Serra da Raiz	2018-06-16 00:00:00	15
2763	Serra Grande	2018-06-16 00:00:00	15
2764	Serra Redonda	2018-06-16 00:00:00	15
2765	Serraria	2018-06-16 00:00:00	15
2766	Sertãozinho	2018-06-16 00:00:00	15
2767	Sobrado	2018-06-16 00:00:00	15
2768	Solânea	2018-06-16 00:00:00	15
2769	Soledade	2018-06-16 00:00:00	15
2770	Sossêgo	2018-06-16 00:00:00	15
2771	Sousa	2018-06-16 00:00:00	15
2772	Sumé	2018-06-16 00:00:00	15
2773	Taperoá	2018-06-16 00:00:00	15
2774	Tavares	2018-06-16 00:00:00	15
2775	Teixeira	2018-06-16 00:00:00	15
2776	Tenório	2018-06-16 00:00:00	15
2777	Triunfo	2018-06-16 00:00:00	15
2778	Uiraúna	2018-06-16 00:00:00	15
2779	Umbuzeiro	2018-06-16 00:00:00	15
2780	Várzea	2018-06-16 00:00:00	15
2781	Vieirópolis	2018-06-16 00:00:00	15
2782	Vista Serrana	2018-06-16 00:00:00	15
2783	Zabelê	2018-06-16 00:00:00	15
2784	Abatiá	2018-06-16 00:00:00	18
2785	Adrianópolis	2018-06-16 00:00:00	18
2786	Agudos do Sul	2018-06-16 00:00:00	18
2787	Almirante Tamandaré	2018-06-16 00:00:00	18
2788	Altamira do Paraná	2018-06-16 00:00:00	18
2789	Alto Paraíso	2018-06-16 00:00:00	18
2790	Alto Paraná	2018-06-16 00:00:00	18
2791	Alto Piquiri	2018-06-16 00:00:00	18
2792	Altônia	2018-06-16 00:00:00	18
2793	Alvorada do Sul	2018-06-16 00:00:00	18
2794	Amaporã	2018-06-16 00:00:00	18
2795	Ampére	2018-06-16 00:00:00	18
2796	Anahy	2018-06-16 00:00:00	18
2797	Andirá	2018-06-16 00:00:00	18
2798	Ângulo	2018-06-16 00:00:00	18
2799	Antonina	2018-06-16 00:00:00	18
2800	Antônio Olinto	2018-06-16 00:00:00	18
2801	Apucarana	2018-06-16 00:00:00	18
2802	Arapongas	2018-06-16 00:00:00	18
2803	Arapoti	2018-06-16 00:00:00	18
2804	Arapuã	2018-06-16 00:00:00	18
2805	Araruna	2018-06-16 00:00:00	18
2806	Araucária	2018-06-16 00:00:00	18
2807	Ariranha do Ivaí	2018-06-16 00:00:00	18
2808	Assaí	2018-06-16 00:00:00	18
2809	Assis Chateaubriand	2018-06-16 00:00:00	18
2810	Astorga	2018-06-16 00:00:00	18
2811	Atalaia	2018-06-16 00:00:00	18
2812	Balsa Nova	2018-06-16 00:00:00	18
2813	Bandeirantes	2018-06-16 00:00:00	18
2814	Barbosa Ferraz	2018-06-16 00:00:00	18
2815	Barra do Jacaré	2018-06-16 00:00:00	18
2816	Barracão	2018-06-16 00:00:00	18
2817	Bela Vista da Caroba	2018-06-16 00:00:00	18
2818	Bela Vista do Paraíso	2018-06-16 00:00:00	18
2819	Bituruna	2018-06-16 00:00:00	18
2820	Boa Esperança	2018-06-16 00:00:00	18
2821	Boa Esperança do Iguaçu	2018-06-16 00:00:00	18
2822	Boa Ventura de São Roque	2018-06-16 00:00:00	18
2823	Boa Vista da Aparecida	2018-06-16 00:00:00	18
2824	Bocaiúva do Sul	2018-06-16 00:00:00	18
2825	Bom Jesus do Sul	2018-06-16 00:00:00	18
2826	Bom Sucesso	2018-06-16 00:00:00	18
2827	Bom Sucesso do Sul	2018-06-16 00:00:00	18
2828	Borrazópolis	2018-06-16 00:00:00	18
2829	Braganey	2018-06-16 00:00:00	18
2830	Brasilândia do Sul	2018-06-16 00:00:00	18
2831	Cafeara	2018-06-16 00:00:00	18
2832	Cafelândia	2018-06-16 00:00:00	18
2833	Cafezal do Sul	2018-06-16 00:00:00	18
2834	Califórnia	2018-06-16 00:00:00	18
2835	Cambará	2018-06-16 00:00:00	18
2836	Cambé	2018-06-16 00:00:00	18
2837	Cambira	2018-06-16 00:00:00	18
2838	Campina da Lagoa	2018-06-16 00:00:00	18
2839	Campina do Simão	2018-06-16 00:00:00	18
2840	Campina Grande do Sul	2018-06-16 00:00:00	18
2841	Campo Bonito	2018-06-16 00:00:00	18
2842	Campo do Tenente	2018-06-16 00:00:00	18
2843	Campo Largo	2018-06-16 00:00:00	18
2844	Campo Magro	2018-06-16 00:00:00	18
2845	Campo Mourão	2018-06-16 00:00:00	18
2846	Cândido de Abreu	2018-06-16 00:00:00	18
2847	Candói	2018-06-16 00:00:00	18
2848	Cantagalo	2018-06-16 00:00:00	18
2849	Capanema	2018-06-16 00:00:00	18
2850	Capitão Leônidas Marques	2018-06-16 00:00:00	18
2851	Carambeí	2018-06-16 00:00:00	18
2852	Carlópolis	2018-06-16 00:00:00	18
2853	Cascavel	2018-06-16 00:00:00	18
2854	Castro	2018-06-16 00:00:00	18
2855	Catanduvas	2018-06-16 00:00:00	18
2856	Centenário do Sul	2018-06-16 00:00:00	18
2857	Cerro Azul	2018-06-16 00:00:00	18
2858	Céu Azul	2018-06-16 00:00:00	18
2859	Chopinzinho	2018-06-16 00:00:00	18
2860	Cianorte	2018-06-16 00:00:00	18
2861	Cidade Gaúcha	2018-06-16 00:00:00	18
2862	Clevelândia	2018-06-16 00:00:00	18
2863	Colombo	2018-06-16 00:00:00	18
2864	Colorado	2018-06-16 00:00:00	18
2865	Congonhinhas	2018-06-16 00:00:00	18
2866	Conselheiro Mairinck	2018-06-16 00:00:00	18
2867	Contenda	2018-06-16 00:00:00	18
2868	Corbélia	2018-06-16 00:00:00	18
2869	Cornélio Procópio	2018-06-16 00:00:00	18
2870	Coronel Domingos Soares	2018-06-16 00:00:00	18
2871	Coronel Vivida	2018-06-16 00:00:00	18
2872	Corumbataí do Sul	2018-06-16 00:00:00	18
2873	Cruz Machado	2018-06-16 00:00:00	18
2874	Cruzeiro do Iguaçu	2018-06-16 00:00:00	18
2875	Cruzeiro do Oeste	2018-06-16 00:00:00	18
2876	Cruzeiro do Sul	2018-06-16 00:00:00	18
2877	Cruzmaltina	2018-06-16 00:00:00	18
2878	Curitiba	2018-06-16 00:00:00	18
2879	Curiúva	2018-06-16 00:00:00	18
2880	Diamante d`Oeste	2018-06-16 00:00:00	18
2881	Diamante do Norte	2018-06-16 00:00:00	18
2882	Diamante do Sul	2018-06-16 00:00:00	18
2883	Dois Vizinhos	2018-06-16 00:00:00	18
2884	Douradina	2018-06-16 00:00:00	18
2885	Doutor Camargo	2018-06-16 00:00:00	18
2886	Doutor Ulysses	2018-06-16 00:00:00	18
2887	Enéas Marques	2018-06-16 00:00:00	18
2888	Engenheiro Beltrão	2018-06-16 00:00:00	18
2889	Entre Rios do Oeste	2018-06-16 00:00:00	18
2890	Esperança Nova	2018-06-16 00:00:00	18
2891	Espigão Alto do Iguaçu	2018-06-16 00:00:00	18
2892	Farol	2018-06-16 00:00:00	18
2893	Faxinal	2018-06-16 00:00:00	18
2894	Fazenda Rio Grande	2018-06-16 00:00:00	18
2895	Fênix	2018-06-16 00:00:00	18
2896	Fernandes Pinheiro	2018-06-16 00:00:00	18
2897	Figueira	2018-06-16 00:00:00	18
2898	Flor da Serra do Sul	2018-06-16 00:00:00	18
2899	Floraí	2018-06-16 00:00:00	18
2900	Floresta	2018-06-16 00:00:00	18
2901	Florestópolis	2018-06-16 00:00:00	18
2902	Flórida	2018-06-16 00:00:00	18
2903	Formosa do Oeste	2018-06-16 00:00:00	18
2904	Foz do Iguaçu	2018-06-16 00:00:00	18
2905	Foz do Jordão	2018-06-16 00:00:00	18
2906	Francisco Alves	2018-06-16 00:00:00	18
2907	Francisco Beltrão	2018-06-16 00:00:00	18
2908	General Carneiro	2018-06-16 00:00:00	18
2909	Godoy Moreira	2018-06-16 00:00:00	18
2910	Goioerê	2018-06-16 00:00:00	18
2911	Goioxim	2018-06-16 00:00:00	18
2912	Grandes Rios	2018-06-16 00:00:00	18
2913	Guaíra	2018-06-16 00:00:00	18
2914	Guairaçá	2018-06-16 00:00:00	18
2915	Guamiranga	2018-06-16 00:00:00	18
2916	Guapirama	2018-06-16 00:00:00	18
2917	Guaporema	2018-06-16 00:00:00	18
2918	Guaraci	2018-06-16 00:00:00	18
2919	Guaraniaçu	2018-06-16 00:00:00	18
2920	Guarapuava	2018-06-16 00:00:00	18
2921	Guaraqueçaba	2018-06-16 00:00:00	18
2922	Guaratuba	2018-06-16 00:00:00	18
2923	Honório Serpa	2018-06-16 00:00:00	18
2924	Ibaiti	2018-06-16 00:00:00	18
2925	Ibema	2018-06-16 00:00:00	18
2926	Ibiporã	2018-06-16 00:00:00	18
2927	Icaraíma	2018-06-16 00:00:00	18
2928	Iguaraçu	2018-06-16 00:00:00	18
2929	Iguatu	2018-06-16 00:00:00	18
2930	Imbaú	2018-06-16 00:00:00	18
2931	Imbituva	2018-06-16 00:00:00	18
2932	Inácio Martins	2018-06-16 00:00:00	18
2933	Inajá	2018-06-16 00:00:00	18
2934	Indianópolis	2018-06-16 00:00:00	18
2935	Ipiranga	2018-06-16 00:00:00	18
2936	Iporã	2018-06-16 00:00:00	18
2937	Iracema do Oeste	2018-06-16 00:00:00	18
2938	Irati	2018-06-16 00:00:00	18
2939	Iretama	2018-06-16 00:00:00	18
2940	Itaguajé	2018-06-16 00:00:00	18
2941	Itaipulândia	2018-06-16 00:00:00	18
2942	Itambaracá	2018-06-16 00:00:00	18
2943	Itambé	2018-06-16 00:00:00	18
2944	Itapejara d`Oeste	2018-06-16 00:00:00	18
2945	Itaperuçu	2018-06-16 00:00:00	18
2946	Itaúna do Sul	2018-06-16 00:00:00	18
2947	Ivaí	2018-06-16 00:00:00	18
2948	Ivaiporã	2018-06-16 00:00:00	18
2949	Ivaté	2018-06-16 00:00:00	18
2950	Ivatuba	2018-06-16 00:00:00	18
2951	Jaboti	2018-06-16 00:00:00	18
2952	Jacarezinho	2018-06-16 00:00:00	18
2953	Jaguapitã	2018-06-16 00:00:00	18
2954	Jaguariaíva	2018-06-16 00:00:00	18
2955	Jandaia do Sul	2018-06-16 00:00:00	18
2956	Janiópolis	2018-06-16 00:00:00	18
2957	Japira	2018-06-16 00:00:00	18
2958	Japurá	2018-06-16 00:00:00	18
2959	Jardim Alegre	2018-06-16 00:00:00	18
2960	Jardim Olinda	2018-06-16 00:00:00	18
2961	Jataizinho	2018-06-16 00:00:00	18
2962	Jesuítas	2018-06-16 00:00:00	18
2963	Joaquim Távora	2018-06-16 00:00:00	18
2964	Jundiaí do Sul	2018-06-16 00:00:00	18
2965	Juranda	2018-06-16 00:00:00	18
2966	Jussara	2018-06-16 00:00:00	18
2967	Kaloré	2018-06-16 00:00:00	18
2968	Lapa	2018-06-16 00:00:00	18
2969	Laranjal	2018-06-16 00:00:00	18
2970	Laranjeiras do Sul	2018-06-16 00:00:00	18
2971	Leópolis	2018-06-16 00:00:00	18
2972	Lidianópolis	2018-06-16 00:00:00	18
2973	Lindoeste	2018-06-16 00:00:00	18
2974	Loanda	2018-06-16 00:00:00	18
2975	Lobato	2018-06-16 00:00:00	18
2976	Londrina	2018-06-16 00:00:00	18
2977	Luiziana	2018-06-16 00:00:00	18
2978	Lunardelli	2018-06-16 00:00:00	18
2979	Lupionópolis	2018-06-16 00:00:00	18
2980	Mallet	2018-06-16 00:00:00	18
2981	Mamborê	2018-06-16 00:00:00	18
2982	Mandaguaçu	2018-06-16 00:00:00	18
2983	Mandaguari	2018-06-16 00:00:00	18
2984	Mandirituba	2018-06-16 00:00:00	18
2985	Manfrinópolis	2018-06-16 00:00:00	18
2986	Mangueirinha	2018-06-16 00:00:00	18
2987	Manoel Ribas	2018-06-16 00:00:00	18
2988	Marechal Cândido Rondon	2018-06-16 00:00:00	18
2989	Maria Helena	2018-06-16 00:00:00	18
2990	Marialva	2018-06-16 00:00:00	18
2991	Marilândia do Sul	2018-06-16 00:00:00	18
2992	Marilena	2018-06-16 00:00:00	18
2993	Mariluz	2018-06-16 00:00:00	18
2994	Maringá	2018-06-16 00:00:00	18
2995	Mariópolis	2018-06-16 00:00:00	18
2996	Maripá	2018-06-16 00:00:00	18
2997	Marmeleiro	2018-06-16 00:00:00	18
2998	Marquinho	2018-06-16 00:00:00	18
2999	Marumbi	2018-06-16 00:00:00	18
3000	Matelândia	2018-06-16 00:00:00	18
3001	Matinhos	2018-06-16 00:00:00	18
3002	Mato Rico	2018-06-16 00:00:00	18
3003	Mauá da Serra	2018-06-16 00:00:00	18
3004	Medianeira	2018-06-16 00:00:00	18
3005	Mercedes	2018-06-16 00:00:00	18
3006	Mirador	2018-06-16 00:00:00	18
3007	Miraselva	2018-06-16 00:00:00	18
3008	Missal	2018-06-16 00:00:00	18
3009	Moreira Sales	2018-06-16 00:00:00	18
3010	Morretes	2018-06-16 00:00:00	18
3011	Munhoz de Melo	2018-06-16 00:00:00	18
3012	Nossa Senhora das Graças	2018-06-16 00:00:00	18
3013	Nova Aliança do Ivaí	2018-06-16 00:00:00	18
3014	Nova América da Colina	2018-06-16 00:00:00	18
3015	Nova Aurora	2018-06-16 00:00:00	18
3016	Nova Cantu	2018-06-16 00:00:00	18
3017	Nova Esperança	2018-06-16 00:00:00	18
3018	Nova Esperança do Sudoeste	2018-06-16 00:00:00	18
3019	Nova Fátima	2018-06-16 00:00:00	18
3020	Nova Laranjeiras	2018-06-16 00:00:00	18
3021	Nova Londrina	2018-06-16 00:00:00	18
3022	Nova Olímpia	2018-06-16 00:00:00	18
3023	Nova Prata do Iguaçu	2018-06-16 00:00:00	18
3024	Nova Santa Bárbara	2018-06-16 00:00:00	18
3025	Nova Santa Rosa	2018-06-16 00:00:00	18
3026	Nova Tebas	2018-06-16 00:00:00	18
3027	Novo Itacolomi	2018-06-16 00:00:00	18
3028	Ortigueira	2018-06-16 00:00:00	18
3029	Ourizona	2018-06-16 00:00:00	18
3030	Ouro Verde do Oeste	2018-06-16 00:00:00	18
3031	Paiçandu	2018-06-16 00:00:00	18
3032	Palmas	2018-06-16 00:00:00	18
3033	Palmeira	2018-06-16 00:00:00	18
3034	Palmital	2018-06-16 00:00:00	18
3035	Palotina	2018-06-16 00:00:00	18
3036	Paraíso do Norte	2018-06-16 00:00:00	18
3037	Paranacity	2018-06-16 00:00:00	18
3038	Paranaguá	2018-06-16 00:00:00	18
3039	Paranapoema	2018-06-16 00:00:00	18
3040	Paranavaí	2018-06-16 00:00:00	18
3041	Pato Bragado	2018-06-16 00:00:00	18
3042	Pato Branco	2018-06-16 00:00:00	18
3043	Paula Freitas	2018-06-16 00:00:00	18
3044	Paulo Frontin	2018-06-16 00:00:00	18
3045	Peabiru	2018-06-16 00:00:00	18
3046	Perobal	2018-06-16 00:00:00	18
3047	Pérola	2018-06-16 00:00:00	18
3048	Pérola d`Oeste	2018-06-16 00:00:00	18
3049	Piên	2018-06-16 00:00:00	18
3050	Pinhais	2018-06-16 00:00:00	18
3051	Pinhal de São Bento	2018-06-16 00:00:00	18
3052	Pinhalão	2018-06-16 00:00:00	18
3053	Pinhão	2018-06-16 00:00:00	18
3054	Piraí do Sul	2018-06-16 00:00:00	18
3055	Piraquara	2018-06-16 00:00:00	18
3056	Pitanga	2018-06-16 00:00:00	18
3057	Pitangueiras	2018-06-16 00:00:00	18
3058	Planaltina do Paraná	2018-06-16 00:00:00	18
3059	Planalto	2018-06-16 00:00:00	18
3060	Ponta Grossa	2018-06-16 00:00:00	18
3061	Pontal do Paraná	2018-06-16 00:00:00	18
3062	Porecatu	2018-06-16 00:00:00	18
3063	Porto Amazonas	2018-06-16 00:00:00	18
3064	Porto Barreiro	2018-06-16 00:00:00	18
3065	Porto Rico	2018-06-16 00:00:00	18
3066	Porto Vitória	2018-06-16 00:00:00	18
3067	Prado Ferreira	2018-06-16 00:00:00	18
3068	Pranchita	2018-06-16 00:00:00	18
3069	Presidente Castelo Branco	2018-06-16 00:00:00	18
3070	Primeiro de Maio	2018-06-16 00:00:00	18
3071	Prudentópolis	2018-06-16 00:00:00	18
3072	Quarto Centenário	2018-06-16 00:00:00	18
3073	Quatiguá	2018-06-16 00:00:00	18
3074	Quatro Barras	2018-06-16 00:00:00	18
3075	Quatro Pontes	2018-06-16 00:00:00	18
3076	Quedas do Iguaçu	2018-06-16 00:00:00	18
3077	Querência do Norte	2018-06-16 00:00:00	18
3078	Quinta do Sol	2018-06-16 00:00:00	18
3079	Quitandinha	2018-06-16 00:00:00	18
3080	Ramilândia	2018-06-16 00:00:00	18
3081	Rancho Alegre	2018-06-16 00:00:00	18
3082	Rancho Alegre d`Oeste	2018-06-16 00:00:00	18
3083	Realeza	2018-06-16 00:00:00	18
3084	Rebouças	2018-06-16 00:00:00	18
3085	Renascença	2018-06-16 00:00:00	18
3086	Reserva	2018-06-16 00:00:00	18
3087	Reserva do Iguaçu	2018-06-16 00:00:00	18
3088	Ribeirão Claro	2018-06-16 00:00:00	18
3089	Ribeirão do Pinhal	2018-06-16 00:00:00	18
3090	Rio Azul	2018-06-16 00:00:00	18
3091	Rio Bom	2018-06-16 00:00:00	18
3092	Rio Bonito do Iguaçu	2018-06-16 00:00:00	18
3093	Rio Branco do Ivaí	2018-06-16 00:00:00	18
3094	Rio Branco do Sul	2018-06-16 00:00:00	18
3095	Rio Negro	2018-06-16 00:00:00	18
3096	Rolândia	2018-06-16 00:00:00	18
3097	Roncador	2018-06-16 00:00:00	18
3098	Rondon	2018-06-16 00:00:00	18
3099	Rosário do Ivaí	2018-06-16 00:00:00	18
3100	Sabáudia	2018-06-16 00:00:00	18
3101	Salgado Filho	2018-06-16 00:00:00	18
3102	Salto do Itararé	2018-06-16 00:00:00	18
3103	Salto do Lontra	2018-06-16 00:00:00	18
3104	Santa Amélia	2018-06-16 00:00:00	18
3105	Santa Cecília do Pavão	2018-06-16 00:00:00	18
3106	Santa Cruz de Monte Castelo	2018-06-16 00:00:00	18
3107	Santa Fé	2018-06-16 00:00:00	18
3108	Santa Helena	2018-06-16 00:00:00	18
3109	Santa Inês	2018-06-16 00:00:00	18
3110	Santa Isabel do Ivaí	2018-06-16 00:00:00	18
3111	Santa Izabel do Oeste	2018-06-16 00:00:00	18
3112	Santa Lúcia	2018-06-16 00:00:00	18
3113	Santa Maria do Oeste	2018-06-16 00:00:00	18
3114	Santa Mariana	2018-06-16 00:00:00	18
3115	Santa Mônica	2018-06-16 00:00:00	18
3116	Santa Tereza do Oeste	2018-06-16 00:00:00	18
3117	Santa Terezinha de Itaipu	2018-06-16 00:00:00	18
3118	Santana do Itararé	2018-06-16 00:00:00	18
3119	Santo Antônio da Platina	2018-06-16 00:00:00	18
3120	Santo Antônio do Caiuá	2018-06-16 00:00:00	18
3121	Santo Antônio do Paraíso	2018-06-16 00:00:00	18
3122	Santo Antônio do Sudoeste	2018-06-16 00:00:00	18
3123	Santo Inácio	2018-06-16 00:00:00	18
3124	São Carlos do Ivaí	2018-06-16 00:00:00	18
3125	São Jerônimo da Serra	2018-06-16 00:00:00	18
3126	São João	2018-06-16 00:00:00	18
3127	São João do Caiuá	2018-06-16 00:00:00	18
3128	São João do Ivaí	2018-06-16 00:00:00	18
3129	São João do Triunfo	2018-06-16 00:00:00	18
3130	São Jorge d`Oeste	2018-06-16 00:00:00	18
3131	São Jorge do Ivaí	2018-06-16 00:00:00	18
3132	São Jorge do Patrocínio	2018-06-16 00:00:00	18
3133	São José da Boa Vista	2018-06-16 00:00:00	18
3134	São José das Palmeiras	2018-06-16 00:00:00	18
3135	São José dos Pinhais	2018-06-16 00:00:00	18
3136	São Manoel do Paraná	2018-06-16 00:00:00	18
3137	São Mateus do Sul	2018-06-16 00:00:00	18
3138	São Miguel do Iguaçu	2018-06-16 00:00:00	18
3139	São Pedro do Iguaçu	2018-06-16 00:00:00	18
3140	São Pedro do Ivaí	2018-06-16 00:00:00	18
3141	São Pedro do Paraná	2018-06-16 00:00:00	18
3142	São Sebastião da Amoreira	2018-06-16 00:00:00	18
3143	São Tomé	2018-06-16 00:00:00	18
3144	Sapopema	2018-06-16 00:00:00	18
3145	Sarandi	2018-06-16 00:00:00	18
3146	Saudade do Iguaçu	2018-06-16 00:00:00	18
3147	Sengés	2018-06-16 00:00:00	18
3148	Serranópolis do Iguaçu	2018-06-16 00:00:00	18
3149	Sertaneja	2018-06-16 00:00:00	18
3150	Sertanópolis	2018-06-16 00:00:00	18
3151	Siqueira Campos	2018-06-16 00:00:00	18
3152	Sulina	2018-06-16 00:00:00	18
3153	Tamarana	2018-06-16 00:00:00	18
3154	Tamboara	2018-06-16 00:00:00	18
3155	Tapejara	2018-06-16 00:00:00	18
3156	Tapira	2018-06-16 00:00:00	18
3157	Teixeira Soares	2018-06-16 00:00:00	18
3158	Telêmaco Borba	2018-06-16 00:00:00	18
3159	Terra Boa	2018-06-16 00:00:00	18
3160	Terra Rica	2018-06-16 00:00:00	18
3161	Terra Roxa	2018-06-16 00:00:00	18
3162	Tibagi	2018-06-16 00:00:00	18
3163	Tijucas do Sul	2018-06-16 00:00:00	18
3164	Toledo	2018-06-16 00:00:00	18
3165	Tomazina	2018-06-16 00:00:00	18
3166	Três Barras do Paraná	2018-06-16 00:00:00	18
3167	Tunas do Paraná	2018-06-16 00:00:00	18
3168	Tuneiras do Oeste	2018-06-16 00:00:00	18
3169	Tupãssi	2018-06-16 00:00:00	18
3170	Turvo	2018-06-16 00:00:00	18
3171	Ubiratã	2018-06-16 00:00:00	18
3172	Umuarama	2018-06-16 00:00:00	18
3173	União da Vitória	2018-06-16 00:00:00	18
3174	Uniflor	2018-06-16 00:00:00	18
3175	Uraí	2018-06-16 00:00:00	18
3176	Ventania	2018-06-16 00:00:00	18
3177	Vera Cruz do Oeste	2018-06-16 00:00:00	18
3178	Verê	2018-06-16 00:00:00	18
3179	Virmond	2018-06-16 00:00:00	18
3180	Vitorino	2018-06-16 00:00:00	18
3181	Wenceslau Braz	2018-06-16 00:00:00	18
3182	Xambrê	2018-06-16 00:00:00	18
3183	Abreu e Lima	2018-06-16 00:00:00	16
3184	Afogados da Ingazeira	2018-06-16 00:00:00	16
3185	Afrânio	2018-06-16 00:00:00	16
3186	Agrestina	2018-06-16 00:00:00	16
3187	Água Preta	2018-06-16 00:00:00	16
3188	Águas Belas	2018-06-16 00:00:00	16
3189	Alagoinha	2018-06-16 00:00:00	16
3190	Aliança	2018-06-16 00:00:00	16
3191	Altinho	2018-06-16 00:00:00	16
3192	Amaraji	2018-06-16 00:00:00	16
3193	Angelim	2018-06-16 00:00:00	16
3194	Araçoiaba	2018-06-16 00:00:00	16
3195	Araripina	2018-06-16 00:00:00	16
3196	Arcoverde	2018-06-16 00:00:00	16
3197	Barra de Guabiraba	2018-06-16 00:00:00	16
3198	Barreiros	2018-06-16 00:00:00	16
3199	Belém de Maria	2018-06-16 00:00:00	16
3200	Belém de São Francisco	2018-06-16 00:00:00	16
3201	Belo Jardim	2018-06-16 00:00:00	16
3202	Betânia	2018-06-16 00:00:00	16
3203	Bezerros	2018-06-16 00:00:00	16
3204	Bodocó	2018-06-16 00:00:00	16
3205	Bom Conselho	2018-06-16 00:00:00	16
3206	Bom Jardim	2018-06-16 00:00:00	16
3207	Bonito	2018-06-16 00:00:00	16
3208	Brejão	2018-06-16 00:00:00	16
3209	Brejinho	2018-06-16 00:00:00	16
3210	Brejo da Madre de Deus	2018-06-16 00:00:00	16
3211	Buenos Aires	2018-06-16 00:00:00	16
3212	Buíque	2018-06-16 00:00:00	16
3213	Cabo de Santo Agostinho	2018-06-16 00:00:00	16
3214	Cabrobó	2018-06-16 00:00:00	16
3215	Cachoeirinha	2018-06-16 00:00:00	16
3216	Caetés	2018-06-16 00:00:00	16
3217	Calçado	2018-06-16 00:00:00	16
3218	Calumbi	2018-06-16 00:00:00	16
3219	Camaragibe	2018-06-16 00:00:00	16
3220	Camocim de São Félix	2018-06-16 00:00:00	16
3221	Camutanga	2018-06-16 00:00:00	16
3222	Canhotinho	2018-06-16 00:00:00	16
3223	Capoeiras	2018-06-16 00:00:00	16
3224	Carnaíba	2018-06-16 00:00:00	16
3225	Carnaubeira da Penha	2018-06-16 00:00:00	16
3226	Carpina	2018-06-16 00:00:00	16
3227	Caruaru	2018-06-16 00:00:00	16
3228	Casinhas	2018-06-16 00:00:00	16
3229	Catende	2018-06-16 00:00:00	16
3230	Cedro	2018-06-16 00:00:00	16
3231	Chã de Alegria	2018-06-16 00:00:00	16
3232	Chã Grande	2018-06-16 00:00:00	16
3233	Condado	2018-06-16 00:00:00	16
3234	Correntes	2018-06-16 00:00:00	16
3235	Cortês	2018-06-16 00:00:00	16
3236	Cumaru	2018-06-16 00:00:00	16
3237	Cupira	2018-06-16 00:00:00	16
3238	Custódia	2018-06-16 00:00:00	16
3239	Dormentes	2018-06-16 00:00:00	16
3240	Escada	2018-06-16 00:00:00	16
3241	Exu	2018-06-16 00:00:00	16
3242	Feira Nova	2018-06-16 00:00:00	16
3243	Fernando de Noronha	2018-06-16 00:00:00	16
3244	Ferreiros	2018-06-16 00:00:00	16
3245	Flores	2018-06-16 00:00:00	16
3246	Floresta	2018-06-16 00:00:00	16
3247	Frei Miguelinho	2018-06-16 00:00:00	16
3248	Gameleira	2018-06-16 00:00:00	16
3249	Garanhuns	2018-06-16 00:00:00	16
3250	Glória do Goitá	2018-06-16 00:00:00	16
3251	Goiana	2018-06-16 00:00:00	16
3252	Granito	2018-06-16 00:00:00	16
3253	Gravatá	2018-06-16 00:00:00	16
3254	Iati	2018-06-16 00:00:00	16
3255	Ibimirim	2018-06-16 00:00:00	16
3256	Ibirajuba	2018-06-16 00:00:00	16
3257	Igarassu	2018-06-16 00:00:00	16
3258	Iguaraci	2018-06-16 00:00:00	16
3259	Ilha de Itamaracá	2018-06-16 00:00:00	16
3260	Inajá	2018-06-16 00:00:00	16
3261	Ingazeira	2018-06-16 00:00:00	16
3262	Ipojuca	2018-06-16 00:00:00	16
3263	Ipubi	2018-06-16 00:00:00	16
3264	Itacuruba	2018-06-16 00:00:00	16
3265	Itaíba	2018-06-16 00:00:00	16
3266	Itambé	2018-06-16 00:00:00	16
3267	Itapetim	2018-06-16 00:00:00	16
3268	Itapissuma	2018-06-16 00:00:00	16
3269	Itaquitinga	2018-06-16 00:00:00	16
3270	Jaboatão dos Guararapes	2018-06-16 00:00:00	16
3271	Jaqueira	2018-06-16 00:00:00	16
3272	Jataúba	2018-06-16 00:00:00	16
3273	Jatobá	2018-06-16 00:00:00	16
3274	João Alfredo	2018-06-16 00:00:00	16
3275	Joaquim Nabuco	2018-06-16 00:00:00	16
3276	Jucati	2018-06-16 00:00:00	16
3277	Jupi	2018-06-16 00:00:00	16
3278	Jurema	2018-06-16 00:00:00	16
3279	Lagoa do Carro	2018-06-16 00:00:00	16
3280	Lagoa do Itaenga	2018-06-16 00:00:00	16
3281	Lagoa do Ouro	2018-06-16 00:00:00	16
3282	Lagoa dos Gatos	2018-06-16 00:00:00	16
3283	Lagoa Grande	2018-06-16 00:00:00	16
3284	Lajedo	2018-06-16 00:00:00	16
3285	Limoeiro	2018-06-16 00:00:00	16
3286	Macaparana	2018-06-16 00:00:00	16
3287	Machados	2018-06-16 00:00:00	16
3288	Manari	2018-06-16 00:00:00	16
3289	Maraial	2018-06-16 00:00:00	16
3290	Mirandiba	2018-06-16 00:00:00	16
3291	Moreilândia	2018-06-16 00:00:00	16
3292	Moreno	2018-06-16 00:00:00	16
3293	Nazaré da Mata	2018-06-16 00:00:00	16
3294	Olinda	2018-06-16 00:00:00	16
3295	Orobó	2018-06-16 00:00:00	16
3296	Orocó	2018-06-16 00:00:00	16
3297	Ouricuri	2018-06-16 00:00:00	16
3298	Palmares	2018-06-16 00:00:00	16
3299	Palmeirina	2018-06-16 00:00:00	16
3300	Panelas	2018-06-16 00:00:00	16
3301	Paranatama	2018-06-16 00:00:00	16
3302	Parnamirim	2018-06-16 00:00:00	16
3303	Passira	2018-06-16 00:00:00	16
3304	Paudalho	2018-06-16 00:00:00	16
3305	Paulista	2018-06-16 00:00:00	16
3306	Pedra	2018-06-16 00:00:00	16
3307	Pesqueira	2018-06-16 00:00:00	16
3308	Petrolândia	2018-06-16 00:00:00	16
3309	Petrolina	2018-06-16 00:00:00	16
3310	Poção	2018-06-16 00:00:00	16
3311	Pombos	2018-06-16 00:00:00	16
3312	Primavera	2018-06-16 00:00:00	16
3313	Quipapá	2018-06-16 00:00:00	16
3314	Quixaba	2018-06-16 00:00:00	16
3315	Recife	2018-06-16 00:00:00	16
3316	Riacho das Almas	2018-06-16 00:00:00	16
3317	Ribeirão	2018-06-16 00:00:00	16
3318	Rio Formoso	2018-06-16 00:00:00	16
3319	Sairé	2018-06-16 00:00:00	16
3320	Salgadinho	2018-06-16 00:00:00	16
3321	Salgueiro	2018-06-16 00:00:00	16
3322	Saloá	2018-06-16 00:00:00	16
3323	Sanharó	2018-06-16 00:00:00	16
3324	Santa Cruz	2018-06-16 00:00:00	16
3325	Santa Cruz da Baixa Verde	2018-06-16 00:00:00	16
3326	Santa Cruz do Capibaribe	2018-06-16 00:00:00	16
3327	Santa Filomena	2018-06-16 00:00:00	16
3328	Santa Maria da Boa Vista	2018-06-16 00:00:00	16
3329	Santa Maria do Cambucá	2018-06-16 00:00:00	16
3330	Santa Terezinha	2018-06-16 00:00:00	16
3331	São Benedito do Sul	2018-06-16 00:00:00	16
3332	São Bento do Una	2018-06-16 00:00:00	16
3333	São Caitano	2018-06-16 00:00:00	16
3334	São João	2018-06-16 00:00:00	16
3335	São Joaquim do Monte	2018-06-16 00:00:00	16
3336	São José da Coroa Grande	2018-06-16 00:00:00	16
3337	São José do Belmonte	2018-06-16 00:00:00	16
3338	São José do Egito	2018-06-16 00:00:00	16
3339	São Lourenço da Mata	2018-06-16 00:00:00	16
3340	São Vicente Ferrer	2018-06-16 00:00:00	16
3341	Serra Talhada	2018-06-16 00:00:00	16
3342	Serrita	2018-06-16 00:00:00	16
3343	Sertânia	2018-06-16 00:00:00	16
3344	Sirinhaém	2018-06-16 00:00:00	16
3345	Solidão	2018-06-16 00:00:00	16
3346	Surubim	2018-06-16 00:00:00	16
3347	Tabira	2018-06-16 00:00:00	16
3348	Tacaimbó	2018-06-16 00:00:00	16
3349	Tacaratu	2018-06-16 00:00:00	16
3350	Tamandaré	2018-06-16 00:00:00	16
3351	Taquaritinga do Norte	2018-06-16 00:00:00	16
3352	Terezinha	2018-06-16 00:00:00	16
3353	Terra Nova	2018-06-16 00:00:00	16
3354	Timbaúba	2018-06-16 00:00:00	16
3355	Toritama	2018-06-16 00:00:00	16
3356	Tracunhaém	2018-06-16 00:00:00	16
3357	Trindade	2018-06-16 00:00:00	16
3358	Triunfo	2018-06-16 00:00:00	16
3359	Tupanatinga	2018-06-16 00:00:00	16
3360	Tuparetama	2018-06-16 00:00:00	16
3361	Venturosa	2018-06-16 00:00:00	16
3362	Verdejante	2018-06-16 00:00:00	16
3363	Vertente do Lério	2018-06-16 00:00:00	16
3364	Vertentes	2018-06-16 00:00:00	16
3365	Vicência	2018-06-16 00:00:00	16
3366	Vitória de Santo Antão	2018-06-16 00:00:00	16
3367	Xexéu	2018-06-16 00:00:00	16
3368	Acauã	2018-06-16 00:00:00	17
3369	Agricolândia	2018-06-16 00:00:00	17
3370	Água Branca	2018-06-16 00:00:00	17
3371	Alagoinha do Piauí	2018-06-16 00:00:00	17
3372	Alegrete do Piauí	2018-06-16 00:00:00	17
3373	Alto Longá	2018-06-16 00:00:00	17
3374	Altos	2018-06-16 00:00:00	17
3375	Alvorada do Gurguéia	2018-06-16 00:00:00	17
3376	Amarante	2018-06-16 00:00:00	17
3377	Angical do Piauí	2018-06-16 00:00:00	17
3378	Anísio de Abreu	2018-06-16 00:00:00	17
3379	Antônio Almeida	2018-06-16 00:00:00	17
3380	Aroazes	2018-06-16 00:00:00	17
3381	Aroeiras do Itaim	2018-06-16 00:00:00	17
3382	Arraial	2018-06-16 00:00:00	17
3383	Assunção do Piauí	2018-06-16 00:00:00	17
3384	Avelino Lopes	2018-06-16 00:00:00	17
3385	Baixa Grande do Ribeiro	2018-06-16 00:00:00	17
3386	Barra d`Alcântara	2018-06-16 00:00:00	17
3387	Barras	2018-06-16 00:00:00	17
3388	Barreiras do Piauí	2018-06-16 00:00:00	17
3389	Barro Duro	2018-06-16 00:00:00	17
3390	Batalha	2018-06-16 00:00:00	17
3391	Bela Vista do Piauí	2018-06-16 00:00:00	17
3392	Belém do Piauí	2018-06-16 00:00:00	17
3393	Beneditinos	2018-06-16 00:00:00	17
3394	Bertolínia	2018-06-16 00:00:00	17
3395	Betânia do Piauí	2018-06-16 00:00:00	17
3396	Boa Hora	2018-06-16 00:00:00	17
3397	Bocaina	2018-06-16 00:00:00	17
3398	Bom Jesus	2018-06-16 00:00:00	17
3399	Bom Princípio do Piauí	2018-06-16 00:00:00	17
3400	Bonfim do Piauí	2018-06-16 00:00:00	17
3401	Boqueirão do Piauí	2018-06-16 00:00:00	17
3402	Brasileira	2018-06-16 00:00:00	17
3403	Brejo do Piauí	2018-06-16 00:00:00	17
3404	Buriti dos Lopes	2018-06-16 00:00:00	17
3405	Buriti dos Montes	2018-06-16 00:00:00	17
3406	Cabeceiras do Piauí	2018-06-16 00:00:00	17
3407	Cajazeiras do Piauí	2018-06-16 00:00:00	17
3408	Cajueiro da Praia	2018-06-16 00:00:00	17
3409	Caldeirão Grande do Piauí	2018-06-16 00:00:00	17
3410	Campinas do Piauí	2018-06-16 00:00:00	17
3411	Campo Alegre do Fidalgo	2018-06-16 00:00:00	17
3412	Campo Grande do Piauí	2018-06-16 00:00:00	17
3413	Campo Largo do Piauí	2018-06-16 00:00:00	17
3414	Campo Maior	2018-06-16 00:00:00	17
3415	Canavieira	2018-06-16 00:00:00	17
3416	Canto do Buriti	2018-06-16 00:00:00	17
3417	Capitão de Campos	2018-06-16 00:00:00	17
3418	Capitão Gervásio Oliveira	2018-06-16 00:00:00	17
3419	Caracol	2018-06-16 00:00:00	17
3420	Caraúbas do Piauí	2018-06-16 00:00:00	17
3421	Caridade do Piauí	2018-06-16 00:00:00	17
3422	Castelo do Piauí	2018-06-16 00:00:00	17
3423	Caxingó	2018-06-16 00:00:00	17
3424	Cocal	2018-06-16 00:00:00	17
3425	Cocal de Telha	2018-06-16 00:00:00	17
3426	Cocal dos Alves	2018-06-16 00:00:00	17
3427	Coivaras	2018-06-16 00:00:00	17
3428	Colônia do Gurguéia	2018-06-16 00:00:00	17
3429	Colônia do Piauí	2018-06-16 00:00:00	17
3430	Conceição do Canindé	2018-06-16 00:00:00	17
3431	Coronel José Dias	2018-06-16 00:00:00	17
3432	Corrente	2018-06-16 00:00:00	17
3433	Cristalândia do Piauí	2018-06-16 00:00:00	17
3434	Cristino Castro	2018-06-16 00:00:00	17
3435	Curimatá	2018-06-16 00:00:00	17
3436	Currais	2018-06-16 00:00:00	17
3437	Curral Novo do Piauí	2018-06-16 00:00:00	17
3438	Curralinhos	2018-06-16 00:00:00	17
3439	Demerval Lobão	2018-06-16 00:00:00	17
3440	Dirceu Arcoverde	2018-06-16 00:00:00	17
3441	Dom Expedito Lopes	2018-06-16 00:00:00	17
3442	Dom Inocêncio	2018-06-16 00:00:00	17
3443	Domingos Mourão	2018-06-16 00:00:00	17
3444	Elesbão Veloso	2018-06-16 00:00:00	17
3445	Eliseu Martins	2018-06-16 00:00:00	17
3446	Esperantina	2018-06-16 00:00:00	17
3447	Fartura do Piauí	2018-06-16 00:00:00	17
3448	Flores do Piauí	2018-06-16 00:00:00	17
3449	Floresta do Piauí	2018-06-16 00:00:00	17
3450	Floriano	2018-06-16 00:00:00	17
3451	Francinópolis	2018-06-16 00:00:00	17
3452	Francisco Ayres	2018-06-16 00:00:00	17
3453	Francisco Macedo	2018-06-16 00:00:00	17
3454	Francisco Santos	2018-06-16 00:00:00	17
3455	Fronteiras	2018-06-16 00:00:00	17
3456	Geminiano	2018-06-16 00:00:00	17
3457	Gilbués	2018-06-16 00:00:00	17
3458	Guadalupe	2018-06-16 00:00:00	17
3459	Guaribas	2018-06-16 00:00:00	17
3460	Hugo Napoleão	2018-06-16 00:00:00	17
3461	Ilha Grande	2018-06-16 00:00:00	17
3462	Inhuma	2018-06-16 00:00:00	17
3463	Ipiranga do Piauí	2018-06-16 00:00:00	17
3464	Isaías Coelho	2018-06-16 00:00:00	17
3465	Itainópolis	2018-06-16 00:00:00	17
3466	Itaueira	2018-06-16 00:00:00	17
3467	Jacobina do Piauí	2018-06-16 00:00:00	17
3468	Jaicós	2018-06-16 00:00:00	17
3469	Jardim do Mulato	2018-06-16 00:00:00	17
3470	Jatobá do Piauí	2018-06-16 00:00:00	17
3471	Jerumenha	2018-06-16 00:00:00	17
3472	João Costa	2018-06-16 00:00:00	17
3473	Joaquim Pires	2018-06-16 00:00:00	17
3474	Joca Marques	2018-06-16 00:00:00	17
3475	José de Freitas	2018-06-16 00:00:00	17
3476	Juazeiro do Piauí	2018-06-16 00:00:00	17
3477	Júlio Borges	2018-06-16 00:00:00	17
3478	Jurema	2018-06-16 00:00:00	17
3479	Lagoa Alegre	2018-06-16 00:00:00	17
3480	Lagoa de São Francisco	2018-06-16 00:00:00	17
3481	Lagoa do Barro do Piauí	2018-06-16 00:00:00	17
3482	Lagoa do Piauí	2018-06-16 00:00:00	17
3483	Lagoa do Sítio	2018-06-16 00:00:00	17
3484	Lagoinha do Piauí	2018-06-16 00:00:00	17
3485	Landri Sales	2018-06-16 00:00:00	17
3486	Luís Correia	2018-06-16 00:00:00	17
3487	Luzilândia	2018-06-16 00:00:00	17
3488	Madeiro	2018-06-16 00:00:00	17
3489	Manoel Emídio	2018-06-16 00:00:00	17
3490	Marcolândia	2018-06-16 00:00:00	17
3491	Marcos Parente	2018-06-16 00:00:00	17
3492	Massapê do Piauí	2018-06-16 00:00:00	17
3493	Matias Olímpio	2018-06-16 00:00:00	17
3494	Miguel Alves	2018-06-16 00:00:00	17
3495	Miguel Leão	2018-06-16 00:00:00	17
3496	Milton Brandão	2018-06-16 00:00:00	17
3497	Monsenhor Gil	2018-06-16 00:00:00	17
3498	Monsenhor Hipólito	2018-06-16 00:00:00	17
3499	Monte Alegre do Piauí	2018-06-16 00:00:00	17
3500	Morro Cabeça no Tempo	2018-06-16 00:00:00	17
3501	Morro do Chapéu do Piauí	2018-06-16 00:00:00	17
3502	Murici dos Portelas	2018-06-16 00:00:00	17
3503	Nazaré do Piauí	2018-06-16 00:00:00	17
3504	Nossa Senhora de Nazaré	2018-06-16 00:00:00	17
3505	Nossa Senhora dos Remédios	2018-06-16 00:00:00	17
3506	Nova Santa Rita	2018-06-16 00:00:00	17
3507	Novo Oriente do Piauí	2018-06-16 00:00:00	17
3508	Novo Santo Antônio	2018-06-16 00:00:00	17
3509	Oeiras	2018-06-16 00:00:00	17
3510	Olho d`Água do Piauí	2018-06-16 00:00:00	17
3511	Padre Marcos	2018-06-16 00:00:00	17
3512	Paes Landim	2018-06-16 00:00:00	17
3513	Pajeú do Piauí	2018-06-16 00:00:00	17
3514	Palmeira do Piauí	2018-06-16 00:00:00	17
3515	Palmeirais	2018-06-16 00:00:00	17
3516	Paquetá	2018-06-16 00:00:00	17
3517	Parnaguá	2018-06-16 00:00:00	17
3518	Parnaíba	2018-06-16 00:00:00	17
3519	Passagem Franca do Piauí	2018-06-16 00:00:00	17
3520	Patos do Piauí	2018-06-16 00:00:00	17
3521	Pau d`Arco do Piauí	2018-06-16 00:00:00	17
3522	Paulistana	2018-06-16 00:00:00	17
3523	Pavussu	2018-06-16 00:00:00	17
3524	Pedro II	2018-06-16 00:00:00	17
3525	Pedro Laurentino	2018-06-16 00:00:00	17
3526	Picos	2018-06-16 00:00:00	17
3527	Pimenteiras	2018-06-16 00:00:00	17
3528	Pio IX	2018-06-16 00:00:00	17
3529	Piracuruca	2018-06-16 00:00:00	17
3530	Piripiri	2018-06-16 00:00:00	17
3531	Porto	2018-06-16 00:00:00	17
3532	Porto Alegre do Piauí	2018-06-16 00:00:00	17
3533	Prata do Piauí	2018-06-16 00:00:00	17
3534	Queimada Nova	2018-06-16 00:00:00	17
3535	Redenção do Gurguéia	2018-06-16 00:00:00	17
3536	Regeneração	2018-06-16 00:00:00	17
3537	Riacho Frio	2018-06-16 00:00:00	17
3538	Ribeira do Piauí	2018-06-16 00:00:00	17
3539	Ribeiro Gonçalves	2018-06-16 00:00:00	17
3540	Rio Grande do Piauí	2018-06-16 00:00:00	17
3541	Santa Cruz do Piauí	2018-06-16 00:00:00	17
3542	Santa Cruz dos Milagres	2018-06-16 00:00:00	17
3543	Santa Filomena	2018-06-16 00:00:00	17
3544	Santa Luz	2018-06-16 00:00:00	17
3545	Santa Rosa do Piauí	2018-06-16 00:00:00	17
3546	Santana do Piauí	2018-06-16 00:00:00	17
3547	Santo Antônio de Lisboa	2018-06-16 00:00:00	17
3548	Santo Antônio dos Milagres	2018-06-16 00:00:00	17
3549	Santo Inácio do Piauí	2018-06-16 00:00:00	17
3550	São Braz do Piauí	2018-06-16 00:00:00	17
3551	São Félix do Piauí	2018-06-16 00:00:00	17
3552	São Francisco de Assis do Piauí	2018-06-16 00:00:00	17
3553	São Francisco do Piauí	2018-06-16 00:00:00	17
3554	São Gonçalo do Gurguéia	2018-06-16 00:00:00	17
3555	São Gonçalo do Piauí	2018-06-16 00:00:00	17
3556	São João da Canabrava	2018-06-16 00:00:00	17
3557	São João da Fronteira	2018-06-16 00:00:00	17
3558	São João da Serra	2018-06-16 00:00:00	17
3559	São João da Varjota	2018-06-16 00:00:00	17
3560	São João do Arraial	2018-06-16 00:00:00	17
3561	São João do Piauí	2018-06-16 00:00:00	17
3562	São José do Divino	2018-06-16 00:00:00	17
3563	São José do Peixe	2018-06-16 00:00:00	17
3564	São José do Piauí	2018-06-16 00:00:00	17
3565	São Julião	2018-06-16 00:00:00	17
3566	São Lourenço do Piauí	2018-06-16 00:00:00	17
3567	São Luis do Piauí	2018-06-16 00:00:00	17
3568	São Miguel da Baixa Grande	2018-06-16 00:00:00	17
3569	São Miguel do Fidalgo	2018-06-16 00:00:00	17
3570	São Miguel do Tapuio	2018-06-16 00:00:00	17
3571	São Pedro do Piauí	2018-06-16 00:00:00	17
3572	São Raimundo Nonato	2018-06-16 00:00:00	17
3573	Sebastião Barros	2018-06-16 00:00:00	17
3574	Sebastião Leal	2018-06-16 00:00:00	17
3575	Sigefredo Pacheco	2018-06-16 00:00:00	17
3576	Simões	2018-06-16 00:00:00	17
3577	Simplício Mendes	2018-06-16 00:00:00	17
3578	Socorro do Piauí	2018-06-16 00:00:00	17
3579	Sussuapara	2018-06-16 00:00:00	17
3580	Tamboril do Piauí	2018-06-16 00:00:00	17
3581	Tanque do Piauí	2018-06-16 00:00:00	17
3582	Teresina	2018-06-16 00:00:00	17
3583	União	2018-06-16 00:00:00	17
3584	Uruçuí	2018-06-16 00:00:00	17
3585	Valença do Piauí	2018-06-16 00:00:00	17
3586	Várzea Branca	2018-06-16 00:00:00	17
3587	Várzea Grande	2018-06-16 00:00:00	17
3588	Vera Mendes	2018-06-16 00:00:00	17
3589	Vila Nova do Piauí	2018-06-16 00:00:00	17
3590	Wall Ferraz	2018-06-16 00:00:00	17
3591	Angra dos Reis	2018-06-16 00:00:00	19
3592	Aperibé	2018-06-16 00:00:00	19
3593	Araruama	2018-06-16 00:00:00	19
3594	Areal	2018-06-16 00:00:00	19
3595	Armação dos Búzios	2018-06-16 00:00:00	19
3596	Arraial do Cabo	2018-06-16 00:00:00	19
3597	Barra do Piraí	2018-06-16 00:00:00	19
3598	Barra Mansa	2018-06-16 00:00:00	19
3599	Belford Roxo	2018-06-16 00:00:00	19
3600	Bom Jardim	2018-06-16 00:00:00	19
3601	Bom Jesus do Itabapoana	2018-06-16 00:00:00	19
3602	Cabo Frio	2018-06-16 00:00:00	19
3603	Cachoeiras de Macacu	2018-06-16 00:00:00	19
3604	Cambuci	2018-06-16 00:00:00	19
3605	Campos dos Goytacazes	2018-06-16 00:00:00	19
3606	Cantagalo	2018-06-16 00:00:00	19
3607	Carapebus	2018-06-16 00:00:00	19
3608	Cardoso Moreira	2018-06-16 00:00:00	19
3609	Carmo	2018-06-16 00:00:00	19
3610	Casimiro de Abreu	2018-06-16 00:00:00	19
3611	Comendador Levy Gasparian	2018-06-16 00:00:00	19
3612	Conceição de Macabu	2018-06-16 00:00:00	19
3613	Cordeiro	2018-06-16 00:00:00	19
3614	Duas Barras	2018-06-16 00:00:00	19
3615	Duque de Caxias	2018-06-16 00:00:00	19
3616	Engenheiro Paulo de Frontin	2018-06-16 00:00:00	19
3617	Guapimirim	2018-06-16 00:00:00	19
3618	Iguaba Grande	2018-06-16 00:00:00	19
3619	Itaboraí	2018-06-16 00:00:00	19
3620	Itaguaí	2018-06-16 00:00:00	19
3621	Italva	2018-06-16 00:00:00	19
3622	Itaocara	2018-06-16 00:00:00	19
3623	Itaperuna	2018-06-16 00:00:00	19
3624	Itatiaia	2018-06-16 00:00:00	19
3625	Japeri	2018-06-16 00:00:00	19
3626	Laje do Muriaé	2018-06-16 00:00:00	19
3627	Macaé	2018-06-16 00:00:00	19
3628	Macuco	2018-06-16 00:00:00	19
3629	Magé	2018-06-16 00:00:00	19
3630	Mangaratiba	2018-06-16 00:00:00	19
3631	Maricá	2018-06-16 00:00:00	19
3632	Mendes	2018-06-16 00:00:00	19
3633	Mesquita	2018-06-16 00:00:00	19
3634	Miguel Pereira	2018-06-16 00:00:00	19
3635	Miracema	2018-06-16 00:00:00	19
3636	Natividade	2018-06-16 00:00:00	19
3637	Nilópolis	2018-06-16 00:00:00	19
3638	Niterói	2018-06-16 00:00:00	19
3639	Nova Friburgo	2018-06-16 00:00:00	19
3640	Nova Iguaçu	2018-06-16 00:00:00	19
3641	Paracambi	2018-06-16 00:00:00	19
3642	Paraíba do Sul	2018-06-16 00:00:00	19
3643	Parati	2018-06-16 00:00:00	19
3644	Paty do Alferes	2018-06-16 00:00:00	19
3645	Petrópolis	2018-06-16 00:00:00	19
3646	Pinheiral	2018-06-16 00:00:00	19
3647	Piraí	2018-06-16 00:00:00	19
3648	Porciúncula	2018-06-16 00:00:00	19
3649	Porto Real	2018-06-16 00:00:00	19
3650	Quatis	2018-06-16 00:00:00	19
3651	Queimados	2018-06-16 00:00:00	19
3652	Quissamã	2018-06-16 00:00:00	19
3653	Resende	2018-06-16 00:00:00	19
3654	Rio Bonito	2018-06-16 00:00:00	19
3655	Rio Claro	2018-06-16 00:00:00	19
3656	Rio das Flores	2018-06-16 00:00:00	19
3657	Rio das Ostras	2018-06-16 00:00:00	19
3658	Rio de Janeiro	2018-06-16 00:00:00	19
3659	Santa Maria Madalena	2018-06-16 00:00:00	19
3660	Santo Antônio de Pádua	2018-06-16 00:00:00	19
3661	São Fidélis	2018-06-16 00:00:00	19
3662	São Francisco de Itabapoana	2018-06-16 00:00:00	19
3663	São Gonçalo	2018-06-16 00:00:00	19
3664	São João da Barra	2018-06-16 00:00:00	19
3665	São João de Meriti	2018-06-16 00:00:00	19
3666	São José de Ubá	2018-06-16 00:00:00	19
3667	São José do Vale do Rio Preto	2018-06-16 00:00:00	19
3668	São Pedro da Aldeia	2018-06-16 00:00:00	19
3669	São Sebastião do Alto	2018-06-16 00:00:00	19
3670	Sapucaia	2018-06-16 00:00:00	19
3671	Saquarema	2018-06-16 00:00:00	19
3672	Seropédica	2018-06-16 00:00:00	19
3673	Silva Jardim	2018-06-16 00:00:00	19
3674	Sumidouro	2018-06-16 00:00:00	19
3675	Tanguá	2018-06-16 00:00:00	19
3676	Teresópolis	2018-06-16 00:00:00	19
3677	Trajano de Morais	2018-06-16 00:00:00	19
3678	Três Rios	2018-06-16 00:00:00	19
3679	Valença	2018-06-16 00:00:00	19
3680	Varre-Sai	2018-06-16 00:00:00	19
3681	Vassouras	2018-06-16 00:00:00	19
3682	Volta Redonda	2018-06-16 00:00:00	19
3683	Acari	2018-06-16 00:00:00	20
3684	Açu	2018-06-16 00:00:00	20
3685	Afonso Bezerra	2018-06-16 00:00:00	20
3686	Água Nova	2018-06-16 00:00:00	20
3687	Alexandria	2018-06-16 00:00:00	20
3688	Almino Afonso	2018-06-16 00:00:00	20
3689	Alto do Rodrigues	2018-06-16 00:00:00	20
3690	Jardim de Angicos	2018-06-16 00:00:00	20
3691	Antônio Martins	2018-06-16 00:00:00	20
3692	Apodi	2018-06-16 00:00:00	20
3693	Areia Branca	2018-06-16 00:00:00	20
3694	Arês	2018-06-16 00:00:00	20
3695	Augusto Severo	2018-06-16 00:00:00	20
3696	Baía Formosa	2018-06-16 00:00:00	20
3697	Baraúna	2018-06-16 00:00:00	20
3698	Barcelona	2018-06-16 00:00:00	20
3699	Bento Fernandes	2018-06-16 00:00:00	20
3700	Bodó	2018-06-16 00:00:00	20
3701	Bom Jesus	2018-06-16 00:00:00	20
3702	Brejinho	2018-06-16 00:00:00	20
3703	Caiçara do Norte	2018-06-16 00:00:00	20
3704	Caiçara do Rio do Vento	2018-06-16 00:00:00	20
3705	Caicó	2018-06-16 00:00:00	20
3706	Campo Redondo	2018-06-16 00:00:00	20
3707	Canguaretama	2018-06-16 00:00:00	20
3708	Caraúbas	2018-06-16 00:00:00	20
3709	Carnaúba dos Dantas	2018-06-16 00:00:00	20
3710	Carnaubais	2018-06-16 00:00:00	20
3711	Ceará-Mirim	2018-06-16 00:00:00	20
3712	Cerro Corá	2018-06-16 00:00:00	20
3713	Coronel Ezequiel	2018-06-16 00:00:00	20
3714	Coronel João Pessoa	2018-06-16 00:00:00	20
3715	Cruzeta	2018-06-16 00:00:00	20
3716	Currais Novos	2018-06-16 00:00:00	20
3717	Doutor Severiano	2018-06-16 00:00:00	20
3718	Encanto	2018-06-16 00:00:00	20
3719	Equador	2018-06-16 00:00:00	20
3720	Espírito Santo	2018-06-16 00:00:00	20
3721	Extremoz	2018-06-16 00:00:00	20
3722	Felipe Guerra	2018-06-16 00:00:00	20
3723	Fernando Pedroza	2018-06-16 00:00:00	20
3724	Florânia	2018-06-16 00:00:00	20
3725	Francisco Dantas	2018-06-16 00:00:00	20
3726	Frutuoso Gomes	2018-06-16 00:00:00	20
3727	Galinhos	2018-06-16 00:00:00	20
3728	Goianinha	2018-06-16 00:00:00	20
3729	Governador Dix-Sept Rosado	2018-06-16 00:00:00	20
3730	Grossos	2018-06-16 00:00:00	20
3731	Guamaré	2018-06-16 00:00:00	20
3732	Ielmo Marinho	2018-06-16 00:00:00	20
3733	Ipanguaçu	2018-06-16 00:00:00	20
3734	Ipueira	2018-06-16 00:00:00	20
3735	Itajá	2018-06-16 00:00:00	20
3736	Itaú	2018-06-16 00:00:00	20
3737	Jaçanã	2018-06-16 00:00:00	20
3738	Jandaíra	2018-06-16 00:00:00	20
3739	Janduís	2018-06-16 00:00:00	20
3740	Januário Cicco	2018-06-16 00:00:00	20
3741	Japi	2018-06-16 00:00:00	20
3743	Jardim de Piranhas	2018-06-16 00:00:00	20
3744	Jardim do Seridó	2018-06-16 00:00:00	20
3745	João Câmara	2018-06-16 00:00:00	20
3746	João Dias	2018-06-16 00:00:00	20
3747	José da Penha	2018-06-16 00:00:00	20
3748	Jucurutu	2018-06-16 00:00:00	20
3749	Jundiá	2018-06-16 00:00:00	20
3750	Lagoa d`Anta	2018-06-16 00:00:00	20
3751	Lagoa de Pedras	2018-06-16 00:00:00	20
3752	Lagoa de Velhos	2018-06-16 00:00:00	20
3753	Lagoa Nova	2018-06-16 00:00:00	20
3754	Lagoa Salgada	2018-06-16 00:00:00	20
3755	Lajes	2018-06-16 00:00:00	20
3756	Lajes Pintadas	2018-06-16 00:00:00	20
3757	Lucrécia	2018-06-16 00:00:00	20
3758	Luís Gomes	2018-06-16 00:00:00	20
3759	Macaíba	2018-06-16 00:00:00	20
3760	Macau	2018-06-16 00:00:00	20
3761	Major Sales	2018-06-16 00:00:00	20
3762	Marcelino Vieira	2018-06-16 00:00:00	20
3763	Martins	2018-06-16 00:00:00	20
3764	Maxaranguape	2018-06-16 00:00:00	20
3765	Messias Targino	2018-06-16 00:00:00	20
3766	Montanhas	2018-06-16 00:00:00	20
3767	Monte Alegre	2018-06-16 00:00:00	20
3768	Monte das Gameleiras	2018-06-16 00:00:00	20
3769	Mossoró	2018-06-16 00:00:00	20
3770	Natal	2018-06-16 00:00:00	20
3771	Nísia Floresta	2018-06-16 00:00:00	20
3772	Nova Cruz	2018-06-16 00:00:00	20
3773	Olho-d`Água do Borges	2018-06-16 00:00:00	20
3774	Ouro Branco	2018-06-16 00:00:00	20
3775	Paraná	2018-06-16 00:00:00	20
3776	Paraú	2018-06-16 00:00:00	20
3777	Parazinho	2018-06-16 00:00:00	20
3778	Parelhas	2018-06-16 00:00:00	20
3779	Parnamirim	2018-06-16 00:00:00	20
3780	Passa e Fica	2018-06-16 00:00:00	20
3781	Passagem	2018-06-16 00:00:00	20
3782	Patu	2018-06-16 00:00:00	20
3783	Pau dos Ferros	2018-06-16 00:00:00	20
3784	Pedra Grande	2018-06-16 00:00:00	20
3785	Pedra Preta	2018-06-16 00:00:00	20
3786	Pedro Avelino	2018-06-16 00:00:00	20
3787	Pedro Velho	2018-06-16 00:00:00	20
3788	Pendências	2018-06-16 00:00:00	20
3789	Pilões	2018-06-16 00:00:00	20
3790	Poço Branco	2018-06-16 00:00:00	20
3791	Portalegre	2018-06-16 00:00:00	20
3792	Porto do Mangue	2018-06-16 00:00:00	20
3793	Presidente Juscelino	2018-06-16 00:00:00	20
3794	Pureza	2018-06-16 00:00:00	20
3795	Rafael Fernandes	2018-06-16 00:00:00	20
3796	Rafael Godeiro	2018-06-16 00:00:00	20
3797	Riacho da Cruz	2018-06-16 00:00:00	20
3798	Riacho de Santana	2018-06-16 00:00:00	20
3799	Riachuelo	2018-06-16 00:00:00	20
3800	Rio do Fogo	2018-06-16 00:00:00	20
3801	Rodolfo Fernandes	2018-06-16 00:00:00	20
3802	Ruy Barbosa	2018-06-16 00:00:00	20
3803	Santa Cruz	2018-06-16 00:00:00	20
3804	Santa Maria	2018-06-16 00:00:00	20
3805	Santana do Matos	2018-06-16 00:00:00	20
3806	Santana do Seridó	2018-06-16 00:00:00	20
3807	Santo Antônio	2018-06-16 00:00:00	20
3808	São Bento do Norte	2018-06-16 00:00:00	20
3809	São Bento do Trairí	2018-06-16 00:00:00	20
3810	São Fernando	2018-06-16 00:00:00	20
3811	São Francisco do Oeste	2018-06-16 00:00:00	20
3812	São Gonçalo do Amarante	2018-06-16 00:00:00	20
3813	São João do Sabugi	2018-06-16 00:00:00	20
3814	São José de Mipibu	2018-06-16 00:00:00	20
3815	São José do Campestre	2018-06-16 00:00:00	20
3816	São José do Seridó	2018-06-16 00:00:00	20
3817	São Miguel	2018-06-16 00:00:00	20
3818	São Miguel do Gostoso	2018-06-16 00:00:00	20
3819	São Paulo do Potengi	2018-06-16 00:00:00	20
3820	São Pedro	2018-06-16 00:00:00	20
3821	São Rafael	2018-06-16 00:00:00	20
3822	São Tomé	2018-06-16 00:00:00	20
3823	São Vicente	2018-06-16 00:00:00	20
3824	Senador Elói de Souza	2018-06-16 00:00:00	20
3825	Senador Georgino Avelino	2018-06-16 00:00:00	20
3826	Serra de São Bento	2018-06-16 00:00:00	20
3827	Serra do Mel	2018-06-16 00:00:00	20
3828	Serra Negra do Norte	2018-06-16 00:00:00	20
3829	Serrinha	2018-06-16 00:00:00	20
3830	Serrinha dos Pintos	2018-06-16 00:00:00	20
3831	Severiano Melo	2018-06-16 00:00:00	20
3832	Sítio Novo	2018-06-16 00:00:00	20
3833	Taboleiro Grande	2018-06-16 00:00:00	20
3834	Taipu	2018-06-16 00:00:00	20
3835	Tangará	2018-06-16 00:00:00	20
3836	Tenente Ananias	2018-06-16 00:00:00	20
3837	Tenente Laurentino Cruz	2018-06-16 00:00:00	20
3838	Tibau	2018-06-16 00:00:00	20
3839	Tibau do Sul	2018-06-16 00:00:00	20
3840	Timbaúba dos Batistas	2018-06-16 00:00:00	20
3841	Touros	2018-06-16 00:00:00	20
3842	Triunfo Potiguar	2018-06-16 00:00:00	20
3843	Umarizal	2018-06-16 00:00:00	20
3844	Upanema	2018-06-16 00:00:00	20
3845	Várzea	2018-06-16 00:00:00	20
3846	Venha-Ver	2018-06-16 00:00:00	20
3847	Vera Cruz	2018-06-16 00:00:00	20
3848	Viçosa	2018-06-16 00:00:00	20
3849	Vila Flor	2018-06-16 00:00:00	20
3850	Aceguá	2018-06-16 00:00:00	23
3851	Água Santa	2018-06-16 00:00:00	23
3852	Agudo	2018-06-16 00:00:00	23
3853	Ajuricaba	2018-06-16 00:00:00	23
3854	Alecrim	2018-06-16 00:00:00	23
3855	Alegrete	2018-06-16 00:00:00	23
3856	Alegria	2018-06-16 00:00:00	23
3857	Almirante Tamandaré do Sul	2018-06-16 00:00:00	23
3858	Alpestre	2018-06-16 00:00:00	23
3859	Alto Alegre	2018-06-16 00:00:00	23
3860	Alto Feliz	2018-06-16 00:00:00	23
3861	Alvorada	2018-06-16 00:00:00	23
3862	Amaral Ferrador	2018-06-16 00:00:00	23
3863	Ametista do Sul	2018-06-16 00:00:00	23
3864	André da Rocha	2018-06-16 00:00:00	23
3865	Anta Gorda	2018-06-16 00:00:00	23
3866	Antônio Prado	2018-06-16 00:00:00	23
3867	Arambaré	2018-06-16 00:00:00	23
3868	Araricá	2018-06-16 00:00:00	23
3869	Aratiba	2018-06-16 00:00:00	23
3870	Arroio do Meio	2018-06-16 00:00:00	23
3871	Arroio do Padre	2018-06-16 00:00:00	23
3872	Arroio do Sal	2018-06-16 00:00:00	23
3873	Arroio do Tigre	2018-06-16 00:00:00	23
3874	Arroio dos Ratos	2018-06-16 00:00:00	23
3875	Arroio Grande	2018-06-16 00:00:00	23
3876	Arvorezinha	2018-06-16 00:00:00	23
3877	Augusto Pestana	2018-06-16 00:00:00	23
3878	Áurea	2018-06-16 00:00:00	23
3879	Bagé	2018-06-16 00:00:00	23
3880	Balneário Pinhal	2018-06-16 00:00:00	23
3881	Barão	2018-06-16 00:00:00	23
3882	Barão de Cotegipe	2018-06-16 00:00:00	23
3883	Barão do Triunfo	2018-06-16 00:00:00	23
3884	Barra do Guarita	2018-06-16 00:00:00	23
3885	Barra do Quaraí	2018-06-16 00:00:00	23
3886	Barra do Ribeiro	2018-06-16 00:00:00	23
3887	Barra do Rio Azul	2018-06-16 00:00:00	23
3888	Barra Funda	2018-06-16 00:00:00	23
3889	Barracão	2018-06-16 00:00:00	23
3890	Barros Cassal	2018-06-16 00:00:00	23
3891	Benjamin Constant do Sul	2018-06-16 00:00:00	23
3892	Bento Gonçalves	2018-06-16 00:00:00	23
3893	Boa Vista das Missões	2018-06-16 00:00:00	23
3894	Boa Vista do Buricá	2018-06-16 00:00:00	23
3895	Boa Vista do Cadeado	2018-06-16 00:00:00	23
3896	Boa Vista do Incra	2018-06-16 00:00:00	23
3897	Boa Vista do Sul	2018-06-16 00:00:00	23
3898	Bom Jesus	2018-06-16 00:00:00	23
3899	Bom Princípio	2018-06-16 00:00:00	23
3900	Bom Progresso	2018-06-16 00:00:00	23
3901	Bom Retiro do Sul	2018-06-16 00:00:00	23
3902	Boqueirão do Leão	2018-06-16 00:00:00	23
3903	Bossoroca	2018-06-16 00:00:00	23
3904	Bozano	2018-06-16 00:00:00	23
3905	Braga	2018-06-16 00:00:00	23
3906	Brochier	2018-06-16 00:00:00	23
3907	Butiá	2018-06-16 00:00:00	23
3908	Caçapava do Sul	2018-06-16 00:00:00	23
3909	Cacequi	2018-06-16 00:00:00	23
3910	Cachoeira do Sul	2018-06-16 00:00:00	23
3911	Cachoeirinha	2018-06-16 00:00:00	23
3912	Cacique Doble	2018-06-16 00:00:00	23
3913	Caibaté	2018-06-16 00:00:00	23
3914	Caiçara	2018-06-16 00:00:00	23
3915	Camaquã	2018-06-16 00:00:00	23
3916	Camargo	2018-06-16 00:00:00	23
3917	Cambará do Sul	2018-06-16 00:00:00	23
3918	Campestre da Serra	2018-06-16 00:00:00	23
3919	Campina das Missões	2018-06-16 00:00:00	23
3920	Campinas do Sul	2018-06-16 00:00:00	23
3921	Campo Bom	2018-06-16 00:00:00	23
3922	Campo Novo	2018-06-16 00:00:00	23
3923	Campos Borges	2018-06-16 00:00:00	23
3924	Candelária	2018-06-16 00:00:00	23
3925	Cândido Godói	2018-06-16 00:00:00	23
3926	Candiota	2018-06-16 00:00:00	23
3927	Canela	2018-06-16 00:00:00	23
3928	Canguçu	2018-06-16 00:00:00	23
3929	Canoas	2018-06-16 00:00:00	23
3930	Canudos do Vale	2018-06-16 00:00:00	23
3931	Capão Bonito do Sul	2018-06-16 00:00:00	23
3932	Capão da Canoa	2018-06-16 00:00:00	23
3933	Capão do Cipó	2018-06-16 00:00:00	23
3934	Capão do Leão	2018-06-16 00:00:00	23
3935	Capela de Santana	2018-06-16 00:00:00	23
3936	Capitão	2018-06-16 00:00:00	23
3937	Capivari do Sul	2018-06-16 00:00:00	23
3938	Caraá	2018-06-16 00:00:00	23
3939	Carazinho	2018-06-16 00:00:00	23
3940	Carlos Barbosa	2018-06-16 00:00:00	23
3941	Carlos Gomes	2018-06-16 00:00:00	23
3942	Casca	2018-06-16 00:00:00	23
3943	Caseiros	2018-06-16 00:00:00	23
3944	Catuípe	2018-06-16 00:00:00	23
3945	Caxias do Sul	2018-06-16 00:00:00	23
3946	Centenário	2018-06-16 00:00:00	23
3947	Cerrito	2018-06-16 00:00:00	23
3948	Cerro Branco	2018-06-16 00:00:00	23
3949	Cerro Grande	2018-06-16 00:00:00	23
3950	Cerro Grande do Sul	2018-06-16 00:00:00	23
3951	Cerro Largo	2018-06-16 00:00:00	23
3952	Chapada	2018-06-16 00:00:00	23
3953	Charqueadas	2018-06-16 00:00:00	23
3954	Charrua	2018-06-16 00:00:00	23
3955	Chiapetta	2018-06-16 00:00:00	23
3956	Chuí	2018-06-16 00:00:00	23
3957	Chuvisca	2018-06-16 00:00:00	23
3958	Cidreira	2018-06-16 00:00:00	23
3959	Ciríaco	2018-06-16 00:00:00	23
3960	Colinas	2018-06-16 00:00:00	23
3961	Colorado	2018-06-16 00:00:00	23
3962	Condor	2018-06-16 00:00:00	23
3963	Constantina	2018-06-16 00:00:00	23
3964	Coqueiro Baixo	2018-06-16 00:00:00	23
3965	Coqueiros do Sul	2018-06-16 00:00:00	23
3966	Coronel Barros	2018-06-16 00:00:00	23
3967	Coronel Bicaco	2018-06-16 00:00:00	23
3968	Coronel Pilar	2018-06-16 00:00:00	23
3969	Cotiporã	2018-06-16 00:00:00	23
3970	Coxilha	2018-06-16 00:00:00	23
3971	Crissiumal	2018-06-16 00:00:00	23
3972	Cristal	2018-06-16 00:00:00	23
3973	Cristal do Sul	2018-06-16 00:00:00	23
3974	Cruz Alta	2018-06-16 00:00:00	23
3975	Cruzaltense	2018-06-16 00:00:00	23
3976	Cruzeiro do Sul	2018-06-16 00:00:00	23
3977	David Canabarro	2018-06-16 00:00:00	23
3978	Derrubadas	2018-06-16 00:00:00	23
3979	Dezesseis de Novembro	2018-06-16 00:00:00	23
3980	Dilermando de Aguiar	2018-06-16 00:00:00	23
3981	Dois Irmãos	2018-06-16 00:00:00	23
3982	Dois Irmãos das Missões	2018-06-16 00:00:00	23
3983	Dois Lajeados	2018-06-16 00:00:00	23
3984	Dom Feliciano	2018-06-16 00:00:00	23
3985	Dom Pedrito	2018-06-16 00:00:00	23
3986	Dom Pedro de Alcântara	2018-06-16 00:00:00	23
3987	Dona Francisca	2018-06-16 00:00:00	23
3988	Doutor Maurício Cardoso	2018-06-16 00:00:00	23
3989	Doutor Ricardo	2018-06-16 00:00:00	23
3990	Eldorado do Sul	2018-06-16 00:00:00	23
3991	Encantado	2018-06-16 00:00:00	23
3992	Encruzilhada do Sul	2018-06-16 00:00:00	23
3993	Engenho Velho	2018-06-16 00:00:00	23
3994	Entre Rios do Sul	2018-06-16 00:00:00	23
3995	Entre-Ijuís	2018-06-16 00:00:00	23
3996	Erebango	2018-06-16 00:00:00	23
3997	Erechim	2018-06-16 00:00:00	23
3998	Ernestina	2018-06-16 00:00:00	23
3999	Erval Grande	2018-06-16 00:00:00	23
4000	Erval Seco	2018-06-16 00:00:00	23
4001	Esmeralda	2018-06-16 00:00:00	23
4002	Esperança do Sul	2018-06-16 00:00:00	23
4003	Espumoso	2018-06-16 00:00:00	23
4004	Estação	2018-06-16 00:00:00	23
4005	Estância Velha	2018-06-16 00:00:00	23
4006	Esteio	2018-06-16 00:00:00	23
4007	Estrela	2018-06-16 00:00:00	23
4008	Estrela Velha	2018-06-16 00:00:00	23
4009	Eugênio de Castro	2018-06-16 00:00:00	23
4010	Fagundes Varela	2018-06-16 00:00:00	23
4011	Farroupilha	2018-06-16 00:00:00	23
4012	Faxinal do Soturno	2018-06-16 00:00:00	23
4013	Faxinalzinho	2018-06-16 00:00:00	23
4014	Fazenda Vilanova	2018-06-16 00:00:00	23
4015	Feliz	2018-06-16 00:00:00	23
4016	Flores da Cunha	2018-06-16 00:00:00	23
4017	Floriano Peixoto	2018-06-16 00:00:00	23
4018	Fontoura Xavier	2018-06-16 00:00:00	23
4019	Formigueiro	2018-06-16 00:00:00	23
4020	Forquetinha	2018-06-16 00:00:00	23
4021	Fortaleza dos Valos	2018-06-16 00:00:00	23
4022	Frederico Westphalen	2018-06-16 00:00:00	23
4023	Garibaldi	2018-06-16 00:00:00	23
4024	Garruchos	2018-06-16 00:00:00	23
4025	Gaurama	2018-06-16 00:00:00	23
4026	General Câmara	2018-06-16 00:00:00	23
4027	Gentil	2018-06-16 00:00:00	23
4028	Getúlio Vargas	2018-06-16 00:00:00	23
4029	Giruá	2018-06-16 00:00:00	23
4030	Glorinha	2018-06-16 00:00:00	23
4031	Gramado	2018-06-16 00:00:00	23
4032	Gramado dos Loureiros	2018-06-16 00:00:00	23
4033	Gramado Xavier	2018-06-16 00:00:00	23
4034	Gravataí	2018-06-16 00:00:00	23
4035	Guabiju	2018-06-16 00:00:00	23
4036	Guaíba	2018-06-16 00:00:00	23
4037	Guaporé	2018-06-16 00:00:00	23
4038	Guarani das Missões	2018-06-16 00:00:00	23
4039	Harmonia	2018-06-16 00:00:00	23
4040	Herval	2018-06-16 00:00:00	23
4041	Herveiras	2018-06-16 00:00:00	23
4042	Horizontina	2018-06-16 00:00:00	23
4043	Hulha Negra	2018-06-16 00:00:00	23
4044	Humaitá	2018-06-16 00:00:00	23
4045	Ibarama	2018-06-16 00:00:00	23
4046	Ibiaçá	2018-06-16 00:00:00	23
4047	Ibiraiaras	2018-06-16 00:00:00	23
4048	Ibirapuitã	2018-06-16 00:00:00	23
4049	Ibirubá	2018-06-16 00:00:00	23
4050	Igrejinha	2018-06-16 00:00:00	23
4051	Ijuí	2018-06-16 00:00:00	23
4052	Ilópolis	2018-06-16 00:00:00	23
4053	Imbé	2018-06-16 00:00:00	23
4054	Imigrante	2018-06-16 00:00:00	23
4055	Independência	2018-06-16 00:00:00	23
4056	Inhacorá	2018-06-16 00:00:00	23
4057	Ipê	2018-06-16 00:00:00	23
4058	Ipiranga do Sul	2018-06-16 00:00:00	23
4059	Iraí	2018-06-16 00:00:00	23
4060	Itaara	2018-06-16 00:00:00	23
4061	Itacurubi	2018-06-16 00:00:00	23
4062	Itapuca	2018-06-16 00:00:00	23
4063	Itaqui	2018-06-16 00:00:00	23
4064	Itati	2018-06-16 00:00:00	23
4065	Itatiba do Sul	2018-06-16 00:00:00	23
4066	Ivorá	2018-06-16 00:00:00	23
4067	Ivoti	2018-06-16 00:00:00	23
4068	Jaboticaba	2018-06-16 00:00:00	23
4069	Jacuizinho	2018-06-16 00:00:00	23
4070	Jacutinga	2018-06-16 00:00:00	23
4071	Jaguarão	2018-06-16 00:00:00	23
4072	Jaguari	2018-06-16 00:00:00	23
4073	Jaquirana	2018-06-16 00:00:00	23
4074	Jari	2018-06-16 00:00:00	23
4075	Jóia	2018-06-16 00:00:00	23
4076	Júlio de Castilhos	2018-06-16 00:00:00	23
4077	Lagoa Bonita do Sul	2018-06-16 00:00:00	23
4078	Lagoa dos Três Cantos	2018-06-16 00:00:00	23
4079	Lagoa Vermelha	2018-06-16 00:00:00	23
4080	Lagoão	2018-06-16 00:00:00	23
4081	Lajeado	2018-06-16 00:00:00	23
4082	Lajeado do Bugre	2018-06-16 00:00:00	23
4083	Lavras do Sul	2018-06-16 00:00:00	23
4084	Liberato Salzano	2018-06-16 00:00:00	23
4085	Lindolfo Collor	2018-06-16 00:00:00	23
4086	Linha Nova	2018-06-16 00:00:00	23
4087	Maçambara	2018-06-16 00:00:00	23
4088	Machadinho	2018-06-16 00:00:00	23
4089	Mampituba	2018-06-16 00:00:00	23
4090	Manoel Viana	2018-06-16 00:00:00	23
4091	Maquiné	2018-06-16 00:00:00	23
4092	Maratá	2018-06-16 00:00:00	23
4093	Marau	2018-06-16 00:00:00	23
4094	Marcelino Ramos	2018-06-16 00:00:00	23
4095	Mariana Pimentel	2018-06-16 00:00:00	23
4096	Mariano Moro	2018-06-16 00:00:00	23
4097	Marques de Souza	2018-06-16 00:00:00	23
4098	Mata	2018-06-16 00:00:00	23
4099	Mato Castelhano	2018-06-16 00:00:00	23
4100	Mato Leitão	2018-06-16 00:00:00	23
4101	Mato Queimado	2018-06-16 00:00:00	23
4102	Maximiliano de Almeida	2018-06-16 00:00:00	23
4103	Minas do Leão	2018-06-16 00:00:00	23
4104	Miraguaí	2018-06-16 00:00:00	23
4105	Montauri	2018-06-16 00:00:00	23
4106	Monte Alegre dos Campos	2018-06-16 00:00:00	23
4107	Monte Belo do Sul	2018-06-16 00:00:00	23
4108	Montenegro	2018-06-16 00:00:00	23
4109	Mormaço	2018-06-16 00:00:00	23
4110	Morrinhos do Sul	2018-06-16 00:00:00	23
4111	Morro Redondo	2018-06-16 00:00:00	23
4112	Morro Reuter	2018-06-16 00:00:00	23
4113	Mostardas	2018-06-16 00:00:00	23
4114	Muçum	2018-06-16 00:00:00	23
4115	Muitos Capões	2018-06-16 00:00:00	23
4116	Muliterno	2018-06-16 00:00:00	23
4117	Não-Me-Toque	2018-06-16 00:00:00	23
4118	Nicolau Vergueiro	2018-06-16 00:00:00	23
4119	Nonoai	2018-06-16 00:00:00	23
4120	Nova Alvorada	2018-06-16 00:00:00	23
4121	Nova Araçá	2018-06-16 00:00:00	23
4122	Nova Bassano	2018-06-16 00:00:00	23
4123	Nova Boa Vista	2018-06-16 00:00:00	23
4124	Nova Bréscia	2018-06-16 00:00:00	23
4125	Nova Candelária	2018-06-16 00:00:00	23
4126	Nova Esperança do Sul	2018-06-16 00:00:00	23
4127	Nova Hartz	2018-06-16 00:00:00	23
4128	Nova Pádua	2018-06-16 00:00:00	23
4129	Nova Palma	2018-06-16 00:00:00	23
4130	Nova Petrópolis	2018-06-16 00:00:00	23
4131	Nova Prata	2018-06-16 00:00:00	23
4132	Nova Ramada	2018-06-16 00:00:00	23
4133	Nova Roma do Sul	2018-06-16 00:00:00	23
4134	Nova Santa Rita	2018-06-16 00:00:00	23
4135	Novo Barreiro	2018-06-16 00:00:00	23
4136	Novo Cabrais	2018-06-16 00:00:00	23
4137	Novo Hamburgo	2018-06-16 00:00:00	23
4138	Novo Machado	2018-06-16 00:00:00	23
4139	Novo Tiradentes	2018-06-16 00:00:00	23
4140	Novo Xingu	2018-06-16 00:00:00	23
4141	Osório	2018-06-16 00:00:00	23
4142	Paim Filho	2018-06-16 00:00:00	23
4143	Palmares do Sul	2018-06-16 00:00:00	23
4144	Palmeira das Missões	2018-06-16 00:00:00	23
4145	Palmitinho	2018-06-16 00:00:00	23
4146	Panambi	2018-06-16 00:00:00	23
4147	Pantano Grande	2018-06-16 00:00:00	23
4148	Paraí	2018-06-16 00:00:00	23
4149	Paraíso do Sul	2018-06-16 00:00:00	23
4150	Pareci Novo	2018-06-16 00:00:00	23
4151	Parobé	2018-06-16 00:00:00	23
4152	Passa Sete	2018-06-16 00:00:00	23
4153	Passo do Sobrado	2018-06-16 00:00:00	23
4154	Passo Fundo	2018-06-16 00:00:00	23
4155	Paulo Bento	2018-06-16 00:00:00	23
4156	Paverama	2018-06-16 00:00:00	23
4157	Pedras Altas	2018-06-16 00:00:00	23
4158	Pedro Osório	2018-06-16 00:00:00	23
4159	Pejuçara	2018-06-16 00:00:00	23
4160	Pelotas	2018-06-16 00:00:00	23
4161	Picada Café	2018-06-16 00:00:00	23
4162	Pinhal	2018-06-16 00:00:00	23
4163	Pinhal da Serra	2018-06-16 00:00:00	23
4164	Pinhal Grande	2018-06-16 00:00:00	23
4165	Pinheirinho do Vale	2018-06-16 00:00:00	23
4166	Pinheiro Machado	2018-06-16 00:00:00	23
4167	Pirapó	2018-06-16 00:00:00	23
4168	Piratini	2018-06-16 00:00:00	23
4169	Planalto	2018-06-16 00:00:00	23
4170	Poço das Antas	2018-06-16 00:00:00	23
4171	Pontão	2018-06-16 00:00:00	23
4172	Ponte Preta	2018-06-16 00:00:00	23
4173	Portão	2018-06-16 00:00:00	23
4174	Porto Alegre	2018-06-16 00:00:00	23
4175	Porto Lucena	2018-06-16 00:00:00	23
4176	Porto Mauá	2018-06-16 00:00:00	23
4177	Porto Vera Cruz	2018-06-16 00:00:00	23
4178	Porto Xavier	2018-06-16 00:00:00	23
4179	Pouso Novo	2018-06-16 00:00:00	23
4180	Presidente Lucena	2018-06-16 00:00:00	23
4181	Progresso	2018-06-16 00:00:00	23
4182	Protásio Alves	2018-06-16 00:00:00	23
4183	Putinga	2018-06-16 00:00:00	23
4184	Quaraí	2018-06-16 00:00:00	23
4185	Quatro Irmãos	2018-06-16 00:00:00	23
4186	Quevedos	2018-06-16 00:00:00	23
4187	Quinze de Novembro	2018-06-16 00:00:00	23
4188	Redentora	2018-06-16 00:00:00	23
4189	Relvado	2018-06-16 00:00:00	23
4190	Restinga Seca	2018-06-16 00:00:00	23
4191	Rio dos Índios	2018-06-16 00:00:00	23
4192	Rio Grande	2018-06-16 00:00:00	23
4193	Rio Pardo	2018-06-16 00:00:00	23
4194	Riozinho	2018-06-16 00:00:00	23
4195	Roca Sales	2018-06-16 00:00:00	23
4196	Rodeio Bonito	2018-06-16 00:00:00	23
4197	Rolador	2018-06-16 00:00:00	23
4198	Rolante	2018-06-16 00:00:00	23
4199	Ronda Alta	2018-06-16 00:00:00	23
4200	Rondinha	2018-06-16 00:00:00	23
4201	Roque Gonzales	2018-06-16 00:00:00	23
4202	Rosário do Sul	2018-06-16 00:00:00	23
4203	Sagrada Família	2018-06-16 00:00:00	23
4204	Saldanha Marinho	2018-06-16 00:00:00	23
4205	Salto do Jacuí	2018-06-16 00:00:00	23
4206	Salvador das Missões	2018-06-16 00:00:00	23
4207	Salvador do Sul	2018-06-16 00:00:00	23
4208	Sananduva	2018-06-16 00:00:00	23
4209	Santa Bárbara do Sul	2018-06-16 00:00:00	23
4210	Santa Cecília do Sul	2018-06-16 00:00:00	23
4211	Santa Clara do Sul	2018-06-16 00:00:00	23
4212	Santa Cruz do Sul	2018-06-16 00:00:00	23
4213	Santa Margarida do Sul	2018-06-16 00:00:00	23
4214	Santa Maria	2018-06-16 00:00:00	23
4215	Santa Maria do Herval	2018-06-16 00:00:00	23
4216	Santa Rosa	2018-06-16 00:00:00	23
4217	Santa Tereza	2018-06-16 00:00:00	23
4218	Santa Vitória do Palmar	2018-06-16 00:00:00	23
4219	Santana da Boa Vista	2018-06-16 00:00:00	23
4220	Santana do Livramento	2018-06-16 00:00:00	23
4221	Santiago	2018-06-16 00:00:00	23
4222	Santo Ângelo	2018-06-16 00:00:00	23
4223	Santo Antônio da Patrulha	2018-06-16 00:00:00	23
4224	Santo Antônio das Missões	2018-06-16 00:00:00	23
4225	Santo Antônio do Palma	2018-06-16 00:00:00	23
4226	Santo Antônio do Planalto	2018-06-16 00:00:00	23
4227	Santo Augusto	2018-06-16 00:00:00	23
4228	Santo Cristo	2018-06-16 00:00:00	23
4229	Santo Expedito do Sul	2018-06-16 00:00:00	23
4230	São Borja	2018-06-16 00:00:00	23
4231	São Domingos do Sul	2018-06-16 00:00:00	23
4232	São Francisco de Assis	2018-06-16 00:00:00	23
4233	São Francisco de Paula	2018-06-16 00:00:00	23
4234	São Gabriel	2018-06-16 00:00:00	23
4235	São Jerônimo	2018-06-16 00:00:00	23
4236	São João da Urtiga	2018-06-16 00:00:00	23
4237	São João do Polêsine	2018-06-16 00:00:00	23
4238	São Jorge	2018-06-16 00:00:00	23
4239	São José das Missões	2018-06-16 00:00:00	23
4240	São José do Herval	2018-06-16 00:00:00	23
4241	São José do Hortêncio	2018-06-16 00:00:00	23
4242	São José do Inhacorá	2018-06-16 00:00:00	23
4243	São José do Norte	2018-06-16 00:00:00	23
4244	São José do Ouro	2018-06-16 00:00:00	23
4245	São José do Sul	2018-06-16 00:00:00	23
4246	São José dos Ausentes	2018-06-16 00:00:00	23
4247	São Leopoldo	2018-06-16 00:00:00	23
4248	São Lourenço do Sul	2018-06-16 00:00:00	23
4249	São Luiz Gonzaga	2018-06-16 00:00:00	23
4250	São Marcos	2018-06-16 00:00:00	23
4251	São Martinho	2018-06-16 00:00:00	23
4252	São Martinho da Serra	2018-06-16 00:00:00	23
4253	São Miguel das Missões	2018-06-16 00:00:00	23
4254	São Nicolau	2018-06-16 00:00:00	23
4255	São Paulo das Missões	2018-06-16 00:00:00	23
4256	São Pedro da Serra	2018-06-16 00:00:00	23
4257	São Pedro das Missões	2018-06-16 00:00:00	23
4258	São Pedro do Butiá	2018-06-16 00:00:00	23
4259	São Pedro do Sul	2018-06-16 00:00:00	23
4260	São Sebastião do Caí	2018-06-16 00:00:00	23
4261	São Sepé	2018-06-16 00:00:00	23
4262	São Valentim	2018-06-16 00:00:00	23
4263	São Valentim do Sul	2018-06-16 00:00:00	23
4264	São Valério do Sul	2018-06-16 00:00:00	23
4265	São Vendelino	2018-06-16 00:00:00	23
4266	São Vicente do Sul	2018-06-16 00:00:00	23
4267	Sapiranga	2018-06-16 00:00:00	23
4268	Sapucaia do Sul	2018-06-16 00:00:00	23
4269	Sarandi	2018-06-16 00:00:00	23
4270	Seberi	2018-06-16 00:00:00	23
4271	Sede Nova	2018-06-16 00:00:00	23
4272	Segredo	2018-06-16 00:00:00	23
4273	Selbach	2018-06-16 00:00:00	23
4274	Senador Salgado Filho	2018-06-16 00:00:00	23
4275	Sentinela do Sul	2018-06-16 00:00:00	23
4276	Serafina Corrêa	2018-06-16 00:00:00	23
4277	Sério	2018-06-16 00:00:00	23
4278	Sertão	2018-06-16 00:00:00	23
4279	Sertão Santana	2018-06-16 00:00:00	23
4280	Sete de Setembro	2018-06-16 00:00:00	23
4281	Severiano de Almeida	2018-06-16 00:00:00	23
4282	Silveira Martins	2018-06-16 00:00:00	23
4283	Sinimbu	2018-06-16 00:00:00	23
4284	Sobradinho	2018-06-16 00:00:00	23
4285	Soledade	2018-06-16 00:00:00	23
4286	Tabaí	2018-06-16 00:00:00	23
4287	Tapejara	2018-06-16 00:00:00	23
4288	Tapera	2018-06-16 00:00:00	23
4289	Tapes	2018-06-16 00:00:00	23
4290	Taquara	2018-06-16 00:00:00	23
4291	Taquari	2018-06-16 00:00:00	23
4292	Taquaruçu do Sul	2018-06-16 00:00:00	23
4293	Tavares	2018-06-16 00:00:00	23
4294	Tenente Portela	2018-06-16 00:00:00	23
4295	Terra de Areia	2018-06-16 00:00:00	23
4296	Teutônia	2018-06-16 00:00:00	23
4297	Tio Hugo	2018-06-16 00:00:00	23
4298	Tiradentes do Sul	2018-06-16 00:00:00	23
4299	Toropi	2018-06-16 00:00:00	23
4300	Torres	2018-06-16 00:00:00	23
4301	Tramandaí	2018-06-16 00:00:00	23
4302	Travesseiro	2018-06-16 00:00:00	23
4303	Três Arroios	2018-06-16 00:00:00	23
4304	Três Cachoeiras	2018-06-16 00:00:00	23
4305	Três Coroas	2018-06-16 00:00:00	23
4306	Três de Maio	2018-06-16 00:00:00	23
4307	Três Forquilhas	2018-06-16 00:00:00	23
4308	Três Palmeiras	2018-06-16 00:00:00	23
4309	Três Passos	2018-06-16 00:00:00	23
4310	Trindade do Sul	2018-06-16 00:00:00	23
4311	Triunfo	2018-06-16 00:00:00	23
4312	Tucunduva	2018-06-16 00:00:00	23
4313	Tunas	2018-06-16 00:00:00	23
4314	Tupanci do Sul	2018-06-16 00:00:00	23
4315	Tupanciretã	2018-06-16 00:00:00	23
4316	Tupandi	2018-06-16 00:00:00	23
4317	Tuparendi	2018-06-16 00:00:00	23
4318	Turuçu	2018-06-16 00:00:00	23
4319	Ubiretama	2018-06-16 00:00:00	23
4320	União da Serra	2018-06-16 00:00:00	23
4321	Unistalda	2018-06-16 00:00:00	23
4322	Uruguaiana	2018-06-16 00:00:00	23
4323	Vacaria	2018-06-16 00:00:00	23
4324	Vale do Sol	2018-06-16 00:00:00	23
4325	Vale Real	2018-06-16 00:00:00	23
4326	Vale Verde	2018-06-16 00:00:00	23
4327	Vanini	2018-06-16 00:00:00	23
4328	Venâncio Aires	2018-06-16 00:00:00	23
4329	Vera Cruz	2018-06-16 00:00:00	23
4330	Veranópolis	2018-06-16 00:00:00	23
4331	Vespasiano Correa	2018-06-16 00:00:00	23
4332	Viadutos	2018-06-16 00:00:00	23
4333	Viamão	2018-06-16 00:00:00	23
4334	Vicente Dutra	2018-06-16 00:00:00	23
4335	Victor Graeff	2018-06-16 00:00:00	23
4336	Vila Flores	2018-06-16 00:00:00	23
4337	Vila Lângaro	2018-06-16 00:00:00	23
4338	Vila Maria	2018-06-16 00:00:00	23
4339	Vila Nova do Sul	2018-06-16 00:00:00	23
4340	Vista Alegre	2018-06-16 00:00:00	23
4341	Vista Alegre do Prata	2018-06-16 00:00:00	23
4342	Vista Gaúcha	2018-06-16 00:00:00	23
4343	Vitória das Missões	2018-06-16 00:00:00	23
4344	Westfália	2018-06-16 00:00:00	23
4345	Xangri-lá	2018-06-16 00:00:00	23
4346	Alta Floresta d`Oeste	2018-06-16 00:00:00	21
4347	Alto Alegre dos Parecis	2018-06-16 00:00:00	21
4348	Alto Paraíso	2018-06-16 00:00:00	21
4349	Alvorada d`Oeste	2018-06-16 00:00:00	21
4350	Ariquemes	2018-06-16 00:00:00	21
4351	Buritis	2018-06-16 00:00:00	21
4352	Cabixi	2018-06-16 00:00:00	21
4353	Cacaulândia	2018-06-16 00:00:00	21
4354	Cacoal	2018-06-16 00:00:00	21
4355	Campo Novo de Rondônia	2018-06-16 00:00:00	21
4356	Candeias do Jamari	2018-06-16 00:00:00	21
4357	Castanheiras	2018-06-16 00:00:00	21
4358	Cerejeiras	2018-06-16 00:00:00	21
4359	Chupinguaia	2018-06-16 00:00:00	21
4360	Colorado do Oeste	2018-06-16 00:00:00	21
4361	Corumbiara	2018-06-16 00:00:00	21
4362	Costa Marques	2018-06-16 00:00:00	21
4363	Cujubim	2018-06-16 00:00:00	21
4364	Espigão d`Oeste	2018-06-16 00:00:00	21
4365	Governador Jorge Teixeira	2018-06-16 00:00:00	21
4366	Guajará-Mirim	2018-06-16 00:00:00	21
4367	Itapuã do Oeste	2018-06-16 00:00:00	21
4368	Jaru	2018-06-16 00:00:00	21
4369	Ji-Paraná	2018-06-16 00:00:00	21
4370	Machadinho d`Oeste	2018-06-16 00:00:00	21
4371	Ministro Andreazza	2018-06-16 00:00:00	21
4372	Mirante da Serra	2018-06-16 00:00:00	21
4373	Monte Negro	2018-06-16 00:00:00	21
4374	Nova Brasilândia d`Oeste	2018-06-16 00:00:00	21
4375	Nova Mamoré	2018-06-16 00:00:00	21
4376	Nova União	2018-06-16 00:00:00	21
4377	Novo Horizonte do Oeste	2018-06-16 00:00:00	21
4378	Ouro Preto do Oeste	2018-06-16 00:00:00	21
4379	Parecis	2018-06-16 00:00:00	21
4380	Pimenta Bueno	2018-06-16 00:00:00	21
4381	Pimenteiras do Oeste	2018-06-16 00:00:00	21
4382	Porto Velho	2018-06-16 00:00:00	21
4383	Presidente Médici	2018-06-16 00:00:00	21
4384	Primavera de Rondônia	2018-06-16 00:00:00	21
4385	Rio Crespo	2018-06-16 00:00:00	21
4386	Rolim de Moura	2018-06-16 00:00:00	21
4387	Santa Luzia d`Oeste	2018-06-16 00:00:00	21
4388	São Felipe d`Oeste	2018-06-16 00:00:00	21
4389	São Francisco do Guaporé	2018-06-16 00:00:00	21
4390	São Miguel do Guaporé	2018-06-16 00:00:00	21
4391	Seringueiras	2018-06-16 00:00:00	21
4392	Teixeirópolis	2018-06-16 00:00:00	21
4393	Theobroma	2018-06-16 00:00:00	21
4394	Urupá	2018-06-16 00:00:00	21
4395	Vale do Anari	2018-06-16 00:00:00	21
4396	Vale do Paraíso	2018-06-16 00:00:00	21
4397	Vilhena	2018-06-16 00:00:00	21
4398	Alto Alegre	2018-06-16 00:00:00	22
4399	Amajari	2018-06-16 00:00:00	22
4400	Boa Vista	2018-06-16 00:00:00	22
4401	Bonfim	2018-06-16 00:00:00	22
4402	Cantá	2018-06-16 00:00:00	22
4403	Caracaraí	2018-06-16 00:00:00	22
4404	Caroebe	2018-06-16 00:00:00	22
4405	Iracema	2018-06-16 00:00:00	22
4406	Mucajaí	2018-06-16 00:00:00	22
4407	Normandia	2018-06-16 00:00:00	22
4408	Pacaraima	2018-06-16 00:00:00	22
4409	Rorainópolis	2018-06-16 00:00:00	22
4410	São João da Baliza	2018-06-16 00:00:00	22
4411	São Luiz	2018-06-16 00:00:00	22
4412	Uiramutã	2018-06-16 00:00:00	22
4413	Abdon Batista	2018-06-16 00:00:00	24
4414	Abelardo Luz	2018-06-16 00:00:00	24
4415	Agrolândia	2018-06-16 00:00:00	24
4416	Agronômica	2018-06-16 00:00:00	24
4417	Água Doce	2018-06-16 00:00:00	24
4418	Águas de Chapecó	2018-06-16 00:00:00	24
4419	Águas Frias	2018-06-16 00:00:00	24
4420	Águas Mornas	2018-06-16 00:00:00	24
4421	Alfredo Wagner	2018-06-16 00:00:00	24
4422	Alto Bela Vista	2018-06-16 00:00:00	24
4423	Anchieta	2018-06-16 00:00:00	24
4424	Angelina	2018-06-16 00:00:00	24
4425	Anita Garibaldi	2018-06-16 00:00:00	24
4426	Anitápolis	2018-06-16 00:00:00	24
4427	Antônio Carlos	2018-06-16 00:00:00	24
4428	Apiúna	2018-06-16 00:00:00	24
4429	Arabutã	2018-06-16 00:00:00	24
4430	Araquari	2018-06-16 00:00:00	24
4431	Araranguá	2018-06-16 00:00:00	24
4432	Armazém	2018-06-16 00:00:00	24
4433	Arroio Trinta	2018-06-16 00:00:00	24
4434	Arvoredo	2018-06-16 00:00:00	24
4435	Ascurra	2018-06-16 00:00:00	24
4436	Atalanta	2018-06-16 00:00:00	24
4437	Aurora	2018-06-16 00:00:00	24
4438	Balneário Arroio do Silva	2018-06-16 00:00:00	24
4439	Balneário Barra do Sul	2018-06-16 00:00:00	24
4440	Balneário Camboriú	2018-06-16 00:00:00	24
4441	Balneário Gaivota	2018-06-16 00:00:00	24
4442	Bandeirante	2018-06-16 00:00:00	24
4443	Barra Bonita	2018-06-16 00:00:00	24
4444	Barra Velha	2018-06-16 00:00:00	24
4445	Bela Vista do Toldo	2018-06-16 00:00:00	24
4446	Belmonte	2018-06-16 00:00:00	24
4447	Benedito Novo	2018-06-16 00:00:00	24
4448	Biguaçu	2018-06-16 00:00:00	24
4449	Blumenau	2018-06-16 00:00:00	24
4450	Bocaina do Sul	2018-06-16 00:00:00	24
4451	Bom Jardim da Serra	2018-06-16 00:00:00	24
4452	Bom Jesus	2018-06-16 00:00:00	24
4453	Bom Jesus do Oeste	2018-06-16 00:00:00	24
4454	Bom Retiro	2018-06-16 00:00:00	24
4455	Bombinhas	2018-06-16 00:00:00	24
4456	Botuverá	2018-06-16 00:00:00	24
4457	Braço do Norte	2018-06-16 00:00:00	24
4458	Braço do Trombudo	2018-06-16 00:00:00	24
4459	Brunópolis	2018-06-16 00:00:00	24
4460	Brusque	2018-06-16 00:00:00	24
4461	Caçador	2018-06-16 00:00:00	24
4462	Caibi	2018-06-16 00:00:00	24
4463	Calmon	2018-06-16 00:00:00	24
4464	Camboriú	2018-06-16 00:00:00	24
4465	Campo Alegre	2018-06-16 00:00:00	24
4466	Campo Belo do Sul	2018-06-16 00:00:00	24
4467	Campo Erê	2018-06-16 00:00:00	24
4468	Campos Novos	2018-06-16 00:00:00	24
4469	Canelinha	2018-06-16 00:00:00	24
4470	Canoinhas	2018-06-16 00:00:00	24
4471	Capão Alto	2018-06-16 00:00:00	24
4472	Capinzal	2018-06-16 00:00:00	24
4473	Capivari de Baixo	2018-06-16 00:00:00	24
4474	Catanduvas	2018-06-16 00:00:00	24
4475	Caxambu do Sul	2018-06-16 00:00:00	24
4476	Celso Ramos	2018-06-16 00:00:00	24
4477	Cerro Negro	2018-06-16 00:00:00	24
4478	Chapadão do Lageado	2018-06-16 00:00:00	24
4479	Chapecó	2018-06-16 00:00:00	24
4480	Cocal do Sul	2018-06-16 00:00:00	24
4481	Concórdia	2018-06-16 00:00:00	24
4482	Cordilheira Alta	2018-06-16 00:00:00	24
4483	Coronel Freitas	2018-06-16 00:00:00	24
4484	Coronel Martins	2018-06-16 00:00:00	24
4485	Correia Pinto	2018-06-16 00:00:00	24
4486	Corupá	2018-06-16 00:00:00	24
4487	Criciúma	2018-06-16 00:00:00	24
4488	Cunha Porã	2018-06-16 00:00:00	24
4489	Cunhataí	2018-06-16 00:00:00	24
4490	Curitibanos	2018-06-16 00:00:00	24
4491	Descanso	2018-06-16 00:00:00	24
4492	Dionísio Cerqueira	2018-06-16 00:00:00	24
4493	Dona Emma	2018-06-16 00:00:00	24
4494	Doutor Pedrinho	2018-06-16 00:00:00	24
4495	Entre Rios	2018-06-16 00:00:00	24
4496	Ermo	2018-06-16 00:00:00	24
4497	Erval Velho	2018-06-16 00:00:00	24
4498	Faxinal dos Guedes	2018-06-16 00:00:00	24
4499	Flor do Sertão	2018-06-16 00:00:00	24
4500	Florianópolis	2018-06-16 00:00:00	24
4501	Formosa do Sul	2018-06-16 00:00:00	24
4502	Forquilhinha	2018-06-16 00:00:00	24
4503	Fraiburgo	2018-06-16 00:00:00	24
4504	Frei Rogério	2018-06-16 00:00:00	24
4505	Galvão	2018-06-16 00:00:00	24
4506	Garopaba	2018-06-16 00:00:00	24
4507	Garuva	2018-06-16 00:00:00	24
4508	Gaspar	2018-06-16 00:00:00	24
4509	Governador Celso Ramos	2018-06-16 00:00:00	24
4510	Grão Pará	2018-06-16 00:00:00	24
4511	Gravatal	2018-06-16 00:00:00	24
4512	Guabiruba	2018-06-16 00:00:00	24
4513	Guaraciaba	2018-06-16 00:00:00	24
4514	Guaramirim	2018-06-16 00:00:00	24
4515	Guarujá do Sul	2018-06-16 00:00:00	24
4516	Guatambú	2018-06-16 00:00:00	24
4517	Herval d`Oeste	2018-06-16 00:00:00	24
4518	Ibiam	2018-06-16 00:00:00	24
4519	Ibicaré	2018-06-16 00:00:00	24
4520	Ibirama	2018-06-16 00:00:00	24
4521	Içara	2018-06-16 00:00:00	24
4522	Ilhota	2018-06-16 00:00:00	24
4523	Imaruí	2018-06-16 00:00:00	24
4524	Imbituba	2018-06-16 00:00:00	24
4525	Imbuia	2018-06-16 00:00:00	24
4526	Indaial	2018-06-16 00:00:00	24
4527	Iomerê	2018-06-16 00:00:00	24
4528	Ipira	2018-06-16 00:00:00	24
4529	Iporã do Oeste	2018-06-16 00:00:00	24
4530	Ipuaçu	2018-06-16 00:00:00	24
4531	Ipumirim	2018-06-16 00:00:00	24
4532	Iraceminha	2018-06-16 00:00:00	24
4533	Irani	2018-06-16 00:00:00	24
4534	Irati	2018-06-16 00:00:00	24
4535	Irineópolis	2018-06-16 00:00:00	24
4536	Itá	2018-06-16 00:00:00	24
4537	Itaiópolis	2018-06-16 00:00:00	24
4538	Itajaí	2018-06-16 00:00:00	24
4539	Itapema	2018-06-16 00:00:00	24
4540	Itapiranga	2018-06-16 00:00:00	24
4541	Itapoá	2018-06-16 00:00:00	24
4542	Ituporanga	2018-06-16 00:00:00	24
4543	Jaborá	2018-06-16 00:00:00	24
4544	Jacinto Machado	2018-06-16 00:00:00	24
4545	Jaguaruna	2018-06-16 00:00:00	24
4546	Jaraguá do Sul	2018-06-16 00:00:00	24
4547	Jardinópolis	2018-06-16 00:00:00	24
4548	Joaçaba	2018-06-16 00:00:00	24
4549	Joinville	2018-06-16 00:00:00	24
4550	José Boiteux	2018-06-16 00:00:00	24
4551	Jupiá	2018-06-16 00:00:00	24
4552	Lacerdópolis	2018-06-16 00:00:00	24
4553	Lages	2018-06-16 00:00:00	24
4554	Laguna	2018-06-16 00:00:00	24
4555	Lajeado Grande	2018-06-16 00:00:00	24
4556	Laurentino	2018-06-16 00:00:00	24
4557	Lauro Muller	2018-06-16 00:00:00	24
4558	Lebon Régis	2018-06-16 00:00:00	24
4559	Leoberto Leal	2018-06-16 00:00:00	24
4560	Lindóia do Sul	2018-06-16 00:00:00	24
4561	Lontras	2018-06-16 00:00:00	24
4562	Luiz Alves	2018-06-16 00:00:00	24
4563	Luzerna	2018-06-16 00:00:00	24
4564	Macieira	2018-06-16 00:00:00	24
4565	Mafra	2018-06-16 00:00:00	24
4566	Major Gercino	2018-06-16 00:00:00	24
4567	Major Vieira	2018-06-16 00:00:00	24
4568	Maracajá	2018-06-16 00:00:00	24
4569	Maravilha	2018-06-16 00:00:00	24
4570	Marema	2018-06-16 00:00:00	24
4571	Massaranduba	2018-06-16 00:00:00	24
4572	Matos Costa	2018-06-16 00:00:00	24
4573	Meleiro	2018-06-16 00:00:00	24
4574	Mirim Doce	2018-06-16 00:00:00	24
4575	Modelo	2018-06-16 00:00:00	24
4576	Mondaí	2018-06-16 00:00:00	24
4577	Monte Carlo	2018-06-16 00:00:00	24
4578	Monte Castelo	2018-06-16 00:00:00	24
4579	Morro da Fumaça	2018-06-16 00:00:00	24
4580	Morro Grande	2018-06-16 00:00:00	24
4581	Navegantes	2018-06-16 00:00:00	24
4582	Nova Erechim	2018-06-16 00:00:00	24
4583	Nova Itaberaba	2018-06-16 00:00:00	24
4584	Nova Trento	2018-06-16 00:00:00	24
4585	Nova Veneza	2018-06-16 00:00:00	24
4586	Novo Horizonte	2018-06-16 00:00:00	24
4587	Orleans	2018-06-16 00:00:00	24
4588	Otacílio Costa	2018-06-16 00:00:00	24
4589	Ouro	2018-06-16 00:00:00	24
4590	Ouro Verde	2018-06-16 00:00:00	24
4591	Paial	2018-06-16 00:00:00	24
4592	Painel	2018-06-16 00:00:00	24
4593	Palhoça	2018-06-16 00:00:00	24
4594	Palma Sola	2018-06-16 00:00:00	24
4595	Palmeira	2018-06-16 00:00:00	24
4596	Palmitos	2018-06-16 00:00:00	24
4597	Papanduva	2018-06-16 00:00:00	24
4598	Paraíso	2018-06-16 00:00:00	24
4599	Passo de Torres	2018-06-16 00:00:00	24
4600	Passos Maia	2018-06-16 00:00:00	24
4601	Paulo Lopes	2018-06-16 00:00:00	24
4602	Pedras Grandes	2018-06-16 00:00:00	24
4603	Penha	2018-06-16 00:00:00	24
4604	Peritiba	2018-06-16 00:00:00	24
4605	Petrolândia	2018-06-16 00:00:00	24
4606	Balneário Piçarras	2018-06-16 00:00:00	24
4607	Pinhalzinho	2018-06-16 00:00:00	24
4608	Pinheiro Preto	2018-06-16 00:00:00	24
4609	Piratuba	2018-06-16 00:00:00	24
4610	Planalto Alegre	2018-06-16 00:00:00	24
4611	Pomerode	2018-06-16 00:00:00	24
4612	Ponte Alta	2018-06-16 00:00:00	24
4613	Ponte Alta do Norte	2018-06-16 00:00:00	24
4614	Ponte Serrada	2018-06-16 00:00:00	24
4615	Porto Belo	2018-06-16 00:00:00	24
4616	Porto União	2018-06-16 00:00:00	24
4617	Pouso Redondo	2018-06-16 00:00:00	24
4618	Praia Grande	2018-06-16 00:00:00	24
4620	Presidente Getúlio	2018-06-16 00:00:00	24
4621	Presidente Nereu	2018-06-16 00:00:00	24
4622	Princesa	2018-06-16 00:00:00	24
4623	Quilombo	2018-06-16 00:00:00	24
4624	Rancho Queimado	2018-06-16 00:00:00	24
4625	Rio das Antas	2018-06-16 00:00:00	24
4626	Rio do Campo	2018-06-16 00:00:00	24
4627	Rio do Oeste	2018-06-16 00:00:00	24
4628	Rio do Sul	2018-06-16 00:00:00	24
4629	Rio dos Cedros	2018-06-16 00:00:00	24
4630	Rio Fortuna	2018-06-16 00:00:00	24
4631	Rio Negrinho	2018-06-16 00:00:00	24
4632	Rio Rufino	2018-06-16 00:00:00	24
4633	Riqueza	2018-06-16 00:00:00	24
4634	Rodeio	2018-06-16 00:00:00	24
4635	Romelândia	2018-06-16 00:00:00	24
4636	Salete	2018-06-16 00:00:00	24
4637	Saltinho	2018-06-16 00:00:00	24
4638	Salto Veloso	2018-06-16 00:00:00	24
4639	Sangão	2018-06-16 00:00:00	24
4640	Santa Cecília	2018-06-16 00:00:00	24
4641	Santa Helena	2018-06-16 00:00:00	24
4642	Santa Rosa de Lima	2018-06-16 00:00:00	24
4643	Santa Rosa do Sul	2018-06-16 00:00:00	24
4644	Santa Terezinha	2018-06-16 00:00:00	24
4645	Santa Terezinha do Progresso	2018-06-16 00:00:00	24
4646	Santiago do Sul	2018-06-16 00:00:00	24
4647	Santo Amaro da Imperatriz	2018-06-16 00:00:00	24
4648	São Bento do Sul	2018-06-16 00:00:00	24
4649	São Bernardino	2018-06-16 00:00:00	24
4650	São Bonifácio	2018-06-16 00:00:00	24
4651	São Carlos	2018-06-16 00:00:00	24
4652	São Cristovão do Sul	2018-06-16 00:00:00	24
4653	São Domingos	2018-06-16 00:00:00	24
4654	São Francisco do Sul	2018-06-16 00:00:00	24
4655	São João Batista	2018-06-16 00:00:00	24
4656	São João do Itaperiú	2018-06-16 00:00:00	24
4657	São João do Oeste	2018-06-16 00:00:00	24
4658	São João do Sul	2018-06-16 00:00:00	24
4659	São Joaquim	2018-06-16 00:00:00	24
4660	São José	2018-06-16 00:00:00	24
4661	São José do Cedro	2018-06-16 00:00:00	24
4662	São José do Cerrito	2018-06-16 00:00:00	24
4663	São Lourenço do Oeste	2018-06-16 00:00:00	24
4664	São Ludgero	2018-06-16 00:00:00	24
4665	São Martinho	2018-06-16 00:00:00	24
4666	São Miguel da Boa Vista	2018-06-16 00:00:00	24
4667	São Miguel do Oeste	2018-06-16 00:00:00	24
4668	São Pedro de Alcântara	2018-06-16 00:00:00	24
4669	Saudades	2018-06-16 00:00:00	24
4670	Schroeder	2018-06-16 00:00:00	24
4671	Seara	2018-06-16 00:00:00	24
4672	Serra Alta	2018-06-16 00:00:00	24
4673	Siderópolis	2018-06-16 00:00:00	24
4674	Sombrio	2018-06-16 00:00:00	24
4675	Sul Brasil	2018-06-16 00:00:00	24
4676	Taió	2018-06-16 00:00:00	24
4677	Tangará	2018-06-16 00:00:00	24
4678	Tigrinhos	2018-06-16 00:00:00	24
4679	Tijucas	2018-06-16 00:00:00	24
4680	Timbé do Sul	2018-06-16 00:00:00	24
4681	Timbó	2018-06-16 00:00:00	24
4682	Timbó Grande	2018-06-16 00:00:00	24
4683	Três Barras	2018-06-16 00:00:00	24
4684	Treviso	2018-06-16 00:00:00	24
4685	Treze de Maio	2018-06-16 00:00:00	24
4686	Treze Tílias	2018-06-16 00:00:00	24
4687	Trombudo Central	2018-06-16 00:00:00	24
4688	Tubarão	2018-06-16 00:00:00	24
4689	Tunápolis	2018-06-16 00:00:00	24
4690	Turvo	2018-06-16 00:00:00	24
4691	União do Oeste	2018-06-16 00:00:00	24
4692	Urubici	2018-06-16 00:00:00	24
4693	Urupema	2018-06-16 00:00:00	24
4694	Urussanga	2018-06-16 00:00:00	24
4695	Vargeão	2018-06-16 00:00:00	24
4696	Vargem	2018-06-16 00:00:00	24
4697	Vargem Bonita	2018-06-16 00:00:00	24
4698	Vidal Ramos	2018-06-16 00:00:00	24
4699	Videira	2018-06-16 00:00:00	24
4700	Vitor Meireles	2018-06-16 00:00:00	24
4701	Witmarsum	2018-06-16 00:00:00	24
4702	Xanxerê	2018-06-16 00:00:00	24
4703	Xavantina	2018-06-16 00:00:00	24
4704	Xaxim	2018-06-16 00:00:00	24
4705	Zortéa	2018-06-16 00:00:00	24
4706	Adamantina	2018-06-16 00:00:00	26
4707	Adolfo	2018-06-16 00:00:00	26
4708	Aguaí	2018-06-16 00:00:00	26
4709	Águas da Prata	2018-06-16 00:00:00	26
4710	Águas de Lindóia	2018-06-16 00:00:00	26
4711	Águas de Santa Bárbara	2018-06-16 00:00:00	26
4712	Águas de São Pedro	2018-06-16 00:00:00	26
4713	Agudos	2018-06-16 00:00:00	26
4714	Alambari	2018-06-16 00:00:00	26
4715	Alfredo Marcondes	2018-06-16 00:00:00	26
4716	Altair	2018-06-16 00:00:00	26
4717	Altinópolis	2018-06-16 00:00:00	26
4718	Alto Alegre	2018-06-16 00:00:00	26
4719	Alumínio	2018-06-16 00:00:00	26
4720	Álvares Florence	2018-06-16 00:00:00	26
4721	Álvares Machado	2018-06-16 00:00:00	26
4722	Álvaro de Carvalho	2018-06-16 00:00:00	26
4723	Alvinlândia	2018-06-16 00:00:00	26
4724	Americana	2018-06-16 00:00:00	26
4725	Américo Brasiliense	2018-06-16 00:00:00	26
4726	Américo de Campos	2018-06-16 00:00:00	26
4727	Amparo	2018-06-16 00:00:00	26
4728	Analândia	2018-06-16 00:00:00	26
4729	Andradina	2018-06-16 00:00:00	26
4730	Angatuba	2018-06-16 00:00:00	26
4731	Anhembi	2018-06-16 00:00:00	26
4732	Anhumas	2018-06-16 00:00:00	26
4733	Aparecida	2018-06-16 00:00:00	26
4734	Aparecida d`Oeste	2018-06-16 00:00:00	26
4735	Apiaí	2018-06-16 00:00:00	26
4736	Araçariguama	2018-06-16 00:00:00	26
4737	Araçatuba	2018-06-16 00:00:00	26
4738	Araçoiaba da Serra	2018-06-16 00:00:00	26
4739	Aramina	2018-06-16 00:00:00	26
4740	Arandu	2018-06-16 00:00:00	26
4741	Arapeí	2018-06-16 00:00:00	26
4742	Araraquara	2018-06-16 00:00:00	26
4743	Araras	2018-06-16 00:00:00	26
4744	Arco-Íris	2018-06-16 00:00:00	26
4745	Arealva	2018-06-16 00:00:00	26
4746	Areias	2018-06-16 00:00:00	26
4747	Areiópolis	2018-06-16 00:00:00	26
4748	Ariranha	2018-06-16 00:00:00	26
4749	Artur Nogueira	2018-06-16 00:00:00	26
4750	Arujá	2018-06-16 00:00:00	26
4751	Aspásia	2018-06-16 00:00:00	26
4752	Assis	2018-06-16 00:00:00	26
4753	Atibaia	2018-06-16 00:00:00	26
4754	Auriflama	2018-06-16 00:00:00	26
4755	Avaí	2018-06-16 00:00:00	26
4756	Avanhandava	2018-06-16 00:00:00	26
4757	Avaré	2018-06-16 00:00:00	26
4758	Bady Bassitt	2018-06-16 00:00:00	26
4759	Balbinos	2018-06-16 00:00:00	26
4760	Bálsamo	2018-06-16 00:00:00	26
4761	Bananal	2018-06-16 00:00:00	26
4762	Barão de Antonina	2018-06-16 00:00:00	26
4763	Barbosa	2018-06-16 00:00:00	26
4764	Bariri	2018-06-16 00:00:00	26
4765	Barra Bonita	2018-06-16 00:00:00	26
4766	Barra do Chapéu	2018-06-16 00:00:00	26
4767	Barra do Turvo	2018-06-16 00:00:00	26
4768	Barretos	2018-06-16 00:00:00	26
4769	Barrinha	2018-06-16 00:00:00	26
4770	Barueri	2018-06-16 00:00:00	26
4771	Bastos	2018-06-16 00:00:00	26
4772	Batatais	2018-06-16 00:00:00	26
4773	Bauru	2018-06-16 00:00:00	26
4774	Bebedouro	2018-06-16 00:00:00	26
4775	Bento de Abreu	2018-06-16 00:00:00	26
4776	Bernardino de Campos	2018-06-16 00:00:00	26
4777	Bertioga	2018-06-16 00:00:00	26
4778	Bilac	2018-06-16 00:00:00	26
4779	Birigui	2018-06-16 00:00:00	26
4780	Biritiba-Mirim	2018-06-16 00:00:00	26
4781	Boa Esperança do Sul	2018-06-16 00:00:00	26
4782	Bocaina	2018-06-16 00:00:00	26
4783	Bofete	2018-06-16 00:00:00	26
4784	Boituva	2018-06-16 00:00:00	26
4785	Bom Jesus dos Perdões	2018-06-16 00:00:00	26
4786	Bom Sucesso de Itararé	2018-06-16 00:00:00	26
4787	Borá	2018-06-16 00:00:00	26
4788	Boracéia	2018-06-16 00:00:00	26
4789	Borborema	2018-06-16 00:00:00	26
4790	Borebi	2018-06-16 00:00:00	26
4791	Botucatu	2018-06-16 00:00:00	26
4792	Bragança Paulista	2018-06-16 00:00:00	26
4793	Braúna	2018-06-16 00:00:00	26
4794	Brejo Alegre	2018-06-16 00:00:00	26
4795	Brodowski	2018-06-16 00:00:00	26
4796	Brotas	2018-06-16 00:00:00	26
4797	Buri	2018-06-16 00:00:00	26
4798	Buritama	2018-06-16 00:00:00	26
4799	Buritizal	2018-06-16 00:00:00	26
4800	Cabrália Paulista	2018-06-16 00:00:00	26
4801	Cabreúva	2018-06-16 00:00:00	26
4802	Caçapava	2018-06-16 00:00:00	26
4803	Cachoeira Paulista	2018-06-16 00:00:00	26
4804	Caconde	2018-06-16 00:00:00	26
4805	Cafelândia	2018-06-16 00:00:00	26
4806	Caiabu	2018-06-16 00:00:00	26
4807	Caieiras	2018-06-16 00:00:00	26
4808	Caiuá	2018-06-16 00:00:00	26
4809	Cajamar	2018-06-16 00:00:00	26
4810	Cajati	2018-06-16 00:00:00	26
4811	Cajobi	2018-06-16 00:00:00	26
4812	Cajuru	2018-06-16 00:00:00	26
4813	Campina do Monte Alegre	2018-06-16 00:00:00	26
4814	Campinas	2018-06-16 00:00:00	26
4815	Campo Limpo Paulista	2018-06-16 00:00:00	26
4816	Campos do Jordão	2018-06-16 00:00:00	26
4817	Campos Novos Paulista	2018-06-16 00:00:00	26
4818	Cananéia	2018-06-16 00:00:00	26
4819	Canas	2018-06-16 00:00:00	26
4820	Cândido Mota	2018-06-16 00:00:00	26
4821	Cândido Rodrigues	2018-06-16 00:00:00	26
4822	Canitar	2018-06-16 00:00:00	26
4823	Capão Bonito	2018-06-16 00:00:00	26
4824	Capela do Alto	2018-06-16 00:00:00	26
4825	Capivari	2018-06-16 00:00:00	26
4826	Caraguatatuba	2018-06-16 00:00:00	26
4827	Carapicuíba	2018-06-16 00:00:00	26
4828	Cardoso	2018-06-16 00:00:00	26
4829	Casa Branca	2018-06-16 00:00:00	26
4830	Cássia dos Coqueiros	2018-06-16 00:00:00	26
4831	Castilho	2018-06-16 00:00:00	26
4832	Catanduva	2018-06-16 00:00:00	26
4833	Catiguá	2018-06-16 00:00:00	26
4834	Cedral	2018-06-16 00:00:00	26
4835	Cerqueira César	2018-06-16 00:00:00	26
4836	Cerquilho	2018-06-16 00:00:00	26
4837	Cesário Lange	2018-06-16 00:00:00	26
4838	Charqueada	2018-06-16 00:00:00	26
4839	Chavantes	2018-06-16 00:00:00	26
4840	Clementina	2018-06-16 00:00:00	26
4841	Colina	2018-06-16 00:00:00	26
4842	Colômbia	2018-06-16 00:00:00	26
4843	Conchal	2018-06-16 00:00:00	26
4844	Conchas	2018-06-16 00:00:00	26
4845	Cordeirópolis	2018-06-16 00:00:00	26
4846	Coroados	2018-06-16 00:00:00	26
4847	Coronel Macedo	2018-06-16 00:00:00	26
4848	Corumbataí	2018-06-16 00:00:00	26
4849	Cosmópolis	2018-06-16 00:00:00	26
4850	Cosmorama	2018-06-16 00:00:00	26
4851	Cotia	2018-06-16 00:00:00	26
4852	Cravinhos	2018-06-16 00:00:00	26
4853	Cristais Paulista	2018-06-16 00:00:00	26
4854	Cruzália	2018-06-16 00:00:00	26
4855	Cruzeiro	2018-06-16 00:00:00	26
4856	Cubatão	2018-06-16 00:00:00	26
4857	Cunha	2018-06-16 00:00:00	26
4858	Descalvado	2018-06-16 00:00:00	26
4859	Diadema	2018-06-16 00:00:00	26
4860	Dirce Reis	2018-06-16 00:00:00	26
4861	Divinolândia	2018-06-16 00:00:00	26
4862	Dobrada	2018-06-16 00:00:00	26
4863	Dois Córregos	2018-06-16 00:00:00	26
4864	Dolcinópolis	2018-06-16 00:00:00	26
4865	Dourado	2018-06-16 00:00:00	26
4866	Dracena	2018-06-16 00:00:00	26
4867	Duartina	2018-06-16 00:00:00	26
4868	Dumont	2018-06-16 00:00:00	26
4869	Echaporã	2018-06-16 00:00:00	26
4870	Eldorado	2018-06-16 00:00:00	26
4871	Elias Fausto	2018-06-16 00:00:00	26
4872	Elisiário	2018-06-16 00:00:00	26
4873	Embaúba	2018-06-16 00:00:00	26
4874	Embu	2018-06-16 00:00:00	26
4875	Embu-Guaçu	2018-06-16 00:00:00	26
4876	Emilianópolis	2018-06-16 00:00:00	26
4877	Engenheiro Coelho	2018-06-16 00:00:00	26
4878	Espírito Santo do Pinhal	2018-06-16 00:00:00	26
4879	Espírito Santo do Turvo	2018-06-16 00:00:00	26
4880	Estiva Gerbi	2018-06-16 00:00:00	26
4881	Estrela d`Oeste	2018-06-16 00:00:00	26
4882	Estrela do Norte	2018-06-16 00:00:00	26
4883	Euclides da Cunha Paulista	2018-06-16 00:00:00	26
4884	Fartura	2018-06-16 00:00:00	26
4885	Fernando Prestes	2018-06-16 00:00:00	26
4886	Fernandópolis	2018-06-16 00:00:00	26
4887	Fernão	2018-06-16 00:00:00	26
4888	Ferraz de Vasconcelos	2018-06-16 00:00:00	26
4889	Flora Rica	2018-06-16 00:00:00	26
4890	Floreal	2018-06-16 00:00:00	26
4891	Flórida Paulista	2018-06-16 00:00:00	26
4892	Florínia	2018-06-16 00:00:00	26
4893	Franca	2018-06-16 00:00:00	26
4894	Francisco Morato	2018-06-16 00:00:00	26
4895	Franco da Rocha	2018-06-16 00:00:00	26
4896	Gabriel Monteiro	2018-06-16 00:00:00	26
4897	Gália	2018-06-16 00:00:00	26
4898	Garça	2018-06-16 00:00:00	26
4899	Gastão Vidigal	2018-06-16 00:00:00	26
4900	Gavião Peixoto	2018-06-16 00:00:00	26
4901	General Salgado	2018-06-16 00:00:00	26
4902	Getulina	2018-06-16 00:00:00	26
4903	Glicério	2018-06-16 00:00:00	26
4904	Guaiçara	2018-06-16 00:00:00	26
4905	Guaimbê	2018-06-16 00:00:00	26
4906	Guaíra	2018-06-16 00:00:00	26
4907	Guapiaçu	2018-06-16 00:00:00	26
4908	Guapiara	2018-06-16 00:00:00	26
4909	Guará	2018-06-16 00:00:00	26
4910	Guaraçaí	2018-06-16 00:00:00	26
4911	Guaraci	2018-06-16 00:00:00	26
4912	Guarani d`Oeste	2018-06-16 00:00:00	26
4913	Guarantã	2018-06-16 00:00:00	26
4914	Guararapes	2018-06-16 00:00:00	26
4915	Guararema	2018-06-16 00:00:00	26
4916	Guaratinguetá	2018-06-16 00:00:00	26
4917	Guareí	2018-06-16 00:00:00	26
4918	Guariba	2018-06-16 00:00:00	26
4919	Guarujá	2018-06-16 00:00:00	26
4920	Guarulhos	2018-06-16 00:00:00	26
4921	Guatapará	2018-06-16 00:00:00	26
4922	Guzolândia	2018-06-16 00:00:00	26
4923	Herculândia	2018-06-16 00:00:00	26
4924	Holambra	2018-06-16 00:00:00	26
4925	Hortolândia	2018-06-16 00:00:00	26
4926	Iacanga	2018-06-16 00:00:00	26
4927	Iacri	2018-06-16 00:00:00	26
4928	Iaras	2018-06-16 00:00:00	26
4929	Ibaté	2018-06-16 00:00:00	26
4930	Ibirá	2018-06-16 00:00:00	26
4931	Ibirarema	2018-06-16 00:00:00	26
4932	Ibitinga	2018-06-16 00:00:00	26
4933	Ibiúna	2018-06-16 00:00:00	26
4934	Icém	2018-06-16 00:00:00	26
4935	Iepê	2018-06-16 00:00:00	26
4936	Igaraçu do Tietê	2018-06-16 00:00:00	26
4937	Igarapava	2018-06-16 00:00:00	26
4938	Igaratá	2018-06-16 00:00:00	26
4939	Iguape	2018-06-16 00:00:00	26
4940	Ilha Comprida	2018-06-16 00:00:00	26
4941	Ilha Solteira	2018-06-16 00:00:00	26
4942	Ilhabela	2018-06-16 00:00:00	26
4943	Indaiatuba	2018-06-16 00:00:00	26
4944	Indiana	2018-06-16 00:00:00	26
4945	Indiaporã	2018-06-16 00:00:00	26
4946	Inúbia Paulista	2018-06-16 00:00:00	26
4947	Ipaussu	2018-06-16 00:00:00	26
4948	Iperó	2018-06-16 00:00:00	26
4949	Ipeúna	2018-06-16 00:00:00	26
4950	Ipiguá	2018-06-16 00:00:00	26
4951	Iporanga	2018-06-16 00:00:00	26
4952	Ipuã	2018-06-16 00:00:00	26
4953	Iracemápolis	2018-06-16 00:00:00	26
4954	Irapuã	2018-06-16 00:00:00	26
4955	Irapuru	2018-06-16 00:00:00	26
4956	Itaberá	2018-06-16 00:00:00	26
4957	Itaí	2018-06-16 00:00:00	26
4958	Itajobi	2018-06-16 00:00:00	26
4959	Itaju	2018-06-16 00:00:00	26
4960	Itanhaém	2018-06-16 00:00:00	26
4961	Itaóca	2018-06-16 00:00:00	26
4962	Itapecerica da Serra	2018-06-16 00:00:00	26
4963	Itapetininga	2018-06-16 00:00:00	26
4964	Itapeva	2018-06-16 00:00:00	26
4965	Itapevi	2018-06-16 00:00:00	26
4966	Itapira	2018-06-16 00:00:00	26
4967	Itapirapuã Paulista	2018-06-16 00:00:00	26
4968	Itápolis	2018-06-16 00:00:00	26
4969	Itaporanga	2018-06-16 00:00:00	26
4970	Itapuí	2018-06-16 00:00:00	26
4971	Itapura	2018-06-16 00:00:00	26
4972	Itaquaquecetuba	2018-06-16 00:00:00	26
4973	Itararé	2018-06-16 00:00:00	26
4974	Itariri	2018-06-16 00:00:00	26
4975	Itatiba	2018-06-16 00:00:00	26
4976	Itatinga	2018-06-16 00:00:00	26
4977	Itirapina	2018-06-16 00:00:00	26
4978	Itirapuã	2018-06-16 00:00:00	26
4979	Itobi	2018-06-16 00:00:00	26
4980	Itu	2018-06-16 00:00:00	26
4981	Itupeva	2018-06-16 00:00:00	26
4982	Ituverava	2018-06-16 00:00:00	26
4983	Jaborandi	2018-06-16 00:00:00	26
4984	Jaboticabal	2018-06-16 00:00:00	26
4985	Jacareí	2018-06-16 00:00:00	26
4986	Jaci	2018-06-16 00:00:00	26
4987	Jacupiranga	2018-06-16 00:00:00	26
4988	Jaguariúna	2018-06-16 00:00:00	26
4989	Jales	2018-06-16 00:00:00	26
4990	Jambeiro	2018-06-16 00:00:00	26
4991	Jandira	2018-06-16 00:00:00	26
4992	Jardinópolis	2018-06-16 00:00:00	26
4993	Jarinu	2018-06-16 00:00:00	26
4994	Jaú	2018-06-16 00:00:00	26
4995	Jeriquara	2018-06-16 00:00:00	26
4996	Joanópolis	2018-06-16 00:00:00	26
4997	João Ramalho	2018-06-16 00:00:00	26
4998	José Bonifácio	2018-06-16 00:00:00	26
4999	Júlio Mesquita	2018-06-16 00:00:00	26
5000	Jumirim	2018-06-16 00:00:00	26
5001	Jundiaí	2018-06-16 00:00:00	26
5002	Junqueirópolis	2018-06-16 00:00:00	26
5003	Juquiá	2018-06-16 00:00:00	26
5004	Juquitiba	2018-06-16 00:00:00	26
5005	Lagoinha	2018-06-16 00:00:00	26
5006	Laranjal Paulista	2018-06-16 00:00:00	26
5007	Lavínia	2018-06-16 00:00:00	26
5008	Lavrinhas	2018-06-16 00:00:00	26
5009	Leme	2018-06-16 00:00:00	26
5010	Lençóis Paulista	2018-06-16 00:00:00	26
5011	Limeira	2018-06-16 00:00:00	26
5012	Lindóia	2018-06-16 00:00:00	26
5013	Lins	2018-06-16 00:00:00	26
5014	Lorena	2018-06-16 00:00:00	26
5015	Lourdes	2018-06-16 00:00:00	26
5016	Louveira	2018-06-16 00:00:00	26
5017	Lucélia	2018-06-16 00:00:00	26
5018	Lucianópolis	2018-06-16 00:00:00	26
5019	Luís Antônio	2018-06-16 00:00:00	26
5020	Luiziânia	2018-06-16 00:00:00	26
5021	Lupércio	2018-06-16 00:00:00	26
5022	Lutécia	2018-06-16 00:00:00	26
5023	Macatuba	2018-06-16 00:00:00	26
5024	Macaubal	2018-06-16 00:00:00	26
5025	Macedônia	2018-06-16 00:00:00	26
5026	Magda	2018-06-16 00:00:00	26
5027	Mairinque	2018-06-16 00:00:00	26
5028	Mairiporã	2018-06-16 00:00:00	26
5029	Manduri	2018-06-16 00:00:00	26
5030	Marabá Paulista	2018-06-16 00:00:00	26
5031	Maracaí	2018-06-16 00:00:00	26
5032	Marapoama	2018-06-16 00:00:00	26
5033	Mariápolis	2018-06-16 00:00:00	26
5034	Marília	2018-06-16 00:00:00	26
5035	Marinópolis	2018-06-16 00:00:00	26
5036	Martinópolis	2018-06-16 00:00:00	26
5037	Matão	2018-06-16 00:00:00	26
5038	Mauá	2018-06-16 00:00:00	26
5039	Mendonça	2018-06-16 00:00:00	26
5040	Meridiano	2018-06-16 00:00:00	26
5041	Mesópolis	2018-06-16 00:00:00	26
5042	Miguelópolis	2018-06-16 00:00:00	26
5043	Mineiros do Tietê	2018-06-16 00:00:00	26
5044	Mira Estrela	2018-06-16 00:00:00	26
5045	Miracatu	2018-06-16 00:00:00	26
5046	Mirandópolis	2018-06-16 00:00:00	26
5047	Mirante do Paranapanema	2018-06-16 00:00:00	26
5048	Mirassol	2018-06-16 00:00:00	26
5049	Mirassolândia	2018-06-16 00:00:00	26
5050	Mococa	2018-06-16 00:00:00	26
5051	Mogi das Cruzes	2018-06-16 00:00:00	26
5052	Mogi Guaçu	2018-06-16 00:00:00	26
5053	Mogi Mirim	2018-06-16 00:00:00	26
5054	Mombuca	2018-06-16 00:00:00	26
5055	Monções	2018-06-16 00:00:00	26
5056	Mongaguá	2018-06-16 00:00:00	26
5057	Monte Alegre do Sul	2018-06-16 00:00:00	26
5058	Monte Alto	2018-06-16 00:00:00	26
5059	Monte Aprazível	2018-06-16 00:00:00	26
5060	Monte Azul Paulista	2018-06-16 00:00:00	26
5061	Monte Castelo	2018-06-16 00:00:00	26
5062	Monte Mor	2018-06-16 00:00:00	26
5063	Monteiro Lobato	2018-06-16 00:00:00	26
5064	Morro Agudo	2018-06-16 00:00:00	26
5065	Morungaba	2018-06-16 00:00:00	26
5066	Motuca	2018-06-16 00:00:00	26
5067	Murutinga do Sul	2018-06-16 00:00:00	26
5068	Nantes	2018-06-16 00:00:00	26
5069	Narandiba	2018-06-16 00:00:00	26
5070	Natividade da Serra	2018-06-16 00:00:00	26
5071	Nazaré Paulista	2018-06-16 00:00:00	26
5072	Neves Paulista	2018-06-16 00:00:00	26
5073	Nhandeara	2018-06-16 00:00:00	26
5074	Nipoã	2018-06-16 00:00:00	26
5075	Nova Aliança	2018-06-16 00:00:00	26
5076	Nova Campina	2018-06-16 00:00:00	26
5077	Nova Canaã Paulista	2018-06-16 00:00:00	26
5078	Nova Castilho	2018-06-16 00:00:00	26
5079	Nova Europa	2018-06-16 00:00:00	26
5080	Nova Granada	2018-06-16 00:00:00	26
5081	Nova Guataporanga	2018-06-16 00:00:00	26
5082	Nova Independência	2018-06-16 00:00:00	26
5083	Nova Luzitânia	2018-06-16 00:00:00	26
5084	Nova Odessa	2018-06-16 00:00:00	26
5085	Novais	2018-06-16 00:00:00	26
5086	Novo Horizonte	2018-06-16 00:00:00	26
5087	Nuporanga	2018-06-16 00:00:00	26
5088	Ocauçu	2018-06-16 00:00:00	26
5089	Óleo	2018-06-16 00:00:00	26
5090	Olímpia	2018-06-16 00:00:00	26
5091	Onda Verde	2018-06-16 00:00:00	26
5092	Oriente	2018-06-16 00:00:00	26
5093	Orindiúva	2018-06-16 00:00:00	26
5094	Orlândia	2018-06-16 00:00:00	26
5095	Osasco	2018-06-16 00:00:00	26
5096	Oscar Bressane	2018-06-16 00:00:00	26
5097	Osvaldo Cruz	2018-06-16 00:00:00	26
5098	Ourinhos	2018-06-16 00:00:00	26
5099	Ouro Verde	2018-06-16 00:00:00	26
5100	Ouroeste	2018-06-16 00:00:00	26
5101	Pacaembu	2018-06-16 00:00:00	26
5102	Palestina	2018-06-16 00:00:00	26
5103	Palmares Paulista	2018-06-16 00:00:00	26
5104	Palmeira d`Oeste	2018-06-16 00:00:00	26
5105	Palmital	2018-06-16 00:00:00	26
5106	Panorama	2018-06-16 00:00:00	26
5107	Paraguaçu Paulista	2018-06-16 00:00:00	26
5108	Paraibuna	2018-06-16 00:00:00	26
5109	Paraíso	2018-06-16 00:00:00	26
5110	Paranapanema	2018-06-16 00:00:00	26
5111	Paranapuã	2018-06-16 00:00:00	26
5112	Parapuã	2018-06-16 00:00:00	26
5113	Pardinho	2018-06-16 00:00:00	26
5114	Pariquera-Açu	2018-06-16 00:00:00	26
5115	Parisi	2018-06-16 00:00:00	26
5116	Patrocínio Paulista	2018-06-16 00:00:00	26
5117	Paulicéia	2018-06-16 00:00:00	26
5118	Paulínia	2018-06-16 00:00:00	26
5119	Paulistânia	2018-06-16 00:00:00	26
5120	Paulo de Faria	2018-06-16 00:00:00	26
5121	Pederneiras	2018-06-16 00:00:00	26
5122	Pedra Bela	2018-06-16 00:00:00	26
5123	Pedranópolis	2018-06-16 00:00:00	26
5124	Pedregulho	2018-06-16 00:00:00	26
5125	Pedreira	2018-06-16 00:00:00	26
5126	Pedrinhas Paulista	2018-06-16 00:00:00	26
5127	Pedro de Toledo	2018-06-16 00:00:00	26
5128	Penápolis	2018-06-16 00:00:00	26
5129	Pereira Barreto	2018-06-16 00:00:00	26
5130	Pereiras	2018-06-16 00:00:00	26
5131	Peruíbe	2018-06-16 00:00:00	26
5132	Piacatu	2018-06-16 00:00:00	26
5133	Piedade	2018-06-16 00:00:00	26
5134	Pilar do Sul	2018-06-16 00:00:00	26
5135	Pindamonhangaba	2018-06-16 00:00:00	26
5136	Pindorama	2018-06-16 00:00:00	26
5137	Pinhalzinho	2018-06-16 00:00:00	26
5138	Piquerobi	2018-06-16 00:00:00	26
5139	Piquete	2018-06-16 00:00:00	26
5140	Piracaia	2018-06-16 00:00:00	26
5141	Piracicaba	2018-06-16 00:00:00	26
5142	Piraju	2018-06-16 00:00:00	26
5143	Pirajuí	2018-06-16 00:00:00	26
5144	Pirangi	2018-06-16 00:00:00	26
5145	Pirapora do Bom Jesus	2018-06-16 00:00:00	26
5146	Pirapozinho	2018-06-16 00:00:00	26
5147	Pirassununga	2018-06-16 00:00:00	26
5148	Piratininga	2018-06-16 00:00:00	26
5149	Pitangueiras	2018-06-16 00:00:00	26
5150	Planalto	2018-06-16 00:00:00	26
5151	Platina	2018-06-16 00:00:00	26
5152	Poá	2018-06-16 00:00:00	26
5153	Poloni	2018-06-16 00:00:00	26
5154	Pompéia	2018-06-16 00:00:00	26
5155	Pongaí	2018-06-16 00:00:00	26
5156	Pontal	2018-06-16 00:00:00	26
5157	Pontalinda	2018-06-16 00:00:00	26
5158	Pontes Gestal	2018-06-16 00:00:00	26
5159	Populina	2018-06-16 00:00:00	26
5160	Porangaba	2018-06-16 00:00:00	26
5161	Porto Feliz	2018-06-16 00:00:00	26
5162	Porto Ferreira	2018-06-16 00:00:00	26
5163	Potim	2018-06-16 00:00:00	26
5164	Potirendaba	2018-06-16 00:00:00	26
5165	Pracinha	2018-06-16 00:00:00	26
5166	Pradópolis	2018-06-16 00:00:00	26
5167	Praia Grande	2018-06-16 00:00:00	26
5168	Pratânia	2018-06-16 00:00:00	26
5169	Presidente Alves	2018-06-16 00:00:00	26
5170	Presidente Bernardes	2018-06-16 00:00:00	26
5171	Presidente Epitácio	2018-06-16 00:00:00	26
5172	Presidente Prudente	2018-06-16 00:00:00	26
5173	Presidente Venceslau	2018-06-16 00:00:00	26
5174	Promissão	2018-06-16 00:00:00	26
5175	Quadra	2018-06-16 00:00:00	26
5176	Quatá	2018-06-16 00:00:00	26
5177	Queiroz	2018-06-16 00:00:00	26
5178	Queluz	2018-06-16 00:00:00	26
5179	Quintana	2018-06-16 00:00:00	26
5180	Rafard	2018-06-16 00:00:00	26
5181	Rancharia	2018-06-16 00:00:00	26
5182	Redenção da Serra	2018-06-16 00:00:00	26
5183	Regente Feijó	2018-06-16 00:00:00	26
5184	Reginópolis	2018-06-16 00:00:00	26
5185	Registro	2018-06-16 00:00:00	26
5186	Restinga	2018-06-16 00:00:00	26
5187	Ribeira	2018-06-16 00:00:00	26
5188	Ribeirão Bonito	2018-06-16 00:00:00	26
5189	Ribeirão Branco	2018-06-16 00:00:00	26
5190	Ribeirão Corrente	2018-06-16 00:00:00	26
5191	Ribeirão do Sul	2018-06-16 00:00:00	26
5192	Ribeirão dos Índios	2018-06-16 00:00:00	26
5193	Ribeirão Grande	2018-06-16 00:00:00	26
5194	Ribeirão Pires	2018-06-16 00:00:00	26
5195	Ribeirão Preto	2018-06-16 00:00:00	26
5196	Rifaina	2018-06-16 00:00:00	26
5197	Rincão	2018-06-16 00:00:00	26
5198	Rinópolis	2018-06-16 00:00:00	26
5199	Rio Claro	2018-06-16 00:00:00	26
5200	Rio das Pedras	2018-06-16 00:00:00	26
5201	Rio Grande da Serra	2018-06-16 00:00:00	26
5202	Riolândia	2018-06-16 00:00:00	26
5203	Riversul	2018-06-16 00:00:00	26
5204	Rosana	2018-06-16 00:00:00	26
5205	Roseira	2018-06-16 00:00:00	26
5206	Rubiácea	2018-06-16 00:00:00	26
5207	Rubinéia	2018-06-16 00:00:00	26
5208	Sabino	2018-06-16 00:00:00	26
5209	Sagres	2018-06-16 00:00:00	26
5210	Sales	2018-06-16 00:00:00	26
5211	Sales Oliveira	2018-06-16 00:00:00	26
5212	Salesópolis	2018-06-16 00:00:00	26
5213	Salmourão	2018-06-16 00:00:00	26
5214	Saltinho	2018-06-16 00:00:00	26
5215	Salto	2018-06-16 00:00:00	26
5216	Salto de Pirapora	2018-06-16 00:00:00	26
5217	Salto Grande	2018-06-16 00:00:00	26
5218	Sandovalina	2018-06-16 00:00:00	26
5219	Santa Adélia	2018-06-16 00:00:00	26
5220	Santa Albertina	2018-06-16 00:00:00	26
5221	Santa Bárbara d`Oeste	2018-06-16 00:00:00	26
5222	Santa Branca	2018-06-16 00:00:00	26
5223	Santa Clara d`Oeste	2018-06-16 00:00:00	26
5224	Santa Cruz da Conceição	2018-06-16 00:00:00	26
5225	Santa Cruz da Esperança	2018-06-16 00:00:00	26
5226	Santa Cruz das Palmeiras	2018-06-16 00:00:00	26
5227	Santa Cruz do Rio Pardo	2018-06-16 00:00:00	26
5228	Santa Ernestina	2018-06-16 00:00:00	26
5229	Santa Fé do Sul	2018-06-16 00:00:00	26
5230	Santa Gertrudes	2018-06-16 00:00:00	26
5231	Santa Isabel	2018-06-16 00:00:00	26
5232	Santa Lúcia	2018-06-16 00:00:00	26
5233	Santa Maria da Serra	2018-06-16 00:00:00	26
5234	Santa Mercedes	2018-06-16 00:00:00	26
5235	Santa Rita d`Oeste	2018-06-16 00:00:00	26
5236	Santa Rita do Passa Quatro	2018-06-16 00:00:00	26
5237	Santa Rosa de Viterbo	2018-06-16 00:00:00	26
5238	Santa Salete	2018-06-16 00:00:00	26
5239	Santana da Ponte Pensa	2018-06-16 00:00:00	26
5240	Santana de Parnaíba	2018-06-16 00:00:00	26
5241	Santo Anastácio	2018-06-16 00:00:00	26
5242	Santo André	2018-06-16 00:00:00	26
5243	Santo Antônio da Alegria	2018-06-16 00:00:00	26
5244	Santo Antônio de Posse	2018-06-16 00:00:00	26
5245	Santo Antônio do Aracanguá	2018-06-16 00:00:00	26
5246	Santo Antônio do Jardim	2018-06-16 00:00:00	26
5247	Santo Antônio do Pinhal	2018-06-16 00:00:00	26
5248	Santo Expedito	2018-06-16 00:00:00	26
5249	Santópolis do Aguapeí	2018-06-16 00:00:00	26
5250	Santos	2018-06-16 00:00:00	26
5251	São Bento do Sapucaí	2018-06-16 00:00:00	26
5252	São Bernardo do Campo	2018-06-16 00:00:00	26
5253	São Caetano do Sul	2018-06-16 00:00:00	26
5254	São Carlos	2018-06-16 00:00:00	26
5255	São Francisco	2018-06-16 00:00:00	26
5256	São João da Boa Vista	2018-06-16 00:00:00	26
5257	São João das Duas Pontes	2018-06-16 00:00:00	26
5258	São João de Iracema	2018-06-16 00:00:00	26
5259	São João do Pau d`Alho	2018-06-16 00:00:00	26
5260	São Joaquim da Barra	2018-06-16 00:00:00	26
5261	São José da Bela Vista	2018-06-16 00:00:00	26
5262	São José do Barreiro	2018-06-16 00:00:00	26
5263	São José do Rio Pardo	2018-06-16 00:00:00	26
5264	São José do Rio Preto	2018-06-16 00:00:00	26
5265	São José dos Campos	2018-06-16 00:00:00	26
5266	São Lourenço da Serra	2018-06-16 00:00:00	26
5267	São Luís do Paraitinga	2018-06-16 00:00:00	26
5268	São Manuel	2018-06-16 00:00:00	26
5269	São Miguel Arcanjo	2018-06-16 00:00:00	26
5270	São Paulo	2018-06-16 00:00:00	26
5271	São Pedro	2018-06-16 00:00:00	26
5272	São Pedro do Turvo	2018-06-16 00:00:00	26
5273	São Roque	2018-06-16 00:00:00	26
5274	São Sebastião	2018-06-16 00:00:00	26
5275	São Sebastião da Grama	2018-06-16 00:00:00	26
5276	São Simão	2018-06-16 00:00:00	26
5277	São Vicente	2018-06-16 00:00:00	26
5278	Sarapuí	2018-06-16 00:00:00	26
5279	Sarutaiá	2018-06-16 00:00:00	26
5280	Sebastianópolis do Sul	2018-06-16 00:00:00	26
5281	Serra Azul	2018-06-16 00:00:00	26
5282	Serra Negra	2018-06-16 00:00:00	26
5283	Serrana	2018-06-16 00:00:00	26
5284	Sertãozinho	2018-06-16 00:00:00	26
5285	Sete Barras	2018-06-16 00:00:00	26
5286	Severínia	2018-06-16 00:00:00	26
5287	Silveiras	2018-06-16 00:00:00	26
5288	Socorro	2018-06-16 00:00:00	26
5289	Sorocaba	2018-06-16 00:00:00	26
5290	Sud Mennucci	2018-06-16 00:00:00	26
5291	Sumaré	2018-06-16 00:00:00	26
5292	Suzanápolis	2018-06-16 00:00:00	26
5293	Suzano	2018-06-16 00:00:00	26
5294	Tabapuã	2018-06-16 00:00:00	26
5295	Tabatinga	2018-06-16 00:00:00	26
5296	Taboão da Serra	2018-06-16 00:00:00	26
5297	Taciba	2018-06-16 00:00:00	26
5298	Taguaí	2018-06-16 00:00:00	26
5299	Taiaçu	2018-06-16 00:00:00	26
5300	Taiúva	2018-06-16 00:00:00	26
5301	Tambaú	2018-06-16 00:00:00	26
5302	Tanabi	2018-06-16 00:00:00	26
5303	Tapiraí	2018-06-16 00:00:00	26
5304	Tapiratiba	2018-06-16 00:00:00	26
5305	Taquaral	2018-06-16 00:00:00	26
5306	Taquaritinga	2018-06-16 00:00:00	26
5307	Taquarituba	2018-06-16 00:00:00	26
5308	Taquarivaí	2018-06-16 00:00:00	26
5309	Tarabai	2018-06-16 00:00:00	26
5310	Tarumã	2018-06-16 00:00:00	26
5311	Tatuí	2018-06-16 00:00:00	26
5312	Taubaté	2018-06-16 00:00:00	26
5313	Tejupá	2018-06-16 00:00:00	26
5314	Teodoro Sampaio	2018-06-16 00:00:00	26
5315	Terra Roxa	2018-06-16 00:00:00	26
5316	Tietê	2018-06-16 00:00:00	26
5317	Timburi	2018-06-16 00:00:00	26
5318	Torre de Pedra	2018-06-16 00:00:00	26
5319	Torrinha	2018-06-16 00:00:00	26
5320	Trabiju	2018-06-16 00:00:00	26
5321	Tremembé	2018-06-16 00:00:00	26
5322	Três Fronteiras	2018-06-16 00:00:00	26
5323	Tuiuti	2018-06-16 00:00:00	26
5324	Tupã	2018-06-16 00:00:00	26
5325	Tupi Paulista	2018-06-16 00:00:00	26
5326	Turiúba	2018-06-16 00:00:00	26
5327	Turmalina	2018-06-16 00:00:00	26
5328	Ubarana	2018-06-16 00:00:00	26
5329	Ubatuba	2018-06-16 00:00:00	26
5330	Ubirajara	2018-06-16 00:00:00	26
5331	Uchoa	2018-06-16 00:00:00	26
5332	União Paulista	2018-06-16 00:00:00	26
5333	Urânia	2018-06-16 00:00:00	26
5334	Uru	2018-06-16 00:00:00	26
5335	Urupês	2018-06-16 00:00:00	26
5336	Valentim Gentil	2018-06-16 00:00:00	26
5337	Valinhos	2018-06-16 00:00:00	26
5338	Valparaíso	2018-06-16 00:00:00	26
5339	Vargem	2018-06-16 00:00:00	26
5340	Vargem Grande do Sul	2018-06-16 00:00:00	26
5341	Vargem Grande Paulista	2018-06-16 00:00:00	26
5342	Várzea Paulista	2018-06-16 00:00:00	26
5343	Vera Cruz	2018-06-16 00:00:00	26
5344	Vinhedo	2018-06-16 00:00:00	26
5345	Viradouro	2018-06-16 00:00:00	26
5346	Vista Alegre do Alto	2018-06-16 00:00:00	26
5347	Vitória Brasil	2018-06-16 00:00:00	26
5348	Votorantim	2018-06-16 00:00:00	26
5349	Votuporanga	2018-06-16 00:00:00	26
5350	Zacarias	2018-06-16 00:00:00	26
5351	Amparo de São Francisco	2018-06-16 00:00:00	25
5352	Aquidabã	2018-06-16 00:00:00	25
5353	Aracaju	2018-06-16 00:00:00	25
5354	Arauá	2018-06-16 00:00:00	25
5355	Areia Branca	2018-06-16 00:00:00	25
5356	Barra dos Coqueiros	2018-06-16 00:00:00	25
5357	Boquim	2018-06-16 00:00:00	25
5358	Brejo Grande	2018-06-16 00:00:00	25
5359	Campo do Brito	2018-06-16 00:00:00	25
5360	Canhoba	2018-06-16 00:00:00	25
5361	Canindé de São Francisco	2018-06-16 00:00:00	25
5362	Capela	2018-06-16 00:00:00	25
5363	Carira	2018-06-16 00:00:00	25
5364	Carmópolis	2018-06-16 00:00:00	25
5365	Cedro de São João	2018-06-16 00:00:00	25
5366	Cristinápolis	2018-06-16 00:00:00	25
5367	Cumbe	2018-06-16 00:00:00	25
5368	Divina Pastora	2018-06-16 00:00:00	25
5369	Estância	2018-06-16 00:00:00	25
5370	Feira Nova	2018-06-16 00:00:00	25
5371	Frei Paulo	2018-06-16 00:00:00	25
5372	Gararu	2018-06-16 00:00:00	25
5373	General Maynard	2018-06-16 00:00:00	25
5374	Gracho Cardoso	2018-06-16 00:00:00	25
5375	Ilha das Flores	2018-06-16 00:00:00	25
5376	Indiaroba	2018-06-16 00:00:00	25
5377	Itabaiana	2018-06-16 00:00:00	25
5378	Itabaianinha	2018-06-16 00:00:00	25
5379	Itabi	2018-06-16 00:00:00	25
5380	Itaporanga d`Ajuda	2018-06-16 00:00:00	25
5381	Japaratuba	2018-06-16 00:00:00	25
5382	Japoatã	2018-06-16 00:00:00	25
5383	Lagarto	2018-06-16 00:00:00	25
5384	Laranjeiras	2018-06-16 00:00:00	25
5385	Macambira	2018-06-16 00:00:00	25
5386	Malhada dos Bois	2018-06-16 00:00:00	25
5387	Malhador	2018-06-16 00:00:00	25
5388	Maruim	2018-06-16 00:00:00	25
5389	Moita Bonita	2018-06-16 00:00:00	25
5390	Monte Alegre de Sergipe	2018-06-16 00:00:00	25
5391	Muribeca	2018-06-16 00:00:00	25
5392	Neópolis	2018-06-16 00:00:00	25
5393	Nossa Senhora Aparecida	2018-06-16 00:00:00	25
5394	Nossa Senhora da Glória	2018-06-16 00:00:00	25
5395	Nossa Senhora das Dores	2018-06-16 00:00:00	25
5396	Nossa Senhora de Lourdes	2018-06-16 00:00:00	25
5397	Nossa Senhora do Socorro	2018-06-16 00:00:00	25
5398	Pacatuba	2018-06-16 00:00:00	25
5399	Pedra Mole	2018-06-16 00:00:00	25
5400	Pedrinhas	2018-06-16 00:00:00	25
5401	Pinhão	2018-06-16 00:00:00	25
5402	Pirambu	2018-06-16 00:00:00	25
5403	Poço Redondo	2018-06-16 00:00:00	25
5404	Poço Verde	2018-06-16 00:00:00	25
5405	Porto da Folha	2018-06-16 00:00:00	25
5406	Propriá	2018-06-16 00:00:00	25
5407	Riachão do Dantas	2018-06-16 00:00:00	25
5408	Riachuelo	2018-06-16 00:00:00	25
5409	Ribeirópolis	2018-06-16 00:00:00	25
5410	Rosário do Catete	2018-06-16 00:00:00	25
5411	Salgado	2018-06-16 00:00:00	25
5412	Santa Luzia do Itanhy	2018-06-16 00:00:00	25
5413	Santa Rosa de Lima	2018-06-16 00:00:00	25
5414	Santana do São Francisco	2018-06-16 00:00:00	25
5415	Santo Amaro das Brotas	2018-06-16 00:00:00	25
5416	São Cristóvão	2018-06-16 00:00:00	25
5417	São Domingos	2018-06-16 00:00:00	25
5418	São Francisco	2018-06-16 00:00:00	25
5419	São Miguel do Aleixo	2018-06-16 00:00:00	25
5420	Simão Dias	2018-06-16 00:00:00	25
5421	Siriri	2018-06-16 00:00:00	25
5422	Telha	2018-06-16 00:00:00	25
5423	Tobias Barreto	2018-06-16 00:00:00	25
5424	Tomar do Geru	2018-06-16 00:00:00	25
5425	Umbaúba	2018-06-16 00:00:00	25
5426	Abreulândia	2018-06-16 00:00:00	27
5427	Aguiarnópolis	2018-06-16 00:00:00	27
5428	Aliança do Tocantins	2018-06-16 00:00:00	27
5429	Almas	2018-06-16 00:00:00	27
5430	Alvorada	2018-06-16 00:00:00	27
5431	Ananás	2018-06-16 00:00:00	27
5432	Angico	2018-06-16 00:00:00	27
5433	Aparecida do Rio Negro	2018-06-16 00:00:00	27
5434	Aragominas	2018-06-16 00:00:00	27
5435	Araguacema	2018-06-16 00:00:00	27
5436	Araguaçu	2018-06-16 00:00:00	27
5437	Araguaína	2018-06-16 00:00:00	27
5438	Araguanã	2018-06-16 00:00:00	27
5439	Araguatins	2018-06-16 00:00:00	27
5440	Arapoema	2018-06-16 00:00:00	27
5441	Arraias	2018-06-16 00:00:00	27
5442	Augustinópolis	2018-06-16 00:00:00	27
5443	Aurora do Tocantins	2018-06-16 00:00:00	27
5444	Axixá do Tocantins	2018-06-16 00:00:00	27
5445	Babaçulândia	2018-06-16 00:00:00	27
5446	Bandeirantes do Tocantins	2018-06-16 00:00:00	27
5447	Barra do Ouro	2018-06-16 00:00:00	27
5448	Barrolândia	2018-06-16 00:00:00	27
5449	Bernardo Sayão	2018-06-16 00:00:00	27
5450	Bom Jesus do Tocantins	2018-06-16 00:00:00	27
5451	Brasilândia do Tocantins	2018-06-16 00:00:00	27
5452	Brejinho de Nazaré	2018-06-16 00:00:00	27
5453	Buriti do Tocantins	2018-06-16 00:00:00	27
5454	Cachoeirinha	2018-06-16 00:00:00	27
5455	Campos Lindos	2018-06-16 00:00:00	27
5456	Cariri do Tocantins	2018-06-16 00:00:00	27
5457	Carmolândia	2018-06-16 00:00:00	27
5458	Carrasco Bonito	2018-06-16 00:00:00	27
5459	Caseara	2018-06-16 00:00:00	27
5460	Centenário	2018-06-16 00:00:00	27
5461	Chapada da Natividade	2018-06-16 00:00:00	27
5462	Chapada de Areia	2018-06-16 00:00:00	27
5463	Colinas do Tocantins	2018-06-16 00:00:00	27
5464	Colméia	2018-06-16 00:00:00	27
5465	Combinado	2018-06-16 00:00:00	27
5466	Conceição do Tocantins	2018-06-16 00:00:00	27
5467	Couto de Magalhães	2018-06-16 00:00:00	27
5468	Cristalândia	2018-06-16 00:00:00	27
5469	Crixás do Tocantins	2018-06-16 00:00:00	27
5470	Darcinópolis	2018-06-16 00:00:00	27
5471	Dianópolis	2018-06-16 00:00:00	27
5472	Divinópolis do Tocantins	2018-06-16 00:00:00	27
5473	Dois Irmãos do Tocantins	2018-06-16 00:00:00	27
5474	Dueré	2018-06-16 00:00:00	27
5475	Esperantina	2018-06-16 00:00:00	27
5476	Fátima	2018-06-16 00:00:00	27
5477	Figueirópolis	2018-06-16 00:00:00	27
5478	Filadélfia	2018-06-16 00:00:00	27
5479	Formoso do Araguaia	2018-06-16 00:00:00	27
5480	Fortaleza do Tabocão	2018-06-16 00:00:00	27
5481	Goianorte	2018-06-16 00:00:00	27
5482	Goiatins	2018-06-16 00:00:00	27
5483	Guaraí	2018-06-16 00:00:00	27
5484	Gurupi	2018-06-16 00:00:00	27
5485	Ipueiras	2018-06-16 00:00:00	27
5486	Itacajá	2018-06-16 00:00:00	27
5487	Itaguatins	2018-06-16 00:00:00	27
5488	Itapiratins	2018-06-16 00:00:00	27
5489	Itaporã do Tocantins	2018-06-16 00:00:00	27
5490	Jaú do Tocantins	2018-06-16 00:00:00	27
5491	Juarina	2018-06-16 00:00:00	27
5492	Lagoa da Confusão	2018-06-16 00:00:00	27
5493	Lagoa do Tocantins	2018-06-16 00:00:00	27
5494	Lajeado	2018-06-16 00:00:00	27
5495	Lavandeira	2018-06-16 00:00:00	27
5496	Lizarda	2018-06-16 00:00:00	27
5497	Luzinópolis	2018-06-16 00:00:00	27
5498	Marianópolis do Tocantins	2018-06-16 00:00:00	27
5499	Mateiros	2018-06-16 00:00:00	27
5500	Maurilândia do Tocantins	2018-06-16 00:00:00	27
5501	Miracema do Tocantins	2018-06-16 00:00:00	27
5502	Miranorte	2018-06-16 00:00:00	27
5503	Monte do Carmo	2018-06-16 00:00:00	27
5504	Monte Santo do Tocantins	2018-06-16 00:00:00	27
5505	Muricilândia	2018-06-16 00:00:00	27
5506	Natividade	2018-06-16 00:00:00	27
5507	Nazaré	2018-06-16 00:00:00	27
5508	Nova Olinda	2018-06-16 00:00:00	27
5509	Nova Rosalândia	2018-06-16 00:00:00	27
5510	Novo Acordo	2018-06-16 00:00:00	27
5511	Novo Alegre	2018-06-16 00:00:00	27
5512	Novo Jardim	2018-06-16 00:00:00	27
5513	Oliveira de Fátima	2018-06-16 00:00:00	27
5514	Palmas	2018-06-16 00:00:00	27
5515	Palmeirante	2018-06-16 00:00:00	27
5516	Palmeiras do Tocantins	2018-06-16 00:00:00	27
5517	Palmeirópolis	2018-06-16 00:00:00	27
5518	Paraíso do Tocantins	2018-06-16 00:00:00	27
5519	Paranã	2018-06-16 00:00:00	27
5520	Pau d`Arco	2018-06-16 00:00:00	27
5521	Pedro Afonso	2018-06-16 00:00:00	27
5522	Peixe	2018-06-16 00:00:00	27
5523	Pequizeiro	2018-06-16 00:00:00	27
5524	Pindorama do Tocantins	2018-06-16 00:00:00	27
5525	Piraquê	2018-06-16 00:00:00	27
5526	Pium	2018-06-16 00:00:00	27
5527	Ponte Alta do Bom Jesus	2018-06-16 00:00:00	27
5528	Ponte Alta do Tocantins	2018-06-16 00:00:00	27
5529	Porto Alegre do Tocantins	2018-06-16 00:00:00	27
5530	Porto Nacional	2018-06-16 00:00:00	27
5531	Praia Norte	2018-06-16 00:00:00	27
5532	Presidente Kennedy	2018-06-16 00:00:00	27
5533	Pugmil	2018-06-16 00:00:00	27
5534	Recursolândia	2018-06-16 00:00:00	27
5535	Riachinho	2018-06-16 00:00:00	27
5536	Rio da Conceição	2018-06-16 00:00:00	27
5537	Rio dos Bois	2018-06-16 00:00:00	27
5538	Rio Sono	2018-06-16 00:00:00	27
5539	Sampaio	2018-06-16 00:00:00	27
5540	Sandolândia	2018-06-16 00:00:00	27
5541	Santa Fé do Araguaia	2018-06-16 00:00:00	27
5542	Santa Maria do Tocantins	2018-06-16 00:00:00	27
5543	Santa Rita do Tocantins	2018-06-16 00:00:00	27
5544	Santa Rosa do Tocantins	2018-06-16 00:00:00	27
5545	Santa Tereza do Tocantins	2018-06-16 00:00:00	27
5546	Santa Terezinha do Tocantins	2018-06-16 00:00:00	27
5547	São Bento do Tocantins	2018-06-16 00:00:00	27
5548	São Félix do Tocantins	2018-06-16 00:00:00	27
5549	São Miguel do Tocantins	2018-06-16 00:00:00	27
5550	São Salvador do Tocantins	2018-06-16 00:00:00	27
5551	São Sebastião do Tocantins	2018-06-16 00:00:00	27
5552	São Valério da Natividade	2018-06-16 00:00:00	27
5553	Silvanópolis	2018-06-16 00:00:00	27
5554	Sítio Novo do Tocantins	2018-06-16 00:00:00	27
5555	Sucupira	2018-06-16 00:00:00	27
5556	Taguatinga	2018-06-16 00:00:00	27
5557	Taipas do Tocantins	2018-06-16 00:00:00	27
5558	Talismã	2018-06-16 00:00:00	27
5559	Tocantínia	2018-06-16 00:00:00	27
5560	Tocantinópolis	2018-06-16 00:00:00	27
5561	Tupirama	2018-06-16 00:00:00	27
5562	Tupiratins	2018-06-16 00:00:00	27
5563	Wanderlândia	2018-06-16 00:00:00	27
5564	Xambioá	2018-06-16 00:00:00	27
5575	Gama	2018-06-16 00:00:00	7
5576	Taguatinga	2018-06-16 00:00:00	7
5577	Brazlândia	2018-06-16 00:00:00	7
5578	Sobradinho	2018-06-16 00:00:00	7
5579	Planaltina	2018-06-16 00:00:00	7
5580	Paranoá	2018-06-16 00:00:00	7
5581	Núcleo Bandeirante	2018-06-16 00:00:00	7
5582	Ceilândia	2018-06-16 00:00:00	7
5583	Guará	2018-06-16 00:00:00	7
5584	Cruzeiro	2018-06-16 00:00:00	7
5585	Samambaia	2018-06-16 00:00:00	7
5586	Santa Maria	2018-06-16 00:00:00	7
5587	São Sebastião	2018-06-16 00:00:00	7
5589	Lago Sul	2018-06-16 00:00:00	7
5590	Riacho Fundo	2018-06-16 00:00:00	7
5591	Lago Norte	2018-06-16 00:00:00	7
5592	Candangolândia	2018-06-16 00:00:00	7
5593	Águas Claras	2018-06-16 00:00:00	7
5594	Riacho Fundo II	2018-06-16 00:00:00	7
5595	Sudoeste/Octogonal	2018-06-16 00:00:00	7
5596	Varjão	2018-06-16 00:00:00	7
5597	Park Way	2018-06-16 00:00:00	7
5598	SCIA	2018-06-16 00:00:00	7
5599	Sobradinho II	2018-06-16 00:00:00	7
5601	Itapoã	2018-06-16 00:00:00	7
5602	SIA	2018-06-16 00:00:00	7
5603	Vicente Pires	2018-06-16 00:00:00	7
5604	Fercal	2018-06-16 00:00:00	7
5574	Recanto das Emas	2018-06-16 00:00:00	7
5600	Jardim Botânico	2018-06-16 00:00:00	7
5605	Nazária	2018-06-16 00:00:00	17
5606	Paraíso das Águas	2018-06-16 00:00:00	12
5607	Pinto Bandeira	2018-06-16 00:00:00	23
5608	Balneário Rincão	2018-06-16 00:00:00	24
5609	Pescaria Brava	2018-06-16 00:00:00	24
5610	Exterior	2018-06-16 00:00:00	99
\.


--
-- Data for Name: consult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consult (date, history, payment_id, employee_id, exam_id, treatment_id, consult_id, report) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, country, country_pt, initial, last_update) FROM stdin;
1	Brazil	Brasil	BR	2018-06-16 00:00:00
2	Afghanistan	Afeganistão	AF	2018-06-16 00:00:00
3	Albania	Albânia, Republica da	AL	2018-06-16 00:00:00
4	Algeria	Argélia	DZ	2018-06-16 00:00:00
5	American Samoa	Samoa Americana	AS	2018-06-16 00:00:00
6	Andorra	Andorra	AD	2018-06-16 00:00:00
7	Angola	Angola	AO	2018-06-16 00:00:00
8	Anguilla	Anguilla	AI	2018-06-16 00:00:00
9	Antarctica	Antártida	AQ	2018-06-16 00:00:00
10	Antigua and Barbuda	Antigua e Barbuda	AG	2018-06-16 00:00:00
11	Argentina	Argentina	AR	2018-06-16 00:00:00
12	Armenia	Armênia, Republica da	AM	2018-06-16 00:00:00
13	Aruba	Aruba	AW	2018-06-16 00:00:00
14	Australia	Austrália	AU	2018-06-16 00:00:00
15	Austria	Áustria	AT	2018-06-16 00:00:00
16	Azerbaijan	Azerbaijão, Republica do	AZ	2018-06-16 00:00:00
17	Bahamas	Bahamas, Ilhas	BS	2018-06-16 00:00:00
18	Bahrain	Bahrein, Ilhas	BH	2018-06-16 00:00:00
19	Bangladesh	Bangladesh	BD	2018-06-16 00:00:00
20	Barbados	Barbados	BB	2018-06-16 00:00:00
21	Belarus	Belarus, Republica da	BY	2018-06-16 00:00:00
22	Belgium	Bélgica	BE	2018-06-16 00:00:00
23	Belize	Belize	BZ	2018-06-16 00:00:00
24	Benin	Benin	BJ	2018-06-16 00:00:00
25	Bermuda	Bermudas	BM	2018-06-16 00:00:00
26	Bhutan	Butão	BT	2018-06-16 00:00:00
27	Bolivia	Bolívia	BO	2018-06-16 00:00:00
28	Bosnia and Herzegowina	Bósnia-herzegovina (Republica da)	BA	2018-06-16 00:00:00
29	Botswana	Botsuana	BW	2018-06-16 00:00:00
30	Bouvet Island	Ilha Bouvet	BV	2018-06-16 00:00:00
31	British Indian Ocean Territory	Território Britânico do Oceano Indico	IO	2018-06-16 00:00:00
32	Brunei Darussalam	Brunei	BN	2018-06-16 00:00:00
33	Bulgaria	Bulgária, Republica da	BG	2018-06-16 00:00:00
34	Burkina Faso	Burkina Faso	BF	2018-06-16 00:00:00
35	Burundi	Burundi	BI	2018-06-16 00:00:00
36	Cambodia	Camboja	KH	2018-06-16 00:00:00
37	Cameroon	Camarões	CM	2018-06-16 00:00:00
38	Canada	Canada	CA	2018-06-16 00:00:00
39	Cape Verde	Cabo Verde, Republica de	CV	2018-06-16 00:00:00
40	Cayman Islands	Cayman, Ilhas	KY	2018-06-16 00:00:00
41	Central African Republic	Republica Centro-Africana	CF	2018-06-16 00:00:00
42	Chad	Chade	TD	2018-06-16 00:00:00
43	Chile	Chile	CL	2018-06-16 00:00:00
44	China	China, Republica Popular	CN	2018-06-16 00:00:00
45	Christmas Island	Christmas, Ilha (Navidad)	CX	2018-06-16 00:00:00
46	Cocos (Keeling) Islands	Cocos (Keeling,current_date), Ilhas	CC	2018-06-16 00:00:00
47	Colombia	Colômbia	CO	2018-06-16 00:00:00
48	Comoros	Comores, Ilhas	KM	2018-06-16 00:00:00
49	Congo	Congo	CG	2018-06-16 00:00:00
50	Congo, the Democratic Republic of the	Congo, Republica Democrática do	CD	2018-06-16 00:00:00
51	Cook Islands	Cook, Ilhas	CK	2018-06-16 00:00:00
52	Costa Rica	Costa Rica	CR	2018-06-16 00:00:00
53	Cote d`Ivoire	Costa do Marfim	CI	2018-06-16 00:00:00
54	Croatia (Hrvatska)	Croácia (Republica da)	HR	2018-06-16 00:00:00
55	Cuba	Cuba	CU	2018-06-16 00:00:00
56	Cyprus	Chipre	CY	2018-06-16 00:00:00
57	Czech Republic	Tcheca, Republica	CZ	2018-06-16 00:00:00
58	Denmark	Dinamarca	DK	2018-06-16 00:00:00
59	Djibouti	Djibuti	DJ	2018-06-16 00:00:00
60	Dominica	Dominica, Ilha	DM	2018-06-16 00:00:00
61	Dominican Republic	Republica Dominicana	DO	2018-06-16 00:00:00
62	East Timor	Timor Leste	TL	2018-06-16 00:00:00
63	Ecuador	Equador	EC	2018-06-16 00:00:00
64	Egypt	Egito	EG	2018-06-16 00:00:00
65	El Salvador	El Salvador	SV	2018-06-16 00:00:00
66	Equatorial Guinea	Guine-Equatorial	GQ	2018-06-16 00:00:00
67	Eritrea	Eritreia	ER	2018-06-16 00:00:00
68	Estonia	Estônia, Republica da	EE	2018-06-16 00:00:00
69	Ethiopia	Etiópia	ET	2018-06-16 00:00:00
70	Falkland Islands (Malvinas)	Falkland (Ilhas Malvinas)	FK	2018-06-16 00:00:00
71	Faroe Islands	Feroe, Ilhas	FO	2018-06-16 00:00:00
72	Fiji	Fiji	FJ	2018-06-16 00:00:00
73	Finland	Finlândia	FI	2018-06-16 00:00:00
74	France	Franca	FR	2018-06-16 00:00:00
76	French Guiana	Guiana francesa	GF	2018-06-16 00:00:00
77	French Polynesia	Polinésia Francesa	PF	2018-06-16 00:00:00
78	French Southern Territories	Terras Austrais e Antárticas Francesas	TF	2018-06-16 00:00:00
79	Gabon	Gabão	GA	2018-06-16 00:00:00
80	Gambia	Gambia	GM	2018-06-16 00:00:00
81	Georgia	Georgia, Republica da	GE	2018-06-16 00:00:00
82	Germany	Alemanha	DE	2018-06-16 00:00:00
83	Ghana	Gana	GH	2018-06-16 00:00:00
84	Gibraltar	Gibraltar	GI	2018-06-16 00:00:00
85	Greece	Grécia	GR	2018-06-16 00:00:00
86	Greenland	Groenlândia	GL	2018-06-16 00:00:00
87	Grenada	Granada	GD	2018-06-16 00:00:00
88	Guadeloupe	Guadalupe	GP	2018-06-16 00:00:00
89	Guam	Guam	GU	2018-06-16 00:00:00
90	Guatemala	Guatemala	GT	2018-06-16 00:00:00
91	Guinea	Guine	GN	2018-06-16 00:00:00
92	Guinea-Bissau	Guine-Bissau	GW	2018-06-16 00:00:00
93	Guyana	Guiana	GY	2018-06-16 00:00:00
94	Haiti	Haiti	HT	2018-06-16 00:00:00
95	Heard and Mc Donald Islands	Ilha Heard e Ilhas McDonald	HM	2018-06-16 00:00:00
96	Holy See (Vatican City State)	Vaticano, Estado da Cidade do	VA	2018-06-16 00:00:00
97	Honduras	Honduras	HN	2018-06-16 00:00:00
98	Hong Kong	Hong Kong	HK	2018-06-16 00:00:00
99	Hungary	Hungria, Republica da	HU	2018-06-16 00:00:00
100	Iceland	Islândia	IS	2018-06-16 00:00:00
101	India	Índia	IN	2018-06-16 00:00:00
102	Indonesia	Indonésia	ID	2018-06-16 00:00:00
103	Iran (Islamic Republic of)	Ira, Republica Islâmica do	IR	2018-06-16 00:00:00
104	Iraq	Iraque	IQ	2018-06-16 00:00:00
105	Ireland	Irlanda	IE	2018-06-16 00:00:00
106	Israel	Israel	IL	2018-06-16 00:00:00
107	Italy	Itália	IT	2018-06-16 00:00:00
108	Jamaica	Jamaica	JM	2018-06-16 00:00:00
109	Japan	Japão	JP	2018-06-16 00:00:00
110	Jordan	Jordânia	JO	2018-06-16 00:00:00
111	Kazakhstan	Cazaquistão, Republica do	KZ	2018-06-16 00:00:00
112	Kenya	Quênia	KE	2018-06-16 00:00:00
113	Kiribati	Kiribati	KI	2018-06-16 00:00:00
114	Korea, Democratic People`s Republic of	Coreia, Republica Popular Democrática da	KP	2018-06-16 00:00:00
115	Korea, Republic of	Coreia, Republica da	KR	2018-06-16 00:00:00
116	Kuwait	Coveite	KW	2018-06-16 00:00:00
117	Kyrgyzstan	Quirguiz, Republica	KG	2018-06-16 00:00:00
118	Lao People`s Democratic Republic	Laos, Republica Popular Democrática do	LA	2018-06-16 00:00:00
119	Latvia	Letônia, Republica da	LV	2018-06-16 00:00:00
120	Lebanon	Líbano	LB	2018-06-16 00:00:00
121	Lesotho	Lesoto	LS	2018-06-16 00:00:00
122	Liberia	Libéria	LR	2018-06-16 00:00:00
123	Libyan Arab Jamahiriya	Líbia	LY	2018-06-16 00:00:00
124	Liechtenstein	Liechtenstein	LI	2018-06-16 00:00:00
125	Lithuania	Lituânia, Republica da	LT	2018-06-16 00:00:00
126	Luxembourg	Luxemburgo	LU	2018-06-16 00:00:00
127	Macau	Macau	MO	2018-06-16 00:00:00
128	Macedonia, The Former Yugoslav Republic of	Macedônia, Antiga Republica Iugoslava	MK	2018-06-16 00:00:00
129	Madagascar	Madagascar	MG	2018-06-16 00:00:00
130	Malawi	Malavi	MW	2018-06-16 00:00:00
131	Malaysia	Malásia	MY	2018-06-16 00:00:00
132	Maldives	Maldivas	MV	2018-06-16 00:00:00
133	Mali	Mali	ML	2018-06-16 00:00:00
134	Malta	Malta	MT	2018-06-16 00:00:00
135	Marshall Islands	Marshall, Ilhas	MH	2018-06-16 00:00:00
136	Martinique	Martinica	MQ	2018-06-16 00:00:00
137	Mauritania	Mauritânia	MR	2018-06-16 00:00:00
138	Mauritius	Mauricio	MU	2018-06-16 00:00:00
139	Mayotte	Mayotte (Ilhas Francesas)	YT	2018-06-16 00:00:00
140	Mexico	México	MX	2018-06-16 00:00:00
141	Micronesia, Federated States of	Micronesia	FM	2018-06-16 00:00:00
142	Moldova, Republic of	Moldávia, Republica da	MD	2018-06-16 00:00:00
143	Monaco	Mônaco	MC	2018-06-16 00:00:00
144	Mongolia	Mongólia	MN	2018-06-16 00:00:00
145	Montserrat	Montserrat, Ilhas	MS	2018-06-16 00:00:00
146	Morocco	Marrocos	MA	2018-06-16 00:00:00
147	Mozambique	Moçambique	MZ	2018-06-16 00:00:00
148	Myanmar	Mianmar (Birmânia)	MM	2018-06-16 00:00:00
149	Namibia	Namíbia	NA	2018-06-16 00:00:00
150	Nauru	Nauru	NR	2018-06-16 00:00:00
151	Nepal	Nepal	NP	2018-06-16 00:00:00
152	Netherlands	Países Baixos (Holanda)	NL	2018-06-16 00:00:00
153	Netherlands Antilles	Antilhas Holandesas	AN	2018-06-16 00:00:00
154	New Caledonia	Nova Caledonia	NC	2018-06-16 00:00:00
155	New Zealand	Nova Zelândia	NZ	2018-06-16 00:00:00
156	Nicaragua	Nicarágua	NI	2018-06-16 00:00:00
157	Niger	Níger	NE	2018-06-16 00:00:00
158	Nigeria	Nigéria	NG	2018-06-16 00:00:00
159	Niue	Niue, Ilha	NU	2018-06-16 00:00:00
160	Norfolk Island	Norfolk, Ilha	NF	2018-06-16 00:00:00
161	Northern Mariana Islands	Marianas do Norte	MP	2018-06-16 00:00:00
162	Norway	Noruega	NO	2018-06-16 00:00:00
163	Oman	Oma	OM	2018-06-16 00:00:00
164	Pakistan	Paquistão	PK	2018-06-16 00:00:00
165	Palau	Palau	PW	2018-06-16 00:00:00
166	Panama	Panamá	PA	2018-06-16 00:00:00
167	Papua New Guinea	Papua Nova Guine	PG	2018-06-16 00:00:00
168	Paraguay	Paraguai	PY	2018-06-16 00:00:00
169	Peru	Peru	PE	2018-06-16 00:00:00
170	Philippines	Filipinas	PH	2018-06-16 00:00:00
171	Pitcairn	Pitcairn, Ilha	PN	2018-06-16 00:00:00
172	Poland	Polônia, Republica da	PL	2018-06-16 00:00:00
173	Portugal	Portugal	PT	2018-06-16 00:00:00
174	Puerto Rico	Porto Rico	PR	2018-06-16 00:00:00
175	Qatar	Catar	QA	2018-06-16 00:00:00
176	Reunion	Reunião, Ilha	RE	2018-06-16 00:00:00
177	Romania	Romênia	RO	2018-06-16 00:00:00
178	Russian Federation	Rússia, Federação da	RU	2018-06-16 00:00:00
179	Rwanda	Ruanda	RW	2018-06-16 00:00:00
180	Saint Kitts and Nevis	São Cristovão e Neves, Ilhas	KN	2018-06-16 00:00:00
181	Saint LUCIA	Santa Lucia	LC	2018-06-16 00:00:00
182	Saint Vincent and the Grenadines	São Vicente e Granadinas	VC	2018-06-16 00:00:00
183	Samoa	Samoa	WS	2018-06-16 00:00:00
184	San Marino	San Marino	SM	2018-06-16 00:00:00
185	Sao Tome and Principe	São Tome e Príncipe, Ilhas	ST	2018-06-16 00:00:00
186	Saudi Arabia	Arábia Saudita	SA	2018-06-16 00:00:00
187	Senegal	Senegal	SN	2018-06-16 00:00:00
188	Seychelles	Seychelles	SC	2018-06-16 00:00:00
189	Sierra Leone	Serra Leoa	SL	2018-06-16 00:00:00
190	Singapore	Cingapura	SG	2018-06-16 00:00:00
191	Slovakia (Slovak Republic)	Eslovaca, Republica	SK	2018-06-16 00:00:00
192	Slovenia	Eslovênia, Republica da	SI	2018-06-16 00:00:00
193	Solomon Islands	Salomão, Ilhas	SB	2018-06-16 00:00:00
194	Somalia	Somalia	SO	2018-06-16 00:00:00
195	South Africa	África do Sul	ZA	2018-06-16 00:00:00
196	South Georgia and the South Sandwich Islands	Ilhas Geórgia do Sul e Sandwich do Sul	GS	2018-06-16 00:00:00
197	Spain	Espanha	ES	2018-06-16 00:00:00
198	Sri Lanka	Sri Lanka	LK	2018-06-16 00:00:00
199	St. Helena	Santa Helena	SH	2018-06-16 00:00:00
200	St. Pierre and Miquelon	São Pedro e Miquelon	PM	2018-06-16 00:00:00
201	Sudan	Sudão	SD	2018-06-16 00:00:00
202	Suriname	Suriname	SR	2018-06-16 00:00:00
203	Svalbard and Jan Mayen Islands	Svalbard e Jan Mayen	SJ	2018-06-16 00:00:00
204	Swaziland	Suazilândia	SZ	2018-06-16 00:00:00
205	Sweden	Suécia	SE	2018-06-16 00:00:00
206	Switzerland	Suíça	CH	2018-06-16 00:00:00
207	Syrian Arab Republic	Síria, Republica Árabe da	SY	2018-06-16 00:00:00
208	Taiwan, Province of China	Formosa (Taiwan)	TW	2018-06-16 00:00:00
209	Tajikistan	Tadjiquistao, Republica do	TJ	2018-06-16 00:00:00
210	Tanzania, United Republic of	Tanzânia, Republica Unida da	TZ	2018-06-16 00:00:00
211	Thailand	Tailândia	TH	2018-06-16 00:00:00
212	Togo	Togo	TG	2018-06-16 00:00:00
213	Tokelau	Toquelau, Ilhas	TK	2018-06-16 00:00:00
214	Tonga	Tonga	TO	2018-06-16 00:00:00
215	Trinidad and Tobago	Trinidad e Tobago	TT	2018-06-16 00:00:00
216	Tunisia	Tunísia	TN	2018-06-16 00:00:00
217	Turkey	Turquia	TR	2018-06-16 00:00:00
218	Turkmenistan	Turcomenistão, Republica do	TM	2018-06-16 00:00:00
219	Turks and Caicos Islands	Turcas e Caicos, Ilhas	TC	2018-06-16 00:00:00
220	Tuvalu	Tuvalu	TV	2018-06-16 00:00:00
221	Uganda	Uganda	UG	2018-06-16 00:00:00
222	Ukraine	Ucrânia	UA	2018-06-16 00:00:00
223	United Arab Emirates	Emirados Árabes Unidos	AE	2018-06-16 00:00:00
224	United Kingdom	Reino Unido	GB	2018-06-16 00:00:00
225	United States	Estados Unidos	US	2018-06-16 00:00:00
226	United States Minor Outlying Islands	Ilhas Menores Distantes dos Estados Unidos	UM	2018-06-16 00:00:00
227	Uruguay	Uruguai	UY	2018-06-16 00:00:00
228	Uzbekistan	Uzbequistão, Republica do	UZ	2018-06-16 00:00:00
229	Vanuatu	Vanuatu	VU	2018-06-16 00:00:00
230	Venezuela	Venezuela	VE	2018-06-16 00:00:00
231	Viet Nam	Vietnã	VN	2018-06-16 00:00:00
232	Virgin Islands (British)	Virgens, Ilhas (Britânicas)	VG	2018-06-16 00:00:00
233	Virgin Islands (U.S.)	Virgens, Ilhas (E.U.A.)	VI	2018-06-16 00:00:00
234	Wallis and Futuna Islands	Wallis e Futuna, Ilhas	WF	2018-06-16 00:00:00
235	Western Sahara	Saara Ocidental	EH	2018-06-16 00:00:00
236	Yemen	Iémen	YE	2018-06-16 00:00:00
237	Yugoslavia	Iugoslávia, República Fed. da	YU	2018-06-16 00:00:00
238	Zambia	Zâmbia	ZM	2018-06-16 00:00:00
239	Zimbabwe	Zimbabue	ZW	2018-06-16 00:00:00
240	Bailiwick of Guernsey	Guernsey, Ilha do Canal (Inclui Alderney e Sark)	GG	2018-06-16 00:00:00
241	Bailiwick of Jersey	Jersey, Ilha do Canal	JE	2018-06-16 00:00:00
242	Canarias	Canarias, Ilhas	\N	2018-06-16 00:00:00
243	Isle of Man	Man, Ilha de	IM	2018-06-16 00:00:00
244	Johnston Atoll	Johnston, Ilhas	\N	2018-06-16 00:00:00
245	Madeira	Madeira, Ilha da	\N	2018-06-16 00:00:00
246	Crna Gora (Montenegro)	Montenegro	ME	2018-06-16 00:00:00
247	SÉRVIA	Republika Srbija	RS	2018-06-16 00:00:00
248	Republic of South Sudan	Sudao do Sul	SS	2018-06-16 00:00:00
249	Zona del Canal de Panamá	Zona do Canal do Panamá	\N	2018-06-16 00:00:00
250	Wake	Wake, Ilha	\N	2018-06-16 00:00:00
251	Labuan	Lebuan, Ilhas	\N	2018-06-16 00:00:00
252	Dawlat Filasṭīn	Palestina	PS	2018-06-16 00:00:00
253	Åland Islands	Ilhas de Aland	AX	2018-06-16 00:00:00
254	Saint Barthélemy	Coletividade de São Bartolomeu	BL	2018-06-16 00:00:00
255	Curaçao	Curaçao	CW	2018-06-16 00:00:00
256	Saint Martin	Ilha de São Martinho (França)	MF	2018-06-16 00:00:00
257	Sint Maarten (Dutch part)	São Martinho (Países Baixos)	SX	2018-06-16 00:00:00
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (first_name, last_name, sex, address_id, mail, date, salary, specialty, create_date, active, password, employee_id) FROM stdin;
admin		Z	1	admin@admin.com	2018-12-31	0		2018-06-17	t	admin	2
\.


--
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam (type, description, exam_id) FROM stdin;
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (first_name, last_name, sex, address_id, mail, date, create_date, active, patient_id) FROM stdin;
Pedro	Bernardi	M	1	pedro#gmail.com	2018-07-21	2018-06-17	t	1
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (amount, payment_date, payment_id) FROM stdin;
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state (state_id, state, uf, ibge, country_id, last_update) FROM stdin;
1	Acre	AC	12	1	2018-06-16 00:00:00
2	Alagoas	AL	27	1	2018-06-16 00:00:00
3	Amazonas	AM	13	1	2018-06-16 00:00:00
4	Amapá	AP	16	1	2018-06-16 00:00:00
5	Bahia	BA	29	1	2018-06-16 00:00:00
6	Ceará	CE	23	1	2018-06-16 00:00:00
7	Distrito Federal	DF	53	1	2018-06-16 00:00:00
8	Espírito Santo	ES	32	1	2018-06-16 00:00:00
9	Goiás	GO	52	1	2018-06-16 00:00:00
10	Maranhão	MA	21	1	2018-06-16 00:00:00
11	Minas Gerais	MG	31	1	2018-06-16 00:00:00
12	Mato Grosso do Sul	MS	50	1	2018-06-16 00:00:00
13	Mato Grosso	MT	51	1	2018-06-16 00:00:00
14	Pará	PA	15	1	2018-06-16 00:00:00
15	Paraíba	PB	25	1	2018-06-16 00:00:00
16	Pernambuco	PE	26	1	2018-06-16 00:00:00
17	Piauí	PI	22	1	2018-06-16 00:00:00
18	Paraná	PR	41	1	2018-06-16 00:00:00
19	Rio de Janeiro	RJ	33	1	2018-06-16 00:00:00
20	Rio Grande do Norte	RN	24	1	2018-06-16 00:00:00
21	Rondônia	RO	11	1	2018-06-16 00:00:00
22	Roraima	RR	14	1	2018-06-16 00:00:00
23	Rio Grande do Sul	RS	43	1	2018-06-16 00:00:00
24	Santa Catarina	SC	42	1	2018-06-16 00:00:00
25	Sergipe	SE	28	1	2018-06-16 00:00:00
26	São Paulo	SP	35	1	2018-06-16 00:00:00
27	Tocantins	TO	17	1	2018-06-16 00:00:00
99	Exterior	EX	99	\N	2018-06-16 00:00:00
\.


--
-- Data for Name: treatment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment (date_start, date_end, patient_id, treatment_id, description) FROM stdin;
2018-06-17	2018-06-29	1	3	Tratamento Especifico
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 1, true);


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);


--
-- Name: consult_consult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consult_consult_id_seq', 1, false);


--
-- Name: consult_consult_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consult_consult_id_seq1', 1, false);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 1, false);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 2, true);


--
-- Name: exam_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_exam_id_seq', 1, false);


--
-- Name: patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_patient_id_seq', 1, true);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: state_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.state_state_id_seq', 1, false);


--
-- Name: treatment_treatment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treatment_treatment_id_seq', 3, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- Name: consult consult_consult_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consult
    ADD CONSTRAINT consult_consult_id_pk PRIMARY KEY (consult_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: employee employee_employee_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_employee_id_pk PRIMARY KEY (employee_id);


--
-- Name: exam exam_exam_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_exam_id_pk PRIMARY KEY (exam_id);


--
-- Name: patient patient_patient_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_patient_id_pk PRIMARY KEY (patient_id);


--
-- Name: payment payment_payment_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_id_pk PRIMARY KEY (payment_id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (state_id);


--
-- Name: treatment treatment_treatment_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment
    ADD CONSTRAINT treatment_treatment_id_pk PRIMARY KEY (treatment_id);


--
-- Name: country_country_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX country_country_uindex ON public.country USING btree (country);


--
-- Name: address address_city_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_city_city_id_fk FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: city city_state_state_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_state_state_id_fk FOREIGN KEY (state_id) REFERENCES public.state(state_id);


--
-- Name: consult consult_employee_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consult
    ADD CONSTRAINT consult_employee_employee_id_fk FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: consult consult_exam_exam_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consult
    ADD CONSTRAINT consult_exam_exam_id_fk FOREIGN KEY (exam_id) REFERENCES public.exam(exam_id);


--
-- Name: consult consult_payment_payment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consult
    ADD CONSTRAINT consult_payment_payment_id_fk FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);


--
-- Name: consult consult_treatment_treatment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consult
    ADD CONSTRAINT consult_treatment_treatment_id_fk FOREIGN KEY (treatment_id) REFERENCES public.treatment(treatment_id);


--
-- Name: employee employee_address_address_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_address_address_id_fk FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: patient patient_address_address_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_address_address_id_fk FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: state state_country_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_country_country_id_fk FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: treatment treatment_patient_patient_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment
    ADD CONSTRAINT treatment_patient_patient_id_fk FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- PostgreSQL database dump complete
--

