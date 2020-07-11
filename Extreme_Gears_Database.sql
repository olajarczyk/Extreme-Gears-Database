-- @"C:\Users\HP\Desktop\informatyka\bazy_danych\LAB9\Extreme_Gears_Database.sql"

--st12k_JARCZYK_ALEKSANDRA ora66Dk9Vw6XN

set serveroutput on;
set linesize 550;
set pagesize 450;

CLEAR SCREEN;


drop table BDA;
drop table BPA;
drop table BKA;
drop table BLO;
drop table RUC;
drop table BUC;
drop table KUC;
drop table BIEG_EKSTREMALNY;
drop table DATY;
drop table RANKINGI;
drop table PAKIETY;
drop table KATEGORIE;
drop table LOKALIZACJE;
drop table UCZESTNICY;
drop table UMOWY;
drop table MIEJSCE;



----------------------------------------;
--CREATE TABLE MIEJSCE;
----------------------------------------;

create table MIEJSCE
(
MIEk_1_ID number(4),
MIE_Kraj varchar2(30),
MIE_Miejscowosc varchar2(30),
MIE_Ulica varchar2(30),
MIE_Nr_domu number(4),
MIE_Nr_lokalu varchar2(30),
MIE_Kod_pocztowy varchar2(30) 
);



----------------------------------------;
--Primary Key;
----------------------------------------;

alter table MIEJSCE
add constraint PK_MIEJSCE
primary key (MIEk_1_ID);

--MIEJSCE
	
	column MIEk_1_ID 			HEADING 'ID' 				format 999;
	column MIE_Kraj				HEADING 'Kraj' 				format A15;
	column MIE_Miejscowosc 		HEADING 'Miejscowosc' 		format A15;
	column MIE_Ulica 			HEADING 'Ulica' 			format A15;
	column MIE_Nr_domu 			HEADING 'Nr_domu' 			format 999;
	column MIE_Nr_lokalu 		HEADING 'Nr_lokalu' 		format 999;
	column MIE_Kod_pocztowy 	HEADING 'Kod_pocztowy' 		format 999;


----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe MIEJSCE;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_MIEJSCE;
--
create sequence SEQ_MIEJSCE increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_MIEJSCE
before insert on MIEJSCE
for each row
begin
 if :new.MIEk_1_ID is NULL then
 SELECT SEQ_MIEJSCE.nextval INTO :new.MIEk_1_ID FROM dual;
 end if;
end;
/

INSERT INTO MIEJSCE VALUES(NULL,'Polska','Chrzanow','Grzybowa',1,15,4);
INSERT INTO MIEJSCE VALUES(NULL,'Polska','Kielce','Zielona',2,12,4);
INSERT INTO MIEJSCE VALUES(NULL,'Polska','Chrzanow','Czerwona',3,13,4);
INSERT INTO MIEJSCE VALUES(NULL,'Polska','Warszawa','Wesola',4,14,4);
INSERT INTO MIEJSCE VALUES(NULL,'Polska','Chrzanow','Wesola',4,14,4);
INSERT INTO MIEJSCE VALUES(NULL,'Polska','Krakow','Jagiellonska',4,14,4);
SELECT * FROM MIEJSCE;


----------------------------------------;
--INDEX;
----------------------------------------;
		
		create index IX_MIE_Miejscowosc
		on MIEJSCE (MIE_Miejscowosc)
		STORAGE (INITIAL 500k NEXT 250k)
		tablespace STUDENT_INDEX; 






----------------------------------------;
--CREATE TABLE UMOWY;
----------------------------------------;

