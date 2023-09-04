--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-09-02 20:07:08

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
-- TOC entry 228 (class 1255 OID 16662)
-- Name: inu(integer, character varying, character varying, character varying, text, character varying, boolean, timestamp without time zone, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.inu(IN uid integer, IN fname character varying, IN lname character varying, IN uname character varying, IN pass text, IN em character varying, IN isact boolean, IN cat timestamp without time zone, IN cby integer, IN r integer)
    LANGUAGE plpgsql
    AS $$
begin
   insert into users (userid,firstname,lastname,username,pass_word,email,isactive,
					 createdat,createdby,role)
					 values(uID,fname,lname,uname,pass,em,isact,cat,cby,r);

    commit;
end;$$;


ALTER PROCEDURE public.inu(IN uid integer, IN fname character varying, IN lname character varying, IN uname character varying, IN pass text, IN em character varying, IN isact boolean, IN cat timestamp without time zone, IN cby integer, IN r integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16618)
-- Name: event_enrolements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_enrolements (
    sno integer NOT NULL,
    userid integer,
    eventid integer
);


ALTER TABLE public.event_enrolements OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16617)
-- Name: event_enrolements_sno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_enrolements_sno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_enrolements_sno_seq OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrolements_sno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_enrolements_sno_seq OWNED BY public.event_enrolements.sno;

--
-- TOC entry 215 (class 1259 OID 16475)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    eventid integer NOT NULL,
    eventname character varying(30),
    presenter character varying(30),
    date_of_event date,
    time_of_commencement time without time zone,
    duraton character varying(20),
    no_of_enrolements integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16474)
-- Name: events_eventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_eventid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_eventid_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 214
-- Name: events_eventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_eventid_seq OWNED BY public.events.eventid;


--
-- TOC entry 221 (class 1259 OID 16635)
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    feedbackid integer NOT NULL,
    feedback text,
    userid integer,
    eventid integer
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16634)
-- Name: feedbacks_feedbackid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedbacks_feedbackid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_feedbackid_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: feedbacks_feedbackid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedbacks_feedbackid_seq OWNED BY public.feedbacks.feedbackid;


--
-- TOC entry 223 (class 1259 OID 16664)
-- Name: presenter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presenter (
    presenterid integer NOT NULL,
    no_of_sessions_taken integer,
    last_session date,
    rating numeric,
    firstname character varying(30),
    lastname character varying(30),
    email character varying(30),
    _domain character varying(30)
);


ALTER TABLE public.presenter OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16663)
-- Name: presenter_presenterid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presenter_presenterid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presenter_presenterid_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 222
-- Name: presenter_presenterid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presenter_presenterid_seq OWNED BY public.presenter.presenterid;


--
-- TOC entry 227 (class 1259 OID 16683)
-- Name: recipients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipients (
    recipientid integer NOT NULL,
    enrolled_in integer
);


ALTER TABLE public.recipients OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16682)
-- Name: recipients_recipientid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipients_recipientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipients_recipientid_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipients_recipientid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipients_recipientid_seq OWNED BY public.recipients.recipientid;


--
-- TOC entry 225 (class 1259 OID 16674)
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    courseid integer NOT NULL,
    coursename character varying(30),
    rating numeric
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16673)
-- Name: topics_courseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_courseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_courseid_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 224
-- Name: topics_courseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_courseid_seq OWNED BY public.topics.courseid;


--
-- TOC entry 217 (class 1259 OID 16529)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    firstname character varying(30),
    lastname character varying(30),
    username character varying(30),
    pass_word text,
    email character varying(30),
    isactive boolean,
    createdat timestamp without time zone,
    createdby integer,
    role integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16528)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 3206 (class 2604 OID 16621)
