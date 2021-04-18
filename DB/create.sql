DROP DATABASE  testDB;
create DATABASE testDB;
use  testDB;

-- ~~~~~CREATE SCRIPTS ~~~~~~~~
-- ~~ Owners who register through the website ~~~
CREATE TABLE Users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    email_id VARCHAR(30) NOT NULL,
    firstname VARCHAR(20),
    lastname VARCHAR(20),
    gender CHAR(1),
    date_of_birth DATE,   
    phone_no VARCHAR(20),
    PRIMARY KEY (id)
);
-- ~~ Devices created by MANUFACTURER and user_id is added after owner logs in to website ~~
CREATE TABLE Devices (
    id INT NOT NULL AUTO_INCREMENT,
    owner_id INT,
    name VARCHAR(30) NOT NULL,
    type VARCHAR(20) NOT NULL,
    description VARCHAR(50),
    cost DECIMAL(8, 2) NOT NULL,
    date_of_manufacture DATE NOT NULL,
    date_of_purchase DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);
-- ~~ ResourceTypes created by MANUFACTURER ex: PHOTO/AUDIO/FINGERPRINT ~~ --
CREATE TABLE ResourceTypes (
    id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(20) NOT NULL,
    description VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
-- ~~ DeviceUsers that owner adds to the device (owner gets added by default initially) ~~
CREATE TABLE DeviceUsers (
    id INT NOT NULL AUTO_INCREMENT,
    device_id INT,
    username VARCHAR(20) NOT NULL,
    relationship_with_owner VARCHAR(20),
    PRIMARY KEY (id),
    FOREIGN KEY (device_id) REFERENCES Devices(id)
);
-- ~~ DeviceUsers with Type of resources that is valid for him
CREATE TABLE Resources (
    id INT NOT NULL AUTO_INCREMENT,
    device_user_id INT,
    resource_type_id INT,
    resource_url VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (device_user_id) REFERENCES DeviceUsers(id)
);

show TABLES;