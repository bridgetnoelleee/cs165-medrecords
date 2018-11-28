-- DBMS USED: MYSQL
-- Changes from Phase 2:
-- Changed datatype of EmergencyContact (from PatientInfo) to TEXT
-- Changed weight (from CurrentMedical) to FLOAT(8,2)
-- Changed timestamp attribute (from LabTestsResults table) to dateAndTime
-- Removed testName from LabTestsResults
-- Changed timestamp attribute (from MedicalHistory table) to dateAndTime
-- Changed datatype of medication to TEXT (MedicaHistory)
-- Changed disease/condition (from MedicalHistory) to diseaseOrCondition
-- Changed datatype of fee (from Doctor) to DECIMAL (15,2)
-- Changed primarykey of patientHistory to medHisID
-- runTest & patientTest: timestamp → dateAndTime attribute

DROP DATABASE IF EXISTS BridgetLegaspi;
CREATE DATABASE IF NOT EXISTS BridgetLegaspi;
USE BridgetLegaspi;

DROP TABLE IF EXISTS PatientInfo;
DROP TABLE IF EXISTS CurrentMedical;
DROP TABLE IF EXISTS Nurse;
DROP TABLE IF EXISTS LabTestsResults;
DROP TABLE IF EXISTS MedicalHistory;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS patientCurrent;
DROP TABLE IF EXISTS getInfo;
DROP TABLE IF EXISTS patientHistory;
DROP TABLE IF EXISTS runTest;
DROP TABLE IF EXISTS patientTest;
DROP TABLE IF EXISTS analyzeOrDiagnose;

CREATE TABLE PatientInfo (
	patientID				INT,
	name					VARCHAR(50),
	birthDate				DATE,
	bloodType				VARCHAR(10),
	dateCreated				TIMESTAMP,
	dateUpdated				TIMESTAMP,
	emergencyContact		TEXT,

	PRIMARY KEY (patientID)
);

CREATE TABLE CurrentMedical (
	currMedID				INT,
	dateCreated				TIMESTAMP,
	dateUpdated				TIMESTAMP,
	medications				TEXT,
	allergies				TEXT,
	symptoms				TEXT,
	bloodPressure			VARCHAR(50),
	height					SMALLINT,
	weight					FLOAT(8,2),

	PRIMARY KEY (currMedID)
);

CREATE TABLE Nurse (
	nurseID					INT,
	nurseName				VARCHAR(50),
	department				VARCHAR(50),

	PRIMARY KEY (nurseID)
);


CREATE TABLE LabTestsResults (
	testID					INT,
	dateAndTime				TIMESTAMP,
	testName				VARCHAR(50),
	testResults				TEXT,

	PRIMARY KEY (testID, dateAndTime)		  
);

CREATE TABLE MedicalHistory (
	medHisID				INT,
	dateAndTime				TIMESTAMP,
	medication 				TEXT,
	diseaseOrCondition		TEXT,

	PRIMARY KEY (medHisID)
);

CREATE TABLE Doctor (
	doctorID				INT,
	docName					VARCHAR(50),
	specialization			VARCHAR(50),
	department				VARCHAR(50),
	fee 					DECIMAL(15,2),
	schedule				VARCHAR(50),

	PRIMARY KEY (doctorID)
);

CREATE TABLE patientCurrent (
	patientID				INT,
	currMedID				INT,

	PRIMARY KEY (patientID, currMedID),
	FOREIGN KEY (patientID) REFERENCES PatientInfo (patientID)
		ON DELETE CASCADE,
	FOREIGN KEY (currMedID) REFERENCES CurrentMedical (currMedID)
);

CREATE TABLE getInfo (
	patientID				INT,
	nurseID					INT,

	PRIMARY KEY (patientID, nurseID),
	FOREIGN KEY (patientID) REFERENCES PatientInfo (patientID)
		ON DELETE CASCADE,
	FOREIGN KEY (nurseID) 	REFERENCES Nurse (nurseID)
);

CREATE TABLE patientHistory (
	patientID				INT,
	medHisID				INT,

	PRIMARY KEY (patientID, medHisID),
	FOREIGN KEY (patientID) REFERENCES PatientInfo (patientID)
		ON DELETE CASCADE,
	FOREIGN KEY (medHisID) 	REFERENCES MedicalHistory (medHisID)
);

CREATE TABLE runTest (
	nurseID					INT,
	testID					INT,
	dateAndTime				TIMESTAMP,

	PRIMARY KEY (nurseID, testID, dateAndTime),
	FOREIGN KEY (nurseID) REFERENCES Nurse (nurseID),
	FOREIGN KEY (testID, dateAndTime) REFERENCES LabTestsResults (testID, dateAndTime)
		ON DELETE CASCADE
);

CREATE TABLE patientTest (
	patientID				INT,
	testID					INT,
	dateAndTime				TIMESTAMP,

	PRIMARY KEY (patientID, testID, dateAndTime),
	FOREIGN KEY (patientID) REFERENCES PatientInfo (patientID)
		ON DELETE CASCADE,
	FOREIGN KEY (testID, dateAndTime) REFERENCES LabTestsResults (testID, dateAndTime)
);

