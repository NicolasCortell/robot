CREATE TABLE robot.recipe_category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB;

INSERT INTO robot.recipe_category VALUES
