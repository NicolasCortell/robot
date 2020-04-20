CREATE TABLE robot.recipe (
    /*UNSIGNED is a number always positif*/
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe_category INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  duration INT(3), /*minute*/
  quantity INT(2) NOT NULL, /*parts*/
  detail TEXT,
  creation_date DATE,
  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk_recipe_category FOREIGN KEY (id_recipe_category) REFERENCES robot.recipe_category(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_bin;

INSERT INTO robot.recipe VALUES

/*(id,id_recipe_category,nname_recipe,duration,quantity,detail,creation_date)*/
("Plat","Carbonara",40,2,"Recette calorique","2020/04/16"),
("Vegan","Salade",10,2,"Recette healthy","2020/04/15");