--

-- DROP TABLE IF EXISTS muscle_movement;

CREATE TABLE muscle_movement (
    muscle_id          INTEGER REFERENCES muscle  (muscle_id  ),
    movement_id        INTEGER REFERENCES movement(movement_id),
    UNIQUE(muscle_id, movement_id)
);

COMMENT ON TABLE  muscle_movement                    IS '';
COMMENT ON COLUMN muscle_movement.muscle_id          IS '';
COMMENT ON COLUMN muscle_movement.movement_id        IS '';
