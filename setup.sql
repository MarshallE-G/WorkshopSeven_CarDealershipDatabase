# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          Dealership Database                             #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS dealership_db;

CREATE DATABASE IF NOT EXISTS dealership_db;

USE dealership_db;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE Dealerships (
	Dealership_id int NOT NULL auto_INCREMENT,
	Name varchar(50) NOT NULL,
	Address varchar(50),
	Phone varchar(12),
    PRIMARY KEY (dealership_id)
 );


# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE Vehicles (
	VIN int NOT NULL,
	Year int NOT NULL,
	Make_Name varchar(30) NOT NULL,
	Model_Name varchar(60) NOT NULL,
	Vehicle_Type varchar(25) NOT NULL,
	Vehicle_Color varchar(25),
	Mileage int NOT NULL,
	Vehicle_Price decimal(10,2) NOT NULL,
	SOLD varchar(3) NOT NULL,
	PRIMARY KEY (VIN)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE Inventory (
	 Dealership_id int,
	 VIN int
);

# ---------------------------------------------------------------------- #
# Add table "Sales Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE Sales_Contracts (
	Sales_id int NOT NULL auto_increment,
	Date int NOT NULL,
    Customer_Name varchar(50) NOT NULL,
    Customer_Email varchar(254) NOT NULL,
    VIN int,
    Finance_Option varchar(11) NOT NULL, -- e.g. "Not Financed"
    Total_Price decimal(10, 2) NOT NULL,
    Monthly_Payment decimal(10, 2) NOT NULL,
	PRIMARY KEY (Sales_id)
);

# ---------------------------------------------------------------------- #
# Add table "Lease Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE Lease_Contracts (
	Lease_id int NOT NULL auto_increment,
	Date int NOT NULL,
    Customer_Name varchar(50) NOT NULL,
    Customer_Email varchar(254) NOT NULL,
    VIN int,
    Expected_End_Value decimal(10,2) NOT NULL,
	Total_Price decimal(10, 2) NOT NULL,
    Monthly_Payment decimal(10, 2) NOT NULL,
    PRIMARY KEY (Lease_id)
);

TRUNCATE TABLE Dealerships;
INSERT INTO dealerships	VALUES (null, 'D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555');

TRUNCATE TABLE Vehicles;
INSERT INTO vehicles VALUES	(null, 10112, 1993, 'Ford', 'Explorer', 'SUV', 'Red', 525123, 995.00, 'NO');
INSERT INTO vehicles VALUES	(null, 37846, 2001, 'Ford', 'Ranger', 'truck', 'Yellow', 172544, 1995.00, 'NO');
INSERT INTO vehicles VALUES	(null, 44901, 2012, 'Honda', 'Civic', 'SUV', 'Gray', 103221, 6995.00, 'NO');
INSERT INTO vehicles VALUES	(null, 72105, 2013, 'Chevrolet', 'Malibu', 'Sedan', 'Blue', 98345, 7995.00, 'NO');

TRUNCATE TABLE Inventory;
INSERT INTO inventory VALUES (1, 10112);
INSERT INTO inventory VALUES (1, 37846);
INSERT INTO inventory VALUES (1, 44901);
INSERT INTO inventory VALUES (1, 72105);

TRUNCATE Sales_Contracts;


TRUNCATE Lease_Contracts;

