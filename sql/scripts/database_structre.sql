-- DB creation
CREATE DATABASE blend_eat
CHARACTER SET utf8
COLLATE utf8_bin;

-- ingredient_category  
CREATE TABLE ingredient_category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,
  
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- season
CREATE TABLE season (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL  COLLATE utf8_general_ci,

  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- ingredient
CREATE TABLE ingredient (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (50)  COLLATE utf8_general_ci,
  id_ingredient_category INT NOT NULL,
  is_vegan BOOLEAN,
  detail TEXT,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__ingredient__ingredient_category FOREIGN KEY (id_ingredient_category) REFERENCES ingredient_category(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- ingredient_season
CREATE TABLE ingredient_season (
  id INT NOT NULL AUTO_INCREMENT,
  id_ingredient INT NOT NULL,
  id_season INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__ingredient_season__ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id),
  CONSTRAINT fk__ingredient_season__season FOREIGN KEY (id_season) REFERENCES season(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- media
CREATE TABLE media (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50)  COLLATE utf8_general_ci,
  media_path VARCHAR(50) COLLATE utf8_general_ci,
  table_name VARCHAR (50),
  id_external INT NOT NULL,
  
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


-- recipe_category
CREATE TABLE recipe_category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,
  display_order INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


-- recipe
CREATE TABLE recipe (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe_category INT NOT NULL,
  name VARCHAR(100) NOT NULL COLLATE utf8_general_ci,
  duration INT(3), 
  quantity INT(2) NOT NULL, 
  detail TEXT COLLATE utf8_general_ci,
  creation_date DATE,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe__recipe_category FOREIGN KEY (id_recipe_category) REFERENCES recipe_category(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;
 
-- recipe_ingredient
CREATE TABLE recipe_ingredient (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_ingredient INT NULL,
  detail TEXT COLLATE utf8_general_ci,
  quantity VARCHAR(20) NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_ingredient__recipe FOREIGN KEY (id_recipe) REFERENCES recipe(id),
  CONSTRAINT fk__recipe_ingredient__ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- robot
CREATE TABLE robot (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,

  PRIMARY KEY (id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


-- recipe_robot
CREATE TABLE recipe_robot (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_robot INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_robot__recipe FOREIGN KEY (id_recipe) REFERENCES recipe(id),
  CONSTRAINT fk__recipe_robot__robot FOREIGN KEY (id_robot) REFERENCES robot(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- accessory
CREATE TABLE accessory (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,

  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

-- robot_accessory
CREATE TABLE robot_accessory (
  id INT NOT NULL AUTO_INCREMENT,
  id_accessory INT NOT NULL,
  id_robot INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__robot_accessory__robot FOREIGN KEY (id_robot) REFERENCES robot(id),
  CONSTRAINT fk__robot_accessory__accessory FOREIGN KEY (id_accessory) REFERENCES accessory(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


-- recipe_accessory
CREATE TABLE recipe_accessory (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_accessory INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_accessory__recipe FOREIGN KEY (id_recipe) REFERENCES recipe(id),
  CONSTRAINT fk__recipe_accessory__accessory FOREIGN KEY (id_accessory) REFERENCES accessory(id)
)


-- recipe_step
CREATE TABLE recipe_step (
  id INT NOT NULL AUTO_INCREMENT,
  step INT NOT NULL,
  detail TEXT NOT NULL COLLATE utf8_general_ci,
  id_recipe_robot INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_step__recipe_robot FOREIGN KEY (id_recipe_robot) REFERENCES recipe_robot(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


