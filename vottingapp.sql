-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220531.aadb8cc914
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2022 at 01:54 AM
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
  `ttl` text NOT NULL,
  `riwayat_pendidikan` text NOT NULL,
  `biografi_singkat` text NOT NULL,
  `imgurl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cagub`
--

INSERT INTO `cagub` (`id`, `nama`, `ttl`, `riwayat_pendidikan`, `biografi_singkat`, `imgurl`) VALUES
(3, 'May Sra Handika', 'Ujung Batu, 3 Mei 2002', 'Sarjana Teknik Di Universitas Negeri Sultan Syarif Kasim Riau', 'Bernama Asli May Sra Handika, beliau merupakan lulusan sarjana Teknik Informatika di Salah Satu Universitas Negeri Pekanbaru. Semasa kecilnya, beliau menghabiskan waktu dikampung halaman yaitu daerah ujung batu. Beliau juga merupakan seorang desain grafis pada bidangnya, dan sudah banyak mengikuti berbagai kepanitian mengenai desain disaat menempuh pendidikan. Hingga kini beliau sudah menghasilkan banyak anak perusahaan berbau desain dengan kekayaan sebannyak 1 milyar rupiah.\n', 'http://10.0.2.2/votingapp/images/cagub/dika.png'),
(4, 'Alif Alfarabi.B', 'Muaro Bungo, 29 Desember 2002', 'Sarjana Teknik Di Universitas Negeri Sultan Syarif Kasim Riau\r\n', 'Bernama Asli Alif Alfarabi.B, beliau merupakan lulusan sarjana Teknik Informatika di Salah Satu Universitas Negeri Pekanbaru. Semasa kecilnya, beliau menghabiskan waktu dikampung halaman yaitu daerah Bungo. Beliau juga merupakan seorang desain grafis pada bidangnya, dan sudah banyak mengikuti berbagai kepanitian mengenai desain disaat menempuh pendidikan. Hingga kini beliau sudah menghasilkan banyak anak perusahaan berbau desain dengan kekayaan sebannyak 1 milyar rupiah.\r\n', 'http://10.0.2.2/votingapp/images/cagub/alif.png'),
(5, 'Muhammad Fikri', 'Pekanbaru, 13 Maret 2001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, \r\npulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. \r\nDonec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, \r\nin pretium orci vestibulum eget. Class aptent taciti sociosqu ad litora torquent\r\nper conubia nostra, per inceptos himenaeos. Duis pharetra luctus lacus ut \r\nvestibulum. Maecenas ipsum lacus, lacinia quis posuere ut, pulvinar vitae dolor.\r\nInteger eu nibh at nisi ullamcorper sagittis id vel leo. Integer feugiat \r\nfaucibus libero, at maximus nisl suscipit posuere. Morbi nec enim nunc. \r\n', 'http://10.0.2.2/votingapp/images/cagub/fikri.png');

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `id` int(5) NOT NULL,
  `idcagub` int(11) NOT NULL,
  `idwagub` int(11) NOT NULL,
  `nomor_urut` varchar(5) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`id`, `idcagub`, `idwagub`, `nomor_urut`, `img`) VALUES
(1, 3, 2, '1', 'http://10.0.2.2/votingapp/images/kandidat/kandidat1.png'),
(2, 4, 3, '2', 'http://10.0.2.2/votingapp/images/kandidat/kandidat2.png'),
(3, 5, 4, '3', 'http://10.0.2.2/votingapp/images/kandidat/kandidat3.png');

-- --------------------------------------------------------

--
-- Table structure for table `pemilih`
--

CREATE TABLE `pemilih` (
  `id` int(5) NOT NULL,
  `idkandidat` int(5) NOT NULL,
  `iduser` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemilih`
--

INSERT INTO `pemilih` (`id`, `idkandidat`, `iduser`) VALUES
(8, 1, 8),
(10, 1, 7),
(11, 1, 22),
(12, 2, 23),
(13, 3, 6),
(16, 3, 24),
(17, 1, 27),
(18, 3, 20),
(19, 2, 21),
(20, 2, 30),
(21, 2, 40),
(22, 3, 39),
(23, 3, 38),
(24, 2, 37),
(26, 2, 36),
(27, 2, 35),
(29, 2, 34),
(30, 2, 33),
(31, 1, 18),
(32, 1, 41),
(33, 2, 19),
(34, 1, 42);

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
  `nomorhp` varchar(20) NOT NULL,
  `statusvoting` tinyint(1) NOT NULL DEFAULT 0,
  `tempattinggal` varchar(100) NOT NULL,
  `imgurl` text NOT NULL DEFAULT 'http://10.0.2.2/votingapp/images/users/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nik`, `namalengkap`, `nomorhp`, `statusvoting`, `tempattinggal`, `imgurl`) VALUES
