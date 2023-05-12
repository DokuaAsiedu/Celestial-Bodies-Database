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

--
-- Name: comet_sequence; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_sequence OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(30) NOT NULL,
    comet_id text DEFAULT ('comet-'::text || nextval('public.comet_sequence'::regclass)) NOT NULL,
    orbital_period_in_years numeric,
    rotation_period_in_hours numeric,
    star_id text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy_sequence; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_sequence OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id text DEFAULT ('gal-'::text || nextval('public.galaxy_sequence'::regclass)) NOT NULL,
    age_in_billions_of_years numeric,
    shape text,
    size_in_parsecs integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon_sequence; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_sequence OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id text DEFAULT ('moon-'::text || nextval('public.moon_sequence'::regclass)) NOT NULL,
    "gravity_in_m/s^2" numeric,
    distance_from_parent_planet_in_km integer,
    diameter_in_km numeric,
    planet_id text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_sequence; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_sequence OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id text DEFAULT ('planet-'::text || nextval('public.planet_sequence'::regclass)) NOT NULL,
    has_rings boolean,
    has_moons boolean,
    earth_mass numeric,
    orbital_period_in_earth_days numeric,
    star_id text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_sequence; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_sequence OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id text DEFAULT ('star-'::text || nextval('public.star_sequence'::regclass)) NOT NULL,
    distance_from_earth_in_parsecs numeric,
    stage_in_lifecycle text,
    galaxy_id text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('Halley''s Comet', 'comet-3', 74.7, 177.6, 'star-1');
INSERT INTO public.comet VALUES ('Comet Hale–Bopp', 'comet-4', 2533, 11.4, 'star-1');
INSERT INTO public.comet VALUES ('Comet Hyakutake', 'comet-5', 72000, 6, 'star-1');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Needle Galaxy', 'gal-4', 13.24, 'spiral', 76650);
INSERT INTO public.galaxy VALUES ('Milky Way Galaxy', 'gal-1', 13.61, 'barred spiral', 32408);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 'gal-2', 10.01, 'barred spiral', 67452);
INSERT INTO public.galaxy VALUES ('Bode''s Galaxy', 'gal-3', 13.31, 'spiral', 27594);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 'gal-5', 13.28, 'spiral', 16238);
INSERT INTO public.galaxy VALUES ('Cigar Galaxy', 'gal-6', 13.3, 'elongated elliptical', 11344);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'moon-1', 1.62, 384400, 3478.8, 'planet-3');
INSERT INTO public.moon VALUES ('Phobos', 'moon-2', 0.0057, 6000, 22.533, 'planet-4');
INSERT INTO public.moon VALUES ('Deimos', 'moon-3', 0.003, 23460, 12.4, 'planet-4');
INSERT INTO public.moon VALUES ('Europa', 'moon-4', 1.315, 571000, 3121.6, 'planet-5');
INSERT INTO public.moon VALUES ('Io', 'moon-5', 1.796, 422000, 3643.2, 'planet-5');
INSERT INTO public.moon VALUES ('Ganymede', 'moon-6', 1.428, 1070000, 5268.2, 'planet-5');
INSERT INTO public.moon VALUES ('Callisto', 'moon-7', 1.236, 1883000, 4820.6, 'planet-5');
INSERT INTO public.moon VALUES ('Philophrosyne', 'moon-8', 0.001, 23600000, 2, 'planet-5');
INSERT INTO public.moon VALUES ('Cyllene', 'moon-9', 0.001, 24600000, 2, 'planet-5');
INSERT INTO public.moon VALUES ('Titan', 'moon-10', 1.352, 1200000, 5149.5, 'planet-6');
INSERT INTO public.moon VALUES ('Enceladus', 'moon-11', 0.113, 238000, 504.2, 'planet-6');
INSERT INTO public.moon VALUES ('Mimas', 'moon-12', 0.064, 186000, 396.4, 'planet-6');
INSERT INTO public.moon VALUES ('Dione', 'moon-13', 0.232, 377400, 1122.8, 'planet-6');
INSERT INTO public.moon VALUES ('Tethys', 'moon-14', 0.145, 295000, 1062, 'planet-6');
INSERT INTO public.moon VALUES ('Rhea', 'moon-15', 0.264, 527000, 1527.6, 'planet-6');
INSERT INTO public.moon VALUES ('Methone', 'moon-16', 0.00023, 194000, 2.9, 'planet-6');
INSERT INTO public.moon VALUES ('Miranda', 'moon-17', 0.079, 80654, 471.6, 'planet-7');
INSERT INTO public.moon VALUES ('Oberon', 'moon-18', 0.354, 582600, 1522.8, 'planet-7');
INSERT INTO public.moon VALUES ('Triton', 'moon-19', 0.779, 354800, 2706.8, 'planet-8');
INSERT INTO public.moon VALUES ('Thalassa', 'moon-20', 0.015, 25200, 82, 'planet-8');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'planet-1', false, false, 0.055, 88, 'star-1');
INSERT INTO public.planet VALUES ('Venus', 'planet-2', false, false, 0.815, 225, 'star-1');
INSERT INTO public.planet VALUES ('Earth', 'planet-3', false, true, 1, 365, 'star-1');
INSERT INTO public.planet VALUES ('Mars', 'planet-4', false, true, 0.107, 687, 'star-1');
INSERT INTO public.planet VALUES ('Jupiter', 'planet-5', true, true, 317.806, 4380, 'star-1');
INSERT INTO public.planet VALUES ('Saturn', 'planet-6', true, true, 95.158, 10585, 'star-1');
INSERT INTO public.planet VALUES ('Uranus', 'planet-7', true, true, 14.536, 30660, 'star-1');
INSERT INTO public.planet VALUES ('Neptune', 'planet-8', true, true, 17.146, 60225, 'star-1');
INSERT INTO public.planet VALUES ('Proxima Centauri b', 'planet-9', false, false, 1.27, 11.3, 'star-6');
INSERT INTO public.planet VALUES ('Kepler-11b', 'planet-10', false, false, 2.78, 10.3, 'star-7');
INSERT INTO public.planet VALUES ('Kepler-11c', 'planet-11', false, false, 5, 13, 'star-7');
INSERT INTO public.planet VALUES ('Kepler-11d', 'planet-12', false, false, 8.13, 22.7, 'star-7');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'star-1', 0.0000048954, 'Yellow Dwarf', 'gal-1');
INSERT INTO public.star VALUES ('Acturus', 'star-2', 11.24, 'Red Giant', 'gal-1');
INSERT INTO public.star VALUES ('Antares', 'star-3', 170, 'Supernova', 'gal-1');
INSERT INTO public.star VALUES ('Sirius B', 'star-4', 2.64, 'White Dwarf', 'gal-1');
INSERT INTO public.star VALUES ('Betelgeuse', 'star-5', 197, 'Red Supergiant', 'gal-1');
INSERT INTO public.star VALUES ('Proxima Centauri', 'star-6', 1.3, 'Red Dwarf', 'gal-1');
INSERT INTO public.star VALUES ('Kepler-11', 'star-7', 514.7837, 'Yellow Dwarf', 'gal-1');


--
-- Name: comet_sequence; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_sequence', 5, true);


--
-- Name: galaxy_sequence; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_sequence', 6, true);


--
-- Name: moon_sequence; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_sequence', 20, true);


--
-- Name: planet_sequence; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_sequence', 12, true);


--
-- Name: star_sequence; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_sequence', 7, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

