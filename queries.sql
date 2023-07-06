USE project;

-- DROP TABLE unread_notification;
-- DROP TABLE treatment;
-- DROP TABLE stay;
-- DROP TABLE room;
-- DROP TABLE test;
-- DROP TABLE tests_available;
-- DROP TABLE prescribes;
-- DROP TABLE medication;
-- DROP TABLE appointment;
-- DROP TABLE patient;
-- DROP TABLE doctor;
-- DROP TABLE department;



CREATE TABLE medication(
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  brand VARCHAR(50)
);
INSERT INTO medication(id,name,brand)
 VALUES (1,'lisinopril','Zestril');
 INSERT INTO medication(id,name,brand)
 VALUES (2,'levothyroxine','Synthroid');
 INSERT INTO medication(id,name,brand)
 VALUES (3,'atorvastatin','Lipitor');
 INSERT INTO medication(id,name,brand)
 VALUES (4,'metformin','Glucophage');
 INSERT INTO medication(id,name,brand)
 VALUES (5,'simvastatin','Zocor');
 INSERT INTO medication(id,name,brand)
 VALUES (6,'omeprazole','Prilosec');
 INSERT INTO medication(id,name,brand)
 VALUES (7,'amlodipine','amlodipine');

CREATE TABLE tests_available(
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);
INSERT INTO tests_available(id,name)
 VALUES (1,'blood count');
 INSERT INTO tests_available(id,name)
 VALUES (2,'blood typing');
 INSERT INTO tests_available(id,name)
 VALUES (3,'bone marrow aspiration');
 INSERT INTO tests_available(id,name)
 VALUES (4,'gastric fluid analysis');
 INSERT INTO tests_available(id,name)
 VALUES (5,'kidney function test');
 INSERT INTO tests_available(id,name)
 VALUES (6,'malabsorption test');
 INSERT INTO tests_available(id,name)
 VALUES (7,'pregnancy test');
 INSERT INTO tests_available(id,name)
 VALUES (8,'thyroid function test');
 INSERT INTO tests_available(id,name)
 VALUES (9,'brain scanning');
 INSERT INTO tests_available(id,name)
 VALUES (10,'electroencephalography');

CREATE TABLE treatments_available(
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50)NOT NULL,
  cost INT NOT NULL
);
INSERT INTO treatments_available(id,name,cost)
 VALUES (1,'Cardiac Surgery',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (2,'Dialysis',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (3,'Infusion Therapy',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (4,'Massage Therapy',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (5,'Mohs Surgery',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (6,'Neurosurgery',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (7,'Orthopedic Surgery',1000);
 INSERT INTO treatments_available(id,name,cost)
 VALUES (8,'Plastic & Reconstructive Surgery',1000);


CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
) AUTO_INCREMENT=1;
INSERT INTO department(name)
 VALUES ('orthopaedic');
INSERT INTO department(name)
VALUES ('cardiologist');
INSERT INTO department(name)
VALUES ('gynacologist');
INSERT INTO department(name)
VALUES ('Dental');

CREATE TABLE doctor (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  department INT,
  password VARCHAR(50),
  phone_number VARCHAR(10),
  email_id VARCHAR(50),
  FOREIGN KEY (department) REFERENCES department(id)
)AUTO_INCREMENT=1000;

INSERT INTO doctor(name,department)
VALUES ('Vikram',1);
INSERT INTO doctor(name,department)
VALUES ('Tarun',2);
INSERT INTO doctor(name,department)
VALUES ('Kamal',3);
INSERT INTO doctor(name,department)
VALUES ('Ram',4);


  CREATE TABLE patient (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  address VARCHAR(50) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  phone_number VARCHAR(10),
  insurance_id VARCHAR(15)
) AUTO_INCREMENT = 1;
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('Swathi',20,'kadapa','female','9849568217','AI1234567890');
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('Tarun',21,'kadapa','male','7993313610','AI1234567890');
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('Virat',18,'kadapa','male','7993313610','AI1234567890');
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('Dhoni',19,'kadapa','male','7993313610','AI1234567890');

CREATE TABLE appointment (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT ,
  date DATETIME NOT NULL,
  emergency INT NOT NULL,
  time_slot VARCHAR(50),
  symptoms VARCHAR(255),
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id)
)AUTO_INCREMENT=1;
INSERT INTO appointment(patient_id,doctor_id,date,emergency,symptoms)
VALUES (1,1000,'2023-02-01 02:01:01',1,'light fever, cough');
INSERT INTO appointment(patient_id,doctor_id,date,emergency,symptoms)
VALUES (2,1000,'2023-02-01 02:05:01',0,'light fever, high cough');
INSERT INTO appointment(patient_id,doctor_id,date,emergency,symptoms)
VALUES (3,1001,'2023-02-01 02:01:01',1,' fever, cough');
INSERT INTO appointment(patient_id,doctor_id,date,emergency,symptoms)
VALUES (4,1001,'2023-02-01 02:05:01',0,'high fever, cough');

CREATE TABLE unread_notification(
  id INT PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES appointment(id)
);


CREATE TABLE prescribes (
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  date_prescribed DATETIME NOT NULL,
  dose VARCHAR(50),
  appointment_id INT,
  medication_id INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id),
  FOREIGN KEY (appointment_id) REFERENCES appointment(id),
  FOREIGN KEY (medication_id) REFERENCES medication(id),
  PRIMARY KEY (patient_id, doctor_id,medication_id, date_prescribed)
);

CREATE TABLE test (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  date DATETIME ,
  result VARCHAR(50),
  time_slot VARCHAR(50),
  test_report LONGBLOB,
  FOREIGN KEY (patient_id) REFERENCES patient(id)
)AUTO_INCREMENT=1;

CREATE TABLE room (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  count INT NOT NULL
);
INSERT INTO room(id,count) 	VALUES ('W304',2 );
INSERT INTO room(id,count) 	VALUES ('W105',2 );
INSERT INTO room(id,count) 	VALUES ('C124',3 );

CREATE TABLE stay (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  room_id VARCHAR(50),
  start_date DATETIME NOT NULL,
  end_date DATETIME,
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE treatment (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT,
  name VARCHAR(50) NOT NULL,
  date DATETIME ,
  time_slot VARCHAR(50),
  cost VARCHAR(50),
  stay_id INT,
  description VARCHAR(255),
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id),
  FOREIGN KEY (stay_id) REFERENCES stay(id)
)AUTO_INCREMENT=1;
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (1,1000,'braces','2023-03-26 12:12:12','2-4',40000);
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (2,1000,'braces2','2023-01-26 12:13:12','4-5',40000);
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (3,1000,'braces3','2023-01-26 11:12:12','5-6',40000);
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (4,1000,'braces4','2023-01-26 23:12:12','2-4',40000);



