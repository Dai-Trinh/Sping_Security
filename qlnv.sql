-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.0.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for qlnv
DROP DATABASE IF EXISTS `qlnv`;
CREATE DATABASE IF NOT EXISTS `qlnv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `qlnv`;

-- Dumping structure for table qlnv.tbl_nhanvien
DROP TABLE IF EXISTS `tbl_nhanvien`;
CREATE TABLE IF NOT EXISTS `tbl_nhanvien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hoten` varchar(50) NOT NULL,
  `tuoi` int(11) NOT NULL DEFAULT 0,
  `diachi` varchar(200) NOT NULL,
  `hinhanh` varchar(200) NOT NULL,
  `id_phongban` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nv_phongban` (`id_phongban`),
  CONSTRAINT `FK_nv_phongban` FOREIGN KEY (`id_phongban`) REFERENCES `tbl_phongban` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlnv.tbl_nhanvien: ~1 rows (approximately)
REPLACE INTO `tbl_nhanvien` (`id`, `hoten`, `tuoi`, `diachi`, `hinhanh`, `id_phongban`) VALUES
	(16, 'Tên 3', 23, 'Vĩnh Phúc', 'http://localhost:8080/image/Screenshot (104).png', 5);

-- Dumping structure for table qlnv.tbl_phongban
DROP TABLE IF EXISTS `tbl_phongban`;
CREATE TABLE IF NOT EXISTS `tbl_phongban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(200) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlnv.tbl_phongban: ~1 rows (approximately)
REPLACE INTO `tbl_phongban` (`id`, `ten`) VALUES
	(5, 'Hành chính');

-- Dumping structure for table qlnv.tbl_role
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE IF NOT EXISTS `tbl_role` (
  `id` int(11) NOT NULL,
  `role` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlnv.tbl_role: ~2 rows (approximately)
REPLACE INTO `tbl_role` (`id`, `role`) VALUES
	(1, 'ADMIN'),
	(2, 'GUEST');

-- Dumping structure for table qlnv.tbl_taikhoan
DROP TABLE IF EXISTS `tbl_taikhoan`;
CREATE TABLE IF NOT EXISTS `tbl_taikhoan` (
  `id` int(11) NOT NULL,
  `username` char(200) NOT NULL,
  `password` char(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlnv.tbl_taikhoan: ~2 rows (approximately)
REPLACE INTO `tbl_taikhoan` (`id`, `username`, `password`) VALUES
	(1, 'admin', '$2a$04$Be9ilLVRGkzA.9NVeS2dVOsOYuhr8VVPKs6CS5gaIukxN9ZAARNf.'),
	(2, 'hieu', '$2a$04$NOERqv72r1TzVYYTZQNZRezvUvvbEku8ADzkwcpbBac2vQ/D.fm2W');

-- Dumping structure for table qlnv.tbl_taikhoan_role
DROP TABLE IF EXISTS `tbl_taikhoan_role`;
CREATE TABLE IF NOT EXISTS `tbl_taikhoan_role` (
  `id_tai_khoan` int(11) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  KEY `FK_tai_khoan` (`id_tai_khoan`),
  KEY `fk_role` (`id_role`),
  CONSTRAINT `FK_tai_khoan` FOREIGN KEY (`id_tai_khoan`) REFERENCES `tbl_taikhoan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role` FOREIGN KEY (`id_role`) REFERENCES `tbl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qlnv.tbl_taikhoan_role: ~2 rows (approximately)
REPLACE INTO `tbl_taikhoan_role` (`id_tai_khoan`, `id_role`) VALUES
	(1, 1),
	(2, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
