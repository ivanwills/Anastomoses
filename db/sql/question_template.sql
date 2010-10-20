-- Create the question_template table and initial contents

-- DROP TABLE question_template;

CREATE TABLE question_template (
	question_template_id  SERIAL PRIMARY KEY,
	question_template     VARCHAR NOT NULL UNIQUE,
	answer_template       VARCHAR NOT NULL,
	qtable                VARCHAR NOT NULL,
	qcolumn               VARCHAR NOT NULL,
	atable                VARCHAR,
	acolumn               VARCHAR NOT NULL,
	join_table            VARCHAR
);

COMMENT ON TABLE  question_template                      IS '';
COMMENT ON COLUMN question_template.question_template_id IS '';
COMMENT ON COLUMN question_template.question_template    IS '';
COMMENT ON COLUMN question_template.answer_template      IS '';
COMMENT ON COLUMN question_template.qtable               IS '';
COMMENT ON COLUMN question_template.qcolumn              IS '';
COMMENT ON COLUMN question_template.atable               IS '';
COMMENT ON COLUMN question_template.acolumn              IS '';
COMMENT ON COLUMN question_template.join_table           IS '';

-- INSERT INTO question_template VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question_template VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question_template VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO question_template VALUES (DEFAULT, DEFAULT, 1, 1, '');
