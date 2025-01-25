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
    name character varying(60) NOT NULL,
    description text,
    distance_from_earth double precision,
    number_of_stars integer,
    discovered_by character varying(100),
    discovery_year integer
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
    name character varying(60) NOT NULL,
    distance_from_earth numeric(12,2),
    description text,
    planet_id integer,
    diameter double precision,
    orbital_period double precision,
    is_tidal_locked boolean
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
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    population integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer,
    diameter double precision,
    orbital_period double precision,
    surface_temperature double precision,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    description text,
    type character varying(50),
    mass double precision,
    luminosity double precision,
    age_in_millions_of_years integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing our Solar System.', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way.', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies.', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Galaxy with a bright nucleus and a large central bulge.', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A classic spiral galaxy with well-defined arms.', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster.', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400.00, 'The only natural satellite of Earth.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376.00, 'A moon of Mars.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 23463.00, 'A moon of Mars.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 628300.00, 'A moon of Jupiter with an icy surface.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1070400.00, 'The largest moon in the Solar System.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 628300.00, 'A volcanically active moon of Jupiter.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700.00, 'A heavily cratered moon of Jupiter.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 1221850.00, 'A large moon of Saturn with a dense atmosphere.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 527040.00, 'A moon of Saturn.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3561300.00, 'A moon of Saturn.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 377400.00, 'A moon of Saturn.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Triton', 3547600.00, 'A moon of Neptune with retrograde orbit.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Charon', 19571.00, 'The largest moon of Pluto.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Mimas', 185520.00, 'A moon of Saturn with a large crater.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Enceladus', 237950.00, 'A moon of Saturn with geysers.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Oberon', 582600.00, 'A moon of Uranus.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', 129900.00, 'A moon of Uranus.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Ariel', 190900.00, 'A moon of Uranus.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Umbriel', 266000.00, 'A moon of Uranus.', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Hyperion', 1500000.00, 'An irregularly shaped moon of Saturn.', NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 8000000, 'The only known planet with life.', true, true, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 0, 'The Red Planet.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4500, 0, 'The largest planet in the Solar System.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 4500, 0, 'Known for its prominent ring system.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Proxima b', 4500, 0, 'An exoplanet orbiting Proxima Centauri.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 5000, 0, 'A potential Earth-like exoplanet.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', 4500, 0, 'The farthest planet from the Sun.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Venus', 4500, 0, 'A planet with a thick, toxic atmosphere.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', 4500, 0, 'The closest planet to the Sun.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 10000, 0, 'A potentially habitable exoplanet.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 6000, 0, 'A super-Earth orbiting a Sun-like star.', true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Titan', 4500, 0, 'A moon-like body larger than Mercury.', false, false, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces, like Earth and Mars.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets composed mostly of hydrogen and helium, like Jupiter and Saturn.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with icy compositions, such as Neptune and Uranus.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Small planetary bodies that orbit the Sun, like Pluto.');
INSERT INTO public.planet_type VALUES (5, 'Exoplanet', 'Planets that orbit stars outside of the Solar System.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our Solar System.', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 'A triple star system in the Milky Way.', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'A red supergiant star in the Orion constellation.', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'The brightest star in the night sky.', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'The fifth-brightest star in the night sky.', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Polaris', 2, 'Known as the North Star, located in the Andromeda galaxy.', NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

