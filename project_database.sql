--Cleaning database
drop table if it exists Employees
drop table if it exists Customers
drop table if it exists BookingArchive
drop table if it exists RentingArchive

--Table Structure:Employees
CREATE TABLE Employee (
    SSN_SIN NUMERIC(9,0) PRIMARY KEY CHECK (SSN_SIN > 0),,
    HotelID INT CHECK (HotelID BETWEEN 1 AND 1000),
    HotelChainID INT CHECK (HotelChainID BETWEEN 1 AND 5),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
   	province_state VARCHAR(100) NOT NULL,
    postal_code_zip_code VARCHAR(20) NOT NULL,
    Roles_chef BOOLEAN,
    Roles_maintenanceTechnician BOOLEAN,
    Roles_receptionist BOOLEAN,
    Roles_hotelKeeper BOOLEAN,
    FOREIGN KEY (HotelID) REFERENCES Hotel(hotel_id),
    FOREIGN KEY (HotelChainID) REFERENCES HotelChain(chain_id)
);

-- Sample Employees
INSERT INTO Employee (SSN_SIN, HotelID, HotelChainID, first_name, middle_name, last_name, street, city, province_state, postal_code_zip_code, Roles_chef, Roles_maintenanceTechnician, Roles_receptionist, Roles_hotelKeeper)
VALUES
    (123456789, 1, 1, 'John', 'Doe', 'Smith', '123 Main St', 'Cityville', 'North America', '12345', true, false, true, false),
    (234567890, 2, 1, 'Jane', 'Doe', 'Johnson', '456 Elm St', 'Townsville', 'North America', '23456', false, true, false, true),
    (345678901, 3, 2, 'Michael', 'Johnson', 'Brown', '789 Oak St', 'Villageton', 'North America', '34567', true, false, false, true),
    (456789012, 4, 2, 'Emily', 'Williams', 'Taylor', '987 Pine St', 'Hamletville', 'North America', '45678', false, true, true, false),
    (567890123, 5, 3, 'David', 'Wilson', 'Anderson', '654 Cedar St', 'Ruraltown', 'North America', '56789', true, false, true, false);


--Table Structure: Customer 
CREATE TABLE Customer (
    customer_ID NUMERIC(9,0) PRIMARY KEY CHECK (customer_ID > 0),
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province_state VARCHAR(100) NOT NULL CHECK (province_state IN ('North America')),
    postal_code_zip_code VARCHAR(20) NOT NULL CHECK (LENGTH(postal_code_zip_code) BETWEEN 5 AND 6),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    DateofRegistration DATE CHECK (LENGTH(DateofRegistration) = 10),
    CONSTRAINT valid_dateofregistration CHECK (TO_DATE(DateofRegistration, 'dd-mm-yyyy') IS NOT NULL)
);

--Sample customers 
INSERT INTO Customer (customer_ID, street, city, province_state, postal_code_zip_code, first_name, middle_name, last_name, DateofRegistration)
VALUES
    (123456789, '123 Maple St', 'Cityville', 'North America', '12345', 'John', 'Doe', 'Smith', '2023-01-01'),
    (234567890, '456 Oak St', 'Townsville', 'North America', '23456', 'Jane', NULL, 'Johnson', '2023-01-02'),
    (345678901, '789 Elm St', 'Villageton', 'North America', '34567', 'Michael', 'James', 'Brown', '2023-01-03'),
    (456789012, '987 Pine St', 'Hamletville', 'North America', '45678', 'Emily', NULL, 'Taylor', '2023-01-04'),
    (567890123, '654 Cedar St', 'Ruraltown', 'North America', '56789', 'David', 'Wilson', 'Anderson', '2023-01-05');

--Table structure:Booking archive
CREATE TABLE BookingArchive (
    booking_ID NUMERIC(9,0) PRIMARY KEY CHECK (booking_ID > 0),
    Date DATE NOT NULL,
    Customer_first_name VARCHAR(50) NOT NULL,
    Customer_middle_name VARCHAR(50),
    Customer_last_name VARCHAR(50) NOT NULL,
    Room_number NUMERIC(5,0) CHECK (Room_number > 0),
    hotelID INT CHECK (hotelID > 0),
    hotelChainID INT CHECK (hotelChainID BETWEEN 1 AND 5)
);

--Sample booking archive
INSERT INTO BookingArchive (booking_ID, Date, Customer_first_name, Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID)
VALUES
    (123456789, '2023-01-01', 'John', 'Doe', 'Smith', 101, 1, 1),
    (234567890, '2023-01-02', 'Jane', NULL, 'Johnson', 202, 2, 2),
    (345678901, '2023-01-03', 'Michael', 'James', 'Brown', 303, 3, 3);


--Table structure:Renting archive
CREATE TABLE RentingArchive (
    renting_ID NUMERIC(9,0) PRIMARY KEY CHECK (renting_ID > 0),
    Date DATE NOT NULL,
    Customer_first_name VARCHAR(50) NOT NULL,
    Customer_middle_name VARCHAR(50),
    Customer_last_name VARCHAR(50) NOT NULL,
    Room_number NUMERIC(5,0) CHECK (Room_number > 0),
    hotelID INT CHECK (hotelID > 0),
    hotelChainID INT CHECK (hotelChainID BETWEEN 1 AND 5)
);

--Sample renting archive
INSERT INTO RentingArchive (renting_ID, Date, Customer_first_name, Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID)
VALUES
    (123456789, '2023-01-01', 'John', 'Doe', 'Smith', 101, 1, 1),
    (234567890, '2023-01-02', 'Jane', NULL, 'Johnson', 202, 2, 2),
    (345678901, '2023-01-03', 'Michael', 'James', 'Brown', 303, 3, 3);


--Queries
--aggregation queries
SELECT AVG(price) AS avg_room_price
FROM Room;

SELECT hotelID, COUNT(*) AS num_bookings
FROM Booking
GROUP BY hotelID;










