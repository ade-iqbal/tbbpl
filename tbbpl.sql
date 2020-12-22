-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2020 at 02:03 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tbbpl`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `sku` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `stock` int(50) NOT NULL,
  `harga_beli` int(20) NOT NULL,
  `harga_jual` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`sku`, `nama`, `stock`, `harga_beli`, `harga_jual`) VALUES
('B01', 'Susu', 29, 4500, 7000),
('B02', 'Kopi', 90, 7000, 10000),
('B03', 'Teh', 61, 3000, 5000),
('B04', 'Energen', 54, 5000, 8500),
('B05', 'Milo', 50, 100000, 140000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(255) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `noresi` varchar(50) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `sku`, `noresi`, `jumlah`, `harga`) VALUES
(48, 'B04', 'T1', 3, 25500),
(49, 'B02', 'T1', 2, 20000),
(50, 'B05', 'T2', 2, 280000),
(51, 'B02', 'T3', 5, 50000),
(52, 'B01', 'T3', 10, 70000),
(53, 'B03', 'T3', 5, 25000),
(54, 'B02', 'T4', 3, 30000),
(55, 'B01', 'T4', 3, 21000),
(56, 'B04', 'T5', 3, 25500),
(57, 'B01', 'T5', 5, 35000),
(58, 'B03', 'T5', 2, 10000),
(59, 'B01', 'T6', 3, 21000),
(60, 'B03', 'T6', 2, 10000),
(61, 'B05', 'T7', 3, 420000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `noresi` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`noresi`, `tanggal`, `username`) VALUES
('T1', '2020-12-02', 'fauzan'),
('T2', '2020-12-03', 'fauzan'),
('T3', '2020-12-07', 'fauzan'),
('T4', '2020-12-02', 'fauzan'),
('T5', '2020-12-07', 'fauzan'),
('T6', '2020-12-20', 'fauzan'),
('T7', '2020-12-20', 'fauzan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `login_terakhir` date NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `login_terakhir`, `email`, `password`) VALUES
('debal', '2020-12-22', 'debal@gmail.com', 'sandbox'),
('fathia', '2020-12-22', 'fathia@gmail.com', 'fathia123'),
('fauzan', '2020-12-22', 'fauzan@gmail.com', 'fauzan123'),
('gita', '2020-12-22', 'gita@gmail.com', 'gita123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`sku`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_transaksi_ibfk_2` (`sku`),
  ADD KEY `detail_transaksi_ibfk_1` (`noresi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`noresi`),
  ADD KEY `transaksi_ibfk_1` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`noresi`) REFERENCES `transaksi` (`noresi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`sku`) REFERENCES `barang` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
