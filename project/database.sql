DROP DATABASE IF EXISTS MedRecords;
CREATE DATABASE IF NOT EXISTS MedRecords;
USE MedRecords;

DROP TABLE IF EXISTS PatientInfos;
DROP TABLE IF EXISTS CurrentMedicals;
DROP TABLE IF EXISTS Nurses;
DROP TABLE IF EXISTS LabTestsResults;
DROP TABLE IF EXISTS MedicalHistories;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS patientHistories;
DROP TABLE IF EXISTS runTests;
DROP TABLE IF EXISTS patientTests;
DROP TABLE IF EXISTS analyzeOrDiagnoses;

CREATE TABLE CurrentMedicals (
  currMedID       INT NOT NULL AUTO_INCREMENT,
  dateCreated       TIMESTAMP,
  dateUpdated       TIMESTAMP,
  medications       TEXT,
  allergies       TEXT,
  symptoms        TEXT,
  bloodPressure     VARCHAR(50),
  height          SMALLINT,
  weight          FLOAT(8,2),

  PRIMARY KEY (currMedID)
);

CREATE TABLE Nurses (
  nurseID         INT NOT NULL AUTO_INCREMENT,
  nurseName       VARCHAR(50),
  department        VARCHAR(50),

  PRIMARY KEY (nurseID)
);

CREATE TABLE PatientInfos (
  patientID       INT NOT NULL AUTO_INCREMENT,
  currMedID       INT NOT NULL,
  nurseID         INT NOT NULL,
  name          VARCHAR(50),
  birthDate       DATE,
  bloodType       VARCHAR(10),
  dateCreated       TIMESTAMP,
  dateUpdated       TIMESTAMP,
  emergencyContact    TEXT,

  PRIMARY KEY (patientID),
  FOREIGN KEY (currMedID) REFERENCES CurrentMedicals (currMedID)
    ON DELETE CASCADE,
  FOREIGN KEY (nurseID) REFERENCES Nurses (nurseID)
);


CREATE TABLE LabTestsResults (
  testID          INT NOT NULL AUTO_INCREMENT,
  dateAndTime       TIMESTAMP,
  testName        VARCHAR(50),
  testResults       TEXT,

  PRIMARY KEY (testID)
);

CREATE TABLE MedicalHistories (
  medHisID        INT NOT NULL AUTO_INCREMENT,
  dateAndTime       TIMESTAMP,
  medication        TEXT,
  diseaseOrCondition    TEXT,

  PRIMARY KEY (medHisID)
);

CREATE TABLE Doctors (
  doctorID        INT NOT NULL AUTO_INCREMENT,
  docName         VARCHAR(50),
  specialization      VARCHAR(50),
  department        VARCHAR(50),
  fee           DECIMAL(15,2),
  schedule        VARCHAR(50),

  PRIMARY KEY (doctorID)
);

CREATE TABLE patientHistories (
  patientHisID    INT NOT NULL AUTO_INCREMENT,
  patientID       INT,
  medHisID        INT,

  PRIMARY KEY (patientHisID),
  FOREIGN KEY (patientID) REFERENCES PatientInfos (patientID)
    ON DELETE CASCADE,
  FOREIGN KEY (medHisID)  REFERENCES MedicalHistories (medHisID)
);

CREATE TABLE runTests (
  runtestID       INT NOT NULL AUTO_INCREMENT,
  nurseID         INT,
  testID          INT,
  dateAndTime       TIMESTAMP,

  PRIMARY KEY (runtestID),
  FOREIGN KEY (nurseID) REFERENCES Nurses (nurseID),
  FOREIGN KEY (testID) REFERENCES LabTestsResults (testID)
   ON DELETE CASCADE
);

CREATE TABLE patientTests (
  patientTestID   INT NOT NULL AUTO_INCREMENT,
  patientID       INT,
  testID          INT,
  dateAndTime     TIMESTAMP,

  PRIMARY KEY (patientTestID),
  FOREIGN KEY (patientID) REFERENCES PatientInfos (patientID)
     ON DELETE CASCADE,
  FOREIGN KEY (testID) REFERENCES LabTestsResults (testID)
);

CREATE TABLE analyzeOrDiagnoses (
  adID            INT,
  doctorID        INT,
  medHisID        INT,

  PRIMARY KEY (adID),
  FOREIGN KEY (doctorID) REFERENCES Doctors (doctorID),
  FOREIGN KEY (medHisID) REFERENCES MedicalHistories (medHisID)
);

