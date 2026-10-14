 OnlineShopDB - Full E-commerce Database with Cart
-- Created by Ndikusi100

CREATE DATABASE IF NOT EXISTS OnlineShopDB;
USE OnlineShopDB;

-- Drop tables if they exist (for clean re-run)
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- 1. Customers Table
CREATE TABLE Customers (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

-- 2. Products Table
CREATE TABLE Products (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    WarehouseAmount INT NOT NULL DEFAULT 0 CHECK (WarehouseAmount >= 0)
);

-- 3. Orders Table
CREATE TABLE Orders (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE CASCADE
);

-- 4. OrderItems Table (Products inside an Order)
CREATE TABLE OrderItems (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(ID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ID)
);

-- 5. Cart Table (Shopping Cart before checkout) - THIS WAS MISSING
CREATE TABLE Cart (
    CartID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    AddedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ID)
);

-- Sample Data
INSERT INTO Customers (FirstName, LastName, Email, Address, Phone) VALUES
('John', 'Doe', 'john.doe@gmail.com', 'Mombasa, Kenya', '0712345678'),
('Sebastian', 'Ndikusi', 'ndikusi100@gmail.com', 'Nairobi, Kenya', '0722000000');

INSERT INTO Products (Name, Description, Price, WarehouseAmount) VALUES
('AwesomeProduct', 'Best selling product', 1500.00, 100),
('Laptop', 'HP Laptop 16GB RAM', 85000.00, 20),
('Phone', 'Samsung Galaxy', 45000.00, 50);

INSERT INTO Orders (CustomerID, TotalAmount) VALUES
(1, 1500.00);

INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1500.00);

INSERT INTO Cart (CustomerID, ProductID, Quantity) VALUES
(1, 2, 1),
(2, 1, 2);
