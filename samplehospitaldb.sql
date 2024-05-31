
-- Name: Zeynep Şevval Şener 
CREATE SCHEMA SE2222_22070006019;
USE SE2222_22070006019;

CREATE TABLE Department (
    dept_ID INT PRIMARY KEY,
    head_of_dept VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Doctor (
    doc_ID INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    schedule VARCHAR(255),
    contact_info VARCHAR(100),
    dept_ID INT,
    FOREIGN KEY (dept_ID) REFERENCES Department(dept_ID)
);

CREATE TABLE Nurse (
    nurse_ID INT PRIMARY KEY,
	name VARCHAR(100),
    contact_info VARCHAR(100),
    shift VARCHAR(50),
    dept_ID INT,
    FOREIGN KEY (dept_ID) REFERENCES Department(dept_ID)
);

CREATE TABLE Administrative_Staff (
    staff_ID INT PRIMARY KEY,
    contact_info VARCHAR(100),
    role VARCHAR(100),
    field VARCHAR(100),
    dept_ID INT,
    FOREIGN KEY (dept_ID) REFERENCES Department(dept_ID)
);

CREATE TABLE Ward (
    ward_ID INT PRIMARY KEY,
    capacity INT,
    curr_occupancy INT,
    nurse_ID INT,
    staff_ID INT,
    FOREIGN KEY (nurse_ID) REFERENCES Nurse(nurse_ID),
    FOREIGN KEY (staff_ID) REFERENCES Administrative_Staff(staff_ID)
);

CREATE TABLE Patient (
    pat_ID INT PRIMARY KEY,
    name VARCHAR(100),
    contact_info VARCHAR(100),
    gender CHAR(1),
    insurance_info VARCHAR(100),
    ward_ID INT,
    FOREIGN KEY (ward_ID) REFERENCES Ward(ward_ID)
);

CREATE TABLE Medical_Record (
    rec_ID INT PRIMARY KEY,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    treatment VARCHAR(255),
    illness VARCHAR(255),
    pat_ID INT,
    FOREIGN KEY (pat_ID) REFERENCES Patient(pat_ID)
);

CREATE TABLE Appointment (
    app_ID INT PRIMARY KEY,
    date_time DATETIME,
    purpose VARCHAR(255),
    doc_ID INT,
    pat_ID INT,
    FOREIGN KEY (doc_ID) REFERENCES Doctor(doc_ID),
    FOREIGN KEY (pat_ID) REFERENCES Patient(pat_ID)
);

CREATE TABLE overseen (
    doc_ID INT,
    rec_ID INT,
    PRIMARY KEY (doc_ID, rec_ID),
    FOREIGN KEY (doc_ID) REFERENCES Doctor(doc_ID),
    FOREIGN KEY (rec_ID) REFERENCES Medical_Record(rec_ID)
);

CREATE TABLE manage_nrs (
    nurse_ID INT,
    ward_ID INT,
    PRIMARY KEY (nurse_ID, ward_ID),
    FOREIGN KEY (nurse_ID) REFERENCES Nurse(nurse_ID),
    FOREIGN KEY (ward_ID) REFERENCES Ward(ward_ID)
);


INSERT INTO Department (dept_ID, head_of_dept, location) VALUES
(1, 'Dr. Ross Geller', 'Building A'),
(2, 'Dr. Harvey Specter', 'Building B'),
(3, 'Dr. Michael Scofield', 'Building C');

INSERT INTO Doctor (doc_ID, name, specialization, schedule, contact_info, dept_ID) VALUES
(1, 'Dr. Meredith Grey', 'Cardiology', 'M-W-F 9-5', '123-456-7890', 1),
(2, 'Dr. Derek Shepherd', 'Neurology', 'T-Th 10-6', '123-456-7891', 2),
(3, 'Dr. Cristina Yang', 'Cardiology', 'M-W-F 9-5', '123-456-7892', 3),
(4, 'Dr. Alex Karev', 'Pediatrics', 'T-Th 10-6', '123-456-7893', 1),
(5, 'Dr. Miranda Bailey', 'General Surgery', 'M-W-F 9-5', '123-456-7894', 2);

INSERT INTO Nurse (nurse_ID, contact_info, name, shift, dept_ID) VALUES
(1, 'nurse1@example.com', 'Nurse Carol Hathaway', 'Day', 1),
(2, 'nurse2@example.com', 'Nurse Samantha Taggart', 'Night', 2),
(3, 'nurse3@example.com', 'Nurse Abby Lockhart', 'Day', 3),
(4, 'nurse4@example.com', 'Nurse Peter Petrelli', 'Night', 1),
(5, 'nurse5@example.com', 'Nurse Jackie Peyton', 'Day', 2);

INSERT INTO Administrative_Staff (staff_ID, contact_info, role, field, dept_ID) VALUES
(1, 'admin1@example.com', 'Manager', 'Operations', 1),
(2, 'admin2@example.com', 'Assistant', 'HR', 2),
(3, 'admin3@example.com', 'Coordinator', 'Finance', 3),
(4, 'admin4@example.com', 'Secretary', 'Administration', 1),
(5, 'admin5@example.com', 'Supervisor', 'Maintenance', 2);

INSERT INTO Ward (ward_ID, capacity, curr_occupancy, nurse_ID, staff_ID) VALUES
(1, 20, 15, 1, 1),
(2, 30, 25, 2, 2),
(3, 25, 20, 3, 3),
(4, 10, 8, 4, 4),
(5, 15, 12, 5, 5);

INSERT INTO Patient (pat_ID, name, contact_info, gender, insurance_info, ward_ID) VALUES
(1, 'Rachel Green', 'rachel@example.com', 'F', 'InsureCorp', 1),
(2, 'Monica Geller', 'monica@example.com', 'F', 'HealthPlus', 2),
(3, 'Phoebe Buffay', 'phoebe@example.com', 'F', 'MediCare', 3),
(4, 'Joey Tribbiani', 'joey@example.com', 'M', 'InsureCorp', 4),
(5, 'Chandler Bing', 'chandler@example.com', 'M', 'HealthPlus', 5),
(6, 'Michael Ross', 'michael@example.com', 'M', 'MediCare', 1),
(7, 'Harvey Specter', 'harvey@example.com', 'M', 'InsureCorp', 2),
(8, 'Mike Ross', 'mike@example.com', 'M', 'HealthPlus', 3);

INSERT INTO Medical_Record (rec_ID, diagnosis, prescription, treatment, illness, pat_ID) VALUES
(1, 'Flu', 'Med1', 'Rest', 'Flu', 1),
(2, 'Cough', 'Med2', 'Syrup', 'Cough', 2),
(3, 'Sprained Ankle', 'Med3', 'Rest', 'Injury', 3),
(4, 'Migraine', 'Med4', 'Painkillers', 'Headache', 4),
(5, 'Asthma', 'Med5', 'Inhaler', 'Respiratory', 5),
(6, 'Back Pain', 'Med6', 'Physiotherapy', 'Injury', 6),
(7, 'Diabetes', 'Med7', 'Insulin', 'Endocrine', 7),
(8, 'Hypertension', 'Med8', 'Antihypertensives', 'Cardiovascular', 8);
 
INSERT INTO Appointment (app_ID, date_time, purpose, doc_ID, pat_ID) VALUES
(1, '2024-05-01 10:00:00', 'Check-up', 1, 1),
(2, '2024-05-02 11:00:00', 'Consultation', 2, 2),
(3, '2024-05-03 09:00:00', 'Follow-up', 3, 3),
(4, '2024-05-04 14:00:00', 'Routine', 4, 4),
(5, '2024-05-05 13:00:00', 'Emergency', 5, 5),
(6, '2024-05-06 12:00:00', 'Check-up', 1, 6),
(7, '2024-05-07 15:00:00', 'Consultation', 2, 7),
(8, '2024-05-08 16:00:00', 'Follow-up', 3, 8);

INSERT INTO overseen (doc_ID, rec_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8);

INSERT INTO manage_nrs (nurse_ID, ward_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4);


/*   1.  
Explanation: This query joins the Patient, Appointment, and Doctor tables.
It groups the results by doctor name (DoctorName) and counts the number of 
appointments (NumAppointments) each doctor has with different patients. 
*/
SELECT d.name AS DoctorName, COUNT(a.app_ID) AS NumAppointments
FROM Patient p
JOIN Appointment a ON p.pat_ID = a.pat_ID
JOIN Doctor d ON a.doc_ID = d.doc_ID
GROUP BY d.name;

/*  2.
Explanation: This query calculates the remaining capacity for each ward and 
retrieve the total number of patients across all wards.
*/
SELECT w.ward_ID, w.capacity, w.curr_occupancy, (w.capacity - w.curr_occupancy) AS remaining_capacity,
    (SELECT SUM(curr_occupancy) FROM Ward) AS total_patients
FROM Ward w;

/*   3.
Explanation: The function GetAvgOccupancy is designed to calculate the average 
current occupancy of wards in a specific department. 
*/
DELIMITER //
CREATE FUNCTION GetAvgOccupancy(
    dept_id INT
) RETURNS float
deterministic
BEGIN
    DECLARE avg_occupancy FLOAT;
    SELECT AVG(w.curr_occupancy) INTO avg_occupancy
    FROM Ward w
    JOIN Nurse n ON w.nurse_ID = n.nurse_ID
    WHERE n.dept_ID = dept_id;
    RETURN avg_occupancy;
    END//
DELIMITER ;
-- select GetAvgOccupancy(1);

/*  4. 
Explanation: This trigger updates the current occupancy of a ward whenever a new patient is assigned to it.
*/
DELIMITER //

CREATE TRIGGER UpdateOccupancy
AFTER INSERT ON Patient
FOR EACH ROW
BEGIN
    UPDATE Ward
    SET curr_occupancy = curr_occupancy + 1
    WHERE ward_ID = NEW.ward_ID;
END //

DELIMITER ;

/*   5.
Explanation: The stored procedure UpdateNurseContactInfo is designed to update
 the contact information of a specific nurse based on their nurse ID. 
*/
DELIMITER //
CREATE PROCEDURE UpdateNurseContactInfo(
    new_nurse_id INT,
    new_contact VARCHAR(100)
)
BEGIN
    UPDATE Nurse
    SET contact_info = new_contact
    WHERE nurse_ID = new_nurse_id;
END//

DELIMITER ;
-- CALL UpdateNurseContactInfo(1, 'new_contact@example.com');