DELETE FROM PatientInfos;
DELETE FROM CurrentMedicals;
DELETE FROM Nurses;
DELETE FROM LabTestsResults;
DELETE FROM MedicalHistories;
DELETE FROM Doctors;
DELETE FROM patientHistories;
DELETE FROM runTests;
DELETE FROM patientTests;
DELETE FROM analyzeOrDiagnoses;

INSERT INTO CurrentMedicals VALUES
  (001, NULL, NULL, "medications", "allergies", "symptoms", "bloodpressure", 150, 132),
  (234, NULL, NULL, "medications", "allergies", "symptoms", "bloodpressure", 200, 83.6);

INSERT INTO Nurses VALUES
  (123, "Nurse Nadine Reyes", "Triage"),
  (456, "Nurse Allure Tanquintic", "Rad Tech");
  
INSERT INTO PatientInfos VALUES
  (123, 001, 123, "Danielle Reyes", "1998-05-08", "B+", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "Vilma Reyes - Mother - 09161234567"),
  (456, 234, 456, "Juan GDL", "1998-02-14", "AB", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "Javi GDL - Mother - 09161234567");

INSERT INTO LabTestsResults VALUES
  (010, CURRENT_TIMESTAMP, "Fecalysis", "With Diarrhea"),
  (555, CURRENT_TIMESTAMP, "Blood Chem", "Negative");

INSERT INTO MedicalHistories VALUES
  (12345, CURRENT_TIMESTAMP, "Medication", "Lung Cancer"),
  (00001, CURRENT_TIMESTAMP, "Medication", "Prostate Cancer");

INSERT INTO Doctors VALUES
  (9999, "Dra. Nadine Reyes", "General Surgery", "Surgery", 500, "MWF"),
  (7123, "Dr. Daniel Reyes", "Neurosurgery", "Surgery", 1000, "TTh");


INSERT INTO patientHistories VALUES
  (1, 123, 12345),
  (2, 456, 00001);

INSERT INTO runTests VALUES
  (1, 123, 010, CURRENT_TIMESTAMP),
  (2, 123, 555, CURRENT_TIMESTAMP);

INSERT INTO patientTests VALUES
  (1, 123, 010, CURRENT_TIMESTAMP),
  (2, 456, 555, CURRENT_TIMESTAMP);

INSERT INTO analyzeOrDiagnoses VALUES
  (1, 9999, 12345),
  (2, 7123, 00001);

SELECT * FROM PatientInfos;
SELECT * FROM CurrentMedicals;
SELECT * FROM Nurses;
SELECT * FROM LabTestsResults;
SELECT * FROM MedicalHistories;
SELECT * FROM Doctors;
SELECT * FROM patientHistories;
SELECT * FROM runTests;
SELECT * FROM patientTests;
SELECT * FROM analyzeOrDiagnoses;

-- #SELECT * FROM PatientInfo, CurrentMedical, patientCurrent WHERE PatientInfo.patientID = patientCurrent.patientID AND patientCurrent.currMedID = CurrentMedical.currMedID AND PatientInfo.name = "Danielle Reyes";
-- #patienct current removec
-- SELECT DISTINCT * FROM PatientInfo as PI, patientTest as PT, Nurse as N, runTest as RT
-- WHERE PI.patientID = PT.patientID AND RT.nurseID = N.nurseID AND RT.testID = PT.testID AND RT.dateAndTime = PT.dateAndTime AND PI.name = "Bridget Legaspi";
-- 
-- UPDATE PatientInfo SET name = "Daniellaaa Reyes" WHERE name = "Danielle Reyes";
-- SELECT * FROM PatientInfo;
-- 
-- UPDATE Doctor SET fee = 2000, schedule = "MThF" WHERE docName = "Dra. Nadine Reyes";
-- SELECT * FROM Doctor;
-- 
-- #UPDATE PatientInfo, CurrentMedical, patientCurrent SET weight = 88 WHERE PatientInfo.patientID = patientCurrent.patientID AND patientCurrent.currMedID = CurrentMedical.currMedID AND PatientInfo.name = "Bridget Legaspi";
-- #patient current removed
-- DELETE FROM PatientInfo WHERE name = "Daniellaaa Reyes";
-- SELECT * FROM PatientInfo;
-- SELECT * FROM getInfo;
-- SELECT * FROM patientTest;
-- SELECT * FROM patientHistory;
-- 
-- DELETE FROM LabTestsResults WHERE testName = "Fecalysis";
-- SELECT * FROM LabTestsResults;
-- 
-- DELETE FROM Nurse WHERE nurseName = "Nurse Allure Tanquintic";
-- SELECT * FROM Nurse;