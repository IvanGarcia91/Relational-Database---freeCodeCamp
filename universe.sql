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
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    black_holes_id integer NOT NULL,
    name character varying(30) NOT NULL,
    black_hole_code character varying(5)
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_hole_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    size integer,
    description text,
    habitable boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    size integer,
    is_spherical boolean,
    planet_id integer,
    habitable boolean
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
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    size integer,
    has_life boolean,
    is_spherical boolean,
    star_id integer,
    habitable boolean
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
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    size integer,
    distance_from_earth numeric(7,3),
    habitable boolean,
    galaxy_id integer
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
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES (1, 'Cygnus X1', NULL);
INSERT INTO public.black_holes VALUES (2, 'Sagittarius A', NULL);
INSERT INTO public.black_holes VALUES (3, 'Ton 618', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Andromeda', 4500, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Milky Way', 6700, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Sombrero', 3500, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Whirlpool', 5900, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (11, 'Triangulum', 4900, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (12, 'Pinwheel', 5200, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Tethys', 3011, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Enceladus', 1789, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Dione', 2468, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Miranda', 5792, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Ariel', 2854, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (16, 'Umbriel', 4973, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (17, 'Phobos', 3691, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (18, 'Deimos', 2460, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (19, 'Mimas', 5340, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (20, 'Hyperion', 4890, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (1, 'Lunara', 1521, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Cressida', 2347, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (3, 'Elara', 4310, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 1974, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 5490, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 3732, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (7, 'Ganymede', 6184, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (8, 'Titania', 1645, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (9, 'Oberon', 4321, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 3893, NULL, NULL, 3, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Zephyria', 4521, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (2, 'Orionis', 6347, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (3, 'Luminara', 3210, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (4, 'Aetheria', 2974, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (5, 'Xandor', 8490, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (6, 'Valoria', 5732, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (7, 'Neridia', 9184, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (8, 'Eldoria', 2645, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (9, 'Vespera', 7321, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (10, 'Thalassa', 4893, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (11, 'Draconis', 6011, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (12, 'Astria', 2789, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (13, 'Lunara', 1521, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (14, 'Cressida', 2347, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (15, 'Elara', 4310, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (16, 'Io', 1974, NULL, NULL, NULL, 10, NULL);
INSERT INTO public.planet VALUES (17, 'Callisto', 5490, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (18, 'Europa', 3732, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (19, 'Ganymede', 6184, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (20, 'Titania', 1645, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (21, 'Oberon', 4321, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (22, 'Rhea', 3893, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (23, 'Tethys', 3011, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (24, 'Enceladus', 1789, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (25, 'Dione', 2468, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (26, 'Miranda', 5792, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (27, 'Ariel', 2854, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (28, 'Umbriel', 4973, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (29, 'Phobos', 3691, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (30, 'Deimos', 2460, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (31, 'Mimas', 5340, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (32, 'Hyperion', 4890, NULL, NULL, NULL, 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sirius', 3000, NULL, NULL, NULL, 7);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 4500, NULL, NULL, NULL, 7);
INSERT INTO public.star VALUES (9, 'Rigel', 5200, NULL, NULL, NULL, 7);
INSERT INTO public.star VALUES (10, 'Procyon', 3600, NULL, NULL, NULL, 7);
INSERT INTO public.star VALUES (11, 'Vega', 4100, NULL, NULL, NULL, 7);
INSERT INTO public.star VALUES (12, 'Altair', 2900, NULL, NULL, NULL, 7);


--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: black_holes black_holes_black_hole_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_black_hole_code_key UNIQUE (black_hole_code);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


--
-- Name: galaxy galaxy_habitable_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_habitable_key UNIQUE (habitable);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_habitable_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_habitable_key UNIQUE (habitable);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_habitable_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_habitable_key UNIQUE (habitable);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_habitable_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_habitable_key UNIQUE (habitable);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

