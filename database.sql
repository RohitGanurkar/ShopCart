-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_users` (
  `user_id` varchar(40) NOT NULL,
  `name` varchar(25) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idapp_user_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES ('61HrtdCW5th3A1lWYF8qHtS6TyA3','rahul','7894561230','rahul@rahul.com','BESDD8QPKZ8J'),('Xw23UTTpH6YHR1oVZcHSaDpxvit2','vishal','1234567','vishal@vishal.com','LNLM7YN57FZI');
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version_code` int NOT NULL,
  `version_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
INSERT INTO `app_version` VALUES (1,1,'1',1,1484386275760,1485795959275),(2,2,'2',1,1485795799112,1485795799112);
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `brief` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'Health & Beauty','1651894646633.png',0,'Bath & Body, Hair care, Fragrances and Makeup','#ff6f52',7,1485609656784,1651894646633),(4,'Consumer Electronics','1651894688745.png',0,'Smart Phones, Tablets, Laptops and Cameras.','#ff870e',6,1485609722495,1651894688745),(10,'Food & Groceries','1651894633368.png',0,'Beverages, Pet Food, Fresh Products','#4db151',1,1650594032643,1652115032226),(11,'Home & Lifestyle','1651894621656.png',0,'Bath, Bedding, Decor. Furniture and Kitchen Dining','#BF360C',2,1650594111068,1651894720377),(12,'Men\'s<br>Clothing','1651893522532.png',0,'T-Shirts, Pants, Polo Shirt, Joggers and shoes','#4186ff',3,1650594230680,1651894358275),(13,'Women\'s Fashion','1651893370423.png',0,'Shirts, Trousers, Kurtas, Muslim Wear and Shoes','#fb0504',3,1650594447057,1651893370423),(14,'Sports & Outdoor','1651894605161.png',0,'Exercise & Fitness tools, Shoes and Supplements','#18ab4e',4,1650594531171,1651894605161),(15,'Babies and Toys','1651894486743.png',0,'Baby accessories, clothing and toys','#fe438e',5,1650594630354,1651894486743);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `code` varchar(50) NOT NULL,
  `grouping` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('EMAIL_ORDER','EMAIL','{\"bcc_receiver\":[\"your-admin1@mail.com\",\"your-admin2@mail.com\"],\"notif_order\":true,\"notif_order_process\":true,\"reply_to\":\"markeet@mail.com\"}'),('EMAIL_SMTP','EMAIL','{\"email\":\"markeet@mail.com\",\"password\":\"YourPassword\",\"host\":\"mail.your-domain.com\",\"port\":\"111\"}'),('EMAIL_TEXT','EMAIL','{\"subject_email_new_order\":\"Market New Order\",\"title_report_new_order\":\"Market New Order\",\"subject_email_order_processed\":\"Order PROCESSED\",\"title_report_order_processed\":\"Order Status Change to PROCESSED\",\"subject_email_order_updated\":\"Order Data Updated\",\"title_report_order_updated\":\"Order Data Updated\"}'),('GENERAL','GENERAL','{\"currency\":\"USD\",\"tax\":11,\"featured_news\":5}'),('NOTIF_KEY','NOTIF','{\"fcm_key\":\"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\",\"one_signal_appid\":\"XXXXXXXXXXXXXXXXXXXXXXX\",\"one_signal_rest_key\":\"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\"}'),('NOTIF_TITLE','NOTIF','{\"new_product\":\"New Product\",\"update_product\":\"Update Product\"}'),('PAYMENT_BANK','PAYMENT','{\"active\":true,\"instruction\":\"<div><b>INSTRUCTION :&nbsp;</b></div><ol><li>Pay an amount of <b>[@amount]</b> to one of our bank numbers, the difference in the amount will cause the order become fail or delay payment confirmation..</li><li>Write the order code <b>[@code]</b> on the pay reference.</li><li>Confirmation by send your&nbsp;<span style=\\\"\\\\&quot;color:\\\" rgb(77,=\\\"\\\" 81,=\\\"\\\" 86);=\\\"\\\" font-family:=\\\"\\\" arial,=\\\"\\\" sans-serif;\\\\\\\"=\\\"\\\">Payment Slip</span>&nbsp;to WhatsApp number&nbsp;<b>123456789</b>&nbsp;or email <b>sample@gmail.com</b></li><li>Your order will be processed and ship immediately.</li></ol><b>BANK ACCOUNT :</b><br><ul><li>BANK XXX : <b>1234567-23671-2367</b> name aExpress Admin</li><li>BANK YYY :&nbsp;<b><b>1234567</b>-23671-2367</b> name aExpress&nbsp;Admin</li></ul>\"}'),('PAYMENT_PAYPAL','PAYMENT','{\"active\":true,\"client_id\":\"YourPaypalClientId\",\"secret\":\"YourPaypalSecretId\",\"mode\":\"SANDBOX\"}'),('PAYMENT_RAZORPAY','PAYMENT','{\"active\":true,\"key_id\":\"rzp_test_wc24Nhpfn6vVML\",\"key_secret\":\"hBWwa5UrVIu2UeQgemaOg3Dv\"}');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `paypal` tinyint(1) NOT NULL,
  `razorpay` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'AFA','Afghanistan afghani',0,0),(2,'ALL','Albanian lek',0,1),(3,'DZD','Algerian dinar',0,1),(4,'AOR','Angolan kwanza reajustado',0,0),(5,'ARS','Argentine peso',0,1),(6,'AMD','Armenian dram',0,1),(7,'AWG','Aruban guilder',0,1),(8,'AUD','Australian dollar',1,1),(9,'AZN','Azerbaijanian new manat',0,0),(10,'BSD','Bahamian dollar',0,1),(11,'BHD','Bahraini dinar',0,0),(12,'BDT','Bangladeshi taka',0,1),(13,'BBD','Barbados dollar',0,1),(14,'BYN','Belarusian ruble',0,0),(15,'BZD','Belize dollar',0,1),(16,'BMD','Bermudian dollar',0,1),(17,'BTN','Bhutan ngultrum',0,0),(18,'BOB','Bolivian boliviano',0,1),(19,'BWP','Botswana pula',0,1),(20,'BRL','Brazilian real',1,0),(21,'GBP','British pound',1,1),(22,'BND','Brunei dollar',0,1),(23,'BGN','Bulgarian lev',0,0),(24,'BIF','Burundi franc',0,0),(25,'KHR','Cambodian riel',0,1),(26,'CAD','Canadian dollar',1,1),(27,'CVE','Cape Verde escudo',0,0),(28,'KYD','Cayman Islands dollar',0,1),(29,'XOF','CFA franc BCEAO',0,0),(30,'XAF','CFA franc BEAC',0,0),(31,'XPF','CFP franc',0,0),(32,'CLP','Chilean peso',0,0),(33,'CNY','Chinese yuan renminbi',1,1),(34,'COP','Colombian peso',0,1),(35,'KMF','Comoros franc',0,0),(36,'CDF','Congolese franc',0,0),(37,'CRC','Costa Rican colon',0,1),(38,'HRK','Croatian kuna',0,1),(39,'CUP','Cuban peso',0,1),(40,'CZK','Czech koruna',1,1),(41,'DKK','Danish krone',1,1),(42,'DJF','Djibouti franc',0,0),(43,'DOP','Dominican peso',0,1),(44,'XCD','East Caribbean dollar',0,0),(45,'EGP','Egyptian pound',0,1),(46,'SVC','El Salvador colon',0,1),(47,'ERN','Eritrean nakfa',0,0),(48,'EEK','Estonian kroon',0,0),(49,'ETB','Ethiopian birr',0,1),(50,'EUR','EU euro',1,1),(51,'FKP','Falkland Islands pound',0,0),(52,'FJD','Fiji dollar',0,1),(53,'GMD','Gambian dalasi',0,1),(54,'GEL','Georgian lari',0,0),(55,'GHS','Ghanaian new cedi',0,0),(56,'GIP','Gibraltar pound',0,1),(57,'XAU','Gold (ounce)',0,0),(58,'XFO','Gold franc',0,0),(59,'GTQ','Guatemalan quetzal',0,1),(60,'GNF','Guinean franc',0,0),(61,'GYD','Guyana dollar',0,1),(62,'HTG','Haitian gourde',0,1),(63,'HNL','Honduran lempira',0,1),(64,'HKD','Hong Kong SAR dollar',1,1),(65,'HUF','Hungarian forint',1,1),(66,'ISK','Icelandic krona',0,0),(67,'XDR','IMF special drawing right',0,0),(68,'INR','Indian rupee',1,1),(69,'IDR','Indonesian rupiah',0,1),(70,'IRR','Iranian rial',0,0),(71,'IQD','Iraqi dinar',0,0),(72,'ILS','Israeli new shekel',1,1),(73,'JMD','Jamaican dollar',0,1),(74,'JPY','Japanese yen',1,0),(75,'JOD','Jordanian dinar',0,0),(76,'KZT','Kazakh tenge',0,1),(77,'KES','Kenyan shilling',0,1),(78,'KWD','Kuwaiti dinar',0,0),(79,'KGS','Kyrgyz som',0,1),(80,'LAK','Lao kip',0,1),(81,'LVL','Latvian lats',0,0),(82,'LBP','Lebanese pound',0,1),(83,'LSL','Lesotho loti',0,1),(84,'LRD','Liberian dollar',0,1),(85,'LYD','Libyan dinar',0,0),(86,'LTL','Lithuanian litas',0,0),(87,'MOP','Macao SAR pataca',0,1),(88,'MKD','Macedonian denar',0,1),(89,'MGA','Malagasy ariary',0,0),(90,'MWK','Malawi kwacha',0,1),(91,'MYR','Malaysian ringgit',1,1),(92,'MVR','Maldivian rufiyaa',0,1),(93,'MRO','Mauritanian ouguiya',0,0),(94,'MUR','Mauritius rupee',0,1),(95,'MXN','Mexican peso',1,1),(96,'MDL','Moldovan leu',0,1),(97,'MNT','Mongolian tugrik',0,1),(98,'MAD','Moroccan dirham',0,1),(99,'MZN','Mozambique new metical',0,0),(100,'MMK','Myanmar kyat',0,1),(101,'NAD','Namibian dollar',0,0),(102,'NPR','Nepalese rupee',0,1),(103,'ANG','Netherlands Antillian guilder',0,0),(104,'NZD','New Zealand dollar',1,1),(105,'NIO','Nicaraguan cordoba oro',0,1),(106,'NGN','Nigerian naira',0,0),(107,'KPW','North Korean won',0,0),(108,'NOK','Norwegian krone',1,1),(109,'OMR','Omani rial',0,0),(110,'PKR','Pakistani rupee',0,1),(111,'XPD','Palladium (ounce)',0,0),(112,'PAB','Panamanian balboa',0,0),(113,'PGK','Papua New Guinea kina',0,1),(114,'PYG','Paraguayan guarani',0,0),(115,'PEN','Peruvian nuevo sol',0,1),(116,'PHP','Philippine peso',1,1),(117,'XPT','Platinum (ounce)',0,0),(118,'PLN','Polish zloty',1,0),(119,'QAR','Qatari rial',0,1),(120,'RON','Romanian new leu',0,0),(121,'RUB','Russian ruble',1,1),(122,'RWF','Rwandan franc',0,0),(123,'SHP','Saint Helena pound',0,0),(124,'WST','Samoan tala',0,0),(125,'STD','Sao Tome and Principe dobra',0,0),(126,'SAR','Saudi riyal',0,1),(127,'RSD','Serbian dinar',0,0),(128,'SCR','Seychelles rupee',0,1),(129,'SLL','Sierra Leone leone',0,1),(130,'XAG','Silver (ounce)',0,0),(131,'SGD','Singapore dollar',1,1),(132,'SBD','Solomon Islands dollar',0,0),(133,'SOS','Somali shilling',0,1),(134,'ZAR','South African rand',0,1),(135,'KRW','South Korean won',0,0),(136,'LKR','Sri Lanka rupee',0,1),(137,'SDG','Sudanese pound',0,0),(138,'SRD','Suriname dollar',0,0),(139,'SZL','Swaziland lilangeni',0,1),(140,'SEK','Swedish krona',1,1),(141,'CHF','Swiss franc',1,1),(142,'SYP','Syrian pound',0,0),(143,'TWD','Taiwan New dollar',1,0),(144,'TJS','Tajik somoni',0,0),(145,'TZS','Tanzanian shilling',0,1),(146,'THB','Thai baht',1,1),(147,'TOP','Tongan paanga',0,0),(148,'TTD','Trinidad and Tobago dollar',0,1),(149,'TND','Tunisian dinar',0,0),(150,'TRY','Turkish lira',0,0),(151,'TMT','Turkmen new manat',0,0),(152,'AED','UAE dirham',0,0),(153,'UGX','Uganda new shilling',0,0),(154,'XFU','UIC franc',0,0),(155,'UAH','Ukrainian hryvnia',0,0),(156,'UYU','Uruguayan peso uruguayo',0,1),(157,'USD','US dollar',1,1),(158,'UZS','Uzbekistani sum',0,1),(159,'VUV','Vanuatu vatu',0,0),(160,'VEF','Venezuelan bolivar fuerte',0,0),(161,'VND','Vietnamese dong',0,0),(162,'YER','Yemeni rial',0,1),(163,'ZMK','Zambian kwacha',0,0),(164,'ZWL','Zimbabwe dollar',0,0);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fcm`