-- Name: event_enrolements sno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrolements ALTER COLUMN sno SET DEFAULT nextval('public.event_enrolements_sno_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 16478)
-- Name: events eventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN eventid SET DEFAULT nextval('public.events_eventid_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 16638)
-- Name: feedbacks feedbackid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN feedbackid SET DEFAULT nextval('public.feedbacks_feedbackid_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 16667)
-- Name: presenter presenterid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenter ALTER COLUMN presenterid SET DEFAULT nextval('public.presenter_presenterid_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16686)
-- Name: recipients recipientid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipients ALTER COLUMN recipientid SET DEFAULT nextval('public.recipients_recipientid_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 16677)
-- Name: topics courseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN courseid SET DEFAULT nextval('public.topics_courseid_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 16532)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 3377 (class 0 OID 16618)
-- Dependencies: 219
-- Data for Name: event_enrolements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_enrolements (sno, userid, eventid) FROM stdin;
\.


--
-- TOC entry 3373 (class 0 OID 16475)
-- Dependencies: 215
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (eventid, eventname, presenter, date_of_event, time_of_commencement, duraton, no_of_enrolements) FROM stdin;
\.


--
-- TOC entry 3379 (class 0 OID 16635)
-- Dependencies: 221
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (feedbackid, feedback, userid, eventid) FROM stdin;
\.


--
-- TOC entry 3381 (class 0 OID 16664)
-- Dependencies: 223
-- Data for Name: presenter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presenter (presenterid, no_of_sessions_taken, last_session, rating, firstname, lastname, email, _domain) FROM stdin;
\.


--
-- TOC entry 3385 (class 0 OID 16683)
-- Dependencies: 227
-- Data for Name: recipients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipients (recipientid, enrolled_in) FROM stdin;
\.


--
-- TOC entry 3383 (class 0 OID 16674)
-- Dependencies: 225
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (courseid, coursename, rating) FROM stdin;
\.


--
-- TOC entry 3375 (class 0 OID 16529)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, firstname, lastname, username, pass_word, email, isactive, createdat, createdby, role) FROM stdin;
1	harry	potter	hpotter	wiefbwief	harryp@gmail.com	t	2021-12-12 09:10:15	4	0
\.


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrolements_sno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_enrolements_sno_seq', 1, false);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 214
-- Name: events_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_eventid_seq', 1, false);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 220
-- Name: feedbacks_feedbackid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedbacks_feedbackid_seq', 1, false);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 222
-- Name: presenter_presenterid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presenter_presenterid_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 226
-- Name: recipients_recipientid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipients_recipientid_seq', 1, false);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 224
-- Name: topics_courseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_courseid_seq', 1, false);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 1, false);


--
-- TOC entry 3216 (class 2606 OID 16623)
-- Name: event_enrolements event_enrolements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrolements
    ADD CONSTRAINT event_enrolements_pkey PRIMARY KEY (sno);


--
-- TOC entry 3212 (class 2606 OID 16480)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);


--
-- TOC entry 3218 (class 2606 OID 16642)
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (feedbackid);


--
-- TOC entry 3220 (class 2606 OID 16671)
-- Name: presenter presenter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenter
    ADD CONSTRAINT presenter_pkey PRIMARY KEY (presenterid);


--
-- TOC entry 3224 (class 2606 OID 16688)
-- Name: recipients recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipients
    ADD CONSTRAINT recipients_pkey PRIMARY KEY (recipientid);


--
-- TOC entry 3222 (class 2606 OID 16681)
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (courseid);


--
-- TOC entry 3214 (class 2606 OID 16536)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3225 (class 2606 OID 16629)
-- Name: event_enrolements event_enrolements_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrolements
    ADD CONSTRAINT event_enrolements_eventid_fkey FOREIGN KEY (eventid) REFERENCES public.events(eventid);


--
-- TOC entry 3226 (class 2606 OID 16624)
-- Name: event_enrolements event_enrolements_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrolements
    ADD CONSTRAINT event_enrolements_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3227 (class 2606 OID 16648)
-- Name: feedbacks feedbacks_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_eventid_fkey FOREIGN KEY (eventid) REFERENCES public.events(eventid);


--
-- TOC entry 3228 (class 2606 OID 16643)
-- Name: feedbacks feedbacks_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3229 (class 2606 OID 16689)
-- Name: recipients recipients_enrolled_in_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipients
    ADD CONSTRAINT recipients_enrolled_in_fkey FOREIGN KEY (enrolled_in) REFERENCES public.events(eventid);


-- Completed on 2023-09-02 20:07:09

--
-- PostgreSQL database dump complete
--

