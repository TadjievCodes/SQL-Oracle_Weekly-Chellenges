
--- Treehouse exercises   ****** Modifying Data with SQL ****** 
-- Examples of Adding a Row to a Table

--- INSERT INTO <table> VALUES (<value 1>, <value 2>...);
INSERT INTO books VALUES (16, "1984", "George Orwell", "Fiction", 1949);

--If we enter NULL it'll automatically generate the correct id number
INSERT INTO books VALUES (NULL, "1984", "George Orwell", "Fiction", 1949);


--- And if we don't want to add any info to a specific column then again could use NULL LIKE IN THE EXAMPLE BELOW
INSERT INTO books VALUES (NULL, "1984", "George Orwell", "Fiction", NULL);


-- INSERT INTO <table> VALUES (<value 1>, <value 2>...);

INSERT INTO books VALUES (17, "Dune", "Frank Herbert", "Science Fiction", 1965);

-- INSERT INTO <table> (<column 1>, <column 2>...) VALUES (<value 1>, <value 2>...);

INSERT INTO loans (NULL, 2, 4, "2015-12-14", "2015-12-21", NULL);

--- wE COULD ALSO ADD COLUMN NAMES TO MAKE IT CLEARER
--- We have to specify book_id here so Schema knows where to enter the date otherwise error
INSERT INTO loans (book_id, patron_id, loaned_on, return_by) 
VALUES (NULL, 4, "2015-12-14", "2015-12-21");



 --- Adding Multiple Rows to a Table  and separate by comma each line always
INSERT INTO users (username, first_name, last_name) 
    VALUES 
                  ("chalkers", "Andrew", "Chalkley"),
                  ("ScRiPtKiDdIe", "Kenneth", "Love");

INSERT INTO movies (title, genre, year_released) 
     VALUES 
                   ("Starman", "Science Fiction", 1984),
                   ("Moulin Rouge!", "Musical", 2001);




--- ### Week 4 material examples ###

-- Number's first value is integers, second value decimals, so 6 integers but if its (4,2) then the number would be 2456.52
CREATE TABLE test_customer (Id NUMBER(6,0), Name VARCHAR2(20));

-- VARCHAR2 lets us specify how many chracters letters it can have


INSERT INTO test_Customer (Id, Name) VALUES (100,'SMITH');
INSERT INTO test_Customer (Id, Name) VALUES (101,'JONES');

-- Creating a table according to the properties of the existing table
CREATE TABLE cust_marketing AS 
(SELECT id, lastNAme, FirstName, City, Province FROM customers);


-- add a new 4 digit column called ext
-- so by specfiying number and character amount we limit the quantity it can posess
-- ADD IS THE COMMAND KEYWORD AS WELL HERE
ALTER TABLE Vendors ADD(Ext NUMBER(4,0));

-- AND THIS LINE JUST MODIFIES THE DATA WE ADDED EARLIER
ALTER TABLE Vendors MODIFY(Ext NUMBER(5,0));

-- AND TO RETURN TO ITS STATE WE'RE JUST DROPPING THE COLUMN
ALTER TABLE Vendors DROP COLUMN Ext;


-- tHIS IS HOW WE WOULD SET A CONSTRAINT TO SPECIFY WHICH IS THE PRIMARY KEY
CREATE TABLE test_customer
(
Id NUMBER(6,0),
Name VARCHAR2(20),
CONSTRAINT test_customer_Id_pk PRIMARY KEY (Id)
);


-- NOTE - If the column has a Nullable No entry add the key words NOT NULL at the end of the column definition. For example, when creating the Categories table you would enter something like: (don’t add NOT NULL to primary key fields):
-- CategoryName VARCHAR2(15) NOT NULL,


--- ALSO! OrderDetails has a concatenated key, to issue the PK constraint for a concatenated key, you need to do this:
CONSTRAINT OrderDetails_OID_PID_pk PRIMARY KEY (OrderID, ProductID);













-- so we know we need a primary key, so let’s create one. To do so we need something called a constraint.