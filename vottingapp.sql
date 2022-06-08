-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220531.aadb8cc914
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 08, 2022 at 06:03 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vottingapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cagub`
--

CREATE TABLE `cagub` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kekayaan` int(11) NOT NULL,
  `tempattinggal` varchar(100) NOT NULL,
  `urlimg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cagub`
--

INSERT INTO `cagub` (`id`, `nama`, `kekayaan`, `tempattinggal`, `urlimg`) VALUES
(1, 'Nurhadi', 15000000, 'JL. Purwodadi 1', 'http://10.0.2.2/votingapp/images/nurhadi.png'),
(2, 'Malin', 2000000000, 'JL. Kayu Mas, Pekanbaru', 'http://10.0.2.2/votingapp/images/calon2.png');

-- --------------------------------------------------------

--
-- Table structure for table `calon`
--

CREATE TABLE `calon` (
  `id` int(5) NOT NULL,
  `idcagub` int(11) NOT NULL,
  `idwagub` int(11) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nomorurut`
--

CREATE TABLE `nomorurut` (
  `idcalon` int(5) NOT NULL,
  `iduser` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `statusvoting` tinyint(1) NOT NULL DEFAULT 0,
  `tempattinggal` varchar(100) NOT NULL,
  `imgurl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nik`, `namalengkap`, `statusvoting`, `tempattinggal`, `imgurl`) VALUES
(5, 'test@localhost.com', '1234', '1122334455', 'SI Tester', 0, 'Jl. Tester, Arizona', 'http://10.0.2.2/votingapp/images/4629Cat03.jpg'),
(6, 'fikri@localhost.com', '1234', '11323231231', 'Muhammad Fikri', 0, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/7445pexels-pixabay-417173.jpg'),
(7, 'admin@localhost.com', 'admin', '0', 'Admin', 0, 'Jl. 0000, Pekanbaru', 'http://10.0.2.2/votingapp/images/5798tester.jpg'),
(8, 'zul', 'zul', '0', 'Zul Hilmi', 0, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/8937mount.jpg'),
(9, 'Zahra', 'zahra', '0', 'Azahra', 0, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/9234Cat03.jpg'),
(10, 'Zahraaaa', 'zahraa', '0', 'Azahra', 0, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/6881Cat03.jpg'),
(13, '\"fikpemburu@localhost.com\"', '\"123456\"', '123123123', '\"Muhammad Fikri\"', 0, '\"JL Pemuda\"', 'http://10.0.2.2/votingapp/images/6017pexels-wendy-wei-10404279.jpg'),
(14, '\"localhost@email.com\"', '\"123456\"', '111111111111', '\"localhost\"', 0, '\"jl localhost\"', 'http://10.0.2.2/votingapp/images/6317pexels-dika-pebriyanta-9094948.jpg'),
(15, 'email@gmail.com', '123456', '1231231', 'test', 0, 'jl pemuda', 'http://10.0.2.2/votingapp/images/9148pexels-mahmoud-atashi-12238953.jpg'),
(16, 'Zahraaaasda', 'zahraaasdas', '0', 'Azahradas', 0, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/users9996Cat03.jpg'),
(17, 'imail@localhost.com', '123456', '12312321', 'imail', 0, 'jljljljl', 'http://10.0.2.2/votingapp/images/1538pexels-wendy-wei-10404279.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wagub`
--

CREATE TABLE `wagub` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kekayaan` int(11) NOT NULL,
  `tempattinggal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wagub`
--

INSERT INTO `wagub` (`id`, `nama`, `kekayaan`, `tempattinggal`) VALUES
(1, 'Aldo', 1500000000, 'JL. Rekayasa no 1, Sukajadi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cagub`
--
ALTER TABLE `cagub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calon`
--
ALTER TABLE `calon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calon_cagub` (`idcagub`),
  ADD KEY `calon_wagub` (`idwagub`);

--
-- Indexes for table `nomorurut`
--
ALTER TABLE `nomorurut`
  ADD PRIMARY KEY (`idcalon`),
  ADD KEY `nomorurut_user` (`iduser`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wagub`
--
ALTER TABLE `wagub`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cagub`
--
ALTER TABLE `cagub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `calon`
--
ALTER TABLE `calon`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nomorurut`
--
ALTER TABLE `nomorurut`
  MODIFY `idcalon` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wagub`
--
ALTER TABLE `wagub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calon`
--
ALTER TABLE `calon`
  ADD CONSTRAINT `calon_cagub` FOREIGN KEY (`idcagub`) REFERENCES `cagub` (`id`),
  ADD CONSTRAINT `calon_wagub` FOREIGN KEY (`idwagub`) REFERENCES `wagub` (`id`);

--
-- Constraints for table `nomorurut`
--
ALTER TABLE `nomorurut`
  ADD CONSTRAINT `nomorurut_calon` FOREIGN KEY (`idcalon`) REFERENCES `calon` (`id`),
  ADD CONSTRAINT `nomorurut_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



