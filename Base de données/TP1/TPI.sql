INSERT INTO Client VALUES(1, 'Pierre',  'Leloup', to_date('22/12/2000','DD/MM/YYYY'));
INSERT INTO Client VALUES(2, 'Paul',    'Durand', to_date('12/01/1998','DD/MM/YYYY'));
INSERT INTO Client VALUES(3, 'Louis',   'Dupont', to_date('15/03/2001','DD/MM/YYYY'));
INSERT INTO Client VALUES(4, 'Jacques', 'Martin', to_date('28/09/2001','DD/MM/YYYY'));
INSERT INTO Client VALUES(5, 'Pierre',  'Perrin', to_date('11/06/2000','DD/MM/YYYY'));
-- INSERT INTO Client VALUES(6, 'Aurélia',  'Dubois', to_date('13/01/2011','DD/MM/YYYY'));

INSERT INTO Region VALUES(1, 'Europe');
INSERT INTO Region VALUES(2, 'USA');

INSERT INTO Action VALUES(1, 'Alcatel',          5.1,  1);
INSERT INTO Action VALUES(2, 'Snecma',           19.3, 1);
INSERT INTO Action VALUES(3, 'General Electric', 95.6, 2);
INSERT INTO Action VALUES(4, 'BNP',              11.8, 1);
INSERT INTO Action VALUES(5, 'IBM',              21.3, 2);

INSERT INTO FCP 
	VALUES (1, 'MAXITUNE'	, to_date('15/01/2000','DD/MM/YYYY')
							, to_date('14/01/2016','DD/MM/YYYY'));
INSERT INTO FCP 
	VALUES (2, 'PEPERE'		, to_date('28/03/1999','DD/MM/YYYY')
							, to_date('27/03/2015','DD/MM/YYYY'));
INSERT INTO FCP 
	VALUES(3, 'DYNAMIQUE'	, to_date('01/04/2001','DD/MM/YYYY')
							, to_date('31/03/2015','DD/MM/YYYY'));

INSERT INTO PossedeAction VALUES(1, 1, 100,   10.1);
INSERT INTO PossedeAction VALUES(1, 2, 1000,  5.6);
INSERT INTO PossedeAction VALUES(1, 3, 220,   20.5);
INSERT INTO PossedeAction VALUES(2, 1, 134,   20);
INSERT INTO PossedeAction VALUES(2, 5, 213,   15.3);
INSERT INTO PossedeAction VALUES(3, 1, 24434, 18);
INSERT INTO PossedeAction VALUES(3, 2, 112,   13.6);
INSERT INTO PossedeAction VALUES(3, 4, 6000,  6.1);
INSERT INTO PossedeAction VALUES(4, 3, 1000,  80.6);
INSERT INTO PossedeAction VALUES(5, 3, 123,   75.1);
INSERT INTO PossedeAction VALUES(5, 5, 500,   14.9);
-- INSERT INTO PossedeAction VALUES(6, 2, 100000,   10.3);

INSERT INTO ComposeDe VALUES (1, 1, 10, 12.7);
INSERT INTO ComposeDe VALUES (1, 2, 15, 5.2);
INSERT INTO ComposeDe VALUES (1, 4, 12, 18.4);
INSERT INTO ComposeDe VALUES (2, 1, 3,  22.1);
INSERT INTO ComposeDe VALUES (2, 2, 5,  21);
INSERT INTO ComposeDe VALUES (2, 3, 1,  10);
INSERT INTO ComposeDe VALUES (2, 4, 20, 12.4);
INSERT INTO ComposeDe VALUES (3, 3, 12, 68.1);
INSERT INTO ComposeDe VALUES (3, 5, 5,  15.3);

INSERT INTO PossedeFCP VALUES(1, 1, 50);
INSERT INTO PossedeFCP VALUES(1, 2, 75);
INSERT INTO PossedeFCP VALUES(2, 1, 50);
INSERT INTO PossedeFCP VALUES(4, 3, 100);

SELECT * FROM Client;

SELECT * FROM Region;

SELECT * FROM Action;

SELECT * FROM FCP;

SELECT * FROM PossedeAction;

SELECT * FROM ComposeDe;

SELECT * FROM PossedeFCP;

