# TASK-6
CourseHub SQL Project – Subqueries and Nested Queries
Overview

This project demonstrates the use of **subqueries and nested queries** in SQL using a relational database schema for a fictional training platform: `CourseHub`. The schema includes tables for `trainer`, `course`, and `learner`. All queries were executed in MySQL Workbench.
 Database Schema
1. `trainer`
Holds information about individual trainers:
- `trainer_id` (Primary Key)
- `t_name`: Trainer's name
- `expertise`: Area of specialization
- `rating`: Decimal between 0–5
- `YOE`: Years of experience (min. 2)

2.`course`
Stores course-related data:
- `course_id` (Primary Key)
- `c_name`: Course name
- `fees`: Must be ≥ ₹50,000
- `mode_of_learning`: Enum with 'Online' as default

3. `learner`
Captures learner details:
- `learner_id` (Primary Key)
- `l_name`: Learner name
- `email`: Unique
- `score`: Numeric score (between 25–100)
- `course_id`: Foreign Key to `course`
- `trainer_id`: Foreign Key to `trainer`

 SQL Concepts Used

Scalar Subqueries   Correlated Subqueries  
Nested `IN` and `EXISTS` clauses  
Aggregate subqueries in `WHERE` clause  


