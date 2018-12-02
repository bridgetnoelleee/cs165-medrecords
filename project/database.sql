DROP DATABASE IF EXISTS MedRecords;
CREATE DATABASE IF NOT EXISTS MedRecords;
USE MedRecords;

DROP TABLE IF EXISTS PatientInfo;
DROP TABLE IF EXISTS CurrentMedical;
DROP TABLE IF EXISTS Nurse;
DROP TABLE IF EXISTS LabTestsResults;
DROP TABLE IF EXISTS MedicalHistory;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS getInfo;
DROP TABLE IF EXISTS patientHistory;
DROP TABLE IF EXISTS runTest;
DROP TABLE IF EXISTS patientTest;
DROP TABLE IF EXISTS analyzeOrDiagnose;

CREATE TABLE CurrentMedical (
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

CREATE TABLE Nurse (
  nurseID         INT NOT NULL AUTO_INCREMENT,
  nurseName       VARCHAR(50),
  department        VARCHAR(50),

  PRIMARY KEY (nurseID)
);

CREATE TABLE PatientInfo (
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
  FOREIGN KEY (currMedID) REFERENCES CurrentMedical (currMedID)
    ON DELETE CASCADE,
  FOREIGN KEY (nurseID) REFERENCES Nurse (nurseID)
);


CREATE TABLE LabTestsResults (
  testID          INT NOT NULL AUTO_INCREMENT,
  dateAndTime       TIMESTAMP,
  testName        VARCHAR(50),
  testResults       TEXT,

  PRIMARY KEY (testID)
);

CREATE TABLE MedicalHistory (
  medHisID        INT NOT NULL AUTO_INCREMENT,
  dateAndTime       TIMESTAMP,
  medication        TEXT,
  diseaseOrCondition    TEXT,

  PRIMARY KEY (medHisID)
);

CREATE TABLE Doctor (
  doctorID        INT NOT NULL AUTO_INCREMENT,
  docName         VARCHAR(50),
  specialization      VARCHAR(50),
  department        VARCHAR(50),
  fee           DECIMAL(15,2),
  schedule        VARCHAR(50),

  PRIMARY KEY (doctorID)
);

CREATE TABLE patientHistory (
  patientHisID    INT NOT NULL AUTO_INCREMENT,
  patientID       INT,
  medHisID        INT,

  PRIMARY KEY (patientHisID),
  FOREIGN KEY (patientID) REFERENCES PatientInfo (patientID)
    ON DELETE CASCADE,
  FOREIGN KEY (medHisID)  REFERENCES MedicalHistory (medHisID)
);

CREATE TABLE runTest (
  runtestID       INT NOT NULL AUTO_INCREMENT,
  nurseID         INT,
  testID          INT,
  dateAndTime       TIMESTAMP,

  PRIMARY KEY (runtestID),
  FOREIGN KEY (nurseID) REFERENCES Nurse (nurseID),
  FOREIGN KEY (testID) REFERENCES LabTestsResults (testID)
   ON DELETE CASCADE
);

CREATE TABLE patientTest (
  patientTestID   INT NOT NULL AUTO_INCREMENT,
  patientID       INT,
  testID          INT,

  PRIMARY KEY (patientTestID),
  FOREIGN KEY (patientID) REFERENCES PatientInfo (patientID)
     ON DELETE CASCADE,
  FOREIGN KEY (testID) REFERENCES LabTestsResults (testID)
);

CREATE TABLE analyzeOrDiagnose (
  adID            INT,
  doctorID        INT,
  medHisID        INT,

  PRIMARY KEY (adID),
  FOREIGN KEY (doctorID) REFERENCES Doctor (doctorID),
  FOREIGN KEY (medHisID) REFERENCES MedicalHistory (medHisID)
);

DELETE FROM PatientInfo;
DELETE FROM CurrentMedical;
DELETE FROM Nurse;
DELETE FROM LabTestsResults;
DELETE FROM MedicalHistory;
DELETE FROM Doctor;
DELETE FROM patientHistory;
DELETE FROM runTest;
DELETE FROM patientTest;
DELETE FROM analyzeOrDiagnose;

INSERT INTO CurrentMedical VALUES
  (001, NULL, NULL, "medications", "allergies", "symptoms", "bloodpressure", 150, 132),
  (234, NULL, NULL, "medications", "allergies", "symptoms", "bloodpressure", 200, 83.6);

INSERT INTO Nurse VALUES
  (123, "Nurse Nadine Reyes", "Triage"),
  (456, "Nurse Allure Tanquintic", "Rad Tech");
  
INSERT INTO PatientInfo VALUES
  (123, 001, 123, "Danielle Reyes", "1998-05-08", "B+", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "Vilma Reyes - Mother - 09161234567"),
  (456, 234, 456, "Juan GDL", "1998-02-14", "AB", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, "Javi GDL - Mother - 09161234567");

INSERT INTO LabTestsResults VALUES
  (010, CURRENT_TIMESTAMP, "Fecalysis", "With Diarrhea"),
  (555, CURRENT_TIMESTAMP, "Blood Chem", "Negative");

INSERT INTO MedicalHistory VALUES
  (12345, CURRENT_TIMESTAMP, "Medication", "Lung Cancer"),
  (00001, CURRENT_TIMESTAMP, "Medication", "Prostate Cancer");

INSERT INTO Doctor VALUES
  (9999, "Dra. Nadine Reyes", "General Surgery", "Surgery", 500, "MWF"),
  (7123, "Dr. Daniel Reyes", "Neurosurgery", "Surgery", 1000, "TTh");


INSERT INTO patientHistory VALUES
  (1, 123, 12345),
  (2, 456, 00001);

INSERT INTO runTest VALUES
  (1, 123, 010, CURRENT_TIMESTAMP),
  (2, 123, 555, CURRENT_TIMESTAMP);

INSERT INTO patientTest VALUES
  (1, 123, 010),
  (2, 456, 555);

INSERT INTO analyzeOrDiagnose VALUES
  (1, 9999, 12345),
  (2, 7123, 00001);

SELECT * FROM PatientInfo;
SELECT * FROM CurrentMedical;
SELECT * FROM Nurse;
SELECT * FROM LabTestsResults;
SELECT * FROM MedicalHistory;
SELECT * FROM Doctor;
SELECT * FROM patientHistory;
SELECT * FROM runTest;
SELECT * FROM patientTest;
SELECT * FROM analyzeOrDiagnose;

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