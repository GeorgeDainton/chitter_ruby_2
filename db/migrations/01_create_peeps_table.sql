 CREATE TABLE peeps(id SERIAL PRIMARY KEY, content TEXT, time timestamp(0) DEFAULT localtimestamp NOT NULL);