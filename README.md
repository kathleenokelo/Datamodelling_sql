## Data Modelling

This README provides detailed information on the Entity Relationship Diagram (ERD), Relational Schema, and Physical Database design for three distinct sample cases: Art Galleries, PizzaHot and TrueTrade (Stock Exchange).

Deliverables:

ER Diagram, Relational Schema and Physical Database for Art Galleries, PizzaHot and TrueTrade Stock Exchange.

## Table of Contents

 1.Art Galleries
 
-- ER Diagram

-- Relational Schema

-- Physical Database

 2.PizzaHot 
 
-- ER Diagram

-- Relational Schema

-- Physical Database

 3.TrueTrade (Stock Exchange) 
 
-- ER Diagram

-- Relational Schema

-- Physical Database

## ART GALLERIES

### ER Diagram 

The ER Diagram for Art Galleries outlines the relationships and entities required to manage galleries, ,locations, artists, drawings, biostatements and masterpieces. The diagrams uses Crow Foot's notation to represent the cardinality among the various entities involved.
![Art Galleries ERD](https://github.com/kathleenokelo/Datamodelling_sql/assets/170306277/1adcbfce-f957-4a27-9f9c-be433a416fef)

### Relational Schema 

The relational schema converts the ER Diagram into a format suitable for database implementation by adding more information to give a detailed representation of the sysytem.
![Art Galleries Schema](https://github.com/kathleenokelo/Datamodelling_sql/assets/170306277/41731d49-1fab-460f-bb2e-55b12f9fc279)

### Physical Database

The physical database implementation involves creating tables in SQL. Below are the SQL statements for creating the tables and defining their relationships.

[create database art_galleries;
use art_galleries;

CREATE TABLE `Galleries` (
  `GalleryNum` integer PRIMARY KEY,
  `Phone` integer,
  `Hours` timestamp,
  `Intro` varchar(255),
  `LocationID` integer
);

CREATE TABLE `Locations` (
  `ID` integer PRIMARY KEY,
  `Country` varchar(255),
  `State` varchar(255),
  `City` varchar(255),
  `Street` integer,
  `Zipcode` integer
);

CREATE TABLE `Drawings` (
  `DrawingNum` integer PRIMARY KEY,
  `Title` varchar(255),
  `Size` integer,
  `Material` varchar(255),
  `Date` datetime,
  `GalleryNum` integer
);

CREATE TABLE `Artists` (
  `ArtistNum` integer PRIMARY KEY,
  `Name` varchar(255),
  `Phone` integer,
  `Birthday` date,
  `Email` varchar(255)
);

CREATE TABLE `Biostatements` (
  `ArtistNum` integer,
  `Citizenship` varchar(255),
  `Education` varchar(255),
  `Experience` varchar(255)
);

CREATE TABLE `artistsDrawings` (
  `ArtistNum` int,
  `DrawingNum` int
);

CREATE TABLE `masterpieces` (
  `masterpieceID` int PRIMARY KEY,
  `masterpieceName` varchar(255),
  `bioID` int
);

ALTER TABLE `Drawings` ADD FOREIGN KEY (`GalleryNum`) REFERENCES `Galleries` (`GalleryNum`);

ALTER TABLE `Galleries` ADD FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`ID`);

ALTER TABLE `Biostatements` ADD FOREIGN KEY (`ArtistNum`) REFERENCES `Artists` (`ArtistNum`);

ALTER TABLE `artistsDrawings` ADD FOREIGN KEY (`ArtistNum`) REFERENCES `Artists` (`ArtistNum`);

ALTER TABLE `artistsDrawings` ADD FOREIGN KEY (`DrawingNum`) REFERENCES `Drawings` (`DrawingNum`);
ding art galleries_final.sql…]()


## PIZZAHOT

### ER Diagram

The ER Diagram for PizzaHot outlines the relationships and entities involved in managing stores, employees, vendors, and products. The diagram uses Crow's Foot Notation to illustrate one-to-many relationships.
![PizzaHot ERD](https://github.com/kathleenokelo/Datamodelling_sql/assets/170306277/c0bc3ab9-c28e-486b-a0f5-542d77532941)

### Relational Schema

The relational schema converts the ER Diagram into a format suitable for database implementation.
![Pizzahot schema](https://github.com/kathleenokelo/Datamodelling_sql/assets/170306277/9b3f6b8f-0f5c-4622-99af-cea4a758ee15)

### Physical Database

The physical database implementation involves creating tables in SQL. Below are the SQL statements for creating the tables and defining their relationships.

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

## TRUE TRADE STOCK EXCHANGE

### ER Diagram

The ER Diagram for TrueTrade captures the entities and relationships required to manage stocks, customers, portfolios, logs, and transactions. Crow's Foot Notation is used to illustrate the relationships.

![Stocks ERD](https://github.com/kathleenokelo/Datamodelling_sql/assets/170306277/caa6e585-c445-4c79-af4a-8462b6f3f522)

### Relational Schema

The relational schema translates the ER Diagram into a structured format for database implementation.
![stocks_schema](https://github.com/kathleenokelo/Datamodelling_sql/assets/170306277/7b33a5c7-4334-4465-8159-15e1b5841eb5)

### Physical Database

The physical database implementation involves creating tables in SQL. Below are the SQL statements for creating the tables and defining their relationships.

[create database Stocks;
use Stocks;


CREATE TABLE `Stocks` (
  `stockNum` integer PRIMARY KEY NOT NULL,
  `description` varchar(50),
  `exchangemarket` varchar(50),
  `companyname` varchar(50)
);

CREATE TABLE `Customers` (
  `customerID` integer PRIMARY KEY,
  `Name` varchar(255),
  `contact` integer
);

CREATE TABLE `Transactions` (
  `customerID` integer,
  `stockNum` integer,
  `portfolioID` integer,
  `quantity` integer,
  `price` integer,
  `date` date,
  `time` timestamp
);

CREATE TABLE `portfolio` (
  `PortfolioID` integer,
  `CustomerName` varchar(255),
  `Currentvalue` integer,
  `stockNum` integer
);

CREATE TABLE `Logs` (
  `StockNum` integer,
  `Openprice` integer,
  `closePrice` int,
  `date` date
);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`customerID`) REFERENCES `Customers` (`customerID`);

ALTER TABLE `portfolio` ADD FOREIGN KEY (`CustomerName`) REFERENCES `Customers` (`Name`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`stockNum`) REFERENCES `Stocks` (`stockNum`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`portfolioID`) REFERENCES `portfolio` (`PortfolioID`);

CREATE TABLE `Stocks_portfolio` (
  `Stocks_stockNum` integer,
  `portfolio_stockNum` integer,
  PRIMARY KEY (`Stocks_stockNum`, `portfolio_stockNum`)
);

ALTER TABLE `Stocks_portfolio` ADD FOREIGN KEY (`Stocks_stockNum`) REFERENCES `Stocks` (`stockNum`);

ALTER TABLE `Stocks_portfolio` ADD FOREIGN KEY (`portfolio_stockNum`) REFERENCES `portfolio` (`stockNum`);


ALTER TABLE `Stocks` ADD FOREIGN KEY (`stockNum`) REFERENCES `Logs` (`StockNum`);
]()







