--

-- DROP TABLE IF EXISTS nerve;

CREATE TABLE nerve (
    nerve_id        SERIAL PRIMARY KEY,
    nerve           varchar,
    parent_nerve_id INTEGER REFERENCES nerve(nerve_id)
);

COMMENT ON TABLE  nerve                 IS '';
COMMENT ON COLUMN nerve.nerve_id        IS '';
COMMENT ON COLUMN nerve.nerve           IS '';
COMMENT ON COLUMN nerve.parent_nerve_id IS '';
