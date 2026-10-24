--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_ly numeric NOT NULL,
    description text NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL
);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    is_common boolean NOT NULL,
    typical_age_in_millions_of_years integer NOT NULL
);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days numeric NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days numeric NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar_masses numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_planets boolean NOT NULL,
    description text NOT NULL
);


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 13600, 0, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 10000, 2537000, 'A nearby large spiral galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 10000, 2730000, 'A nearby spiral galaxy', true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 3, 13000, 163000, 'A satellite galaxy of the Milky Way', true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 3, 13000, 200000, 'A small neighboring galaxy', true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 1, 9000, 29350000, 'A distant galaxy with a prominent central bulge', false);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Galaxy with a disk and spiral arms', true, 10000);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Rounded or oval-shaped galaxy', true, 11000);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxy without a regular overall shape', false, 8000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.moon VALUES (1, 'Ember I', 1, 800, 3.2, true, 'Large natural satellite');
INSERT INTO public.moon VALUES (2, 'Ember II', 1, 120, 0.8, false, 'Small irregular satellite');
INSERT INTO public.moon VALUES (3, 'Verdant I', 2, 1700, 12, true, 'Large spherical moon');
INSERT INTO public.moon VALUES (4, 'Verdant II', 2, 300, 2.4, false, 'Small rocky moon');
INSERT INTO public.moon VALUES (5, 'Cinder I', 3, 450, 1.6, false, 'Small irregular moon');
INSERT INTO public.moon VALUES (6, 'Cinder II', 3, 900, 5.1, true, 'Rounded natural satellite');
INSERT INTO public.moon VALUES (7, 'Azure I', 4, 1300, 8.5, true, 'Large natural satellite');
INSERT INTO public.moon VALUES (8, 'Azure II', 4, 90, 0.5, false, 'Tiny irregular moon');
INSERT INTO public.moon VALUES (9, 'Thalassa I', 5, 600, 2.7, false, 'Small rocky moon');
INSERT INTO public.moon VALUES (10, 'Thalassa II', 5, 2200, 14, true, 'Large spherical moon');
INSERT INTO public.moon VALUES (11, 'Borealis I', 6, 3200, 20.5, true, 'Large natural satellite');
INSERT INTO public.moon VALUES (12, 'Borealis II', 6, 700, 4.2, false, 'Small irregular moon');
INSERT INTO public.moon VALUES (13, 'Nyx I', 7, 80, 0.9, false, 'Tiny rocky satellite');
INSERT INTO public.moon VALUES (14, 'Nyx II', 7, 500, 3.3, false, 'Irregular natural satellite');
INSERT INTO public.moon VALUES (15, 'Eos I', 8, 1400, 6.8, true, 'Large rounded moon');
INSERT INTO public.moon VALUES (16, 'Eos II', 8, 250, 1.2, false, 'Small rocky moon');
INSERT INTO public.moon VALUES (17, 'Kestrel I', 9, 350, 2.1, false, 'Small natural satellite');
INSERT INTO public.moon VALUES (18, 'Orin I', 10, 1900, 11.6, true, 'Large spherical moon');
INSERT INTO public.moon VALUES (19, 'Zephyr I', 11, 1000, 5.4, true, 'Rounded natural satellite');
INSERT INTO public.moon VALUES (20, 'Calyx I', 12, 400, 2.8, false, 'Small irregular moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.planet VALUES (1, 'Ember', 1, 6200, 120, true, 'Fictional temperate planet');
INSERT INTO public.planet VALUES (2, 'Verdant', 1, 6800, 365, true, 'Fictional planet with abundant vegetation');
INSERT INTO public.planet VALUES (3, 'Cinder', 2, 3300, 22, false, 'Small rocky planet');
INSERT INTO public.planet VALUES (4, 'Azure', 2, 7100, 180, false, 'Fictional planet with a blue atmosphere');
INSERT INTO public.planet VALUES (5, 'Thalassa', 3, 5900, 45, false, 'Fictional ocean planet');
INSERT INTO public.planet VALUES (6, 'Borealis', 3, 12000, 900, false, 'Large cold planet');
INSERT INTO public.planet VALUES (7, 'Nyx', 4, 2800, 12, false, 'Small dark planet');
INSERT INTO public.planet VALUES (8, 'Eos', 4, 8500, 240, false, 'Fictional planet with a bright atmosphere');
INSERT INTO public.planet VALUES (9, 'Kestrel', 5, 4400, 60, false, 'Rocky planet');
INSERT INTO public.planet VALUES (10, 'Orin', 5, 10000, 730, false, 'Large fictional planet');
INSERT INTO public.planet VALUES (11, 'Zephyr', 6, 5100, 35, false, 'Fictional windy planet');
INSERT INTO public.planet VALUES (12, 'Calyx', 6, 7600, 410, false, 'Fictional planet with a thick atmosphere');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.star VALUES (1, 'Sol-Example', 1, 1.0, 4600, true, 'Example star system in the Milky Way');
INSERT INTO public.star VALUES (2, 'Asterion', 1, 1.3, 3200, true, 'Fictional star with two example planets');
INSERT INTO public.star VALUES (3, 'Lyra-Prime', 2, 0.9, 5100, true, 'Fictional star in Andromeda');
INSERT INTO public.star VALUES (4, 'Triangulum-Prime', 3, 1.1, 4000, true, 'Fictional star in Triangulum');
INSERT INTO public.star VALUES (5, 'Magellan-Alpha', 4, 1.6, 2800, true, 'Fictional star in the Large Magellanic Cloud');
INSERT INTO public.star VALUES (6, 'Sombrero-Alpha', 6, 0.8, 7000, true, 'Fictional star in the Sombrero Galaxy');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

