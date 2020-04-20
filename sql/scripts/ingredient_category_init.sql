CREATE TABLE robot.ingredient_category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO robot.ingredient_category VALUES
