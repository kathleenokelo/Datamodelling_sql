CREATE TABLE `stores` (
  `ID` integer PRIMARY KEY,
  `Name` varchar(50) NOT NULL,
  `Location` varchar(50),
  `Contact` integer
);

CREATE TABLE `employees` (
  `Name` varchar(50),
  `ID` integer NOT NULL,
  `SSN` integer UNIQUE PRIMARY KEY,
  `Gender` varchar(1),
  `DOB` date,
  `Salary` integer,
  `AffiliateStore` integer
);

CREATE TABLE `products` (
  `Name` varchar(50),
  `Quantity` integer,
  `Price` integer,
  `Vendor` varchar(255),
  `StoreID` integer
);

CREATE TABLE `Vendor` (
  `Name` varchar(50) NOT NULL,
  `Address` integer,
  `ContactPerson` integer
);

ALTER TABLE `employees` ADD FOREIGN KEY (`AffiliateStore`) REFERENCES `stores` (`ID`);

ALTER TABLE `products` ADD FOREIGN KEY (`Vendor`) REFERENCES `Vendor` (`Name`);

CREATE TABLE `stores_products` (
  `stores_ID` integer,
  `products_StoreID` integer,
  PRIMARY KEY (`stores_ID`, `products_StoreID`)
);

ALTER TABLE `stores_products` ADD FOREIGN KEY (`stores_ID`) REFERENCES `stores` (`ID`);

ALTER TABLE `stores_products` ADD FOREIGN KEY (`products_StoreID`) REFERENCES `products` (`StoreID`);

