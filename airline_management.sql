-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 10:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `AirlineId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `FoundedYear` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`AirlineId`, `Name`, `Country`, `FoundedYear`) VALUES
(1, 'AirBLue', 'Pakistan', 2004),
(2, ' Emirates Airline', 'UAE', 1985),
(3, 'Qatar Airways', 'Qatar', 1993),
(4, 'EVa Air', 'Taiwan', 1989),
(5, 'BlueBird Airways', 'Canada', 2002);

-- --------------------------------------------------------

--
-- Table structure for table `airplanes`
--

CREATE TABLE `airplanes` (
  `AirplaneId` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `AirlineId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airplanes`
--

INSERT INTO `airplanes` (`AirplaneId`, `Model`, `Capacity`, `AirlineId`) VALUES
(1, 'Boeing 737', 160, 1),
(2, 'Airbus A320', 180, 2),
(3, 'Boeing 777', 396, 3),
(4, 'Airbus A380', 525, 4),
(5, 'Embraer E190', 100, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingId` int(11) NOT NULL,
  `PassengerId` int(11) DEFAULT NULL,
  `FlightId` int(11) DEFAULT NULL,
  `BookingDate` datetime NOT NULL,
  `SeatNumber` varchar(10) NOT NULL,
  `Price` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingId`, `PassengerId`, `FlightId`, `BookingDate`, `SeatNumber`, `Price`, `Status`) VALUES
(1, 1, 1, '2024-10-01 14:30:00', '12A', 35000, 'Confirmed'),
(2, 2, 2, '2024-10-02 10:00:00', '14B', 45000, 'Confirmed'),
(3, 3, 3, '2024-10-03 09:15:00', '15C', 60000, 'Pending'),
(4, 4, 4, '2024-10-04 16:45:00', '18D', 40000, 'Confirmed'),
(5, 5, 5, '2024-10-05 11:00:00', '21E', 55000, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `FlightId` int(11) NOT NULL,
  `FlightNumber` varchar(50) NOT NULL,
  `AirplaneId` int(11) DEFAULT NULL,
  `DepartureAirport` varchar(100) DEFAULT NULL,
  `ArrivalAirport` varchar(100) DEFAULT NULL,
  `PilotId` int(11) DEFAULT NULL,
  `Pilot_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`FlightId`, `FlightNumber`, `AirplaneId`, `DepartureAirport`, `ArrivalAirport`, `PilotId`, `Pilot_Id`) VALUES
