CREATE DATABASE stage;
CREATE USER vagrant@172.16.0.20 IDENTIFIED BY 'vagrant';
GRANT ALL PRIVILEGES ON stage.* TO 'root';
CREATE TABLE stage.stagiaires (
id     INT AUTO_INCREMENT PRIMARY KEY,
prenom VARCHAR(20) NOT NULL,
nom    VARCHAR(30) NOT NULL,
email  VARCHAR(50) NOT NULL,
UNIQUE(prenom,nom));
INSERT INTO stage.stagiaires (prenom,nom,email) VALUES ('Émilie','Parker','eparker@gmail.com');
INSERT INTO stage.stagiaires (prenom,nom,email) VALUES ('Igor','Gonzola','igonzola@hotmail.com');
INSERT INTO stage.stagiaires (prenom,nom,email) VALUES ('Amapola','Perez','aperez@gmail.com');
INSERT INTO stage.stagiaires (prenom,nom,email) VALUES ('Aymar','Tine','atine@gmail.com');
INSERT INTO stage.stagiaires (prenom,nom,email) VALUES ('Rosalie','Constant','rconstant@gmail.com');