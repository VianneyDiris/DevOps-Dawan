CREATE DATABASE stage;
CREATE USER <USERNAME>@<IP_DOCKER_1> IDENTIFIED BY <PASSWORD>;
GRANT ALL PRIVILEGES ON stage.* TO <USERNAME>@<IP_DOCKER_1>;
CREATE TABLE stage.stagiaires (
id     INT AUTO_INCREMENT PRIMARY_KEY,
prenom VARCHAR(20) NOT NULL,
nom    VARCHAR(30) NOT NULL,
email  VARCHAR(50) NOT NULL,
UNIQUE (prenom,nom));
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Fabrice','DEVIENNE','fabrizzio.port@hotmail.fr');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Jéremie','BELS','j.bels@yahoo.fr');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Tanguy','RICOUART','tanguy.ricouart@outlook.fr');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Khalid','SMOUHI','smouhi@gmail.com');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Vianney','DIRIS','vianney.diris@gmail.com');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Benjamin','BLONDEAU','benjiblondeau@gmail.com');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Stephan','SEGARRA','stsmail@free.fr');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Abdelmajid','AIT:MANSSOUR','majid.mans@gmail.com');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Antoine','MIKOLINSKI','a.mikolinski@icloud.com');
INSERT INTO stage.stagiaires (prenom','nom','email) VALUES ('Olivier','DARAS','olivier.daras@gmail.com');
