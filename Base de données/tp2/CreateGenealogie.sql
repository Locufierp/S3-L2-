DROP TABLE Personne	CASCADE CONSTRAINTS;
DROP TABLE MereDe	CASCADE CONSTRAINTS;
DROP TABLE PereDe	CASCADE CONSTRAINTS;

-- ----------------------------------------------------------------------
-- TABLE : Personne
-- ----------------------------------------------------------------------
CREATE TABLE Personne ( 
	numPers			NUMBER(4)    	NOT NULL
	, nomPers		VARCHAR2(20)
	, prenomPers	VARCHAR2(20)
	, sexePers		VARCHAR2(1)	CHECK (sexePers IN ('F','M'))
	, CONSTRAINT PK_Personne PRIMARY KEY (numPers)  
);

-- ----------------------------------------------------------------------
-- TABLE : MereDe
-- ----------------------------------------------------------------------
CREATE TABLE MereDe ( 
	numPersEnfant	NUMBER(4)		NOT NULL
	, numPersMere	NUMBER(4)
	, CONSTRAINT PK_MereDe PRIMARY KEY (numPersEnfant)
) ;

-- ----------------------------------------------------------------------
-- TABLE : PereDe
-- ----------------------------------------------------------------------
CREATE TABLE PereDe ( 
	numPersEnfant	NUMBER(4)		NOT NULL
	, numPersPere	NUMBER(4)
	, CONSTRAINT PK_PereDe PRIMARY KEY (numPersEnfant)
) ;

-- ----------------------------------------------------------------------
-- CREATION DES REFERENCES DE TABLE
-- ----------------------------------------------------------------------
ALTER TABLE MereDe ADD (
	CONSTRAINT FK_MereDe_PersonneEnfant FOREIGN KEY (numPersEnfant)
		REFERENCES Personne (numPers)) ;

ALTER TABLE MereDe ADD (
	CONSTRAINT FK_MereDe_PersonneMere FOREIGN KEY (numPersMere)
		REFERENCES Personne (numPers)) ;

ALTER TABLE PereDe ADD (
	CONSTRAINT FK_PereDe_PersonneEnfant FOREIGN KEY (numPersEnfant)
		REFERENCES Personne (numPers)) ;

ALTER TABLE PereDe ADD (
	CONSTRAINT FK_PereDe_PersonnePere FOREIGN KEY (numPersPere)
		REFERENCES Personne (numPers)) ;
