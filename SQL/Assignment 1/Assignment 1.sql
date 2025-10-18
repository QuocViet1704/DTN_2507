CREATE DATABASE Testingsystem ;
USE Testingsystem;

CREATE TABLE department (
	department_id 		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name 	VARCHAR(50)
);

CREATE TABLE position (
	position_id     	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name 		ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

CREATE TABLE account (
	account_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email 				VARCHAR(50), 
	username			VARCHAR(50),
    fullname 			VARCHAR(50),
    department_id 		INT UNSIGNED,
    FOREIGN KEY (department_id) REFERENCES department (department_id),
    position_id 		INT UNSIGNED,
    FOREIGN KEY (position_id) REFERENCES position (position_id),
    create_date 		DATE
);

CREATE TABLE `group` (
	group_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name 			VARCHAR(50),
    creator_id			INT UNSIGNED,
    create_date 		DATE
);

CREATE TABLE group_account (
	group_id 			INT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (group_id) REFERENCES `group` ( group_id),
    account_id 			INT UNSIGNED,
    FOREIGN KEY (account_id) REFERENCES account (account_id),
    join_date			DATE 
);

CREATE TABLE type_question (
	type_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name 			ENUM ('Essay', 'Mutiple-Choice')
);

CREATE TABLE category_question (
	category_id 		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name 		VARCHAR(50)
);

CREATE TABLE question (
	question_id 		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content 			VARCHAR(500),
    category_id 		INT UNSIGNED,
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    type_id 		INT UNSIGNED,
    FOREIGN KEY (type_id) REFERENCES type_question (type_id),
    creator_id 			INT UNSIGNED,
    create_date 		DATE
);

CREATE TABLE answer (
	answer_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content 			VARCHAR(500),
    question_id 		INT UNSIGNED,
    FOREIGN KEY (question_id) REFERENCES question (question_id),
    is_correct 			ENUM ('true', 'false')
);

CREATE TABLE exam (
	exam_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    code 				INT UNSIGNED,
    title 				VARCHAR(100),
    category_id			INT UNSIGNED,
    duration 			VARCHAR(10),
    creator_id			INT UNSIGNED,
    create_date 		DATE
);

CREATE TABLE exam_question (
	exam_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    question_id 		INT UNSIGNED,
    FOREIGN KEY (question_id) REFERENCES question (question_id)
);


