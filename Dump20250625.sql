-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Лев Толстой'),(2,'Фёдор Достоевский'),(3,'Александр Пушкин'),(4,'Михаил Булгаков'),(5,'Илья Ильф'),(6,'Евгений Петров'),(7,'Антон Чехов'),(8,'Николай Гоголь'),(9,'Иван Тургенев'),(10,'Джордж Оруэлл');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_has_books`
--

DROP TABLE IF EXISTS `authors_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_has_books` (
  `Authors_author_id` int NOT NULL,
  `Books_book_id` int NOT NULL,
  PRIMARY KEY (`Authors_author_id`,`Books_book_id`),
  KEY `fk_Authors_has_Books_Books1_idx` (`Books_book_id`),
  KEY `fk_Authors_has_Books_Authors1_idx` (`Authors_author_id`),
  CONSTRAINT `fk_Authors_has_Books_Authors1` FOREIGN KEY (`Authors_author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `fk_Authors_has_Books_Books1` FOREIGN KEY (`Books_book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_has_books`
--

LOCK TABLES `authors_has_books` WRITE;
/*!40000 ALTER TABLE `authors_has_books` DISABLE KEYS */;
INSERT INTO `authors_has_books` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,5),(7,6),(8,7),(9,8),(1,9),(2,10),(2,11),(7,12),(10,13);
/*!40000 ALTER TABLE `authors_has_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year_published` varchar(255) NOT NULL,
  `available_copies` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Война и мир','1869',1),(2,'Преступление и наказание','1866',1),(3,'Евгений Онегин','1833',1),(4,'Мастер и Маргарита','1967',1),(5,'Двенадцать стульев','1928',1),(6,'Чайка','1896',1),(7,'Мёртвые души','1842',1),(8,'Отцы и дети','1862',1),(9,'Анна Каренина','1877',1),(10,'Идиот','1869',1),(11,'Бесы','1872',1),(12,'Палата №6','1892',1),(13,'1984','1949',1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_categoriesbooks`
--

DROP TABLE IF EXISTS `books_has_categoriesbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_has_categoriesbooks` (
  `Books_idBooks` int NOT NULL,
  `Categoriesbooks_idCategoriesbooks` int NOT NULL,
  PRIMARY KEY (`Books_idBooks`,`Categoriesbooks_idCategoriesbooks`),
  KEY `fk_Books_has_Categoriesbooks_Categoriesbooks1_idx` (`Categoriesbooks_idCategoriesbooks`),
  KEY `fk_Books_has_Categoriesbooks_Books1_idx` (`Books_idBooks`),
  CONSTRAINT `fk_Books_has_Categoriesbooks_Books1` FOREIGN KEY (`Books_idBooks`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_Books_has_Categoriesbooks_Categoriesbooks1` FOREIGN KEY (`Categoriesbooks_idCategoriesbooks`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_categoriesbooks`
--

LOCK TABLES `books_has_categoriesbooks` WRITE;
/*!40000 ALTER TABLE `books_has_categoriesbooks` DISABLE KEYS */;
INSERT INTO `books_has_categoriesbooks` VALUES (1,1),(2,1),(3,1),(6,1),(7,1),(8,1),(4,2),(9,2),(10,2),(11,2),(5,3),(12,4),(5,5),(13,6);
/*!40000 ALTER TABLE `books_has_categoriesbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowings`
--

DROP TABLE IF EXISTS `borrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowings` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `borrow_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `Users_user_id` int NOT NULL,
  `Books_book_id` int NOT NULL,
  PRIMARY KEY (`borrow_id`,`Users_user_id`,`Books_book_id`),
  KEY `fk_Borrowings_Users1_idx` (`Users_user_id`),
  KEY `fk_Borrowings_Books1_idx` (`Books_book_id`),
  CONSTRAINT `fk_Borrowings_Books1` FOREIGN KEY (`Books_book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_Borrowings_Users1` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowings`
--

LOCK TABLES `borrowings` WRITE;
/*!40000 ALTER TABLE `borrowings` DISABLE KEYS */;
INSERT INTO `borrowings` VALUES (1,'2025-05-01 10:00:00','2025-05-05 14:00:00',1,1),(2,'2025-05-02 12:30:00',NULL,1,2),(3,'2025-05-03 15:00:00',NULL,3,3),(4,'2025-05-04 09:00:00','2025-05-10 16:00:00',4,4),(5,'2025-05-05 11:15:00',NULL,5,5),(6,'2025-05-06 13:45:00',NULL,6,6),(7,'2025-05-07 08:10:00',NULL,7,7),(8,'2025-05-08 09:30:00','2025-05-20 10:00:00',1,8),(9,'2025-05-09 14:00:00',NULL,2,9),(10,'2025-05-10 16:20:00','2025-05-29 11:00:00',2,10),(11,'2025-05-11 17:40:00',NULL,3,11),(12,'2025-05-12 18:00:00',NULL,4,12),(24,'2025-05-25 14:36:52','2025-06-01 14:36:52',1,1),(25,'2025-05-25 14:38:25','2025-06-01 14:38:25',1,1),(26,'2025-06-24 19:19:42','2025-07-01 19:19:42',1,1);
/*!40000 ALTER TABLE `borrowings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_borrow_insert` AFTER INSERT ON `borrowings` FOR EACH ROW BEGIN
  INSERT INTO mydb.BorrowLog (borrow_id, log_message, log_time)
  VALUES (NEW.borrow_id, CONCAT('Book ID ', NEW.Books_book_id, ' borrowed by User ID ', NEW.Users_user_id), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `borrowlog`
--

DROP TABLE IF EXISTS `borrowlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowlog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `borrow_id` int DEFAULT NULL,
  `log_message` varchar(255) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowlog`
--

LOCK TABLES `borrowlog` WRITE;
/*!40000 ALTER TABLE `borrowlog` DISABLE KEYS */;
INSERT INTO `borrowlog` VALUES (1,24,'Book ID 1 borrowed by User ID 1','2025-05-25 14:36:52'),(2,25,'Book ID 1 borrowed by User ID 1','2025-05-25 14:38:25'),(3,26,'Book ID 1 borrowed by User ID 1','2025-06-24 19:19:42');
/*!40000 ALTER TABLE `borrowlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Классика'),(2,'Философский роман'),(3,'Юмор'),(4,'Психология'),(5,'Советская литература'),(6,'Антиутопия');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иван Иванов','Читатель','ivanov@mail.com'),(2,'Мария Смирнова','Библиотекарь','smirnova@mail.com'),(3,'Алексей Козлов','Читатель','kozlov@mail.com'),(4,'Ольга Петрова','Читатель','petrova@mail.com'),(5,'Дмитрий Сидоров','Читатель','sidorov@mail.com'),(6,'Наталья Орлова','Читатель','orlova@mail.com'),(7,'Павел Михайлов','Читатель','mihailov@mail.com'),(8,'Петров Даниил','user','petrov@yandex.ru'),(9,'александр александров','Библиотекарь','an@example.com'),(10,'александр александров','Библиотекарь','an@example.com'),(11,'ИВАН ИВАНОВ','Библиотекарь','AAA@AAA');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_bookauthors`
--

DROP TABLE IF EXISTS `view_bookauthors`;
/*!50001 DROP VIEW IF EXISTS `view_bookauthors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_bookauthors` AS SELECT 
 1 AS `title`,
 1 AS `author`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetBookCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetBookCategories`(p_book_id INT) RETURNS text CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE categories_list TEXT DEFAULT '';

  SELECT GROUP_CONCAT(c.name SEPARATOR ', ')
  INTO categories_list
  FROM mydb.Categories c
  JOIN mydb.Books_has_Categoriesbooks bc ON c.category_id = bc.Categoriesbooks_idCategoriesbooks
  WHERE bc.Books_idBooks = p_book_id;

  RETURN categories_list;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
  IN p_name VARCHAR(255),
  IN p_email VARCHAR(255),
  IN p_role VARCHAR(255)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SELECT 'Произошла ошибка при регистрации пользователя.' AS error_message;
    ROLLBACK;
  END;

  START TRANSACTION;

  IF p_role = 'Библиотекарь' OR p_role = 'Читатель' THEN
    INSERT INTO Users (name, email, role)
    VALUES (p_name, p_email, p_role);
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid role. Allowed roles: Библиотекарь, Читатель';
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_bookauthors`
--

/*!50001 DROP VIEW IF EXISTS `view_bookauthors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_bookauthors` AS select `b`.`title` AS `title`,`a`.`name` AS `author` from ((`books` `b` join `authors_has_books` `ab` on((`b`.`book_id` = `ab`.`Books_book_id`))) join `authors` `a` on((`ab`.`Authors_author_id` = `a`.`author_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25  0:05:28
