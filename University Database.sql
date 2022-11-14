CREATE SCHEMA team19; 
CREATE DATABASE foruniversity;
USE foruniversity; 

CREATE TABLE Stcourse_idcourse_namefaculty_idudents (
  S_id int PRIMARY KEY,
  faculty_id int,
  firstname varchar(40) NOT NULL,
  lastname varchar(40) NOT NULL,
  e_mail varchar(40) NOT NULL,
  address varchar(255) NOT NULL,
  birthday date NOT NULL,
  gender varchar(9) NOT NULL,
  II_address varchar(255),
  flat int,
  check (gender in ('Male', 'Female', 'Other'))
);

CREATE TABLE faculty (
  faculty_id int PRIMARY KEY,
  faculty_name varchar(40)
);

CREATE TABLE Lecturers (
  L_id int PRIMARY KEY,
  faculty_id int,
  firstname varchar(40) NOT NULL,
  lastname varchar(40) NOT NULL,
  e_mail varchar(40) NOT NULL,
  address varchar(255) NOT NULL,
  birthday date NOT NULL,
  gender varchar(9) NOT NULL,
  II_address varchar(255),
  flat_N int,
  bank_acc varchar(40) NOT NULL,
  rang varchar(40) NOT NULL,
  check (gender in ('Male', 'Female', 'Other'))
);

CREATE TABLE Managers (
  M_id int PRIMARY KEY,
  department int,
  firstname varchar(40) NOT NULL,
  lastname varchar(40) NOT NULL,
  e_mail varchar(40) NOT NULL,
  address varchar(255) NOT NULL,
  birthday date NOT NULL,
  gender varchar(9) NOT NULL,
  II_address varchar(255),
  flat_N int,
  check (gender in ('Male', 'Female', 'Other'))
);

CREATE TABLE Courses (
  course_id int PRIMARY KEY,
  course_name varchar(40) NOT NULL,
  faculty_id int
);

CREATE TABLE Lectures_det (
  course_id int,
  course_name varchar(40),
  lecturer int,
  time_ datetime,
  room varchar(40)
);

CREATE TABLE Elected (
  student int,
  course int
);

ALTER TABLE Students ADD FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id);

ALTER TABLE Lectures_det ADD FOREIGN KEY (lecturer) REFERENCES Lecturers (L_id);

ALTER TABLE Lectures_det ADD FOREIGN KEY (course_id) REFERENCES Courses (course_id);

ALTER TABLE Lectures_det ADD FOREIGN KEY (course_name) REFERENCES Courses (course_name);

ALTER TABLE Courses ADD FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id);

ALTER TABLE Managers ADD FOREIGN KEY (department) REFERENCES faculty (faculty_id);

ALTER TABLE Elected ADD FOREIGN KEY (student) REFERENCES Students (S_id);

ALTER TABLE Elected ADD FOREIGN KEY (course) REFERENCES Courses (course_id);

