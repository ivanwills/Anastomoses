
CREATE VIEW question_answer_view AS
SELECT *
FROM question q
    JOIN question_answer qa USING (question_id)
    JOIN answer a USING (answer_id);
