
DROP DATABASE `cinematicketbookingsystem`;
CREATE DATABASE `cinematicketbookingsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cinematicketbookingsystem`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE `movies`;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(100) DEFAULT NULL,
  `synopsis` varchar(100) DEFAULT NULL,
  `release_date` varchar(100) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

SELECT * FROM `movies`;

CREATE TABLE `seatreservation`(
	`id` int NOT NULL AUTO_INCREMENT,
    `movie_id` int NOT NULL,
    `movie_time` datetime,
    `seat_number` varchar(5) NOT NULL,
    `reserved` boolean NOT NULL DEFAULT false,
    PRIMARY KEY (`id`)
);
INSERT INTO `seatreservation` VALUES (1, 1 , 'a1', true);
SELECT * FROM `seatreservation`;


DROP TABLE `halls`;
CREATE TABLE `halls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `seating_rows` int DEFAULT NULL,
  `seating_cols` int DEFAULT NULL,
  `hidenseats` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`));
  
DROP TABLE `showtime`;
CREATE TABLE `showtime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `hall_id` int DEFAULT NULL,
  `showtime` datetime DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE `tickets`;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `showtime_id` int DEFAULT NULL,
  `seat_row` int DEFAULT NULL,
  `seat_col` int DEFAULT NULL,
  `seatCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
  
  

INSERT INTO `users` (`id`,`first_name`,`last_name`,`user_name`,`password`,`role`,`email`,`phone`) VALUES (1,'Administrator',NULL,'admin','password','ADMIN','admin@gmail.com',NULL);
INSERT INTO `users` (`id`,`first_name`,`last_name`,`user_name`,`password`,`role`,`email`,`phone`) VALUES (2,'User Test',NULL,'user','password','USER','user@gmail.com','22695245192');

INSERT INTO `movies` (`id`,`movie_name`,`synopsis`,`release_date`,`price`) VALUES (1,'John Wick 4','With the price on his head ever increasing, legendary hit man John Wick takes his fight against...','1/1/2024',90000.00);
INSERT INTO `movies` (`id`,`movie_name`,`synopsis`,`release_date`,`price`) VALUES (2,'Strange Things','In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploit','2/2/2024',190.00);

INSERT INTO `halls` (`id`,`name`,`seating_rows`,`seating_cols`,`hidenseats`) VALUES (1,'Galaxy 1',5,16,'A5,A6,A7,A8,A9,A10,A11,B5,C5,D5,E5,B11,C11,D11,E11,D1,E1,D16,E16');
INSERT INTO `halls` (`id`,`name`,`seating_rows`,`seating_cols`,`hidenseats`) VALUES (2,'Galaxy 2',8,11,'E1,F1,H1,G1,E11,F11,G11,H11,E2,E3,E4,E5,E6,E7,E8,E9,E10');
INSERT INTO `halls` (`id`,`name`,`seating_rows`,`seating_cols`,`hidenseats`) VALUES (3,'Galaxy 3',12,14,'A4,B4,C4,D4,E4,F4,G4,H4,I4,J4,K4,L4,A11,B11,C11,D11,E11,F11,G11,H11,I11,J11,K11,L11');



INSERT INTO `showtime` (`id`,`movie_id`,`hall_id`,`showtime`,`price`) VALUES (1,1,1,'2023-05-01 10:10:00',60.00);
INSERT INTO `showtime` (`id`,`movie_id`,`hall_id`,`showtime`,`price`) VALUES (2,1,2,'2023-05-01 23:10:00',30.00);
INSERT INTO `showtime` (`id`,`movie_id`,`hall_id`,`showtime`,`price`) VALUES (3,2,1,'2023-05-02 18:10:00',25.00);
INSERT INTO `showtime` (`id`,`movie_id`,`hall_id`,`showtime`,`price`) VALUES (4,2,3,'2023-05-10 21:10:00',98.00);