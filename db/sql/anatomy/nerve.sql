--

-- DROP TABLE IF EXISTS nerve;

CREATE TABLE anatomy.nerve (
    nerve_id        SERIAL PRIMARY KEY,
    nerve           varchar,
    parent_nerve_id INTEGER REFERENCES anatomy.nerve(nerve_id)
);

COMMENT ON TABLE  anatomy.nerve                 IS '';
COMMENT ON COLUMN anatomy.nerve.nerve_id        IS '';
COMMENT ON COLUMN anatomy.nerve.nerve           IS '';
COMMENT ON COLUMN anatomy.nerve.parent_nerve_id IS '';