CREATE TABLE analyzeOrDiagnose (
	doctorID				INT,
	medHisID				INT,

	PRIMARY KEY (doctorID, medHisID),
	FOREIGN KEY (doctorID) REFERENCES Doctor (doctorID),
	FOREIGN KEY (medHisID) REFERENCES MedicalHistory (medHisID)
);

DELETE FROM PatientInfo;
DELETE FROM CurrentMedical;
DELETE FROM Nurse;
DELETE FROM LabTestsResults;
DELETE FROM MedicalHistory;
DELETE FROM Doctor;
DELETE FROM patientCurrent;
DELETE FROM getInfo;
DELETE FROM patientHistory;
DELETE FROM runTest;
DELETE FROM patientTest;
DELETE FROM analyzeOrDiagnose;

INSERT INTO PatientInfo VALUES
	(123, "Danielle Reyes", "1998-05-08", "B+", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "Vilma Reyes - Mother - 09161234567"),
	(923, "Bridget Legaspi", "1998-04-14", "A+", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "Ferddie Legaspi - Father - 09178360893");

INSERT INTO CurrentMedical VALUES
	(000, NULL, NULL, "medications", "allergies", "symptoms", "bloodpressure", 150, 132),
	(234, NULL, NULL, "medications", "allergies", "symptoms", "bloodpressure", 200, 83.6);

INSERT INTO Nurse VALUES 
	(123, "Nurse Nadine Reyes", "Triage"),
	(456, "Nurse Allure Tanquintic", "Rad Tech");

INSERT INTO LabTestsResults VALUES
	(010, CURRENT_TIMESTAMP, "Fecalysis", "With Diarrhea"),
	(555, CURRENT_TIMESTAMP, "Blood Chem", "Negative");

INSERT INTO MedicalHistory VALUES
	(12345, CURRENT_TIMESTAMP, "Medication", "Lung Cancer"),
	(00001, CURRENT_TIMESTAMP, "Medication", "Prostate Cancer");

INSERT INTO Doctor VALUES
	(9999, "Dra. Nadine Reyes", "General Surgery", "Surgery", 500, "MWF"),
	(7123, "Dr. Daniel Reyes", "Neurosurgery", "Surgery", 1000, "TTh");

INSERT INTO patientCurrent VALUES
	(123, 000),
	(923, 234);

INSERT INTO getInfo VALUES
	(123, 123),
	(923, 123);
	
INSERT INTO patientHistory VALUES
	(123, 12345),
	(923, 00001);

INSERT INTO runTest VALUES
	(123, 010, CURRENT_TIMESTAMP),
	(123, 555, CURRENT_TIMESTAMP);

INSERT INTO patientTest VALUES
	(123, 010, CURRENT_TIMESTAMP),
	(923, 555, CURRENT_TIMESTAMP);

INSERT INTO analyzeOrDiagnose VALUES
	(9999, 12345),
	(7123, 00001);

SELECT * FROM PatientInfo;
SELECT * FROM CurrentMedical;
SELECT * FROM Nurse;
SELECT * FROM LabTestsResults;
SELECT * FROM MedicalHistory;
SELECT * FROM Doctor;
SELECT * FROM patientCurrent;
SELECT * FROM getInfo;
SELECT * FROM patientHistory;
SELECT * FROM runTest;
SELECT * FROM patientTest;
SELECT * FROM analyzeOrDiagnose;

SELECT * FROM PatientInfo, CurrentMedical, patientCurrent WHERE PatientInfo.patientID = patientCurrent.patientID AND patientCurrent.currMedID = CurrentMedical.currMedID AND PatientInfo.name = "Danielle Reyes";

SELECT DISTINCT * FROM PatientInfo as PI, patientTest as PT, Nurse as N, runTest as RT
	WHERE PI.patientID = PT.patientID AND RT.nurseID = N.nurseID AND RT.testID = PT.testID AND RT.dateAndTime = PT.dateAndTime AND PI.name = "Bridget Legaspi";

UPDATE PatientInfo SET name = "Daniellaaa Reyes" WHERE name = "Danielle Reyes";
SELECT * FROM PatientInfo;

UPDATE Doctor SET fee = 2000, schedule = "MThF" WHERE docName = "Dra. Nadine Reyes";
SELECT * FROM Doctor;

UPDATE PatientInfo, CurrentMedical, patientCurrent SET weight = 88 WHERE PatientInfo.patientID = patientCurrent.patientID AND patientCurrent.currMedID = CurrentMedical.currMedID AND PatientInfo.name = "Bridget Legaspi";

DELETE FROM PatientInfo WHERE name = "Daniellaaa Reyes";
SELECT * FROM PatientInfo;
SELECT * FROM getInfo;
SELECT * FROM patientTest;
SELECT * FROM patientHistory;
SELECT * FROM patientCurrent;

DELETE FROM LabTestsResults WHERE testName = "Fecalysis";
SELECT * FROM LabTestsResults;

DELETE FROM Nurse WHERE nurseName = "Nurse Allure Tanquintic";
SELECT * FROM Nurse;
