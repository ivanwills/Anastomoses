--

-- DROP TABLE IF EXISTS movement;

CREATE TABLE anatomy.movement (
    movement_id SERIAL PRIMARY KEY,
    movement    varchar
);

COMMENT ON TABLE  anatomy.movement             IS '';
COMMENT ON COLUMN anatomy.movement.movement_id IS '';
COMMENT ON COLUMN anatomy.movement.movement    IS '';
