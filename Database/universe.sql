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
-- Name: comet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbit_period integer,
    is_visible boolean,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    num_stars integer,
    num_planets integer,
    num_moons integer,
    has_life boolean,
    unique_name text
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter integer,
    distance_from_planet integer,
    has_atmosphere boolean,
    terrain text,
    planet_id integer,
    CONSTRAINT ck_moon_distance_from_planet CHECK ((distance_from_planet > 0))
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius integer NOT NULL,
    distance_from_star integer,
    is_habitable boolean,
    atmosphere text,
    star_id integer,
    CONSTRAINT ck_planet_distance_from_star CHECK ((distance_from_star > 0))
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    temperature numeric(5,2),
    mass integer,
    age integer,
    is_visible boolean,
    galaxy_id integer,
    CONSTRAINT ck_star_temperature CHECK ((temperature > (0)::numeric))
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comet VALUES (1, 'Halley', 76, true, 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2380, true, 2);
INSERT INTO public.comet VALUES (3, 'Shoemaker–Levy 9', 2, true, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (8, 'Galaxia Andromeda', 1000000000, 1000000000, 1000000000, false, 'Unique Galaxy 2');
INSERT INTO public.galaxy VALUES (11, 'Whirlpool Galaxy', 80000000, 8000000, 80000, false, 'Unique Galaxy 5');
INSERT INTO public.galaxy VALUES (13, 'Via Lactea', 1000000000, 1000000000, 1000000000, true, 'Unique Galaxy 1');
INSERT INTO public.galaxy VALUES (15, 'NGC 1300', 100000000, 10000000, 100000, false, 'Unique Galaxy 3');
INSERT INTO public.galaxy VALUES (18, 'Cigar Galaxy', 70000000, 7000000, 70000, true, 'Unique Galaxy 6');
INSERT INTO public.galaxy VALUES (9, 'hs', 100000000, 10000000, 100000, false, 'Unique Galaxy 3');
INSERT INTO public.galaxy VALUES (17, 'hd', 80000000, 8000000, 80000, false, 'Unique Galaxy 5');
INSERT INTO public.galaxy VALUES (7, 'hdxz', 1000000000, 1000000000, 1000000000, true, 'Unique Galaxy 1');
INSERT INTO public.galaxy VALUES (1, 'hdxzz', 1000000000, 1000000000, 1000000000, true, 'Unique Galaxy 1');
INSERT INTO public.galaxy VALUES (2, 'hdsxzz', 1000000000, 1000000000, 1000000000, false, 'Unique Galaxy 2');
INSERT INTO public.galaxy VALUES (3, 'hd1sxzz', 100000000, 10000000, 100000, false, 'Unique Galaxy 3');
INSERT INTO public.galaxy VALUES (12, 'hd12sxzz', 70000000, 7000000, 70000, true, 'Unique Galaxy 6');
INSERT INTO public.galaxy VALUES (5, 'hd12sxzzz', 80000000, 8000000, 80000, false, 'Unique Galaxy 5');
INSERT INTO public.galaxy VALUES (6, 'hd12sxzzzx2', 70000000, 7000000, 70000, true, 'Unique Galaxy 6');
INSERT INTO public.galaxy VALUES (14, 'hd12sxzzz3x2', 1000000000, 1000000000, 1000000000, false, 'Unique Galaxy 2');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 384400, false, 'Rocky', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 9377, false, 'Rocky', 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 23460, false, 'Rocky', 3);
INSERT INTO public.moon VALUES (4, 'Europa', 3121, 670900, true, 'Ice', 8);
INSERT INTO public.moon VALUES (5, 'Titan', 5151, 1221870, true, 'Methane lakes', 9);
INSERT INTO public.moon VALUES (6, 'Enceladus', 504, 238020, true, 'Ice', 9);
INSERT INTO public.moon VALUES (7, 'Mimas', 396, 185520, false, 'Cratered', 10);
INSERT INTO public.moon VALUES (8, 'Tethys', 1066, 294619, false, 'Cratered', 10);
INSERT INTO public.moon VALUES (9, 'Hyperion', 270, 1481100, false, 'Irregular', 11);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1469, 3560800, false, 'Ice', 11);
INSERT INTO public.moon VALUES (11, 'Ganymede', 5262, 1070400, true, 'Ice', 8);
INSERT INTO public.moon VALUES (12, 'Io', 3643, 421700, true, 'Volcanic', 8);
INSERT INTO public.moon VALUES (13, 'Dione', 1122, 377415, false, 'Cratered', 10);
INSERT INTO public.moon VALUES (14, 'Rhea', 1528, 527040, false, 'Cratered', 10);
INSERT INTO public.moon VALUES (15, 'Methone', 3, 194440, false, 'Smooth', 10);
INSERT INTO public.moon VALUES (16, 'Pandora', 81, 141720, false, 'Rocky', 11);
INSERT INTO public.moon VALUES (17, 'Callisto', 4821, 1882700, true, 'Rocky', 8);
INSERT INTO public.moon VALUES (18, 'Phoebe', 220, 12952000, true, 'Ice', 11);
INSERT INTO public.moon VALUES (19, 'Epimetheus', 116, 151422, true, 'Rocky', 12);
INSERT INTO public.moon VALUES (20, 'Janus', 179, 151472, true, 'Rocky', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, 57910000, false, 'Thin Atmosphere', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, 108160000, false, 'Thick Atmosphere', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 149600000, true, 'Nitrogen, Oxygen', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, 227936640, false, 'Carbon dioxide, Nitrogen, Argon', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 778340821, false, 'Hydrogen, Helium', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 1426666422, false, 'Hydrogen, Helium', 2);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 15600, 40000000, true, 'Unknown', 3);
INSERT INTO public.planet VALUES (8, 'Kepler-438b', 6357, 64000000, true, 'Unknown', 3);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', 3500, 39000000, true, 'Unknown', 3);
INSERT INTO public.planet VALUES (10, 'Gliese 667 Cc', 12375, 23550000, true, 'Unknown', 3);
INSERT INTO public.planet VALUES (11, 'Uranus', 25362, 28186, false, 'Hydrogen, Helium, Methane', 2);
INSERT INTO public.planet VALUES (12, 'Neptune', 24622, 44983, false, 'Hydrogen, Helium, Methane', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 577.00, 1000, 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 99.00, 24200, 2500, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 570.00, 2100, 400, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 302.00, 12200, 500, false, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 350.00, 2000, 100, true, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 120.00, 2340, 9000, true, 2);
INSERT INTO public.star VALUES (7, 'Vega', 962.00, 22700, 4000, true, 2);
INSERT INTO public.star VALUES (8, 'Antares', 350.00, 17000, 1200, true, 3);
INSERT INTO public.star VALUES (9, 'Pollux', 473.00, 2000, 7240, true, 3);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 18, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_s UNIQUE (name);


--
-- Name: galaxy unique_galaxy_s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_s UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: moon unique_moon_s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_s UNIQUE (name);


--
-- Name: planet unique_planet_s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_s UNIQUE (name);


--
-- Name: star unique_star_s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_s UNIQUE (name);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

