
CREATE TABLE robot.customer (
  id INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) DEFAULT NULL,
  last_name VARCHAR(255) DEFAULT NULL,
  id_civility INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = MYISAM,
CHARACTER SET latin1,
CHECKSUM = 0,
COLLATE latin1_swedish_ci;

INSERT INTO robot.customer
(first_name, last_name, id_civility)
VALUES
('Nicolas', 'Redard', (SELECT id FROM civility WHERE code = 'MR')),
('Nicolas', 'Cortell', (SELECT id FROM civility WHERE code = 'MR')),
('Alexis', 'Redard', (SELECT id FROM civility WHERE code = 'MR')),
('Tamère', 'Labitch', (SELECT id FROM civility WHERE code = 'MME')),
('Tasoeur', 'LaCatin', (SELECT id FROM civility WHERE code = 'MLLE'));
