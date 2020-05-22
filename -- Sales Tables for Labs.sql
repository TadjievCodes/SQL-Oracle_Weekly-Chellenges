-- Sales Tables for Labs

/*DROP TABLE Categories CASCADE CONSTRAINTS;
DROP TABLE Order_Details CASCADE CONSTRAINTS;
DROP TABLE Product_Vendors CASCADE CONSTRAINTS;
DROP TABLE Vendors CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;
DROP TABLE Employees CASCADE CONSTRAINTS;
DROP TABLE Products CASCADE CONSTRAINTS;
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

CREATE TABLE Categories (
	Id SMALLINT NOT NULL ,
	Description VARCHAR2 (75) NULL,
	CONSTRAINT Categories_PK PRIMARY KEY(Id) 
);

CREATE TABLE Customers (
	Id INT NOT NULL ,
	FirstName VARCHAR2 (25) NULL ,
	LastName VARCHAR2 (25) NULL ,
	StreetAddress VARCHAR2 (50) NULL ,
	City VARCHAR2 (30) NULL ,
	Province VARCHAR2 (2) NULL ,
	PostalCode VARCHAR2 (7) NULL ,
	AreaCode smallint DEFAULT (0) NULL ,
	PhoneNumber VARCHAR2 (8) NULL, 
	CONSTRAINT Customers_PK PRIMARY KEY(Id) 
);

CREATE TABLE Employees (
	Id INT NOT NULL ,
	FirstName VARCHAR2 (25) NULL ,
	LastName VARCHAR2 (25) NULL ,
	StreetAddress VARCHAR2 (50) NULL ,
	City VARCHAR2 (30) NULL ,
	Province VARCHAR2 (2) NULL ,
	PostalCode VARCHAR2 (7) NULL ,
	AreaCode SMALLINT DEFAULT (0) NULL ,
	PhoneNumber VARCHAR2 (8) NULL,
        BirthDate DATE NULL, 
	CONSTRAINT Emloyees_PK PRIMARY KEY(Id) 
);

CREATE TABLE Orders (
	Id SMALLINT NOT NULL,
	OrderDate DATE NULL,
	ShipDate DATE NULL,
	CustomerId INT DEFAULT(0) NULL,
	EmployeeId INT DEFAULT(0) NULL,
	CONSTRAINT Orders_PK PRIMARY KEY(Id),
  CONSTRAINT Orders_Customers_FK FOREIGN KEY (CustomerId)
    REFERENCES Customers(Id),
  CONSTRAINT Orders_Employees_FK FOREIGN KEY (EmployeeId)
    REFERENCES Employees(Id)
);

CREATE TABLE Products (
	Id SMALLINT NOT NULL ,
	Name VARCHAR2(50) NULL ,
	Description VARCHAR2(100) NULL ,
	RetailPrice NUMBER(9,2) DEFAULT(0) NULL ,
	QtyOnHand SMALLINT DEFAULT(0) NULL ,
	CategoryId SMALLINT DEFAULT(0) NULL, 
	CONSTRAINT Products_PK PRIMARY KEY(Id), 
  CONSTRAINT Products_Category_FK FOREIGN KEY (CategoryId)
    REFERENCES Categories(Id)
);

CREATE TABLE Vendors (
	Id SMALLINT NOT NULL ,
	Name VARCHAR2(25) NULL ,
	StreetAddress VARCHAR2(50) NULL ,
	City VARCHAR2(30) NULL ,
	Province VARCHAR2(2) NULL ,
	PostalCode VARCHAR2(7) NULL ,
	PhoneNumber VARCHAR2(15) NULL ,
	WebURL VARCHAR2(50) NULL ,
	EMail VARCHAR2(50) NULL ,
	CONSTRAINT Vendors_PK PRIMARY KEY(Id) 
);

CREATE TABLE Order_Details (
	OrderId SMALLINT DEFAULT (0) NOT NULL ,
	ProductId SMALLINT DEFAULT (0) NOT NULL ,
	QuotedPrice NUMBER(9,2) DEFAULT (0) NULL ,
	QtyOrdered SMALLINT DEFAULT (0) NULL, 
	CONSTRAINT Order_Details_PK PRIMARY KEY(OrderId,ProductId),
  CONSTRAINT Order_Details_Order_FK FOREIGN KEY (OrderId)
    REFERENCES Orders(Id),
  CONSTRAINT Order_Details_Product_FK FOREIGN KEY (ProductId)
    REFERENCES Products(Id)
);

CREATE TABLE Product_Vendors (
	ProductId SMALLINT DEFAULT (0) NOT NULL ,
	VendorId SMALLINT DEFAULT (0) NOT NULL ,
	WholesalePrice NUMBER(9,2) DEFAULT (0) NULL ,
	DaysToDeliver SMALLINT DEFAULT (0) NULL,
	CONSTRAINT Product_Vendors_PK PRIMARY KEY(ProductId,VendorId),
  CONSTRAINT Product_Vendors_Product_FK FOREIGN KEY (ProductId)
    REFERENCES Products(Id),
  CONSTRAINT Product_Vendors_Vendor_FK FOREIGN KEY (VendorId)
    REFERENCES Vendors(Id)
);


-- Let's insert some Customer data
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1001, 'Susan', 'Vincent', '15127 NW 25th, #393', 
   'Toronto', 'ON', 'M5E-1W5', 416, '555-2986');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1002, 'Tom', 'Williams', '127 River Drive', 
   'Vancouver', 'BC', 'V5J-1A1', 604, '555-2981');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1003, 'George', 'Perkins', 'Oak Ave', 
   'London', 'ON', 'N5Y-5R6', 519, '555-2676');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1004, 'Bob', 'Roberts', '726 Lambert Ave', 
   'Ottawa', 'ON', 'K2J-0K6', 613, '555-2498');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1005, 'Dee', 'McAulish', '411 Sycamore Rd.', 
   'London', 'ON', 'N5Y-5R6', 519, '555-2507');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1006, 'Jake', 'Washington', '15 North St, #727', 
   'London', 'ON', 'N5Y-5R6', 519, '555-2517');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1007, 'Marianne', 'Sergeant', '1901 Spruce St', 
   'Hamilton', 'ON', 'L0R-1H0', 289, '555-2528');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1008, 'Norm', 'Peterson', '33 East Ave', 
   'Edmonton', 'AB', 'T6X-2A3', 680, '555-4541');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1009, 'Andy', 'Capp', '50 - 25th St. Apt. 12C', 
   'Toronto', 'ON', 'M5E-1W5', 416, '555-7601');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1010, 'Angie', 'Kendal', '12 River Road', 
   'Ottawa', 'ON', 'K2J-0K6', 613, '555-4571');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1011, 'Alan', 'Hall', 'Route 4, Box 208', 
   'Calgary', 'AB', 'T6X-2A3', 403, '555-2831');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1012, 'Leon', 'Keys', '920 N. 40th Street', 
   'Montreal', 'QU', 'H1A 0A1', 514, '555-2856');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1013, 'Raoul', 'Peterson', '114 Lovers Lane', 
   'Edmonton', 'AB', 'T6X-2A3', 680, '555-2846');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1014, 'Sammy', 'Astor', '61 Pine Drive', 
   'Edmonton', 'AB', 'T6X-2A3', 680, '555-2681');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1015, 'Darcy', 'Ring', '601 Sea Lane', 
   'Halifax', 'NS', 'B0J-1B0', 902, '555-2696');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1016, 'James', 'Colson', '10 E 88th', 
   'Edmonton', 'AB', 'T6X-2A3', 680, '555-2436');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1017, 'Mark', 'Reidel', '6 Valley Drive', 
   'Halifax', 'NS', 'B0J-1B0', 902, '555-2641');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1018, 'David', 'Jones', '11 12th Ave. N.', 
   'Saint John', 'NB', 'E2H-0A1', 559, '555-2846');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1019, 'Jim', 'Rich', '30 King Dr.', 
   'Saint John', 'NB', 'E2H-0A1', 506, '555-2621');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1020, 'Joy', 'Larsen', '24 West Drive', 
   'Halifax', 'NS', 'B0J-1B0', 902, '555-2326');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1021, 'Bella', 'Jones', '25 Rosary Ln', 
   'Ottawa', 'ON', 'K2J-0K6', 613, '555-3938');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1022, 'Cal', 'Vincent', '45 Flamingo Road', 
   'Edmonton', 'AB', 'T6X-2A3', 680, '555-1037');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1023, 'Julie', 'Schneider', '43 Penny Lane', 
   'Vancouver', 'BC', 'V5J-1A1', 604, '555-7936');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1024, 'Mary', 'Rose', '23 Wingate Ln', 
   'Calgary', 'AB', 'T6X-2A3', 403, '555-2286');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1025, 'May', 'Peterson', '45 Sienne Rd', 
   'Calgary', 'AB', 'T6X-2A3', 403, '555-4291');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1026, 'Ken', 'Demers', '55 Palm Ave', 
   'Ottawa', 'ON', 'K2J-0K6', 613, '555-2311');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1027, 'Lem', 'Demers', '77 Ave SE', 
   'Halifax', 'NS', 'B0J-1B0', 902, '555-2616');
INSERT INTO Customers
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, 
   PhoneNumber)
  VALUES (1028, 'James', 'Teather', '41 4th Ave NE', 
   'Vancouver', 'BC', 'V5J-1A1', 604, '555-9339');

-- Let's insert some Employee data
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (601, 'Anne', 'Peterson', '16 Oak Ave', 
   'Vancouver', 'BC', 'V5J-1A1', 604, '555-2591', '1968-04-28');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (602, 'Mary', 'Thompson', '122 Spring River Drive', 
   'Toronto', 'ON', 'M5E-1W5', 416, '555-2516', '1980-07-22');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (603, 'Matthew', 'Bere', '8 Ridgeway', 
   'Toronto', 'ON', 'M5E-1W5', 905, '555-2583', '1974-10-04');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (604, 'Carolyn', 'James', '22 Mossy St.', 
   'Toronto', 'ON', 'M5E-1W5', 905, '555-2876', '1977-11-21');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (605, 'Kirby', 'Decker', '45 Palm Way', 
   'Ottawa', 'ON', 'K2J-0K6', 613, '555-2311', '1965-11-04');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (606, 'Davey', 'Smith', '679 Courtland Ave', 
   'Toronto', 'ON', 'M5E-1W5', 416, '555-2661', '1978-03-09');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (607, 'Kate', 'Peterson', '5 Wilson Rd', 
   'London', 'ON', 'N5Y-5R6', 519, '555-2497', '1972-11-10');
INSERT INTO Employees
  (Id, FirstName, LastName, StreetAddress, 
   City, Province, PostalCode, AreaCode, PhoneNumber, 
   BirthDate)
  VALUES (608, 'Sue', 'Laine', '51 Leonard Ave', 
   'Vancouver', 'BC', 'V5J-1A1', 604, '555-2201', '1977-11-04');

-- Let's insert some Vendor data
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (1, 'Nike Inc.', 'One Bowerman Drive', 
   'Toronto', 'ON', 'M5E-1W5', '(416)555-6453', 
   'http://www.nike.com', 'Sales@nike.com');
INSERT INTO Vendors
  (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (2, 'CCM', '19 Rue St. Larent', 
  'Montreal','QU', 'H1A-0A1', '(514)555-1234', 
   'http://www.ccm.ca', 'Saless@ccm.ca');
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (3, 'Callaway Corp', '88 Old North Road Ave', 
   'Ottawa', 'ON', 'K2J-0K6', '(613)555-1234', 
   'http://www.bigbertha.com/', 'bb@callaway.com');
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (4, 'Champion', '29 N. Quail St.', 'Kelowna', 
   'BC', 'V5J-1A1', '(604)555-1234', 
   'http://www.ChampionClothes.com', 'Sales@Champion.com');
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (5, 'Easton', 'PO Box 1029', 
   'Vancouver', 'BC', 'V5J-1A1', '(604)555-1234', 
   'http://www.easton.ca', 'Sales@easton.com');
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (6, 'Umbro', 'South St.', 
   'Edmonton', 'AB', 'T6X-2A3', '(780)555-1335', 
   NULL, NULL);
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (7, 'Wilson', '575 Edison Ave.', 'Calgary', 
   'AB', 'T6X-2A3', '(403)555-9876', NULL, NULL);
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (8, 'Yonex', 'PO Box 82', 
   'Calgary', 'AB', 'T6X-2A3', '(403)555-9876', NULL, NULL);
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (9, 'Rawlings', '740 King St', 
   'Toronto', 'ON', 'M5E-1W5', '(905)555-9876', NULL, NULL);
INSERT INTO Vendors (Id, Name, StreetAddress, City, Province, PostalCode, 
PhoneNumber, WebURL, Email)
  VALUES (10, 'Vaughn', '12 Highbury Ave', 
   'London', 'ON', 'N5Y-5R6', '(519)555-9876', 
   'http://www.vaughnpads.com/', 'Sales@Vaughn.com');
 
-- Let's insert the categories data
INSERT INTO Categories (Id, Description) VALUES (1, 'Hockey Equipment');
INSERT INTO Categories (Id, Description) VALUES (2, 'Baseball Equipment');
INSERT INTO Categories (Id, Description) VALUES (3, 'Golf Equipment');
INSERT INTO Categories (Id, Description) VALUES (4, 'Apparel');
INSERT INTO Categories (Id, Description) VALUES (5, 'Soccer Equipment');
INSERT INTO Categories (Id, Description) VALUES (6, 'Tennis Equipment');
 
-- Let's insert the products data
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (1, 'Batting Glove', NULL, 15.99, 12, 2);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (2, 'Baseball Bat', '32 oz made from Ash', 38.00, 8, 2);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (3, 'Composite Stick LH', 'AERO-SENSE 2 technology', 75.99, 20, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (4, 'Calgary Flames Hoodie', NULL, 54.95, 20, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (5, 'Hockey Tape - 4 Pack', NULL, 7.45, 12, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (6, 'Batting Helmet', NULL, 63.50, 5, 2);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (7, '32 in Goalie Pads', 'Professional Edition', 1499.99, 10, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (8, 'Shin Pads', NULL, 29.99, 20, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (9, 'Goalie Trapper RH', NULL, 339.99, 12, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (10, 'Hockey Helmet', NULL, 136.99, 20, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (11, 'Firstbase Trapper', NULL, 165.09, 5, 2);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (12, 'Maple Leaf Tee', NULL, 23.59, 16, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (13, 'Blue Jays Tee', NULL, 23.59, 20, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (14, 'Golf Wind Shirt XL', NULL, 49.95, 20, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (15, 'Baseball Pants Sm', NULL, 34.99, 40, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (16, 'Scrimmage Jersey - XL', NULL, 18.99, 40, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (17, 'Jogging Shoe Sz 9.5', NULL, 75.99, 60, 4);
INSERT INTO Products(Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (18, 'Composite Stick RH', 'AERO-SENSE 2 technology', 75.99, 12, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (19, 'Pail of Pucks', NULL, 47.88, 20, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (20, 'Player Gloves', 'Black', 95.99, 30, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (21, 'Player Gloves', 'Red', 95.99, 25, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (22, 'Player Gloves', 'Green', 95.99, 18, 1);
INSERT INTO Products(Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (23, 'Callaway 3 Iron', NULL, 85.99, 30, 3);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (24, 'Big Bertha Driver - LH', NULL, 269.99, 2, 3);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (25, 'Player Helmet With Visor', 'Black', 139.99, 30, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (26, 'Player Helmet With Visor', 'Green', 139.99, 24, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (27, 'Wilson Pro', '2016 Model', 240.99, 20, 6);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (28, 'Wilson Pro', '2017 Model', 290.99, 18, 6);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (29, 'Tennis Balls 3 Pack', NULL, 6.99, 22, 6);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (30, 'Elbow Pads - sm', NULL, 23.99, 14, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (31, 'Elbow Pads - md', NULL, 23.99, 20, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (32, 'Titelist Golf Balls - 12', NULL, 32.99, 12, 3);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (33, 'Taylor Made Golf Balls - 12', NULL, 29.99, 30, 3);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (34, 'Hockey Bag', 'Black', 89.99, 14, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (35, 'Hockey Bag', 'Red', 89.99, 10, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (36, 'Baseball Cap', 'Jays', 26.50, 22, 4);
INSERT INTO Products(Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (37, 'Baseball Cap', 'Yankees', 26.50, 40, 4);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (38, '32 oz Water Bottle', NULL, 16.62, 12, 1);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (39, 'Professional Soccer Ball', NULL, 37.50, 6, 5);
INSERT INTO Products (Id, Name, Description, RetailPrice, QtyOnHand, CategoryId)
  VALUES (40, 'Soccer Cleats Sz 9.5', NULL, 120.99, 8, 5);

-- Let's insert the Orders data
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (1, '2019-09-01', '2019-09-04', 1018, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (2, '2019-09-01', '2019-09-03', 1001, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (3, '2019-09-01', '2019-09-04', 1002, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (4, '2019-09-01', '2019-09-03', 1009, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (5, '2019-09-01', '2019-09-01', 1024, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (6, '2019-09-01', '2019-09-05', 1014, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (7, '2019-09-01', '2019-09-04', 1001, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (8, '2019-09-01', '2019-09-01', 1003, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (9, '2019-09-01', '2019-09-04', 1007, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (10, '2019-09-01', '2019-09-04', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (11, '2019-09-02', '2019-09-04', 1020, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (12, '2019-09-02', '2019-09-05', 1024, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (13, '2019-09-02', '2019-09-02', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (14, '2019-09-02', '2019-09-03', 1013, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (15, '2019-09-02', '2019-09-06', 1004, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (16, '2019-09-02', '2019-09-06', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (17, '2019-09-02', '2019-09-03', 1014, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (18, '2019-09-02', '2019-09-03', 1016, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (19, '2019-09-02', '2019-09-06', 1027, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (20, '2019-09-02', '2019-09-02', 1011, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (21, '2019-09-03', '2019-09-03', 1014, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (22, '2019-09-03', '2019-09-07', 1026, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (23, '2019-09-03', '2019-09-04', 1017, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (24, '2019-09-03', '2019-09-05', 1010, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (25, '2019-09-03', '2019-09-04', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (26, '2019-09-04', '2019-09-08', 1013, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (27, '2019-09-04', '2019-09-05', 1014, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (28, '2019-09-04', '2019-09-08', 1004, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (29, '2019-09-04', '2019-09-08', 1015, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (30, '2019-09-04', '2019-09-08', 1010, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (31, '2019-09-05', '2019-09-09', 1014, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (32, '2019-09-05', '2019-09-09', 1012, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (33, '2019-09-05', '2019-09-06', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (34, '2019-09-06', '2019-09-07', 1010, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (35, '2019-09-06', '2019-09-06', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (36, '2019-09-06', '2019-09-07', 1007, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (37, '2019-09-07', '2019-09-11', 1027, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (38, '2019-09-07', '2019-09-11', 1017, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (39, '2019-09-07', '2019-09-10', 1004, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (40, '2019-09-07', '2019-09-07', 1017, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (41, '2019-09-07', '2019-09-07', 1008, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (42, '2019-09-07', '2019-09-10', 1012, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (43, '2019-09-07', '2019-09-11', 1020, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (44, '2019-09-07', '2019-09-08', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (45, '2019-09-08', '2019-09-08', 1008, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (46, '2019-09-08', '2019-09-09', 1018, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (47, '2019-09-08', '2019-09-10', 1023, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (48, '2019-09-08', '2019-09-11', 1004, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (49, '2019-09-08', '2019-09-08', 1015, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (50, '2019-09-08', '2019-09-12', 1002, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (51, '2019-09-08', '2019-09-08', 1018, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (52, '2019-09-09', '2019-09-11', 1001, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (53, '2019-09-09', '2019-09-09', 1004, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (54, '2019-09-09', '2019-09-09', 1007, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (55, '2019-09-09', '2019-09-11', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (56, '2019-09-09', '2019-09-12', 1014, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (57, '2019-09-09', '2019-09-10', 1009, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (58, '2019-09-09', '2019-09-13', 1006, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (59, '2019-09-09', '2019-09-09', 1004, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (60, '2019-09-09', '2019-09-13', 1013, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (61, '2019-09-09', '2019-09-10', 1009, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (62, '2019-09-10', '2019-09-13', 1003, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (63, '2019-09-10', '2019-09-13', 1023, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (64, '2019-09-10', '2019-09-14', 1027, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (65, '2019-09-10', '2019-09-13', 1021, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (66, '2019-09-10', '2019-09-11', 1026, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (67, '2019-09-10', '2019-09-11', 1025, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (68, '2019-09-11', '2019-09-12', 1027, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (69, '2019-09-11', '2019-09-13', 1021, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (70, '2019-09-12', '2019-09-16', 1016, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (71, '2019-09-12', '2019-09-14', 1016, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (72, '2019-09-12', '2019-09-16', 1003, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (73, '2019-09-12', '2019-09-15', 1005, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (74, '2019-09-12', '2019-09-13', 1002, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (75, '2019-09-12', '2019-09-14', 1014, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (76, '2019-09-12', '2019-09-15', 1012, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (77, '2019-09-12', '2019-09-13', 1008, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (78, '2019-09-13', '2019-09-16', 1007, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (79, '2019-09-13', '2019-09-17', 1006, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (80, '2019-09-13', '2019-09-16', 1025, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (81, '2019-09-13', '2019-09-13', 1006, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (82, '2019-09-13', '2019-09-16', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (83, '2019-09-13', '2019-09-16', 1021, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (84, '2019-09-13', '2019-09-13', 1022, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (85, '2019-09-13', '2019-09-15', 1015, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (86, '2019-09-13', '2019-09-16', 1009, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (87, '2019-09-13', '2019-09-14', 1002, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (88, '2019-09-14', '2019-09-17', 1026, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (89, '2019-09-14', '2019-09-17', 1003, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (90, '2019-09-14', '2019-09-15', 1017, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (91, '2019-09-14', '2019-09-18', 1010, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (92, '2019-09-14', '2019-09-17', 1011, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (93, '2019-09-14', '2019-09-17', 1023, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (94, '2019-09-14', '2019-09-14', 1010, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (95, '2019-09-15', '2019-09-19', 1021, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (96, '2019-09-15', '2019-09-16', 1025, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (97, '2019-09-15', '2019-09-18', 1026, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (98, '2019-09-15', '2019-09-16', 1009, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (99, '2019-09-15', '2019-09-18', 1002, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (100, '2019-09-15', '2019-09-16', 1002, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (101, '2019-09-15', '2019-09-18', 1023, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (102, '2019-09-15', '2019-09-17', 1010, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (103, '2019-09-15', '2019-09-16', 1025, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (104, '2019-09-15', '2019-09-15', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (105, '2019-09-16', '2019-09-18', 1005, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (106, '2019-09-16', '2019-09-20', 1020, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (107, '2019-09-16', '2019-09-20', 1001, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (108, '2019-09-16', '2019-09-19', 1004, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (109, '2019-09-16', '2019-09-16', 1013, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (110, '2019-09-17', '2019-09-19', 1015, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (111, '2019-09-17', '2019-09-21', 1021, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (112, '2019-09-18', '2019-09-19', 1009, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (113, '2019-09-18', '2019-09-22', 1010, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (114, '2019-09-18', '2019-09-22', 1011, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (115, '2019-09-19', '2019-09-21', 1003, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (116, '2019-09-19', '2019-09-21', 1004, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (117, '2019-09-20', '2019-09-22', 1005, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (118, '2019-09-20', '2019-09-22', 1021, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (119, '2019-09-20', '2019-09-20', 1013, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (120, '2019-09-20', '2019-09-21', 1024, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (121, '2019-09-20', '2019-09-21', 1025, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (122, '2019-09-20', '2019-09-24', 1009, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (123, '2019-09-20', '2019-09-22', 1004, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (124, '2019-09-21', '2019-09-23', 1007, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (125, '2019-09-21', '2019-09-21', 1011, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (126, '2019-09-22', '2019-09-24', 1016, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (127, '2019-09-22', '2019-09-25', 1009, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (128, '2019-09-22', '2019-09-26', 1022, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (129, '2019-09-22', '2019-09-22', 1007, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (130, '2019-09-22', '2019-09-24', 1011, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (131, '2019-09-22', '2019-09-22', 1014, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (132, '2019-09-22', '2019-09-25', 1007, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (133, '2019-09-22', '2019-09-22', 1027, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (134, '2019-09-22', '2019-09-24', 1003, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (135, '2019-09-23', '2019-09-26', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (136, '2019-09-23', '2019-09-26', 1008, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (137, '2019-09-23', '2019-09-23', 1001, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (138, '2019-09-24', '2019-09-27', 1001, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (139, '2019-09-24', '2019-09-26', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (140, '2019-09-24', '2019-09-24', 1002, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (141, '2019-09-24', '2019-09-27', 1014, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (142, '2019-09-25', '2019-09-29', 1018, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (143, '2019-09-25', '2019-09-28', 1021, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (144, '2019-09-25', '2019-09-29', 1018, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (145, '2019-09-26', '2019-09-30', 1027, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (146, '2019-09-26', '2019-09-26', 1021, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (147, '2019-09-26', '2019-09-26', 1026, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (148, '2019-09-26', '2019-09-30', 1027, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (149, '2019-09-27', '2019-09-28', 1004, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (150, '2019-09-27', '2019-09-27', 1024, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (151, '2019-09-27', '2019-09-28', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (152, '2019-09-28', '2019-10-02', 1017, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (153, '2019-09-29', '2019-09-30', 1003, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (154, '2019-09-29', '2019-10-02', 1001, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (155, '2019-09-29', '2019-10-03', 1004, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (156, '2019-09-29', '2019-09-30', 1004, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (157, '2019-09-29', '2019-10-01', 1010, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (158, '2019-09-29', '2019-10-03', 1021, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (159, '2019-09-29', '2019-10-03', 1005, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (160, '2019-09-30', '2019-09-30', 1021, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (161, '2019-09-30', '2019-09-30', 1011, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (162, '2019-09-30', '2019-10-01', 1021, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (163, '2019-09-30', '2019-09-30', 1004, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (164, '2019-10-01', '2019-10-04', 1021, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (165, '2019-10-02', '2019-10-02', 1017, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (166, '2019-10-03', '2019-10-06', 1022, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (167, '2019-10-03', '2019-10-03', 1017, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (168, '2019-10-03', '2019-10-05', 1027, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (169, '2019-10-03', '2019-10-06', 1025, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (170, '2019-10-04', '2019-10-04', 1004, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (171, '2019-10-04', '2019-10-05', 1026, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (172, '2019-10-04', '2019-10-07', 1018, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (173, '2019-10-04', '2019-10-04', 1015, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (174, '2019-10-04', '2019-10-08', 1006, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (175, '2019-10-04', '2019-10-07', 1013, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (176, '2019-10-04', '2019-10-04', 1025, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (177, '2019-10-04', '2019-10-08', 1008, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (178, '2019-10-04', '2019-10-07', 1022, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (179, '2019-10-04', '2019-10-08', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (180, '2019-10-05', '2019-10-08', 1015, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (181, '2019-10-05', '2019-10-05', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (182, '2019-10-05', '2019-10-06', 1002, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (183, '2019-10-05', '2019-10-05', 1020, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (184, '2019-10-05', '2019-10-09', 1023, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (185, '2019-10-05', '2019-10-09', 1017, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (186, '2019-10-05', '2019-10-05', 1002, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (187, '2019-10-06', '2019-10-07', 1022, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (188, '2019-10-06', '2019-10-07', 1002, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (189, '2019-10-06', '2019-10-07', 1012, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (190, '2019-10-06', '2019-10-10', 1024, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (191, '2019-10-06', '2019-10-07', 1015, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (192, '2019-10-06', '2019-10-09', 1022, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (193, '2019-10-06', '2019-10-06', 1025, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (194, '2019-10-06', '2019-10-08', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (195, '2019-10-07', '2019-10-10', 1025, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (196, '2019-10-07', '2019-10-11', 1009, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (197, '2019-10-07', '2019-10-10', 1002, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (198, '2019-10-07', '2019-10-09', 1002, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (199, '2019-10-07', '2019-10-09', 1008, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (200, '2019-10-07', '2019-10-08', 1026, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (201, '2019-10-07', '2019-10-08', 1018, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (202, '2019-10-07', '2019-10-09', 1020, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (203, '2019-10-08', '2019-10-08', 1023, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (204, '2019-10-08', '2019-10-08', 1026, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (205, '2019-10-08', '2019-10-12', 1006, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (206, '2019-10-08', '2019-10-12', 1021, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (207, '2019-10-08', '2019-10-10', 1015, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (208, '2019-10-09', '2019-10-11', 1019, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (209, '2019-10-10', '2019-10-11', 1002, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (210, '2019-10-10', '2019-10-12', 1024, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (211, '2019-10-10', '2019-10-13', 1014, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (212, '2019-10-10', '2019-10-11', 1007, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (213, '2019-10-11', '2019-10-12', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (214, '2019-10-11', '2019-10-11', 1021, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (215, '2019-10-11', '2019-10-11', 1002, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (216, '2019-10-11', '2019-10-11', 1016, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (217, '2019-10-12', '2019-10-14', 1020, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (218, '2019-10-12', '2019-10-15', 1014, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (219, '2019-10-12', '2019-10-13', 1018, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (220, '2019-10-12', '2019-10-14', 1014, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (221, '2019-10-12', '2019-10-14', 1008, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (222, '2019-10-12', '2019-10-16', 1007, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (223, '2019-10-12', '2019-10-15', 1025, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (224, '2019-10-12', '2019-10-15', 1011, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (225, '2019-10-13', '2019-10-13', 1017, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (226, '2019-10-13', '2019-10-15', 1023, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (227, '2019-10-14', '2019-10-17', 1006, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (228, '2019-10-15', '2019-10-15', 1017, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (229, '2019-10-15', '2019-10-18', 1024, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (230, '2019-10-15', '2019-10-19', 1008, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (231, '2019-10-15', '2019-10-17', 1016, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (232, '2019-10-15', '2019-10-16', 1017, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (233, '2019-10-16', '2019-10-18', 1014, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (234, '2019-10-16', '2019-10-19', 1010, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (235, '2019-10-16', '2019-10-19', 1015, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (236, '2019-10-17', '2019-10-19', 1021, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (237, '2019-10-17', '2019-10-19', 1027, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (238, '2019-10-17', '2019-10-20', 1005, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (239, '2019-10-17', '2019-10-18', 1012, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (240, '2019-10-18', '2019-10-18', 1022, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (241, '2019-10-18', '2019-10-18', 1008, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (242, '2019-10-18', '2019-10-20', 1010, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (243, '2019-10-18', '2019-10-21', 1020, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (244, '2019-10-18', '2019-10-21', 1014, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (245, '2019-10-18', '2019-10-19', 1015, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (246, '2019-10-19', '2019-10-22', 1004, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (247, '2019-10-19', '2019-10-22', 1005, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (248, '2019-10-19', '2019-10-20', 1021, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (249, '2019-10-19', '2019-10-22', 1016, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (250, '2019-10-19', '2019-10-21', 1023, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (251, '2019-10-19', '2019-10-22', 1005, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (252, '2019-10-19', '2019-10-20', 1010, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (253, '2019-10-20', '2019-10-20', 1024, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (254, '2019-10-21', '2019-10-25', 1002, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (255, '2019-10-21', '2019-10-21', 1008, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (256, '2019-10-21', '2019-10-21', 1016, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (257, '2019-10-21', '2019-10-21', 1007, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (258, '2019-10-22', '2019-10-22', 1016, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (259, '2019-10-22', '2019-10-22', 1009, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (260, '2019-10-22', '2019-10-22', 1006, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (261, '2019-10-22', '2019-10-26', 1020, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (262, '2019-10-22', '2019-10-24', 1020, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (263, '2019-10-22', '2019-10-25', 1011, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (264, '2019-10-22', '2019-10-22', 1002, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (265, '2019-10-22', '2019-10-25', 1014, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (266, '2019-10-22', '2019-10-26', 1021, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (267, '2019-10-22', '2019-10-23', 1004, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (268, '2019-10-23', '2019-10-24', 1021, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (269, '2019-10-23', '2019-10-24', 1016, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (270, '2019-10-23', '2019-10-26', 1007, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (271, '2019-10-24', '2019-10-24', 1010, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (272, '2019-10-24', '2019-10-26', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (273, '2019-10-24', '2019-10-24', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (274, '2019-10-24', '2019-10-26', 1004, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (275, '2019-10-24', '2019-10-28', 1009, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (276, '2019-10-24', '2019-10-24', 1018, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (277, '2019-10-24', '2019-10-24', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (278, '2019-10-24', '2019-10-25', 1024, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (279, '2019-10-25', '2019-10-29', 1017, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (280, '2019-10-25', '2019-10-27', 1016, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (281, '2019-10-25', '2019-10-27', 1006, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (282, '2019-10-26', '2019-10-28', 1005, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (283, '2019-10-26', '2019-10-27', 1015, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (284, '2019-10-26', '2019-10-30', 1016, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (285, '2019-10-26', '2019-10-27', 1024, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (286, '2019-10-26', '2019-10-27', 1019, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (287, '2019-10-26', '2019-10-29', 1018, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (288, '2019-10-26', '2019-10-30', 1027, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (289, '2019-10-27', '2019-10-31', 1002, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (290, '2019-10-28', '2019-10-28', 1018, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (291, '2019-10-28', '2019-11-01', 1025, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (292, '2019-10-28', '2019-10-28', 1013, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (293, '2019-10-28', '2019-10-29', 1025, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (294, '2019-10-29', '2019-10-30', 1017, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (295, '2019-10-29', '2019-10-29', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (296, '2019-10-29', '2019-10-29', 1014, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (297, '2019-10-29', '2019-11-01', 1008, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (298, '2019-10-29', '2019-11-01', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (299, '2019-10-30', '2019-11-03', 1021, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (300, '2019-10-30', '2019-10-30', 1011, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (301, '2019-10-30', '2019-11-03', 1025, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (302, '2019-10-30', '2019-11-01', 1007, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (303, '2019-10-31', '2019-11-03', 1011, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (304, '2019-10-31', '2019-11-04', 1015, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (305, '2019-10-31', '2019-11-04', 1013, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (306, '2019-10-31', '2019-11-02', 1026, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (307, '2019-10-31', '2019-11-01', 1013, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (308, '2019-10-31', '2019-11-01', 1002, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (309, '2019-10-31', '2019-11-03', 1020, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (310, '2019-10-31', '2019-11-02', 1025, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (311, '2019-11-01', '2019-11-03', 1003, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (312, '2019-11-01', '2019-11-01', 1003, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (313, '2019-11-01', '2019-11-01', 1024, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (314, '2019-11-01', '2019-11-03', 1007, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (315, '2019-11-01', '2019-11-05', 1024, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (316, '2019-11-01', '2019-11-05', 1018, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (317, '2019-11-01', '2019-11-01', 1012, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (318, '2019-11-01', '2019-11-02', 1024, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (319, '2019-11-02', '2019-11-03', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (320, '2019-11-02', '2019-11-06', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (321, '2019-11-02', '2019-11-04', 1011, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (322, '2019-11-02', '2019-11-03', 1001, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (323, '2019-11-02', '2019-11-04', 1011, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (324, '2019-11-02', '2019-11-03', 1016, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (325, '2019-11-02', '2019-11-03', 1002, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (326, '2019-11-02', '2019-11-06', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (327, '2019-11-02', '2019-11-02', 1012, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (328, '2019-11-02', '2019-11-05', 1009, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (329, '2019-11-03', '2019-11-05', 1004, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (330, '2019-11-03', '2019-11-06', 1021, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (331, '2019-11-03', '2019-11-05', 1018, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (332, '2019-11-04', '2019-11-04', 1006, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (333, '2019-11-04', '2019-11-06', 1003, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (334, '2019-11-04', '2019-11-08', 1009, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (335, '2019-11-04', '2019-11-05', 1020, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (336, '2019-11-05', '2019-11-06', 1020, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (337, '2019-11-05', '2019-11-06', 1011, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (338, '2019-11-05', '2019-11-05', 1009, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (339, '2019-11-05', '2019-11-09', 1005, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (340, '2019-11-05', '2019-11-09', 1026, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (341, '2019-11-06', '2019-11-07', 1022, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (342, '2019-11-07', '2019-11-09', 1013, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (343, '2019-11-07', '2019-11-10', 1025, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (344, '2019-11-07', '2019-11-11', 1005, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (345, '2019-11-07', '2019-11-10', 1008, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (346, '2019-11-07', '2019-11-11', 1001, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (347, '2019-11-08', '2019-11-08', 1020, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (348, '2019-11-08', '2019-11-10', 1015, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (349, '2019-11-08', '2019-11-09', 1001, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (350, '2019-11-08', '2019-11-10', 1019, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (351, '2019-11-09', '2019-11-13', 1012, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (352, '2019-11-09', '2019-11-10', 1020, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (353, '2019-11-09', '2019-11-13', 1026, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (354, '2019-11-10', '2019-11-11', 1021, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (355, '2019-11-10', '2019-11-11', 1014, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (356, '2019-11-10', '2019-11-14', 1018, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (357, '2019-11-10', '2019-11-12', 1003, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (358, '2019-11-10', '2019-11-14', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (359, '2019-11-11', '2019-11-12', 1024, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (360, '2019-11-11', '2019-11-13', 1013, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (361, '2019-11-11', '2019-11-12', 1016, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (362, '2019-11-11', '2019-11-12', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (363, '2019-11-11', '2019-11-12', 1010, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (364, '2019-11-11', '2019-11-14', 1010, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (365, '2019-11-11', '2019-11-12', 1011, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (366, '2019-11-11', '2019-11-12', 1004, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (367, '2019-11-11', '2019-11-11', 1011, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (368, '2019-11-12', '2019-11-13', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (369, '2019-11-12', '2019-11-13', 1003, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (370, '2019-11-12', '2019-11-12', 1025, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (371, '2019-11-12', '2019-11-15', 1009, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (372, '2019-11-12', '2019-11-14', 1025, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (373, '2019-11-12', '2019-11-15', 1014, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (374, '2019-11-12', '2019-11-12', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (375, '2019-11-13', '2019-11-15', 1004, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (376, '2019-11-13', '2019-11-13', 1015, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (377, '2019-11-13', '2019-11-17', 1019, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (378, '2019-11-13', '2019-11-14', 1014, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (379, '2019-11-13', '2019-11-17', 1025, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (380, '2019-11-13', '2019-11-16', 1023, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (381, '2019-11-14', '2019-11-16', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (382, '2019-11-15', '2019-11-15', 1017, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (383, '2019-11-16', '2019-11-19', 1017, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (384, '2019-11-16', '2019-11-16', 1021, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (385, '2019-11-17', '2019-11-20', 1019, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (386, '2019-11-17', '2019-11-17', 1021, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (387, '2019-11-17', '2019-11-21', 1010, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (388, '2019-11-17', '2019-11-21', 1008, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (389, '2019-11-17', '2019-11-20', 1005, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (390, '2019-11-17', '2019-11-20', 1016, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (391, '2019-11-17', '2019-11-17', 1024, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (392, '2019-11-17', '2019-11-21', 1006, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (393, '2019-11-18', '2019-11-20', 1011, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (394, '2019-11-18', '2019-11-21', 1001, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (395, '2019-11-19', '2019-11-23', 1014, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (396, '2019-11-19', '2019-11-20', 1019, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (397, '2019-11-19', '2019-11-19', 1020, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (398, '2019-11-20', '2019-11-22', 1004, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (399, '2019-11-20', '2019-11-23', 1007, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (400, '2019-11-20', '2019-11-24', 1026, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (401, '2019-11-20', '2019-11-21', 1003, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (402, '2019-11-20', '2019-11-22', 1017, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (403, '2019-11-20', '2019-11-20', 1006, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (404, '2019-11-20', '2019-11-21', 1019, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (405, '2019-11-20', '2019-11-23', 1023, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (406, '2019-11-21', '2019-11-25', 1012, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (407, '2019-11-22', '2019-11-25', 1001, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (408, '2019-11-23', '2019-11-27', 1001, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (409, '2019-11-23', '2019-11-24', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (410, '2019-11-23', '2019-11-24', 1008, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (411, '2019-11-24', '2019-11-25', 1002, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (412, '2019-11-24', '2019-11-27', 1026, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (413, '2019-11-24', '2019-11-25', 1001, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (414, '2019-11-24', '2019-11-28', 1020, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (415, '2019-11-24', '2019-11-27', 1013, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (416, '2019-11-24', '2019-11-25', 1024, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (417, '2019-11-24', '2019-11-27', 1017, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (418, '2019-11-24', '2019-11-24', 1012, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (419, '2019-11-25', '2019-11-25', 1006, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (420, '2019-11-25', '2019-11-25', 1024, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (421, '2019-11-25', '2019-11-28', 1022, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (422, '2019-11-25', '2019-11-26', 1027, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (423, '2019-11-25', '2019-11-29', 1010, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (424, '2019-11-25', '2019-11-27', 1025, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (425, '2019-11-26', '2019-11-30', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (426, '2019-11-26', '2019-11-29', 1001, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (427, '2019-11-26', '2019-11-29', 1020, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (428, '2019-11-26', '2019-11-27', 1024, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (429, '2019-11-26', '2019-11-29', 1016, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (430, '2019-11-26', '2019-11-30', 1009, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (431, '2019-11-27', '2019-11-30', 1016, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (432, '2019-11-27', '2019-11-30', 1022, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (433, '2019-11-27', '2019-11-27', 1017, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (434, '2019-11-27', '2019-11-29', 1012, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (435, '2019-11-27', '2019-11-29', 1016, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (436, '2019-11-27', '2019-11-30', 1014, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (437, '2019-11-27', '2019-11-29', 1002, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (438, '2019-11-27', '2019-12-01', 1020, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (439, '2019-11-28', '2019-12-02', 1025, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (440, '2019-11-28', '2019-11-29', 1027, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (441, '2019-11-28', '2019-11-28', 1010, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (442, '2019-11-28', '2019-12-01', 1002, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (443, '2019-11-29', '2019-12-02', 1001, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (444, '2019-11-29', '2019-11-30', 1002, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (445, '2019-11-29', '2019-11-30', 1007, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (446, '2019-11-29', '2019-12-03', 1010, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (447, '2019-11-29', '2019-11-30', 1018, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (448, '2019-11-29', '2019-12-01', 1001, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (449, '2019-11-29', '2019-11-29', 1025, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (450, '2019-11-30', '2019-12-04', 1004, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (451, '2019-11-30', '2019-12-02', 1003, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (452, '2019-11-30', '2019-12-02', 1001, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (453, '2019-11-30', '2019-12-04', 1027, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (454, '2019-11-30', '2019-12-02', 1010, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (455, '2019-11-30', '2019-12-01', 1005, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (456, '2019-12-01', '2019-12-02', 1015, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (457, '2019-12-01', '2019-12-05', 1019, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (458, '2019-12-02', '2019-12-02', 1003, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (459, '2019-12-02', '2019-12-03', 1007, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (460, '2019-12-03', '2019-12-05', 1013, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (461, '2019-12-03', '2019-12-07', 1021, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (462, '2019-12-03', '2019-12-03', 1004, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (463, '2019-12-04', '2019-12-07', 1015, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (464, '2019-12-04', '2019-12-07', 1020, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (465, '2019-12-04', '2019-12-04', 1012, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (466, '2019-12-05', '2019-12-06', 1026, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (467, '2019-12-05', '2019-12-05', 1013, 606);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (468, '2019-12-05', '2019-12-06', 1010, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (469, '2019-12-05', '2019-12-05', 1011, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (470, '2019-12-05', '2019-12-08', 1014, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (471, '2019-12-05', '2019-12-07', 1025, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (472, '2019-12-05', '2019-12-09', 1023, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (473, '2019-12-05', '2019-12-08', 1016, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (474, '2019-12-05', '2019-12-08', 1006, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (475, '2019-12-06', '2019-12-10', 1001, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (476, '2019-12-06', '2019-12-10', 1014, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (477, '2019-12-06', '2019-12-06', 1009, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (478, '2019-12-06', '2019-12-10', 1004, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (479, '2019-12-06', '2019-12-09', 1024, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (480, '2019-12-06', '2019-12-06', 1011, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (481, '2019-12-07', '2019-12-10', 1009, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (482, '2019-12-07', '2019-12-07', 1011, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (483, '2019-12-07', '2019-12-08', 1005, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (484, '2019-12-08', '2019-12-09', 1021, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (485, '2019-12-08', '2019-12-10', 1003, 607);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (486, '2019-12-08', '2019-12-09', 1022, 605);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (487, '2019-12-08', '2019-12-10', 1009, 604);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (488, '2019-12-08', '2019-12-10', 1025, 603);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (489, '2019-12-08', '2019-12-08', 1005, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (490, '2019-12-08', '2019-12-10', 1009, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (491, '2019-12-08', '2019-12-09', 1007, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (492, '2019-12-09', '2019-12-11', 1008, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (493, '2019-12-09', '2019-12-13', 1005, 608);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (494, '2019-12-09', '2019-12-13', 1012, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (495, '2019-12-09', '2019-12-10', 1012, 602);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (496, '2019-12-10', '2019-12-10', 1014, 601);
INSERT INTO Orders
  (Id, OrderDate, ShipDate, CustomerId, EmployeeID)
  VALUES (497, '2019-12-10', '2019-12-11', 1002, 601);
-- last 3 orders have null ShipDate
INSERT INTO Orders
  (Id, OrderDate, CustomerId, EmployeeID)
  VALUES (498, '2019-12-10', 1018, 608);
INSERT INTO Orders
  (Id, OrderDate, CustomerId, EmployeeID)
  VALUES (499, '2019-12-10', 1016, 604);
INSERT INTO Orders
  (Id, OrderDate, CustomerId, EmployeeID)
  VALUES (500, '2019-12-10', 1007, 605);

-- Let's insert some Order Details
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 6, 63.5, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 16, 18.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 26, 139.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (1, 40, 120.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (2, 27, 240.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (2, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 6, 63.5, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 16, 18.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 26, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (3, 36, 26.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (4, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (4, 9, 309.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (4, 17, 75.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (4, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (4, 39, 37.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (5, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (5, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (5, 31, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 2, 38.00, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 12, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 22, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 27, 240.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (6, 32, 32.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (7, 14, 49.95, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (7, 27, 240.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (8, 16, 18.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (8, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (8, 28, 290.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (8, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (8, 40, 120.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (9, 24, 269.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (10, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (10, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 16, 18.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 26, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (11, 36, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (12, 10, 136.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (13, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (13, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (13, 28, 290.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (13, 38, 16.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (14, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (14, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (14, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (15, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (15, 9, 309.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (15, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (15, 29, 6.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (15, 37, 26.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 24, 269.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 29, 6.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 34, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (16, 39, 37.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (17, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (17, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (17, 13, 23.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (17, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (17, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (17, 36, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (18, 12, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (18, 20, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (18, 28, 290.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (18, 36, 26.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 6, 63.25, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 20, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 30, 23.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (19, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (20, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (20, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (21, 3, 75.45, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (21, 13, 23.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (21, 33, 29.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (22, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (22, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (22, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (22, 29, 6.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (22, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 6, 63.5, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 29, 6.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (23, 39, 37.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (24, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (24, 14, 49.95, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (24, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (24, 24, 249.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (24, 29, 6.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (24, 34, 89.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (25, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (25, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (25, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (25, 29, 6.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (25, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (26, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (26, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (26, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (26, 24, 249.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (26, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (26, 36, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (27, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (27, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (27, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (27, 26, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (27, 32, 32.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (27, 38, 16.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (28, 5, 7.25, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (28, 27, 240.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (29, 38, 16.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (30, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (30, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (30, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (30, 29, 6.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (30, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (31, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (32, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (32, 7, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (32, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (32, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (32, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (32, 37, 26.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (33, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (33, 5, 7.45, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (33, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (33, 19, 47.77, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (33, 33, 29.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (33, 39, 37.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (34, 8, 29.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (34, 28, 290.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (35, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (35, 14, 49.95, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (35, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (36, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (37, 8, 29.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (37, 18, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (37, 28, 290.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (37, 38, 16.62, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (38, 39, 37.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 26, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (39, 36, 26.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (40, 6, 63.25, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (40, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (40, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (41, 10, 136.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (41, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (41, 22, 95.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (41, 28, 290.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (41, 34, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (41, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (42, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (42, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (42, 19, 47.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (42, 27, 240.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (42, 35, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 6, 63.25, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 28, 290.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 33, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (43, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (44, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (44, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (44, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (44, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (44, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (44, 38, 16.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 6, 63.25, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 30, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 35, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (45, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (46, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (47, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (48, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (48, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (48, 33, 29.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (49, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (49, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (49, 25, 119.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (49, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (49, 37, 26.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (50, 5, 7.45, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (50, 15, 34.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (50, 25, 119.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (50, 35, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (51, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (52, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 6, 63.5, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 16, 18.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 21, 90.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (53, 39, 37.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (54, 10, 136.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (55, 10, 116.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (56, 6, 63.5, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (56, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (56, 26, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (56, 36, 26.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (57, 1, 13.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (57, 14, 49.95, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (57, 20, 95.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (57, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (57, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (57, 38, 16.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (58, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (58, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (58, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (58, 19, 47.77, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (58, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (58, 37, 26.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 6, 63.5, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (59, 36, 26.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 1, 13.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 6, 63.5, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 28, 290.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 33, 29.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (60, 38, 16.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (61, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (61, 9, 309.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (61, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (61, 25, 139.66, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (61, 33, 29.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (62, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (62, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (62, 27, 220.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (62, 33, 29.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (62, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (63, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (63, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 1, 13.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 6, 61.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 28, 290.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 33, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (64, 38, 16.62, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (65, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (65, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (65, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (65, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 6, 63.5, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (66, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (67, 10, 116.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (67, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (67, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (67, 28, 270.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (67, 34, 89.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (67, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (68, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (69, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (69, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (69, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (69, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (70, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (70, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (70, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (71, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (71, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (71, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (72, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (72, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (72, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (72, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (72, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (73, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (73, 5, 7.25, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (73, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (73, 25, 139.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (73, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (73, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (74, 38, 16.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 9, 309.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 24, 269.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (75, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (76, 18, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (77, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (77, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (77, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (77, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (77, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (77, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (78, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (78, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (78, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (78, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (79, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (79, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (79, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (79, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (79, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (79, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 29, 6.49, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (80, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (81, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (82, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (83, 10, 116.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (83, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (84, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (84, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (84, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (84, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (85, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (85, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (85, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (85, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (85, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 18, 72.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 28, 290.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (86, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (87, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (87, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (87, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (88, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (89, 15, 34.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (89, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (89, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (90, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (91, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (92, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (92, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (92, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (93, 3, 75, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (94, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (94, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (94, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (94, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (94, 32, 30.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (94, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (95, 5, 7.23, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (95, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (95, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (95, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (95, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (96, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (96, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (96, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (96, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (97, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (97, 14, 49.95, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (97, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (98, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (98, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (99, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (99, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (100, 3, 75, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (100, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (100, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (100, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (100, 35, 85.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (101, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (101, 15, 34.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (101, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (101, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (102, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (102, 9, 309.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (102, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (102, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (102, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (103, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (104, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (104, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (105, 2, 38.00, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (105, 8, 29.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (105, 14, 49.95, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (105, 20, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (105, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (105, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (106, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (107, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (107, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (107, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (107, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (107, 37, 24.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (108, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (109, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (110, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (110, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (110, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (110, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (111, 2, 38.00, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (111, 8, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (111, 14, 49.95, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (111, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (111, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (111, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (112, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (112, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (113, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (113, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (113, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (114, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (114, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (115, 8, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (115, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (115, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (115, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (115, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (116, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (116, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (116, 20, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (116, 28, 290.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (116, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (117, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (117, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (117, 18, 72.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (117, 28, 270.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (117, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (117, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (118, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (119, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (120, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (120, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (120, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (120, 25, 139.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (120, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (121, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (121, 14, 49.95, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (121, 29, 6.49, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (122, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (122, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (122, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (122, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (122, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (123, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (123, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (123, 18, 72.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (123, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (123, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (123, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (124, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (124, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (125, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (125, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (125, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 9, 309.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (126, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (127, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (127, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (127, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (127, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (127, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (127, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (128, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (128, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (129, 24, 269.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 18, 72.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (130, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (131, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (131, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (131, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (132, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (132, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (133, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (134, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (134, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (134, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (134, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (134, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (135, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (135, 14, 49.95, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (135, 22, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (135, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (135, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (136, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (136, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (136, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (136, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (136, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (137, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (137, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (137, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (137, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (138, 10, 116.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (138, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (138, 22, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (138, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (138, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (138, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (139, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 32, 30.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (140, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (141, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (141, 5, 7.45, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (141, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (141, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (141, 25, 139.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (141, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (142, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (142, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (143, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (143, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (144, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (144, 14, 49.95, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (144, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (145, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (145, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (146, 18, 72.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (147, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (147, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (147, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (148, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (149, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (149, 38, 15.62, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (150, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (150, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (150, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (150, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (151, 24, 269.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 2, 38.00, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 12, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (152, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (153, 5, 7.45, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (153, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (153, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (153, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (153, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (154, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (154, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (155, 10, 116.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (155, 20, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (155, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (155, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 29, 6.49, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (156, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (157, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (157, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (157, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (157, 33, 27.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (158, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (159, 10, 116.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (159, 20, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (159, 30, 23.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (159, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (160, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (161, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (161, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (161, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (162, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (162, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (163, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (163, 5, 7.45, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (163, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (163, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (163, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (163, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (164, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (164, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 25, 139.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (165, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (166, 5, 7.45, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (166, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (166, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (166, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (166, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (167, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (167, 9, 309.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (167, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (167, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (167, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (168, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (168, 5, 7.45, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (168, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (168, 19, 47.88, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (168, 29, 6.49, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (168, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 24, 269.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 29, 6.49, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (169, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (170, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (170, 5, 7.45, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (170, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (170, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (170, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (170, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (171, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (172, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (172, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (172, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (172, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (173, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (173, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (174, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (174, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (175, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (176, 5, 7.45, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (176, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (176, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (176, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (177, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (177, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (177, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (177, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (177, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (178, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (178, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (178, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (178, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 22, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (179, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (180, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (180, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (181, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (181, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (181, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (181, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (182, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (182, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (182, 18, 72.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (182, 28, 270.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (182, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (182, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 5, 7.45, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 12, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (183, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (184, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (185, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (185, 18, 72.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (185, 28, 270.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (185, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (186, 5, 7.23, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (186, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (187, 22, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (187, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (188, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (188, 37, 24.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (189, 5, 7.23, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (189, 15, 34.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (189, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (189, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (190, 29, 6.49, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (191, 8, 28.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (191, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (191, 18, 72.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (191, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (191, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (191, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (192, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (192, 22, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (192, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (192, 37, 24.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 20, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (193, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (194, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (194, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (194, 31, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (195, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (196, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (196, 7, 1449.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (196, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (196, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (196, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (196, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (197, 18, 72.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (199, 9, 309.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (199, 15, 34.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (199, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (199, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (199, 33, 27.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (199, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (200, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (200, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (200, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (200, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (200, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (200, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (201, 5, 7.23, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (202, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (203, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (203, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (203, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (203, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (203, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (203, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (204, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 34, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (205, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (206, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (206, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (206, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (207, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (207, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 19, 47.88, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 24, 269.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (208, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (209, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (209, 33, 27.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (210, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (211, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (212, 3, 75, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (213, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (213, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (214, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (214, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (214, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (215, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (215, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (215, 18, 72.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (215, 28, 270.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (215, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (215, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (217, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (217, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (217, 30, 23.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (217, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (218, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (218, 5, 7.45,  3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (218, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (218, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (218, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (218, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (219, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (219, 5, 7.45,  4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (219, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (219, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (219, 25, 139.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (219, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 32, 30.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (220, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (221, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (221, 14, 49.95, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (221, 22, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (221, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (221, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (222, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (222, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (222, 24, 269.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (222, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (223, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (223, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (223, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (223, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (224, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (224, 9, 309.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (224, 20, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (224, 28, 270.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (224, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (225, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (225, 7, 1499.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (225, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (225, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (225, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (225, 38, 15.62, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (226, 20, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (226, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (226, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (227, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (228, 17, 70.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (229, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (229, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (230, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (231, 8, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (231, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (231, 18, 72.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (231, 28, 290.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (231, 33, 27.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (231, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (232, 5, 7.45,  1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (232, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (232, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (232, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (232, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (232, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (233, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (233, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (234, 10, 116.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (234, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (235, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (235, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (235, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (235, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 5, 7.45, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 10, 126.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 15, 34.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 20, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (236, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 2, 37.00, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 12, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (237, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (238, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (238, 24, 269.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (238, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (239, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (240, 5, 7.23, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (240, 18, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (240, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (241, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (241, 27, 220.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (241, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (242, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (243, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (244, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (245, 10, 126.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (245, 18, 72.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (245, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (245, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (246, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (246, 15, 34.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (246, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (246, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (246, 33, 27.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (246, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (247, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (247, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (247, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (247, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (247, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (248, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (248, 5, 7.45,  4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (248, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (248, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (248, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (248, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (249, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (249, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (249, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (249, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (249, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (249, 38, 15.62, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (250, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (250, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (250, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (251, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 9, 309.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 14, 49.95, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (252, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (253, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (253, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (254, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (254, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (254, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (255, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 24, 269.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (256, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (257, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (257, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (257, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (257, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (257, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (257, 37, 24.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (258, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (259, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (260, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (260, 9, 309.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (260, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (260, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (260, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (261, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (261, 15, 34.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (261, 28, 270.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (262, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (263, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (263, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (263, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (263, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (264, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 2, 37.00, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 7, 1499.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 17, 70.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (265, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (266, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (266, 9, 309.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (266, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (266, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (266, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (267, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (267, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (267, 38, 15.62, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (268, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 18, 72.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 28, 270.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (269, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (270, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (270, 15, 34.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (270, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (270, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (271, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (271, 9, 309.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (271, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (271, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (271, 35, 85.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (272, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (272, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (272, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (272, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (273, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (273, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (273, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (273, 30, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (273, 38, 15.62, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (274, 18, 72.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (275, 5, 7.45, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (276, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (276, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (276, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (276, 27, 220.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (276, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (277, 12, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (277, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (277, 28, 270.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (277, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (278, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (278, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (278, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (279, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (279, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (279, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (279, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (280, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (280, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (280, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (281, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (282, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (282, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (282, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (283, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (283, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (284, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (285, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (285, 17, 70.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (285, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (285, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (286, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (286, 29, 6.49, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (287, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (287, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (288, 8, 28.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (288, 28, 290.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (289, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (289, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (289, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (289, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (290, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (290, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (290, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (291, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (291, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (291, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (292, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (292, 5, 7.45,  1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (292, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (292, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (292, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (292, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (293, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (293, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (293, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (293, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (293, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (293, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 15, 34.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 20, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (294, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (295, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (295, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (295, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (295, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (295, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (296, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (296, 34, 89.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (297, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (297, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (298, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (298, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (299, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (299, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (300, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (300, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (300, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (300, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (300, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (300, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (301, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (301, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (301, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (302, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (302, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (302, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (303, 8, 28.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (303, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (303, 18, 72.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (303, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (303, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (303, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (304, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (304, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (304, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (304, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (304, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (306, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (306, 20, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (306, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (307, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (307, 5, 7.45,  2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (307, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (307, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (307, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (307, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (308, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (308, 19, 47.88, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (308, 29, 6.49, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (308, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (309, 5, 7.23, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (309, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (309, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (309, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (309, 37, 24.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 24, 269.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (310, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (311, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (311, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (311, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (311, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (312, 15, 34.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (312, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (312, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (312, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (312, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (313, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (313, 15, 34.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (313, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (313, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (314, 20, 95.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (314, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (315, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (315, 5, 7.45,  1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (315, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (315, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (315, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (315, 37, 24.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (316, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (317, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (317, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (317, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (317, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (317, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (318, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (319, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (319, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (320, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (321, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (321, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (321, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (321, 24, 269.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (321, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (321, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (322, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 12, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (323, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (324, 8, 29.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 12, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (325, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (326, 8, 28.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (327, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (327, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (327, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (327, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (327, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (328, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 31, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (329, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (330, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (330, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (330, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (330, 37, 24.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 20, 95.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (331, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (332, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (332, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (332, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (332, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (333, 5, 7.45,  3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (333, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (333, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (333, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (333, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (334, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (334, 7, 1499.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (334, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (334, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (334, 30, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (334, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (335, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (335, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (335, 29, 6.49, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (335, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (336, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (337, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (337, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (337, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (337, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (338, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (338, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (338, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (338, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (338, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (339, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (340, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (340, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (340, 28, 290.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (341, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (342, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (342, 14, 49.95, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (342, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (343, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (343, 14, 49.95, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (343, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (344, 5, 7.23, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (344, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (344, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (344, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (344, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (345, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (345, 9, 309.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (345, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (345, 25, 139.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (345, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (346, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (346, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (346, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (346, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (346, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (347, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (347, 24, 269.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (347, 37, 24.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (348, 5, 7.45,  2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (348, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (348, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (348, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (348, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (349, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (349, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (350, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (351, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (351, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (351, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (351, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (351, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (351, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (352, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (352, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (352, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (353, 40, 120.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (354, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (354, 5, 7.45,  2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (354, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (354, 19, 47.88, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (354, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (354, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (355, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (355, 12, 23.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (355, 20, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (355, 28, 270.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (355, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (356, 2, 37.00, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (356, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (356, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (356, 32, 30.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 12, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (357, 37, 24.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 33, 27.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (358, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 30, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (359, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (360, 37, 24.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (362, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (363, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (364, 3, 75, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (364, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (364, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (365, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (365, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (366, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (367, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (367, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (367, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (367, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (367, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (367, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (368, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (368, 22, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (369, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (370, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (370, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (370, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (370, 28, 290.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (370, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (371, 9, 309.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (371, 22, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (371, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 8, 28.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 18, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 28, 270.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (372, 38, 15.62, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (373, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (374, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (374, 12, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (374, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (374, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (375, 2, 37.00, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (375, 8, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (375, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (375, 20, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (375, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (375, 32, 30.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (376, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (376, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (376, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (376, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (376, 37, 24.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (377, 8, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (377, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (377, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (377, 26, 130.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (377, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (377, 38, 15.62, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 6, 62.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 13, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 18, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 28, 270.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 33, 27.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (378, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (379, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (379, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (379, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (379, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (380, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 22, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 27, 220.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (381, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (382, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (383, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (384, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (384, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 16, 16.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (385, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (386, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (386, 9, 309.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (386, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (386, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (386, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (387, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (388, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (388, 9, 309.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (388, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (388, 25, 139.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (388, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (389, 5, 7.45,  4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (389, 17, 75.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (389, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (389, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (390, 39, 33.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (391, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (391, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (391, 18, 72.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (391, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (391, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (391, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (392, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (392, 11, 135.09, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (392, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (392, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (393, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (393, 28, 270.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (394, 15, 34.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (394, 28, 270.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (395, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (396, 5, 7.45, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (396, 15, 34.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (396, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (396, 35, 85.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (397, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 26, 130.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (398, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (399, 36, 23.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (400, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (400, 5, 7.45,  4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (400, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (400, 19, 47.88, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (400, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (400, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (401, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (401, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (401, 33, 27.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (401, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (402, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (402, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (402, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (402, 29, 6.49, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (402, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 16, 16.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (403, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (404, 2, 38.00, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (405, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (405, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (405, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (405, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (406, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (406, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (406, 22, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (406, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (406, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (407, 5, 7.45,  1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (407, 27, 220.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (408, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (409, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (409, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (409, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (410, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (410, 19, 47.88, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (410, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (411, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (412, 10, 116.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (412, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (412, 22, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (412, 28, 290.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (412, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (412, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (413, 22, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (413, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 11, 135.09, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 20, 95.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (414, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (415, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (415, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (415, 37, 26.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (416, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (416, 5, 7.45,  4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (416, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (416, 19, 45.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (416, 29, 6.49, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (416, 35, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (417, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (418, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (418, 14, 49.95, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (418, 24, 249.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (418, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (419, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (420, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (420, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (420, 22, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (420, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (420, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (421, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (421, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (422, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (422, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (423, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (423, 5, 7.45,  1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (423, 13, 21.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (423, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (423, 32, 32.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (423, 38, 15.62, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (424, 35, 85.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (425, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (425, 29, 6.49, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (425, 35, 85.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (426, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (426, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (426, 30, 23.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (426, 38, 16.62, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (427, 5, 7.45, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (427, 18, 72.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (427, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 15, 34.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 20, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 35, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (428, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (429, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (430, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (431, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (431, 7, 1449.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (431, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (431, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (431, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (431, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (432, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (432, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (432, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 21, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (433, 36, 23.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 31, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (434, 37, 24.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (435, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (436, 15, 34.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (436, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (437, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (437, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (437, 17, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (437, 28, 270.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (437, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 7, 1449.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 12, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 22, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (438, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (439, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (439, 25, 139.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (439, 38, 15.62, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (440, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (440, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 6, 63.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (441, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (442, 12, 23.59, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (442, 20, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (442, 28, 270.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (442, 36, 23.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (443, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (443, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (443, 26, 130.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (443, 31, 21.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (443, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (444, 8, 29.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (444, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (444, 18, 72.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (444, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (444, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (444, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (445, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (445, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (445, 17, 70.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (445, 29, 6.49, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (445, 35, 85.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (446, 15, 34.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (446, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (447, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (447, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (447, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (447, 32, 32.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (447, 40, 120.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (448, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (448, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 11, 135.09, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 16, 18.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 31, 21.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (449, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 21, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (450, 31, 21.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (451, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (452, 39, 33.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (453, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (453, 7, 1449.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (453, 13, 23.59, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (453, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (453, 32, 30.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (453, 38, 15.62, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (454, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (454, 15, 34.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (454, 28, 270.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (455, 18, 75.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (455, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (456, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (457, 2, 37.00, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (457, 10, 116.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (457, 18, 72.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (457, 26, 130.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (457, 34, 89.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (458, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (458, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (458, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (458, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (459, 8, 28.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (459, 18, 72.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (459, 28, 270.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (459, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (460, 6, 62.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (461, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (461, 13, 23.59, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (461, 21, 95.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (461, 29, 6.49, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (461, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (462, 10, 116.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (462, 30, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (463, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (463, 34, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (464, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (464, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (464, 37, 24.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 16, 18.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (465, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (466, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (466, 15, 34.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (466, 21, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (466, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (466, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (466, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (467, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (467, 11, 135.09, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (467, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (468, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (468, 9, 309.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (468, 17, 70.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (468, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (468, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (469, 2, 38.00, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (469, 15, 34.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (469, 28, 270.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (470, 7, 1499.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (470, 15, 34.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (470, 31, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (470, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (471, 34, 89.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (472, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (472, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 10, 126.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 15, 34.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 20, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 25, 139.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (473, 40, 110.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (474, 9, 309.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (474, 15, 34.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (474, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (474, 27, 220.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (474, 33, 27.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (474, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (475, 20, 95.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (475, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (475, 30, 23.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (475, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (475, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (476, 18, 72.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (476, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (477, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (477, 7, 1449.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (477, 13, 21.59, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (477, 19, 45.59, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (477, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (477, 36, 23.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 9, 309.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 14, 49.95, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 19, 47.88, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 24, 249.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 29, 6.49, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (478, 39, 33.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (479, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (479, 7, 1449.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (479, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (479, 27, 220.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (479, 33, 27.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (479, 39, 33.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (480, 6, 62.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (480, 14, 49.95, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (480, 22, 95.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (480, 30, 23.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (480, 38, 15.62, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (481, 7, 1449.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (481, 15, 34.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (481, 31, 21.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (481, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (482, 24, 269.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (483, 6, 63.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (483, 16, 16.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (483, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (483, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 10, 126.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 15, 34.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 20, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 30, 23.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 35, 85.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (485, 40, 110.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 5, 7.45, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 10, 116.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 15, 34.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 20, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 25, 139.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 35, 85.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (486, 40, 120.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (487, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (487, 16, 16.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (487, 26, 130.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (487, 36, 23.50, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (488, 10, 116.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (488, 30, 23.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (489, 5, 7.23, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (489, 25, 139.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (490, 1, 15.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (490, 14, 49.95, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (490, 29, 6.49, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (491, 1, 15.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (491, 7, 1449.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (491, 22, 90.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (491, 28, 290.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (491, 34, 89.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (491, 40, 120.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (492, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (492, 7, 1449.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (492, 13, 23.59, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (492, 26, 130.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (492, 32, 30.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (492, 38, 16.62, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (493, 1, 15.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (493, 30, 23.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (494, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (495, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (495, 15, 34.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (495, 21, 90.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (495, 27, 220.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (495, 33, 27.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (495, 39, 33.50, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (496, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (496, 14, 49.95, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (496, 36, 23.50, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 9, 309.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 14, 49.95, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 19, 47.88, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 24, 269.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 29, 6.49, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 34, 89.99, 4);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (497, 39, 33.50, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 1, 15.99, 5);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 6, 62.50, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 17, 70.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 22, 95.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 27, 220.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 32, 30.99, 2);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (498, 37, 26.50, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (499, 1, 15.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (499, 11, 135.09, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (499, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (499, 34, 89.99, 6);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (500, 1, 15.99, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (500, 11, 135.09, 1);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (500, 21, 95.99, 3);
INSERT INTO Order_Details
  (OrderId, ProductId, QuotedPrice, QtyOrdered)
  VALUES (500, 31, 21.99, 1);

 -- Joiner tables
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (1, 1, 12.99, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (1, 9, 12.49, 7);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (2, 1, 32.69, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (2, 9, 34.77, 7);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (3, 2, 54.19, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (3, 5, 65.27, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (4, 1, 44.22, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (4, 4, 41.62, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (5, 2, 5.38, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (5, 4, 5.87, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (6, 2, 53.22, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (6, 9, 54.73, 7);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (7, 2, 1331.12, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (8, 8, 19.32, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (8, 9, 17.88, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (9, 3, 275.99, 4);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (10, 2, 122.86, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (11, 3, 135.99, 4);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (11, 9, 137.65, 7);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (12, 1, 19.51, 2);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (12, 6, 18.44, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (12, 9, 19.02, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (13, 1, 41.68, 2);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (13, 6, 43.99, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (13, 9, 18.77, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (14, 6, 38.66, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (14, 9, 37.22, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (15, 4, 3.34, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (15, 6, 31.79, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (15, 9, 31.88, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (16, 4, 15.76, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (16, 6, 15.33, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (16, 9, 15.33, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (17, 1, 67.79, 2);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (17, 6, 68.55, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (17, 9, 68.35, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (18, 2, 63.66, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (19, 2, 43.84, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (20, 7, 90.84, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (20, 9, 91.54, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (21, 7, 89.74, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (21, 9, 91.50, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (22, 10, 88.55, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (23, 6, 79.54, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (23, 9, 79.39, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (24, 6, 255.91, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (24, 7, 253.88, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (24, 9, 252.27, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (25, 9, 125.29, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (25, 10, 121.58, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (26, 3, 128.56, 4);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (26, 6, 129.88, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (27, 3, 215.66, 4);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (27, 6, 216.88, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (27, 9, 215.88, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (28, 3, 278.92, 4);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (28, 6, 280.56, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (28, 9, 279.04, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (29, 5, 4.38, 8);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (29, 6, 4.44, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (29, 9, 4.99, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (30, 8, 19.30, 12);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (30, 9, 19.32, 8);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (30, 10, 19.87, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (31, 7, 19.85, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (31, 8, 19.28, 12);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (31, 9, 19.93, 7);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (31, 10, 19.90, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (32, 6, 28.77, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (32, 7, 28.12, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (32, 8, 28.68, 12);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (33, 6, 25.23, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (33, 8, 24.06, 12);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (34, 6, 69.04, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (34, 9, 73.86, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (34, 10, 69.32, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (35, 6, 77.49, 9);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (35, 9, 78.22, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (36, 6, 22.88, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (36, 7, 19.21, 1);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (36, 9, 22.78, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (37, 2, 20.02, 3);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (37, 6, 21.99, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (37, 9, 21.89, 14);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (38, 9, 13.98, 6);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (38, 10, 12.65, 15);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (39, 6, 32.55, 7);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (39, 7, 32.44, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (40, 6, 114.87, 10);
INSERT INTO Product_Vendors
  (ProductId, VendorId, WholesalePrice, DaysToDeliver)
  VALUES (40, 9, 116.35, 14);
