
CREATE SEQUENCE account_a_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE address_ad_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE SEQUENCE manymanay_mm_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

CREATE TABLE account (
	a_id integer DEFAULT nextval('public.account_a_id_seq'::regclass) NOT NULL,
	a_user integer,
	a_number integer
);

CREATE TABLE address (
	ad_id integer DEFAULT nextval('public.address_ad_id_seq'::regclass) NOT NULL,
	ad_name character varying(128)
);

CREATE TABLE manymany (
	mm_id integer DEFAULT nextval('public.manymanay_mm_id_seq'::regclass) NOT NULL,
	mm_user integer,
	mm_addr integer
);

CREATE TABLE one (
	o_id integer,
	o_name character varying(10)
);

ALTER TABLE users
	ADD COLUMN u_e1 integer,
	ADD COLUMN u_e2 integer,
	ADD COLUMN u_e3 character varying(128),
	ADD COLUMN u_p4 character varying(128);

ALTER SEQUENCE account_a_id_seq
	OWNED BY public.account.a_id;

ALTER SEQUENCE address_ad_id_seq
	OWNED BY public.address.ad_id;

ALTER SEQUENCE manymanay_mm_id_seq
	OWNED BY public.manymany.mm_id;

ALTER TABLE account
	ADD CONSTRAINT account_pkey PRIMARY KEY (a_id);

ALTER TABLE address
	ADD CONSTRAINT address_pkey PRIMARY KEY (ad_id);

ALTER TABLE manymany
	ADD CONSTRAINT manymany_pkey PRIMARY KEY (mm_id);

ALTER TABLE manymany
	ADD CONSTRAINT manymany_address_ad_id_fk FOREIGN KEY (mm_addr) REFERENCES public.address(ad_id);

ALTER TABLE manymany
	ADD CONSTRAINT manymany_users_u_id_fk FOREIGN KEY (mm_user) REFERENCES public.users(u_id);
