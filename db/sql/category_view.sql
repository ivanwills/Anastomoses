
CREATE OR REPLACE VIEW category_view AS
WITH RECURSIVE category_parts(category_id, category, parent_category_id, question_count, depth, path_ids, path, cycle) AS (
        SELECT category_id
            , category
            , parent_category_id
            , ( SELECT COUNT(*) FROM question q WHERE q.category_id = c.category_id )
            , 1
            , ARRAY[category_id]
            , '/' || category
            , false
        FROM category c
        WHERE parent_category_id IS NULL
    UNION ALL
        SELECT t.category_id
            , t.category
            , t.parent_category_id
            , ( SELECT COUNT(*) FROM question q WHERE q.category_id = t.category_id )
            , tp.depth + 1
            , path_ids || t.category_id
            , path || '/' || t.category
            , t.category_id = ANY(path_ids)
        FROM category_parts tp, category t
        WHERE tp.category_id = t.parent_category_id
    )
SELECT *
FROM category_parts
ORDER BY path;
