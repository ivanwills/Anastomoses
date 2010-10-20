-- Create the category table and initial contents

-- DROP TABLE category;

CREATE TABLE category (
	category_id          SERIAL PRIMARY KEY,
	category             VARCHAR NOT NULL,
	parent_category_id   INTEGER REFERENCES category (category_id),
    UNIQUE(category, parent_category_id)
);

COMMENT ON TABLE  category                    IS '';
COMMENT ON COLUMN category.category           IS '';
COMMENT ON COLUMN category.parent_category_id IS '';

-- INSERT INTO category VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO category VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO category VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO category VALUES (DEFAULT, DEFAULT, 1, 1, '');
