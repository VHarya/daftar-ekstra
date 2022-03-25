-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 02:54 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_activities`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota_ekstras`
--

CREATE TABLE `anggota_ekstras` (
  `id` int(11) NOT NULL,
  `id_ekstra` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota_ekstras`
--

INSERT INTO `anggota_ekstras` (`id`, `id_ekstra`, `id_siswa`) VALUES
(2, 1, 1),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ekstras`
--

CREATE TABLE `ekstras` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `kegiatan` text NOT NULL,
  `id_pembimbing` int(11) NOT NULL,
  `icon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ekstras`
--

INSERT INTO `ekstras` (`id`, `nama`, `deskripsi`, `kegiatan`, `id_pembimbing`, `icon`) VALUES
(1, 'Futsal', 'permainan bola yang dimainkan oleh dua tim, yang masing-masing beranggotakan lima orang. Tujuannya adalah memasukkan bola ke gawang lawan, dengan memanipulasi bola dengan kaki. Selain lima pemain utama, setiap regu juga diizinkan memiliki pemain cadangan. Tidak seperti permainan sepak bola dalam ruangan lainnya, lapangan futsal dibatasi garis, bukan net atau papan.', '-sparring -latihan', 1, 58866),
(3, 'Airsoft', 'Airsoft adalah sebuah olahraga atau permainan yang menyimulasikan kegiatan militer atau kepolisian, yang menggunakan replika senjata api yang disebut airsoft gun.', '-war game', 1, 58357),
(4, 'English Debate (GVED)', 'English Debate adalah kompetisi dalam menunjukkan kemampuan membuat argumentasi ilmiah baik secara pro maupun kontra terhadap suatu isu tertentu yang telah ditentukan dan mempertahankannya dengan menggunakan Bahasa Inggris yang baik dan benar di hadapan juri dan peserta lainnya.', '-Everyday Conversations\r\n-Discussions\r\n-Debate Competitions', 1, 58051);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_siswas`
--

CREATE TABLE `nilai_siswas` (
  `id` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_ekstra` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai_siswas`
--

INSERT INTO `nilai_siswas` (`id`, `id_siswa`, `id_ekstra`, `nilai`) VALUES
(1, 1, 1, 80);

-- --------------------------------------------------------

--
-- Table structure for table `pembimbings`
--

CREATE TABLE `pembimbings` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembimbings`
--

INSERT INTO `pembimbings` (`id`, `id_user`, `telp`, `alamat`) VALUES
(1, 4, '082228687405', 'Jl. Keben II Surya Timur No.9');

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `absen` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `id_user`, `kelas`, `absen`) VALUES
(1, 1, 'XII RPL A', '30'),
(6, 1, 'XII RPL A', '03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `role`) VALUES
(1, 'nis', 'pass', 'Vincentius Harya', 'siswa'),
(4, 'user1', 'pass', 'Andhika Setiawan', 'pembimbing'),
(6, 'admin', 'pass', 'unknown admin', 'admin'),
(12, 'dayat', 'pass', 'Ahmad Hidayat Permana', 'siswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota_ekstras`
--
ALTER TABLE `anggota_ekstras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ekstras`
--
ALTER TABLE `ekstras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_siswas`
--
ALTER TABLE `nilai_siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembimbings`
--
ALTER TABLE `pembimbings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_user`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota_ekstras`
--
ALTER TABLE `anggota_ekstras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ekstras`
--
ALTER TABLE `ekstras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai_siswas`
--
ALTER TABLE `nilai_siswas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembimbings`
--
ALTER TABLE `pembimbings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembimbings`
--
ALTER TABLE `pembimbings`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `siswas`
--
ALTER TABLE `siswas`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
