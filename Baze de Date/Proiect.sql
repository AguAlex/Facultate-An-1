CREATE SEQUENCE seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 30;

--PAROLE----------------------------------------------
CREATE TABLE parole
(
    parola_id number(5) constraint pk_parole primary key,
    parola_nume varchar(100) constraint parola_nume not null,
    nivel_securitate number(5) constraint securitate not null
);

INSERT INTO parole
VALUES (1, 'andrei2004', 5);

INSERT INTO parole
VALUES (2, 'asdasdasdasd', 7);

INSERT INTO parole
VALUES (3, '!Bucuresti2024', 9);

INSERT INTO parole
VALUES (4, '!AlexAvg 20', 10);

INSERT INTO parole
VALUES (5, 'tat', 2);

INSERT INTO parole
VALUES (6, 'Ianuarie2004', 8);

INSERT INTO parole
VALUES (7, 'a', 1);

INSERT INTO parole
VALUES (8, 'abc', 2);

INSERT INTO parole
VALUES (9, 'abc', 2);

INSERT INTO parole
VALUES (10, '!Ale 20', 9);

INSERT INTO parole
VALUES (11, '!AavFe', 8);

select *
from parole;

--ADRESE-------------------------------------------
CREATE TABLE adrese
(
    adresa_id number(5) constraint pk_adrese primary key,
    strada varchar(100) constraint strada not null,
    numar_strada number(5) constraint nr_strada not null,
    apartament number(5) constraint apartament not null
);

INSERT INTO adrese
VALUES (1, 'Aleea laleleor', 8, 12);

INSERT INTO adrese
VALUES (2, 'Aleea bratescu', 2, 3);

INSERT INTO adrese
VALUES (3, 'Aleea bratescu', 2, 23);

INSERT INTO adrese
VALUES (4, 'Aleea Drumul Taberei', 6, 1);

INSERT INTO adrese
VALUES (5, 'Aleea Arena', 11, 8);

INSERT INTO adrese
VALUES (6, 'Strada Balcescu', 4, 3);

select *
from adrese;

--LOCATII-----------------------------------------------
CREATE TABLE locatii
(
    locatie_id number(5) constraint pk_locatii primary key,
    adresa_id number(5),
    oras varchar(100) constraint oras not null,
    tara varchar(100) constraint tara not null,
    constraint fk_adresa FOREIGN KEY (adresa_id) REFERENCES adrese(adresa_id)
);

INSERT INTO locatii
VALUES (1, 1, 'Bucuresti', 'Romania');

INSERT INTO locatii
VALUES (2, 5, 'Bucuresti', 'Romania');

INSERT INTO locatii
VALUES (3, 2, 'Suceava', 'Romania');

INSERT INTO locatii
VALUES (4, 3, 'Atena', 'Grecia');

INSERT INTO locatii
VALUES (5, 4, 'Bucuresti', 'Romania');

INSERT INTO locatii
VALUES (6, 6, 'Brasov', 'Romania');

select *
from locatii;

--UTILIZATORI--------------------------------------------------------
CREATE TABLE utilizatori
(
    utilizator_id number(5) constraint pk_utilizator primary key,
    nume varchar(100) constraint nume_utilizator not null,
    prenume varchar(100) constraint prenume_utilizator not null,
    email varchar(100) constraint email_utilizator not null,
    parola_id number(5),
    locatie_id number(5),
    data_inregistrare date,
    constraint fk_parola FOREIGN KEY (parola_id) REFERENCES parole(parola_id),
    constraint fk_locatie FOREIGN KEY (locatie_id) REFERENCES locatii(locatie_id)
    
);

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Popescu', 'Andrei', 'popescu_andrei@gmail.com', 1, 1, TO_DATE('04/12/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Dimitrie', 'Roxana', 'dimitrie_roxx@gmail.com', 3, 4, TO_DATE('12/06/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Ionescu', 'Maria', 'ionescu_maria@gmail.com', 2, 2, TO_DATE('05/11/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Georgescu', 'Mihai', 'georgescu_mihai@gmail.com', 5, 3, TO_DATE('06/10/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Vasilescu', 'Elena', 'vasilescu_elena@gmail.com', 4, 3, TO_DATE('22/12/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Ionescu', 'Elena', 'ionescu_elena@gmail.com', 7, 2, TO_DATE('05/11/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (31, 'Mihailovici', 'Andrei', 'miha_andrei@gmail.com', 11, 6, TO_DATE('02/04/2023', 'DD/MM/YYYY'));

