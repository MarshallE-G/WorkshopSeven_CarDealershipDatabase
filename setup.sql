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

-- Table 4: sales_contracts
-- -------------------------
-- Columns:
--  you decide
--  id should be auto-incremented
--  use a foreign key (VIN) to link to the vehicle

# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #





# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #

