-- Create the database
CREATE DATABASE CourseHub;
USE CourseHub;

-- Table: trainer
CREATE TABLE trainer (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    t_name VARCHAR(100) NOT NULL,
    expertise VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
	YOE INT CHECK (YOE >= 2)
);
-- Table: course
CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(100) NOT NULL,
    fees DECIMAL(10,2) NOT NULL CHECK (fees >= 50000),
    mode_of_learning ENUM('Online', 'Offline') DEFAULT 'Online'
);

-- Table: learner
CREATE TABLE learner (
    learner_id INT PRIMARY KEY AUTO_INCREMENT,
    l_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    score DECIMAL(5,2) CHECK (score BETWEEN 25 AND 100),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id));
    
describe trainer;
describe course;
describe learner;

-- USING SUBQUERY
SELECT l_name, score
FROM learner
WHERE score > (SELECT AVG(score) FROM learner);

SELECT c_name, fees
FROM course
WHERE fees > (SELECT AVG(fees) FROM course);

SELECT t_name
FROM trainer t
WHERE EXISTS (
    SELECT 1
    FROM learner l
    WHERE l.trainer_id = t.trainer_id
);

SELECT l_name, email
FROM learner
WHERE course_id IN (
    SELECT course_id
    FROM course
    WHERE fees > 60000
);

SELECT l1.l_name, l1.course_id, l1.score
FROM learner l1
WHERE l1.score = (
    SELECT MAX(l2.score)
    FROM learner l2
    WHERE l2.course_id = l1.course_id
);

