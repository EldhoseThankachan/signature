-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2024 at 05:05 PM
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
-- Database: `db_esports`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'Admin@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `tournament_id` int(50) NOT NULL,
  `payment_status` int(50) NOT NULL DEFAULT 0,
  `booking_status` int(50) NOT NULL DEFAULT 0,
  `booking_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `user_id`, `tournament_id`, `payment_status`, `booking_status`, `booking_date`) VALUES
(53, 17, 51, 0, 1, '2023-01-07'),
(57, 20, 54, 0, 1, '2023-01-13'),
(58, 21, 55, 0, 1, '2023-01-13'),
(63, 24, 59, 0, 1, '2023-03-03'),
(64, 25, 60, 0, 1, '2023-03-06'),
(65, 24, 59, 0, 1, '2023-03-07'),
(66, 24, 61, 0, 0, '2023-03-07'),
(67, 24, 59, 0, 0, '2024-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(50) NOT NULL,
  `complaint_content` varchar(50) NOT NULL,
  `complaint_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `complaint_reply` varchar(100) NOT NULL DEFAULT 'Not yet received',
  `complaint_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_content`, `complaint_date`, `user_id`, `organization_id`, `complaint_reply`, `complaint_status`) VALUES
(30, 'fanaticcomplaint', '2023-01-07', 0, 12, 'fanaticreply', 0),
(33, 'lagging \r\nhanging', '2023-01-13', 19, 0, 'will fix it', 0),
(34, 'entitys complaint', '2023-01-13', 0, 14, 'reply fo rentity', 0),
(35, 'This is jomon and the site is lagging', '2023-01-14', 0, 18, 'Ok jomon we will fix it', 0),
(38, 'cmp', '2023-01-31', 23, 0, 'noted', 0),
(39, 'gg', '2023-03-03', 24, 0, 'k', 0),
(40, 'og', '2023-03-03', 0, 20, 'kk', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`, `state_id`) VALUES
(27, 'Thiruvananthapuram', 20),
(28, 'Kollam', 20),
(29, 'Pathanamthitta', 20),
(30, 'Alappuzha', 20),
(31, 'Kottayam', 20),
(32, 'Idukki', 20),
(33, 'Ernakulam', 20),
(34, 'Thrissur', 20),
(35, 'Palakkad', 20),
(36, 'Malappuram', 20),
(37, 'Kozhikode', 20),
(38, 'Wayanad', 20),
(39, 'Kannur', 20),
(40, 'Kasaragod', 20),
(41, 'Chennai', 21),
(46, 'Coimbatore', 21),
(47, 'Madurai', 21),
(48, 'Nagapattinam', 21),
(49, 'Kanyakumari', 21),
(51, 'Salem', 21),
(52, 'Amritsar', 22),
(53, 'Patiala', 22),
(54, 'Barnala', 22),
(55, 'Bathinda', 22),
(56, 'Bagalkot', 23),
(57, 'Bengaluru', 23),
(58, 'Ballari', 23),
(59, 'Mysuru', 23),
(60, 'Udupi', 23),
(61, 'Srikakulam', 24),
(62, 'Manyam', 24),
(63, 'Visakhapatnam', 24),
(64, 'Anakapalli', 24),
(65, 'Araria', 25),
(66, 'Banka', 25),
(67, 'Bhojpur', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(50) NOT NULL,
  `feedback_content` varchar(50) NOT NULL,
  `user_id` int(50) NOT NULL DEFAULT 0,
  `organization_id` int(50) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_content`, `user_id`, `organization_id`) VALUES
