DROP TABLE acteur_film;
DROP TABLE FILM;
DROP TABLE REALISATEUR;

CREATE TABLE realisateur (
	id integer auto_increment PRIMARY KEY,
	nom varchar(30)
);

CREATE TABLE film (
	id integer auto_increment PRIMARY KEY,
	nom varchar(30),
	id_realisateur integer,
    FOREIGN KEY(id_realisateur) REFERENCES REALISATEUR(id)
);

CREATE TABLE acteur (
    id integer auto_increment PRIMARY KEY,
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


INSERT INTO REALISATEUR(nom) values('Akira Toriyama');
INSERT INTO REALISATEUR(nom) values('Masashi Kishimoto');
INSERT INTO REALISATEUR(nom) values('Eiichiro Oda');

-- Akira Toriyama's Film
INSERT INTO FILM(nom,id_realisateur) values ('Dr Slump',1);
INSERT INTO FILM(nom,id_realisateur) values ('L\'Apprenti Mangaka',1);
INSERT INTO FILM(nom,id_realisateur) values ('Dragon Ball',1);

-- Masashi Kishimoto's Film
INSERT INTO FILM(nom,id_realisateur) values ('Karakuri',2);
INSERT INTO FILM(nom,id_realisateur) values ('Naruto',2);
INSERT INTO FILM(nom,id_realisateur) values ('Bench',2);
INSERT INTO FILM(nom,id_realisateur) values ('Mario',2);

-- Eichiro Oda's Film
INSERT INTO FILM(nom,id_realisateur) values ('One Piece', 3);
INSERT INTO FILM(nom,id_realisateur) values ('Wanted', 3);
INSERT INTO FILM(nom,id_realisateur) values ('Un présent divin', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Le démon solitaire', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Monsters', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Romance Dawn', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Cross Epoch', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Jisshoku! Akuma no Mi!!', 3 );

-- ACTEURS
INSERT INTO Acteur(nom,date_naissance,date_mort) values ('Evelyne Grandjean','1950-01-01','2018-02-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Francis Lax','1951-02-02','2018-03-03');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Jean-Louis Rugarli','1952-03-03','2017-04-04');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Bernard Soufflet','1953-04-04','2018-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Maryse Meryl','1954-05-05','2016-05-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Ophélie Brissot','1955-06-10','2000-10-10');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Serge Bourrier','1956-06-10','2008-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Laurence Crouzet','1957-06-10', null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('Masako Nozawa','1958-01-01','2015-02-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Stephanie Nadolny','1959-02-02','2017-01-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Tiffany Vollmer','1960-01-01','2019-01-02');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Laurie Steele','1961-01-01','2017-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Christopher Sabat','1962-02-02', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Sean Schemmel', '1963-01-10', null);


INSERT INTO Acteur(nom,date_naissance,date_mort) values('Junko Takeuchi', '1964-04-04', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Noriaki Sugiyama', '1965-05-05', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Kazuhiko Inoue', '1967-07-07', null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('Jennifer Anniston', '1968-08-08', null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('La Fouine', '1969-09-09', null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('Paul Walker', '1970-01-01', '2017-01-01');
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Silver Stalone', '1971-01-01', null);

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
