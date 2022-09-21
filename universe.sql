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
-- Name: dwarf_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planets (
    dwarf_planets_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40),
    description text,
    distance_from_sum_in_million_km numeric,
    no_of_moons integer
);


ALTER TABLE public.dwarf_planets OWNER TO freecodecamp;

--
-- Name: dwarf_planets_df_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planets_df_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planets_df_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planets_df_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planets_df_planet_id_seq OWNED BY public.dwarf_planets.dwarf_planets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    galaxy_types character varying(40),
    diameter_in_ly numeric,
    distance_from_earth_in_ly numeric
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
    is_spherical boolean,
    distance_from_planet_x1000km numeric
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
    star_id integer,
    name character varying(40) NOT NULL,
    description text,
    is_habitable boolean,
    is_rocky boolean,
    distance_from_its_star_in_million_km numeric
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
    galaxy_id integer NOT NULL,
    name character varying(40),
    description text,
    distance_from_earth_in_ly numeric
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
-- Name: dwarf_planets dwarf_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets ALTER COLUMN dwarf_planets_id SET DEFAULT nextval('public.dwarf_planets_df_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planets VALUES (3, 1, 'Eris', 'Transneptunion object.', 14410, 1);
INSERT INTO public.dwarf_planets VALUES (2, 1, 'Pluto', 'Earlier the 9th planet.', 5906, 5);
INSERT INTO public.dwarf_planets VALUES (1, 1, 'Ceres', 'The only dwarf planet in asteroid belt.', 414, 0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda galaxy is the closest large spiral galaxy to ours.', 'spiral galaxy', 220000, 2.538);
INSERT INTO public.galaxy VALUES (2, 'Milky WAY', 'Our home.', 'spiral galaxy', 140000, 0.008);
INSERT INTO public.galaxy VALUES (3, 'NGC 300', 'Closest spiral galaxy to Local Group. Forms pair with NGC 55.', 'spiral galaxy', 94000, 6.07);
INSERT INTO public.galaxy VALUES (4, 'Sculptor galaxy (NGC 253)', 'currently undergoing period of intense star formation', 'spiral galaxy', 90000, 11.40);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Brightest galaxy in M81 Group', 'spiral galaxy', 90000, 11.74);
INSERT INTO public.galaxy VALUES (6, 'IC 342', 'the hidden galaxy', 'spiral galaxy', 75000, 10.70);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 'Only moon of our planet Earth.', true, 380);
INSERT INTO public.moon VALUES (34, 4, 'Phobos', 'Fear in greek mythology.', false, 6);
INSERT INTO public.moon VALUES (35, 4, 'Deimos', 'Dread in greek mythology.', false, 23.46);
INSERT INTO public.moon VALUES (36, 6, 'Io', 'Most volcanically active body in the solar system.', true, 421.6);
INSERT INTO public.moon VALUES (37, 6, 'Europa', 'Might be best place to look for environments harboring life in our solar system.', true, 670.9);
INSERT INTO public.moon VALUES (38, 6, 'Gannymede', 'Largest satellite in our solar system.', true, 1070);
INSERT INTO public.moon VALUES (39, 6, 'Callisto', 'Most heavily cratered object in our solar system.', true, 1883);
INSERT INTO public.moon VALUES (40, 7, 'Enceladus', '', true, 238);
INSERT INTO public.moon VALUES (41, 7, 'Titan', '', true, 1221.8);
INSERT INTO public.moon VALUES (42, 7, 'Tethys', '', true, 295);
INSERT INTO public.moon VALUES (43, 7, 'Dione', '', true, 234.5);
INSERT INTO public.moon VALUES (44, 8, 'Ariel', '', true, 190.9);
INSERT INTO public.moon VALUES (45, 8, 'Miranda', '', true, 129.9);
INSERT INTO public.moon VALUES (46, 8, 'Titania', '', true, 436.3);
INSERT INTO public.moon VALUES (47, 8, 'Oberon', '', true, 583.5);
INSERT INTO public.moon VALUES (48, 8, 'Umbriel', '', true, 266);
INSERT INTO public.moon VALUES (49, 8, 'Puck', '', true, 86);
INSERT INTO public.moon VALUES (50, 9, 'Triton', '', true, 220.5);
INSERT INTO public.moon VALUES (51, 9, 'Proteus', '', false, 117.6);
INSERT INTO public.moon VALUES (52, 9, 'Nereid', '', false, 5513);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', NULL, false, true, 60);
INSERT INTO public.planet VALUES (2, 1, 'Venus', NULL, false, true, 100);
INSERT INTO public.planet VALUES (4, 1, 'Mars', NULL, false, true, 220);
INSERT INTO public.planet VALUES (3, 1, 'Earth', NULL, true, true, 150);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri b', NULL, false, true, 7.5);
INSERT INTO public.planet VALUES (11, 2, 'Proxima Centauri d', NULL, false, true, 4.3);
INSERT INTO public.planet VALUES (6, 1, 'Jupiter', NULL, false, false, 780);
INSERT INTO public.planet VALUES (7, 1, 'Saturn', NULL, false, false, 1420);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', NULL, false, false, 2870);
INSERT INTO public.planet VALUES (9, 1, 'Neptune', NULL, false, false, 4500);
INSERT INTO public.planet VALUES (12, 4, 'Epsilon Eridani b', NULL, false, false, 520);
INSERT INTO public.planet VALUES (15, 5, 'TRAPPIST-1d', NULL, false, true, 3.29);
INSERT INTO public.planet VALUES (13, 5, 'TRAPPIST-1b', NULL, false, true, 1.72);
INSERT INTO public.planet VALUES (14, 5, 'TRAPPIST-1c', NULL, false, true, 2.36);
INSERT INTO public.planet VALUES (16, 5, 'TRAPPIST-1e', NULL, false, true, 4.33);
INSERT INTO public.planet VALUES (17, 5, 'TRAPPIST-1f', NULL, false, true, 5.7);
INSERT INTO public.planet VALUES (18, 5, 'TRAPPIST-1g', NULL, false, true, 7);
INSERT INTO public.planet VALUES (19, 5, 'TRAPPIST-1h', NULL, false, true, 9.3);
INSERT INTO public.planet VALUES (20, 6, 'Gliese 1061 b', NULL, false, true, 3.14);
INSERT INTO public.planet VALUES (21, 6, 'Gliese 1061 c', NULL, false, true, 5.23);
INSERT INTO public.planet VALUES (22, 6, 'Gliese 1061 d', NULL, false, true, 8.07);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'Sun', 'Sun is the life-giver of planet Earth.', 0);
INSERT INTO public.star VALUES (2, 2, 'Proxima Centauri', 'Nearest star to planet Earth and part of Alpha Centauri system.', 4.25);
INSERT INTO public.star VALUES (3, 2, 'Sirius A', 'Brightest star in the night sky.', 8.71);
INSERT INTO public.star VALUES (4, 2, 'Epsilon Eridani (Ran)', 'Relatively younger star <1bn years old.', 10.50);
INSERT INTO public.star VALUES (5, 2, 'TRAPPIST-I', 'An ultra cool red dwarf star with a planetary system of seven known planets.', 39.00);
INSERT INTO public.star VALUES (6, 2, 'Gliese 1061', 'A red dwarf star.', 12.00);


--
-- Name: dwarf_planets_df_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planets_df_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 52, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planets dwarf_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_name_key UNIQUE (name);


--
-- Name: dwarf_planets dwarf_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_pkey PRIMARY KEY (dwarf_planets_id);


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