create table UMOWY
(
UMOk_1_ID number(4),
UMO_Ubezpieczenie varchar2(60),
UMO_Cena number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table UMOWY
add constraint PK_UMOWY
primary key (UMOk_1_ID);

--UMOWY
	
	column UMOk_1_ID 				HEADING 'ID' 				format 999;
	column UMO_Ubezpieczenie		HEADING 'Ubezpieczenie' 	format A15;
	column UMO_Cena 				HEADING 'Cena' 				format 999;
	

----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe UMOWY;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_UMOWY;
--
create sequence SEQ_UMOWY increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_UMOWY
before insert on UMOWY
for each row
begin
 if :new.UMOk_1_ID is NULL then
 SELECT SEQ_UMOWY.nextval INTO :new.UMOk_1_ID FROM dual;
 end if;
end;
/

INSERT INTO UMOWY VALUES(NULL,'Zdrowotne',20 );
INSERT INTO UMOWY VALUES(NULL,'Zdrowotne',30);
INSERT INTO UMOWY VALUES(NULL,'Zdrowotne',40);
INSERT INTO UMOWY VALUES(NULL,'Zdrowotne',40);
INSERT INTO UMOWY VALUES(NULL,'Calosciowe',40);
INSERT INTO UMOWY VALUES(NULL,'Calosciowe',100);
SELECT * FROM UMOWY;



----------------------------------------;
--INDEX;
----------------------------------------;
		
		create index IX_UMO_Ubezpieczenie
		on UMOWY (UMO_Ubezpieczenie)
		STORAGE (INITIAL 500k NEXT 250k)
		tablespace STUDENT_INDEX; 

----------------------------------------;
--CREATE TABLE UCZESTNICY;
----------------------------------------;

create table UCZESTNICY
(
UCZk_1_ID number(4),
UCZ_Imie varchar2(60),
UCZ_Nazwisko varchar2(60),
UCZ_PESEL varchar2(60),
MIE_ID number(4),
UMO_ID number(4),
KAT_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table UCZESTNICY
add constraint PK_UCZESTNICY
primary key (UCZk_1_ID);


/*----------------------------------------;
--Unique Key;
----------------------------------------;

alter table UCZESTNICY
add constraint UQ_UCZESTNICY
unique (UCZ_PESEL);
*/


----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table UCZESTNICY add constraint FK_UCZESTNICY
foreign key (MIE_ID)
references MIEJSCE (MIEk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table UCZESTNICY add constraint FK_UCZESTNICY1
foreign key (UMO_ID)
references UMOWY (UMOk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table UCZESTNICY add constraint FK_UCZESTNICY
foreign key (KAT_ID)
references KATEGORIE (KATk_1_ID);



--UCZESTNICY
	
	column UCZk_1_ID 				HEADING 'ID' 				format 999;
	column UCZ_Imie					HEADING 'Imie' 				format A10;
	column UCZ_Nazwisko 			HEADING 'Nazwisko' 			format A12;
	column UCZ_PESEL				HEADING 'PESEL' 			format A11;
	column MIE_ID					HEADING 'MiejsceID' 		format 999;
	column UMO_ID 					HEADING 'UmowaID' 			format 999;
	column KAT_ID 					HEADING 'KategoriaID' 		format 999;
----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe UCZESTNICY;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_UCZESTNICY;

create sequence SEQ_UCZESTNICY increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_UCZESTNICY
before insert on UCZESTNICY
for each row
begin
 if :new.UCZk_1_ID is NULL then
 SELECT SEQ_UCZESTNICY.nextval INTO :new.UCZk_1_ID FROM dual;
 end if;
end;
/


INSERT INTO UCZESTNICY VALUES(NULL,'Aleksandra','Jarczyk','98043005188',1,1,1);
INSERT INTO UCZESTNICY VALUES(NULL,'Aleksandra','Ogiela','98043005201',2,2,2);
INSERT INTO UCZESTNICY VALUES(NULL,'Karolina','Jarczyk','98043005202',3,3,3);
INSERT INTO UCZESTNICY VALUES(NULL,'Nikola','Radym','98043005204',4,4,4);
INSERT INTO UCZESTNICY VALUES(NULL,'Ola','Olszowska','97043005204',5,5,5);
INSERT INTO UCZESTNICY VALUES(NULL,'Anna','Los','94043005204',6,6,6);
SELECT * FROM UCZESTNICY;



----------------------------------------;
--CREATE TABLE LOKALIZACJE;
----------------------------------------;

create table LOKALIZACJE
(
LOKk_1_ID number(4) NOT NULL,
LOK_Kraj varchar2(60) NOT NULL,
LOK_Miejscowosc varchar2(60) NOT NULL,
LOK_Kod_pocztowy varchar2(60) 
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table LOKALIZACJE
add constraint PK_LOKALIZACJE
primary key (LOKk_1_ID);


--LOKALIZACJE
	
	column LOKk_1_ID 				HEADING 'ID' 				format 999;
	column LOK_Kraj					HEADING 'Kraj' 				format A15;
	column LOK_Miejscowosc 			HEADING 'Miejscowosc' 		format A15;
	column LOK_Kod_pocztowy			HEADING 'Kod_pocztowy' 		format A15;


----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe LOKALIZACJE;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_LOKALIZACJE;

create sequence SEQ_LOKALIZACJE increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_LOKALIZACJE
before insert on LOKALIZACJE
for each row
begin
 if :new.LOKk_1_ID is NULL then
 SELECT SEQ_LOKALIZACJE.nextval INTO :new.LOKk_1_ID FROM dual;
 end if;
end;
/

INSERT INTO LOKALIZACJE VALUES(NULL,'Polska','Krakow','32-500');
INSERT INTO LOKALIZACJE VALUES(NULL,'Polska','Wroclaw','33-172');
SELECT * FROM LOKALIZACJE;



----------------------------------------;
--CREATE TABLE KATEGORIE;
----------------------------------------;

create table KATEGORIE
(
KATk_1_ID number(4) NOT NULL,
KAT_Rodzaj varchar2(60),
KAT_Formula varchar2(60),
UMOW_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table KATEGORIE
add constraint PK_KATEGORIE
primary key (KATk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table KATEGORIE add constraint FK_KATEGORIE1
foreign key (UMOW_ID)
references UMOWY (UMOk_1_ID);
	

	column KATk_1_ID				HEADING 'ID' 			format 999;
	column KAT_Rodzaj				HEADING 'Rodzaj' 		format A15;
	column KAT_Formula				HEADING 'Formula' 		format A15;
	column UMOW_ID 					HEADING 'UmowaID' 		format 999;
	
----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe KATEGORIE;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_KATEGORIE;

create sequence SEQ_KATEGORIE increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_KATEGORIE
before insert on KATEGORIE
for each row
begin
 if :new.KATk_1_ID is NULL then
 SELECT SEQ_KATEGORIE.nextval INTO :new.KATk_1_ID FROM dual;
 end if;
end;
/


INSERT INTO KATEGORIE VALUES(NULL,'Runmeggedon','Classic',1);
INSERT INTO KATEGORIE VALUES(NULL,'Runmeggedon','Intro',2);
INSERT INTO KATEGORIE VALUES(NULL,'Armaggedon','Runner',3);
INSERT INTO KATEGORIE VALUES(NULL,'Runmeggedon','Intro',4);
INSERT INTO KATEGORIE VALUES(NULL,'Armaggedon','Hardkor',5);
INSERT INTO KATEGORIE VALUES(NULL,'Armaggedon','Runner',6);
SELECT * FROM KATEGORIE;






----------------------------------------;
--CREATE TABLE PAKIET;
----------------------------------------;

create table PAKIETY
(
PAKk_1_ID number(4) NOT NULL,
PAK_Stroj varchar2(60) NOT NULL,
PAK_Napoje varchar2(60) NOT NULL,
PAK_Jedzenie varchar2(60) 
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table PAKIETY
add constraint PK_PAKIETY
primary key (PAKk_1_ID);


	column PAKk_1_ID				HEADING 'ID' 				format 999;
	column PAK_Stroj				HEADING 'Stroj' 			format A15;
	column PAK_Napoje				HEADING 'Napoje' 			format A15;
	column PAK_Jedzenie				HEADING 'Jedzenie' 			format A15;
	

----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe PAKIETY;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_PAKIETY;

create sequence SEQ_PAKIETY increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_PAKIETY
before insert on PAKIETY
for each row
begin
 if :new.PAKk_1_ID is NULL then
 SELECT SEQ_PAKIETY.nextval INTO :new.PAKk_1_ID FROM dual;
 end if;
end;
/

INSERT INTO PAKIETY VALUES(NULL,'koszulka','Powerade','baton');
INSERT INTO PAKIETY VALUES(NULL,'koszulka','Powerade','baton');
SELECT * FROM PAKIETY;






----------------------------------------;
--CREATE TABLE RANKINGI;
----------------------------------------;

create table RANKINGI
(
RANk_1_ID number(4) NOT NULL,
RAN_Punkty number(4) NOT NULL,
RAN_Pozycja number(4) 
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table RANKINGI
add constraint PK_RANKINGI
primary key (RANk_1_ID);


	column RANk_1_ID				HEADING 'ID' 				format 999;
	column RAN_Punkty				HEADING 'Punkty' 			format 999;
	column RAN_Pozycja 				HEADING 'Pozycja' 			format 999;


----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe RANKINGI;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_RANKINGI;

create sequence SEQ_RANKINGI increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_RANKINGI
before insert on RANKINGI
for each row
begin
 if :new.RANk_1_ID is NULL then
 SELECT SEQ_RANKINGI.nextval INTO :new.RANk_1_ID FROM dual;
 end if;
end;
/


INSERT INTO RANKINGI VALUES(NULL,45,4);
INSERT INTO RANKINGI VALUES(NULL,30,5);
INSERT INTO RANKINGI VALUES(NULL,50,3);
INSERT INTO RANKINGI VALUES(NULL,60,2);
INSERT INTO RANKINGI VALUES(NULL,100,1);
SELECT * FROM RANKINGI;






----------------------------------------;
--CREATE TABLE DATY;
----------------------------------------;

create table DATY
(
DATk_1_ID number(4) NOT NULL,
DAT_Miesiac varchar2(60) NOT NULL,
DAT_Dzien varchar2(60) 
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table DATY
add constraint PK_DATY
primary key (DATk_1_ID);


	column DATk_1_ID				HEADING 'ID' 				format 999;
	column DAT_Miesiac				HEADING 'Miesiac' 			format A15;
	column DAT_Dzien				HEADING 'Dzien' 			format A15;


----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;
describe DATY;

----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_DATY;

create sequence SEQ_DATY increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_DATY
before insert on DATY
for each row
begin
 if :new.DATk_1_ID is NULL then
 SELECT SEQ_DATY.nextval INTO :new.DATk_1_ID FROM dual;
 end if;
end;
/


INSERT INTO DATY VALUES(NULL,'kwiecien','sobota');
INSERT INTO DATY VALUES(NULL,'maj','niedziela');
SELECT * FROM DATY;




----------------------------------------;
--CREATE TABLE BIEG_EKSTREMALNY;
----------------------------------------;

create table BIEG_EKSTREMALNY
(
BIEk_1_ID number(4) NOT NULL,
BIE_Nazwa varchar2(60) NOT NULL,
BIE_Liczba_uczestników number(4) NOT NULL,
BIE_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table BIEG_EKSTREMALNY
add constraint PK_BIEG_EKSTREMALNY
primary key (BIEk_1_ID);


	column DBIEk_1_ID				HEADING 'ID' 					format 999;
	column BIE_Nazwa				HEADING 'Nazwa' 				format A15;
	column BIE_Liczba_uczestników	HEADING 'Liczba uczestnikóww' 	format 999;
	column BIE_ID					HEADING 'BIEG_ID' 				format 999;


----------------------------------------;
--PROMPT DESCRIBE;
----------------------------------------;

describe BIEG_EKSTREMALNY;


----------------------------------------;
--Sequence;
----------------------------------------;
drop sequence SEQ_BIEG_EKSTREMALNY;

create sequence SEQ_BIEG_EKSTREMALNY increment by 1 start with 1
maxvalue 9999999999 minvalue 1;


----------------------------------------;
--Trigger;
----------------------------------------; 
create or replace trigger T_BI_BIEG_EKSTREMALNY
before insert on BIEG_EKSTREMALNY
for each row
begin
 if :new.BIEk_1_ID is NULL then
 SELECT SEQ_BIEG_EKSTREMALNY.nextval INTO :new.BIEk_1_ID FROM dual;
 end if;
end;
/


INSERT INTO BIEG_EKSTREMALNY VALUES(NULL,'Runmeggeddon',125,1);
INSERT INTO BIEG_EKSTREMALNY VALUES(NULL,'Armaggedon',220,2);
INSERT INTO BIEG_EKSTREMALNY VALUES(NULL,'Barbarian Race',100,3);
INSERT INTO BIEG_EKSTREMALNY VALUES(NULL,'Survival Race',130,4);
INSERT INTO BIEG_EKSTREMALNY VALUES(NULL,'Bieg Gladiatora',50,5);
SELECT * FROM BIEG_EKSTREMALNY;




----------------------------------------;
-- SELECT;
----------------------------------------;

SELECT UCZESTNICY.UCZ_Imie,
UCZESTNICY.UCZ_Nazwisko,
UCZESTNICY.UCZ_PESEL,
UCZESTNICY.MIE_ID,
MIEJSCE.MIE_Miejscowosc
FROM UCZESTNICY, MIEJSCE
WHERE
UCZESTNICY.MIE_ID = MIEJSCE.MIEk_1_ID
AND MIEJSCE.MIE_Miejscowosc = 'Chrzanow';


/*
Imie       Nazwisko     PESEL       MiejsceID Miejscowosc
---------- ------------ ----------- --------- ---------------
Aleksandra Jarczyk      98043005188         1 Chrzanow
Karolina   Jarczyk      98043005202         3 Chrzanow
*/



----------------------------------------;
-- SELECT;
----------------------------------------;

SELECT UCZESTNICY.UCZ_Imie,
UCZESTNICY.UCZ_Nazwisko,
UCZESTNICY.UCZ_PESEL,
UCZESTNICY.UMO_ID,
UMOWY.UMO_Ubezpieczenie
FROM UCZESTNICY, UMOWY
WHERE
UCZESTNICY.UMO_ID = UMOWY.UMOk_1_ID
AND UCZESTNICY.UCZ_Imie = 'Aleksandra';

/*
Imie       Nazwisko     PESEL       UmowaID Ubezpieczenie
---------- ------------ ----------- ------- ---------------
Aleksandra Jarczyk      98043005188       1 Zdrowotne
Aleksandra Ogiela       98043005201       2 Zdrowotne
*/




----------------------------------------;
-- SELECT;
----------------------------------------;

SELECT UCZESTNICY.UCZ_Imie,
UCZESTNICY.UCZ_Nazwisko,
UCZESTNICY.KAT_ID,
KATEGORIE.KAT_Rodzaj
FROM UCZESTNICY, KATEGORIE
WHERE
UCZESTNICY.KAT_ID = KATEGORIE.KATk_1_ID
AND KATEGORIE.KAT_Rodzaj = 'Runmeggedon';

/*
Imie       Nazwisko     KategoriaID Rodzaj
---------- ------------ ----------- --------------
Aleksandra Jarczyk                1 Runmeggedon
Aleksandra Ogiela                 2 Runmeggedon
Nikola     Radym                  4 Runmeggedon
*/





----------------------------------------;
-- SELECT, GROUP BY;
----------------------------------------;
SELECT MIE_Ulica
FROM MIEJSCE
group by MIE_Ulica;

/*
Ulica
---------------
Jagiellonska
Zielona
Wesola
Czerwona
Grzybowa
*/




----------------------------------------;
-- SELECT, GROUP BY;
----------------------------------------;

SELECT MIE_Miejscowosc
FROM MIEJSCE
group by MIE_Miejscowosc;


/*
Miejscowosc
--------------
Chrzanow
Kielce
Warszawa
*/


----------------------------------------;
-- SELECT, GROUP BY;
----------------------------------------;
SELECT UMO_Ubezpieczenie, SUM(UMO_Cena) UMO_Cena
FROM UMOWY
group by UMO_Ubezpieczenie;

/*
Ubezpieczenie   Cena
--------------- ----
Zdrowotne        130
Calosciowe       140
*/


----------------------------------------;
-- SELECT, GROUP BY;
----------------------------------------;
SELECT UMO_Ubezpieczenie, SUM(UMO_Cena) UMO_Cena
FROM UMOWY
HAVING SUM(UMO_Cena)>135
group by UMO_Ubezpieczenie;

/*
Ubezpieczenie   Cena
--------------- ----
Calosciowe       140
*/


SELECT UMO_Ubezpieczenie, AVG(UMO_Cena) UMO_Cena
FROM UMOWY
group by UMO_Ubezpieczenie;

/*
Ubezpieczenie   Cena
--------------- ----
Zdrowotne         33
Calosciowe        70
*/

SELECT UMO_Ubezpieczenie, AVG(UMO_Cena) UMO_Cena
FROM UMOWY
HAVING AVG(UMO_Cena)<50
group by UMO_Ubezpieczenie;

/*
Ubezpieczenie   Cena
--------------- ----
Zdrowotne         33
*/



----------------------------------------;
-- SELECT, GROUP BY;
----------------------------------------;
SELECT RAN_Pozycja, SUM(RAN_Punkty) RAN_Punkty
FROM RANKINGI
group by RAN_Pozycja;

/*
Pozycja                                                      Punkty
------------------------------------------------------------ ------
1                                                               100
3                                                                50
5                                                                30
4                                                                45
2                                                                60
*/





CREATE OR REPLACE VIEW V_UCZ_BIE
(Imie, Nazwisko, Pesel, ID_Kategoria, Rodzaj, Formula)
as 
select c.UCZ_Imie, c.UCZ_Nazwisko, c.UCZ_PESEL, c.KAT_ID, c.KAT_Rodzaj, c.KAT_Formula
from (
select a.KATk_1_ID, a.KAT_Rodzaj, a.KAT_Formula, b.UCZk_1_ID, b.UCZ_Imie, b.UCZ_Nazwisko, b.UCZ_PESEL, b.KAT_ID
from UCZESTNICY b, KATEGORIE a
where b.KAT_ID = a.KATk_1_ID) c;


		column Imie 		 	  			HEADING 'Imie' 								format A10;
		column Nazwisko 		  			HEADING 'Nazwisko' 							format A10;
		column Pesel 	  		  			HEADING 'Pesel' 		    				format 99999999999;
		column ID_Kategoria 	  			HEADING 'ID_Kategoria' 						format 999;
		column Rodzaj		     			HEADING 'Rodzaj'     						format A12;
		column Formula		      			HEADING 'Formula'     						format A10;
		

		
select * from V_UCZ_BIE;

/*
Imie       Nazwisko   Pesel             ID_Kategoria    Rodzaj     		Formula
---------- ---------- --------------    -------------   ------------    ----------
Aleksandra Jarczyk    98043005188        1              Runmeggedon 	Classic
  
Aleksandra Ogiela     98043005201        2 				Runmeggedon 	Intro
   
Karolina   Jarczyk    98043005202        3 				Armaggedon 		Runner

Nikola     Radym      98043005204        4 				Runmeggedon 	Intro
   
Ola        Olszowska  97043005204        5 				Armaggedon 		Warrior

Anna       Los        94043005204        6 				Runmeggedon 	Hardkor
  
*/


UPDATE V_UCZ_BIE SET V_UCZ_BIE.Nazwisko='Guja' WHERE V_UCZ_BIE.Nazwisko= 'Los';

select * from V_UCZ_BIE;


/*
Imie       Nazwisko   Pesel             ID_Kategoria    Rodzaj     		Formula
---------- ---------- --------------    -------------   ------------    ----------
Aleksandra Jarczyk    98043005188        1              Runmeggedon 	Classic
  
Aleksandra Ogiela     98043005201        2 				Runmeggedon 	Intro
   
Karolina   Jarczyk    98043005202        3 				Armaggedon 		Runner

Nikola     Radym      98043005204        4 				Runmeggedon 	Intro
   
Ola        Olszowska  97043005204        5 				Armaggedon 		Warrior

Anna       Guja       94043005204        6 				Runmeggedon 	Hardkor
  
*/


DELETE FROM V_UCZ_BIE WHERE V_UCZ_BIE.Imie='Ola';

select * from V_UCZ_BIE;

/*
Imie       Nazwisko   Pesel             ID_Kategoria    Rodzaj     		Formula
---------- ---------- --------------    -------------   ------------    ----------
Aleksandra Jarczyk    98043005188        1              Runmeggedon 	Classic
  
Aleksandra Ogiela     98043005201        2 				Runmeggedon 	Intro
   
Karolina   Jarczyk    98043005202        3 				Armaggedon 		Runner

Nikola     Radym      98043005204        4 				Runmeggedon 	Intro

Anna       Guja       94043005204        6 				Runmeggedon 	Hardkor
*/



		----------------------------------------;
		 --TRIGGER ZASTĘPUJĄCY DELETE LUB UPDATE
		----------------------------------------;
	
	create or replace trigger T_V_UCZ_BIE
		INSTEAD OF INSERT ON V_UCZ_BIE
		for each row
		begin 
		INSERT INTO UCZESTNICY VALUES (NULL,:new.Imie,:new.Nazwisko,:new.Pesel,NULL,NULL,:new.ID_Kategoria);
		INSERT INTO KATEGORIE VALUES (NULL,:new.Rodzaj,:new.Formula,NULL);
		end;
		/
	
	

		insert INTO V_UCZ_BIE VALUES('Damian','Wos','98777777788',5,NULL,NULL);
		insert INTO V_UCZ_BIE VALUES('Klaudia','Kozlowska','97797777788',6,NULL,NULL);


		select * from V_UCZ_BIE;
		
	
	/*
	
	Imie       Nazwisko   Pesel                                                        ID_Kategoria Rodzaj       Formula
	---------- ---------- ------------------------------------------------------------ ------------ ------------ ----------
	Aleksandra Jarczyk    98043005188                                                             1 Runmeggedon  Classic
	Aleksandra Ogiela     98043005201                                                             2 Runmeggedon  Intro
	Karolina   Jarczyk    98043005202                                                             3 Armaggedon   Runner
	Nikola     Radym      98043005204                                                             4 Runmeggedon  Intro
	Anna       Guja       94043005204                                                             6 Armaggedon   Runner
	Damian     Wos        98777777788                                                             7
	Klaudia    Kozlowska  97797777788                                                             8
	
	*/
	

	create or replace trigger T_KATEGORIE_DELETE
		AFTER insert on KATEGORIE
		begin 
		DELETE FROM KATEGORIE WHERE KAT_Rodzaj is NULL;
		end;
		/
	
		insert INTO V_UCZ_BIE VALUES('Damian','Wos','98777777788',7,NULL,NULL);
		insert INTO V_UCZ_BIE VALUES('Klaudia','Kozlowska','97797777788',8,NULL,NULL);
		
	/*
		Imie       Nazwisko   Pesel                                                        ID_Kategoria Rodzaj       Formula
	---------- ---------- ------------------------------------------------------------ ------------ ------------ ----------
	Aleksandra Jarczyk    98043005188                                                             1 Runmeggedon  Classic
	Aleksandra Ogiela     98043005201                                                             2 Runmeggedon  Intro
	Karolina   Jarczyk    98043005202                                                             3 Armaggedon   Runner
	Nikola     Radym      98043005204                                                             4 Runmeggedon  Intro
	Anna       Guja       94043005204                                                             6 Armaggedon   Runner
	
	*/



	
----------------------------------------;
-- PERSPEKTYWA_II;
----------------------------------------;
	CREATE OR REPLACE VIEW V_BIE_UMO
(Rodzaj, Formula, ID_UMOWA, Ubezpieczenie, Cena)
as 
select c.KAT_Rodzaj, c.KAT_Formula, c.UMOW_ID, c.UMO_Ubezpieczenie, c.UMO_Cena
from (
select a.KATk_1_ID, a.KAT_Rodzaj, a.KAT_Formula, a.UMOW_ID, b.UMOk_1_ID, b.UMO_Ubezpieczenie, b.UMO_Cena
from UMOWY b, KATEGORIE a
where a.UMOW_ID = b.UMOk_1_ID) c;


		column Rodzaj 		 	  			HEADING 'Rodzaj' 								format A11;
		column Formula 		  				HEADING 'Formula' 								format A10;
		column ID_UMOWA	  					HEADING 'ID_UMOWA' 								format 999;
		column Ubezpieczenie	  		    HEADING 'Ubezpieczenie' 		    			format A12;
		column Cena	  						HEADING 'Cena' 									format 999;
		
		
	
	select * from V_BIE_UMO;
	
/*
Rodzaj       Formula    ID_UMOWA  Ubezpieczenie   Cena
----------- ---------- -------------------- ----
Runmeggedon    Classic           1   Zdrowotne      20
Runmeggedon    Intro             2   Zdrowotne      30
Armaggedon     Runner            3   Zdrowotne      40
Runmeggedon    Intro             4   Zdrowotne      40
Armaggedon     Hardkor           5   Calosciowe     40
Armaggedon     Runner            6   Calosciowe     100
*/
	
	
	UPDATE V_BIE_UMO SET V_BIE_UMO.Formula ='Rekrut' WHERE V_BIE_UMO.Formula = 'Classic';

	select * from V_BIE_UMO;
	
/*
Rodzaj      Formula    ID_UMOWA Ubezpieczenie Cena
----------- ---------- -------- ------------ ----
Runmeggedon Rekrut            1 Zdrowotne      20
Runmeggedon Intro             2 Zdrowotne      30
Armaggedon  Runner            3 Zdrowotne      40
Runmeggedon Intro             4 Zdrowotne      40
Armaggedon  Hardkor           5 Calosciowe     40
Armaggedon  Runner            6 Calosciowe    100
*/
	
	
	DELETE FROM V_BIE_UMO WHERE V_BIE_UMO.Formula ='Intro';

	select * from V_BIE_UMO;

/*
Rodzaj      Formula    ID_UMOWA Ubezpieczeni Cena
----------- ---------- -------- ------------ ----
Runmeggedon Rekrut            1 Zdrowotne      20
Armaggedon  Runner            3 Zdrowotne      40
Armaggedon  Hardkor           5 Calosciowe     40
Armaggedon  Runner            6 Calosciowe    100
*/
	
	

----------------------------------------;
--TRIGGER ZASTĘPUJĄCY DELETE LUB UPDATE
----------------------------------------;
			
		create or replace trigger T_V_BIE_UMO
		INSTEAD OF INSERT ON V_BIE_UMO
		for each row
		begin 
		INSERT INTO KATEGORIE VALUES (NULL,:new.Rodzaj,:new.Formula,NULL);
		INSERT INTO UMOWY VALUES (NULL,:new.Ubezpieczenie,:new.Cena);
		end;
		/
		
		
		insert INTO V_BIE_UMO VALUES('Runmeggedon','Classic',5,NULL,NULL);
		insert INTO V_BIE_UMO VALUES('Runmeggedon','Hardkor',6,NULL,NULL);
		
		
		select * from V_BIE_UMO;

		
/*
Rodzaj      Formula    ID_UMOWA Ubezpieczeni Cena
----------- ---------- -------- ------------ ----
Runmeggedon Rekrut            1 Zdrowotne      20
Armaggedon  Runner            3 Zdrowotne      40
Armaggedon  Hardkor           5 Calosciowe     40
Armaggedon  Runner            6 Calosciowe    100
Runmeggedon Classic           5 Calosciowe     40
Runmeggedon Hardkor           6 Calosciowe    100
*/
		
		
		
		create or replace trigger T_KATEGORIE_DELETE_ii
		AFTER insert on KATEGORIE
		begin 
		DELETE FROM KATEGORIE WHERE KAT_Rodzaj is NULL;
		end;
		/
		
	
		select * from V_BIE_UMO;
	
	

	
	
----------------------------------------;
--TRANSAKCJE;
----------------------------------------;	
			
		COMMIT;
	
	
	INSERT INTO MIEJSCE VALUES(NULL,'Polska','Kluszkowce','Grzybowa',8,'15',4);
	SAVEPOINT Insert_1;
	INSERT INTO MIEJSCE VALUES(NULL,'Polska','Gdansk','Zielona',9,'12',4);
	INSERT INTO MIEJSCE VALUES(NULL,'Polska','Krosno','Czerwona',10,'13',4);
	INSERT INTO MIEJSCE VALUES(NULL,'Polska','Torun','Wesola',11,'14',4);
	INSERT INTO MIEJSCE VALUES(NULL,'Polska','Trzebinia','Wesola',12,'14',4);
	INSERT INTO MIEJSCE VALUES(NULL,'Polska','Krzeszowice','Jagiellonska',4,'14',4);
	SELECT * FROM MIEJSCE;
	
/*

  ID Kraj            Miejscowosc     Ulica           Nr_domu Nr_lo Kod_po
---- --------------- --------------- --------------- ------- ----- ------
   1 Polska          Chrzanow        Grzybowa              1 15    4
   2 Polska          Kielce          Zielona               2 12    4
   3 Polska          Chrzanow        Czerwona              3 13    4
   4 Polska          Warszawa        Wesola                4 14    4
   5 Polska          Chrzanow        Wesola                4 14    4
   6 Polska          Krakow          Jagiellonska          4 14    4
   7 Polska          Kluszkowce      Grzybowa              8 15    4
   8 Polska          Gdansk          Zielona               9 12    4
   9 Polska          Krosno          Czerwona             10 13    4
  10 Polska          Torun           Wesola               11 14    4
  11 Polska          Trzebinia       Wesola               12 14    4
  12 Polska          Krzeszowice     Jagiellonska          4 14    4
*/

	ROLLBACK TO SAVEPOINT Insert_1;
		
	SELECT * FROM MIEJSCE;
	
/*
 ID Kraj            Miejscowosc     Ulica           Nr_domu Nr_lo Kod_po
---- --------------- --------------- --------------- ------- ----- ------
   1 Polska          Chrzanow        Grzybowa              1 15    4
   2 Polska          Kielce          Zielona               2 12    4
   3 Polska          Chrzanow        Czerwona              3 13    4
   4 Polska          Warszawa        Wesola                4 14    4
   5 Polska          Chrzanow        Wesola                4 14    4
   6 Polska          Krakow          Jagiellonska          4 14    4
   7 Polska          Kluszkowce      Grzybowa              8 15    4
 */
 

-------------------------------------------------------------------------------------------------
COMMIT;

	INSERT INTO UMOWY VALUES(NULL,'Calosciowe',120 );
	INSERT INTO UMOWY VALUES(NULL,'Zdrowotne',40);
	INSERT INTO UMOWY VALUES(NULL,'Calosciowe',130);
	INSERT INTO UMOWY VALUES(NULL,'Zdrowotne',40);
	
	SELECT * FROM UMOWY;
	
	
	
	
/*
 ID Ubezpieczenie   Cena
---- --------------- ----
   1 Zdrowotne         20
   2 Zdrowotne         30
   3 Zdrowotne         40
   4 Zdrowotne         40
   5 Calosciowe        40
   6 Calosciowe       100
   7 Calosciowe       120
   8 Zdrowotne         40
   9 Calosciowe       130
  10 Zdrowotne         40
 */
	
	ROLLBACK;
	
	SELECT * FROM UMOWY;
	
/*
 ID Ubezpieczenie   Cena
---- --------------- ----
   1 Zdrowotne         20
   2 Zdrowotne         30
   3 Zdrowotne         40
   4 Zdrowotne         40
   5 Calosciowe        40
   6 Calosciowe       100
*/




----------------------------------------;
--INDEX FUNKCYJNY;
----------------------------------------;	
		
			
		create index IX_KAT_RODZAJ_UPPER
		on KATEGORIE (UPPER(KAT_Rodzaj))
		STORAGE (INITIAL 500k NEXT 250k)
		tablespace STUDENT_INDEX;
		
		select KATk_1_ID,KAT_Rodzaj,KAT_Formula
		from KATEGORIE where UPPER(KAT_RODZAJ) LIKE 'R%';

/*
 ID Rodzaj          Formula
---- --------------- ---------------
   1 Runmeggedon     Rekrut
  12 Runmeggedon     Hardkor
  11 Runmeggedon     Classic
*/


----------------------------------------;
--INDEX FUNKCYJNY;
----------------------------------------;
	   

		create index IX_UCZ_IMIE_UPPER
		on UCZESTNICY (UPPER(UCZ_Imie))
		STORAGE (INITIAL 500k NEXT 250k)
		tablespace STUDENT_INDEX;
		
		
		select UCZk_1_ID, UCZ_Imie, UCZ_Nazwisko
		from UCZESTNICY where UPPER(UCZ_Imie) NOT LIKE 'A%';  

/*
 ID Imie       Nazwisko
---- ---------- ------------
   3 Karolina   Jarczyk
   4 Nikola     Radym
  10 Klaudia    Kozlowska
   7 Damian     Wos
   8 Klaudia    Kozlowska
   9 Damian     Wos
  */



----------------------------------------;
--INDEX FUNKCYJNY;
----------------------------------------;	
		
			
		create index IX_MIE_MIEJSCOWOSC_UPPER
		on MIEJSCE (UPPER(MIE_Miejscowosc))
		STORAGE (INITIAL 500k NEXT 250k)
		tablespace STUDENT_INDEX;
		
		
		
		select MIEk_1_ID,MIE_Kraj,MIE_Miejscowosc, MIE_Kod_pocztowy
		from MIEJSCE where UPPER(MIE_MIEJSCOWOSC) LIKE 'C%';




----------------------------------------;
--PROCEDURA Z FOR;
----------------------------------------;

	CREATE or REPLACE PROCEDURE bie_st1_insert (ile IN number)
		IS licznik number(2);
		BEGIN
			FOR licznik IN 1..10
			LOOP	
				INSERT INTO KATEGORIE(KAT_Rodzaj,KAT_Formula) VALUES ('Rodzaj'||licznik,'Formula'||licznik);
			END LOOP;
		END;
	/

	BEGIN

	bie_st1_insert(10);

	END;
	/

	SELECT KATk_1_ID, KAT_Rodzaj, KAT_Formula FROM KATEGORIE order by KATk_1_ID;


/*
 PL/SQL procedure successfully completed.

 ID Rodzaj          Formula
---- --------------- ---------------
   1 Runmeggedon     Rekrut
   3 Armaggedon      Runner
   5 Armaggedon      Hardkor
   6 Armaggedon      Runner
  11 Runmeggedon     Classic
  12 Runmeggedon     Hardkor
  13 Rodzaj1         Formula1
  14 Rodzaj2         Formula2
  15 Rodzaj3         Formula3
  16 Rodzaj4         Formula4
  17 Rodzaj5         Formula5
  18 Rodzaj6         Formula6
  19 Rodzaj7         Formula7
  20 Rodzaj8         Formula8
  21 Rodzaj9         Formula9
  22 Rodzaj10        Formula10

10 rows selected.
  
*/

----------------------------------------;
--WERYFIKACJA;
----------------------------------------;
		
	CREATE or REPLACE PROCEDURE WERYFIKOWANIE(zmienna IN VARCHAR2)
		IS
		zmienna1 VARCHAR2(20);
	    BEGIN
		SELECT KAT_Rodzaj INTO zmienna1 FROM KATEGORIE WHERE KAT_Rodzaj=zmienna;
			IF zmienna1=zmienna 
			THEN  DBMS_OUTPUT.PUT_LINE('Rekord istnieje, jego wartosc to '||zmienna1);
		END IF;
		exception
		when others then
		dbms_output.put_line('Rekord nie istnieje!');
	END;
	/
		
		
		
		BEGIN
		WERYFIKOWANIE('Rodzaj1');
		END;
		/

	--Rekord istnieje, jego wartosc to Rodzaj1
		
----------------------------------------;
--FUNKCJA;
----------------------------------------;
		
		
		CREATE or REPLACE FUNCTION f_delete(operacja IN number)
		RETURN VARCHAR2
		IS
		licznik number(2);
		m licznik%TYPE;
		n licznik%TYPE;
		BEGIN
		licznik:=1;
		WHILE licznik<operacja
		LOOP
		delete from KATEGORIE where KAT_Rodzaj LIKE '%j'||licznik;
		licznik:=licznik+1;
		END LOOP;
		select count(*) into m from KATEGORIE;
		n:=licznik-m;
		RETURN 'Usunieto wszytkie nowo dodane kluby, ich liczba wynosi '||n;
		END;
		/
		
		BEGIN
		DBMS_OUTPUT.PUT_LINE(f_delete(11));
		
		END;
		/

--Usunieto wszytkie nowo dodane kluby, ich liczba wynosi 10
		
	SELECT KATk_1_ID, KAT_Rodzaj, KAT_Formula FROM KATEGORIE order by KATk_1_ID;
	
	/*
	 1 Runmeggedon     Rekrut
   3 Armaggedon      Runner
   5 Armaggedon      Hardkor
   6 Armaggedon      Runner
  11 Runmeggedon     Classic
  12 Runmeggedon     Hardkor
  */

	
		BEGIN
		WERYFIKOWANIE('Rodzaj10');
		END;
		/	

--Rekord nie istnieje!


----------------------------------------;
--PROCEDURA Z WHILE;
----------------------------------------;

CREATE or REPLACE PROCEDURE lok_st1_insert (ile IN number)
	IS licznik number(2);
	BEGIN licznik := 1;
		WHILE licznik < ile+1
		LOOP	
			INSERT INTO LOKALIZACJE(LOK_Kraj,LOK_Miejscowosc) VALUES ('Kraj'||licznik,'Miejscowosc'||licznik);
			licznik:= licznik + 1;
		END LOOP;
	END;
/

BEGIN

lok_st1_insert(10);

END;
/

SELECT LOKk_1_ID, LOK_Kraj, LOK_Miejscowosc FROM LOKALIZACJE order by LOKk_1_ID;

/*
PL/SQL procedure successfully completed.


  ID Kraj            Miejscowosc
---- --------------- ---------------
   1 Kraj1           Miejscowosc1
   2 Kraj2           Miejscowosc2
   3 Kraj3           Miejscowosc3
   4 Kraj4           Miejscowosc4
   5 Kraj5           Miejscowosc5
   6 Kraj6           Miejscowosc6
   7 Kraj7           Miejscowosc7
   8 Kraj8           Miejscowosc8
   9 Kraj9           Miejscowosc9
  10 Kraj10          Miejscowosc10

10 rows selected.
*/


----------------------------------------;
--WERYFIKACJA;
----------------------------------------;
		
	CREATE or REPLACE PROCEDURE WERYFIKOWANIE1(zmienna IN VARCHAR2)
		IS
		zmienna1 VARCHAR2(20);
	    BEGIN
		SELECT LOK_Kraj INTO zmienna1 FROM LOKALIZACJE WHERE LOK_Kraj=zmienna;
			IF zmienna1=zmienna 
			THEN  DBMS_OUTPUT.PUT_LINE('Rekord istnieje, jego wartosc to '||zmienna1);
		END IF;
		exception
		when others then
		dbms_output.put_line('Rekord nie istnieje!');
	END;
	/
		
		
		
		BEGIN
		WERYFIKOWANIE1('Kraj1');
		END;
		/

	/*
		Rekord istnieje, jego wartosc to Kraj1
	*/

----------------------------------------;
--FUNKCJA;
----------------------------------------;
		
		
		CREATE or REPLACE FUNCTION f_delete1(operacja IN number)
		RETURN VARCHAR2
		IS
		licznik number(2);
		m licznik%TYPE;
		n licznik%TYPE;
		BEGIN
		licznik:=1;
		WHILE licznik<operacja
		LOOP
		delete from LOKALIZACJE where LOK_Kraj LIKE '%j'||licznik;
		licznik:=licznik+1;
		END LOOP;
		select count(*) into m from LOKALIZACJE;
		n:=licznik-m;
		RETURN 'Usunieto wszytkie nowo dodane kraje, ich liczba wynosi '||n;
		END;
		/
		
		BEGIN
		DBMS_OUTPUT.PUT_LINE(f_delete1(10));
		
		END;
		/
/*
Usunieto wszytkie nowo dodane kraje, ich liczba wynosi 10
*/
SELECT LOKk_1_ID, LOK_Kraj, LOK_Miejscowosc FROM LOKALIZACJE order by LOKk_1_ID;

/*
 1 Polska          Krakow
 2 Polska          Wroclaw
  */
  

		BEGIN
			WERYFIKOWANIE1('Kraj10');
		END;
		/
/*
Rekord nie istnieje!
*/

----------------------------------------;
--FUNKCJA Z IF, ELSE;
----------------------------------------;
CREATE OR REPLACE FUNCTION SPRAWDZ_RANKING(RAN_Punkty IN number)
RETURN VARCHAR2
IS
BEGIN
IF (RAN_Punkty) >= 100 THEN
RETURN 'Uczestnik wygral';
ELSIF (RAN_Punkty)>=60 and (RAN_Punkty)<100 THEN
RETURN 'Uczestnik zajal drugie miejsce';
ELSIF (RAN_Punkty)>= 50 and (RAN_Punkty)<60 THEN
RETURN 'Uczestnik zajal trzecie miejsce';
ELSIF (RAN_Punkty) < 30 THEN
RETURN 'Nie ma uczestnika z taka ilościa punktow';
END IF;
END;
/

BEGIN
DBMS_OUTPUT.PUT_LINE(SPRAWDZ_RANKING(100));
END;
/

SELECT SPRAWDZ_RANKING(100),
SPRAWDZ_RANKING(60),
SPRAWDZ_RANKING(50)
FROM DUAL;


/*

Function created.
SQL> SELECT SPRAWDZ_RANKING(100),
  2  SPRAWDZ_RANKING(60),
  3  SPRAWDZ_RANKING(50)
  4  FROM DUAL;
  
Uczestnik wygral
Uczestnik zajal drugie miejsce
Uczestnik zajal trzecie miejsce
*/

	


--LAB8	

----------------------------------------;
--PROCEDURA DO WPROWADZANIA DANYCH;
----------------------------------------;	
	
CREATE or REPLACE PROCEDURE DODAWANIE(
	ile IN number,
	Imie      UCZESTNICY.UCZ_Imie%TYPE,
	Nazwisko  UCZESTNICY.UCZ_Nazwisko%TYPE,
	PESEL     UCZESTNICY.UCZ_PESEL%TYPE,
	Kraj      MIEJSCE.MIE_Kraj%TYPE,
	Miejscowosc     MIEJSCE.MIE_Miejscowosc%TYPE,
	Ulica      MIEJSCE.MIE_Ulica%TYPE,
	Nr_domu  MIEJSCE.MIE_Nr_domu%TYPE,
	Nr_lokalu  MIEJSCE.MIE_Nr_lokalu%TYPE,
	Kod_pocztowy  MIEJSCE.MIE_Kod_pocztowy%TYPE)	
	IS 
	Imie_temp        UCZESTNICY.UCZ_Imie%TYPE;
	Nazwisko_temp    UCZESTNICY.UCZ_Nazwisko%TYPE;
	PESEL_temp   	 UCZESTNICY.UCZ_PESEL%TYPE;
	Kraj_temp        MIEJSCE.MIE_Kraj%TYPE;
	Miejscowosc_temp     MIEJSCE.MIE_Miejscowosc%TYPE; 
	Ulica_temp 		  MIEJSCE.MIE_Ulica%TYPE;
	Nr_domu_temp  MIEJSCE.MIE_Nr_domu%TYPE;
	Nr_lokalu_temp    MIEJSCE.MIE_Nr_lokalu%TYPE;
	Kod_pocztowy_temp    MIEJSCE.MIE_Kod_pocztowy%TYPE;
	x_mie_temp		  MIEJSCE.MIEk_1_ID%TYPE;
	licznik number(4);
	BEGIN licznik := 1;
    WHILE licznik < ile+1
    LOOP
	Imie_temp := Imie || licznik;      
	Nazwisko_temp := Nazwisko || licznik;
	PESEL_temp := PESEL || licznik;
	Kraj_temp := Kraj || licznik; 
	Miejscowosc_temp := Miejscowosc || licznik; 
	Ulica_temp := Ulica || licznik;
	Nr_domu_temp := Nr_domu || licznik; 
	Nr_lokalu_temp := Nr_lokalu || licznik; 
	Kod_pocztowy_temp := Kod_pocztowy || licznik; 
		INSERT INTO MIEJSCE(MIEJSCE.MIE_Kraj, MIEJSCE.MIE_Miejscowosc, MIEJSCE.MIE_Ulica, MIEJSCE.MIE_Nr_domu, MIEJSCE.MIE_Nr_lokalu, MIEJSCE.MIE_Kod_pocztowy) VALUES (Kraj_temp, Miejscowosc_temp, Ulica_temp, Nr_domu_temp, Nr_lokalu_temp, Kod_pocztowy_temp) returning MIEk_1_ID into x_mie_temp;
		INSERT INTO UCZESTNICY(UCZESTNICY.UCZ_Imie, UCZESTNICY.UCZ_Nazwisko, UCZESTNICY.UCZ_PESEL, MIE_ID) VALUES(Imie_temp, Nazwisko_temp, PESEL_temp, x_mie_temp);
		licznik := licznik + 1;
		END LOOP;
		END;
		/
	

	BEGIN
		DODAWANIE(3,'Imie','Nazwisko','PESEL','Kraj','Miejscowosc','Ulica',50,100,500);
	END;
	/


SELECT * FROM  MIEJSCE;

SELECT * FROM UCZESTNICY;

/*

 ID Kraj            Miejscowosc     Ulica           Nr_domu Nr_lokalu                      Kod_pocz
--- --------------- --------------- --------------- ------- ------------------------------ --------
  1 Polska          Chrzanow        Grzybowa              1 15                             4
  2 Polska          Kielce          Zielona               2 12                             4
  3 Polska          Chrzanow        Czerwona              3 13                             4
  4 Polska          Warszawa        Wesola                4 14                             4
  5 Polska          Chrzanow        Wesola                4 14                             4
  6 Polska          Krakow          Jagiellonska          4 14                             4
  7 Polska          Kluszkowce      Grzybowa              8 15                             4
 13 Kraj1           Miejscowosc1    Ulica1              501 1001                           5001
 14 Kraj2           Miejscowosc2    Ulica2              502 1002                           5002
 15 Kraj3           Miejscowosc3    Ulica3              503 1003                           5003
*/

/*
  ID Imie       Nazwisko     PESEL       MiejsceID UmowaID KategoriaID
---- ---------- ------------ ----------- --------- ------- -----------
   1 Aleksandra Jarczyk      98043005188         1       1           1
   2 Aleksandra Ogiela       98043005201         2       2           2
   3 Karolina   Jarczyk      98043005202         3       3           3
   4 Nikola     Radym        98043005204         4       4           4
  10 Klaudia    Kozlowska    97797777788                             8
   6 Anna       Guja         94043005204         6       6           6
   7 Damian     Wos          98777777788                             5
   8 Klaudia    Kozlowska    97797777788                             6
   9 Damian     Wos          98777777788                             7
  11 Imie1      Nazwisko1    PESEL1             13
  12 Imie2      Nazwisko2    PESEL2             14
  13 Imie3      Nazwisko3    PESEL3             15
  */
  
  
  
  
 ----------------------------------------;
--PROCEDURA DO WPROWADZANIA DANYCH;
----------------------------------------; 
  
  CREATE or REPLACE PROCEDURE updateUCZESTNICY(nazwa UCZESTNICY.UCZ_Imie%TYPE)	
		IS 
		Nazwa_temp        UCZESTNICY.UCZ_Imie%TYPE;
		BEGIN 
		Nazwa_temp := nazwa||'imie';
	   UPDATE UCZESTNICY SET UCZ_Imie = Nazwa_temp WHERE UCZ_Imie = nazwa;
	   IF SQL%NOTFOUND THEN DBMS_OUTPUT.PUT_LINE('Nie znaleziono, wstawiam');
		INSERT INTO UCZESTNICY(UCZESTNICY.UCZ_Imie, UCZESTNICY.UCZ_Nazwisko, UCZESTNICY.UCZ_PESEL, MIE_ID)
		VALUES(Nazwa_temp, 'Jarczyk', 'PESEL', 4);
	   END IF;
		END;
		/
	
		BEGIN
		updateUCZESTNICY('Ola');
		END;
		/

	SELECT * FROM UCZESTNICY;
	
	--Procedura została utworzona.
	--Nie znaleziono, wstawiam
	/*
	 ID Imie       Nazwisko     PESEL       MiejsceID UmowaID KategoriaID
--- ---------- ------------ ----------- --------- ------- -----------
  1 Aleksandra Jarczyk      98043005188         1       1           1
  2 Aleksandra Ogiela       98043005201         2       2           2
  3 Karolina   Jarczyk      98043005202         3       3           3
  4 Nikola     Radym        98043005204         4       4           4
 10 Klaudia    Kozlowska    97797777788                             8
  6 Anna       Guja         94043005204         6       6           6
  7 Damian     Wos          98777777788                             5
  8 Klaudia    Kozlowska    97797777788                             6
  9 Damian     Wos          98777777788                             7
 11 Imie1      Nazwisko1    PESEL1             13
 12 Imie2      Nazwisko2    PESEL2             14
 13 Imie3      Nazwisko3    PESEL3             15
 14 ALEKSANDRA Jarczyk      PESEL               4
    imie

 15 Olaimie    Jarczyk      PESEL               4
 */
 

	BEGIN
	updateUCZESTNICY('Anna');
	END;
	/

/*

 ID Imie       Nazwisko     PESEL       MiejsceID UmowaID KategoriaID
--- ---------- ------------ ----------- --------- ------- -----------
  1 Aleksandra Jarczyk      98043005188         1       1           1
  2 Aleksandra Ogiela       98043005201         2       2           2
  3 Karolina   Jarczyk      98043005202         3       3           3
  4 Nikola     Radym        98043005204         4       4           4
 10 Klaudia    Kozlowska    97797777788                             8
  6 Annaimie   Guja         94043005204         6       6           6
  7 Damian     Wos          98777777788                             5
  8 Klaudia    Kozlowska    97797777788                             6
  9 Damian     Wos          98777777788                             7
 11 Imie1      Nazwisko1    PESEL1             13
 12 Imie2      Nazwisko2    PESEL2             14
 13 Imie3      Nazwisko3    PESEL3             15
 14 ALEKSANDRA Jarczyk      PESEL               4
    imie

 15 Olaimie    Jarczyk      PESEL               4
 */
 

	
----------------------------------------;
--PROCEDURA DO WPROWADZANIA DANYCH;
----------------------------------------;
CREATE or REPLACE PROCEDURE ucz_kat_insert (ile IN number)
	IS licznik number(2);
	u1id UCZESTNICY.UCZk_1_ID%Type;
	kid KATEGORIE.KATk_1_ID%Type;
		BEGIN licznik := 1;
			WHILE licznik < ile+1
			LOOP	
				
				INSERT INTO KATEGORIE(KAT_Rodzaj,KAT_Formula) 
				VALUES ('Rodzaj'||licznik,'Formula'||licznik)
				RETURNING KATk_1_ID INTO kid;
				
				INSERT INTO UCZESTNICY(UCZ_Imie,UCZ_Nazwisko) 
				VALUES ('Imie'||licznik,'Nazwisko'||licznik)
				RETURNING UCZk_1_ID INTO u1id;
				
				INSERT INTO KUC(KAT1_ID, UCZ1_ID) VALUES(kid,u1id);
				licznik:= licznik+1;
			END LOOP;
		END;
		/
				
	
	BEGIN

ucz_kat_insert(5);

	END;
	/
	
	SELECT LOKk_1_ID, LOK_Kraj, LOK_Miejscowosc FROM LOKALIZACJE;
	SELECT KATk_1_ID, KAT_Rodzaj, KAT_Formula FROM KATEGORIE;
	
	
	
--Laboratorium 9	


 create or replace procedure sprawdz_liczbe_uczestnikow(uczestnik in varchar2)
	is 
	uczestnicy_exception EXCEPTION;
	PRAGMA EXCEPTION_INIT(uczestnicy_exception,-20002);
	type UCZESTNICY_RECORD is record (
	xID          BIEG_EKSTREMALNY.BIEk_1_ID%TYPE,
	xNAZWA     BIEG_EKSTREMALNY.BIE_Nazwa%TYPE,
	xLICZBA   BIEG_EKSTREMALNY.BIE_Liczba_uczestników%TYPE
	);
	
	
		UCZESTNICY_TEMP UCZESTNICY_RECORD;
		
		cursor UCZESTNICY_CURSOR
		IS
		select BIEk_1_ID, BIE_Nazwa, BIE_Liczba_uczestników  FROM BIEG_EKSTREMALNY where BIE_Nazwa like uczestnik;    
		
		
		BEGIN
		open UCZESTNICY_CURSOR;
		loop
			fetch UCZESTNICY_CURSOR into UCZESTNICY_TEMP;
			
			if UCZESTNICY_TEMP.xNAZWA = uczestnik
			then
			dbms_output.put_line(UCZESTNICY_TEMP.xNAZWA||' o id: '||UCZESTNICY_TEMP.xID||' posiada '||UCZESTNICY_TEMP.xLICZBA||' uczestnikow');
			end if;
			
			if UCZESTNICY_TEMP.xLICZBA=0 then
			raise_application_error(-20002,'BRAK UCZESTNIKÓW BIEGU '||UCZESTNICY_TEMP.xNAZWA||' o id: '||UCZESTNICY_TEMP.xID);	
			end if;
			
			if UCZESTNICY_CURSOR%ROWCOUNT<1 then
			INSERT INTO BIEG_EKSTREMALNY VALUES (NULL,uczestnik,300,6);
			dbms_output.put_line('Wstawiam nowy rekord');
			end if;
			
			exit when UCZESTNICY_CURSOR%NOTFOUND;
			end loop;
			close UCZESTNICY_CURSOR;
			EXCEPTION
			when uczestnicy_exception then
				dbms_output.put_line('BLAD: ' || SQLERRM);
	end;
	/	

	
	
	BEGIN
	sprawdz_liczbe_uczestnikow('Runmeggeddon');
	END;
	/
	
	/*
	Runmeggeddon o id: 1 posiada 125 uczestnikow

	PL/SQL procedure successfully completed.
	*/

	BEGIN
	sprawdz_liczbe_uczestnikow('Armaggedon');
	END;
	/

	/*
	Armaggedon o id: 2 posiada 220 uczestnikow

	PL/SQL procedure successfully completed.
	*/

	
	BEGIN
	sprawdz_liczbe_uczestnikow('Barbarian Race');
	END;
	/
	
	/*
	Barbarian Race o id: 3 posiada 100 uczestnikow

	PL/SQL procedure successfully completed.
	*/

	
	BEGIN
	sprawdz_liczbe_uczestnikow('Survival Race');
	END;
	/

	/*
	Survival Race o id: 4 posiada 130 uczestnikow

	PL/SQL procedure successfully completed.
	*/

	
	
	BEGIN
	sprawdz_liczbe_uczestnikow('Bieg Gladiatora');
	END;
	/
	
	/*
	Bieg Gladiatora o id: 5 posiada 50 uczestnikow

	PL/SQL procedure successfully completed.
	*/

	BEGIN
	sprawdz_liczbe_uczestnikow('nowa');
	END;
	/

	/*
	Wstawiam nowy rekord
	
	 BIEK_1_ID Nazwa           BIE_LICZBA_UCZESTNIKOW BIEG_ID
---------- --------------- ----------------------- -------
         1 Runmeggeddon                        125       1
         2 Armaggedon                          220       2
         3 Barbarian Race                      100       3
         4 Survival Race                       130       4
         5 Bieg Gladiatora                      50       5
         6 nowa                                300       6
	*/

	create or replace procedure sprawdz_liczbe_miejscowosc
	is 
	miejscowosc_exception EXCEPTION;
	PRAGMA EXCEPTION_INIT(miejscowosc_exception,-20002);
	type MIEJSCE_RECORD is record (
	xID          MIEJSCE.MIEk_1_ID%TYPE,
	xMIEJSCOWOSC    MIEJSCE.MIE_Miejscowosc%TYPE
	
	);
	
	
		MIEJSCE_TEMP MIEJSCE_RECORD;
		
		cursor MIEJSCE_CURSOR
		IS
		select MIEk_1_ID, MIE_Miejscowosc  FROM MIEJSCE;    
		
		
		BEGIN
		open MIEJSCE_CURSOR;
		loop
			fetch MIEJSCE_CURSOR into MIEJSCE_TEMP;
			exit when MIEJSCE_CURSOR%NOTFOUND or MIEJSCE_CURSOR%ROWCOUNT <1;
			
			if LENGTH(MIEJSCE_TEMP.xMIEJSCOWOSC)=0
			then
			raise_application_error(-2001, 'Zerowa miejscowosc');

			elsif LENGTH(MIEJSCE_TEMP.xMIEJSCOWOSC)<15 then 
			update MIEJSCE set MIEJSCE.MIE_Miejscowosc ='NOWA' where MIEk_1_ID = MIEJSCE_TEMP.xID;
			dbms_output.put_line('Zmieniono miejscowosc o id: '|| MIEJSCE_TEMP.xID|| ' na NOWA');
			end if;
			
		end loop;
		close MIEJSCE_CURSOR;
		EXCEPTION
			when miejscowosc_exception then 
				dbms_output.put_line('BŁĄD: '||SQLERRM);
		end;
		/
			
			
	end;
	/	
	
	
	BEGIN
	sprawdz_liczbe_miejscowosc();
	END;
	/
	
	/*
	Zmieniono miejscowosc o id: 1 na NOWA
	Zmieniono miejscowosc o id: 2 na NOWA
	Zmieniono miejscowosc o id: 3 na NOWA
	Zmieniono miejscowosc o id: 4 na NOWA
	Zmieniono miejscowosc o id: 5 na NOWA
	Zmieniono miejscowosc o id: 6 na NOWA
	Zmieniono miejscowosc o id: 7 na NOWA
	Zmieniono miejscowosc o id: 13 na NOWA
	Zmieniono miejscowosc o id: 14 na NOWA
	Zmieniono miejscowosc o id: 15 na NOWA

	PL/SQL procedure successfully completed.
	*/
	
	/*
	  ID Kraj            Miejscowosc     Ulica           Nr_domu Nr_lokalu                      Kod_pocztowy
---- --------------- --------------- --------------- ------- ------------------------------ ------------------------------
   1 Polska          NOWA            Grzybowa              1 15                             4
   2 Polska          NOWA            Zielona               2 12                             4
   3 Polska          NOWA            Czerwona              3 13                             4
   4 Polska          NOWA            Wesola                4 14                             4
   5 Polska          NOWA            Wesola                4 14                             4
   6 Polska          NOWA            Jagiellonska          4 14                             4
   7 Polska          NOWA            Grzybowa              8 15                             4
  13 Kraj1           NOWA            Ulica1              501 1001                           5001
  14 Kraj2           NOWA            Ulica2              502 1002                           5002
  15 Kraj3           NOWA            Ulica3              503 1003                           5003
  */
	
	
	
	
--Laboratorium 10		
	
	 CREATE OR REPLACE PROCEDURE collection (ile IN NUMBER)
   AS
   idx_UMO     UMOWY.UMOk_1_ID%TYPE;
   licznik number(2);
   
   type RODZAJ	  			 is varray(8) of varchar2(30);
   type FORMULA    			 is varray(8) of varchar2(30);
   type UBEZPIECZENIE        is varray(8) of varchar2(30);
   type CENA	             is varray(8) of varchar2(30);
   
   
   
   tmp_rodzaj				 KATEGORIE.KAT_Rodzaj%TYPE;
   tmp_formula 				 KATEGORIE.KAT_Formula%TYPE;
   tmp_ubezpieczenie	  	 UMOWA.UMO_Ubezpieczenie%TYPE;
   tmp_cena		    		 UMOWA.UMO_Cena%TYPE;
   
   
   rodzaje 	 		RODZAJ:=RODZAJ('Rodzaj20','Rodzaj21','Rodzaj22','Rodzaj23','Rodzaj24','Rodzaj25');
   formuly 			FORMULA:=FORMULA('Formula20','Formula21','Formula22','Formula23','Formula24','Formula25');
   ubezpieczenia 	UBEZPIECZENIE:=UBEZPIECZENIE('Ubezpieczenie1','Ubezpieczenie2','Ubezpieczenie3','Ubezpieczenie4','Ubezpieczenie5','Ubezpieczenie6');
   ceny		 		CENA:=CENA(20,30,40,50,60,70);
   
   BEGIN
   licznik:=1;
   DBMS_RANDOM.INITIALIZE(96720);
   WHILE licznik<ile+1
   LOOP
      tmp_rodzaj           :=rodzaje(dbms_random.value(1,5));
	  tmp_formula 	       :=formuly(dbms_random.value(1,5));
	  tmp_ubezpieczenie    :=ubezpieczenia(dbms_random.value(1,5));
	  tmp_cena             :=ceny(dbms_random.value(1,5));
   

   INSERT INTO KATEGORIE(KAT_Formula, KAT_Rodzaj, UMOW_ID ) VALUES(tmp_formula,tmp_rodzaj, idx_UMO);
   
   INSERT INTO UMOWY(UMO_Ubezpieczenie,UMO_Cena) VALUES(tmp_ubezpieczenie,tmp_Cena) returning UMOk_1_ID  into idx_UMO;
	
   
   
   licznik:=licznik+1;
   END LOOP;
   
   EXCEPTION
   when INVALID_NUMBER
   then DBMS_OUTPUT.PUT_LINE('BLAD INVALID_NUMBER');
   when VALUE_ERROR
   then DBMS_OUTPUT.PUT_LINE('BLAD VALUE_ERROR');
   when others
   then DBMS_OUTPUT.PUT_LINE('BLAD '||SQLERRM);
   END;
   /
	
	
	
   BEGIN
   collection(6);
   END;
   /
	
	select * from UMOWY;
	select * from KATEGORIE;
	
	/*
	ID Ubezpieczenie   Cena
---- --------------- ----
   1 Zdrowotne         20
   2 Zdrowotne         30
   3 Zdrowotne         40
   4 Zdrowotne         40
   5 Calosciowe        40
   6 Calosciowe       100
   7
   8
  13 Ubezpieczenie5    30
  14 Ubezpieczenie2    40
  15 Ubezpieczenie5    30
  16 Ubezpieczenie2    40
  17 Ubezpieczenie3    30
  18 Ubezpieczenie3    40
  19 Ubezpieczenie2    20
  20 Ubezpieczenie5    50
  */
  
  /*
   ID Rodzaj          Formula         UmowaID
---- --------------- --------------- -------
   1 Runmeggedon     Rekrut                1
  12 Runmeggedon     Hardkor
   3 Armaggedon      Runner                3
   5 Armaggedon      Hardkor               5
   6 Armaggedon      Runner                6
  11 Runmeggedon     Classic
  23 Rodzaj21        Formula23
  24 Rodzaj21        Formula21            13
  25 Rodzaj21        Formula23
  26 Rodzaj21        Formula21            15
  27 Rodzaj22        Formula22            16
  28 Rodzaj24        Formula22            17
  29 Rodzaj23        Formula22            18
  30 Rodzaj23        Formula22            19
  */
	
	
	
	create or replace procedure zagniezdzona
		is 
			zmienna number(4);
			TYPE tabela_zag IS TABLE OF number(4) INDEX BY BINARY_INTEGER;
			zag tabela_zag;
			TYPE tabela_zag2 IS TABLE OF number(10) INDEX BY BINARY_INTEGER;
			zag2 tabela_zag2;
			zz number(4);
			
		BEGIN 
			zmienna:=1;
			zz:=1;
			FOR zm IN 1..10
			LOOP
				FOR zm2 IN 1..5
				LOOP
				zag2(zm2):=zmienna;
				zag(zm):=zag2(zm2);
				zmienna:= zmienna+5; --dodaje 5 punktów, w sumie po 25.
				END LOOP;
				UPDATE RANKINGI SET RAN_Punkty = zag(zm) WHERE RANk_1_ID = zz;
				zz:=zz+1;
				END LOOP;
		END;
				/
			
			
		/*
		
		Procedure created.
		
		*/
	
		BEGIN
	zagniezdzona();
		END;
		
		/
		
		/*
		ID Punkty Pozycja
	   ---- ------ -------
		1     21       4
		2     46       5
		3     71       3
		4     96       2
		5    121       1
		*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	


----------------------------------------;
--CREATE TABLE KUC;
----------------------------------------;

create table KUC
(
KUCk_1_ID number(4),
UCZ1_ID number(4),
KAT1_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table KUC
add constraint PK_KUC
primary key (KUCk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table KUC add constraint KUC
foreign key (UCZ1_ID)
references UCZESTNICY (UCZk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table KUC add constraint KUC1
foreign key (KAT1_ID)
references KATEGORIE(KATk_1_ID);




----------------------------------------;
--CREATE TABLE BUC;
----------------------------------------;

create table BUC
(
BUCk_1_ID number(4) NOT NULL,
UCZ_B_ID number(4) NOT NULL,
BIE_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table BUC
add constraint PK_BUC
primary key (BUCk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BUC add constraint BUC
foreign key (UCZ_B_ID)
references UCZESTNICY (UCZk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BUC add constraint BUC1
foreign key (BIE_ID)
references BIEG_EKSTREMALNY(BIEk_1_ID);







----------------------------------------;
--CREATE TABLE RUC;
----------------------------------------;

create table RUC
(
RUCk_1_ID number(4) NOT NULL,
UCZ_ID number(4) NOT NULL,
RAN_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table RUC
add constraint PK_RUC
primary key (RUCk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table RUC add constraint RUC
foreign key (RAN_ID)
references RANKINGI (RANk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table RUC add constraint RUC1
foreign key (UCZ_ID)
references UCZESTNICY(UCZk_1_ID);





----------------------------------------;
--CREATE TABLE BLO;
----------------------------------------;

create table BLO
(
BLOk_1_ID number(4) NOT NULL,
LOK_ID number(4) NOT NULL,
BIE_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table BLO
add constraint PK_BLO
primary key (BLOk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BLO add constraint BLO
foreign key (LOK_ID)
references LOKALIZACJE (LOKk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BLO add constraint BLO1
foreign key (BIE_ID)
references BIEG_EKSTREMALNY(BIEk_1_ID);




----------------------------------------;
--CREATE TABLE BKA;
----------------------------------------;
create table BKA
(
BKAk_1_ID number(4) NOT NULL,
KAT_ID number(4) NOT NULL,
BIE_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table BKA
add constraint PK_BKA
primary key (BKAk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BKA add constraint BKA
foreign key (KAT_ID)
references KATEGORIE (KATk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BKA add constraint BKA1
foreign key (BIE_ID)
references BIEG_EKSTREMALNY(BIEk_1_ID);





----------------------------------------;
--CREATE TABLE BPA;
----------------------------------------;
create table BPA
(
BPAk_1_ID number(4) NOT NULL,
PAK_ID number(4) NOT NULL,
BIE_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table BPA
add constraint PK_BPA
primary key (BPAk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BPA add constraint BPA
foreign key (PAK_ID)
references PAKIETY (PAKk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BPA add constraint BPA1
foreign key (BIE_ID)
references BIEG_EKSTREMALNY(BIEk_1_ID);







----------------------------------------;
--CREATE TABLE BDA;
---------------------------------------;
create table BDA
(
BDAk_1_ID number(4) NOT NULL,
DAT_ID number(4) NOT NULL,
BIE_ID number(4)
);

----------------------------------------;
--Primary Key;
----------------------------------------;

alter table BDA
add constraint PK_BDA
primary key (BDAk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BDA add constraint BDA
foreign key (DAT_ID)
references DATY (DATk_1_ID);

----------------------------------------;
--Foreign Key;
----------------------------------------;

alter table BDA add constraint BDA1
foreign key (BIE_ID)
references BIEG_EKSTREMALNY(BIEk_1_ID);