(22, 'fanaticfeedback', 0, 12),
(26, 'entity feedback', 0, 14),
(27, 'This is jomon and is very good', 0, 18),
(28, 'This is Aswin and is too good', 22, 0),
(30, 'fd', 23, 0),
(31, 'gg', 24, 0),
(32, 'og', 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gametype`
--

CREATE TABLE `tbl_gametype` (
  `gametype_id` int(11) NOT NULL,
  `gametype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_gametype`
--

INSERT INTO `tbl_gametype` (`gametype_id`, `gametype_name`) VALUES
(26, 'BGMI'),
(27, 'PUBG'),
(28, 'Valorant'),
(29, 'Clash Of Clans'),
(30, 'Call Of Duty'),
(31, 'FIFA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_organization`
--

CREATE TABLE `tbl_organization` (
  `organization_id` int(11) NOT NULL,
  `organization_name` varchar(50) NOT NULL,
  `organization_address` varchar(50) NOT NULL,
  `organization_contact` varchar(50) NOT NULL,
  `organization_email` varchar(50) NOT NULL,
  `organization_logo` varchar(50) NOT NULL,
  `organization_proof` varchar(50) NOT NULL,
  `organization_password` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `organization_vstatus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_organization`
--

INSERT INTO `tbl_organization` (`organization_id`, `organization_name`, `organization_address`, `organization_contact`, `organization_email`, `organization_logo`, `organization_proof`, `organization_password`, `place_id`, `organization_vstatus`) VALUES
(12, 'Fanatics', 'fanatic village', '7658905437', 'Fanatic@gmail.com', 'IMG_5214.JPG', 'jithu img.JPG', 'Fanatic123456', 21, 1),
(14, 'Entitytsm', 'entity organization bangalore', '9876546789', 'entity@gmail.com', 'an.jpg', 'an.jpg', 'Entity1234', 21, 1),
(18, 'Jomoon', 'Jomonhouse Muvattupuzha', '9745678956', 'Jomon@gmail.com', 'an.jpg', 'an.jpg', 'Jomon1234', 37, 1),
(20, 'BlindES', 'Ekm', '9876567849', 'Blindes@gmail.com', 'an.jpg', 'an.jpg', 'Blind123', 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(19, 'Muvattupuzha', 21),
(20, 'kk', 22),
(21, 'cc', 23),
(22, 'mm', 25),
(23, 'batheri', 26),
(24, 'Chirayinkeezhu', 27),
(25, 'Neyyattinkara', 27),
(26, 'Paravoor', 28),
(27, 'Kottappuram', 28),
(28, 'Kozhenchery', 29),
(29, 'Adoor', 29),
(30, 'Cherthala', 30),
(31, 'Kuttanadu', 30),
(32, 'Changanassery', 31),
(33, 'Vaikom', 31),
(34, 'Devikulam', 32),
(35, 'Thodupuzha', 32),
(36, 'Aluva', 33),
(37, 'Muvattupuzha', 33),
(38, 'chavakkad', 34),
(39, 'Kodungallur', 34),
(40, 'Ottappalam', 35),
(41, 'Alathur', 35),
(42, 'Ernad', 36),
(43, 'Perinthalmanna', 36),
(44, 'Koduvally', 37),
(45, 'Thiruvambady', 37),
(46, 'Sulthanbathery', 38),
(47, 'Vythiri', 38),
(48, 'Thalasseri', 39),
(49, 'Thaliparamba', 39),
(50, 'Hosdurg', 40),
(51, 'Manjeshwaram', 40),
(52, 'Ambattur', 41),
(53, 'Pollachi', 46),
(54, 'Melur', 47),
(55, 'Kilvelur', 48),
(56, 'Thovalai', 49),
(57, 'Attur', 51),
(58, 'Ajnala', 52),
(59, 'Nabha', 53),
(60, 'Tapa', 54),
(61, 'Bareta', 55),
(62, 'Badami', 56),
(63, 'Kengeri', 57),
(64, 'Hadagalli', 58),
(65, 'Hunsur', 59),
(66, 'Karkala', 60),
(67, 'Burja', 61),
(68, 'Maddur', 62),
(69, 'Anakapalle', 63),
(70, 'Araku', 64),
(71, 'Jokihat', 65),
(72, 'Katoria', 66),
(73, 'Sahar', 67);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `state_name`) VALUES
(20, 'Kerala'),
(21, 'Tamilnadu'),
(22, 'Punjab'),
(23, 'Karnataka'),
(24, 'Andhra Pradesh'),
(25, 'Bihar');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tournament`
--

CREATE TABLE `tbl_tournament` (
  `tournament_id` int(100) NOT NULL,
  `tournament_name` varchar(50) NOT NULL,
  `tournament_type` varchar(50) NOT NULL,
  `tournament_gtype` varchar(50) NOT NULL,
  `tournament_slots` varchar(50) NOT NULL,
  `tournament_fee` varchar(100) NOT NULL,
  `tournament_landmark` varchar(100) NOT NULL,
  `place_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_tournament`
--

INSERT INTO `tbl_tournament` (`tournament_id`, `tournament_name`, `tournament_type`, `tournament_gtype`, `tournament_slots`, `tournament_fee`, `tournament_landmark`, `place_id`, `organization_id`) VALUES
(55, 'Epicknight', '17', '21', '2', '3', 'wd', 19, 15),
(56, 'Colosal', '18', '22', '3', '40', 'jshg', 19, 17),
(59, 'KPL', '17', '26', '25', '300', 'ground', 25, 20),
(61, 'Jomon', '17', '26', '4', '400', 'near ground', 37, 20),
(62, 'Newtournament', '17', '31', '5', '400', 'dfgvcc', 37, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tournamenttype`
--

CREATE TABLE `tbl_tournamenttype` (
  `tournamenttype_id` int(11) NOT NULL,
  `tournamenttype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_tournamenttype`
--

INSERT INTO `tbl_tournamenttype` (`tournamenttype_id`, `tournamenttype_name`) VALUES
(17, 'Mobile'),
(21, 'PC'),
(22, 'PS5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_contact` varchar(10) NOT NULL,
  `place_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_gender` varchar(10) NOT NULL,
  `user_photo` varchar(50) NOT NULL,
  `user_proof` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_vstatus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_address`, `user_contact`, `place_id`, `user_email`, `user_gender`, `user_photo`, `user_proof`, `user_password`, `user_vstatus`) VALUES
(17, 'EbinK', 'ebinhouse', '9856789056', 23, 'mrjj0317@gmail.com', 'Male', 'jithu img.JPG', 'jithu img.JPG', 'Ebin12345', 0),
(19, 'Aswin Unni', 'pallikall (h) muvattupuzha po', '9996756789', 19, 'appu71679@gmail.com', 'Male', 'an.jpg', 'an.jpg', 'Aswinunni234', 0),
(21, 'Prajith', 'pp', '9876567897', 21, 'prajithprakash2001@gmail.com', 'Male', 'an.jpg', 'an.jpg', 'Prajith123', 0),
(24, 'Aswin', 'abcd', '8754678987', 26, 'aswinsasi535@gmail.com', 'Male', 'an.jpg', 'an.jpg', 'Aswin1234', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_gametype`
--
ALTER TABLE `tbl_gametype`
  ADD PRIMARY KEY (`gametype_id`);

--
-- Indexes for table `tbl_organization`
--
ALTER TABLE `tbl_organization`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tbl_tournament`
--
ALTER TABLE `tbl_tournament`
  ADD PRIMARY KEY (`tournament_id`);

--
-- Indexes for table `tbl_tournamenttype`
--
ALTER TABLE `tbl_tournamenttype`
  ADD PRIMARY KEY (`tournamenttype_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_gametype`
--
ALTER TABLE `tbl_gametype`
  MODIFY `gametype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_organization`
--
ALTER TABLE `tbl_organization`
  MODIFY `organization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_tournament`
--
ALTER TABLE `tbl_tournament`
  MODIFY `tournament_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_tournamenttype`
--
ALTER TABLE `tbl_tournamenttype`
  MODIFY `tournamenttype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
