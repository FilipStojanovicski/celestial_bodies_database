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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    brightest_star character varying(30),
    is_ancient_origin boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    apparent_magnitude numeric(4,2),
    distance_in_kly integer,
    constellation text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    mean_radius_in_km double precision,
    mass_in_kg double precision,
    semi_major_axis_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_star_in_km double precision,
    radius_in_km double precision,
    mass_in_kg double precision,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    system character varying(40),
    distance_in_ly double precision,
    constellation character varying(40),
    stellar_class character varying(30),
    solar_mass double precision,
    apparent_magnitude numeric(4,2),
    absolute_magnitude numeric(4,2),
    parallax_in_mas double precision,
    galaxy_id integer,
    visible_by_eye boolean DEFAULT false,
    constellation_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Dorado', 'Doradus', false);
INSERT INTO public.constellation VALUES (2, 'Mensa', 'Mensae', false);
INSERT INTO public.constellation VALUES (3, 'Tucana', 'Tucanae', false);
INSERT INTO public.constellation VALUES (4, 'Andromeda', 'Alpheratz', true);
INSERT INTO public.constellation VALUES (5, 'Triangulum', 'Trianguli', true);
INSERT INTO public.constellation VALUES (6, 'Centaurus', 'Rigil Kentaurus', true);
INSERT INTO public.constellation VALUES (7, 'Ursa Major', 'Alioth', true);
INSERT INTO public.constellation VALUES (8, 'Sculptor', 'Sculptoris', false);
INSERT INTO public.constellation VALUES (9, 'Sagittarius', 'Kaus Australis', false);
INSERT INTO public.constellation VALUES (10, 'Ophiuchus', 'Rasalhague', true);
INSERT INTO public.constellation VALUES (11, 'Carina', 'Canopus', false);
INSERT INTO public.constellation VALUES (12, 'Piscis Austrinus', 'Formalhaut', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 0.90, 160, 'Dorado/Mensa', 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (3, 2.70, 200, 'Tucana', 'Small Magellanic Cloud');
INSERT INTO public.galaxy VALUES (4, 3.40, 2500, 'Andromeda', 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (5, 5.70, 2900, 'Triangulum', 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (6, 6.84, 13700, 'Centaurus', 'Centaurus A');
INSERT INTO public.galaxy VALUES (7, 6.94, 12000, 'Ursa Major', 'Bode''s Galaxy');
INSERT INTO public.galaxy VALUES (8, 7.20, 12000, 'Sculptor', 'Sculptor Galaxy');
INSERT INTO public.galaxy VALUES (1, -6.50, 0, 'Sagittarius (centre)', 'Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'Deimos', 6.2, 1.4762e+15, 23463);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.2667, 1.0659e+16, 9376);
INSERT INTO public.moon VALUES (3, 3, 'Moon', 1737.4, 7.342e+22, 384399);
INSERT INTO public.moon VALUES (4, 5, 'Metis', 21, 3.6e+16, 128000);
INSERT INTO public.moon VALUES (5, 5, 'Adrastea', 8.2, 2e+15, 129000);
INSERT INTO public.moon VALUES (7, 5, 'Thebe', 49.3, 4.3e+17, 221900);
INSERT INTO public.moon VALUES (6, 5, 'Amalthea', 83, 2.08e+18, 181400);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 198, 4e+19, 185539);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 252, 1.1000000000000002e+20, 237948);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 531, 6.2e+20, 294619);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 561, 1.1000000000000001e+21, 377396);
INSERT INTO public.moon VALUES (12, 7, 'Cordelia', 20, 4.4e+16, 49770);
INSERT INTO public.moon VALUES (13, 7, 'Ophelia', 21, 5.3e+16, 53790);
INSERT INTO public.moon VALUES (14, 7, 'Bianca', 25, 9.2e+16, 59170);
INSERT INTO public.moon VALUES (15, 7, 'Cressida', 40, 3.4e+17, 61780);
INSERT INTO public.moon VALUES (16, 8, 'Naiad', 30.2, 1.3e+17, 48224);
INSERT INTO public.moon VALUES (17, 8, 'Thalassa', 40.7, 3.5e+17, 50074);
INSERT INTO public.moon VALUES (18, 8, 'Despina', 78, 1.7e+18, 52526);
INSERT INTO public.moon VALUES (19, 8, 'Galatea', 87.4, 2.8e+18, 61953);
INSERT INTO public.moon VALUES (20, 8, 'Larissa', 97, 3.8e+18, 73548);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 57909175, 2440.53, 3.3020000000000006e+23, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108208930, 6051.8, 4.869e+24, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778412010, 71492, 1.8987000000000002e+27, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 227936640, 3396.19, 6.4191e+23, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 149597890, 6378.1366, 5.972e+24, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1426725400, 60268, 5.685100000000001e+26, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2870972200, 25559, 8.684900000000002e+25, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4498252900, 24764, 1.0244e+26, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 7330295.7, NULL, 6.9875e+24, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 222900000, NULL, 4.181e+25, 2);
INSERT INTO public.planet VALUES (11, 'b', 10172655, NULL, 2.5080000000000003e+25, 8);
INSERT INTO public.planet VALUES (12, 'c', 17952000, NULL, 4.539e+25, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Solar System', 1.58e-05, NULL, 'G2V', 1, -26.74, 4.85, NULL, 1, true, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri (C, V645 Centauri)', 'Alpha Centauri', 4.2465, 'Centaurus', 'M5.5Ve', 0.122, 11.09, 15.53, 768.0665, 1, false, 6);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus (A)', 'Alpha Centauri', 4.3441, 'Centaurus', 'G2V', 1.079, 0.01, 4.38, 750.81, 1, true, 6);
INSERT INTO public.star VALUES (4, 'Toliman (B)', 'Alpha Centauri', 4.3441, 'Centaurus', 'K1V', 0.909, 1.34, 5.71, 750.81, 1, true, 6);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', NULL, 5.9629, 'Ophiuchus', 'M4.0Ve', 0.144, 9.53, 13.22, 546.9759, 1, false, 10);
INSERT INTO public.star VALUES (6, 'A', 'Luhman 16', 6.5029, 'Carina', 'L8', 0.032, 10.70, 14.20, 501.557, 1, false, 11);
INSERT INTO public.star VALUES (7, 'B', 'Luhman 16', 6.5029, 'Carina', 'T1', 0.027, NULL, NULL, 501.557, 1, false, 11);
INSERT INTO public.star VALUES (8, 'Lacaille 9352 (Gliese 887)', NULL, 10.7241, 'Piscis Austrinus', 'M0.5V', 0.486, 7.34, 9.75, 304.1354, 1, false, 12);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 12, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: constellation unique_constellation_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_constellation_id UNIQUE (constellation_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_star_conetellation; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_conetellation FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

