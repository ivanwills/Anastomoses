-- Create the question_answer table and initial contents

-- DROP TABLE question_answer;

CREATE TABLE question_answer (
	question_id                 INTEGER REFERENCES question (question_id ) NOT NULL,
	answer_id                   INTEGER REFERENCES answer   (answer_id   ) NOT NULL,
	question_answer_description VARCHAR
);

COMMENT ON TABLE  question_answer                             IS '';
COMMENT ON COLUMN question_answer.question_id                 IS '';
COMMENT ON COLUMN question_answer.answer_id                   IS '';
COMMENT ON COLUMN question_answer.question_answer_description IS '';

-- INSERT INTO question_answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question_answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question_answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question_answer VALUES (DEFAULT, DEFAULT, 1, 1, '');
