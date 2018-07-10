-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2018 at 09:13 PM
-- Server version: 5.5.60-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokter`
--

CREATE TABLE IF NOT EXISTS `tb_dokter` (
  `id_dokter` varchar(50) NOT NULL,
  `nama_dokter` varchar(80) NOT NULL,
  `spesialis` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_dokter`
--

INSERT INTO `tb_dokter` (`id_dokter`, `nama_dokter`, `spesialis`, `alamat`, `no_telp`) VALUES
('a4f7d08f-5e0f-4373-aeb2-762a2d0470c2', 'TEJO', 'KULIT', 'Surabaya', '08938282172');

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

CREATE TABLE IF NOT EXISTS `tb_obat` (
  `id_obat` varchar(50) NOT NULL,
  `nama_obat` varchar(200) NOT NULL,
  `ket_obat` text NOT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_obat`
--

INSERT INTO `tb_obat` (`id_obat`, `nama_obat`, `ket_obat`) VALUES
('b9b89ab1-dfb8-4f9c-bde3-4a770ce52bda', 'OSKADON', 'OBAT SAKIT KEPALA'),
('e4a8be20-f7b9-456a-ad03-ad2c648aa21f', 'DAKTARIN', 'OBAT JAMUR KULIT\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasien`
--

CREATE TABLE IF NOT EXISTS `tb_pasien` (
  `id_pasien` varchar(50) NOT NULL,
  `nomor_identitas` varchar(30) NOT NULL,
  `nama_pasien` varchar(80) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pasien`
--

INSERT INTO `tb_pasien` (`id_pasien`, `nomor_identitas`, `nama_pasien`, `jenis_kelamin`, `alamat`, `no_telp`) VALUES
('f2751386-04d1-4bf1-b54a-7b0a7b7faa77', '001', 'SURTI', 'P', 'Jakarta Selatan', '089537244789');

-- --------------------------------------------------------

--
-- Table structure for table `tb_poliklinik`
--

CREATE TABLE IF NOT EXISTS `tb_poliklinik` (
  `id_poli` varchar(50) NOT NULL,
  `nama_poli` varchar(50) NOT NULL,
  `gedung` varchar(50) NOT NULL,
  PRIMARY KEY (`id_poli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_poliklinik`
--

INSERT INTO `tb_poliklinik` (`id_poli`, `nama_poli`, `gedung`) VALUES
('034beee4-515d-412b-84d7-b1390b3bceb9', 'POLI ANAK', 'C Lt 2'),
('1273045b-e661-472f-977a-c7f954eb0f4c', 'POLI UMUM', 'C Lt 3');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekammedis`
--

CREATE TABLE IF NOT EXISTS `tb_rekammedis` (
  `id_rm` varchar(50) NOT NULL,
  `id_pasien` varchar(50) NOT NULL,
  `keluhan` text NOT NULL,
  `id_dokter` varchar(50) NOT NULL,
  `diagnosa` text NOT NULL,
  `id_poli` varchar(50) NOT NULL,
  `tgl_periksa` date NOT NULL,
  PRIMARY KEY (`id_rm`),
  KEY `id_pasien` (`id_pasien`),
  KEY `id_dokter` (`id_dokter`),
  KEY `id_poli` (`id_poli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rekammedis`
--

INSERT INTO `tb_rekammedis` (`id_rm`, `id_pasien`, `keluhan`, `id_dokter`, `diagnosa`, `id_poli`, `tgl_periksa`) VALUES
('d58adc46-75a5-46cb-97d1-a8215f99a744', 'f2751386-04d1-4bf1-b54a-7b0a7b7faa77', '<p>GATAL GATAL KULIT</p>\r\n', 'a4f7d08f-5e0f-4373-aeb2-762a2d0470c2', '<p>KEMUNGKINAN PENYAKIT KULIT</p>\r\n', '1273045b-e661-472f-977a-c7f954eb0f4c', '2018-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rm_obat`
--

CREATE TABLE IF NOT EXISTS `tb_rm_obat` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_rm` varchar(50) NOT NULL,
  `id_obat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rm` (`id_rm`),
  KEY `id_obat` (`id_obat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tb_rm_obat`
--

INSERT INTO `tb_rm_obat` (`id`, `id_rm`, `id_obat`) VALUES
(7, 'd58adc46-75a5-46cb-97d1-a8215f99a744', 'e4a8be20-f7b9-456a-ad03-ad2c648aa21f');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `id_user` varchar(50) NOT NULL,
  `nama_user` varchar(80) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('1','2') NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
('0b68aad2-71c5-11e8-a2c5-40167e454387', 'COWO EDITAN', 'cowoeditan', '337193a7f6275e9f27deb8b4b8d894fc34aac684', '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_rekammedis`
--
ALTER TABLE `tb_rekammedis`
  ADD CONSTRAINT `tb_rekammedis_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `tb_poliklinik` (`id_poli`),
  ADD CONSTRAINT `tb_rekammedis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`),
  ADD CONSTRAINT `tb_rekammedis_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`);

--
-- Constraints for table `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  ADD CONSTRAINT `tb_rm_obat_ibfk_1` FOREIGN KEY (`id_rm`) REFERENCES `tb_rekammedis` (`id_rm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_rm_obat_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `tb_obat` (`id_obat`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
