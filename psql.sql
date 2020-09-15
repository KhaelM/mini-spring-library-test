DROP TABLE acteur_film;
DROP TABLE acteur;
DROP TABLE FILM;
DROP TABLE REALISATEUR;

CREATE TABLE realisateur (
	id SERIAL PRIMARY KEY,
	nom varchar(30)
);

CREATE TABLE film (
	id SERIAL PRIMARY KEY,
	nom varchar(30),
	id_realisateur integer,
    FOREIGN KEY(id_realisateur) REFERENCES REALISATEUR(id)
);

CREATE TABLE acteur (
    id SERIAL PRIMARY KEY,
    nom varchar(30),
    date_naissance date NOT NULL,
    date_mort date
);

CREATE TABLE acteur_film(
    id_acteur integer,
    id_film integer,
    PRIMARY KEY(id_acteur, id_film),
    FOREIGN KEY(id_acteur) REFERENCES acteur(id),
    FOREIGN KEY(id_film) REFERENCES film(id)
);


INSERT INTO REALISATEUR(nom) values('Steven Spielberg');
INSERT INTO REALISATEUR(nom) values('Christopher Nolan');
INSERT INTO REALISATEUR(nom) values('Robert Zemeks');

-- Akira Toriyama's Film
INSERT INTO FILM(nom,id_realisateur) values ('Anabelle',1);
INSERT INTO FILM(nom,id_realisateur) values ('L\''eau des ténèbres',1);
INSERT INTO FILM(nom,id_realisateur) values ('Hantaro',1);

-- Masashi Kishimoto's Film
INSERT INTO FILM(nom,id_realisateur) values ('Black Butler',2);
INSERT INTO FILM(nom,id_realisateur) values ('Black Clover',2);
INSERT INTO FILM(nom,id_realisateur) values ('Bleach',2);
INSERT INTO FILM(nom,id_realisateur) values ('D-Gray Man',2);

-- Eichiro Oda's Film
INSERT INTO FILM(nom,id_realisateur) values ('One Punch Man', 3);
INSERT INTO FILM(nom,id_realisateur) values ('NFS Underground', 3);
INSERT INTO FILM(nom,id_realisateur) values ('Patachou', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Le loup de Wall Street', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Mangaka', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Bromance', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Animal Crossing', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Jurassic Park', 3 );

-- ACTEURS
INSERT INTO Acteur(nom,date_naissance,date_mort) values ('PsqlEvelyne Grandjean','1950-01-01','2018-02-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlFrancis Lax','1951-02-02','2018-03-03');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlJean-Louis Rugarli','1952-03-03','2017-04-04');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlBernard Soufflet','1953-04-04','2018-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlMaryse Meryl','1954-05-05','2016-05-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlOphélie Brissot','1955-06-10','2000-10-10');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlSerge Bourrier','1956-06-10','2008-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlLaurence Crouzet','1957-06-10', null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlMasako Nozawa','1958-01-01','2015-02-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlStephanie Nadolny','1959-02-02','2017-01-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlTiffany Vollmer','1960-01-01','2019-01-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlLaurie Steele','1961-01-01','2017-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlChristopher Sabat','1962-02-02', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlSean Schemmel', '1963-01-10', null);


INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlJunko Takeuchi', '1964-04-04', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlNoriaki Sugiyama', '1965-05-05', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlKazuhiko Inoue', '1967-07-07', null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlJennifer Anniston', '1968-08-08', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlLa Fouine', '1969-09-09', null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlPaul Walker', '1970-01-01', '2017-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('PsqlSilver Stalone', '1971-01-01', null);

INSERT INTO acteur_film(id_film, id_acteur) values (1,1);
INSERT INTO acteur_film(id_film, id_acteur) values (1,2);
INSERT INTO acteur_film(id_film, id_acteur) values (1,3);
INSERT INTO acteur_film(id_film, id_acteur) values (1,4);
INSERT INTO acteur_film(id_film, id_acteur) values (1,5);
INSERT INTO acteur_film(id_film, id_acteur) values (1,6);
INSERT INTO acteur_film(id_film, id_acteur) values (1,7);
INSERT INTO acteur_film(id_film, id_acteur) values (1,8);

INSERT INTO acteur_film(id_film, id_acteur) values (3,9);
INSERT INTO acteur_film(id_film, id_acteur) values (3,10);
INSERT INTO acteur_film(id_film, id_acteur) values (3,11);
INSERT INTO acteur_film(id_film, id_acteur) values (3,12);
INSERT INTO acteur_film(id_film, id_acteur) values (3,13);
INSERT INTO acteur_film(id_film, id_acteur) values (3,14);

INSERT INTO acteur_film(id_film, id_acteur) values (5,15); 
INSERT INTO acteur_film(id_film, id_acteur) values (5,16);  
INSERT INTO acteur_film(id_film, id_acteur) values (5,17); 

INSERT INTO acteur_film(id_film, id_acteur) values (2,18); 
INSERT INTO acteur_film(id_film, id_acteur) values (2,19); 

INSERT INTO acteur_film(id_film, id_acteur) values (3,20); 
INSERT INTO acteur_film(id_film, id_acteur) values (3,21); 