(1, 'SK123', 1, 'PAKISTAN', 'JEDDAH', NULL, NULL),
(2, 'BB456', 2, 'SAUDIA', 'PAKISTAN', NULL, NULL),
(3, 'GW789', 3, 'LONDON', 'DUBAI', NULL, NULL),
(4, 'SK987', 4, 'NEW PORK', 'TOKYO', NULL, NULL),
(5, 'BB654', 5, 'PAKISTAN', 'SUDIA', NULL, NULL),
(16, '', NULL, NULL, NULL, NULL, 1),
(17, '', NULL, NULL, NULL, NULL, 5),
(18, '', NULL, NULL, NULL, NULL, 1),
(19, '', NULL, NULL, NULL, NULL, 5),
(20, '', NULL, NULL, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `flight_attendant`
--

CREATE TABLE `flight_attendant` (
  `AttendantId` int(11) NOT NULL,
  `TrainingCompleted` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight_attendant`
--

INSERT INTO `flight_attendant` (`AttendantId`, `TrainingCompleted`) VALUES
(2, '2020-05-15'),
(3, '2019-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `flight_schedule`
--

CREATE TABLE `flight_schedule` (
  `ScheduleId` int(11) NOT NULL,
  `FlightId` int(11) DEFAULT NULL,
  `DepartureTime` datetime NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight_schedule`
--

INSERT INTO `flight_schedule` (`ScheduleId`, `FlightId`, `DepartureTime`, `ArrivalTime`, `Status`) VALUES
(1, 1, '2024-10-15 09:00:00', '2024-10-15 12:30:00', 'Scheduled'),
(2, 2, '2024-10-15 14:00:00', '2024-10-15 20:00:00', 'On Time'),
(3, 3, '2024-10-16 07:00:00', '2024-10-16 14:00:00', 'Delayed'),
(4, 4, '2024-10-16 23:30:00', '2024-10-17 06:00:00', 'Scheduled'),
(5, 5, '2024-10-17 10:00:00', '2024-10-17 13:45:00', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PassengerId` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PassportNumber` varchar(30) NOT NULL,
  `DateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PassengerId`, `FirstName`, `LastName`, `Email`, `PassportNumber`, `DateOfBirth`) VALUES
(1, 'Ismail', 'Khan', 'ismail.khan@email.com', 'A12345678', '1985-05-14'),
(2, 'Zehra', 'Khan', 'zehra.khan@email.com', 'B87654321', '2003-07-22'),
(3, 'Umaima', 'Aijaz', 'umaima.aijaz@email.com', 'C23456789', '2006-09-10'),
(4, 'Maryam', 'Rafiq', 'maryam.rafiq@email.com', 'D98765432', '2000-03-18'),
(5, 'Aneeqa', 'Masroor', 'aneeqa.masroor@email.com', 'E45678901', '2003-12-25');

-- --------------------------------------------------------

--
-- Table structure for table `pilots`
--

CREATE TABLE `pilots` (
  `PilotId` int(11) NOT NULL,
  `LicenseNumber` varchar(50) NOT NULL,
  `ExperienceYears` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pilots`
--

INSERT INTO `pilots` (`PilotId`, `LicenseNumber`, `ExperienceYears`) VALUES
(1, 'P123456', 5),
(5, 'P124355', 7);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffId` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `HireDate` date DEFAULT NULL,
  `Salary` int(11) NOT NULL,
  `AirlineId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffId`, `FirstName`, `LastName`, `Role`, `HireDate`, `Salary`, `AirlineId`) VALUES
(1, 'Alice', 'Johnson', 'Pilot', '2020-01-15', 100000, 1),
(2, 'Alice', 'Smith', 'Flight Attendant', '2019-01-12', 56000, 2),
(3, 'Carol', 'Williams', 'Check-in Staff', '2019-10-21', 50000, 3),
(4, 'David', 'Brown', 'Manager', '2021-10-21', 150000, 4),
(5, 'Eva', 'Davis', 'Pilot', '2017-05-21', 110000, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`AirlineId`);

--
-- Indexes for table `airplanes`
--
ALTER TABLE `airplanes`
  ADD PRIMARY KEY (`AirplaneId`),
  ADD KEY `AirlineId` (`AirlineId`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingId`),
  ADD UNIQUE KEY `SeatNumber` (`SeatNumber`),
  ADD KEY `PassengerId` (`PassengerId`),
  ADD KEY `FlightId` (`FlightId`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FlightId`),
  ADD KEY `AirplaneId` (`AirplaneId`),
  ADD KEY `Pilot_Id` (`Pilot_Id`);

--
-- Indexes for table `flight_attendant`
--
ALTER TABLE `flight_attendant`
  ADD PRIMARY KEY (`AttendantId`);

--
-- Indexes for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD PRIMARY KEY (`ScheduleId`),
  ADD KEY `FlightId` (`FlightId`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PassengerId`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `PassportNumber` (`PassportNumber`);

--
-- Indexes for table `pilots`
--
ALTER TABLE `pilots`
  ADD PRIMARY KEY (`PilotId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffId`),
  ADD KEY `AirlineId` (`AirlineId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `AirlineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `airplanes`
--
ALTER TABLE `airplanes`
  MODIFY `AirplaneId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `FlightId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  MODIFY `ScheduleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `PassengerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airplanes`
--
ALTER TABLE `airplanes`
  ADD CONSTRAINT `airplanes_ibfk_1` FOREIGN KEY (`AirlineId`) REFERENCES `airlines` (`AirlineId`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`PassengerId`) REFERENCES `passenger` (`PassengerId`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`FlightId`) REFERENCES `flights` (`FlightId`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`AirplaneId`) REFERENCES `airplanes` (`AirplaneId`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`Pilot_Id`) REFERENCES `pilots` (`PilotId`);

--
-- Constraints for table `flight_attendant`
--
ALTER TABLE `flight_attendant`
  ADD CONSTRAINT `flight_attendant_ibfk_1` FOREIGN KEY (`AttendantId`) REFERENCES `staff` (`StaffId`);

--
-- Constraints for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD CONSTRAINT `flight_schedule_ibfk_1` FOREIGN KEY (`FlightId`) REFERENCES `flights` (`FlightId`);

--
-- Constraints for table `pilots`
--
ALTER TABLE `pilots`
  ADD CONSTRAINT `pilots_ibfk_1` FOREIGN KEY (`PilotId`) REFERENCES `staff` (`StaffId`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`AirlineId`) REFERENCES `airlines` (`AirlineId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
