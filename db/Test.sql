-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2013 at 09:44 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `Barang_ID` int(3) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Harga` int(20) NOT NULL,
  `Category` varchar(30) NOT NULL,
  `keterangan` varchar(1000) NOT NULL,
  `stock` int(11) NOT NULL,
  `image_path` varchar(20) NOT NULL,
  PRIMARY KEY (`Barang_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Barang_ID`, `Nama`, `Harga`, `Category`, `keterangan`, `stock`, `image_path`) VALUES
(1, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(2, 'hongli', 50200, 'Model Kit', 'ini kw woy :v', 32, 'img/hongli.'),
(3, 'Monster Hunter 4', 500000, 'game', 'MH 4 masih jap bahkan -_-', 40, 'img/MH4'),
(4, 'barang_test1', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(5, 'barang_test2', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(6, 'barang_test2', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(7, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(8, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(9, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(10, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(11, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(12, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(13, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(14, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(15, 'barang_test', 1000000, 'mainan', 'test aja :v', 100, 'img/test.png'),
(16, 'Fam Fan Fan A', 50000, 'Prototype', 'Kartu Fam Fan Fan A!', 25, 'img/LastExile008'),
(17, 'Fam Fan Fan B', 25000, 'Prototype', 'Kartu Fam Fan Fan B!', 56, 'img/LastExile009'),
(18, 'Fam Fan Fan J', 8500, 'Grunts', 'Kartu Fam Fan Fan J!', 23, 'img/LastExile007'),
(19, 'Fam Fan Fan C', 25000, 'Prototype', 'Kartu Fam Fan Fan C!', 22, 'img/LastExile010'),
(20, 'Fam Fan Fan D', 32500, 'Prototype', 'Kartu Fam Fan Fan D!', 76, 'img/LastExile011'),
(21, 'Fam Fan Fan E', 10000, 'Prototype', 'Kartu Fam Fan Fan E!', 10, 'img/LastExile012'),
(22, 'Fam Fan Fan F', 58500, 'Grunts', 'Kartu Fam Fan Fan F!', 18, 'img/LastExile003'),
(23, 'Fam Fan Fan G', 80000, 'Grunts', 'Kartu Fam Fan Fan G!', 91, 'img/LastExile004'),
(24, 'Fam Fan Fan H', 100000, 'Grunts', 'Kartu Fam Fan Fan H!', 64, 'img/LastExile005'),
(25, 'Fam Fan Fan I', 34500, 'Grunts', 'Kartu Fam Fan Fan I!', 76, 'img/LastExile006'),
(26, 'Fam Fan Fan K', 56500, 'Ver. Ka', 'Kartu Fam Fan Fan K!', 54, 'img/LastExile001'),
(27, 'Fam Fan Fan L', 23250, 'Ver. Ka', 'Kartu Fam Fan Fan L!', 78, 'img/LastExile002'),
(28, 'Mermaid Idol Flute', 25000, 'Ver. Ka', 'Kartu Mermaid Idol Flute!', 33, 'img/MermaidIdolFlute'),
(29, 'Mermaid Idol Sedna', 87500, 'Ver. Ka', 'Kartu Mermaid Idol Sedna!', 94, 'img/MermaidIdolSedna'),
(30, 'Blazers Pleasures', 57500, 'Ver. Ka', 'Kartu Blazer Pleasures!', 54, 'img/BlazersPleasures'),
(31, 'Bewitching Lady Butterfy', 125000, 'Special Paint Version', 'Kartu Bewitching Officer Lady Butterfly!', 4, 'img/LadyButterfly'),
(32, 'Mermaid Idol Felucca', 90000, 'Special Paint Version', 'Kartu Mermaid Idol Felucca!', 8, 'img/MermaidFelucca'),
(33, 'White Coral Princess Claire', 55500, 'Special Paint Version', 'Kartu Snow White Coral Princess Claire!', 5, 'img/CoralClaire'),
(34, 'Mermaid Idol Salem', 12500, 'Special Paint Version', 'Kartu Mermaid Idol Salem!', 120, 'img/MermaidSalem'),
(35, 'Pearl Sisters, Perla', 250000, 'Special Paint Version', 'Kartu Pearl Sisters Perla!', 34, 'img/PearlSisterPerla'),
(36, 'Pearl Sisters, Perle', 250000, 'Zeon Obsolete Units', 'Kartu Pearl Sisters Perle!', 1, 'img/PearlSisterPerle'),
(37, 'Top Idol, Flores', 14500, 'Zeon Obsolete Units', 'Kartu Top Idol Flores!', 111250, 'img/TopIdolFlores'),
(38, 'Top Idol Pacifica', 332500, 'Zeon Obsolete Units', 'Kartu Top Idol Pacifica!', 74, 'img/TopIdolPacifica'),
(39, 'Bermuda Cadet, Caravelle', 1000, 'Zeon Obsolete Units', 'Kartu Bermuda Cadet Caravelle!', 99, 'img/BermudaCaravelle'),
(40, 'Drive Quartet, Paburin', 5000, 'Zeon Obsolete Units', 'Kartu Drive Quartet Paburin!', 90, 'img/DrivePaburin'),
(41, 'Drive Quartet Flows', 6000, 'Prototype', 'Kartu Drive Quartet Flows!', 98, 'img/DriveQuartFlows'),
(42, 'Drive Quartet Risakka', 7000, 'Prototype', 'Kartu Drive Quartet Risakka!', 97, 'img/DriveQuartRisaka'),
(43, 'Drive Quartet Shupuryu', 8000, 'Prototype', 'Kartu Drive Quartet Shupuryu!', 96, 'img/DriveShupuryu'),
(44, 'Girls Rock, Rio', 9000, 'Prototype', 'Kartu Girls Rock Rio!', 95, 'img/GirlsRockRio'),
(45, 'Top Idol Aqua', 10000, 'Prototype', 'Kartu Top Idol Aqua!', 94, 'img/TopIdolAqua'),
(46, 'Akira, Alicia, and Athena', 11000, 'Grunts', 'Kartu Akira Alicia dan Athena!', 94, 'img/CB101HEAL'),
(47, 'Hime, Maa, and Aria', 12000, 'Grunts', 'Kartu Hime Maa dan Aria!', 93, 'img/CB102'),
(48, 'Akari, Aika, and Alice A', 13000, 'Grunts', 'Kartu Akari Aika dan Alice A!', 94, 'img/CBP03'),
(49, 'Akari, Aika, and Alice B', 14000, 'Grunts', 'Kartu Akari Aika dan Alice B!', 93, 'img/CBT01'),
(50, 'Ametsuchi Akino', 15000, 'Grunts', 'Kartu Ametsuchi Akino!', 92, 'img/CB045'),
(51, 'Akari, Aika and Alice C', 16500, 'Zeon Obsolete Units', 'Kartu Akari Aika and Alice C!', 91, 'img/CB051'),
(52, 'Alice Caroll A', 17250, 'Zeon Obsolete Units', 'Kartu Alice Carroll A!', 50, 'img/CBP01'),
(53, 'Alice Carroll B', 18750, 'Zeon Obsolete Units', 'Kartu Alice Carroll B!', 60, 'img/CBT05'),
(54, 'Athena Glory A', 19500, 'Zeon Obsolete Units', 'Kartu Athena Glory A!', 70, 'img/CBT08'),
(55, 'Alice Carroll C', 20250, 'Zeon Obsolete Units', 'Kartu Alice Carroll C!', 80, 'img/CB037'),
(56, 'Alice Carroll D', 21500, 'Special Paint Version', 'Kartu Alice Carroll D!', 86, 'img/CB038'),
(57, 'Athena Glory B', 22250, 'Special Paint Version', 'Kartu Athena Glory B!', 13, 'img/CB042'),
(58, 'Athena Glory C', 24750, 'Special Paint Version', 'Kartu Athena Glory C', 15, 'img/CB043'),
(59, 'Athena Glory D', 26750, 'Special Paint Version', 'Kartu Athena Glory D', 156, 'img/CB044'),
(60, 'Woody Ayanokouji the 51st', 27500, 'Special Paint Version', 'Kartu Woody Ayanokouji the 51st!', 115, 'img/CB048'),
(61, 'Alice Carroll E', 28000, 'Ver. Ka', 'Kartu Alice Carroll E!', 74, 'img/CB012'),
(62, 'Athena Glory E', 19500, 'Ver. Ka', 'Kartu Athena Glory E!', 24, 'img/CB015'),
(63, 'Alice Carroll F', 25700, 'Ver. Ka', 'Kartu Alice Carroll F!', 22, 'img/CB021'),
(64, 'Alice Carroll G', 33750, 'Ver. Ka', 'Kartu Alice Carroll G!', 16, 'img/CB022'),
(65, 'Athena Glory F', 18500, 'Ver. Ka', 'Kartu Athena Glory F!', 2, 'img/CB028'),
(66, 'Athena Glory G', 22200, 'Prototype', 'Kartu Athena Glory G!', 36, 'img/CB029'),
(67, 'Kartu Alice Carroll H', 115000, 'Prototype', 'Kartu Alice Carroll H!', 1, 'img/CB006'),
(68, 'Alice Carroll I', 250000, 'Prototype', 'Kartu Alice Carroll I!', 11, 'img/CB010'),
(69, 'Alice Carroll J', 68750, 'Prototype', 'Kartu Alice Carroll J!', 25, 'img/CB011'),
(70, 'Akira E Ferarri', 36000, 'Prototype', 'Kartu Aika E Ferarri A!', 23, 'img/CB041'),
(71, 'Albert Pitt', 500000, 'Grunts', 'Kartu Albert Pitt!', 35, 'img/CB047'),
(72, 'Aika S Granzchesta A', 25000, 'Grunts', 'Kartu Aika S Granzchesta A!', 23, 'img/CBP05'),
(73, 'Aika S Granzchesta B', 2000, 'Grunts', 'Kartu Aika S Granzchesta B', 11, 'img/CBT04'),
(74, 'Akira E Ferarri B', 55000, 'Grunts', 'Kartu Akira E Ferarri B!', 21, 'img/CBT07'),
(75, 'Akira E Ferarri C', 150000, 'Grunts', 'Kartu Akira E Ferarri C!', 8, 'img/CB027'),
(76, 'Aika S Granzchesta C', 14000, 'Special Paint Version', 'Kartu Aika S Granzchesta C!', 22, 'img/CB034'),
(77, 'Aika S Granzchesta D', 12250, 'Special Paint Version', 'Kartu Aika S Granzchesta D!', 55, 'img/CB035'),
(78, 'Aika S Granzchesta E', 35000, 'Special Paint Version', 'Kartu Aika S Granzchesta E!', 21, 'img/CB036'),
(79, 'Akira E Ferrari D', 25000, 'Special Paint Version', 'Kartu Akira E Ferrari D!', 25, 'img/CB040'),
(80, 'Aika S Granzchesta F', 33500, 'Special Paint Version', 'Kartu Aika S Granzchesta F!', 25, 'img/CB009'),
(81, 'Akira E Ferrari E', 45600, 'Zeon Obsolete Suits', 'Kartu Akira E Ferrari F', 89, 'img/CB014'),
(82, 'Aika and Hime', 78500, 'Zeon Obsolete Suits', 'Kartu Aika dan Hime-sachou!', 4, 'img/CB018'),
(83, 'Aika S Granzchesta G', 47650, 'Zeon Obsolete Suits', 'Kartu Aika S Granzchesta G!', 43, 'img/CB020'),
(84, 'Akira E Ferrari G', 125000, 'Zeon Obsolete Suits', 'Kartu Akira E Ferarri G!', 250, 'img/CB026'),
(85, 'Aika S Granzchesta H', 33850, 'Zeon Obsolete Suits', 'Kartu Aika S Granzchesta H!', 65, 'img/CB002');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `provinsi` varchar(30) NOT NULL,
  `kotakabupaten` varchar(30) NOT NULL,
  `kodepos` int(11) NOT NULL,
  `nomor_handphone` varchar(20) NOT NULL,
  `creditcardnum` int(11) NOT NULL,
  `creditcardname` varchar(50) NOT NULL,
  `expireddate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `full_name`, `alamat`, `provinsi`, `kotakabupaten`, `kodepos`, `nomor_handphone`, `creditcardnum`, `creditcardname`, `expireddate`) VALUES
