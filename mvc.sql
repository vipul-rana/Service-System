-- MySQL dump 10.10
--
-- Host: localhost    Database: mvc
-- ------------------------------------------------------
-- Server version	5.0.24-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ans`
--

DROP TABLE IF EXISTS `ans`;
CREATE TABLE `ans` (
  `qid` int(11) NOT NULL,
  `answer` varchar(255) default NULL,
  `qtype` varchar(255) NOT NULL,
  PRIMARY KEY  (`qid`,`qtype`),
  KEY `FK179E6C560EAFF` (`qid`),
  CONSTRAINT `FK179E6C560EAFF` FOREIGN KEY (`qid`) REFERENCES `que` (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans`
--


/*!40000 ALTER TABLE `ans` DISABLE KEYS */;
LOCK TABLES `ans` WRITE;
INSERT INTO `ans` VALUES (2,'python is a programming language','first'),(2,'python is a platform to create applications','second'),(2,'python is a oop','third');
UNLOCK TABLES;
/*!40000 ALTER TABLE `ans` ENABLE KEYS */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `AppNo` int(5) NOT NULL auto_increment,
  `UserId` varchar(20) default NULL,
  `WorkerId` int(5) default NULL,
  `BookingDate` varchar(15) default NULL,
  `TimeSlot` varchar(15) default NULL,
  `Address` varchar(230) default NULL,
  `WorkDesc` varchar(230) default NULL,
  `status` varchar(30) default NULL,
  `workstatus` varchar(30) default NULL,
  PRIMARY KEY  (`AppNo`),
  KEY `UserId` (`UserId`),
  KEY `WorkerId` (`WorkerId`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`WorkerId`) REFERENCES `workers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--


/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
LOCK TABLES `appointment` WRITE;
INSERT INTO `appointment` VALUES (1,'aditya@gmail.com',101,'2021-06-30','12:00','Indore','Plumbing','Accepted','Done'),(2,'vikrant@gmail.com',110,'0011-11-11','11:11','Bhopal','Labour','Pending...','---'),(3,'tanmay@gmail.com',101,'0009-09-09','09:09','Bhopal','fgh','Accepted','Booking Cancelled'),(4,'tanmay@gmail.com',101,'0001-11-11','23:11','asd','asd','Declined','---'),(5,'bhushan@gmail.com',112,'0001-11-11','11:11','1','1','Pending...','---'),(6,'vikrant@gmail.com',111,'0001-11-11','23:11','qsdf','qwde','Pending...','---'),(7,'vikrant@gmail.com',113,'0005-05-05','17:52','erffg','tr','Pending...','---');
UNLOCK TABLES;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS `child`;
CREATE TABLE `child` (
  `lid` int(11) NOT NULL,
  `sublanguage` varchar(255) default NULL,
  KEY `FK5A3F51C38EC7C14` (`lid`),
  CONSTRAINT `FK5A3F51C38EC7C14` FOREIGN KEY (`lid`) REFERENCES `language` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `child`
--


/*!40000 ALTER TABLE `child` DISABLE KEYS */;
LOCK TABLES `child` WRITE;
INSERT INTO `child` VALUES (1,'Core'),(1,'Advance'),(1,'Frameworks'),(2,'HTML'),(2,'CSS'),(2,'JS');
UNLOCK TABLES;
/*!40000 ALTER TABLE `child` ENABLE KEYS */;

--
-- Table structure for table `citystate`
--

DROP TABLE IF EXISTS `citystate`;
CREATE TABLE `citystate` (
  `state` varchar(10) default NULL,
  `city` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citystate`
--


/*!40000 ALTER TABLE `citystate` DISABLE KEYS */;
LOCK TABLES `citystate` WRITE;
INSERT INTO `citystate` VALUES ('MP','Indore'),('MP','Bhopal'),('MP','Ujjain'),('RJ','Kota'),('RJ','Raipur'),('CG','Raipur'),('MH','Mumbai'),('MH','Pune');
UNLOCK TABLES;
/*!40000 ALTER TABLE `citystate` ENABLE KEYS */;

--
-- Table structure for table `cst`
--

