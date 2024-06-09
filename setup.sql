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
	Vehicle_Type varchar(30) NOT NULL,
	Vehicle_Color varchar(45),
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
    Customer_Email varchar(255) NOT NULL,
    VIN int,
    Finance_Option varchar(12) NOT NULL, -- e.g. "Not Financed"
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

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Dealerships;
INSERT INTO Dealerships	VALUES (null, 'D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Vehicles;
INSERT INTO Vehicles VALUES	(10112, 1993, 'Ford', 'Explorer', 'SUV', 'Red', 525123, 995.00, 'NO');
INSERT INTO Vehicles VALUES	(37846, 2001, 'Ford', 'Ranger', 'truck', 'Yellow', 172544, 1995.00, 'NO');
INSERT INTO Vehicles VALUES	(44901, 2012, 'Honda', 'Civic', 'SUV', 'Gray', 103221, 6995.00, 'NO');
INSERT INTO Vehicles VALUES	(72105, 2013, 'Chevrolet', 'Malibu', 'Sedan', 'Blue', 98345, 7995.00, 'NO');
INSERT INTO Vehicles VALUES	(78901, 2014, 'BMW', '328i', 'Sedan', 'Black', 90567, 10500.00, 'YES');
INSERT INTO Vehicles VALUES	(12345, 2010, 'Ford', 'Focus', 'Sedan', 'Green', 120345, 5500.00, 'YES');
INSERT INTO Vehicles VALUES	(89012, 2012, 'Mercedes-Benz', 'C-Class', 'Sedan', 'White', 112987, 9500.00, 'YES');

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Inventory;
INSERT INTO Inventory VALUES (1, 10112);
INSERT INTO Inventory VALUES (1, 37846);
INSERT INTO Inventory VALUES (1, 44901);
INSERT INTO Inventory VALUES (1, 72105);
INSERT INTO Inventory VALUES (1, 78901);
INSERT INTO Inventory VALUES (1, 12345);
INSERT INTO Inventory VALUES (1, 89012);

# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                        #
# ---------------------------------------------------------------------- #

TRUNCATE Sales_Contracts;
INSERT INTO Sales_Contracts VALUES (null, 20240518, 'Mars Hall', 'mhall@aol.com', 78901, 'Financed', 11620.00, 493.85);
INSERT INTO Sales_Contracts VALUES (null, 20240608, 'Johnny Boy', 'jboy@outlook.com', 89012, 'Not Financed', 10370.00, 0.00);

# ---------------------------------------------------------------------- #
# Add info into "Lease_Contracts"                                        #
# ---------------------------------------------------------------------- #

TRUNCATE Lease_Contracts;
INSERT INTO Lease_Contracts VALUES (null, 20240518, 'Mars Hall', 'mhall@aol.com', 12345, 2750.00, 3135.00, 125.40);
