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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (22, 15, 849);
INSERT INTO public.games VALUES (23, 15, 95);
INSERT INTO public.games VALUES (24, 16, 529);
INSERT INTO public.games VALUES (25, 16, 493);
INSERT INTO public.games VALUES (26, 15, 543);
INSERT INTO public.games VALUES (27, 15, 930);
INSERT INTO public.games VALUES (28, 15, 165);
INSERT INTO public.games VALUES (29, 17, 433);
INSERT INTO public.games VALUES (30, 17, 291);
INSERT INTO public.games VALUES (31, 18, 609);
INSERT INTO public.games VALUES (32, 18, 335);
INSERT INTO public.games VALUES (33, 17, 501);
INSERT INTO public.games VALUES (34, 17, 381);
INSERT INTO public.games VALUES (35, 17, 209);
INSERT INTO public.games VALUES (36, 19, 467);
INSERT INTO public.games VALUES (37, 19, 352);
INSERT INTO public.games VALUES (38, 20, 663);
INSERT INTO public.games VALUES (39, 20, 900);
INSERT INTO public.games VALUES (40, 19, 439);
INSERT INTO public.games VALUES (41, 19, 937);
INSERT INTO public.games VALUES (42, 19, 928);
INSERT INTO public.games VALUES (43, 21, 4);
INSERT INTO public.games VALUES (44, 22, 338);
INSERT INTO public.games VALUES (45, 22, 387);
INSERT INTO public.games VALUES (46, 23, 744);
INSERT INTO public.games VALUES (47, 23, 352);
INSERT INTO public.games VALUES (48, 22, 867);
INSERT INTO public.games VALUES (49, 22, 609);
INSERT INTO public.games VALUES (50, 22, 49);
INSERT INTO public.games VALUES (51, 21, 16);
INSERT INTO public.games VALUES (52, 21, 9);
INSERT INTO public.games VALUES (53, 24, 667);
INSERT INTO public.games VALUES (54, 24, 751);
INSERT INTO public.games VALUES (55, 25, 931);
INSERT INTO public.games VALUES (56, 25, 112);
INSERT INTO public.games VALUES (57, 24, 672);
INSERT INTO public.games VALUES (58, 24, 856);
INSERT INTO public.games VALUES (59, 24, 582);
INSERT INTO public.games VALUES (60, 26, 620);
INSERT INTO public.games VALUES (61, 26, 278);
INSERT INTO public.games VALUES (62, 27, 174);
INSERT INTO public.games VALUES (63, 27, 329);
INSERT INTO public.games VALUES (64, 26, 924);
INSERT INTO public.games VALUES (65, 26, 456);
INSERT INTO public.games VALUES (66, 26, 559);
INSERT INTO public.games VALUES (67, 28, 891);
INSERT INTO public.games VALUES (68, 28, 711);
INSERT INTO public.games VALUES (69, 29, 733);
INSERT INTO public.games VALUES (70, 29, 341);
INSERT INTO public.games VALUES (71, 28, 371);
INSERT INTO public.games VALUES (72, 28, 670);
INSERT INTO public.games VALUES (73, 28, 839);
INSERT INTO public.games VALUES (74, 30, 309);
INSERT INTO public.games VALUES (75, 30, 595);
INSERT INTO public.games VALUES (76, 31, 446);
INSERT INTO public.games VALUES (77, 31, 75);
INSERT INTO public.games VALUES (78, 30, 662);
INSERT INTO public.games VALUES (79, 30, 241);
INSERT INTO public.games VALUES (80, 30, 270);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (23, 'user_1747846475772', 2, 4);
INSERT INTO public.users VALUES (31, 'user_1747846931158', 2, 75);
INSERT INTO public.users VALUES (22, 'user_1747846475773', 5, 4);
INSERT INTO public.users VALUES (30, 'user_1747846931159', 5, 241);
INSERT INTO public.users VALUES (21, 'alan', 3, 4);
INSERT INTO public.users VALUES (25, 'user_1747846647484', 2, 4);
INSERT INTO public.users VALUES (16, 'user_1747846291653', 2, 95);
INSERT INTO public.users VALUES (15, 'user_1747846291654', 5, 95);
INSERT INTO public.users VALUES (24, 'user_1747846647485', 5, 4);
INSERT INTO public.users VALUES (18, 'user_1747846400481', 2, 95);
INSERT INTO public.users VALUES (27, 'user_1747846830124', 2, 4);
INSERT INTO public.users VALUES (17, 'user_1747846400482', 5, 95);
INSERT INTO public.users VALUES (26, 'user_1747846830125', 5, 4);
INSERT INTO public.users VALUES (20, 'user_1747846422943', 2, 95);
INSERT INTO public.users VALUES (19, 'user_1747846422944', 5, 95);
INSERT INTO public.users VALUES (29, 'user_1747846899343', 2, 341);
INSERT INTO public.users VALUES (28, 'user_1747846899344', 5, 371);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 80, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