DROP TABLE IF EXISTS `cst`;
CREATE TABLE `cst` (
  `tid` int(11) NOT NULL,
  `sname` varchar(255) default NULL,
  KEY `FK182048C261336` (`tid`),
  CONSTRAINT `FK182048C261336` FOREIGN KEY (`tid`) REFERENCES `ctr` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cst`
--


/*!40000 ALTER TABLE `cst` DISABLE KEYS */;
LOCK TABLES `cst` WRITE;
INSERT INTO `cst` VALUES (1,'jay'),(1,'ajay'),(1,'vijay'),(1,'jaya');
UNLOCK TABLES;
/*!40000 ALTER TABLE `cst` ENABLE KEYS */;

--
-- Table structure for table `cstudents`
--

DROP TABLE IF EXISTS `cstudents`;
CREATE TABLE `cstudents` (
  `tid` int(11) NOT NULL,
  `sname` varchar(255) default NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY  (`tid`,`type`),
  KEY `FKC648B2FB8C261336` (`tid`),
  CONSTRAINT `FKC648B2FB8C261336` FOREIGN KEY (`tid`) REFERENCES `ctrainer` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cstudents`
--


/*!40000 ALTER TABLE `cstudents` DISABLE KEYS */;
LOCK TABLES `cstudents` WRITE;
INSERT INTO `cstudents` VALUES (1,'jay',0),(1,'ajay',1),(1,'vijay',2),(1,'jaya',3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `cstudents` ENABLE KEYS */;

--
-- Table structure for table `ctr`
--

DROP TABLE IF EXISTS `ctr`;
CREATE TABLE `ctr` (
  `tid` int(11) NOT NULL,
  `tname` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ctr`
--


/*!40000 ALTER TABLE `ctr` DISABLE KEYS */;
LOCK TABLES `ctr` WRITE;
INSERT INTO `ctr` VALUES (1,'tanveer');
UNLOCK TABLES;
/*!40000 ALTER TABLE `ctr` ENABLE KEYS */;

--
-- Table structure for table `ctrainer`
--

DROP TABLE IF EXISTS `ctrainer`;
CREATE TABLE `ctrainer` (
  `tid` int(11) NOT NULL,
  `tname` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ctrainer`
--


/*!40000 ALTER TABLE `ctrainer` DISABLE KEYS */;
LOCK TABLES `ctrainer` WRITE;
INSERT INTO `ctrainer` VALUES (1,'tanveer');
UNLOCK TABLES;
/*!40000 ALTER TABLE `ctrainer` ENABLE KEYS */;

--
-- Table structure for table `cust`
--

DROP TABLE IF EXISTS `cust`;
CREATE TABLE `cust` (
  `vid` int(11) NOT NULL,
  `cname` varchar(255) default NULL,
  KEY `FK2EC6536A583127` (`vid`),
  CONSTRAINT `FK2EC6536A583127` FOREIGN KEY (`vid`) REFERENCES `vendor` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust`
--


/*!40000 ALTER TABLE `cust` DISABLE KEYS */;
LOCK TABLES `cust` WRITE;
INSERT INTO `cust` VALUES (1,'jay'),(1,'ajay'),(1,'vijay');
UNLOCK TABLES;
/*!40000 ALTER TABLE `cust` ENABLE KEYS */;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `ename` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  `sal` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp`
--


/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
LOCK TABLES `emp` WRITE;
INSERT INTO `emp` VALUES (101,'Veer','Manager',2500),(102,'Raj','Developer',2500),(103,'Viraj','Designer',2500),(104,'Vinay','DA',2500),(105,'Vidyut','CA',2500),(106,'Aditya','manager',2500),(107,'Fatema',NULL,2500),(108,'Veer','manager',2300);
UNLOCK TABLES;
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;

--
-- Table structure for table `emps`
--

DROP TABLE IF EXISTS `emps`;
CREATE TABLE `emps` (
  `id` int(11) NOT NULL,
  `job` varchar(255) default NULL,
  `ename` varchar(255) default NULL,
  `sal` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emps`
--


/*!40000 ALTER TABLE `emps` DISABLE KEYS */;
LOCK TABLES `emps` WRITE;
INSERT INTO `emps` VALUES (101,'Developer','Veer',4000);
UNLOCK TABLES;
/*!40000 ALTER TABLE `emps` ENABLE KEYS */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `lid` int(11) NOT NULL,
  `lname` varchar(255) default NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--


/*!40000 ALTER TABLE `language` DISABLE KEYS */;
LOCK TABLES `language` WRITE;
INSERT INTO `language` VALUES (1,'Java'),(2,'Web Designing');
UNLOCK TABLES;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(8) default NULL,
  `name` varchar(20) default NULL,
  `price` int(8) default NULL,
  `cat` varchar(20) default NULL,
  `cmp` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--


/*!40000 ALTER TABLE `product` DISABLE KEYS */;
LOCK TABLES `product` WRITE;
INSERT INTO `product` VALUES ('a','Projector',1000,'cc','bbb'),('a','Projector',1000,'cc','bbb'),('a','Projector',1000,'cc','bbb'),('a','Projector',1000,'cc','bbb'),('a','Projector',1000,'cc','bbb'),('b','Fatema',2000,'',''),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('b','Fatema',2000,'ccbb','zzz'),('zz','zzz',100,'zzz','zzz'),('yyy','yyy',200,'yyy','yyy'),('101','aba',111,'aba','aba');
UNLOCK TABLES;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `que`
--

DROP TABLE IF EXISTS `que`;
CREATE TABLE `que` (
  `qid` int(11) NOT NULL,
  `que` varchar(255) default NULL,
  PRIMARY KEY  (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `que`
--


/*!40000 ALTER TABLE `que` DISABLE KEYS */;
LOCK TABLES `que` WRITE;
INSERT INTO `que` VALUES (2,'what is python?');
UNLOCK TABLES;
/*!40000 ALTER TABLE `que` ENABLE KEYS */;

--
-- Table structure for table `rtr`
--

DROP TABLE IF EXISTS `rtr`;
CREATE TABLE `rtr` (
  `sal` int(11) default NULL,
  `timing` varchar(255) default NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY  (`tid`),
  KEY `FK1BA708C261336` (`tid`),
  CONSTRAINT `FK1BA708C261336` FOREIGN KEY (`tid`) REFERENCES `tr` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtr`
--


/*!40000 ALTER TABLE `rtr` DISABLE KEYS */;
LOCK TABLES `rtr` WRITE;
INSERT INTO `rtr` VALUES (25000,'9-5',2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rtr` ENABLE KEYS */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(5) default NULL,
  `sname` varchar(15) default NULL,
  `branch` varchar(15) default NULL,
  `tid` int(5) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--


/*!40000 ALTER TABLE `student` DISABLE KEYS */;
LOCK TABLES `student` WRITE;
INSERT INTO `student` VALUES (1,'Vipul','CS',101),(2,'Kshitiz','EC',104),(3,'Madiha','CS',101),(4,'Manish','CE',102);
UNLOCK TABLES;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

--
-- Table structure for table `tr`
--

DROP TABLE IF EXISTS `tr`;
CREATE TABLE `tr` (
  `tid` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr`
--


/*!40000 ALTER TABLE `tr` DISABLE KEYS */;
LOCK TABLES `tr` WRITE;
INSERT INTO `tr` VALUES (1,'Aditya'),(2,'Vikrant'),(3,'Aditya Verma');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tr` ENABLE KEYS */;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE `trainer` (
  `tid` int(5) default NULL,
  `tname` varchar(15) default NULL,
  `language` varchar(15) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainer`
--


/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
LOCK TABLES `trainer` WRITE;
INSERT INTO `trainer` VALUES (101,'Tanveer','Java'),(102,'Gourav','Java'),(103,'Abhishek','PHP'),(104,'Tanveer','Python'),(0,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;

--
-- Table structure for table `ttr`
--

DROP TABLE IF EXISTS `ttr`;
CREATE TABLE `ttr` (
  `amount` int(11) default NULL,
  `batches` varchar(255) default NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY  (`tid`),
  KEY `FK1C1F28C261336` (`tid`),
  CONSTRAINT `FK1C1F28C261336` FOREIGN KEY (`tid`) REFERENCES `tr` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttr`
--


/*!40000 ALTER TABLE `ttr` DISABLE KEYS */;
LOCK TABLES `ttr` WRITE;
INSERT INTO `ttr` VALUES (5000,'5',3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `ttr` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `name` varchar(20) default NULL,
  `id` varchar(20) NOT NULL,
  `password` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES ('Aditya Verma','aditya@gmail.com','12345'),('Ajay','ajay@gmail.com','12345'),('Amanjeet','amanjeet@gmail.com','12345'),('Amit','amit@gmail.com','12345'),('Bhaskar','bhaskar@gmail.com','12345'),('Bhushan','bhushan@gmail.com','12345'),('Jay','jay@gmail.com','12345'),('Prem','prem@gmail.com','12345'),('Raj','raj@gmail.com','12345'),('Suresh','suresh@gmail.com','12345'),('Tanmay','tanmay@gmail.com','12345'),('Tez','tez@gmail.com','12345'),('Vijay','vijay@gmail.com','12345'),('Vikrant','vikrant@gmail.com','12345'),('Vinit','vinit@gmail.com','12345');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `vid` int(11) NOT NULL,
  `vname` varchar(255) default NULL,
  PRIMARY KEY  (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--


/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
LOCK TABLES `vendor` WRITE;
INSERT INTO `vendor` VALUES (1,'raj');
UNLOCK TABLES;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
CREATE TABLE `workers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `contact` int(12) default NULL,
  `email` varchar(25) default NULL,
  `category` varchar(20) default NULL,
  `location` varchar(30) default NULL,
  `address` varchar(100) default NULL,
  `services` varchar(100) default NULL,
  `charges` int(5) default NULL,
  PRIMARY KEY  (`id`),
  KEY `email` (`email`),
  CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workers`
--


/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
LOCK TABLES `workers` WRITE;
INSERT INTO `workers` VALUES (101,'Vikrant',12345,'vikrant@gmail.com','Mechanic','Bhopal','Kolar','Mechanic',200),(102,'Raj',12345,'raj@gmail.com','Plumber','Indore','Bhavarkua','Plumbing',300),(103,'Vijay',12345,'vijay@gmail.com','Plumber','Bhopal',NULL,NULL,400),(104,'Jay',12345,'jay@gmail.com','Electrician','Bhopal',NULL,NULL,500),(105,'Ajay',12345,'ajay@gmail.com','Electrician','Indore',NULL,NULL,600),(106,'vinit',12345,'vinit@gmail.com','Electrician','BALAGHAT','WARD NO. 1 HIMACHAL NAGAR WARASEONI','Electronic appliances repairing.',500),(107,'Amanjeet',12345,'amanjeet@gmail.com','Plumber','BALAGHAT','WARD NO. 1 HIMACHAL NAGAR WARASEONI','All plumbing works',350),(108,'Tez',12345,'tez@gmail.com','Labourer','Indore','Vijay Nagar','Labour',300),(109,'Suresh',12345,'suresh@gmail.com','Mechanic','BALAGHAT','WARD NO. 1 HIMACHAL NAGAR WARASEONI','Bike Repairing',450),(110,'Aditya Verma',12345,'aditya@gmail.com','Labourer','BALAGHAT','WARD NO. 1 HIMACHAL NAGAR WARASEONI','Labour',200),(111,'Tanmay',12345,'tanmay@gmail.com','Labourer','Dewas','Dewas','Labour',400),(112,'Bhaskar',12345,'bhaskar@gmail.com','Transport','BALAGHAT','WARD NO. 1 HIMACHAL NAGAR WARASEONI','Transportation',800),(113,'Prem',12345,'prem@gmail.com','Transport','Indore','Vijay Nagar','Transportation',900),(114,'Bhushan',12345,'bhushan@gmail.com','Transport','Bhopal','MP Nagar','Transportation',600);
UNLOCK TABLES;
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

