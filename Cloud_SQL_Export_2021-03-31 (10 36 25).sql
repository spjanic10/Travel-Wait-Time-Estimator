--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.6

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
-- Name: locations; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA locations;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: airports; Type: TABLE; Schema: locations; Owner: -
--

CREATE TABLE locations.airports (
    id integer NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    "time" real,
    key character varying
);


--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: locations; Owner: -
--

CREATE SEQUENCE locations.airports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: locations; Owner: -
--

ALTER SEQUENCE locations.airports_id_seq OWNED BY locations.airports.id;


--
-- Name: driving; Type: TABLE; Schema: locations; Owner: -
--

CREATE TABLE locations.driving (
    distance integer,
    travel integer,
    accuracy character varying
);


--
-- Name: hospitals; Type: TABLE; Schema: locations; Owner: -
--

CREATE TABLE locations.hospitals (
    id integer NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    "time" real
);


--
-- Name: hospitals_id_seq; Type: SEQUENCE; Schema: locations; Owner: -
--

CREATE SEQUENCE locations.hospitals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hospitals_id_seq; Type: SEQUENCE OWNED BY; Schema: locations; Owner: -
--

ALTER SEQUENCE locations.hospitals_id_seq OWNED BY locations.hospitals.id;


--
-- Name: locations; Type: TABLE; Schema: locations; Owner: -
--

CREATE TABLE locations.locations (
    id integer NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    "time" real,
    type character varying,
    key character varying
);


--
-- Name: newtable_id_seq; Type: SEQUENCE; Schema: locations; Owner: -
--

CREATE SEQUENCE locations.newtable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: newtable_id_seq; Type: SEQUENCE OWNED BY; Schema: locations; Owner: -
--

ALTER SEQUENCE locations.newtable_id_seq OWNED BY locations.locations.id;


--
-- Name: ttc; Type: TABLE; Schema: locations; Owner: -
--

CREATE TABLE locations.ttc (
    id integer NOT NULL,
    date date,
    "time" time(0) without time zone,
    condition character varying,
    delay real,
    line character varying,
    start character varying,
    ending character varying,
    short_line character varying
);


--
-- Name: ttc_id_seq; Type: SEQUENCE; Schema: locations; Owner: -
--

CREATE SEQUENCE locations.ttc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ttc_id_seq; Type: SEQUENCE OWNED BY; Schema: locations; Owner: -
--

ALTER SEQUENCE locations.ttc_id_seq OWNED BY locations.ttc.id;


--
-- Name: yrt; Type: TABLE; Schema: locations; Owner: -
--

CREATE TABLE locations.yrt (
    id integer NOT NULL,
    date date,
    "time" time(0) without time zone,
    condition character varying,
    delay real,
    line character varying,
    start character varying,
    ending character varying,
    short_line character varying
);


--
-- Name: yrt_id_seq; Type: SEQUENCE; Schema: locations; Owner: -
--

CREATE SEQUENCE locations.yrt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: yrt_id_seq; Type: SEQUENCE OWNED BY; Schema: locations; Owner: -
--

ALTER SEQUENCE locations.yrt_id_seq OWNED BY locations.yrt.id;


--
-- Name: airports id; Type: DEFAULT; Schema: locations; Owner: -
--

ALTER TABLE ONLY locations.airports ALTER COLUMN id SET DEFAULT nextval('locations.airports_id_seq'::regclass);


--
-- Name: hospitals id; Type: DEFAULT; Schema: locations; Owner: -
--