"""
Ecrire les requêtes SQL Oracle répondant aux questions suivantes :
1.
Liste des clients (nom et prenom) classés par ordre alphabétique.
2.
Liste des actions (code, nom et valeur courante).
3.
Action la plus chère, la moins chère.
4.
Liste des actions possédées par Pierre Leloup.
5.
Gain (ou perte) total potentiel sur les actions de Pierre Leloup (valeur courante - prix achat).
6.
Gain (ou perte) potentiel par FCP.
7.
FCP le plus performant, le moins performant.
8.
Performance moyenne des FCP.
9.
Gain (ou perte) total potentiel de Pierre Leloup (actions + FCP).
10. Client possédant le plus gros gain potentiel absolu (valeur).
11. Client possédant le plus gros gain potentiel relatif (par rapport à la somme engagée).
12. Client ayant le meilleur rendement annuel (vis-à-vis de la date d’ouverture de compte).
13. Liste des FCP commencés en 2000.
14. Code et nom du FCP qui se termine le premier.
15. FCP elligible au PEA (comportant uniquement des actions de la région “Europe”).
16. Clients dont toutes valeurs sont elligibles au PEA.
"""

//Q1
SELECT nomCli,prenomCli FROM client ORDER BY nomcli ASC;
//Q2
SELECT codeAct, nomAct,valeurCourante FROM action;
//Q3
SELECT * FROM action WHERE valeurCourante = (SELECT MIN(valeurCourante) FROM action)
OR valeurCourante = (SELECT MAX(valeurCourante) FROM action);
//Q4
SELECT codeAct,nomAct,valeurCourante,codeRegion FROM action
NATURAL JOIN possedeaction 
NATURAL JOIN client
WHERE prenomCli = 'Pierre'
AND nomCli = 'Leloup';
//Q5
SELECT SUM((valeurCourante - prixAchat)*quantite) as "Gain total potentiel" FROM action
NATURAL JOIN possedeaction 
NATURAL JOIN client
WHERE prenomCli = 'Pierre'
AND nomCli = 'Leloup';
//Q6

SELECT codeFCP,SUM((valeurCourante - prixAchat)*quantite) as "Gain potentiel par FCP" FROM ComposeDe
NATURAL JOIN action
GROUP BY codeFCP;
//Q7

SELECT  codeFCP as "FCP le plus performant",SUM((valeurCourante - prixAchat)*quantite) as "Gain" FROM ComposeDe
NATURAL JOIN action
GROUP BY codeFCP
HAVING SUM((valeurCourante - prixAchat)*quantite)=(SELECT MAX(SUM((valeurCourante - prixAchat)*quantite)) FROM ComposeDe
NATURAL JOIN action
GROUP BY codeFCP);

SELECT  codeFCP as "FCP le moins performant",SUM((valeurCourante - prixAchat)*quantite) as "Gain" FROM ComposeDe
NATURAL JOIN action
GROUP BY codeFCP
HAVING SUM((valeurCourante - prixAchat)*quantite)=(SELECT MIN(SUM((valeurCourante - prixAchat)*quantite)) FROM ComposeDe
NATURAL JOIN action
GROUP BY codeFCP);

//Q8
SELECT ROUND(AVG(SUM((valeurCourante - prixAchat)*quantite)),2) as "Perf moyenne des FCP" FROM ComposeDe
NATURAL JOIN action
GROUP BY codeFCP;

//Q9

SELECT SUM("Gain") FROM ((SELECT SUM((valeurCourante - prixAchat)*quantite) as "Gain" FROM action
JOIN possedeaction ON action.codeact=possedeaction.codeact
JOIN client ON possedeaction.numcli = client.numcli
WHERE prenomCli = 'Pierre'
AND nomCli = 'Leloup') 
UNION 
(SELECT SUM((valeurCourante - prixAchat)*quantite*quantiteFCP) as "Gain" FROM Action
JOIN Composede ON composede.codeact = action.codeact
JOIN FCP ON fcp.codefcp = composede.codefcp
JOIN possedefcp ON possedefcp.codeFCP = fcp.codeFCP
JOIN client ON possedefcp.numcli = client.numcli
WHERE prenomCli = 'Pierre'
AND nomCli = 'Leloup'));