--

DROP TABLE IF EXISTS `fcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device` varchar(100) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `app_version` varchar(10) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `regid` text NOT NULL,
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fcm`
--

LOCK TABLES `fcm` WRITE;
/*!40000 ALTER TABLE `fcm` DISABLE KEYS */;
INSERT INTO `fcm` VALUES (4,'Device Name','6.0.1','1.0','GGC00C0888E426A','APA91bEj7qmlVePXUpG4UjKOtyqG5x9hpeZ4tMhPDsJgDRWL76psPGtckLK3uMtmpLFj3RSFfgaVoBMCKhg5iR8RnPZPjeuml8Llgkc',0,0),(7,'sadasd','1','1','sad','sadasd',1645142830603,1645142830603);
/*!40000 ALTER TABLE `fcm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_info`
--

DROP TABLE IF EXISTS `news_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `brief_content` varchar(200) NOT NULL,
  `full_content` text NOT NULL,
  `image` varchar(110) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_info`
--

LOCK TABLES `news_info` WRITE;
/*!40000 ALTER TABLE `news_info` DISABLE KEYS */;
INSERT INTO `news_info` VALUES (1,'Available Best Interior Stuff, Browse and Discover Now for Your Room.','Quisque efficitur diam sit amet quam porttitor, at dictum arcu viverra. Vivamus dapibus ante nunc, non malesuada enim gravida in.','<div>Aliquam sed lorem quis urna eleifend aliquam ac ut urna. Sed tempus nisl tellus, vel tempor velit rutrum ac. Ut facilisis eget augue quis pulvinar. Nam a felis eu tortor convallis dapibus efficitur vel turpis. Etiam hendrerit pulvinar leo ac venenatis. Donec non felis et massa semper convallis nec id augue. Proin sit amet mollis nisl. Sed vestibulum auctor imperdiet. Nam ut enim non lacus blandit rhoncus non at turpis. Donec vel arcu malesuada, vulputate dui a, varius leo. Proin volutpat libero ultricies est auctor, eget facilisis ligula accumsan. Sed quis sapien hendrerit, luctus augue nec, aliquam urna. Mauris vestibulum convallis malesuada. Sed et ex cursus, fringilla tellus ac, maximus ipsum.</div><div><br></div><div>Sed viverra arcu in neque pulvinar dignissim. Nunc euismod aliquam magna, non efficitur lectus vehicula quis. Suspendisse vitae consequat arcu, eget malesuada dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec quis imperdiet libero. Donec imperdiet quis lectus vitae dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam pulvinar pretium ipsum, et faucibus libero aliquet et. Quisque efficitur diam sit amet quam porttitor, at dictum arcu viverra. Vivamus dapibus ante nunc, non malesuada enim gravida in. Cras bibendum eros vitae lacus efficitur, vel pretium est rutrum.</div><div><br></div><div>Praesent id efficitur risus. Nullam dui ligula, eleifend in convallis at, porta vitae massa. Curabitur sapien lorem, congue non enim non, rutrum gravida ipsum. Duis dignissim sapien in sem finibus ultrices id nec justo. Nulla hendrerit sed eros ac rhoncus. Nullam varius tellus id venenatis cursus. Cras commodo metus mauris, eget posuere sapien blandit non. Aenean fermentum ligula a libero suscipit dictum. Nulla dictum odio ut vulputate aliquam. Suspendisse potenti. Cras pellentesque vel felis sed dignissim. Proin aliquet orci tincidunt dui convallis, facilisis accumsan urna semper.</div>','Available Best Interior Stuff Browse and Discover Now for Your Room.jpg',0,'FEATURED',1482250793274,1651891784293),(2,'We Join Smartphone Fair  in Washington, D.C. April 7-8, 2017. Visit and Purchase our Product.','Aenean eu libero eget lorem tincidunt eleifend. Integer in diam felis. Proin sit amet mollis nisl.','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque urna ut metus sagittis, vel congue lorem iaculis. Sed hendrerit mauris id tempor faucibus. In facilisis nibh vulputate ante porttitor, et venenatis arcu placerat. Vestibulum tempor nisi enim, eget consectetur ex accumsan fermentum. Mauris ipsum lacus, imperdiet eget purus vel, convallis euismod augue. In sed fringilla sem. Aenean ultricies ullamcorper euismod.</div><div><br></div><div>Cras non nunc est. Nunc quis dapibus lorem. Proin dignissim interdum interdum. In vitae aliquet odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non venenatis nunc, id molestie velit. Vestibulum sagittis dui at nibh lacinia faucibus. Curabitur auctor sem diam. Aenean eu libero eget lorem tincidunt eleifend. Integer in diam felis.</div><div><br></div><div>Aliquam sed lorem quis urna eleifend aliquam ac ut urna. Sed tempus nisl tellus, vel tempor velit rutrum ac. Ut facilisis eget augue quis pulvinar. Nam a felis eu tortor convallis dapibus efficitur vel turpis. Etiam hendrerit pulvinar leo ac venenatis. Donec non felis et massa semper convallis nec id augue. Proin sit amet mollis nisl. Sed vestibulum auctor imperdiet. Nam ut enim non lacus blandit rhoncus non at turpis. Donec vel arcu malesuada, vulputate dui a, varius leo. Proin volutpat libero ultricies est auctor, eget facilisis ligula accumsan. Sed quis sapien hendrerit, luctus augue nec, aliquam urna. Mauris vestibulum convallis malesuada. Sed et ex cursus, fringilla tellus ac, maximus ipsum.</div>','We Join Smartphone Fair  in Washington DC April 78 2017 Visit and Purchase our Product.jpg',0,'FEATURED',1485793148268,1651891897694),(10,'Unique Women\'s Accessories Trend that Will Popular Current Season','Cras in dapibus ligula. Vestibulum elementum ante at sapien consectetur porta.','<div>Cras in dapibus ligula. Vestibulum elementum ante at sapien consectetur porta. Nulla laoreet mauris a orci posuere eleifend. Duis dictum nisl scelerisque lectus tincidunt, id tristique lorem eleifend. Curabitur nibh risus, commodo in consequat eget, consectetur vel tellus. Suspendisse dignissim, lorem ut luctus congue, mi justo lobortis ex, non suscipit est est id urna. Ut eget tortor accumsan, consectetur justo sit amet, tincidunt enim.</div><div><br></div><div>Proin efficitur justo eget tempus vulputate. Nunc viverra felis tortor, a porttitor tortor vehicula dictum. Nam quis sapien nec tellus ultricies dictum. Praesent vulputate dolor sed nisl consectetur, vel varius dui suscipit. Maecenas vulputate ligula a sem sollicitudin viverra. In a libero viverra, eleifend nisi vitae, vehicula arcu. Donec sagittis sem sit amet nulla aliquam, a convallis risus ultricies. Praesent tristique magna odio, a dictum felis hendrerit quis.</div>','Unique Womens Accessories Trend that Will Popular Current Season.jpg',0,'FEATURED',1485992959638,1651891961524);
/*!40000 ALTER TABLE `news_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(110) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `price_discount` double NOT NULL DEFAULT '0',
  `stock` int NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_unique_name` (`name`),
  FULLTEXT KEY `product_fulltext` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (122,'Samsung Galaxy A12','1650594805353.jpg',25000.00,0,20,0,'<b>Samsung Galaxy A12 - A New Series Of The Company&nbsp;</b><div>Samsung after A11 brings now A12, which will be the new series of the company. The specs of the smartphone according to the new information is that it will be a mid-range smartphone and will be the first smartphone of the series. The Samsung Galaxy A12 will be packing a MediaTek Helio P35 chipset. The internal storage capacity of the coming smartphone is 64 gigabytes which means that Samsung\'s Galaxy A12 has got two variants. One will be a budget phone and the other one will be a bit expensive. The internal storage capacity of the coming handset Samsung Galaxy A12\'s can be increased by using the dedicated slot. So, there will be no issue with storage whether you go for the budget smartphone or buy the expensive variant of the Galaxy A12 by Samsung. The RAM that is embedded in the smartphone is 4 gigabytes of RAM. The RAM capacity is also different for both the variants of the smartphone. The new Samsung A12 is equipped with a PLS IPS Capacitive touchscreen that measures 6.5 inches and provides full HD plus the resolution of 720 x 1600 Pixels. On the rear of the smartphone that is called Samsung Galaxy\'s A12, there will be a triple rear camera setup. The main sensor of the back camera setup will be 48 megapixels, The macro lens will be 5 megapixels and the macro and depth sensors will be pairs of 2 megapixels as usual. Samsung Galaxy A12 has got 8 megapixels of the front-facing camera. The new handset will be pacing a ton of features that will the image quality of both camera setups. The smartphone Galaxy A12\'s to have a Li-Po Non-removable 5000 mAh battery and fingerprint facility at the rear to protect the smartphone.</div><div><br></div><div><ul class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6b05UGiKUGiKPl\" style=\"margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, &quot;system-ui&quot;, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Awesome screen built for cinema</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">6.5\" Display</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Stylish look, comfortable hold</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Awesome Quad camera to capture more</li><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.6b05UGiKUGiKPl\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">48 MP Main Camera</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">8 MP Selfie Camera</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">4 GB RAM</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">64 GB Internal Memory</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">5000 mAh Battery</li></ul></div>','READY STOCK',1650594805353,1650595231617),(123,'Apple iPhone 13 Pro Max','1650595275667.jpg',320450.00,0,20,0,'<div><b>Apple iPhone 13 Pro Max - A Flagship Smartphone From The Company<br></b></div>Apple will launch its upcoming iPhone 13 that is the high-end Pro Max version of the series. Lost a few days ago, we learned that the Pro and Pro Max will reportedly have Samsungâ€™s OLED screens with a refresh rate of 120 Hz. Information on the design of the iPhone 13 series is now appearing. Let\'s talk about the upcoming new Apple iPhone 13 Pro Max. The smartphone got a Chipset of Apple A15 Bionic which is the most powerful chipset and to give more power to this device it has a 3.22 Hexa Core processor inside the Apple\'s iPhone 13 Pro Max to make the device ultra fast. And also there is a GPU of Apple GPU 5-core graphics under the hood of this smartphone. The display screen size of the smartphone is 6.7 Inches and It will provide the user with full HD plus the resolution of 1284 x 2778 Pixels. The Apple iPhone 13\'s having a Super Retina XDR OLED Capacitive Touchscreen display that is the latest one and well known for its outstanding results. In the protection of this smartphone, it has a Scratch-resistant glass, oleophobic coating. This iPhone 13 Pro Max by Apple got 6 gigabytes of RAM which gives this handset more power. The handset has got 128 gigabytes of internal memory which is more than enough to store your data. There is a Quad Camera setup in the back of this new Apple 13 Pro Max. The main camera is 12 megapixels wide, and another one is also 12 megapixels telephoto, 12 megapixels ultrawide, and the depth sensor is TOF 3D LiDAR megapixels. On the front, there is a Dual 12 megapixels selfie camera in Apple iPhone\'s 13 Pro Max. There is a Face ID reader in this smartphone to protect your data. And you will find an IP68 dust/water resistant up to 6m for 30 mins. The battery of the upcoming iPhone 13 Pro Max is also a massive one. The handset is fueled with a 4352 mAh battery to get enough backup time and the smartphone also got a Fast battery charging. Now Samsung and other smartphone companies will have a competitor in the market when 13 Pro Max lunched.','READY STOCK',1650595275667,1650595275667),(124,'Apple iPad Air 5','1650595664491.jpg',125999.00,0,20,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650595664491,1650595664491),(125,'Samsung Galaxy S21 FE','https://m.media-amazon.com/images/I/71C9PdsIQbL._SX679_.jpg',136499.00,0,20,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650595860277,1650595860277),(126,'Zeppelin Black Sweatshirt','1650595981781.jpg',20.00,0,20,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650595981781,1650595981781),(127,'Pure Cotton Polo Shirt Men\'s T-shirt','1650596278295.png',19.50,0,39,0,'<h1 class=\"product-title-text\" data-spm-anchor-id=\"a2g0o.detail.1000016.i2.3fa446f3fjvaDU\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; color: rgb(34, 34, 34); font-weight: 500; font-size: 14px; line-height: 19px; width: fit-content; font-family: &quot;Open Sans&quot;, Roboto, Arial, Helvetica, sans-serif, SimSun;\"><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></h1>','READY STOCK',1650596278295,1650596278295),(128,'DYXUE Brand Tops 2022 Polos Short Sleeve Logo Male Polo Shirt','1650596360426.jpg',22.30,0,67,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650596360426,1650596360426),(129,'Men Casual T-shirt + Shorts 2-piece Suit','1650596484907.jpg',14.75,0,22,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650596484907,1650596484907),(130,'Handmade Retro Leisure Loafers Shoes','1650596741171.jpg',22.00,0,22,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650596741171,1650596741171),(131,'Summer Beach Flip Flops','1650596899814.jpg',12.00,0,12,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650596899814,1650596899814),(132,'Basketball Shoes','1650596971145.jpg',44.00,0,22,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650596971145,1650596971145),(133,'Retro Kimono Blouse Chic Blusas Tops','1650597296069.jpg',10.63,0,33,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597296069,1650597296069),(134,'Floral Print Chiffon Smock Blouse','1650597358780.jpg',19.13,0,33,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597358780,1650597358780),(135,'Geometric Print Smock Blouse Office Lady','1650597394607.jpg',10.69,0,33,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597394607,1650597394607),(136,'Colorful Graffiti Print Perspective Smock Blouse','1650597472662.jpg',13.55,0,22,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597472662,1650597472662),(137,'Sequin Denim Jacket Womens Jacket','1650597531113.jpg',43.33,0,44,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597531113,1650597531113),(138,'Hollow Hole Belt Harajuku Autumn Denim Coat','1650597635161.jpg',65.34,0,45,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597635161,1650597635161),(139,'Zevity Women Vintage Contrast Color Graffiti Print Chiffon Blouse','1650597697142.jpg',34.00,0,44,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597697142,1650597697142),(140,'Korean Loose Short Cowboy Outerwear','1650597798314.jpg',46.00,0,33,0,'<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>','READY STOCK',1650597798314,1650597798314);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `product_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  KEY `fk_product_category_1` (`product_id`),
  KEY `fk_product_category_2` (`category_id`),
  CONSTRAINT `fk_product_category_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_category_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (122,4),(123,4),(124,4),(125,4),(126,12),(127,12),(128,12),(129,12),(130,12),(131,12),(132,12),(133,13),(134,13),(135,13),(136,13),(137,13),(138,13),(139,13),(140,13);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `product_id` bigint NOT NULL,
  `name` varchar(200) NOT NULL,
  KEY `fk_table_images` (`product_id`),
  CONSTRAINT `fk_table_images` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(80) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `shipping` varchar(20) NOT NULL,
  `shipping_location` varchar(50) NOT NULL,
  `shipping_rate` decimal(12,2) NOT NULL DEFAULT '0.00',
  `date_ship` bigint NOT NULL,
  `phone` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `payment_data` text NOT NULL,
  `total_fees` decimal(12,2) NOT NULL,
  `tax` decimal(12,2) NOT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (2,'JZ16066ON','asad','sadsdasd','asad@asad.c','Economy','New York, US',20.00,1653625766556,'3234234','456465456','WAITING','','','',73.26,11.00,'cab8c1a4e4421a3b',1651897721259,1651897721259,NULL),(3,'DN83125YJ','asad','sadsdasd','asad@asad.c','Economy','New York, US',0.00,1652809196840,'3234234','','WAITING','','','',48.84,11.00,'cab8c1a4e4421a3b',1652117984028,1652117984028,NULL),(4,'DT01761EK','asad','sadsdasd','asad@asad.c','','',0.00,1652809196840,'3234234','','WAITING','','','',48.84,11.00,'cab8c1a4e4421a3b',1652117984028,1652117984028,NULL),(5,'DY61322KT','asad','sadsdasd','asad@asad.c','','',0.00,1652809196840,'3234234','','WAITING','','','',48.84,11.00,'cab8c1a4e4421a3b',1652117984028,1652117984028,NULL),(6,'GI80721WN','asad','sadsdasd','asad@asad.c','','',0.00,1652809196840,'3234234','','WAITING','','','',48.84,11.00,'cab8c1a4e4421a3b',1652117984028,1652117984028,NULL),(7,'JH52666FC','asad','sadsdasd','asad@asad.c','','',0.00,1652809196840,'3234234','','WAITING','','','',48.84,11.00,'cab8c1a4e4421a3b',1652117984028,1652117984028,NULL),(8,'NF76053YC','asad','sadsdasd','asad@asad.c','','',0.00,1652809196840,'3234234','','WAITING','','','',48.84,11.00,'cab8c1a4e4421a3b',1652117984028,1652117984028,NULL),(9,'AN36957ZJ','some name','some address','some@gmail.com','','',0.00,1652188334810,'+9212345678','asdasdasdasd','WAITING','','','',51.06,11.00,'cab8c1a4e4421a3b',1652188334810,1652188334810,NULL),(10,'MW33936WE','asad','some address','asad@gmail.com','','',0.00,1652188585327,'123456789','some additional comments','WAITING','','','',51.06,11.00,'cab8c1a4e4421a3b',1652188585327,1652188585327,NULL),(11,'TJ74571FX','some name here','sadsadasd','some@gmail.com','','',0.00,1652188632869,'123456789','asdasdasdasdasd','WAITING','RAZORPAY','','order_JTXfdqL1TfmDRT',51.06,11.00,'cab8c1a4e4421a3b',1652188632869,1652188632869,NULL),(43,'M43O6DBKU8YO','rahul','sarni','rahul@vishu.c','Economy','New York, US',20.00,1653625766556,'3234234','456465456','WAITING','','','',73.26,11.00,'xkfmykalrdom',1651897721259,1651897721259,NULL),(44,'4UK6LLU494X7','krishna','ward 1','rahul@vishu.c','paying','New York, US',20.00,1653625766556,'3234234','456465456','WAITING','','','',400.26,11.00,'dzrmfornbkys',1651897721259,1651897721259,NULL),(45,'NRPG3WUNM46A','anup','mehar','anup@gmail','','',0.00,1655057316569,'1234567890','plz delevri fast ','WAITING','','','',54.33,11.00,'bybfrwhtcvqd',1655057316569,1655057316569,NULL),(46,'1IB0EIX1FI6R','sssss','ssssssssss','ssssssss','','',0.00,1655059711094,'124578125','ssssss','WAITING','','','',21.65,11.00,'dyhuthmsmsjn',1655059711094,1655059711094,NULL),(47,'IN8PC0XTYXTK','fffff','ffffffff','fffffffffff','','',0.00,1655060050270,'12548','ffffffff','WAITING','','','',151513.89,11.00,'jaamtufdethd',1655060050269,1655060050269,NULL),(48,'2TU0J9HR8O2X','famali','fffffffffff','fffff','','',0.00,1655060361734,'456987123','dddddddddd','WAITING','','','',139858.89,11.00,'cbnzkoiumukx',1655060361734,1655060361734,NULL),(49,'0ETPVXNMV1QP','gg','gg','gg','','',0.00,1655060809150,'gg','ff','WAITING','','','',21.65,11.00,'sghehazqgnvv',1655060809150,1655060809150,NULL),(50,'OBZOYA9J7Q7D','aaaa','aaaaaa','aaaa','','',0.00,1655061679691,'aaaaaa','ss','WAITING','','','',32.75,11.00,'ptomgabnklhg',1655061679691,1655061679691,NULL),(51,'DRJO18ELLY8M','fjjjjjjjj','jjjjjjjjjjjj','jjjjjjjjj','','',0.00,1655062406865,'jjjjjjjjjjjjjjjjjj','llllllllllll','WAITING','','','',72.53,11.00,'ohgdgdzovnpm',1655062406864,1655062406864,NULL),(52,'AJJ1QHA9LLAM','gggggggggg','gggggggggggggg','ggggggggggg','','',0.00,1655062555007,'ggggggggggggg','ffffffff','WAITING','','','',24.75,11.00,'wohltilzaqab',1655062555006,1655062555007,NULL),(53,'5IY1X3BTWPMM',' ff','fffffffff','fffff','','',0.00,1655062669040,'ffffffff','fffffff','WAITING','','','',24.75,11.00,'igovejwuhqpg',1655062669040,1655062669040,NULL),(54,'GBVWAMGO3E2U','lllllllllll','lllllllllll','llllllllllll','','',0.00,1655063160969,'llllllllll','lllllllllll','WAITING','','','',42.47,11.00,'zaknfkixsthb',1655063160969,1655063160969,NULL),(55,'TSSTC0F414CE','ffffff','ffffffffffffff','fffffffffff','','',0.00,1655066248268,'ffffffffffffff','ffffffffff','WAITING','','','',355699.50,11.00,'wktjoeipvffx',1655066248268,1655066248268,NULL),(56,'GXMVD2PWMD8K','dddddddddddd','ddddddddddd','ddddddddd','','',0.00,1655066393521,'ddddddddddd','cc','WAITING','','','',51.06,11.00,'trwjhggvwobo',1655066393521,1655066393521,NULL),(57,'6WD1MY6S2J0U','fffff','ffffffffffff','fffffffffff','','',0.00,1655145875578,'fffffffffff','fffffffff','WAITING','','','',22.20,11.00,'bbegkzvgvlkr',1655145875578,1655145875578,NULL),(58,'3RK21LAP2XO4','dddddddddddddd','ddddddddddddddd','dddddddddd','','',0.00,1655146007849,'ddddddddddddd','fffffffffff','WAITING','','','',48.10,11.00,'zptjeurtrqql',1655146007849,1655146007849,NULL),(59,'ZPBEC7C8PT3H','hhhhhhh','llllllll','hhhhhhhhh@email.com','','',0.00,1655146285069,'hhhhhhhhh','dddddddd','WAITING','','','',13.32,11.00,'kpzdaiyjpqls',1655146285069,1655146285069,NULL),(60,'XP8BV5ZQ86DG','dddddddddd','ddddddddd','ddddddddd','','',0.00,1655146508301,'dddddddd','dddddd','WAITING','','','',11.80,11.00,'xvszkpvitsmw',1655146508301,1655146508301,NULL),(61,'J78D1S0PK8N7','mmmmmmmm','12/12/25','jjjjjj','','',0.00,1655149015337,'mmmmmmm','mm','WAITING','','','',44.40,11.00,'bmwssmssdfpj',1655149015337,1655149015337,NULL),(62,'672CVT99CLCQ','sssssss','ssssssssssss','sssssssss','','',0.00,1655152903511,'ssssssssss','ddddddddd','WAITING','','','',35.40,11.00,'koemydzdwehd',1655152903511,1655152903511,NULL),(63,'AW42UZVHGWAO','aaaaaaaaaaa','aaaaaaaaaa','aaaaaaaaaaaaaa','','',0.00,1655171608929,'aaaaaaaaaa','aaaaaaaa','WAITING','','','',11.87,11.00,'yyofquurbamw',1655171608928,1655171608929,NULL),(64,'FQBMG5XWAC4F','ddddddddddd','dddddddddddddd','dddddddddd','','',0.00,1655171936788,'dddddddddd','ddddddd','WAITING','','','',24.42,11.00,'zeqdqtctcocs',1655171936787,1655171936788,NULL),(65,'QM39AQUIQMC3','ffffff','ffffffff','fffffff','','',0.00,1655172295426,'ffffff','ddddd','WAITING','','','',24.75,11.00,'ysfxvpucpakc',1655172295426,1655172295426,NULL),(66,'XG24G8A0PI3O','DDDDDDDDD','DDDDDDDDDDDDD','DDDDDDDDD','','',0.00,1655173561045,'DDDDDDDDDD','DDDDDD','WAITING','','','',72.53,11.00,'glxakdwqwslh',1655173561045,1655173561045,NULL),(67,'BGD686BHSRMR','dddddddd','dddddddd','ddddddddd','','',0.00,1655800027756,'ddddddddddddd','dddddddd','WAITING','','','',24.75,11.00,'iynajuzlokqy',1655800027755,1655800027755,NULL),(68,'9D0TC04W355J','krishnaraman','ward 1','rahul@vishu.c','paying','New York, US',20.00,1653625766556,'3234234','456465456','WAITING','','','',400.26,11.00,'mytvnrsgbxah',1651897721259,1651897721259,NULL),(69,'HENZIGUKS324','krishnaraman','ward 1','rahul@vishu.c','paying','New York, US',20.00,1653625766556,'3234234','456465456','WAITING','','','',400.26,11.00,'syemjiwtdqux',1651897721259,1651897721259,NULL),(87,'MPKS87MPSGAG','rahul','sarni','rahul@rahul.com','','',0.00,1655918193416,'1234567890','helo','WAITING','','','',355772.03,11.00,'zxrxrscyjkhk',1655918193416,1655918193416,'Xw23UTTpH6YHR1oVZcHSaDpxvit2');
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order_detail`
--

