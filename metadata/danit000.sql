CREATE TABLE answer
(
    a_id INTEGER DEFAULT nextval('answers_a_id_seq'::regclass) PRIMARY KEY NOT NULL,
    a_question_id INTEGER,
    a_text VARCHAR(512),
    a_type INTEGER DEFAULT 0
);
CREATE TABLE "group"
(
    g_id INTEGER DEFAULT nextval('groups_g_id_seq'::regclass) PRIMARY KEY NOT NULL,
    g_name VARCHAR(32)
);
CREATE TABLE question
(
    q_id INTEGER DEFAULT nextval('questions_q_id_seq'::regclass) PRIMARY KEY NOT NULL,
    q_number VARCHAR(4),
    q_text VARCHAR(2048),
    q_date_add TIMESTAMP WITH TIME ZONE DEFAULT now(),
    q_header VARCHAR(256)
);
CREATE TABLE users
(
    u_id INTEGER DEFAULT nextval('users_u_id_seq'::regclass) PRIMARY KEY NOT NULL,
    u_name VARCHAR(64),
    u_regdate TIMESTAMP DEFAULT now(),
    u_login VARCHAR(32),
    u_passwd VARCHAR(32),
    u_group INTEGER
);