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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    asteroid_group character varying(40),
    spectral_type character varying(25) NOT NULL,
    discoverer character varying(100) NOT NULL,
    gravity numeric(3,2) NOT NULL,
    orbital_period numeric(3,2) NOT NULL
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
    description text,
    discoverer character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_billions_of_years integer
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
    name character varying(20) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    age_in_billion_years integer NOT NULL,
    discoverer character varying(100) NOT NULL,
    radius_km integer
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
    name character varying(20) NOT NULL,
    age_in_billions_of_years integer NOT NULL,
    radius_km integer NOT NULL,
    description text,
    star_id integer NOT NULL,
    discoverer character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    has_atmopshere boolean NOT NULL
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
    name character varying(20) NOT NULL,
    age_in_billions_of_years integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    radius_km integer NOT NULL,
    discoverer character varying(100) NOT NULL
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

INSERT INTO public.asteroid VALUES (1, '4 Vesta', 'Asteroid Belt', 'V-Type', 'Heinrich Wilhelm M.O.', 0.22, 1.33);
INSERT INTO public.asteroid VALUES (3, '7 ALLO', 'Liouron Eos', 'C-Type', 'Ulla Bine', 0.56, 1.35);
INSERT INTO public.asteroid VALUES (2, '7 AV Lino', 'Liouron Belt', 'X-Type', 'HeinrWillie Vonie', 0.12, 1.06);
INSERT INTO public.asteroid VALUES (4, 'ALLO NX2', 'EOS Belt', 'A-Type', 'Backie Loun', 0.40, 1.45);
INSERT INTO public.asteroid VALUES (5, '45 LOL', 'Themis', 'X-Type', 'Leslie Ack', 0.66, 1.65);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Closeset big galaxy to the Milky Way', 'Abd al-Rahman al-Sufi', 'SA(s)b', 1003);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Colorful', 'William Herschel', 'SB(s)m pec', 5654);
INSERT INTO public.galaxy VALUES (3, 'Condor Galaxy', 'The largest well known spiral galaxy', 'John Herschel', 'SB(s)b pec', 5005);
INSERT INTO public.galaxy VALUES (4, 'Cosmos Redshift 7', 'Reported to be the brightest of distant galaxies.', 'Savid Sobral', 'Lyman-alpha emitter', 1045);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'This is the fourth-largest galaxy in the Local Group', 'Ferdinand Magellan', 'SB(s)m', 1234);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', 'Galileo Galilei', 'Sb;Sbc;SB(rs)bc', 6654);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'TGX 56', 'Blue Exma"s first moon', 4, 6, 'Laura Ben', 1010);
INSERT INTO public.moon VALUES (2, 'Ellio X2', 'No Info', 6, 8, 'All Aluro', 1350);
INSERT INTO public.moon VALUES (3, 'Midd bin XX', 'Middle Tolkien"s second moon', 5, 10, 'Mabel Tolkien', 1215);
INSERT INTO public.moon VALUES (4, 'KI XX 12', 'Largest moon in the universe.', 12, 13, 'Marlene Jobert', 4500);
INSERT INTO public.moon VALUES (5, 'Fe Lia X', 'Plane"s surface is iron.', 13, 9, 'Loui Milla', 2156);
INSERT INTO public.moon VALUES (6, 'XX 676 XY', 'The Smallest moon in the universe', 2, 11, 'Billa Nou', 908);
INSERT INTO public.moon VALUES (9, 'Loii XX Y 66', 'No Info', 8, 7, 'Zoe Love', 1458);
INSERT INTO public.moon VALUES (10, 'Hipzarion NX3', 'There is water on Hipzarion', 15, 10, 'Lara Craft', 1345);
INSERT INTO public.moon VALUES (11, 'Vider FK8', 'No Info', 11, 8, 'Ann Fire', 2214);
INSERT INTO public.moon VALUES (12, 'The Moon', 'The Moon is Earth"s only natural satelitte.', 4, 1, 'Galile Galile', 3567);
INSERT INTO public.moon VALUES (13, 'GH56 LK', 'Second brightest moon in the universe.', 12, 15, 'Zaizo Ina', 2098);
INSERT INTO public.moon VALUES (15, 'Gouro XK6T', 'Only moon has a ring around it.', 13, 7, 'Anna Carry', 3412);
INSERT INTO public.moon VALUES (18, 'Hello Earth', 'Looks like the earth.', 5, 9, 'Tassie Jennie', 3251);
INSERT INTO public.moon VALUES (20, 'GH JG 5', 'Has 2 color side, Orange and Yellow.', 2, 12, 'Sonnie Go', 1265);
INSERT INTO public.moon VALUES (21, 'AK OL 12', '1 day in AK OL 12 is 3 hours.', 7, 8, 'Gassie Bus', 3276);
INSERT INTO public.moon VALUES (24, 'AK OL 13', 'No Info.', 14, 5, 'Roban Lies', 2567);
INSERT INTO public.moon VALUES (25, 'UJ 12 XX', 'No Info.', 15, 12, 'Anie Hey', 3214);
INSERT INTO public.moon VALUES (26, 'Gain LE 66', 'No Info.', 12, 11, 'Ulo İnn', 3211);
INSERT INTO public.moon VALUES (27, 'VB NX 14', 'Found some animals.', 7, 8, 'Kayleigh Zae', 1678);
INSERT INTO public.moon VALUES (28, 'PL AS 56', 'Obsidian surface.', 1, 4, 'Lesly  Zen', 1899);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Gulio 45 X', 60, 2670, 'Closest planet to Alpha Andromeda', 1, 'Dilek Can', true, true);
INSERT INTO public.planet VALUES (6, 'Darko Soulin', 60, 6770, 'The darkest planet in the universe and no one can live.', 1, 'Hidetaka Miyazaki', false, false);
INSERT INTO public.planet VALUES (12, 'Evas Groon', 13, 4177, 'The hottest planet in the universe', 6, 'Marlene Jobert', true, true);
INSERT INTO public.planet VALUES (1, 'Earth', 13, 6371, 'First discovered planet', 6, 'Galileo Galile', true, true);
INSERT INTO public.planet VALUES (5, 'Middle Tolkien', 13, 1980, 'Everyone knows and love this planet. Also has a moon called Frod Sam.', 6, 'Mabel Tolkien', true, true);
INSERT INTO public.planet VALUES (13, '2025 QS', 10, 2888, 'No Info', 7, 'MarlAnabella Inca', false, false);
INSERT INTO public.planet VALUES (14, '1234 GJ', 10, 5012, 'Latest planet discovered', 7, 'Yuol Asilla', false, false);
INSERT INTO public.planet VALUES (4, 'Blue Exma', 60, 8075, 'The most cold planet ever discovered', 8, 'Miara Konda', false, false);
INSERT INTO public.planet VALUES (7, 'Andro Lion', 60, 1366, 'The smallest planet in the universe', 8, 'Jack Jonson', false, false);
INSERT INTO public.planet VALUES (11, 'Bioluo', 11, 3032, 'No Info', 9, 'Michelle Philips', true, true);
INSERT INTO public.planet VALUES (15, 'Killa 68', 12, 4011, 'No Info', 10, 'Said bin Abdul', true, true);
INSERT INTO public.planet VALUES (8, 'Kigore', 12, 2112, 'No Info', 10, 'Kyx Luo', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Sun', 1313, 'Center of the Solar System', 6, 37600, 'Nicolaus Copernicus');
INSERT INTO public.star VALUES (7, 'Asilur Mirra', 1001, 'First green star ever discovered', 2, 46450, 'İgnuo Laura');
INSERT INTO public.star VALUES (8, 'Cosmo Mill', 6055, 'Oldest star in Condor Galaxy', 3, 29345, 'Hakio Loinuo');
INSERT INTO public.star VALUES (9, 'Souto Salor', 1011, 'No Info', 4, 21345, 'Aliro Haju');
INSERT INTO public.star VALUES (10, 'Arot 12 Slo', 1206, 'Oldest fourth star in universe', 5, 40455, 'Alleuro bin Ahid');
INSERT INTO public.star VALUES (1, 'Alpha Andromeda', 6001, 'Biggest star in Andromeda Galaxy', 1, 51240, 'William Herschel');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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