DROP TABLE IF EXISTS `product_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  `price_item` decimal(12,2) NOT NULL,
  `created_at` bigint NOT NULL,
  `last_update` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table_orders_item` (`order_id`),
  CONSTRAINT `fk_table_orders_item` FOREIGN KEY (`order_id`) REFERENCES `product_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order_detail`
--

LOCK TABLES `product_order_detail` WRITE;
/*!40000 ALTER TABLE `product_order_detail` DISABLE KEYS */;
INSERT INTO `product_order_detail` VALUES (2,2,139,'Korean Loose Short Cowboy Outerwear',1,46.00,1651897902353,1651897902353),(3,3,125,'sdasd',1,22.00,1652118120425,1652118120425),(4,4,125,'sdasd',1,22.00,1652118183106,1652118183106),(5,5,125,'sdasd',1,22.00,1652118191683,1652118191683),(6,6,125,'sdasd',1,22.00,1652182988154,1652182988154),(7,7,125,'sdasd',1,22.00,1652188220908,1652188220908),(8,8,125,'sdasd',1,22.00,1652188248247,1652188248247),(9,9,140,'Korean Loose Short Cowboy Outerwear',1,46.00,1652188337479,1652188337479),(10,10,140,'Korean Loose Short Cowboy Outerwear',1,46.00,1652188587981,1652188587981),(11,11,140,'Korean Loose Short Cowboy Outerwear',1,46.00,1652188635569,1652188635569),(38,43,122,'Samsung Galaxy A12',2,50.00,1652188337479,1652188337479),(39,43,133,'Retro Kimono Blouse Chic Blusas Tops',1,90.00,1652188337479,1652188337479),(40,44,122,'Samsung Galaxy A12',2,150.00,1652188337479,1652188337479),(41,44,133,'Retro Kimono Blouse Chic Blusas Tops',1,250.26,1652188337479,1652188337479),(42,45,135,'Geometric Print Smock Blouse Office Lady',1,10.69,1652188337479,1652188337479),(43,45,134,'Floral Print Chiffon Smock Blouse',2,19.13,1652188337479,1652188337479),(44,46,127,'Pure Cotton Polo Shirt Men\'s T-shirt',1,19.50,1652188337479,1652188337479),(45,47,125,'Samsung Galaxy S21 FE',1,136499.00,1652188337479,1652188337479),(46,48,124,'Apple iPad Air 5',1,125999.00,1652188337479,1652188337479),(47,49,127,'Pure Cotton Polo Shirt Men\'s T-shirt',1,19.50,1652188337479,1652188337479),(48,50,129,'Men Casual T-shirt + Shorts 2-piece Suit',2,14.75,1652188337479,1652188337479),(49,51,138,'Hollow Hole Belt Harajuku Autumn Denim Coat',1,65.34,1652188337479,1652188337479),(50,52,128,'DYXUE Brand Tops 2022 Polos Short Sleeve Logo Male Polo Shirt',1,22.30,1652188337479,1652188337479),(51,53,128,'DYXUE Brand Tops 2022 Polos Short Sleeve Logo Male Polo Shirt',1,22.30,1652188337479,1652188337479),(52,54,134,'Floral Print Chiffon Smock Blouse',2,19.13,1652188337479,1652188337479),(53,55,123,'Apple iPhone 13 Pro Max',1,320450.00,1652188337479,1652188337479),(54,56,140,'Korean Loose Short Cowboy Outerwear',1,46.00,1652188337479,1652188337479),(55,57,126,'Zeppelin Black Sweatshirt',1,20.00,1652188337479,1652188337479),(56,58,137,'Sequin Denim Jacket Womens Jacket',1,43.33,1652188337479,1652188337479),(57,59,131,'Summer Beach Flip Flops',1,12.00,1652188337479,1652188337479),(58,60,133,'Retro Kimono Blouse Chic Blusas Tops',1,10.63,1652188337479,1652188337479),(59,61,126,'Zeppelin Black Sweatshirt',2,20.00,1652188337479,1652188337479),(60,62,133,'Retro Kimono Blouse Chic Blusas Tops',3,10.63,1652188337479,1652188337479),(61,63,135,'Geometric Print Smock Blouse Office Lady',1,10.69,1652188337479,1652188337479),(62,64,130,'Handmade Retro Leisure Loafers Shoes',1,22.00,1652188337479,1652188337479),(63,65,128,'DYXUE Brand Tops 2022 Polos Short Sleeve Logo Male Polo Shirt',1,22.30,1652188337479,1652188337479),(64,66,138,'Hollow Hole Belt Harajuku Autumn Denim Coat',1,65.34,1652188337479,1652188337479),(65,67,128,'DYXUE Brand Tops 2022 Polos Short Sleeve Logo Male Polo Shirt',1,22.30,1652188337479,1652188337479),(66,68,122,'Samsung Galaxy A12',1,150.00,1652188337479,1652188337479),(67,68,133,'Retro Kimono Blouse Chic Blusas Tops',2,250.26,1652188337479,1652188337479),(68,69,122,'Samsung Galaxy A12',1,150.00,1652188337479,1652188337479),(69,69,133,'Retro Kimono Blouse Chic Blusas Tops',2,250.26,1652188337479,1652188337479),(89,87,138,'Hollow Hole Belt Harajuku Autumn Denim Coat',1,65.34,1652188337479,1652188337479),(90,87,123,'Apple iPhone 13 Pro Max',1,320450.00,1652188337479,1652188337479);
/*!40000 ALTER TABLE `product_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_economy` decimal(12,2) NOT NULL,
  `rate_regular` decimal(12,2) NOT NULL,
  `rate_express` decimal(12,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `active_eco` tinyint(1) NOT NULL,
  `active_reg` tinyint(1) NOT NULL,
  `active_exp` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (100,'Alabama, US','',5.00,10.00,20.00,0,1,1,1),(101,'California, US','',5.00,10.00,20.00,1,1,1,1),(102,'Kansas, US','',5.00,10.00,20.00,1,1,1,1),(103,'Louisiana, US','',5.00,10.00,20.00,1,1,1,1),(104,'Michigan, US','',5.00,10.00,20.00,1,1,1,1),(105,'New York, US','',5.00,10.00,20.00,1,1,1,1),(106,'Oklahoma, US','',5.00,10.00,20.00,1,1,1,1),(107,'Texas, US','',5.00,10.00,20.00,1,1,1,1),(108,'Virginia, US','',5.00,10.00,20.00,0,1,1,1),(109,'Washington, US','',5.00,10.00,20.00,1,0,0,0);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mian Speaks','admin','contact@mianasad.com','e6e061838856bf47e1de730719fb2609');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-12 17:13:00