('bobo', 'bobo', '119f4b5c5d092f9f61369118509b3e98', '', '', '', '0', 0, '0', 0, '', '0000-00-00'),
('emon', 'emon@blah.com', 'emonganteng', 'Andri Eka', 'JL Kartika 1', 'Jawa Barat', 'Bandung', 14045, '085720144155', 0, '', '0000-00-00'),
('faiz', 'faiz@blablabla.com', '8b6bc5d8046c8466359d', '', '', '', '0', 0, '0', 0, '', '0000-00-00'),
('qwqwqwqwwqwqw', 'sesesuatau@sejsej.com', '12345678', 'qwqw qwqwqw', 'wewew', 'wewe', '2w2w2ww', 0, 'wqwqwqw', 0, '', '0000-00-00'),
('qwqwqwwqwqw', 'sesesuatau@sejs2ej.com', '12345678', 'qwqw qwqwqw', 'wewew', 'wewe', '2w2w2ww', 0, 'wqwqwqw', 0, '', '0000-00-00'),
('sxsxx', 'andriok_emon@yahoo.co.id', '12345678', 'xsxs xsxs', 'swswsws', 'wswswsw', 'swswsw', 0, '121212212', 0, '', '0000-00-00'),
('sxsxx11', 'andriok_emon@yao.co.id', '12345678', 'xsxs xsxs', 'swswsws', 'wswswsw', 'swswsw', 0, '121212212', 0, '', '0000-00-00'),
('sxsxx122', 'andriok_emon@yo.co.id', '12345678', 'xsxs xsxs', 'swswsws', 'wswswsw', 'swswsw', 0, '121212212', 0, '', '0000-00-00'),
('sxsxx1222', 'andriok_e21mon@yo.co.id', '12345678', 'xsxs xsxs', 'swswsws', 'wswswsw', 'swswsw', 0, '121212212', 0, '', '0000-00-00'),
('Testing', 'asd@sqw.as', '12345678', '2 2', '123', '123', '123', 123, '123', 0, '', '0000-00-00'),
('TesUser', 'tes@user.net', '12345678', 'Tes User', '@', '@', '@', 0, '12345', 123123, '123123', '1994-02-01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
