-- Create the question table and initial contents

-- DROP TABLE question;

CREATE TABLE question (
	question_id          SERIAL PRIMARY KEY,
	question             VARCHAR NOT NULL,
	category_id          INTEGER REFERENCES category (category_id) NOT NULL,
	question_description VARCHAR,
    question_template_id INTEGER REFERENCES question_template(question_template_id),
    UNIQUE(question, category_id)
);

COMMENT ON TABLE  question                      IS '';
COMMENT ON COLUMN question.question             IS '';
COMMENT ON COLUMN question.category_id          IS '';
COMMENT ON COLUMN question.question_description IS '';

-- INSERT INTO question VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question VALUES (DEFAULT, DEFAULT, 1, 1, '');
