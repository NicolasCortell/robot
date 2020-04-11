DROP PROCEDURE IF EXISTS sp_customer_get;
DELIMITER $$

CREATE PROCEDURE sp_customer_get (
    IN _code VARCHAR(10)
)
BEGIN
    SELECT *
    FROM customer c
    INNER JOIN civility t ON t.id = c.id_civility
    WHERE t.code = _code;
END $$

DELIMITER ;