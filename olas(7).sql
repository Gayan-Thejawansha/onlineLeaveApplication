-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 05:38 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olas`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', '2021-01-15 16:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`) VALUES
(6, 'Human Resources', 'HR', '002', '2021-01-20 03:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Nic` varchar(15) NOT NULL,
  `Sechead` varchar(50) NOT NULL,
  `Institute` varchar(50) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Phonenumber`, `Category`, `Nic`, `Sechead`, `Institute`, `Status`, `RegDate`) VALUES
(4, 'emp1', 'abc', 'def', 'abc@123', 'e10adc3949ba59abbe56e057f20f883e', 'Male', '2 January, 2014', '', 'kandy', '011236547', '', '14236587v', 'ngssksj', '14236587v', '0', '2021-01-19 08:28:47'),
(5, 'EMP2', 'ASD', 'FGH', 'xyz@123', '25f9e794323b453885f5181f1b624d0b', 'Female', '0000-00-00 00:00:00', '', 'kan', '0112365478', 'Executive', '165899', 'fhjhkhk', 'naicc', '1', '2021-01-19 10:06:00'),
(6, 'EMP1', 'anny', 'peris', 'bbb@123', '827ccb0eea8a706c4c34a16891f84e7b', 'Female', '0000-00-00 00:00:00', 'Human Resources', 'Kandy', '0112335455', '', '12365478v', 'mr.ab', '12365478v', '', '2021-01-20 03:35:35'),
(7, 'emp5', 'ccc', 'ddd', 'ccc@123456', 'e10adc3949ba59abbe56e057f20f883e', 'Female', '0000-00-00 00:00:00', 'Human Resources', 'colombo', '0123654789', 'Officer', '123654v', 'mr.hfz', 'Naicc', '1', '2021-01-21 06:00:47'),
(8, 'EMP6', 'ann', 'silva', 'ann@12', '25f9e794323b453885f5181f1b624d0b', 'Female', '2 January, 2009', 'Human Resources', 'dam', '0112365478', 'Executive', '123654789', 'miss.bak', 'NAICC', '1', '2021-01-21 06:49:39'),
(9, 'Emp123', 'abcd', 'efgh', 'abcd@123', '202cb962ac59075b964b07152d234b70', 'Female', '2 January, 2014', 'Human Resources', 'Kndy', '0112365478', 'Officer', '123654v', 'Mr.Perera', 'NAICC', '1', '2021-01-22 03:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AppSecHead` varchar(15) NOT NULL,
  `AppDirector` varchar(15) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AppSecHead`, `AppDirector`, `empid`) VALUES
(11, 'Personal Leavee', '21/01/2021', '25/01/2021', 'm.l;;kk', '2021-01-21 09:31:34', '', '', 8),
(12, 'Personal Leavee', '21/01/2021', '25/01/2021', 'm.l;;kk', '2021-01-21 09:37:52', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `CreationDate`) VALUES
(4, 'Personal Leavee', 'sick', '2021-01-16 03:01:59'),
(5, 'Casual Leave', 'Maximum Limit 21 per year; But any employee can request maximum 6 casual leaves at a time', '2021-01-17 18:38:52'),
(6, 'Vacation', 'Maximum Limit 24 per year. can apply all 21 at once if he wants', '2021-01-17 18:40:35'),
(7, 'Other', 'Duty Leave/Maternity Leave/Paternity Leave', '2021-01-17 18:42:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
