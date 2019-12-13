--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    channel_id integer NOT NULL,
    channel_title character varying
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    country_name character varying(10)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: publish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publish (
    publish_id integer NOT NULL,
    publish_date date
);


ALTER TABLE public.publish OWNER TO postgres;

--
-- Name: trend; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trend (
    trend_id integer NOT NULL,
    trending_date date
);


ALTER TABLE public.trend OWNER TO postgres;

--
-- Name: video_basic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video_basic (
    id integer NOT NULL,
    trend_id integer,
    title character varying,
    channel_id integer,
    category_id integer,
    publish_id integer,
    views integer,
    likes integer
);


ALTER TABLE public.video_basic OWNER TO postgres;

--
-- Name: video_basic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.video_basic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_basic_id_seq OWNER TO postgres;

--
-- Name: video_basic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.video_basic_id_seq OWNED BY public.video_basic.id;


--
-- Name: video_stat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video_stat (
    id integer NOT NULL,
    video_id character varying,
    disklikes integer,
    comment_count integer,
    tags character varying,
    thumbnail_link character varying,
    description character varying,
    country_id integer
);


ALTER TABLE public.video_stat OWNER TO postgres;

--
-- Name: video_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.video_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_stat_id_seq OWNER TO postgres;

--
-- Name: video_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.video_stat_id_seq OWNED BY public.video_stat.id;


--
-- Name: video_basic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic ALTER COLUMN id SET DEFAULT nextval('public.video_basic_id_seq'::regclass);


--
-- Name: video_stat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_stat ALTER COLUMN id SET DEFAULT nextval('public.video_stat_id_seq'::regclass);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (channel_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: publish publish_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publish
    ADD CONSTRAINT publish_pkey PRIMARY KEY (publish_id);


--
-- Name: trend trend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend
    ADD CONSTRAINT trend_pkey PRIMARY KEY (trend_id);


--
-- Name: video_basic video_basic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic
    ADD CONSTRAINT video_basic_pkey PRIMARY KEY (id);


--
-- Name: video_stat video_stat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_stat
    ADD CONSTRAINT video_stat_pkey PRIMARY KEY (id);


--
-- Name: video_basic video_basic_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic
    ADD CONSTRAINT video_basic_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- Name: video_basic video_basic_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic
    ADD CONSTRAINT video_basic_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel(channel_id);


--
-- Name: video_basic video_basic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic
    ADD CONSTRAINT video_basic_id_fkey FOREIGN KEY (id) REFERENCES public.video_stat(id);


--
-- Name: video_basic video_basic_publish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic
    ADD CONSTRAINT video_basic_publish_id_fkey FOREIGN KEY (publish_id) REFERENCES public.publish(publish_id);


--
-- Name: video_basic video_basic_trend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_basic
    ADD CONSTRAINT video_basic_trend_id_fkey FOREIGN KEY (trend_id) REFERENCES public.trend(trend_id);


--
-- Name: video_stat video_stat_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_stat
    ADD CONSTRAINT video_stat_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- PostgreSQL database dump complete
--

