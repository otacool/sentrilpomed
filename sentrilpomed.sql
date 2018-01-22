-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2018 at 06:22 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sentrilpomed`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kegiatan`
--

CREATE TABLE `tbl_kegiatan` (
  `id_kegiatan` int(10) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `target` int(10) NOT NULL,
  `anggaran` bigint(20) NOT NULL,
  `realisasi` int(10) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `nama_pj` varchar(255) NOT NULL,
  `realisasi_anggaran` bigint(20) NOT NULL,
  `sisa_anggaran` bigint(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kegiatan`
--

INSERT INTO `tbl_kegiatan` (`id_kegiatan`, `nama_kegiatan`, `target`, `anggaran`, `realisasi`, `tanggal`, `lokasi`, `nama_pj`, `realisasi_anggaran`, `sisa_anggaran`, `keterangan`) VALUES
(18001, 'Penyuluhan Obat', 11, 13459870, 0, '2018-01-11', 'Binjai', 'fadly', 0, 13459870, 'Sangat menarik dan menawan'),
(18002, 'Penyuluhan Makanan', 8, 15000000, 6, '2018-01-04', 'Medan', 'Sulaiman', 14000000, 1000000, 'Sangat luar biasa dan mempesona kita semua'),
(18003, 'Penyuluhan Gizi', 5, 900000000, 1, '2018-01-19', 'Medan', 'Fadly', 100000000, 800000000, 'Luar Biasa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subkegiatan`
--

CREATE TABLE `tbl_subkegiatan` (
  `id_subkegiatan` int(9) NOT NULL,
  `id_kegiatan` int(9) NOT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `anggaran` bigint(100) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `pj_kegiatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subkegiatan`
--

INSERT INTO `tbl_subkegiatan` (`id_subkegiatan`, `id_kegiatan`, `tanggal_kegiatan`, `anggaran`, `lokasi`, `pj_kegiatan`, `keterangan`, `file`) VALUES
(18, 18003, '2018-01-19', 100000000, 'kdsj', 'skf', 'skfnj', '18003-2018-01-19-Data Saintek.docx'),
(20, 18001, '2018-01-22', 10000, 'disana', 'siapa', 'klsdksan', '18001-2018-01-21-COA_Labusel.xlsx'),
(21, 18001, '2018-01-21', 10000, 'disini', 'bambang', 'lksajdk', '18001-2018-01-21-20325_neraca pisah ok.xls');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(9) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('superuser','admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '$2y$10$o1OP69dWACWX7X3wDI2QWODurGsNfpbYna5.cyhePd70m6toQ5xWq', 'superuser'),
(2, 'ibal', '$2y$10$2wck2m6e1mHfJSk/tpYKaOI04rsj26tldPPc9Uv/faJugDmkOwmxS', 'admin'),
(3, 'amel', '$2y$10$x/8hQCUjONAhnVA7dUjLoeg3SvK6eRQPaX4TwxkMskcZ/28FXWBi2', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `tbl_subkegiatan`
--
ALTER TABLE `tbl_subkegiatan`
  ADD PRIMARY KEY (`id_subkegiatan`),
  ADD KEY `id_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_subkegiatan`
--
ALTER TABLE `tbl_subkegiatan`
  MODIFY `id_subkegiatan` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_subkegiatan`
--
ALTER TABLE `tbl_subkegiatan`
  ADD CONSTRAINT `tbl_subkegiatan_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
