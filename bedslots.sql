-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2023 at 05:50 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bedslots`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `gethospitalusers` ()   select * from hospitaluser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatientDetails` (IN `inp` VARCHAR(100))  NO SQL BEGIN
SELECT PNAME,PPHONE,PADDRESS,BEDTYPE FROM bookingpatients WHERE hcode=inp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsers` ()  NO SQL SELECT * FROM user$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookingpatients`
--

CREATE TABLE `bookingpatients` (
  `id` int(11) NOT NULL,
  `srfid` varchar(50) NOT NULL,
  `bedtype` varchar(50) NOT NULL,
  `hcode` varchar(50) NOT NULL,
  `spo2` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `pphone` varchar(12) NOT NULL,
  `paddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookingpatients`
--

INSERT INTO `bookingpatients` (`id`, `srfid`, `bedtype`, `hcode`, `spo2`, `pname`, `pphone`, `paddress`) VALUES
(1, 'KA9121', 'ICUBed', 'BGS11', 86, 'david', '6798222231', 'Bangalore'),
(4, 'KA004', 'ICUBed', 'BGS11', 21, 'john', '974014455', 'kanakpura'),
(5, 'KA003', 'VENTILATORBed', 'BGS11', 80, 'varshitha', '9741144871', 'Mandya'),
(6, 'KA9898', 'NormalBed', 'BGS11', 70, 'johnj', '6789543452', 'kanakpura');

--
-- Triggers `bookingpatients`
--
DELIMITER $$
CREATE TRIGGER `oxygen_trig` AFTER INSERT ON `bookingpatients` FOR EACH ROW BEGIN
	IF (NEW.spo2 <75) THEN
    	insert into patient_trig
        values (null,new.srfid,new.spo2,new.pname,'oxygen level too low',now());
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldata`
--

CREATE TABLE `hospitaldata` (
  `id` int(11) NOT NULL,
  `hcode` varchar(200) NOT NULL,
  `hname` varchar(200) NOT NULL,
  `normalbed` int(11) NOT NULL,
  `hicubed` int(11) NOT NULL,
  `icubed` int(11) NOT NULL,
  `vbed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitaldata`
--

INSERT INTO `hospitaldata` (`id`, `hcode`, `hname`, `normalbed`, `hicubed`, `icubed`, `vbed`) VALUES
(1, 'BGS11', 'BGS Global hospital ', 49, 25, 12, 8),
(2, 'GOV23', 'Govt hospital mandya', 40, 12, 6, 1),
(4, 'AIMS02', 'Aims', 20, 10, 5, 4);

--
-- Triggers `hospitaldata`
--
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `hospitaldata` FOR EACH ROW INSERT INTO trigs VALUES(null,NEW.hcode,NEW.normalbed,NEW.hicubed,NEW.icubed,NEW.vbed,' INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update` AFTER UPDATE ON `hospitaldata` FOR EACH ROW INSERT INTO trigs VALUES(null,NEW.hcode,NEW.normalbed,NEW.hicubed,NEW.icubed,NEW.vbed,' UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delet` BEFORE DELETE ON `hospitaldata` FOR EACH ROW INSERT INTO trigs VALUES(null,OLD.hcode,OLD.normalbed,OLD.hicubed,OLD.icubed,OLD.vbed,' DELETED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaluser`
--

CREATE TABLE `hospitaluser` (
  `id` int(11) NOT NULL,
  `hcode` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitaluser`
--

INSERT INTO `hospitaluser` (`id`, `hcode`, `email`, `password`) VALUES
(1, 'BGS11', 'bgshsp@gmail.com', 'pbkdf2:sha256:260000$VtvHPPtdLxlt81Mp$a0f2fced3114428c9701abcc773a5b1e55d6b3991b7435ebe05ebbdfac0789cb'),
(2, 'GOV23', 'govthsp@gmail.com', 'pbkdf2:sha256:260000$E1s08Oa2zcwWv5SU$79aad5be4d184976b2c75ef5c4322689cfc11764bb0ccfcb31827cdb8e107dfa'),
(3, 'MNP13', 'mnphsp@gmail.com', 'pbkdf2:sha256:260000$ppjRX9NsM95fdd8a$e6f318429c5d2aeadd096dd58d3fe92ce6c95919a771421038c82da0cb36e2b7'),
(4, 'NMS45', 'nmshsp@gmail.com', 'pbkdf2:sha256:260000$tVjtK3xl7ZKjnIWg$ead212412bf85c77432757cab717e4f3c21e63e28099981537b0d8542ed310bf'),
(5, 'AIMS02', 'aimshsp@gmail.com', 'pbkdf2:sha256:260000$O1XP8KyCvF2Fu5aL$46701f052c52f6e46366854beb11feffaaa54bc0d64d4b06e2c3f0c0928a8e10'),
(6, 'ABC12', 'abchsp@gmail.com', 'pbkdf2:sha256:260000$XGyDMKpa4g3u7MeH$88eb04820f5e1b5e0ded99ed576974040cdb1f1eb464a5b69a13ca866d8b8b30');

-- --------------------------------------------------------

--
-- Table structure for table `patient_trig`
--

CREATE TABLE `patient_trig` (
  `id` int(11) NOT NULL,
  `srfid` varchar(50) NOT NULL,
  `spo2` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `action` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_trig`
--

INSERT INTO `patient_trig` (`id`, `srfid`, `spo2`, `pname`, `action`, `date`) VALUES
(1, 'KA003', 60, 'ram', 'Go to hospital soon', '2023-02-04 12:56:05'),
(2, 'KA004', 21, 'john', 'oxygen level too low', '2023-02-04 13:00:49'),
(3, 'KA9898', 70, 'johnj', 'oxygen level too low', '2023-02-04 22:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'sukanya'),
(2, 'varshitha');

-- --------------------------------------------------------

--
-- Table structure for table `trigs`
--

CREATE TABLE `trigs` (
  `id` int(11) NOT NULL,
  `hcode` varchar(50) NOT NULL,
  `normalbed` int(11) NOT NULL,
  `hicubed` int(11) NOT NULL,
  `icubed` int(11) NOT NULL,
  `vbed` int(11) NOT NULL,
  `querys` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trigs`
--

INSERT INTO `trigs` (`id`, `hcode`, `normalbed`, `hicubed`, `icubed`, `vbed`, `querys`, `date`) VALUES
(1, 'BGS11', 50, 26, 14, 9, ' INSERTED', '2023-02-03 15:10:03'),
(2, 'BGS11', 50, 26, 13, 9, ' UPDATED', '2023-02-03 15:11:45'),
(3, 'GOV23', 40, 12, 6, 2, ' INSERTED', '2023-02-03 15:14:05'),
(4, 'NMS45', 89, 56, 23, 10, ' INSERTED', '2023-02-03 15:16:08'),
(5, 'NMS45', 81, 56, 23, 9, ' UPDATED', '2023-02-03 15:17:29'),
(6, 'NMS45', 81, 56, 23, 9, ' DELETED', '2023-02-03 15:17:40'),
(7, 'GOV23', 40, 12, 6, 1, ' UPDATED', '2023-02-04 12:56:05'),
(8, 'BGS11', 50, 25, 13, 9, ' UPDATED', '2023-02-04 12:58:34'),
(9, 'BGS11', 50, 25, 12, 9, ' UPDATED', '2023-02-04 13:00:49'),
(10, 'BGS11', 50, 25, 12, 8, ' UPDATED', '2023-02-04 13:02:41'),
(11, 'AIMS02', 20, 10, 5, 2, ' INSERTED', '2023-02-04 21:59:11'),
(12, 'AIMS02', 20, 10, 5, 4, ' UPDATED', '2023-02-04 21:59:26'),
(13, 'ABC12', 30, 12, 5, 2, ' INSERTED', '2023-02-04 22:26:46'),
(14, 'ABC12', 28, 11, 5, 4, ' UPDATED', '2023-02-04 22:27:00'),
(15, 'ABC12', 28, 11, 5, 4, ' DELETED', '2023-02-04 22:27:08'),
(16, 'BGS11', 49, 25, 12, 8, ' UPDATED', '2023-02-04 22:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `srfid` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `srfid`, `email`, `dob`) VALUES
(1, 'KA9121', 'david@gmail.com', 'pbkdf2:sha256:260000$tcP1U1YFCvMrqcbz$6ff833e69be657cceb73f50ee5fdbd8be912d310c4eb541b2a44f0e20a6c2654'),
(2, 'KA003', 'ramp@gmail.com', 'pbkdf2:sha256:260000$P0CwInKglc8PINLR$91a9035b2064ca043a2ea25365a2e5b4ac43f216f897c3db05c0a610134de6e7'),
(3, 'KA004', 'ganavi@gmail.com', 'pbkdf2:sha256:260000$RAgLKiBR1l8mpc5x$0093a568968c20c4fb846c55a56d25e867d2047251c9d22d8bf5cf343650641a'),
(4, 'KA9898', 'usernew@gmail.com', 'pbkdf2:sha256:260000$zzAwVxZkdEKikcMk$d60b093a723cfc1efb523627231154f96ada13d0fa948994bae515fa8772b402');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingpatients`
--
ALTER TABLE `bookingpatients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `srfid` (`srfid`);

--
-- Indexes for table `hospitaldata`
--
ALTER TABLE `hospitaldata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hcode` (`hcode`);

--
-- Indexes for table `hospitaluser`
--
ALTER TABLE `hospitaluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_trig`
--
ALTER TABLE `patient_trig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigs`
--
ALTER TABLE `trigs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `srfid` (`srfid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingpatients`
--
ALTER TABLE `bookingpatients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hospitaldata`
--
ALTER TABLE `hospitaldata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospitaluser`
--
ALTER TABLE `hospitaluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient_trig`
--
ALTER TABLE `patient_trig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trigs`
--
ALTER TABLE `trigs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
