--- Project's tables for SQL Database
--- characters always set to 22 by default

DROP TABLE Categories CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE Employees CASCADE CONSTRAINTS;
DROP TABLE ORDERDETAILS CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE Products CASCADE CONSTRAINTS;
DROP TABLE Suppliers CASCADE CONSTRAINTS;
DROP TABLE Shippers CASCADE CONSTRAINTS;









 CREATE TABLE CUSTOMERS 
 (
 CUSTOMERID CHAR(5) NOT NULL, 
 COMPANYNAME VARCHAR2(40) NOT NULL,
 CONTACTNAME VARCHAR2(30),
 CONTACTTITLE VARCHAR2(30),
 ADDRESS VARCHAR2(60),
 CITY VARCHAR2(15),
 REGION VARCHAR2(15),
 POSTALCODE VARCHAR2(10), 
 COUNTRY VARCHAR2(15),
 PHONE VARCHAR2(24),
 FAX VARCHAR2(24),
 EMAIL VARCHAR2(50),
 CONSTRAINT CUSTOMERS_CUSTOMERID_pk PRIMARY KEY (CUSTOMERID),
 CONSTRAINT CUSTOMERS_EMAIL_UK UNIQUE(EMAIL)
 ); 







CREATE TABLE Employees
(
 EmployeeID NUMBER(8,0) NOT NULL,
 LastName VARCHAR2(20) NOT NULL, 
 FirstName VARCHAR2(10) NOT NULL, 
 Title VARCHAR2(30), 
 TitleOfCourtesy VARCHAR2(25),
 BirthDate  DATE NULL, 
 HireDate  DATE NULL, 
 Address  VARCHAR2(60), 
 City VARCHAR2(15), 
 Region VARCHAR2(15), 
 PostalCode VARCHAR2(10), 
 Country VARCHAR2(15), 
 HomePhone VARCHAR2(24), 
 Extension VARCHAR2(4), 
 Notes VARCHAR2(600), 
 ReportsTo NUMBER(8,0),
 PhotoPath VARCHAR2(255),
 Sin CHAR(9) NULL,
 CONSTRAINT Employees_EmployeeID_pk PRIMARY KEY (EmployeeID),
 CONSTRAINT Employees_Sin_UK UNIQUE(Sin),
 CONSTRAINT Employees_Employees_fk FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
 );

 -- AM I CONNECTING THE TABLE CORRECTLY TO ITSELF AS NEEDED? NO ERRORS ON APEX AT LEAST






CREATE TABLE Shippers
(
ShipperID NUMBER(8,0) NOT NULL,
CompanyName VARCHAR2(40) NOT NULL,
Phone VARCHAR2(24),
CONSTRAINT Shippers_ShipperID_pk PRIMARY KEY (ShipperID)
);





CREATE TABLE Suppliers
(
SupplierID NUMBER(8,0) NOT NULL,
CompanyName VARCHAR2(40) NOT NULL,
ContactName VARCHAR2(30),
ContactTitle VARCHAR2(30),
Address VARCHAR2(60), 
City VARCHAR2(15), 
Region VARCHAR2(15), 
PostalCode VARCHAR2(10),
Country VARCHAR2(15), 
Phone VARCHAR2(24), 
Fax VARCHAR2(24), 
HomePage VARCHAR2(200),
CONSTRAINT Suppliers_SupplierID_pk PRIMARY KEY (SupplierID)
);







CREATE TABLE Categories 
(
CategoryID NUMBER(8,0) NOT NULL, 
CategoryName VARCHAR2(15) NOT NULL, 
CategoryCode NUMBER(6,0) NULL, 
Description  VARCHAR2(300),
CONSTRAINT Categories_CategoryID_pk PRIMARY KEY (CategoryID),
CONSTRAINT Categories_CategoryCode_UK UNIQUE(CategoryCode)
); 











CREATE TABLE ORDERS 
(
ORDERID NUMBER(8,0) NOT NULL, 
CUSTOMERID CHAR(5), 
EMPLOYEEID NUMBER, 
TERRITORYID VARCHAR2(20), 
ORDERDATE   DATE NULL, 
REQUIREDDATE   DATE NULL, 
SHIPPEDDATE   DATE NULL, 
SHIPVIA NUMBER(8,0), 
FREIGHT NUMBER(8,2), 
SHIPNAME VARCHAR2(40), 
SHIPADDRESS VARCHAR2(60), 
SHIPCITY VARCHAR2(15), 
SHIPREGION VARCHAR2(15), 
SHIPPOSTALCODE VARCHAR2(10), 
SHIPCOUNTRY VARCHAR2(15),
CONSTRAINT ORDERS_ORDERID_pk PRIMARY KEY (ORDERID)
);









CREATE TABLE Products
(
ProductID NUMBER(8,0) NOT NULL, 
ProductName VARCHAR2(40) NOT NULL, 
SupplierID NUMBER(8,0), 
CategoryID NUMBER(8,0), 
QuantityPerUnit VARCHAR2(20), 
UnitPrice NUMBER(8,2), 
UnitsInStock NUMBER(6,0), 
UnitsOnOrder NUMBER(6,0), 
ReorderLevel NUMBER(6,0), 
Discontinued NUMBER(1,0) NOT NULL,
CONSTRAINT Products_ProductID_pk PRIMARY KEY (ProductID),
CONSTRAINT  Products_UnitPrice_CK CHECK(UnitPrice >= 0),
CONSTRAINT  Products_ReorderLevel_CK CHECK(ReorderLevel >= 0),
CONSTRAINT  Products_UnitsInStock_CK CHECK(UnitsInStock >= 0),
CONSTRAINT  Products_UnitsOnOrder_CK CHECK(UnitsOnOrder >= 0),
CONSTRAINT Products_Suppliers_fk FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID),
CONSTRAINT Products_Categories_fk FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);


--- Are my Foreign Keys correct?









CREATE TABLE ORDERDETAILS 
(
ORDERID  NUMBER(8,0) NOT NULL, 
PRODUCTID  NUMBER(8,0) NOT NULL, 
UNITPRICE  NUMBER(8,2) NOT NULL, 
QUANTITY  NUMBER(6,0) NOT NULL,
DISCOUNT  NUMBER(2,2) NOT NULL,
CONSTRAINT ORDERDETAILS_ORDERID_PRODUCTID_pk PRIMARY KEY (ORDERID, PRODUCTID),
CONSTRAINT  ORDERDETAILS_DISCOUNT_CK CHECK(DISCOUNT >= 0 AND DISCOUNT <= 1),
CONSTRAINT  ORDERDETAILS_QUANTITY_CK CHECK(QUANTITY > 0),
CONSTRAINT  ORDERDETAILS_UNITPRICE_CK CHECK(UNITPRICE >= 0),
CONSTRAINT ORDERDETAILS_Products_fk FOREIGN KEY(PRODUCTID) REFERENCES Products(ProductID),
CONSTRAINT ORDERDETAILS_ORDERS_fk FOREIGN KEY(ORDERID) REFERENCES ORDERS(ORDERID),
);

--- CONSTRAINT  ORDERDETAILS_DISCOUNT_CK CHECK(DISCOUNT >= 0 AND DISCOUNT <= 1),
--- OrderDetails
--  Check constraints
-- ▪ Discount greater than or equal to 0 and less than or equal 1 (used as a percentage, .05 = 5%)
-- Sth is wrong with it? Can't seem to figure that out right??? 



















