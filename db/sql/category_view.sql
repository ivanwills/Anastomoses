
CREATE VIEW category_view AS
WITH RECURSIVE category_parts(category_id, category, parent_category_id, depth, path, cycle) AS (
        SELECT category_id
            , category
            , parent_category_id
            , 1
            , ARRAY[category_id]
            , false
        FROM category
        WHERE parent_category_id IS NULL
    UNION ALL
        SELECT t.category_id
            , t.category
            , t.parent_category_id
            , tp.depth + 1
            , path || t.category_id
            , t.category_id = ANY(path)
        FROM category_parts tp, category t
        WHERE tp.category_id = t.parent_category_id
    )
SELECT *
FROM category_parts
ORDER BY path;
