--Cleaning database
drop table if it exists Employees
drop table if it exists Customers
drop table if it exists BookingArchive
drop table if it exists RentingArchive

--HotelChain Table Structure
Create Table HotelChain(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	num_hotels int CHECK (num_hotels BETWEEN 1 AND 1000),
	email VARCHAR(255) CHECK (email like '%@%'),
	street VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(6) NOT NULL CHECK (LENGTH(PostalCode) BETWEEN 5 AND 6),
	PRIMARY KEY (hotelChainID)
);

INSERT INTO HotelChain(hotelChainID,num_hotels,email,street,city,province, PostalCode)
VALUES
    (1, 12,'hotel1@gmail.com','123 XYZ Street', 'Ottawa','ONTARIO','A3S0G9'),
	(2, 14,'hotel2@gmail.com','345 Queen Street', 'Toronto','ONTARIO','B7S9G8'),
	(3, 18,'hotel3@gmail.com','123 Elm Street', 'Victoria','British Columbia','C9R0G9'),
	(4, 19,'hotel4@gmail.com','769 ABC Street', 'Ottawa','ONTARIO','A8B3V8'),
	(5, 13,'hotel5@gmail.com','475 Zero Street', 'London','ONTARIO','P4Q9G9');

--Table Structure Hotel
CREATE TABLE Hotel (
    hotelID int NOT NULL CHECK (hotelID >= 1 AND hotelID <= 1000),
    hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
    num_rooms int CHECK (num_rooms BETWEEN 1 AND 100),
    email VARCHAR(255) CHECK (email like '%@%'),
    star_rating int CHECK (star_rating >= 1 AND star_rating <= 5),
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(6) NOT NULL CHECK (LENGTH(PostalCode) BETWEEN 5 AND 6),
    PRIMARY KEY (hotelID, hotelChainID),
	FOREIGN KEY (hotelChainID)
	REFERENCES HotelChain
);

