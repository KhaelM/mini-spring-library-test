DROP TABLE acteur_film;

DROP TRIGGER acteur_trig;
DROP SEQUENCE acteur_seq;
DROP TABLE acteur;

DROP TRIGGER film_trig;
DROP SEQUENCE film_seq;
DROP TABLE FILM;

DROP TRIGGER realisateur_trig;
DROP SEQUENCE realisateur_seq;
DROP TABLE REALISATEUR;

CREATE TABLE realisateur (
	id integer PRIMARY KEY,
	nom varchar(30)
);

CREATE SEQUENCE realisateur_seq start with 1;

CREATE OR REPLACE TRIGGER realisateur_trig
BEFORE INSERT ON realisateur
FOR EACH ROW

BEGIN
	SELECT realisateur_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE TABLE film (
	id integer PRIMARY KEY,
	nom varchar(30),
	id_realisateur integer,
    FOREIGN KEY(id_realisateur) REFERENCES REALISATEUR(id)
);

CREATE SEQUENCE film_seq start with 1;

CREATE OR REPLACE TRIGGER film_trig
BEFORE INSERT ON FILM 
FOR EACH ROW
BEGIN
	SELECT film_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE TABLE acteur (
    id integer PRIMARY KEY,
    nom varchar(30),
    date_naissance date NOT NULL,
    date_mort date
);

CREATE SEQUENCE acteur_seq start with 1;

CREATE OR REPLACE TRIGGER acteur_trig
BEFORE INSERT ON acteur
FOR EACH ROW

BEGIN
	SELECT acteur_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE TABLE acteur_film(
    id_acteur integer,
    id_film integer,
    PRIMARY KEY(id_acteur, id_film),
    FOREIGN KEY(id_acteur) REFERENCES acteur(id),
    FOREIGN KEY(id_film) REFERENCES film(id)
);


INSERT INTO REALISATEUR(nom) values('Kobe Bryant');
INSERT INTO REALISATEUR(nom) values('Lebron James');
INSERT INTO REALISATEUR(nom) values('Robert Lewandowski');

-- Akira Toriyama's Film
INSERT INTO FILM(nom,id_realisateur) values ('Bayern',1);
INSERT INTO FILM(nom,id_realisateur) values ('Real Madrid',1);
INSERT INTO FILM(nom,id_realisateur) values ('Fc Barcelone',1);

-- Masashi Kishimoto's Film
INSERT INTO FILM(nom,id_realisateur) values ('Ac Milan',2);
INSERT INTO FILM(nom,id_realisateur) values ('Inter Milan',2);
INSERT INTO FILM(nom,id_realisateur) values ('Juventus',2);
INSERT INTO FILM(nom,id_realisateur) values ('Fc Napples',2);

-- Eichiro Oda's Film
INSERT INTO FILM(nom,id_realisateur) values ('Manchester United', 3);
INSERT INTO FILM(nom,id_realisateur) values ('Chelsea', 3);
INSERT INTO FILM(nom,id_realisateur) values ('Arsenal', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Liverpool', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Manchester City', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Newcastle', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('Southampton', 3 );
INSERT INTO FILM(nom,id_realisateur) values ('PSG', 3 );

-- ACTEURS
INSERT INTO Acteur(nom,date_naissance,date_mort) values ('Zizou',to_date('1950-01-01', 'yyyy-mm-dd'),to_date('2018-02-02', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Pep Guardiola',to_date('1951-02-02', 'yyyy-mm-dd'),to_date('2018-03-03', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Pirlo',to_date('1952-03-03', 'yyyy-mm-dd'),to_date('2017-04-04', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Luis Suarez',to_date('1953-04-04', 'yyyy-mm-dd'),to_date('2018-01-01', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Marcelo',to_date('1954-05-05', 'yyyy-mm-dd'),to_date('2016-05-02', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Toni Kroos',to_date('1955-06-10', 'yyyy-mm-dd'),to_date('2000-10-10', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Manuel Neuer',to_date('1956-06-10', 'yyyy-mm-dd'),to_date('2008-01-01', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Iker Casillas',to_date('1957-06-10', 'yyyy-mm-dd'), null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('Buffon',to_date('1958-01-01', 'yyyy-mm-dd'),to_date('2015-02-02', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('CR7',to_date('1959-02-02', 'yyyy-mm-dd'),to_date('2017-01-02', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Lionel Messi',to_date('1960-01-01', 'yyyy-mm-dd'),to_date('2019-01-02', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Ascensio',to_date('1961-01-01', 'yyyy-mm-dd'),to_date('2017-01-01', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Paulo Dybala',to_date('1962-02-02', 'yyyy-mm-dd'), null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Neymar', to_date('1963-01-10', 'yyyy-mm-dd'), null);


INSERT INTO Acteur(nom,date_naissance,date_mort) values('Gareth Bale', to_date('1964-04-04', 'yyyy-mm-dd'), null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Mbappé', to_date('1965-05-05', 'yyyy-mm-dd'), null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Lingard', to_date('1967-07-07', 'yyyy-mm-dd'), null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('Navas', to_date('1968-08-08', 'yyyy-mm-dd'), null);
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Marquinhos', to_date('1969-09-09', 'yyyy-mm-dd'), null);

INSERT INTO Acteur(nom,date_naissance,date_mort) values('The Rock', to_date('1970-01-01', 'yyyy-mm-dd'), to_date('2017-01-01', 'yyyy-mm-dd'));
INSERT INTO Acteur(nom,date_naissance,date_mort) values('Triple H', to_date('1971-01-01', 'yyyy-mm-dd'), null);

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

COMMIT;