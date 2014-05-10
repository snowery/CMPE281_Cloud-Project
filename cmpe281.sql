
-- MySQL dump 10.13  Distrib 5.7.2-m12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: cmpe281
-- ------------------------------------------------------
-- Server version	5.7.2-m12

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
-- Table structure for table `billing`
--

CREATE DATABASE cmpe281;
USE cmpe281;

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `BillId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `Plan` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Uptime` int(11) NOT NULL,
  `Charge` decimal(10,2) NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`BillId`),
  KEY `OrderId_idx` (`OrderId`),
  KEY `UserId_idx` (`UserId`),
  CONSTRAINT `OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,6,1,'2014-04-20 02:26:19','2014-04-20 11:59:50',0,0.12,6464,12.93,'A'),(2,7,1,'2014-04-20 03:34:14','2014-04-20 12:05:00',1,10.00,1548,10.00,'A'),(3,8,1,'2014-04-20 12:03:45','2014-04-20 12:05:00',0,0.11,75,0.14,'A'),(4,8,1,'2014-04-20 12:05:00','2014-04-20 12:58:05',0,0.11,2666,4.89,'A'),(5,7,1,'2014-04-20 12:05:00','2014-04-20 12:59:30',1,10.00,621,10.00,'A'),(6,10,1,'2014-04-20 12:43:23','2014-04-20 12:59:30',0,0.11,946,1.73,'A');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` varchar(40) NOT NULL,
  `Key` varchar(45) NOT NULL,
  `Player` varchar(100) NOT NULL,
  PRIMARY KEY (`Host`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES ('lan@localhost','/Users/lan/.ssh/pwdless_rsa','/Applications/Genymotion.app/Contents/MacOS/player');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `VmId` int(11) NOT NULL AUTO_INCREMENT,
  `VmName` varchar(45) NOT NULL,
  `Host` varchar(45) NOT NULL,
  `ReservedBy` int(11) DEFAULT NULL COMMENT '\n',
  PRIMARY KEY (`VmId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` VALUES (9,'Nexus 7 - 4.4.2 - API 19 - 800x1280','lan@localhost',NULL),(10,'Custom Tablet 10 - 4.4.2 - API 19 - 1280x800','lan@localhost',NULL),(11,'Galaxy S2 - 4.1.1 - API 16 - 480x800','lan@localhost',1),(12,'Galaxy S3 - 4.3 - API 18 - 720x1280 - VM1','lan@localhost',1);
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `UserId` int(11) NOT NULL,
  `VmId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `VmName` varchar(45) NOT NULL,
  `VmStatus` varchar(1) NOT NULL,
  `Uptime` int(11) NOT NULL,
  `LastStartTime` datetime NOT NULL,
  `RatePlan` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `LastBillDate` datetime NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,9,3,'Nexus 7 - 4.4.2 - API 19 - 800x1280','T',3294,'2014-04-20 02:23:23',0,0.12,'2014-04-20 01:25:00'),(1,9,6,'Nexus 7 - 4.4.2 - API 19 - 800x1280','T',0,'2014-04-20 10:58:50',0,0.12,'2014-04-20 11:59:50'),(1,11,7,'Galaxy S2 - 4.1.1 - API 16 - 480x800','S',0,'2014-04-20 12:45:28',1,10.00,'2014-04-20 12:59:30'),(1,9,8,'Nexus 7 - 4.4.2 - API 19 - 800x1280','T',0,'2014-04-20 12:54:33',0,0.11,'2014-04-20 12:58:05'),(1,12,10,'Galaxy S3 - 4.3 - API 18 - 720x1280 - VM1','A',0,'2014-04-20 12:47:07',0,0.11,'2014-04-20 12:59:30');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-26 13:40:20
=======
mysqladmin  Ver 8.42 Distrib 5.7.2-m12, for osx10.7 on x86_64
Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Administration program for the mysqld daemon.
Usage: mysqladmin [OPTIONS] command command....
  --bind-address=name IP address to bind to.
  -c, --count=#       Number of iterations to make. This works with -i
                      (--sleep) only.
  --debug-check       Check memory and open file usage at exit.
  --debug-info        Print some debug info at exit.
  -f, --force         Don't ask for confirmation on drop database; with
                      multiple commands, continue even if an error occurs.
  -C, --compress      Use compression in server/client protocol.
  --character-sets-dir=name 
                      Directory for character set files.
  --default-character-set=name 
                      Set the default character set.
  -?, --help          Display this help and exit.
  -h, --host=name     Connect to host.
  -b, --no-beep       Turn off beep on error.
  -p, --password[=name] 
                      Password to use when connecting to server. If password is
                      not given it's asked from the tty.
  -P, --port=#        Port number to use for connection or 0 for default to, in
                      order of preference, my.cnf, $MYSQL_TCP_PORT,
                      /etc/services, built-in default (3306).
  --protocol=name     The protocol to use for connection (tcp, socket, pipe,
                      memory).
  -r, --relative      Show difference between current and previous values when
                      used with -i. Currently only works with extended-status.
  -s, --silent        Silently exit if one can't connect to server.
  -S, --socket=name   The socket file to use for connection.
  -i, --sleep=#       Execute commands repeatedly with a sleep between.
  --ssl               Enable SSL for connection (automatically enabled with
                      other flags).
  --ssl-ca=name       CA file in PEM format (check OpenSSL docs, implies
                      --ssl).
  --ssl-capath=name   CA directory (check OpenSSL docs, implies --ssl).
  --ssl-cert=name     X509 cert in PEM format (implies --ssl).
  --ssl-cipher=name   SSL cipher to use (implies --ssl).
  --ssl-key=name      X509 key in PEM format (implies --ssl).
  --ssl-crl=name      Certificate revocation list (implies --ssl).
  --ssl-crlpath=name  Certificate revocation list path (implies --ssl).
  --ssl-verify-server-cert 
                      Verify server's "Common Name" in its cert against
                      hostname used when connecting. This option is disabled by
                      default.
  -u, --user=name     User for login if not current user.
  -v, --verbose       Write more information.
  -V, --version       Output version information and exit.
  -E, --vertical      Print output vertically. Is similar to --relative, but
                      prints output vertically.
  -w, --wait[=#]      Wait and retry if connection is down.
  --connect-timeout=# 
  --shutdown-timeout=# 
  --plugin-dir=name   Directory for client-side plugins.
  --default-auth=name Default authentication client-side plugin to use.
  --enable-cleartext-plugin 
                      Enable/disable the clear text authentication plugin.
  --show-warnings     Show warnings after execution

Variables (--variable-name=value)
and boolean options {FALSE|TRUE}  Value (after reading options)
--------------------------------- ----------------------------------------
bind-address                      (No default value)
count                             0
debug-check                       FALSE
debug-info                        FALSE
force                             FALSE
compress                          FALSE
character-sets-dir                (No default value)
default-character-set             auto
host                              (No default value)
no-beep                           FALSE
port                              0
relative                          FALSE
socket                            (No default value)
sleep                             0
ssl                               FALSE
ssl-ca                            (No default value)
ssl-capath                        (No default value)
ssl-cert                          (No default value)
ssl-cipher                        (No default value)
ssl-key                           (No default value)
ssl-crl                           (No default value)
ssl-crlpath                       (No default value)
ssl-verify-server-cert            FALSE
user                              root
verbose                           FALSE
vertical                          FALSE
connect-timeout                   43200
shutdown-timeout                  3600
plugin-dir                        (No default value)
default-auth                      (No default value)
enable-cleartext-plugin           FALSE
show-warnings                     FALSE

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf /usr/local/mysql/etc/my.cnf ~/.my.cnf 
The following groups are read: mysqladmin client
The following options may be given as the first argument:
--print-defaults        Print the program argument list and exit.
--no-defaults           Don't read default options from any option file,
                        except for login file.
--defaults-file=#       Only read default options from the given file #.
--defaults-extra-file=# Read this file after the global files are read.
--defaults-group-suffix=#
                        Also read groups with concat(group, suffix)
--login-path=#          Read this path from the login file.

Where command is a one or more of: (Commands may be shortened)
  create databasename	Create a new database
  debug			Instruct server to write debug information to log
  drop databasename	Delete a database and all its tables
  extended-status       Gives an extended status message from the server
  flush-hosts           Flush all cached hosts
  flush-logs            Flush all logs
  flush-status		Clear status variables
  flush-tables          Flush all tables
  flush-threads         Flush the thread cache
  flush-privileges      Reload grant tables (same as reload)
  kill id,id,...	Kill mysql threads
  password [new-password] Change old password to new-password in current format
  old-password [new-password] Change old password to new-password in old format
  ping			Check if mysqld is alive
  processlist		Show list of active threads in server
  reload		Reload grant tables
  refresh		Flush all tables and close and open logfiles
  shutdown		Take server down
  status		Gives a short status message from the server
  start-slave		Start slave
  stop-slave		Stop slave
  variables             Prints variables available
  version		Get version info from server

