/*
-- Connectin to GCP
--
--
--
*/



CREATE TABLE Coffee.RawSales( 
    RawSalesID INT NOT NULL AUTO_INCREMENT,
    CustomerFirstName VARCHAR(100),
    CustomerLastName VARCHAR(100),
    StoreName VARCHAR(100),
    StoreAddress VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(2),
    ZipCode INT,
    EmployeeId INT,
    ManagerId INT,
    EmployeeFirstName VARCHAR(100),
    EmployeeLastName VARCHAR(100),
    StoreId INT,
    ProductName VARCHAR(100),
    Price float,
    ProductId INT,
    PRIMARY KEY(RawSalesID)
  )


CREATE TABLE Customer(
    CustomerID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    PRIMARY KEY (CustomerID)
)


CREATE TABLE Store(
    StoreID INT NOT NULL AUTO_INCREMENT,
    StoreName VARCHAR(100) NOT NULL,
    [Address] VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    [State] VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(5) NOT NULL
    PRIMARY KEY (StoreID)
)

CREATE TABLE Employee(
    EmployeeID INT NOT NULL,
    ManagerID INT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    StoreID VARCHAR(100) NOT NULL,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
)

CREATE TABLE Order(
    OrderID INT NOT NULL AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    CustomerID INT NOT NULL,
    StoreID INT NOT NULL,
    OrderDate DATE,
    TotalAmount float,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
)

CREATE TABLE Product(
    ProductID INT NOT NULL AUTO_INCREMENT,
    [Name] VARCHAR(100) NOT NULL,
    Cost VARCHAR(100) NOT NULL,
    Quantity float,
    PRIMARY KEY (ProductID)
)


CREATE TABLE SaleProduct(
    SaleProductID INT NOT NULL AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    PaymentID INT NOT NULL,
    Quantity float,
    Price float,
    PRIMARY KEY (SaleProductID),
    FOREIGN KEY (OrderID) REFERENCES Order(OrderID)
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)


/*
--
--
--
--
*/




/*
--
--
--
--
*/


CREATE TABLE Payment(
    PaymentID INT NOT NULL AUTO_INCREMENT,
    PaymentName VARCHAR(100) NOT NULL,
    Fee FLOAT NOT NULL,
    PRIMARY KEY (PaymentID)
)



/*
--
--
--
--
*/


CREATE TABLE Vendor(
    VendorID INT NOT NULL AUTO_INCREMENT,
    [Name] VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    [Address] VARCHAR(100) NOT NULL,
    [State] VARCHAR(100) NOT NULL,
    [City] VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(5) NOT NULL,
    PaymentMethod VARCHAR(100) NOT NULL,
    PRIMARY KEY (VendorID)
)

CREATE TABLE RawInventory(
    RawInventoryID INT NOT NULL AUTO_INCREMENT,
    Material VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (RawInventoryID)
)

CREATE TABLE InventoryOrders(
    InventoryOrderId INT NOT NULL AUTO_INCREMENT,
    VendorID INT NOT NULL,
    EmployeeID INT NOT NULL,
    RawInventoryID INT NOT NULL,
    PRIMARY KEY (InventoryOrderId),
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (RawInventoryID) REFERENCES RawInventory(RawInventoryID)
)

CREATE TABLE ProductInput(
    ProductInputId INT NOT NULL AUTO_INCREMENT,
    ProductID INT NOT NULL,
    RawInventoryID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (InventoryOrderId),
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (RawInventoryID) REFERENCES RawInventory(RawInventoryID)
)
