create database Stocks;
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
