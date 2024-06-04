create database art_galleries;
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
