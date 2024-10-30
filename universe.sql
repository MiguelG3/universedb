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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30) NOT NULL,
    mass_in_tons integer,
    in_orbit boolean,
    asteroid_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    estimated_stars integer NOT NULL,
    has_black_holes boolean,
    description text
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
    mass_in_solar numeric(7,3),
    description text,
    planet_id integer
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
    mass_in_solar numeric(7,3),
    description text,
    is_earthlike boolean NOT NULL,
    star_id integer
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
    is_dying boolean NOT NULL,
    galaxy_id integer,
    mass_in_solar numeric(7,3)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Ceres', 940000, true, 1);
INSERT INTO public.asteroid VALUES ('Vesta', 250000, true, 2);
INSERT INTO public.asteroid VALUES ('Pallas', 512000, true, 3);
INSERT INTO public.asteroid VALUES ('Hygiea', 400000, true, 4);
INSERT INTO public.asteroid VALUES ('Eros', 16000, true, 5);
INSERT INTO public.asteroid VALUES ('Itokawa', 1000, true, 6);
INSERT INTO public.asteroid VALUES ('Bennu', 500, true, 7);
INSERT INTO public.asteroid VALUES ('Ryugu', 1000, true, 8);
INSERT INTO public.asteroid VALUES ('Gaspra', 700, false, 9);
INSERT INTO public.asteroid VALUES ('Ida', 400, false, 10);
INSERT INTO public.asteroid VALUES ('Florence', 80000, true, 11);
INSERT INTO public.asteroid VALUES ('Apophis', 27000, true, 12);
INSERT INTO public.asteroid VALUES ('Dawn', 400, false, 13);
INSERT INTO public.asteroid VALUES ('Eunomia', 330000, true, 14);
INSERT INTO public.asteroid VALUES ('Hermes', 15000, true, 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12903418, false, NULL);
INSERT INTO public.galaxy VALUES (2, 'Cat eye', 982714, true, 'Looks like the eye of a cat');
INSERT INTO public.galaxy VALUES (3, 'Pillars of creation', 71242354, false, 'Beautiful looking');
INSERT INTO public.galaxy VALUES (4, 'Miguel Galaxy', 24762354, true, 'Mightiest of all the galaxies');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 92305122, true, 'Howdy');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 829352, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 0.001, 'Our lovely Moon', 1);
INSERT INTO public.moon VALUES (2, 'Enceladus', 0.000, 'Moon of Saturn with geysers', 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 0.000, 'Mars larger moon', 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 0.000, 'Mars smaller moon', 2);
INSERT INTO public.moon VALUES (5, 'Io', 0.000, 'Volcanically active moon of Jupiter', 3);
INSERT INTO public.moon VALUES (6, 'Europa', 0.000, 'Ice-covered moon of Jupiter', 3);
INSERT INTO public.moon VALUES (7, 'Ganymede', 0.000, 'Largest moon in the solar system', 3);
INSERT INTO public.moon VALUES (8, 'Callisto', 0.000, 'Moon with many craters', 3);
INSERT INTO public.moon VALUES (9, 'Titan', 0.000, 'Largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 0.000, 'Second largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (11, 'Triton', 0.000, 'Largest moon of Neptune', 5);
INSERT INTO public.moon VALUES (12, 'Oberon', 0.000, 'Largest moon of Uranus', 6);
INSERT INTO public.moon VALUES (13, 'Titania', 0.000, 'Second largest moon of Uranus', 6);
INSERT INTO public.moon VALUES (14, 'Charon', 0.000, 'Largest moon of Pluto', 7);
INSERT INTO public.moon VALUES (15, 'Proxima c', 0.000, 'Potential moon of Proxima b', 8);
INSERT INTO public.moon VALUES (16, 'Kepler-16b', 0.000, 'Moon in a binary star system', 9);
INSERT INTO public.moon VALUES (17, 'TRAPPIST-1d', 0.000, 'Potentially habitable moon', 10);
INSERT INTO public.moon VALUES (18, 'Galilean Moon', 0.000, 'Collective term for Jupiters moons', 3);
INSERT INTO public.moon VALUES (19, 'Planetary Ring', 0.000, 'Not a moon but a ring', 4);
INSERT INTO public.moon VALUES (20, 'Exomoon', 0.000, 'Hypothetical moon around an exoplanet', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0.010, 'Home!', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 0.011, 'The Red Planet', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0.815, 'Earth Sister', false, 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', 317.830, 'The Giant Planet', false, 3);
INSERT INTO public.planet VALUES (5, 'Saturn', 95.159, 'The Ringed Planet', false, 3);
INSERT INTO public.planet VALUES (6, 'Mercury', 0.055, 'Closest to the Sun', false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 17.147, 'The Windy Planet', false, 4);
INSERT INTO public.planet VALUES (8, 'Uranus', 14.536, 'The Tilted Planet', false, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.002, 'Dwarf Planet', false, 5);
INSERT INTO public.planet VALUES (10, 'Proxima b', 0.001, 'Closest Exoplanet', true, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 0.260, 'Potentially Habitable', true, 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 0.600, 'Earth-like in a Trappist system', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 1, 1.000);
INSERT INTO public.star VALUES (2, 'XH231', false, 2, 3.500);
INSERT INTO public.star VALUES (3, 'Archimedes', false, 3, 1.500);
INSERT INTO public.star VALUES (4, 'KL124-J', true, 4, 8.560);
INSERT INTO public.star VALUES (5, 'Biggie', false, 5, 988.560);
INSERT INTO public.star VALUES (6, 'LOP-1234145-X', true, 6, 4549.560);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 15, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_bound_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_bound_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_closest_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_closest_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

