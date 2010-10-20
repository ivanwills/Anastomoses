-- Create the answer table and initial contents

-- DROP TABLE answer;

CREATE TABLE answer (
	answer_id          SERIAL PRIMARY KEY,
	answer             VARCHAR NOT NULL UNIQUE,
    answer_list
	answer_description VARCHAR,
    answer_truth       BOOLEAN DEFAULT TRUE
);

COMMENT ON TABLE  answer                    IS '';
COMMENT ON COLUMN answer.answer             IS '';
COMMENT ON COLUMN answer.answer_description IS '';

-- INSERT INTO answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
