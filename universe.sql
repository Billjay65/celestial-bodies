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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System.', 0, 200000000, 'Ancient Observers', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy to the Milky Way.', 2537000, 1000000000, 'Abd al-Rahman al-Sufi', 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the local group.', 3000000, 40000000, 'Charles Messier', 1764);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Famous for its spiral structure.', 23000000, 100000000, 'Charles Messier', 1773);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Known for its bright nucleus and large central bulge.', 29000000, 80000000, 'Pierre Méchain', 1781);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way.', 163000, 30000000, 'Ferdinand Magellan', 1519);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400.00, 'Earths only natural satellite.', 1, 3474.8, 27.3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376.00, 'One of Mars two small moons.', 2, 22.4, 0.3, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460.00, 'The smaller moon of Mars.', 2, 12.4, 1.26, true);
INSERT INTO public.moon VALUES (4, 'Europa', 628300000.00, 'An icy moon of Jupiter.', 3, 3121.6, 3.55, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 628300000.00, 'The largest moon in the Solar System.', 3, 5268, 7.16, true);
INSERT INTO public.moon VALUES (6, 'Titan', 1429400000.00, 'The largest moon of Saturn.', 4, 5150, 15.9, true);
INSERT INTO public.moon VALUES (7, 'Enceladus', 1429400000.00, 'A moon with active geysers.', 4, 504, 1.37, true);
INSERT INTO public.moon VALUES (8, 'Triton', 4540000000.00, 'Neptunes largest moon.', 5, 2706.8, 5.87, true);
INSERT INTO public.moon VALUES (9, 'Charon', 5906376272.00, 'Plutos largest moon.', 6, 1212, 6.39, true);
INSERT INTO public.moon VALUES (10, 'Io', 628300000.00, 'The most volcanically active moon.', 3, 3642, 1.77, true);
INSERT INTO public.moon VALUES (11, 'Callisto', 628300000.00, 'A heavily cratered moon.', 3, 4821, 16.7, true);
INSERT INTO public.moon VALUES (12, 'Hyperion', 1429400000.00, 'A small irregular moon of Saturn.', 4, 270, 21.3, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 1429400000.00, 'Known as the "Death Star" moon.', 4, 396, 0.94, true);
INSERT INTO public.moon VALUES (14, 'Oberon', 2877000000.00, 'The outermost moon of Uranus.', 3, 1523, 13.46, true);
INSERT INTO public.moon VALUES (15, 'Miranda', 2877000000.00, 'A moon with an unusual surface.', 3, 471, 1.41, true);
INSERT INTO public.moon VALUES (16, 'Ariel', 2877000000.00, 'A moon with valleys and cliffs.', 3, 1158, 2.52, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 2877000000.00, 'A dark moon of Uranus.', 3, 1169, 4.14, true);
INSERT INTO public.moon VALUES (18, 'Dione', 1429400000.00, 'A moon with an ice crust.', 4, 1123, 2.74, true);
INSERT INTO public.moon VALUES (19, 'Rhea', 1429400000.00, 'A moon with a thin atmosphere.', 4, 1528, 4.52, true);
INSERT INTO public.moon VALUES (20, 'Iapetus', 1429400000.00, 'A moon with two-tone coloration.', 4, 1469, 79.3, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4540, 7000000, 'The only planet known to support life.', true, true, 1, 12742, 365.25, 15, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 0, 'Known as the Red Planet.', true, false, 1, 6779, 687, -63, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4500, 0, 'The largest planet in the Solar System.', true, false, 1, 139820, 4331, -108, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 4500, 0, 'Famous for its ring system.', true, false, 1, 116460, 10747, -139, 2);
INSERT INTO public.planet VALUES (5, 'Neptune', 4500, 0, 'The furthest planet from the Sun.', true, false, 1, 49244, 60190, -201, 3);
INSERT INTO public.planet VALUES (6, 'Pluto', 4500, 0, 'A dwarf planet in the Kuiper Belt.', true, false, 1, 2376, 90560, -229, 4);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', NULL, 0, 'An exoplanet in the habitable zone of Kepler-22.', true, NULL, 6, 24500, 290, NULL, 5);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', NULL, 0, 'An exoplanet orbiting Alpha Centauri B.', true, NULL, 3, 13000, 20, NULL, 5);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', NULL, 0, 'A possible Earth-like exoplanet.', true, NULL, 3, 14500, 37, NULL, 5);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', NULL, 0, 'A gas giant exoplanet in Pegasus.', true, false, 4, 133000, 3.52, NULL, 2);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', NULL, 0, 'Potentially habitable planet.', true, NULL, 5, 12700, 6.1, NULL, 5);
INSERT INTO public.planet VALUES (12, 'GJ 1214b', NULL, 0, 'A mini-Neptune exoplanet.', true, NULL, 5, 15000, 1.6, NULL, 3);


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

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our Solar System.', 'G-type Main Sequence', 1, 1, 4600);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'A red supergiant star in the Orion constellation.', 'Red Supergiant', 20, 120000, 10000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'The closest star to the Solar System.', 'Red Dwarf', 0.12, 0.0017, 4700);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 'A blue supergiant in the Orion constellation.', 'Blue Supergiant', 21, 120000, 8000);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A bright star in the Lyra constellation.', 'A-type Main Sequence', 2.1, 40.12, 455);
INSERT INTO public.star VALUES (6, 'Sirius', 1, 'The brightest star in the night sky.', 'Binary System', 2.02, 25.4, 242);


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
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

