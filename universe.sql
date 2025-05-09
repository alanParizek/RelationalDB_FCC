--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_to_earth numeric,
    type character varying(30) NOT NULL,
    shape character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: last_one; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.last_one (
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    last_one_id integer NOT NULL
);


ALTER TABLE public.last_one OWNER TO freecodecamp;

--
-- Name: last_one_last_one_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.last_one_last_one_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.last_one_last_one_id_seq OWNER TO freecodecamp;

--
-- Name: last_one_last_one_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.last_one_last_one_id_seq OWNED BY public.last_one.last_one_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    radious_km integer,
    color text,
    planet_id integer,
    has_water boolean NOT NULL,
    type character varying(30) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    radious_km integer,
    color text,
    star_id integer,
    type character varying(30) NOT NULL,
    has_water boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    distance_to_earth numeric,
    galaxy_id integer,
    type character varying(30) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: last_one last_one_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_one ALTER COLUMN last_one_id SET DEFAULT nextval('public.last_one_last_one_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, 'spiral', 'barred');
INSERT INTO public.galaxy VALUES (2, 'Triangulum', 3000000, 'spiral', 'unbarred');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 29000000, 'lenticular', 'edge-on');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, 'spiral', 'grand-design');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 53800000, 'elliptical', 'spherical');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic', 163000, 'irregular', 'asymmetric');


--
-- Data for Name: last_one; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.last_one VALUES ('Elarin', 154, 1);
INSERT INTO public.last_one VALUES ('Torvak', 208, 2);
INSERT INTO public.last_one VALUES ('Myrris', 312, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Thalos', 8654, 'red', 1, true, 'elliptical');
INSERT INTO public.moon VALUES (22, 'Nerida', 4321, 'blue', 2, false, 'circular');
INSERT INTO public.moon VALUES (23, 'Virex', 7590, 'gray', 3, true, 'inclined');
INSERT INTO public.moon VALUES (24, 'Zorath', 9876, 'white', 4, false, 'elliptical');
INSERT INTO public.moon VALUES (25, 'Calda', 1045, 'green', 5, true, 'polar');
INSERT INTO public.moon VALUES (26, 'Ipheron', 6710, 'yellow', 6, false, 'retrograde');
INSERT INTO public.moon VALUES (27, 'Lunaris', 4532, 'purple', 7, true, 'circular');
INSERT INTO public.moon VALUES (28, 'Solmere', 3290, 'red', 8, true, 'elliptical');
INSERT INTO public.moon VALUES (29, 'Dravon', 9102, 'gray', 9, false, 'inclined');
INSERT INTO public.moon VALUES (30, 'Talyra', 5801, 'blue', 10, true, 'retrograde');
INSERT INTO public.moon VALUES (31, 'Xevra', 7100, 'white', 11, false, 'polar');
INSERT INTO public.moon VALUES (32, 'Nyxora', 8300, 'green', 12, true, 'circular');
INSERT INTO public.moon VALUES (33, 'Quarn', 2943, 'purple', 1, false, 'retrograde');
INSERT INTO public.moon VALUES (34, 'Velune', 6745, 'yellow', 2, true, 'elliptical');
INSERT INTO public.moon VALUES (35, 'Bracca', 8888, 'red', 3, false, 'polar');
INSERT INTO public.moon VALUES (36, 'Omniel', 4231, 'gray', 4, true, 'inclined');
INSERT INTO public.moon VALUES (37, 'Zephra', 6123, 'blue', 5, false, 'elliptical');
INSERT INTO public.moon VALUES (38, 'Cerava', 3345, 'white', 6, true, 'circular');
INSERT INTO public.moon VALUES (39, 'Myrron', 7777, 'green', 7, false, 'retrograde');
INSERT INTO public.moon VALUES (40, 'Aurelia', 5020, 'yellow', 8, true, 'inclined');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurion', 4879, 'gray', 1, 'terrestrial', false);
INSERT INTO public.planet VALUES (2, 'Virelia', 12104, 'yellow', 2, 'terrestrial', true);
INSERT INTO public.planet VALUES (3, 'Crystara', 6780, 'blue', 3, 'oceanic', true);
INSERT INTO public.planet VALUES (4, 'Zenthon', 50000, 'orange', 4, 'gas giant', false);
INSERT INTO public.planet VALUES (5, 'Ophira', 6052, 'red', 5, 'terrestrial', true);
INSERT INTO public.planet VALUES (6, 'Thalassa', 24622, 'green', 6, 'ice giant', true);
INSERT INTO public.planet VALUES (7, 'Draconis', 3390, 'purple', 7, 'terrestrial', false);
INSERT INTO public.planet VALUES (8, 'Vortan', 71492, 'brown', 8, 'gas giant', false);
INSERT INTO public.planet VALUES (9, 'Ecliptar', 30000, 'blue-white', 9, 'ice giant', true);
INSERT INTO public.planet VALUES (10, 'Solara', 12742, 'golden', 10, 'terrestrial', true);
INSERT INTO public.planet VALUES (11, 'Nimbara', 6018, 'pink', 2, 'desert', false);
INSERT INTO public.planet VALUES (12, 'Arkion', 25559, 'dark gray', 3, 'ice giant', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 8.6, 1, 'main sequence', 230);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 642.5, 2, 'red supergiant', 10000);
INSERT INTO public.star VALUES (3, 'Rigel', 860, 3, 'blue supergiant', 8000);
INSERT INTO public.star VALUES (4, 'Vega', 25, 4, 'main sequence', 455);
INSERT INTO public.star VALUES (5, 'Aldebaran', 65.3, 5, 'giant', 6200);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4.24, 6, 'red dwarf', 4800);
INSERT INTO public.star VALUES (7, 'Polaris', 433, 1, 'supergiant', 7000);
INSERT INTO public.star VALUES (8, 'Antares', 554, 2, 'red supergiant', 12000);
INSERT INTO public.star VALUES (9, 'Altair', 16.7, 3, 'main sequence', 1200);
INSERT INTO public.star VALUES (10, 'Deneb', 2600, 4, 'blue-white supergiant', 10000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: last_one_last_one_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.last_one_last_one_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: moon a; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT a UNIQUE (moon_id);


--
-- Name: planet b; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT b UNIQUE (planet_id);


--
-- Name: star c; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT c UNIQUE (star_id);


--
-- Name: galaxy d; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT d UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: last_one last_one_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_one
    ADD CONSTRAINT last_one_age_key UNIQUE (age);


--
-- Name: last_one last_one_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_one
    ADD CONSTRAINT last_one_pkey PRIMARY KEY (last_one_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

