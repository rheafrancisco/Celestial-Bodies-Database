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
    name character varying(80) NOT NULL,
    galaxy_type_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL,
    is_barred boolean NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_days numeric NOT NULL,
    radius_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
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
    name character varying(80) NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_star numeric NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
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
    name character varying(80) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 2, 13600, 0, true, 'The barred spiral galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 10000, 2537000, false, 'The nearest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 12000, 2730000, false, 'A small spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 1, 13000, 31000000, false, 'A bright galaxy known for its broad dust lane.');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 3, 13000, 53500000, false, 'A giant elliptical galaxy in the Virgo Cluster.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 1, 13000, 163000, false, 'A satellite galaxy of the Milky Way.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A rotating disk with prominent arms.', false);
INSERT INTO public.galaxy_type VALUES (2, 'Barred Spiral', 'A spiral galaxy with a central bar-shaped structure.', true);
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical', 'A smooth, rounded collection of stars with little structure.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 27.3, 1737, true, 'Earth’s natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.32, 11, false, 'The larger and closer moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.26, 6, false, 'The smaller outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.77, 1821, true, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.55, 1561, true, 'An icy moon thought to hide a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.15, 2634, true, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.69, 2410, true, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 0.94, 198, true, 'A small icy moon of Saturn.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1.37, 252, true, 'An icy moon with water-rich plumes.');
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1.89, 531, true, 'A mid-sized icy moon of Saturn.');
INSERT INTO public.moon VALUES (11, 'Titan', 6, 15.95, 2575, true, 'A moon with lakes of liquid methane.');
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 1.41, 236, true, 'A small moon with an unusually varied surface.');
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 2.52, 579, true, 'A bright icy moon of Uranus.');
INSERT INTO public.moon VALUES (14, 'Triton', 8, 5.88, 1353, true, 'A large retrograde moon of Neptune.');
INSERT INTO public.moon VALUES (15, 'Nereid', 8, 360.14, 170, true, 'A distant moon with an eccentric orbit.');
INSERT INTO public.moon VALUES (16, 'Kepler-22b I', 9, 18.4, 900, true, 'A hypothetical natural satellite in the Kepler-22 system.');
INSERT INTO public.moon VALUES (17, 'Proxima b I', 10, 12.1, 700, true, 'A hypothetical natural satellite of Proxima b.');
INSERT INTO public.moon VALUES (18, 'TRAPPIST-1e I', 11, 9.2, 600, true, 'A hypothetical natural satellite of TRAPPIST-1e.');
INSERT INTO public.moon VALUES (19, 'TOI-700 d I', 12, 14.7, 800, true, 'A hypothetical natural satellite of TOI-700 d.');
INSERT INTO public.moon VALUES (20, 'Iapetus', 6, 79.32, 734, true, 'A two-toned moon orbiting Saturn.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4500, 0.39, false, true, 'A small rocky planet closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4500, 0.72, false, true, 'A rocky planet with a dense carbon dioxide atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4540, 1.00, true, true, 'The only world currently known to support life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4500, 1.52, false, true, 'A cold desert world with evidence of ancient water.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4500, 5.20, false, true, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4500, 9.58, false, true, 'A gas giant famous for its bright ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4500, 19.20, false, true, 'An ice giant that rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4500, 30.05, false, true, 'A distant ice giant with powerful winds.');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 4, 4000, 0.85, false, true, 'A planet orbiting within its star’s habitable zone.');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 4850, 0.05, false, true, 'An Earth-mass planet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 5, 7600, 0.03, false, true, 'A rocky planet in the temperate region of its system.');
INSERT INTO public.planet VALUES (12, 'TOI-700 d', 6, 1500, 0.16, false, true, 'An Earth-sized planet in the habitable zone.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.0, true, 'The star at the center of the Solar System.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 2.06, true, 'A bright binary star system in Canis Major.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4850, 0.12, true, 'The nearest known star to the Sun.');
INSERT INTO public.star VALUES (4, 'Kepler-22', 1, 4000, 0.97, true, 'A Sun-like star with a planet in its habitable zone.');
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 1, 7600, 0.09, true, 'An ultracool dwarf star with several known planets.');
INSERT INTO public.star VALUES (6, 'TOI-700', 1, 1500, 0.42, true, 'A nearby red dwarf with Earth-sized planets.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

