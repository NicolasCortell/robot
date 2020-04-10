DROP PROCEDURE IF EXISTS sp_test_get;
DELIMITER $$

CREATE PROCEDURE sp_test_get (
    IN _code VARCHAR(3)
)
BEGIN
    SELECT *
    FROM test
    WHERE code = _code;
END $$

DELIMITER ;