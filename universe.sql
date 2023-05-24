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
    name character varying(50) NOT NULL,
    constellation text,
    apparent_magnitude integer NOT NULL,
    galaxy_types character varying(50),
    light_years_away numeric(10,2),
    visible_galaxies boolean,
    has_black_hole boolean,
    age integer
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
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    temperature_in_celcius integer NOT NULL,
    distance_planet numeric(12,2),
    data_year text,
    geological_activity boolean,
    presence_of_atmosphere boolean,
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    nebula_type character varying(50),
    composition text,
    mass numeric(12,2),
    temperature integer NOT NULL,
    size integer,
    emission_nebula boolean,
    planetary_nebula boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_types text,
    diameter_in_km numeric(10,2),
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    has_moon boolean,
    number_of_moons integer,
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
    name character varying(50) NOT NULL,
    color text,
    apparent_magnitude integer NOT NULL,
    star_types character varying(50),
    light_year_away numeric(10,2),
    is_binary boolean,
    star_variable boolean,
    surface_temperature integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda', 3, 'Spiral', 2.54, true, true, 100);
INSERT INTO public.galaxy VALUES (2, 'Sombrero', 'Virgo', 9, 'Spiral', 29.30, false, false, 500);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Triangulum', 5, 'Spiral', 2.72, false, false, 60);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Sculptor', 7, 'Elliptical', 11.00, false, true, 400);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'Sculptor', 15, 'Ring', 500.00, false, false, 300);
INSERT INTO public.galaxy VALUES (6, 'Andromeda II', 'Andromeda', 14, 'Dwarf', 2.37, false, false, 50);
INSERT INTO public.galaxy VALUES (7, 'Leo I', 'Leo', 11, 'Dwarf', 0.84, false, false, 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, -20, 384400.00, '1610', false, false, NULL);
INSERT INTO public.moon VALUES (2, 'Titan', 5150, -290, 1221870.00, '1655', true, true, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 3122, -170, 670900.00, '1610', true, false, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, -160, 1070400.00, '1610', true, false, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821, -150, 1882700.00, '1610', false, false, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 3537, -150, 421700.00, '1610', true, false, NULL);
INSERT INTO public.moon VALUES (7, 'Phobos', 22, -30, 9378.00, '1877', false, false, NULL);
INSERT INTO public.moon VALUES (8, 'Deimos', 12, -40, 23460.00, '1877', false, false, NULL);
INSERT INTO public.moon VALUES (9, 'Mimas', 396, -201, 185520.00, '1789', false, false, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 1528, -220, 527040.00, '1672', false, false, NULL);
INSERT INTO public.moon VALUES (11, 'Tethys', 1062, -187, 294660.00, '1684', false, false, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', 1122, -186, 377420.00, '1684', false, false, NULL);
INSERT INTO public.moon VALUES (13, 'Hyperion', 270, -220, 1481100.00, '1848', false, false, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1469, -143, 356100.00, '1684', false, false, NULL);
INSERT INTO public.moon VALUES (15, 'Charon', 1212, -229, 551400.00, '1848', false, false, NULL);
INSERT INTO public.moon VALUES (16, 'Nereid', 340, -220, 5514000.00, '1949', false, false, NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', 471, -200, 1281100.00, '1989', false, false, NULL);
INSERT INTO public.moon VALUES (18, 'Proteus', 436, -220, 117647.00, '1989', false, false, NULL);
INSERT INTO public.moon VALUES (19, 'Triton', 2707, -235, 354760.00, '1846', true, true, NULL);
INSERT INTO public.moon VALUES (20, 'Candy', 2014, -14, 7030.00, '1996', true, true, NULL);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion', 'Emission', 'Hydrogen, Helium, and Dust', 150000.50, 10000, 30, true, false);
INSERT INTO public.nebula VALUES (2, 'Crab', 'Supernova Remnant', 'Ionized, Gas, and Dust', 50000.75, 20000, 10, true, false);
INSERT INTO public.nebula VALUES (3, 'Eagle', 'H II Region', 'Hydrogen, Gas, and Dust', 200000.25, 8000, 50, true, false);
INSERT INTO public.nebula VALUES (4, 'Ring', 'Planetary', 'Ionized, Gas, and Dust', 20000.80, 12000, 5, false, true);
INSERT INTO public.nebula VALUES (5, 'Horsehead', 'Dark', 'Molecular, Hydrogen and Dust', 500000.30, -260, 20, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 4879.00, 4553, true, false, 0, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 12104.00, 4562, true, false, 0, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 12742.00, 4561, true, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 6779.00, 4560, true, true, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 139820.00, 4559, false, true, 79, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 116460.00, 4558, false, true, 82, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 50724.00, 4557, true, true, 27, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 49244.00, 4556, true, true, 14, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 2370.00, 4555, true, true, 5, NULL);
INSERT INTO public.planet VALUES (10, 'Haumea', 'Dwarf', 1963.00, 4554, true, true, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Makemake', 'Dwarf', 1430.00, 4553, true, true, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Eris', 'Dwarf', 2326.00, 4552, true, true, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow', 0, 'G-type main sequence', 8.30, false, false, 5778, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'White', -1, 'A1V', 8.60, false, false, 9940, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red', 0, 'M1-2Ia-Iab', 642.50, false, true, 3600, NULL);
INSERT INTO public.star VALUES (4, 'Reigel', 'Blue', -3, 'BuIa', 863.90, false, false, 12100, NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red', 11, 'M5.5Ve', 4.24, false, true, 3042, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 'Blue-White', 0, 'A0Va', 25.04, false, false, 9602, NULL);
INSERT INTO public.star VALUES (7, 'Arcturus', 'Orange', 0, 'K1.5III', 36.70, false, false, 4290, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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

