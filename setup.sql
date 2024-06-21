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
	`inventory_id` INTEGER NOT NULL AUTO_INCREMENT,
	`dealership_id` INTEGER NOT NULL,
	`VIN` INTEGER NOT NULL,
    FOREIGN KEY (`dealership_id`) REFERENCES `dealerships` (`dealership_id`),
    FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`),
    PRIMARY KEY (`inventory_id`)
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
-- Below was converted using ChatGPT
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (21245, 2015, 'Toyota', 'RAV4', 'SUV', 'Silver', 12000, 12000.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (22356, 2011, 'Kia', 'Optima', 'Sedan', 'Black', 109876, 6700.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (23467, 2013, 'Chevrolet', 'Impala', 'Sedan', 'White', 98765, 7500.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (24578, 2007, 'Jeep', 'Grand Cherokee', 'SUV', 'Gray', 176543, 5800.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (25689, 2006, 'Nissan', 'Murano', 'SUV', 'Red', 154321, 4900.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (26790, 2014, 'Ford', 'Explorer', 'SUV', 'Blue', 87654, 12750.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (27801, 2008, 'Toyota', 'Highlander', 'SUV', 'Silver', 145678, 7800.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (28912, 2010, 'Honda', 'Pilot', 'SUV', 'Green', 123456, 8300.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (29023, 2009, 'Chevrolet', 'Traverse', 'SUV', 'Black', 154321, 6500.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (30134, 2015, 'Mazda', 'CX-9', 'SUV', 'Red', 98765, 14000.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (31245, 2013, 'Hyundai', 'Tucson', 'SUV', 'White', 109876, 8600.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (32356, 2011, 'Ford', 'Flex', 'SUV', 'Blue', 145678, 7200.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (33467, 2007, 'Toyota', '4Runner', 'SUV', 'Silver', 167890, 6700.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (34578, 2012, 'Nissan', 'Pathfinder', 'SUV', 'Gray', 98765, 9000.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (35689, 2014, 'Chevrolet', 'Silverado', 'Truck', 'Red', 87654, 17500.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (36790, 2010, 'Ford', 'F-150', 'Truck', 'Blue', 145678, 11500.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (37801, 2009, 'Dodge', 'Ram 1500', 'Truck', 'Black', 132456, 10750.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (38912, 2006, 'Toyota', 'Tacoma', 'Truck', 'White', 154321, 6900.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (39023, 2008, 'Honda', 'Ridgeline', 'Truck', 'Silver', 145678, 8500.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (40134, 2012, 'GMC', 'Sierra', 'Truck', 'Gray', 98765, 12000.00, 'NO');
INSERT INTO vehicles(`VIN`, `year`, `make_name`, `model_name`, `vehicle_type`, `vehicle_color`, `mileage`, `vehicle_price`, `SOLD`) VALUES (41245, 2015, 'Ram', '2500', 'Truck', 'Blue', 87654, 19500.00, 'NO');


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
-- Below was converted using ChatGPT
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 21245);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 22356);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 23467);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 24578);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 25689);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 26790);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 27801);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 28912);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 29023);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 30134);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 31245);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 32356);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 33467);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 34578);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 35689);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 36790);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 37801);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 38912);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 39023);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 40134);
INSERT INTO inventory(`dealership_id`, `VIN`) VALUES (1, 41245);

# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO sales_contracts(`contract_date`, `customer_name`, `customer_email`, `VIN`, `vehicle_price`, `sales_tax_amount`, `recording_fee`, `processing_fee`, `finance_option`, `total_price`, `monthly_payment`) VALUES (20240518, 'Mars Hall', 'mhall@aol.com', 78901, 10500.00, 525.00, 100.00, 495.00, 'YES', 11620.00, 493.85);
INSERT INTO sales_contracts(`contract_date`, `customer_name`, `customer_email`, `VIN`, `vehicle_price`, `sales_tax_amount`, `recording_fee`, `processing_fee`, `finance_option`, `total_price`, `monthly_payment`) VALUES (20240608, 'Johnny Boy', 'jboy@outlook.com', 89012, 9500.00, 475.00, 100.00, 295.00, 'NO', 10370.00, 0.00);

# ---------------------------------------------------------------------- #
# Add info into "Lease_Contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO lease_contracts(`contract_date`, `customer_name`, `customer_email`, `VIN`, `vehicle_price`, `expected_end_value`, `lease_fee`, `total_price`, `monthly_payment`) VALUES (20240518, 'Mars Hall', 'mhall@aol.com', 12345, 5500.00, 2750.00, 385.00, 3135.00, 125.40);