ALTER TABLE ONLY locations.hospitals ALTER COLUMN id SET DEFAULT nextval('locations.hospitals_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: locations; Owner: -
--

ALTER TABLE ONLY locations.locations ALTER COLUMN id SET DEFAULT nextval('locations.newtable_id_seq'::regclass);


--
-- Name: ttc id; Type: DEFAULT; Schema: locations; Owner: -
--

ALTER TABLE ONLY locations.ttc ALTER COLUMN id SET DEFAULT nextval('locations.ttc_id_seq'::regclass);


--
-- Name: yrt id; Type: DEFAULT; Schema: locations; Owner: -
--

ALTER TABLE ONLY locations.yrt ALTER COLUMN id SET DEFAULT nextval('locations.yrt_id_seq'::regclass);


--
-- Data for Name: airports; Type: TABLE DATA; Schema: locations; Owner: -
--

COPY locations.airports (id, name, address, city, "time", key) FROM stdin;
4	Pearson Intl Airport Terminal 1 (Canada Level 3)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T1 Canada Level 3
5	Pearson Intl Airport Terminal 1 (Canada Level 2)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T1 Canada Level 2
6	Pearson Intl Airport Terminal 1 (International)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T1 International
7	Pearson Intl Airport Terminal 1 (United States)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T1 United States
1	Pearson Airport Terminal 3 (Canada)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T3 Canada
2	Pearson Airport Terminal 3 (International)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T3 International
3	Pearson Airport Terminal 3 (United States)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	T3 United States
\.


--
-- Data for Name: driving; Type: TABLE DATA; Schema: locations; Owner: -
--

COPY locations.driving (distance, travel, accuracy) FROM stdin;
1026	299	\N
1048	318	\N
9652	1031	\N
9674	1050	\N
8227	1045	\N
706	229	\N
729	248	\N
9344	1354	\N
9366	1373	\N
815	274	\N
1048	282	\N
1071	301	\N
5000	800	\N
4000	700	\N
4500	750	\N
9767	1375	\N
8228	1055	0.944849118425068
751	180	0.6829481136107347
1067	240	0.9485568130695254
1067	240	0.9506001029587201
1067	240	0.9523142718926889
1067	240	0.9537717516769479
1067	240	0.9550255247344592
8228	1055	0.9561151155924913
1067	240	0.9578211101444312
1067	240	0.9588143743566775
1067	240	0.9596919484316014
1067	240	0.9604728320623052
1067	240	0.9611721022047353
8228	1055	0.9618018701568352
8228	1055	0.9633899030821784
8228	1055	0.9647637643433647
1067	240	0.9659636279023673
1067	240	0.9665793074726227
1067	240	0.9671390688801451
1067	240	0.9676501824085993
1067	240	0.9681187131947605
1067	240	0.9685497604260731
1067	240	0.9689476418778745
1067	240	0.9693160377923242
1067	240	0.9696581041570159
751	180	0.9699765627011874
53211	2460	0.9702214401646323
14043	2220	0.7543155848236077
14039	2400	0.7066545752198357
2243	420	0.6675173677059203
1798	420	0.6682405312991557
751	120	0.6690762623961377
8395	1080	0.6698322289113037
751	120	0.6705667431380963
751	120	0.6713553975745286
751	120	0.6721290909983033
751	120	0.6728866820227646
751	120	0.6736274043140382
751	120	0.6743507842592614
510	120	0.6750565764521341
510	120	0.6761005814806967
510	120	0.6771071548539042
510	120	0.6780780564048654
510	120	0.6790149640120834
510	120	0.6799194738538062
751	120	0.6807931018218645
3096790	102600	0.681332631657584
751	120	0.9991020222657625
751	120	0.9990939503713617
510	120	0.9990861374511344
510	120	0.9990790029014757
3096790	102600	0.9990720901921747
751	120	0.999528639863846
510	120	0.9995251225674479
510	120	0.9995219222017397
751	120	0.9995188183139815
510	120	0.9995156033933489
510	120	0.9995126827485584
510	120	0.9995126827485584
751	120	0.9995070906170364
751	120	0.9995042201919311
751	120	0.999501429118883
751	120	0.9994987141553253
751	120	0.9994960722328348
751	120	0.9994935004456045
751	120	0.9994909960398211
751	120	0.9994885564038617
751	120	0.9994861790592412
751	120	0.9994838616522408
751	120	0.99948160194616
751	120	0.9994793978141391
751	120	0.9994772472325026
510	120	0.9994751482745815
510	120	0.9994732611244678
751	120	0.9994714182296824
751	120	0.9994694597035209
751	120	0.9994675460413819
751	120	0.9994656757202052
751	120	0.9994638472850566
751	120	0.999462059345363
751	120	0.9994603105713953
751	120	0.9994585996909774
510	120	0.9994569254864082
751	120	0.999455431500636
751	120	0.9994538256536746
751	120	0.9994522531603183
751	120	0.9994507129926977
751	120	0.9994492041647272
751	120	0.999447725730003
751	120	0.9994462767798288
751	120	0.9994448564413569
751	120	0.9994434638758387
17305	1140	0.9994420982769759
751	120	0.9994378266696444
751	120	0.9994364399376405
1067	240	0.9994350793087544
524	120	0.9994349860125933
17303	1200	0.9994337811051442
\.


--
-- Data for Name: hospitals; Type: TABLE DATA; Schema: locations; Owner: -
--

COPY locations.hospitals (id, name, address, city, "time") FROM stdin;
1	Unlisted	unknown	Toronto	1.4
2	Huron Perth Healthcare Alliance : Clinton Public Hospital	98 Shipley St, Clinton, ON N0M 1L0, Canada	Clinton	0.5
3	Grey Bruce Health Services - Markdale Site	Ornge Heliport (Grey Bruce Health Services - Markdale Site), 200 Isla St, Markdale, ON N0C 1H0, Canada	Markdale	0.6
4	William Osler Health System - Etobicoke General	101 Humber College Blvd, Etobicoke, ON M9V 1R8, Canada	Etobicoke	0.6
5	Mackenzie Health - Vaughan Site	3200 Major MacKenzie Dr W, Vaughan, ON L6A 4Z3, Canada	Vaughan	0.7
6	The Hospital For Sick Children	555 University Ave, Toronto, ON M5G 1X8, Canada	Toronto	0.7
7	South Bruce Grey Health Centre - Durham	320 College St N, Durham, ON N0G 1R0, Canada	Durham	0.7
8	Mackenzie Health - Richmond Hill	10 Trench St, Richmond Hill, ON L4C 4Z3, Canada	Richmond Hill	0.7
9	Scarborough and Rouge Hospital - Birchmount	3030 Birchmount Rd, Scarborough, ON M1W 3W3, Canada	Scarborough	0.8
10	Huron Perth Healthcare Alliance : Seaforth Community Hospital	24 Centennial Dr, Seaforth, ON N0K 1W0, Canada	Seaforth	0.8
11	South Bruce Grey Health Centre - Chesley	39 2nd St SE, Chesley, ON N0G 1L0, Canada	Chesley	0.8
12	Grey Bruce Health Services - Meaford Site	229 Nelson St W, Meaford, ON N4L 1A3, Canada	Meaford	0.8
13	Niagara Health System - Fort Erie Douglas	230 Bertie St, Fort Erie, ON L2A 1Z2, Canada	Fort Erie	0.8
14	St. Joseph's Health Care London - St. Joseph's Hospital	268 Grosvenor St, London, ON N6A 4V2, Canada	London	0.8
15	Bluewater Health - Charlotte Eleanor Englehart (Petrolia)	450 Blanche St, Petrolia, ON N0N 1R0, Canada	Petrolia	0.8
16	St. Joseph's Health Care System Hamilton - Charlton Campus	St Joseph's Healthcare Hamilton, 50 Charlton Ave E, Hamilton, ON L8N 4A6, Canada	Hamilton	0.9
17	Timmins And District General Hospital	700 Ross Ave E, Timmins, ON P4N 8P2, Canada	Timmins	0.9
18	Sensenbrenner Hospital	101 Progress Crescent, Kapuskasing, ON P5N 3H5, Canada	Kapuskasing	0.9
19	North York General Hospital - General Site	4001 Leslie St, North York, ON M2K 1E1, Canada	North York	0.9
20	Markham Stouffville Hospital - Markham Site	381 Church St, Markham, ON L3P 7P3, Canada	Markham	0.9
21	Georgian Bay General Hospital - Midland Site	1112 St Andrews Dr, Midland, ON L4R 4P4, Canada	Midland	0.9
22	Unity Health Toronto - St. Joseph's	30 The Queensway, Toronto, ON M6R 1B5, Canada	Toronto	1
23	Scarborough Health Network - Scarborough General Site	3050 Lawrence Ave E, Scarborough, ON M1P 2V5, Canada	Scarborough	1
24	Southlake Regional Health Centre	596 Davis Dr, Newmarket, ON L3Y 2P9, Canada	Newmarket	1
25	Woodstock General Hospital	310 Juliana Dr, Woodstock, ON N4V 0A4, Canada	Woodstock	1
26	Quinte Healthcare Corporation - Picton	403 Picton Main St, Prince Edward, ON K0K, Canada	Prince Edward	1
27	St. Marys Memorial Hospital	267 Queen St W, St. Marys, ON N4X 1C4, Canada	Marys	1
28	West Nipissing General Hospital	725 Coursol Rd, Sturgeon Falls, ON P2B 2Y6, Canada	Sturgeon Falls	1
29	Hanover And District Hospital	90 7th Ave, Hanover, ON N4N 1N1, Canada	Hanover	1
30	Perth And Smiths Falls District Hospital - Perth Site	60 Cornelia St W, Smiths Falls, ON K7A 2H9, Canada	Perth	1
31	Grey Bruce Health Services - Lions Head	22 Moore St, Lion's Head, ON N0H 1W0, Canada	Lion’s Head	1
32	Niagara Health System - Port Colborne Site	260 Sugarloaf St, Port Colborne, ON L3K 2N7, Canada	Port Colborne	1.1
33	Sinai Health System - Mount Sinai Hospital	600 University Ave, Toronto, ON M5G 1X5, Canada	Toronto	1.1
34	Alexandra Hospital	29 Noxon St, Ingersoll, ON N5C 1B8, Canada	Ingersoll	1.1
35	Quinte Healthcare Corporation - North Hastings	1-H Manor Ln, Bancroft, ON K0L 1C0, Canada	Bancroft	1.1
36	Grey Bruce Health Services - Wiarton Site	369 Mary St, Wiarton, ON N0H 2T0, Canada	Wiarton	1.1
37	Headwaters Health Care Centre - Orangeville Site	100 Rolling Hills Dr, Orangeville, ON L9W 4X9, Canada	Orangeville	1.1
38	Lakeridge Health - Oshawa Site	1 Hospital Ct, Oshawa, ON L1G 2B9, Canada		1.1
39	Lakeridge Health - Port Perry	451 Paxton St, Port Perry, ON L9L 1L9, Canada	Port Perry	1.1
40	Halton Healthcare Services Corp - Milton	3001 Hospital Gate, Oakville, ON L6M 0L8, Canada	Milton	1.1
41	Collingwood General And Marine Hospital	459 Hume St, Collingwood, ON L9Y 1W9, Canada	Collingwood	1.1
42	Stevenson Memorial Hospital	200 Fletcher Crescent, Alliston, ON L9R 1W7, Canada	Alliston	1.1
43	Hamilton Health Sciences Corp - McMaster Children's Hospital	1200 Main St W, Hamilton, ON L8N 3Z5, Canada	Hamilton	1.1
44	Guelph General Hospital	115 Delhi St, Guelph, ON N1E 4J5, Canada	Guelph	1.2
45	St. Thomas-Elgin General Hospital	189 Elm St, St Thomas, ON N5R 5C4, Canada	St Thomas	1.2
46	Kingston Health Sciences Centre - Kingston General	76 Stuart St, Kingston, ON K7L 2V7, Canada	Kingston	1.2
47	Kingston Health Sciences Centre - Hotel Dieu	166 Brock St, Kingston, ON K7L 5G2, Canada	Kingston	1.2
48	Scarborough Health Network - Centenary	2867 Ellesmere Rd, Scarborough, ON M1E 4B9, Canada	Scarborough	1.2
49	Joseph Brant Hospital	1245 Lakeshore Rd, Burlington, ON L7S 0A2, Canada	Burlington	1.2
50	Strathroy Middlesex General Hospital	395 Carrie St, Strathroy, ON N7G 3J4, Canada	Strathroy	1.2
51	Notre Dame Hospital	1560 Rue Sherbrooke E, Montréal, QC H2L 4M1, Canada	Hearst	1.2
52	Lakeridge Health - Bowmanville	47 Liberty St S, Bowmanville, ON L1C 2N4, Canada	Bowmanville	1.2
53	Northumberland Hills Hospital	1000 Depalma Dr, Cobourg, ON K9A 5W6, Canada	Cobourg	1.2
54	Perth And Smiths Falls District Hospital - Smiths Falls Site	60 Cornelia St W, Smiths Falls, ON K7A 2H9, Canada	Smiths Falls	1.2
55	Humber River Hospital - Wilson Site	1235 Wilson Ave, North York, ON M3M 0B2, Canada	North York	1.2
56	University Health Network - Toronto Western Hospital	399 Bathurst St, Toronto, ON M5T 2S8, Canada	Toronto	1.3
57	Health Sciences North – Ramsey Lake Health Centre	41 Ramsey Lake Rd, Sudbury, ON P3E 5J1, Canada	Sudbury	1.3
58	South Bruce Grey Health Centre - Kincardine	1199 Queen St N, Kincardine, ON N2Z 1G6, Canada	Kincardine	1.3
59	South Bruce Grey Health Centre - Walkerton	21 McGivern St W, Walkerton, ON N0G 2V0, Canada	Walkerton	1.3
60	Cambridge Memorial Hospital	700 Coronation Blvd, Cambridge, ON N1R 3G2, Canada	Cambridge	1.3
61	Bluewater Health - Sarnia General Site	89 Norman St, Sarnia, ON N7T 6S3, Canada	Sarnia	1.3
62	Grey Bruce Health Services - Owen Sound	1800 8th St E, Owen Sound, ON N4K 6M9, Canada	Owen Sound	1.3
63	Glengarry Memorial Hospital	20260 County Rd 43, Alexandria, ON K0C 1A0, Canada	Alexandria	1.3
64	Dryden Regional Health Centre	58 Goodall St, Dryden, ON P8N 2Z6, Canada	Dryden	1.3
65	Trillium Health Partners - Mississauga Hospital	100 Queensway W, Mississauga, ON L5B 1B8, Canada	Mississauga	1.3
66	Hamilton Health Sciences Corp - West Lincoln Memorial Hospital	169 Main St E, Grimsby, ON L3M 1P3, Canada	Grimsby	1.3
67	Niagara Health System - Greater Niagara	5546 Portage Rd, Niagara Falls, ON L2E 6X2, Canada	Niagara Falls	1.4
68	Quinte Healthcare Corporation - Trenton	242 King St, Trenton, ON K8V 5S6, Canada	Trenton	1.4
69	Huron Perth Healthcare Alliance : Stratford General Hospital	46 General Hospital Dr, Stratford, ON N5A 2Y6, Canada	Stratford	1.4
70	Brockville General Hospital - Charles ST Site	75 Charles St, Brockville, ON K6V 1S8, Canada	Brockville	1.4
71	Lake Of The Woods District Hospital	21 Sylvan St, Kenora, ON P9N 3W7, Canada	Kenora	1.4
72	Chatham-Kent Health Alliance - Wallaceburg	325 Margaret Ave, Wallaceburg, ON N8A 2A7, Canada	Wallaceburg	1.4
73	Temiskaming Hospital	421 Shepherdson Rd, New Liskeard, ON P0J 1P0, Canada	New Liskeard	1.4
74	London Health Sciences Centre - University Hospital	339 Windermere Rd, London, ON N6A 5A5, Canada	London	1.4
75	Cornwall Community Hospital - Mcconnell Avenue Site	840 McConnell Ave, Cornwall, ON K6H 5S5, Canada	Cornwall	1.4
76	Markham Stouffville Hospital - Uxbridge Site	4 Campbell Dr, Uxbridge, ON L9P 1S4, Canada	Uxbridge	1.4
77	Halton Healthcare Services Corp - Georgetown	1 Princess Anne Dr, Georgetown, ON L7G 2B8, Canada	Georgetown	1.4
78	Unity Health Toronto - St. Michael's	30 Bond St, Toronto, ON M5B 1W8, Canada	Toronto	1.5
79	Grey Bruce Health Services - Southampton	340 High St, Southampton, ON N0H 2L0, Canada	Southampton	1.5
80	St. Mary's General Hospital	350 Boulevard, Passaic, NJ 07055, USA	Kitchener	1.5
81	Toronto East Health Network - Michael Garron Hospital	825 Coxwell Ave, East York, ON M4C 3E7, Canada	East York	1.5
82	Hamilton Health Sciences Corp - Hamilton General Hospital	237 Barton St E, Hamilton, ON L8L 2X2, Canada	Hamilton	1.5
83	Thunder Bay Regional Health Sciences Centre	980 Oliver Rd, Thunder Bay, ON P7B 6V4	Thunder Bay	1.5
84	William Osler Health System - Brampton Civic	2100 Bovaird Dr E, Brampton, ON L6R 3J7, Canada	Brampton	1.5
85	University Health Network - Toronto General Hospital	190 Elizabeth St, Toronto, ON M5G 2C4, Canada	Toronto	1.6
86	Niagara Health System - Welland County	65 Third St, Welland, ON L3B 4W6, Canada	Welland	1.6
87	Grand River Hospital Corp - Waterloo Site	GRH KW Campus, 835 King St W, Kitchener, ON N2G 1G3, Canada	Kitchener	1.6
88	Orillia Soldiers' Memorial Hospital	170 Colborne St W, Orillia, ON L3V 2Z3, Canada	Orillia	1.6
89	Renfrew Victoria Hospital	499 Raglan St N, Renfrew, ON K7V 1P6, Canada	Renfrew	1.6
90	Chatham-Kent Health Alliance - Chatham	80 Grand Ave W, Chatham, ON N7M 5L9, Canada	Chatham	1.6
91	Hamilton Health Sciences Corp - Juravinski Hospital	711 Concession St, Hamilton, ON L8V 1C3, Canada	Hamilton	1.6
92	Muskoka Algonquin Healthcare - Huntsville District Memorial Hospital	100 Frank Miller Dr, Huntsville, ON P1H 1H7, Canada	Huntsville	1.6
93	Trillium Health Partners - Credit Valley Hospital	2200 Eglinton Ave W, Mississauga, ON L5M 2N1, Canada	Mississauga	1.6
94	Peterborough Regional Health Centre	1 Hospital Dr, Peterborough, ON K9J 7C6, Canada	Peterborough	1.7
95	Campbellford Memorial Hospital	146 Oliver Rd, Campbellford, ON K0L 1L0, Canada	Campbellford	1.7
96	Children's Hospital Of Eastern Ontario	401 Smyth Rd, Ottawa, ON K1H 8L1, Canada	Ottawa	1.7
97	Lennox And Addington County General Hospital	8 Richmond Park Dr, Napanee, ON K7R 2Z4, Canada	Napanee	1.7
98	Tillsonburg District Memorial Hospital	167 Rolph St, Tillsonburg, ON N4G 3Y9, Canada	Tillsonburg	1.7
99	Quinte Healthcare Corporation - Belleville	265 Dundas St E, Belleville, ON K8N 5A9, Canada	Belleville	1.7
100	Lakeridge Health-Ajax Site	580 Harwood Ave S, Ajax, ON L1S 2J4, Canada	Ajax	1.7
101	West Parry Sound Health Centre	6 Albert St, Parry Sound, ON P2A 3A4, Canada	Parry Sound	1.7
102	Brant Community Healthcare System - Brantford General Hospital	200 Terrace Hill St, Brantford, ON N3R 1G9, Canada	Brantford	1.7
103	Erie Shores Healthcare	194 Talbot St W, Leamington, ON N8H 1N9, Canada	Learnington	1.8
104	Ross Memorial Hospital	10 Angeline St N, Lindsay, ON K9V 4M8, Canada	Lindsay	1.8
105	Hawkesbury And District General Hospital	1111 Ghislain St, Hawkesbury, ON K6A 3G5, Canada	Hawkesbury	1.8
106	Sault Area Hospital - Sault Ste Marie	750 Great Northern Rd, Sault Ste. Marie, ON P6B 0A8, Canada	Sault Ste. Marie	1.9
107	Pembroke Regional Hospital	705 MacKay St, Pembroke, ON K8A 1G8, Canada	Pembroke	1.9
108	Halton Healthcare Services Corporation - Oakville-Trafalgar Memorial Hospital	3001 Hospital Gate, Oakville, ON L6M 0L8, Canada	Oakville	1.9
109	London Health Sciences Centre - Victoria Hospital	800 Commissioners Rd E, London, ON N6A 5W9, Canada	London	1.9
110	North Bay Regional Health Centre - North Bay Site	50 College Dr, North Bay, ON P1B 5A4, Canada	North Bay	1.9
111	Windsor Regional Hospital - Ouellette Campus	1030 Ouellette Ave, Windsor, ON N9A 1E1, Canada	Windsor	1.9
112	Queensway Carleton Hospital	3045 Baseline Rd, Nepean, ON K2H 8P4, Canada	Nepean	2
113	Niagara Health System - St Catharines General	1200 Fourth Ave, St. Catharines, ON L2S 0A9, Canada	St. Catharines	2
114	The Ottawa Hospital - Civic Campus	1053 Carling Ave, Ottawa, ON K1Y 4E9, Canada	Ottawa	2.1
115	Groves Memorial Community Hospital	131 Frederick Campbell St, Fergus, ON N1M 0H3, Canada	Fergus	2.1
116	Norfolk General Hospital	365 West St, Simcoe, ON N3Y 1T7, Canada	Simcoe	2.1
117	Royal Victoria Regional Health Centre	201 Georgian Dr, Barrie, ON L4M 6M2, Canada	Barrie	2.2
118	Hopital Montfort	713 Montreal Rd, Ottawa, ON K1K 0T2, Canada	Ottawa	2.3
119	Winchester District Memorial Hospital	566 Louise St, Winchester, ON K0C 2K0, Canada	Winchester	2.4
120	Sunnybrook Health Sciences Centre	2075 Bayview Ave, Toronto, ON M4N 3M5, Canada	Toronto	2.6
121	The Ottawa Hospital - General Campus	501 Smyth Rd, Ottawa, ON K1H 8L6, Canada	Ottawa	2.8
122	Windsor Regional Hospital - Metropolitan Campus	1995 Lens Ave, Windsor, ON N8W 1L9, Canada	Windsor	3
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: locations; Owner: -
--

COPY locations.locations (id, name, address, city, "time", type, key) FROM stdin;
1	Unlisted	unknown	Toronto	1.4	hospital	\N
2	Huron Perth Healthcare Alliance : Clinton Public Hospital	98 Shipley St, Clinton, ON N0M 1L0, Canada	Clinton	0.5	hospital	\N
3	Grey Bruce Health Services - Markdale Site	Ornge Heliport (Grey Bruce Health Services - Markdale Site), 200 Isla St, Markdale, ON N0C 1H0, Canada	Markdale	0.6	hospital	\N
4	William Osler Health System - Etobicoke General	101 Humber College Blvd, Etobicoke, ON M9V 1R8, Canada	Etobicoke	0.6	hospital	\N
5	Mackenzie Health - Vaughan Site	3200 Major MacKenzie Dr W, Vaughan, ON L6A 4Z3, Canada	Vaughan	0.7	hospital	\N
6	The Hospital For Sick Children	555 University Ave, Toronto, ON M5G 1X8, Canada	Toronto	0.7	hospital	\N
7	South Bruce Grey Health Centre - Durham	320 College St N, Durham, ON N0G 1R0, Canada	Durham	0.7	hospital	\N
8	Mackenzie Health - Richmond Hill	10 Trench St, Richmond Hill, ON L4C 4Z3, Canada	Richmond Hill	0.7	hospital	\N
9	Scarborough and Rouge Hospital - Birchmount	3030 Birchmount Rd, Scarborough, ON M1W 3W3, Canada	Scarborough	0.8	hospital	\N
10	Huron Perth Healthcare Alliance : Seaforth Community Hospital	24 Centennial Dr, Seaforth, ON N0K 1W0, Canada	Seaforth	0.8	hospital	\N
11	South Bruce Grey Health Centre - Chesley	39 2nd St SE, Chesley, ON N0G 1L0, Canada	Chesley	0.8	hospital	\N
12	Grey Bruce Health Services - Meaford Site	229 Nelson St W, Meaford, ON N4L 1A3, Canada	Meaford	0.8	hospital	\N
13	Niagara Health System - Fort Erie Douglas	230 Bertie St, Fort Erie, ON L2A 1Z2, Canada	Fort Erie	0.8	hospital	\N
14	St. Joseph's Health Care London - St. Joseph's Hospital	268 Grosvenor St, London, ON N6A 4V2, Canada	London	0.8	hospital	\N
15	Bluewater Health - Charlotte Eleanor Englehart (Petrolia)	450 Blanche St, Petrolia, ON N0N 1R0, Canada	Petrolia	0.8	hospital	\N
16	St. Joseph's Health Care System Hamilton - Charlton Campus	St Joseph's Healthcare Hamilton, 50 Charlton Ave E, Hamilton, ON L8N 4A6, Canada	Hamilton	0.9	hospital	\N
17	Timmins And District General Hospital	700 Ross Ave E, Timmins, ON P4N 8P2, Canada	Timmins	0.9	hospital	\N
18	Sensenbrenner Hospital	101 Progress Crescent, Kapuskasing, ON P5N 3H5, Canada	Kapuskasing	0.9	hospital	\N
19	North York General Hospital - General Site	4001 Leslie St, North York, ON M2K 1E1, Canada	North York	0.9	hospital	\N
20	Markham Stouffville Hospital - Markham Site	381 Church St, Markham, ON L3P 7P3, Canada	Markham	0.9	hospital	\N
21	Georgian Bay General Hospital - Midland Site	1112 St Andrews Dr, Midland, ON L4R 4P4, Canada	Midland	0.9	hospital	\N
22	Unity Health Toronto - St. Joseph's	30 The Queensway, Toronto, ON M6R 1B5, Canada	Toronto	1	hospital	\N
23	Scarborough Health Network - Scarborough General Site	3050 Lawrence Ave E, Scarborough, ON M1P 2V5, Canada	Scarborough	1	hospital	\N
24	Southlake Regional Health Centre	596 Davis Dr, Newmarket, ON L3Y 2P9, Canada	Newmarket	1	hospital	\N
25	Woodstock General Hospital	310 Juliana Dr, Woodstock, ON N4V 0A4, Canada	Woodstock	1	hospital	\N
26	Quinte Healthcare Corporation - Picton	403 Picton Main St, Prince Edward, ON K0K, Canada	Prince Edward	1	hospital	\N
27	St. Marys Memorial Hospital	267 Queen St W, St. Marys, ON N4X 1C4, Canada	Marys	1	hospital	\N
28	West Nipissing General Hospital	725 Coursol Rd, Sturgeon Falls, ON P2B 2Y6, Canada	Sturgeon Falls	1	hospital	\N
29	Hanover And District Hospital	90 7th Ave, Hanover, ON N4N 1N1, Canada	Hanover	1	hospital	\N
30	Perth And Smiths Falls District Hospital - Perth Site	60 Cornelia St W, Smiths Falls, ON K7A 2H9, Canada	Perth	1	hospital	\N
31	Grey Bruce Health Services - Lions Head	22 Moore St, Lion's Head, ON N0H 1W0, Canada	Lion’s Head	1	hospital	\N
32	Niagara Health System - Port Colborne Site	260 Sugarloaf St, Port Colborne, ON L3K 2N7, Canada	Port Colborne	1.1	hospital	\N
33	Sinai Health System - Mount Sinai Hospital	600 University Ave, Toronto, ON M5G 1X5, Canada	Toronto	1.1	hospital	\N
34	Alexandra Hospital	29 Noxon St, Ingersoll, ON N5C 1B8, Canada	Ingersoll	1.1	hospital	\N
35	Quinte Healthcare Corporation - North Hastings	1-H Manor Ln, Bancroft, ON K0L 1C0, Canada	Bancroft	1.1	hospital	\N
36	Grey Bruce Health Services - Wiarton Site	369 Mary St, Wiarton, ON N0H 2T0, Canada	Wiarton	1.1	hospital	\N
37	Headwaters Health Care Centre - Orangeville Site	100 Rolling Hills Dr, Orangeville, ON L9W 4X9, Canada	Orangeville	1.1	hospital	\N
38	Lakeridge Health - Oshawa Site	1 Hospital Ct, Oshawa, ON L1G 2B9, Canada		1.1	hospital	\N
39	Lakeridge Health - Port Perry	451 Paxton St, Port Perry, ON L9L 1L9, Canada	Port Perry	1.1	hospital	\N
40	Halton Healthcare Services Corp - Milton	3001 Hospital Gate, Oakville, ON L6M 0L8, Canada	Milton	1.1	hospital	\N
41	Collingwood General And Marine Hospital	459 Hume St, Collingwood, ON L9Y 1W9, Canada	Collingwood	1.1	hospital	\N
42	Stevenson Memorial Hospital	200 Fletcher Crescent, Alliston, ON L9R 1W7, Canada	Alliston	1.1	hospital	\N
43	Hamilton Health Sciences Corp - McMaster Children's Hospital	1200 Main St W, Hamilton, ON L8N 3Z5, Canada	Hamilton	1.1	hospital	\N
44	Guelph General Hospital	115 Delhi St, Guelph, ON N1E 4J5, Canada	Guelph	1.2	hospital	\N
45	St. Thomas-Elgin General Hospital	189 Elm St, St Thomas, ON N5R 5C4, Canada	St Thomas	1.2	hospital	\N
46	Kingston Health Sciences Centre - Kingston General	76 Stuart St, Kingston, ON K7L 2V7, Canada	Kingston	1.2	hospital	\N
47	Kingston Health Sciences Centre - Hotel Dieu	166 Brock St, Kingston, ON K7L 5G2, Canada	Kingston	1.2	hospital	\N
48	Scarborough Health Network - Centenary	2867 Ellesmere Rd, Scarborough, ON M1E 4B9, Canada	Scarborough	1.2	hospital	\N
49	Joseph Brant Hospital	1245 Lakeshore Rd, Burlington, ON L7S 0A2, Canada	Burlington	1.2	hospital	\N
50	Strathroy Middlesex General Hospital	395 Carrie St, Strathroy, ON N7G 3J4, Canada	Strathroy	1.2	hospital	\N
51	Notre Dame Hospital	1560 Rue Sherbrooke E, Montréal, QC H2L 4M1, Canada	Hearst	1.2	hospital	\N
52	Lakeridge Health - Bowmanville	47 Liberty St S, Bowmanville, ON L1C 2N4, Canada	Bowmanville	1.2	hospital	\N
53	Northumberland Hills Hospital	1000 Depalma Dr, Cobourg, ON K9A 5W6, Canada	Cobourg	1.2	hospital	\N
54	Perth And Smiths Falls District Hospital - Smiths Falls Site	60 Cornelia St W, Smiths Falls, ON K7A 2H9, Canada	Smiths Falls	1.2	hospital	\N
55	Humber River Hospital - Wilson Site	1235 Wilson Ave, North York, ON M3M 0B2, Canada	North York	1.2	hospital	\N
56	University Health Network - Toronto Western Hospital	399 Bathurst St, Toronto, ON M5T 2S8, Canada	Toronto	1.3	hospital	\N
57	Health Sciences North – Ramsey Lake Health Centre	41 Ramsey Lake Rd, Sudbury, ON P3E 5J1, Canada	Sudbury	1.3	hospital	\N
58	South Bruce Grey Health Centre - Kincardine	1199 Queen St N, Kincardine, ON N2Z 1G6, Canada	Kincardine	1.3	hospital	\N
59	South Bruce Grey Health Centre - Walkerton	21 McGivern St W, Walkerton, ON N0G 2V0, Canada	Walkerton	1.3	hospital	\N
60	Cambridge Memorial Hospital	700 Coronation Blvd, Cambridge, ON N1R 3G2, Canada	Cambridge	1.3	hospital	\N
61	Bluewater Health - Sarnia General Site	89 Norman St, Sarnia, ON N7T 6S3, Canada	Sarnia	1.3	hospital	\N
62	Grey Bruce Health Services - Owen Sound	1800 8th St E, Owen Sound, ON N4K 6M9, Canada	Owen Sound	1.3	hospital	\N
63	Glengarry Memorial Hospital	20260 County Rd 43, Alexandria, ON K0C 1A0, Canada	Alexandria	1.3	hospital	\N
64	Dryden Regional Health Centre	58 Goodall St, Dryden, ON P8N 2Z6, Canada	Dryden	1.3	hospital	\N
65	Trillium Health Partners - Mississauga Hospital	100 Queensway W, Mississauga, ON L5B 1B8, Canada	Mississauga	1.3	hospital	\N
66	Hamilton Health Sciences Corp - West Lincoln Memorial Hospital	169 Main St E, Grimsby, ON L3M 1P3, Canada	Grimsby	1.3	hospital	\N
67	Niagara Health System - Greater Niagara	5546 Portage Rd, Niagara Falls, ON L2E 6X2, Canada	Niagara Falls	1.4	hospital	\N
68	Quinte Healthcare Corporation - Trenton	242 King St, Trenton, ON K8V 5S6, Canada	Trenton	1.4	hospital	\N
69	Huron Perth Healthcare Alliance : Stratford General Hospital	46 General Hospital Dr, Stratford, ON N5A 2Y6, Canada	Stratford	1.4	hospital	\N
70	Brockville General Hospital - Charles ST Site	75 Charles St, Brockville, ON K6V 1S8, Canada	Brockville	1.4	hospital	\N
71	Lake Of The Woods District Hospital	21 Sylvan St, Kenora, ON P9N 3W7, Canada	Kenora	1.4	hospital	\N
72	Chatham-Kent Health Alliance - Wallaceburg	325 Margaret Ave, Wallaceburg, ON N8A 2A7, Canada	Wallaceburg	1.4	hospital	\N
73	Temiskaming Hospital	421 Shepherdson Rd, New Liskeard, ON P0J 1P0, Canada	New Liskeard	1.4	hospital	\N
74	London Health Sciences Centre - University Hospital	339 Windermere Rd, London, ON N6A 5A5, Canada	London	1.4	hospital	\N
75	Cornwall Community Hospital - Mcconnell Avenue Site	840 McConnell Ave, Cornwall, ON K6H 5S5, Canada	Cornwall	1.4	hospital	\N
76	Markham Stouffville Hospital - Uxbridge Site	4 Campbell Dr, Uxbridge, ON L9P 1S4, Canada	Uxbridge	1.4	hospital	\N
77	Halton Healthcare Services Corp - Georgetown	1 Princess Anne Dr, Georgetown, ON L7G 2B8, Canada	Georgetown	1.4	hospital	\N
78	Unity Health Toronto - St. Michael's	30 Bond St, Toronto, ON M5B 1W8, Canada	Toronto	1.5	hospital	\N
79	Grey Bruce Health Services - Southampton	340 High St, Southampton, ON N0H 2L0, Canada	Southampton	1.5	hospital	\N
80	St. Mary's General Hospital	350 Boulevard, Passaic, NJ 07055, USA	Kitchener	1.5	hospital	\N
81	Toronto East Health Network - Michael Garron Hospital	825 Coxwell Ave, East York, ON M4C 3E7, Canada	East York	1.5	hospital	\N
82	Hamilton Health Sciences Corp - Hamilton General Hospital	237 Barton St E, Hamilton, ON L8L 2X2, Canada	Hamilton	1.5	hospital	\N
83	Thunder Bay Regional Health Sciences Centre	980 Oliver Rd, Thunder Bay, ON P7B 6V4	Thunder Bay	1.5	hospital	\N
84	William Osler Health System - Brampton Civic	2100 Bovaird Dr E, Brampton, ON L6R 3J7, Canada	Brampton	1.5	hospital	\N
86	Niagara Health System - Welland County	65 Third St, Welland, ON L3B 4W6, Canada	Welland	1.6	hospital	\N
87	Grand River Hospital Corp - Waterloo Site	GRH KW Campus, 835 King St W, Kitchener, ON N2G 1G3, Canada	Kitchener	1.6	hospital	\N
88	Orillia Soldiers' Memorial Hospital	170 Colborne St W, Orillia, ON L3V 2Z3, Canada	Orillia	1.6	hospital	\N
89	Renfrew Victoria Hospital	499 Raglan St N, Renfrew, ON K7V 1P6, Canada	Renfrew	1.6	hospital	\N
90	Chatham-Kent Health Alliance - Chatham	80 Grand Ave W, Chatham, ON N7M 5L9, Canada	Chatham	1.6	hospital	\N
91	Hamilton Health Sciences Corp - Juravinski Hospital	711 Concession St, Hamilton, ON L8V 1C3, Canada	Hamilton	1.6	hospital	\N
92	Muskoka Algonquin Healthcare - Huntsville District Memorial Hospital	100 Frank Miller Dr, Huntsville, ON P1H 1H7, Canada	Huntsville	1.6	hospital	\N
93	Trillium Health Partners - Credit Valley Hospital	2200 Eglinton Ave W, Mississauga, ON L5M 2N1, Canada	Mississauga	1.6	hospital	\N
94	Peterborough Regional Health Centre	1 Hospital Dr, Peterborough, ON K9J 7C6, Canada	Peterborough	1.7	hospital	\N
95	Campbellford Memorial Hospital	146 Oliver Rd, Campbellford, ON K0L 1L0, Canada	Campbellford	1.7	hospital	\N
96	Children's Hospital Of Eastern Ontario	401 Smyth Rd, Ottawa, ON K1H 8L1, Canada	Ottawa	1.7	hospital	\N
97	Lennox And Addington County General Hospital	8 Richmond Park Dr, Napanee, ON K7R 2Z4, Canada	Napanee	1.7	hospital	\N
98	Tillsonburg District Memorial Hospital	167 Rolph St, Tillsonburg, ON N4G 3Y9, Canada	Tillsonburg	1.7	hospital	\N
99	Quinte Healthcare Corporation - Belleville	265 Dundas St E, Belleville, ON K8N 5A9, Canada	Belleville	1.7	hospital	\N
100	Lakeridge Health-Ajax Site	580 Harwood Ave S, Ajax, ON L1S 2J4, Canada	Ajax	1.7	hospital	\N
101	West Parry Sound Health Centre	6 Albert St, Parry Sound, ON P2A 3A4, Canada	Parry Sound	1.7	hospital	\N
102	Brant Community Healthcare System - Brantford General Hospital	200 Terrace Hill St, Brantford, ON N3R 1G9, Canada	Brantford	1.7	hospital	\N
103	Erie Shores Healthcare	194 Talbot St W, Leamington, ON N8H 1N9, Canada	Learnington	1.8	hospital	\N
104	Ross Memorial Hospital	10 Angeline St N, Lindsay, ON K9V 4M8, Canada	Lindsay	1.8	hospital	\N
105	Hawkesbury And District General Hospital	1111 Ghislain St, Hawkesbury, ON K6A 3G5, Canada	Hawkesbury	1.8	hospital	\N
106	Sault Area Hospital - Sault Ste Marie	750 Great Northern Rd, Sault Ste. Marie, ON P6B 0A8, Canada	Sault Ste. Marie	1.9	hospital	\N
107	Pembroke Regional Hospital	705 MacKay St, Pembroke, ON K8A 1G8, Canada	Pembroke	1.9	hospital	\N
108	Halton Healthcare Services Corporation - Oakville-Trafalgar Memorial Hospital	3001 Hospital Gate, Oakville, ON L6M 0L8, Canada	Oakville	1.9	hospital	\N
109	London Health Sciences Centre - Victoria Hospital	800 Commissioners Rd E, London, ON N6A 5W9, Canada	London	1.9	hospital	\N
110	North Bay Regional Health Centre - North Bay Site	50 College Dr, North Bay, ON P1B 5A4, Canada	North Bay	1.9	hospital	\N
111	Windsor Regional Hospital - Ouellette Campus	1030 Ouellette Ave, Windsor, ON N9A 1E1, Canada	Windsor	1.9	hospital	\N
112	Queensway Carleton Hospital	3045 Baseline Rd, Nepean, ON K2H 8P4, Canada	Nepean	2	hospital	\N
113	Niagara Health System - St Catharines General	1200 Fourth Ave, St. Catharines, ON L2S 0A9, Canada	St. Catharines	2	hospital	\N
114	The Ottawa Hospital - Civic Campus	1053 Carling Ave, Ottawa, ON K1Y 4E9, Canada	Ottawa	2.1	hospital	\N
115	Groves Memorial Community Hospital	131 Frederick Campbell St, Fergus, ON N1M 0H3, Canada	Fergus	2.1	hospital	\N
116	Norfolk General Hospital	365 West St, Simcoe, ON N3Y 1T7, Canada	Simcoe	2.1	hospital	\N
117	Royal Victoria Regional Health Centre	201 Georgian Dr, Barrie, ON L4M 6M2, Canada	Barrie	2.2	hospital	\N
118	Hopital Montfort	713 Montreal Rd, Ottawa, ON K1K 0T2, Canada	Ottawa	2.3	hospital	\N
119	Winchester District Memorial Hospital	566 Louise St, Winchester, ON K0C 2K0, Canada	Winchester	2.4	hospital	\N
120	Sunnybrook Health Sciences Centre	2075 Bayview Ave, Toronto, ON M4N 3M5, Canada	Toronto	2.6	hospital	\N
121	The Ottawa Hospital - General Campus	501 Smyth Rd, Ottawa, ON K1H 8L6, Canada	Ottawa	2.8	hospital	\N
122	Windsor Regional Hospital - Metropolitan Campus	1995 Lens Ave, Windsor, ON N8W 1L9, Canada	Windsor	3	hospital	\N
126	Pearson Intl Airport Terminal 1 (Canada Level 3)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T1 Canada Level 3
127	Pearson Intl Airport Terminal 1 (Canada Level 2)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T1 Canada Level 2
128	Pearson Intl Airport Terminal 1 (International)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T1 International
129	Pearson Intl Airport Terminal 1 (United States)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T1 United States
123	Pearson Airport Terminal 3 (Canada)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T3 Canada
124	Pearson Airport Terminal 3 (International)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T3 International
125	Pearson Airport Terminal 3 (United States)	Toronto Pearson International Airport (YYZ), 6301 Silver Dart Dr, Mississauga, ON L5P 1B2, Canada	Mississauga	0.083333336	airport	T3 United States
85	University Health Network - Toronto General Hospital	200 Elizabeth St, Toronto, ON M5G 2C4, Canada	Toronto	1.6	hospital	\N
\.


--
-- Data for Name: ttc; Type: TABLE DATA; Schema: locations; Owner: -
--

COPY locations.ttc (id, date, "time", condition, delay, line, start, ending, short_line) FROM stdin;
1	2021-03-30	14:51:40	Resume	\N	501 Queen	Greenwood Ave	Broadview Ave	[501]
2	2021-03-30	14:51:02	Resume	\N	503 Kingston Rd	Broadview Ave	Kingston Rd	[503]
3	2021-03-30	14:26:39	Detour	\N	97B Yonge	King St	Bay St	[]
4	2021-03-30	14:02:37	No Service	\N	501 Queen	Greenwood Ave	Broadview Ave	[501]
5	2021-03-30	14:00:35	No Service	\N	503 Kingston Rd	Broadview Ave	Kingston Rd	[503]
6	2021-03-30	13:44:25	Resume	\N	501 Queen	Coxwell Ave	\N	[501]
7	2021-03-30	13:28:08	Detour	\N	501 Queen	Russell Yard	\N	[501]
8	2021-03-30	13:20:31	Detour	\N	73C Royal York	Martin Grove Rd, Finch Ave W	Westmore Dr	[]
9	2021-03-30	11:26:32	Resume	\N	Line 1 Yonge-University	York University	\N	[1]
10	2021-03-30	11:14:59	Delay	0.25	Line 1 Yonge-University	York University	\N	[1]
11	2021-03-30	09:47:40	Resume	\N	501 Queen	Strachan Ave	\N	[501]
12	2021-03-30	09:30:00	Detour	\N	501 Queen	Bathurst St, King St W	Shaw St	[501]
13	2021-03-30	08:37:24	Delay	0.25	Line 1 Yonge-University	Bloor-Yonge	Eglinton	[1]
14	2021-03-30	08:23:18	No Service	\N	Line 1 Yonge-University	Bloor-Yonge	Eglinton	[1]
15	2021-03-30	07:49:20	No Service	\N	Line 1 Yonge-University	Bloor-Yonge	Eglinton	[1]
16	2021-03-30	07:31:14	Resume	\N	68 Warden	Lawrence Ave E	\N	[68]
17	2021-03-30	07:24:21	Resume	\N	167 Pharmacy North	Steeles Ave E	\N	[167]
18	2021-03-30	07:22:07	Detour	\N	68 Warden	Lawrence Ave W, Wayne Ave	Sherwood Ave	[68]
19	2021-03-30	07:16:14	Detour	\N	167 Pharmacy North	Esna Park Dr, Telson, Victoria Park Ave	Steeles Ave	[167]
20	2021-03-30	05:58:48	Resume	\N	12 Kingston Road	Danforth	\N	[12]
21	2021-03-30	05:55:55	Detour	\N	12 Kingston Road	Eglinton Ave E, Midland Ave	Danforth Ave	[12]
22	2021-03-30	02:17:25	Detour	\N	320 Yonge	Eglinton Ave E, Midland Ave	Danforth Ave	[320]
23	2021-03-30	01:18:17	Resume	\N	306 Carlton	Elizabeth	\N	[306]
24	2021-03-30	01:12:47	Detour	\N	306 Carlton	Elizabeth	\N	[306]
25	2021-03-30	00:00:20	No Service	\N	Line 1 Yonge-University	Finch	Sheppard stations	[1]
26	2021-03-30	23:03:51	Resume	\N	83 Jones	Boultbee Ave	\N	[83]
27	2021-03-30	23:00:18	No Service	\N	Line 1 Yonge-University	Finch	Sheppard stations	[1]
28	2021-03-30	22:00:16	No Service	\N	Line 1 Yonge-University	Finch	Sheppard stations	[1]
29	2021-03-30	21:42:07	Detour	\N	83 Jones	Finch	Sheppard stations	[83]
30	2021-03-30	20:01:31	Resume	\N	Line 4 Sheppard	Finch	Sheppard stations	[4]
31	2021-03-30	19:53:09	Delay	\N	Line 4 Sheppard	Finch	Sheppard stations	[4]
32	2021-03-30	19:28:17	Resume	\N	505 Dundas	Dundas W Station	\N	[505]
33	2021-03-30	19:27:27	Delay	0.25	505 Dundas	Dundas W Station	\N	[505]
34	2021-03-30	19:01:24	Resume	\N	Line 2 Bloor-Danforth	Broadview	\N	[2]
35	2021-03-29	18:59:37	Delay	0.25	Line 2 Bloor-Danforth	Broadview	\N	[2]
36	2021-03-29	18:41:41	Resume	\N	Line 1 Yonge-University	York University	\N	[1]
37	2021-03-29	18:33:35	Delay	\N	Line 1 Yonge-University	York University	\N	[1]
\.


--
-- Data for Name: yrt; Type: TABLE DATA; Schema: locations; Owner: -
--

COPY locations.yrt (id, date, "time", condition, delay, line, start, ending, short_line) FROM stdin;
1	2021-03-30	15:18:33	Resume	\N	Route 8 and Viva purple	\N	\N	[8]
2	2021-03-30	15:07:58	Detour	\N	Route 8 and Viva purple	Highway 7	Kennedy	[8]
3	2021-03-29	13:18:39	Detour	\N	Route 50	Queensway	Crates Marine	[50]
4	2021-03-29	05:41:45	Delay	0.5	Route 9 NB	Oakborough Drive	\N	[9]
5	2021-03-28	10:39:14	Delay	0.8333333	Route 4 WB	Forestwood Street	\N	[4]
6	2021-03-26	06:08:25	Delay	0.33333334	Route 56, 6:23 WB	Gorham	\N	[]
7	2021-03-26	06:07:36	Delay	0.33333334	Route 88, 6:29 NB	Emerald Gate	\N	[]
8	2021-03-22	16:47:18	Detour	\N	UPDATE: All Route 2	\N	\N	[2]
9	2021-03-22	16:46:09	Resume	\N	Viva orange	\N	\N	[]
10	2021-03-22	16:45:35	Delay	0.33333334	Route 2, 4:11 EB	Denison	Esna Park	[]
11	2021-03-22	13:45:11	Detour	\N	Route 1 and Viva orange WB	Hunter's Point	Yonge	[1]
12	2021-03-20	15:33:27	Delay	0.33333334	Route 86 NB	Silver Linder Drive	\N	[86]
13	2021-03-19	12:04:34	Delay	0.5	Route 4A, EB 11:54	\N	\N	[]
14	2021-03-19	08:59:25	Delay	0.33333334	Route 20 NB	Macintosh Blvd.	\N	[20]
15	2021-03-18	18:59:23	Delay	\N	25 EB	McCowan Road	Major Mackenzie Drive	[25]
16	2021-03-18	13:22:32	Resume	\N	Route 26	\N	\N	[26]
17	2021-03-18	12:54:38	Delay	0.33333334	Route 522, EB 12:45	McCowan	\N	[]
18	2021-03-18	12:47:52	Detour	\N		Jane	Locke	[]
19	2021-03-17	16:41:08	Delay	0.5	Route 4, 5:21 EB	Jane	Rutherford	[]
20	2021-03-17	16:31:10	Delay	0.5	Route 85, 5:16 EB	\N	\N	[]
21	2021-03-17	16:06:41	Detour	\N	Route 26 SB	Locke	Caldari	[26]
22	2021-03-16	16:56:48	Resume	\N	Route 86	\N	\N	[86]
23	2021-03-16	16:52:13	Delay	0.33333334	Route 55, 5:22 EB	Newmarket Terminal	\N	[]
24	2021-03-16	12:53:34	Delay	\N	Route 86	Weldrick as train arms are down	\N	[86]
25	2021-03-15	17:26:25	Detour	\N	viva yellow WB	Davis Drive	Carlson Drive	[]
26	2021-03-15	10:07:00	Resume	\N	Route 13	\N	\N	[13]
27	2021-03-15	09:13:25	Detour	\N	Route 13	Islington	Steeles	[13]
\.


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: locations; Owner: -
--

SELECT pg_catalog.setval('locations.airports_id_seq', 1, true);


--
-- Name: hospitals_id_seq; Type: SEQUENCE SET; Schema: locations; Owner: -
--

SELECT pg_catalog.setval('locations.hospitals_id_seq', 1, false);


--
-- Name: newtable_id_seq; Type: SEQUENCE SET; Schema: locations; Owner: -
--

SELECT pg_catalog.setval('locations.newtable_id_seq', 1, false);


--
-- Name: ttc_id_seq; Type: SEQUENCE SET; Schema: locations; Owner: -
--

SELECT pg_catalog.setval('locations.ttc_id_seq', 1, false);


--
-- Name: yrt_id_seq; Type: SEQUENCE SET; Schema: locations; Owner: -
--

SELECT pg_catalog.setval('locations.yrt_id_seq', 1, false);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

