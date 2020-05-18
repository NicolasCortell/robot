DROP PROCEDURE IF EXISTS sp_recipe_category_get;
DELIMITER $$

CREATE PROCEDURE sp_recipe_category_get()
BEGIN
    SELECT *
    FROM recipe_category 
    ORDER BY display_order ASC ;
END $$

DELIMITER ;