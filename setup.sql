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

CREATE TABLE `dealerships` (
	`dealership_id` INTEGER NOT NULL AUTO_INCREMENT,
	`dealership_name` VARCHAR(50) NOT NULL,
	`dealership_address` VARCHAR(50) NOT NULL,
	`dealership_phone` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`dealership_id`)
 );


# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `vehicles` (
	`VIN` INTEGER NOT NULL,
	`year` INTEGER NOT NULL,
	`make_name` VARCHAR(30) NOT NULL,
	`model_name` VARCHAR(60) NOT NULL,
	`vehicle_type` VARCHAR(30) NOT NULL,
	`vehicle_color` VARCHAR(45) NOT NULL,
	`mileage` INTEGER NOT NULL,
	`vehicle_price` DECIMAL(10,2) NOT NULL,
	`SOLD` VARCHAR(3) NOT NULL,
	PRIMARY KEY (`VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `inventory` (
	 `dealership_id` INTEGER NOT NULL,
	 `VIN` INTEGER NOT NULL,
     FOREIGN KEY (`dealership_id`) REFERENCES `dealerships` (`dealership_id`),
     FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "Sales Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `sales_contracts` (
	`id` INTEGER NOT NULL AUTO_increment,
	`contract_date` INTEGER NOT NULL,
    `customer_name` VARCHAR(50) NOT NULL,
    `customer_email` VARCHAR(255) NOT NULL,
    `VIN` INTEGER NOT NULL,
    `vehicle_price` DECIMAL(10,2) NOT NULL,
    `sales_tax_amount` DECIMAL(10,2) NOT NULL,
    `recording_fee` DECIMAL(10,2) NOT NULL,
    `processing_fee` DECIMAL(10,2) NOT NULL,
    `finance_option` VARCHAR(3) NOT NULL, -- e.g. "Not Financed" or "NO"
    `total_price` DECIMAL(10, 2) NOT NULL,
    `monthly_payment` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`),
	PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "Lease Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `lease_contracts` (
	`id` INTEGER NOT NULL AUTO_increment,
	`contract_date` INTEGER NOT NULL,
    `customer_name` VARCHAR(50) NOT NULL,
    `customer_email` VARCHAR(254) NOT NULL,
    `VIN` INTEGER NOT NULL,
    `vehicle_price` DECIMAL(10,2) NOT NULL,
    `expected_end_value` DECIMAL(10,2) NOT NULL,
    `lease_fee` DECIMAL(10,2) NOT NULL,
	`total_price` DECIMAL(10, 2) NOT NULL,
    `monthly_payment` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`),
    PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #

INSERT INTO dealerships(`dealership_name`, `dealership_address`, `dealership_phone`) VALUES ('D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #

INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (10112, 1993, 'Ford', 'Explorer', 'SUV', 'Red', 525123, 995.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES	(37846, 2001, 'Ford', 'Ranger', 'truck', 'Yellow', 172544, 1995.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES	(44901, 2012, 'Honda', 'Civic', 'SUV', 'Gray', 103221, 6995.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES	(72105, 2013, 'Chevrolet', 'Malibu', 'Sedan', 'Blue', 98345, 7995.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES	(78901, 2014, 'BMW', '328i', 'Sedan', 'Black', 90567, 10500.00, 'YES');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES	(12345, 2010, 'Ford', 'Focus', 'Sedan', 'Green', 120345, 5500.00, 'YES');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES	(89012, 2012, 'Mercedes-Benz', 'C-Class', 'Sedan', 'White', 112987, 9500.00, 'YES');

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #

INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 10112);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 37846);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 44901);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 72105);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 78901);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 12345);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 89012);

# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO sales_contracts(`contract_date`, `customer_name`, `customer_email`, `VIN`, `vehicle_price`, `sales_tax_amount`, `recording_fee`, `processing_fee`, `finance_option`, `total_price`, `monthly_payment`) VALUES (20240518, 'Mars Hall', 'mhall@aol.com', 78901, 10500.00, 525.00, 100.00, 495.00, 'YES', 11620.00, 493.85);
INSERT INTO sales_contracts(`contract_date`, `customer_name`, `customer_email`, `VIN`, `vehicle_price`, `sales_tax_amount`, `recording_fee`, `processing_fee`, `finance_option`, `total_price`, `monthly_payment`) VALUES (20240608, 'Johnny Boy', 'jboy@outlook.com', 89012, 9500.00, 475.00, 100.00, 295.00, 'NO', 10370.00, 0.00);

# ---------------------------------------------------------------------- #
# Add info into "Lease_Contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO lease_contracts(`contract_date`, `customer_name`, `customer_email`, `VIN`, `vehicle_price`, `expected_end_value`, `lease_fee`, `total_price`, `monthly_payment`) VALUES (20240518, 'Mars Hall', 'mhall@aol.com', 12345, 5500.00, 2750.00, 385.00, 3135.00, 125.40);