//Q10
SELECT * FROM(
SELECT numcli,prenomcli,nomCli,dateouverturecompte,(SUM((valeurCourante)*quantite)) as bop FROM ((SELECT numcli,prenomcli,nomCli,dateouverturecompte,valeurCourante,prixAchat,quantite FROM action
JOIN possedeaction ON action.codeact=possedeaction.codeact
JOIN client ON possedeaction.numcli = client.numcli) 
UNION 
(SELECT numcli,prenomcli,nomCli,dateouverturecompte,valeurCourante, prixAchat,quantite+quantiteFCP as quantite FROM Action
JOIN Composede ON composede.codeact = action.codeact
JOIN FCP ON fcp.codefcp = composede.codefcp
JOIN possedefcp ON possedefcp.codeFCP = fcp.codeFCP
JOIN client ON possedefcp.numcli = client.numcli))
GROUP BY (numcli,prenomcli,nomCli,dateouverturecompte)
ORDER BY bop DESC)
WHERE rownum <2;


//Q11
SELECT * FROM(
SELECT numcli,prenomcli,nomCli,dateouverturecompte,(SUM((valeurCourante-prixAchat)*quantite)) as bop FROM ((SELECT numcli,prenomcli,nomCli,dateouverturecompte,valeurCourante,prixAchat,quantite FROM action
JOIN possedeaction ON action.codeact=possedeaction.codeact
JOIN client ON possedeaction.numcli = client.numcli) 
UNION 
(SELECT numcli,prenomcli,nomCli,dateouverturecompte,valeurCourante, prixAchat,quantite+quantiteFCP as quantite FROM Action
JOIN Composede ON composede.codeact = action.codeact
JOIN FCP ON fcp.codefcp = composede.codefcp
JOIN possedefcp ON possedefcp.codeFCP = fcp.codeFCP
JOIN client ON possedefcp.numcli = client.numcli))
GROUP BY (numcli,prenomcli,nomCli,dateouverturecompte)
ORDER BY bop DESC)
WHERE rownum <2;

//Q12

SELECT * FROM(
SELECT numcli,prenomcli,nomCli,dateouverturecompte,(SUM((valeurCourante-prixAchat)*quantite))/MONTHS_BETWEEN(dateOuvertureCompte,CURRENT_DATE) as bop FROM ((SELECT numcli,prenomcli,nomCli,dateouverturecompte,valeurCourante,prixAchat,quantite FROM action
JOIN possedeaction ON action.codeact=possedeaction.codeact
JOIN client ON possedeaction.numcli = client.numcli) 
UNION 
(SELECT numcli,prenomcli,nomCli,dateouverturecompte,valeurCourante, prixAchat,quantite+quantiteFCP as quantite FROM Action
JOIN Composede ON composede.codeact = action.codeact
JOIN FCP ON fcp.codefcp = composede.codefcp
JOIN possedefcp ON possedefcp.codeFCP = fcp.codeFCP
JOIN client ON possedefcp.numcli = client.numcli))
GROUP BY (numcli,prenomcli,nomCli,dateouverturecompte)
ORDER BY bop DESC)
WHERE rownum <2;

//Q13

SELECT * FROM FCP WHERE EXTRACT(YEAR FROM dateDebut) = '2000';

//Q14

SELECT * FROM (SELECT codefcp,nomfcp FROM FCP ORDER BY datefin) 
WHERE rownum = 1;

//Q15

(SELECT distinct codefcp,nomfcp,datedebut,datefin FROM FCP NATURAL JOIN ComposeDe
NATURAL JOIN action NATURAL JOIN region)
MINUS
(SELECT distinct codefcp,nomfcp,datedebut,datefin FROM FCP NATURAL JOIN ComposeDe
NATURAL JOIN action NATURAL JOIN region
WHERE nomregion != 'Europe')
;
//Q16

(SELECT distinct numcli,prenomcli,nomcli,dateouverturecompte FROM client NATURAL JOIN possedeaction NATURAL JOIN action NATURAL JOIN region)
MINUS
(SELECT distinct numcli,prenomcli,nomcli,dateouverturecompte FROM client NATURAL JOIN possedeaction NATURAL JOIN action NATURAL JOIN region
WHERE nomregion != 'Europe');