select *
from utilizatori;

--GRUPURI--------------------------------------------------------------------------
CREATE TABLE grupuri
(
    grup_id number(5) constraint pk_grup primary key,
    denumire varchar(100) constraint denumire_grup not null
);

INSERT INTO grupuri
VALUES (100, 'Scoala');

INSERT INTO grupuri
VALUES (101, 'La munca');

INSERT INTO grupuri
VALUES (102, 'Excursie');

INSERT INTO grupuri
VALUES (103, 'Grup');

INSERT INTO grupuri
VALUES (104, 'Prieteni');


select *
from grupuri;

--UTILIZATORI_SI_GRUPURI----------------------------------------------
CREATE TABLE utilizatori_si_grupuri
(
    utilizator_id number(5),
    grup_id number(5),
    constraint pk_util_gr primary key (utilizator_id, grup_id),
    constraint fk_utilizator foreign key (utilizator_id) references utilizatori(utilizator_id),
    constraint fk_grup foreign key (grup_id) references grupuri(grup_id)
);


INSERT INTO utilizatori_si_grupuri
VALUES (21, 100);

INSERT INTO utilizatori_si_grupuri
VALUES (22, 100);

INSERT INTO utilizatori_si_grupuri
VALUES (21, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (23, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (24, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (25, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (26, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (31, 104);

INSERT INTO utilizatori_si_grupuri
VALUES (26, 104);

INSERT INTO utilizatori_si_grupuri
VALUES (23, 104);

INSERT INTO utilizatori_si_grupuri
VALUES (21, 104);

select *
from utilizatori_si_grupuri;

--FOTOGRAFII-------------------------------------------------
CREATE TABLE fotografii
(
    fotografie_id number(5) constraint pk_foto primary key,
    album_id number(5),
    titlu varchar(100) not null,
    constraint fk_album FOREIGN KEY (album_id) REFERENCES albume_fotografii(album_id)
);

INSERT INTO fotografii
VALUES (1, 100, 'Poza1');

INSERT INTO fotografii
VALUES (2, 100, 'Piscina');

INSERT INTO fotografii
VALUES (3, 100, 'Poza speciala');

INSERT INTO fotografii
VALUES (4, 101, 'Prima poza');

INSERT INTO fotografii
VALUES (5, 102, 'Rasarit');

INSERT INTO fotografii
VALUES (6, 102, 'La meci');

INSERT INTO fotografii
VALUES (7, 103, 'Poza Anglia');

INSERT INTO fotografii
VALUES (8, 104, 'Gratar');

select *
from fotografii;

--ALBUME_FOTOGRAFII-------------------------------------------------------------
CREATE TABLE albume_fotografii
(
    album_id number(5) constraint pk_album primary key,
    utilizator_id number(5),
    album_nume varchar(100) constraint nume_album not null,
    data_album date,
    constraint fk_util FOREIGN KEY (utilizator_id) REFERENCES utilizatori(utilizator_id)
);

INSERT INTO albume_fotografii
VALUES (100, 21, 'La mare', TO_DATE('25/12/2023', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (101, 21, 'Ziua mea', TO_DATE('01/02/2024', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (102, 23, 'Scoala', TO_DATE('29/11/2023', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (103, 24, 'Facultate', TO_DATE('15/08/2023', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (104, 24, 'La mare', TO_DATE('02/03/2024', 'DD/MM/YYYY'));

select *
from albume_fotografii;

--PIESE--------------------------------------------------------------
CREATE TABLE piese
(
    piesa_id number(5) constraint pk_piesa primary key,
    piesa_nume varchar(100) not null,
    artist_nume varchar(100) not null
);

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (1, 'Shape of You', 'Ed Sheeran');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (2, 'Blinding Lights', 'The Weeknd');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (3, 'Levitating', 'Dua Lipa');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (4, 'Bad Guy', 'Billie Eilish');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (5, 'Rockstar', 'Post Malone');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (6, 'Old Town Road', 'Lil Nas X');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (7, 'Senorita', 'Camila Cabello');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (8, 'Circles', 'Post Malone');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (9, 'Havana', 'Camila Cabello');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (10, 'My Eyes', 'Travis Scott');

select *
from piese;

--plylisturi_muzicale---------------------------------------------------------------
CREATE TABLE playlisturi_muzicale
(
    playlist_id number(5) constraint pk_playlist primary key,
    playlist_nume varchar(100) not null
);

INSERT INTO playlisturi_muzicale
VALUES (1, 'Piesele mele');

INSERT INTO playlisturi_muzicale
VALUES (2, 'Distractie');

INSERT INTO playlisturi_muzicale
VALUES (3, 'Relaxare');

INSERT INTO playlisturi_muzicale
VALUES (4, 'Alex Playlist');

INSERT INTO playlisturi_muzicale
VALUES (5, 'Dans');

select *
from playlisturi_muzicale;

--PLAYLISTURI_SI_PIESE-----------------------------------------------------------------
CREATE TABLE playlisturi_si_piese
(
    piesa_id number(5),
    playlist_id number(5),
    utilizator_id number(5),
    constraint pk_playlist_piese primary key (piesa_id, playlist_id, utilizator_id), --modificat pk
    constraint fk_utiliz foreign key (utilizator_id) REFERENCES utilizatori(utilizator_id),
    constraint fk_piesa foreign key (piesa_id) REFERENCES piese(piesa_id),
    constraint fk_playlist foreign key (playlist_id) REFERENCES playlisturi_muzicale(playlist_id)
);

INSERT INTO playlisturi_si_piese
VALUES (1, 1, 21);

INSERT INTO playlisturi_si_piese
VALUES (2, 1, 21);

INSERT INTO playlisturi_si_piese
VALUES (5, 1, 21);

INSERT INTO playlisturi_si_piese
VALUES (1, 2, 23);

INSERT INTO playlisturi_si_piese
VALUES (8, 3, 24);

INSERT INTO playlisturi_si_piese
VALUES (9, 3, 24);

INSERT INTO playlisturi_si_piese
VALUES (2, 3, 24);

INSERT INTO playlisturi_si_piese
VALUES (7, 4, 31);

INSERT INTO playlisturi_si_piese
VALUES (2, 4, 31);

INSERT INTO playlisturi_si_piese
VALUES (10, 2, 23);

select *
from playlisturi_si_piese;

--ISTORIC_PAROLE-----------------------------------------------------------------------
CREATE TABLE istoric_parole
(
    utilizator_id number(5),
    data_schimbare date,
    parola_id number(5),
    constraint pk_istoric primary key(utilizator_id, data_schimbare),
    constraint fk_parola_istoric foreign key (parola_id) references parole(parola_id)
);
 
INSERT INTO istoric_parole
VALUES (22, TO_DATE('27/12/2023', 'DD/MM/YYYY'), 8);

INSERT INTO istoric_parole
VALUES (22, TO_DATE('01/01/2024', 'DD/MM/YYYY'), 9);

INSERT INTO istoric_parole
VALUES (24, TO_DATE('30/12/2023', 'DD/MM/YYYY'), 10);
INSERT INTO istoric_parole
VALUES (31, TO_DATE('01/02/2024', 'DD/MM/YYYY'), 1);
INSERT INTO istoric_parole
VALUES (31, TO_DATE('04/02/2023', 'DD/MM/YYYY'), 3);
 
select *
from istoric_parole;

 
 --12
--1. Identificati grupurile si numarul de utilizatori, folosind o clauza WITH pentru a numara utilizatorii pe grupuri
--si o expresie CASE pentru a clasifica grupurile(mic sau mare, adica cu mai mult de 2 utilizatori).
--bloc de cerere (clauza WITH), grupari de date, functii grup, ordonare, expresie CASE

WITH nr_util_grupuri AS (
    SELECT g.grup_id, COUNT(*) numar_utilizatori
    FROM grupuri g, utilizatori_si_grupuri ug
    WHERE g.grup_id = ug.grup_id
    GROUP BY g.grup_id
)
SELECT g.denumire, n.numar_utilizatori,
                                        CASE 
                                        WHEN n.numar_utilizatori > 2 THEN 'Grup mare'
                                        ELSE 'Grup mic'
                                        END tip_grup
FROM grupuri g, nr_util_grupuri n
WHERE n.grup_id = g.grup_id
ORDER BY 2 DESC;


--2.Sa se afiseze id-ul, numele, prenumele si strada pe care locuiesc utilizatorii care si-au schimbat parola in ultimele 6 luni.
--subcerere sincronizata, functie data calendaristica, exists

SELECT u.utilizator_id, u.nume, u.prenume, a.strada
FROM utilizatori u
JOIN locatii l ON u.locatie_id = l.locatie_id
JOIN adrese a ON l.adresa_id = a.adresa_id
WHERE EXISTS (
    SELECT *
    FROM istoric_parole ip, parole p
    WHERE ip.parola_id = p.parola_id
    AND ip.utilizator_id = u.utilizator_id
    AND ip.data_schimbare >= ADD_MONTHS(SYSDATE, -6)
);

--3.Sa se afiseze numele si prenumele utilizatorilor impreuna cu numarul de grupuri din care fac parte. 
--subcerere nesincronizata in clauza from, functii pe siruri de caractere
SELECT UPPER(u.nume), LOWER(u.prenume), CONCAT(u.nume, CONCAT(' ',u.prenume)) Nume_Complet, g.numar_grupuri 
FROM utilizatori u, (
    SELECT ug.utilizator_id, COUNT(ug.grup_id) numar_grupuri
    FROM utilizatori_si_grupuri ug
    GROUP BY ug.utilizator_id
) g
WHERE u.utilizator_id = g.utilizator_id;


--4.Afisati id-ul, numele si prenumele utilizatorilor, impreuna cu mail-ul lor in cazul in care exista si tipul de locatie.
--nvl, decode, ordonare
SELECT u.nume, u.prenume,
       NVL(u.email, 'email_necunoscut') email,
       DECODE(l.oras, 'Bucuresti', 'Capitala', 'Provincie') locatie
FROM utilizatori u, locatii l
WHERE u.locatie_id = l.locatie_id
ORDER BY 1;


--5.Sa se afiseze orasele si numarul de utilizatori din fiecare oras. Filtreaza rezultatele pentru a avea doar orase care contin litera 'u'.
--grupari de date, functii grup

SELECT l.oras, COUNT(u.utilizator_id) numar_utilizatori
FROM utilizatori u, locatii l
WHERE u.locatie_id = l.locatie_id
GROUP BY l.oras
HAVING l.oras like '%u%';

--13.
--a.Sterge toate albumele care nu contin nicio fotografie.

INSERT INTO albume_fotografii
VALUES (110, 21, 'Album gol', TO_DATE('02/02/2024', 'DD/MM/YYYY'));

DELETE FROM albume_fotografii a
WHERE a.album_id NOT IN (
    SELECT f.album_id
    FROM fotografii f
);

--b. Actualizeaza adresa utilizatorilor care au creat cel putin un album, setand numarul strazii la 99.
UPDATE adrese a
SET a.numar_strada = 99
WHERE a.adresa_id IN (
    SELECT l.adresa_id
    FROM locatii l
    JOIN utilizatori u ON l.locatie_id = u.locatie_id
    JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id
);

--c. Actualizeaza nivelul de securitate al parolelor la 6 pentru utilizatorii care locuiesc in "Suceava".
UPDATE parole p
SET p.nivel_securitate = 6
WHERE p.parola_id IN (
    SELECT u.parola_id
    FROM utilizatori u
    JOIN locatii l ON u.locatie_id = l.locatie_id
    WHERE l.oras = 'Suceava'
);


--15. 
--a. Afisati toti utilizatorii, locatiile lor, grupurile din care fac parte si numele albumelor lor, inclusiv utilizatorii
--care nu au locatii, grupuri sau albume asociate.

SELECT u.nume, u.prenume, u.email, l.oras, l.tara, g.denumire, af.album_nume
FROM utilizatori u
LEFT JOIN locatii l ON u.locatie_id = l.locatie_id
LEFT JOIN utilizatori_si_grupuri ug ON u.utilizator_id = ug.utilizator_id
LEFT JOIN grupuri g ON ug.grup_id = g.grup_id
LEFT JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id;

--b. Gasiti utilizatorii care au adaugat toate piesele artistului 'The Weeknd' in oricare dintre playlisturile lor.

SELECT u.utilizator_id, u.nume, u.prenume
FROM utilizatori u
WHERE NOT EXISTS (
    SELECT p.piesa_id
    FROM piese p
    WHERE p.artist_nume = 'The Weeknd'
    MINUS
    SELECT pp.piesa_id
    FROM playlisturi_si_piese pp
    WHERE pp.utilizator_id = u.utilizator_id
    );


--c. Sa se afiseze top 2 utilizatori care sunt in cele mai multe grupuri.
SELECT ug.utilizator_id, COUNT(*)
FROM utilizatori_si_grupuri ug
JOIN grupuri g ON g.grup_id = ug.grup_id
GROUP BY ug.utilizator_id
HAVING COUNT(*) IN (
                SELECT *
                FROM (
                SELECT COUNT(*)
                FROM utilizatori_si_grupuri ug
                GROUP BY ug.utilizator_id
                ORDER BY COUNT(*) DESC
                )
                WHERE ROWNUM <=2
);

SELECT u.utilizator_id, u.nume, u.prenume, COUNT(*) numar_albume
FROM utilizatori u
JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id
GROUP BY u.utilizator_id, u.nume, u.prenume
HAVING COUNT(*) IN (
                                SELECT *
                                FROM (
                                    SELECT u.utilizator_id, u.nume, u.prenume, COUNT(af.album_id) numar_albume
                                    FROM utilizatori u
                                    JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id
                                    GROUP BY u.utilizator_id, u.nume, u.prenume
                                    ORDER BY numar_albume DESC
                                )
                                WHERE ROWNUM <= 3
);


CREATE VIEW view_utilizatori AS
SELECT u.utilizator_id, CONCAT(u.nume, CONCAT(' ', u.prenume)) nume, p.parola_nume, l.oras, a.apartament
FROM utilizatori u
JOIN locatii l on l.locatie_id = u.locatie_id
JOIN adrese a on a.adresa_id = l.adresa_id
JOIN parole p on u.parola_id = p.parola_id;

SELECT *
FROM view_utilizatori;

--permis - update
UPDATE  view_utilizatori
SET apartament = 100
WHERE nume = 'Popescu Andrei';

--actiune nepermisa inserarea de date
INSERT INTO view_utilizatori
VALUES (50, 'Agusoaei Alexandru', 'parola','Bucuresti', 10);

INSERT INTO view_utilizatori (utilizator_id, nume)
VALUES (50, 'Agusoaei Alexandru');




 