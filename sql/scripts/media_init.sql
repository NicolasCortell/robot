CREATE TABLE robot.media (
  id INT NOT NULL AUTO_INCREMENT,
  media_path VARCHAR(50),
  table_name VARCHAR (10),
  id_external INT NOT NULL,
  
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_bin;

INSERT INTO robot.media VALUES
