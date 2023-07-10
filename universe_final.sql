--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    description character varying(80) NOT NULL,
    name character varying(40) NOT NULL,
    star_count_mlns numeric(6,2),
    galaxy_type character varying(30),
    has_planets boolean
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
    planet_id integer,
    name character varying(40) NOT NULL,
    description text,
    orbital_period numeric(6,2)
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
    star_id integer,
    description text,
    moons integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    planets_number integer,
    sol_mass numeric(8,2),
    description text,
    star_type_id integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    can_b_blackhole boolean,
    solar_mass integer
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy not far away, in fact we live here.', 'Milky Way', 1000.00, 'Spiral Galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'An elliptical galaxy located 100 million light-years away.', 'NGC 2865', 1.00, 'Elliptical Galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Neighbouring galaxy', 'Andromeda', 1000.00, 'Spiral Galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 'A small ring galaxy', 'Hoag''s Object', 8.00, 'Ring Galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'A disrupted barred spiral galaxy', 'Tadpole Galaxy', 1.00, 'Disrupted Spiral Galaxy', NULL);
INSERT INTO public.galaxy VALUES (6, 'An active galaxy with Quasar at the center', 'Markarian 231', 1.00, 'Seyfert Galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'Only natural satellite of planet Earth', 1.00);
INSERT INTO public.moon VALUES (2, 5, 'Phobos', 'Moon of Mars that stands for Fear from Greek', 8.00);
INSERT INTO public.moon VALUES (3, 5, 'Deimos', 'Another moon of Mars that stands for Terror from Greek. A gloom couple', 30.00);
INSERT INTO public.moon VALUES (4, 6, 'Callisto', 'Second largest moon of Jupiter.', 408.00);
INSERT INTO public.moon VALUES (5, 6, 'Ganymede', 'Largest moon of Jupiter.', 172.00);
INSERT INTO public.moon VALUES (6, 6, 'Io', 'Most volcanically active world in the solar System.', 42.00);
INSERT INTO public.moon VALUES (7, 7, 'Titan', 'Pretty cool name for a moon.', 384.00);
INSERT INTO public.moon VALUES (8, 6, 'Europa', 'Another moon of Jupiter.', 85.00);
INSERT INTO public.moon VALUES (9, 9, 'Triton', 'Largest satellite of Neptune.', 141.00);
INSERT INTO public.moon VALUES (10, 7, 'Enceladus', '500 km in diameter. Satellite of Saturn.', 33.00);
INSERT INTO public.moon VALUES (11, 7, 'Mimas', 'Famos for its crater named the Herschel crater.', 23.00);
INSERT INTO public.moon VALUES (12, 8, 'Miranda', 'AKA Uranus V.', 34.00);
INSERT INTO public.moon VALUES (13, 9, 'Thalassa', 'Named after sea goddess Thalassa', 7.00);
INSERT INTO public.moon VALUES (14, 9, 'Hippocamp', 'Discovered on 1 July 2013', 23.00);
INSERT INTO public.moon VALUES (15, 9, 'Nereid', 'Famous for its eccentric orbit', 8640.00);
INSERT INTO public.moon VALUES (16, 9, 'Galatea', 'Discovered by Stephen P. Synnott', 10.00);
INSERT INTO public.moon VALUES (17, 8, 'Ariel', 'Do not mix up with little mermaid', 60.00);
INSERT INTO public.moon VALUES (18, 8, 'Titania', 'Surface area comparable to that of Australia', 209.00);
INSERT INTO public.moon VALUES (19, 8, 'Oberon', 'Has radius of 761.4km', 312.00);
INSERT INTO public.moon VALUES (20, 8, 'Cressida', 'Discovered by Voyager 2 on 9 January 1986', 11.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, '3rd planet from the Sun. Only place in universe with ''confirmed'' life', 1);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri B', 2, 'Closest exoplanet to Earth.', 0);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 'Planet closest to Sun and also smallest planet in Solar system.', 0);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 'Second planet from the Sun and surprisingly the hottest planet.', 0);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 'The most popular planet portrayed in holiwood scifi movies', 2);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 'Largest star in Solar System.', 80);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 'That star with rings.', 145);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Let''s stop making fun of the planet that is named after the god of sky.', 27);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 'Really cold planet furthest from Sun.', 14);
INSERT INTO public.planet VALUES (11, 'Upsilon Andromedae d', NULL, 'UA d is a gas giant exoplanet that orbits F-type star.', 0);
INSERT INTO public.planet VALUES (12, '47 Ursae Majoris b', NULL, 'Gas planet and an extrasolar planet.', 0);
INSERT INTO public.planet VALUES (13, '51 Pegasi b', NULL, 'Officially named Dimidium is an extrasolar planet, in the constellation of Pegasus.', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, 1.00, 'Local star that created environment to form Earth, and then live, and me typing into this database row', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3, 0.12, 'Closest star to our Sun.', 5);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 3, 0, 3.80, 'Brightest star in Andromeda from Earth.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 0, 700.00, 'One of the largest stars visible with naked eye.', 2);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 0, 2.00, 'Brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (6, 'Alpha Herculis', 1, 0, 3000.00, 'Asymptonic giant branch star', 2);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Main Sequence Star', 'Scientists call a star that is fusing hydrogen to helium in its core a main sequence star. Main sequence stars make up around 90% of the universe stellar population. They range in luminosity, color, and size - from a tenth to 200 times the mass of Sun - and live for millions to billions of years.', true, 200);
INSERT INTO public.star_type VALUES (2, 'Red Giants', 'Stars with less than 8 times the mass of the Sun. Check out our Sun in 5bln years', false, 7);
INSERT INTO public.star_type VALUES (3, 'White Dwarfs', 'Next phase after the red giant stage - when core of original red giant is left. Check out our Sun in about 10bln years', false, NULL);
INSERT INTO public.star_type VALUES (4, 'Neutron Stars', 'Densely packed star remnants that are left after the massive star went supernova', NULL, NULL);
INSERT INTO public.star_type VALUES (5, 'Red Dwarfs', 'Smallest main sequence stars with a fraction of the size and mass of our Sun. Live for trillions of years.', NULL, NULL);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

