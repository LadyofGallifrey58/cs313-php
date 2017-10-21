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
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE books (
    book_id integer NOT NULL,
    book_name character varying NOT NULL,
    price money NOT NULL,
    author character varying NOT NULL,
    release_date date
);


ALTER TABLE books OWNER TO postgres;

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
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books (book_id, book_name, price, author, release_date) FROM stdin;
1	Peter Pan	$14.99	J. M. Barrie	1911-10-11
2	Alice in Wonderland	$14.99	Lewis Carroll	1865-11-26
3	Harry Potter and the Sorcerer's Stone	$17.99	J. K. Rowling	1997-06-26
4	Twilight	$9.99	Stephanie Meyer	2005-10-05
5	The Wonderful Wizard of Oz	$150.00	L. Frank Baum	1900-05-17
6	The Hobbit	$11.99	J. R. R. Tolkien	1937-09-21
7	X-Men #101	$163.00	Stan Lee & Jack Kirby/ Chris Claremont	1976-10-10
8	Summer Falls	$9.99	Amelia Williams/ James Goss	2013-10-22
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_book_id_seq', 8, true);


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

