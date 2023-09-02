-- Create the Church database
CREATE DATABASE MitoyaBarakaChurchDB;

-- Switch to the Church database
USE MitoyaBarakaChurchDB;

-- Create the Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    date_of_birth DATE,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    baptism_status ENUM('Not Baptized', 'Baptized', 'Confirmed'),
    marriage_status ENUM('Single', 'Married', 'Widowed', 'Divorced'),
    occupation VARCHAR(100),
    date_joined DATE,
    is_married BOOLEAN,
    marriage_date DATE,
    is_baptized BOOLEAN,
    baptism_date DATE,
    is_born_again BOOLEAN,
    born_again_date DATE
);

-- Create the Families table
CREATE TABLE Families (
    family_id INT PRIMARY KEY,
    family_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    head_of_family_id INT,
    FOREIGN KEY (head_of_family_id) REFERENCES Members (member_id)
);

-- Create the Family_Members table
CREATE TABLE Family_Members (
    family_id INT,
    member_id INT,
    PRIMARY KEY (family_id, member_id),
    FOREIGN KEY (family_id) REFERENCES Families (family_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id)
);

-- Create the Talents table
CREATE TABLE Talents (
    talent_id INT PRIMARY KEY,
    talent_name VARCHAR(100) NOT NULL
);

-- Create the Member_Talents table
CREATE TABLE Member_Talents (
    member_id INT,
    talent_id INT,
    PRIMARY KEY (member_id, talent_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id),
    FOREIGN KEY (talent_id) REFERENCES Talents (talent_id)
);

-- Create the Ministries table
CREATE TABLE Ministries (
    ministry_id INT PRIMARY KEY,
    ministry_name VARCHAR(100) NOT NULL
);

-- Create the Member_Ministries table
CREATE TABLE Member_Ministries (
    member_id INT,
    ministry_id INT,
    position VARCHAR(100),
    PRIMARY KEY (member_id, ministry_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id),
    FOREIGN KEY (ministry_id) REFERENCES Ministries (ministry_id)
);

-- Create the Zonal_Groups table
CREATE TABLE Zonal_Groups (
    zonal_group_id INT PRIMARY KEY,
    zonal_group_name VARCHAR(100) NOT NULL
);

-- Create the Member_Zonal_Groups table
CREATE TABLE Member_Zonal_Groups (
    member_id INT,
    zonal_group_id INT,
    PRIMARY KEY (member_id, zonal_group_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id),
    FOREIGN KEY (zonal_group_id) REFERENCES Zonal_Groups (zonal_group_id)
);

-- Create the Ministerial_Groups table
CREATE TABLE Ministerial_Groups (
    ministerial_group_id INT PRIMARY KEY,
    ministerial_group_name VARCHAR(100) NOT NULL
);

-- Create the Member_Ministerial_Groups table
CREATE TABLE Member_Ministerial_Groups (
    member_id INT,
    ministerial_group_id INT,
    PRIMARY KEY (member_id, ministerial_group_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id),
    FOREIGN KEY (ministerial_group_id) REFERENCES Ministerial_Groups (ministerial_group_id)
);

-- Create the Relatives table
CREATE TABLE Relatives (
    relative_id INT PRIMARY KEY,
    member_id INT NOT NULL,
    related_member_id INT NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members (member_id),
    FOREIGN KEY (related_member_id) REFERENCES Members (member_id)
);

-- Create the Visitors table
CREATE TABLE Visitors (
    visitor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    date_of_visit DATE,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    referred_by_member_id INT,
    is_married BOOLEAN,
    marriage_date DATE,
    is_baptized BOOLEAN,
    baptism_date DATE,
    is_born_again BOOLEAN,
    born_again_date DATE,
    is_member BOOLEAN,
    FOREIGN KEY (referred_by_member_id) REFERENCES Members(member_id)
);

-- Create the Visitor_Member_Relationship table
CREATE TABLE Visitor_Member_Relationship (
    visitor_id INT,
    member_id INT,
    PRIMARY KEY (visitor_id, member_id),
    FOREIGN KEY (visitor_id) REFERENCES Visitors (visitor_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id)
);