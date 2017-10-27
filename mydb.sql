--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE accounts (
    account_id integer NOT NULL,
    name character varying NOT NULL,
    password character varying NOT NULL,
    email character varying NOT NULL,
    security_q numeric(10,0) NOT NULL,
    security_a character varying NOT NULL,
    financial_info bigint
);


ALTER TABLE accounts OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_account_id_seq OWNED BY accounts.account_id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE addresses (
    address_id integer NOT NULL,
    street_address character varying NOT NULL,
    city character varying NOT NULL,
    state character varying(2) NOT NULL,
    zip_code numeric(5,0)
);


ALTER TABLE addresses OWNER TO postgres;

--
-- Name: addresses_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE addresses_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_address_id_seq OWNER TO postgres;

--
-- Name: addresses_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE addresses_address_id_seq OWNED BY addresses.address_id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authors (
    authors_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    middle_name character varying
);


ALTER TABLE authors OWNER TO postgres;

--
-- Name: authors_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authors_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_authors_id_seq OWNER TO postgres;

--
-- Name: authors_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authors_authors_id_seq OWNED BY authors.authors_id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE books (
    book_id integer NOT NULL,
    book_name character varying NOT NULL,
    price money NOT NULL,
    release_date date
);


ALTER TABLE books OWNER TO postgres;

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE books_authors (
    book_id bigint NOT NULL,
    author_id bigint NOT NULL
);


ALTER TABLE books_authors OWNER TO postgres;

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_book_id_seq OWNER TO postgres;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE books_book_id_seq OWNED BY books.book_id;


--
-- Name: financial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE financial (
    financial_id integer NOT NULL,
    credit_card numeric(16,0),
    shipping_address bigint NOT NULL,
    billing_address bigint NOT NULL,
    name character varying NOT NULL,
    exp_date date NOT NULL
);


ALTER TABLE financial OWNER TO postgres;

--
-- Name: financial_financial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE financial_financial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financial_financial_id_seq OWNER TO postgres;

--
-- Name: financial_financial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE financial_financial_id_seq OWNED BY financial.financial_id;


--
-- Name: accounts account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts ALTER COLUMN account_id SET DEFAULT nextval('accounts_account_id_seq'::regclass);


--
-- Name: addresses address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses ALTER COLUMN address_id SET DEFAULT nextval('addresses_address_id_seq'::regclass);


--
-- Name: authors authors_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authors ALTER COLUMN authors_id SET DEFAULT nextval('authors_authors_id_seq'::regclass);


--
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books ALTER COLUMN book_id SET DEFAULT nextval('books_book_id_seq'::regclass);


--
-- Name: financial financial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial ALTER COLUMN financial_id SET DEFAULT nextval('financial_financial_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts (account_id, name, password, email, security_q, security_a, financial_info) FROM stdin;
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_account_id_seq', 1, false);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY addresses (address_id, street_address, city, state, zip_code) FROM stdin;
1	11038 Victory Ave.	Oakdale	CA	95361
2	2754 Topeka St.	Riverbank	CA	95367
3	1313 Disneyland Dr.	Anaheim	CA	92802
4	3501 McHenry Ave.	Modesto	CA	95356
\.


--
-- Name: addresses_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('addresses_address_id_seq', 4, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authors (authors_id, first_name, last_name, middle_name) FROM stdin;
1	Lewis	Carroll	\N
2	Stephanie	Meyer	\N
3	Stan	Lee	\N
4	Jack	Kirby	\N
5	Chris	Claremont	\N
6	Amelia	Williams	\N
7	James	Goss	\N
8	J.	Barrie	M.
9	L.	Baum	Frank
10	J.	Tolkien	R. R.
11	J.	Rowling	K.
\.


--
-- Name: authors_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authors_authors_id_seq', 11, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books (book_id, book_name, price, release_date) FROM stdin;
1	Peter Pan	$14.99	1911-10-11
4	Twilight	$9.99	2005-10-05
5	The Wonderful Wizard of Oz	$150.00	1900-05-17
6	The Hobbit	$11.99	1937-09-21
7	X-Men #101	$163.00	1976-10-10
8	Summer Falls	$9.99	2013-10-22
3	Harry Potter and the Sorcerer's Stone	$17.99	1997-06-26
9	Harry Potter and the Chamber of Secrets	$17.99	1998-07-02
10	Harry Potter and the Prisoner of Azkaban	$17.99	1999-07-08
11	Harry Potter and the Goblet of Fire	$17.99	2000-07-08
12	Harry Potter and the Order of the Phoenix	$17.99	2003-06-21
13	Harry Potter and the Half-Blood Prince	$17.99	2005-07-16
14	Harry Potter and the Deathly Hallows	$17.99	2007-07-21
2	Alice's Adventures in Wonderland	$14.99	1865-11-26
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books_authors (book_id, author_id) FROM stdin;
1	8
2	1
4	2
5	9
6	10
7	3
7	4
7	5
8	6
8	7
3	11
9	11
10	11
11	11
12	11
13	11
14	11
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_book_id_seq', 14, true);


--
-- Data for Name: financial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY financial (financial_id, credit_card, shipping_address, billing_address, name, exp_date) FROM stdin;
\.


--
-- Name: financial_financial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('financial_financial_id_seq', 1, false);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: financial financial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial
    ADD CONSTRAINT financial_pkey PRIMARY KEY (financial_id);


--
-- Name: accounts accounts_financial_info_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_financial_info_fkey FOREIGN KEY (financial_info) REFERENCES financial(financial_id);


--
-- Name: financial financial_billing_address_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial
    ADD CONSTRAINT financial_billing_address_fkey FOREIGN KEY (billing_address) REFERENCES addresses(address_id);


--
-- Name: financial financial_shipping_address_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY financial
    ADD CONSTRAINT financial_shipping_address_fkey FOREIGN KEY (shipping_address) REFERENCES addresses(address_id);


--
-- PostgreSQL database dump complete
--

