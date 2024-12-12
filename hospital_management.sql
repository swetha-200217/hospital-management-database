-- Create the hospital database
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;

-- Create Patients Table
CREATE TABLE IF NOT EXISTS patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    address TEXT,
    date_of_admission DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Doctors Table
CREATE TABLE IF NOT EXISTS doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    date_of_joining DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Appointments Table
CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Create Medical Records Table
CREATE TABLE IF NOT EXISTS medical_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    record_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    diagnosis TEXT,
    treatment TEXT,
    prescriptions TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Optionally, insert sample data

-- Insert sample patients
INSERT INTO patients (first_name, last_name, date_of_birth, gender, contact_number, email, address)
VALUES 
('John', 'Doe', '1980-05-15', 'Male', '1234567890', 'john.doe@example.com', '123 Main St, Anytown'),
('Jane', 'Smith', '1992-08-25', 'Female', '0987654321', 'jane.smith@example.com', '456 Oak Rd, Anytown');

-- Insert sample doctors
INSERT INTO doctors (first_name, last_name, specialty, contact_number, email)
VALUES 
('Dr. Emily', 'Taylor', 'Cardiologist', '555-1234', 'dr.emily.taylor@example.com'),
('Dr. James', 'Johnson', 'Orthopedic', '555-5678', 'dr.james.johnson@example.com');

-- Insert sample appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status)
VALUES 
(1, 1, '2024-12-15 10:00:00', 'Scheduled'),
(2, 2, '2024-12-16 14:00:00', 'Scheduled');

-- Insert sample medical records
INSERT INTO medical_records (patient_id, doctor_id, diagnosis, treatment, prescriptions)
VALUES 
(1, 1, 'High Blood Pressure', 'Lifestyle change, medication prescribed', 'Lisinopril 10mg'),
(2, 2, 'Fractured leg', 'Casting, rest', 'Painkillers');
