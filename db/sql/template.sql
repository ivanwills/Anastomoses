-- Create the template table and initial contents

-- DROP TABLE template;

CREATE TABLE template (
	template_id          SERIAL PRIMARY KEY,
	template_question    VARCHAR NOT NULL UNIQUE,
	template_answer      VARCHAR NOT NULL,
	template_q_table     VARCHAR,
	template_q_column    VARCHAR,
	template_a_table     VARCHAR,
	template_a_column    VARCHAR
);

COMMENT ON TABLE  template                      IS '';
COMMENT ON COLUMN template.template_question    IS '';
COMMENT ON COLUMN template.template_answer      IS '';
COMMENT ON COLUMN template.template_q_table     IS '';
COMMENT ON COLUMN template.template_q_column    IS '';
COMMENT ON COLUMN template.template_a_table     IS '';
COMMENT ON COLUMN template.template_a_column    IS '';

-- INSERT INTO template VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO template VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO template VALUES (DEFAULT, DEFAULT, 1, 1, '');
-- INSERT INTO template VALUES (DEFAULT, DEFAULT, 1, 1, '');