(5, 'test@localhost.com', '1234', '1122334455', 'SI Tester', '08712312', 0, 'Jl. Tester, Arizona', 'http://10.0.2.2/votingapp/images/4629Cat03.jpg'),
(6, 'fikri@localhost.com', '1234', '11323231231', 'Muhammad Fikri', '', 1, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/7445pexels-pixabay-417173.jpg'),
(7, 'admin@localhost.com', 'admin', '1', 'Admin', '', 0, 'Jl. 0000, Pekanbaru', 'http://10.0.2.2/votingapp/images/5798tester.jpg'),
(8, 'zul', 'zul', '2131233', 'Zul Hilmi', '081232131', 1, 'Jl. Pemuda, Pekanbaru', 'http://10.0.2.2/votingapp/images/8937mount.jpg'),
(18, 'mfikri@gmail.com', '12345', '1234431413', 'Muhammad Fikri', '08136666780', 1, 'JL Pemuda no 21 Pekanbaru', 'http://10.0.2.2/votingapp/images/3128IMG_20220611_160551.jpg'),
(19, 'vicky.keeling@tillman.biz', '123451', '00000000001', 'unit test', '081155555', 1, 'jalan lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(20, 'ralph.hills@klocko.com', '123456', '00000000001', 'unit 2', '0813210123', 1, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(21, 'sbradtke@wisoky.com', '123123', '000000000021', 'unit 3', '00000000', 1, 'lorem 123', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(22, 'dooley.tyrel@yahoo.com', '1232131', '0000000123', 'unit 4', '0000000000', 1, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(23, 'elena75@langworth.com', '123456', '00000000123', 'elena', '0812313132', 1, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(24, 'lemke.stephanie@collins.com', '12321321312', '11111111111123', 'lemke', '0812321312321', 1, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(25, 'okuneva.destiney@bernier.net', '1231321', '1111111111102', 'okuneva', '12321312', 0, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(26, 'zack88@abshire.com', '12312312', '2222222222123', 'zack', '321331321312', 0, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(27, 'lnitzsche@yahoo.com', '12312312', '23333333131', 'initz', '1233333333312', 1, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(28, 'kobe17@reinger.org', '12312451', '11111111123', 'kobe', '092183012321', 0, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(29, 'nhudson@spencer.com', '12321312', '111111112321', 'nhudson', '084102023', 0, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(30, 'morissette.lawson@bartell.com', '111', '1111123131', 'mori', '02313123213', 1, 'lorem', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(31, 'adolfo15@hotmail.com', '123123', '1111111123212', 'adolf', '08712312', 0, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(32, 'remington.cummings@bartell.com', '1231', '1231321', 'remin', '02313123213', 0, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(33, 'elvera.bechtelar@yahoo.com', '1231', '00000000002121', 'elve', '000000001231', 1, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(34, 'kutch.eldora@ruecker.com', '12312', '00000001231231', 'kutch', '1233412312', 1, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(35, 'shields.mitchel@boehm.net', '1231231', '23131', 'shild', '', 1, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(36, 'zcorwin@gmail.com', '123123', '1231312312312', 'zcor', '08123213123223', 1, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(37, 'bkertzmann@bruen.org', '12313212313', '11111111111021213', 'kertz', '093412231', 1, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(38, 'greenholt.niko@schaefer.org', '12312', '22222222221232', 'gren', '083123121', 1, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(39, 'breichert@moore.com', '12312312', '', 'briac', '09823412312', 0, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(40, 'reichel.angie@yahoo.com', '12313', '11111111123231', 'riecel', '09218301232121', 0, 'test', 'http://10.0.2.2/votingapp/images/users/default.jpg'),
(41, 'abdullah@gmail.com', '123456', '213123123', 'Abdullah bin Fulan bin Fulan', '081368123123', 1, 'Jln. Pemuda no 10, Pekanbaru', 'http://10.0.2.2/votingapp/images/6430IMG_20220611_160606.jpg'),
(42, 'rage@local.com', '12345', '111111111123', 'Rage', '0812351231', 1, 'JL Adi, Pekanbaru', 'http://10.0.2.2/votingapp/images/3715IMG_20220611_160551.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wagub`
--

CREATE TABLE `wagub` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `ttl` text NOT NULL,
  `riwayat_pendidikan` text NOT NULL,
  `biografi_singkat` text NOT NULL,
  `imgurl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wagub`
--

INSERT INTO `wagub` (`id`, `nama`, `ttl`, `riwayat_pendidikan`, `biografi_singkat`, `imgurl`) VALUES
(2, 'Sari Amanda', 'Pariaman, 13 Agustus 2002', 'Sarjana Teknik Di Universitas Negeri Sultan Syarif Kasim Riau\n', 'Bernama Asli Sari Amanda Putri, beliau merupakan lulusan sarjana Teknik Informatika dari pelalawan university. Semasa kecilnya, beliau menghabiskan waktu didaerah pangkalan kerinci hingga saat ini. Beliau juga merupakan seorang programmer dengan bahasa java. Beliau bahkan memiliki prestasi yang sangat cemerlang, memahami berbagai aspek java disaat menempuh pendidikan pada masanya. Saat ini beliau berhasil membuat sekolah robotik dengan bahasa java hingga meraup penghasilan pertahunnya 1,5 milyar rupiah.\n', 'http://10.0.2.2/votingapp/images/wagub/sari.png'),
(3, 'Egi Larasati', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, \r\npulvinar facilisis justo mollis, auctor consequat urna. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, \r\npulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. \r\nDonec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, \r\nin pretium orci vestibulum eget. Class aptent taciti sociosqu ad litora torquent\r\nper conubia nostra, per inceptos himenaeos. Duis pharetra luctus lacus ut \r\nvestibulum. Maecenas ipsum lacus, lacinia quis posuere ut, pulvinar vitae dolor.\r\nInteger eu nibh at nisi ullamcorper sagittis id vel leo. Integer feugiat \r\nfaucibus libero, at maximus nisl suscipit posuere. Morbi nec enim nunc. \r\nPhasellus bibendum turpis ut ipsum egestas, sed sollicitud', 'http://10.0.2.2/votingapp/images/wagub/egi.png'),
(4, 'Nurul Fajri', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, \r\npulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. \r\nDonec s ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, \r\npulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. \r\nDonec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, \r\nin pretium orci vestibulum eget. Class aptent taciti sociosqu ad litora torquent\r\nper conubia nostra, per inceptos himenaeos. Duis pharetra luctus lacus ut \r\nvestibulum. Maecenas ipsum lacus, lacinia quis posuere ut, pulvinar vitae dolor.\r\nInteger eu nibh at nisi ullamcorper sagittis id vel leo. Integer feugiat \r\nfaucibus libero, at maximus nisl suscipit posuere. Morbi nec enim nunc. \r\n', 'http://10.0.2.2/votingapp/images/wagub/fajri.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cagub`
--
ALTER TABLE `cagub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cagub` (`idcagub`),
  ADD KEY `wagub` (`idwagub`);

--
-- Indexes for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomorurut_user` (`iduser`),
  ADD KEY `pemilih_kandidat` (`idkandidat`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pemilih`
--
ALTER TABLE `pemilih`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wagub`
--
ALTER TABLE `wagub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD CONSTRAINT `cagub` FOREIGN KEY (`idcagub`) REFERENCES `cagub` (`id`),
  ADD CONSTRAINT `wagub` FOREIGN KEY (`idwagub`) REFERENCES `wagub` (`id`);

--
-- Constraints for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD CONSTRAINT `pemilih_kandidat` FOREIGN KEY (`idkandidat`) REFERENCES `kandidat` (`id`),
  ADD CONSTRAINT `pemilih_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



