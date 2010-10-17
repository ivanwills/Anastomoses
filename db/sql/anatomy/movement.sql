--

-- DROP TABLE IF EXISTS movement;

CREATE TABLE movement (
    movement_id SERIAL PRIMARY KEY,
    movement    varchar
);

COMMENT ON TABLE  movement             IS '';
COMMENT ON COLUMN movement.movement_id IS '';
COMMENT ON COLUMN movement.movement    IS '';