INSERT INTO Hotel(hotelID, hotelChainID, num_rooms,email,star_rating,street,city,province, PostalCode)
VALUES
    (1, 1, 60, 'hotel11@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '12345'),
	(2, 1, 80, 'hotel21@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '23456'),
	(3, 2, 90, 'hotel32@gmail.com', 3, '789 Oak St', 'Villageton', 'North America', '34567'),
	(4, 2, 100, 'hotel42@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '45678'),
	(5, 3, 100, 'hotel53@gmail.com', 5, '654 Cedar St', 'Ruraltown', 'North America', '56789');

--Table Structure HotelChain_PhoneNumber
Create Table HotelChain_PhoneNumber(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	PhoneNumber NUMERIC(10,0) Not Null,
	Primary Key (hotelChainID, PhoneNumber),
	FOREIGN KEY (hotelChainID)
	References HotelChain
);

INSERT INTO HotelChain_PhoneNumber(hotelChainID, PhoneNumber)
VALUES
    (1,123456789),
	(2,231456789),
	(3,321456789),
	(4,412356789),
	(5,512346789);

--Table Structure:Hotel_PhoneNumber
Create Table Hotel_PhoneNumber(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	PhoneNumber NUMERIC(10,0) Not Null,
	hotelID int NOT NULL CHECK (hotelID >= 1 AND hotelID <= 1000),
	Primary Key (hotelChainID, PhoneNumber,hotelID),
	FOREIGN KEY(hotelID,hotelChainID)
	References Hotel
);

INSERT INTO Hotel_PhoneNumber(hotelID,hotelChainID,PhoneNumber)
VALUES
    (1,1,133456789),
	(2,1,221456789),
	(3,2,331456789),
	(4,2,442356789),
	(5,3,552346789);

--HotelChain Table Structure
Create Table HotelChain(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	num_hotels int CHECK (num_hotels BETWEEN 1 AND 1000),
	email VARCHAR(255) CHECK (email like '%@%'),
	street VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(6) NOT NULL CHECK (LENGTH(PostalCode) BETWEEN 5 AND 6),
	PRIMARY KEY (hotelChainID)
);

INSERT INTO HotelChain(hotelChainID,num_hotels,email,street,city,province, PostalCode)
VALUES
    (1, 9,'hotel1@gmail.com','123 XYZ Street', 'Ottawa','ONTARIO','A3S0G9'),
	(2, 8,'hotel2@gmail.com','345 Queen Street', 'Toronto','ONTARIO','B7S9G8'),
	(3, 8,'hotel3@gmail.com','123 Elm Street', 'Victoria','British Columbia','C9R0G9'),
	(4, 8,'hotel4@gmail.com','769 ABC Street', 'Ottawa','ONTARIO','A8B3V8'),
	(5, 10,'hotel5@gmail.com','475 Zero Street', 'London','ONTARIO','P4Q9G9');

--Table Structure Hotel
CREATE TABLE Hotel (
    hotelID int NOT NULL CHECK (hotelID >= 1 AND hotelID <= 1000),
    hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
    num_rooms int CHECK (num_rooms BETWEEN 1 AND 100),
    email VARCHAR(255) CHECK (email like '%@%'),
    star_rating int CHECK (star_rating >= 1 AND star_rating <= 5),
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(6) NOT NULL CHECK (LENGTH(PostalCode) BETWEEN 5 AND 6),
    PRIMARY KEY (hotelID, hotelChainID),
	FOREIGN KEY (hotelChainID)
	REFERENCES HotelChain
);

INSERT INTO Hotel(hotelID, hotelChainID, num_rooms,email,star_rating,street,city,province, PostalCode)
VALUES
    (1, 1, 60, 'hotel11@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '123458'),
	(2, 1, 80, 'hotel21@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '23456'),
	(3, 1, 90, 'hotel31@gmail.com', 3, '789 Silver St', 'Brockville', 'North America', '123567'),
	(4, 1, 100, 'hotel41@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '45678'),
	(5, 1, 100, 'hotel51@gmail.com', 5, '654 Cedar St', 'Ruraltown', 'North America', '56789'),
	(6, 1, 60, 'hotel61@gmail.com', 3, '133 Main St', 'Cityville', 'North America', '123458'),
    (7, 1, 80, 'hotel71@gmail.com', 5, '466 llm St', 'Brownsville', 'North America', '234566'),
    (8, 1, 90, 'hotel81@gmail.com', 3, '899 Oak St', 'Villageton', 'North America', '34567'),
    (1, 2, 60, 'hotel12@gmail.com', 3, '133 Main St', 'Cityville', 'North America', '12346'),
	(2, 2, 80, 'hotel22@gmail.com', 5, '466 Elm St', 'Townsville', 'North America', '23457'),
	(3, 2, 90, 'hotel32@gmail.com', 3, '780 Oak St', 'Villageton', 'North America', '34568'),
	(4, 2, 100, 'hotel42@gmail.com', 4, '987 Cedar St', 'Ruraltown', 'North America', '45679'),
	(5, 2, 100, 'hotel52@gmail.com', 5, '989 Cedar St', 'Ruraltown', 'North America', '45679'),
	(6, 2, 100, 'hotel62@gmail.com', 4, '988 Pine St', 'Hamletville', 'North America', '45670'),
    (7, 2, 100, 'hotel72@gmail.com', 5, '655 Aedar St', 'Ruraltown', 'North America', '56780'),
	(8, 2, 100, 'hotel82@gmail.com', 5, '654 Brock St', 'Ruraltown', 'North America', '56781'),
	(1, 3, 60, 'hotel13@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '12349'),
    (2, 3, 80, 'hotel23@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '23450'),
    (3, 3, 90, 'hotel33@gmail.com', 3, '789 Empire St', 'Villageton', 'North America', '34569'),
    (4, 3, 100, 'hotel43@gmail.com', 4, '986 Cedar St', 'Ruraltown', 'North America', '45670'),
    (5, 3, 100, 'hotel53@gmail.com', 5, '988 Cedar St', 'Ruraltown', 'North America', '45670'),
    (6, 3, 100, 'hotel63@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '45688'),
    (7, 3, 100, 'hotel73@gmail.com', 5, '654 Aedar St', 'Ruraltown', 'North America', '56782'),
    (8, 3, 60, 'hotel83@gmail.com', 3, '124 Brock St', 'Cityville', 'North America', '12348'),
    (1, 4, 60, 'hotel14@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '11335'),
    (2, 4, 80, 'hotel24@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '22446'),
    (3, 4, 90, 'hotel34@gmail.com', 3, '789 Brock St', 'Villageton', 'North America', '33557'),
    (4, 4, 100, 'hotel44@gmail.com', 4, '912 Cedar St', 'Ruraltown', 'North America', '44678'),
    (5, 4, 100, 'hotel54@gmail.com', 5, '913 Cedar St', 'Ruraltown', 'North America', '44678'),
    (6, 4, 100, 'hotel64@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '44678'),
    (7, 4, 100, 'hotel74@gmail.com', 5, '654 Empire St', 'Ruraltown', 'North America', '57799'),
    (8, 4, 60, 'hotel84@gmail.com', 3, '178 Brock St', 'Cityville', 'North America', '12289'),
    (1, 5, 80, 'hotel15@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '17456'),
    (2, 5, 90, 'hotel25@gmail.com', 3, '789 Main St', 'Villageton', 'North America', '24567'),
    (3, 5, 100, 'hotel35@gmail.com', 4, '914 Cedar St', 'Ruraltown', 'North America', '45579'),
    (4, 5, 100, 'hotel45@gmail.com', 5, '915 Cedar St', 'Ruraltown', 'North America', '45579'),
    (5, 5, 100, 'hotel55@gmail.com', 4, '427 Pine St', 'Hamletville', 'North America', '34678'),
    (6, 5, 100, 'hotel65@gmail.com', 5, '800 Natural St', 'Newtown', 'North America', '36789'),
    (7, 5, 100, 'hotel75@gmail.com', 5, '196 East St', 'Urbantown', 'North America', '32789'),
    (8, 5, 100, 'hotel85@gmail.com', 5, '111 Brock St', 'Brockville', 'North America', '33789');

--Table Structure HotelChain_PhoneNumber
Create Table HotelChain_PhoneNumber(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	PhoneNumber NUMERIC(10,0) Not Null,
	Primary Key (hotelChainID, PhoneNumber),
	FOREIGN KEY (hotelChainID)
	References HotelChain
);

INSERT INTO HotelChain_PhoneNumber(hotelChainID, PhoneNumber)
VALUES
    (1,123456789),
	(2,231456789),
	(3,321456789),
	(4,412356789),
	(5,512346789);

--Table Structure:Hotel_PhoneNumber
Create Table Hotel_PhoneNumber(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	PhoneNumber NUMERIC(10,0) Not Null,
	hotelID int NOT NULL CHECK (hotelID >= 1 AND hotelID <= 1000),
	Primary Key (hotelChainID, PhoneNumber,hotelID),
	FOREIGN KEY(hotelID,hotelChainID)
	References Hotel
);

INSERT INTO Hotel_PhoneNumber(hotelID,hotelChainID,PhoneNumber)
VALUES
    (1,1,100000009),
	(2,1,100000008),
	(3,1,100000007),
	(4,1,100000006),
	(5,1,100000005),
	(6,1,100000004),
    (7,1,100000003),
    (8,1,100000002),
    (1,2,200000009),
   	(2,2,200000008),
   	(3,2,200000007),
   	(4,2,200000006),
   	(5,2,200000005),
   	(6,2,200000004),
    (7,2,200000003),
    (8,2,200000002),
    (1,3,300000009),
    (2,3,300000008),
    (3,3,300000007),
    (4,3,300000006),
    (5,3,300000005),
    (6,3,300000004),
    (7,3,300000003),
    (8,3,300000002),
    (1,4,400000009),
    (2,4,400000008),
    (3,4,400000007),
    (4,4,400000006),
    (5,4,400000005),
    (6,4,400000004),
    (7,4,400000003),
    (8,4,400000002),
    (1,5,500000009),
    (2,5,500000008),
    (3,5,500000007),
    (4,5,500000006),
    (5,5,500000005),
    (6,5,500000004),
    (7,5,500000003),
    (8,5,500000002);


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
