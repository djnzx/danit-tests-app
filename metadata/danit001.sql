CREATE SEQUENCE role_r_id_seq;

CREATE TABLE role
(
    r_id INTEGER DEFAULT nextval('role_r_id_seq'::regclass) PRIMARY KEY NOT NULL,
    r_name VARCHAR(32)
);

ALTER TABLE public.users ADD u_role INT DEFAULT 1 NULL;

INSERT INTO public.role (r_id, r_name) VALUES (1, 'STUDENT');
INSERT INTO public.role (r_id, r_name) VALUES (2, 'TEACHER');
INSERT INTO public.role (r_id, r_name) VALUES (3, 'ADMIN');
