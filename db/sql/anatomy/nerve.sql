-- 

-- DROP TABLE nerve IF EXISTS;

CREATE TABLE nerve (
    nerve_id        SERIAL PRIMARY KEY,
    nerve           varchar,
    parent_nerve_id INTEGER REFERENCES parent_nerve(parent_nerve_id)
);
