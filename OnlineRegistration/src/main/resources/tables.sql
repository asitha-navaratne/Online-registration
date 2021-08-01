DROP DATABASE IF EXISTS user_db;
CREATE DATABASE user_db;
USE user_db;

CREATE TABLE users(
	user_name VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    field VARCHAR(50),
    password VARCHAR(255),
    PRIMARY KEY(user_name)
);