-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2019 at 01:45 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan2`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` varchar(10) NOT NULL,
  `nama_brg` varchar(150) DEFAULT NULL,
  `harga` int(50) DEFAULT NULL,
  `stok` int(50) DEFAULT NULL,
  `expired` date DEFAULT NULL,
  `id_jenis_brg` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `harga`, `stok`, `expired`, `id_jenis_brg`) VALUES
('BR001', 'Indomie', 2000, 300, '2019-11-22', '004'),
('BR002', 'Kopi', 3000, 90, '2018-10-05', '002'),
('BR003', 'Berass', 15000, 1000, '2023-05-17', '001'),
('BR004', 'Susu', 2000, 10000, '2018-11-02', '004'),
('BR005', 'Aqua', 5000, 1000, '2018-11-01', '004'),
('BR006', 'Laptop', 5000000, 1000, '2019-11-30', '003'),
('BR007', 'Pel', 100000, 10, '2018-12-29', '005'),
('BR008', 'kopi', 3000, 100, '2019-12-15', '002');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(8) NOT NULL,
  `id_transaksi` varchar(8) NOT NULL,
  `id_brg` varchar(8) NOT NULL,
  `jumlah_beli` int(10) NOT NULL,
  `subtotal` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_transaksi`, `id_brg`, `jumlah_beli`, `subtotal`) VALUES
(120, 'TR001', 'BR001', 9, 18000),
(131, 'TR011', 'br001', 9, 18000),
(132, 'TR012', 'br002', 7, 21000),
(133, 'TR013', 'BR004', 9, 18000),
(134, 'TR014', 'BR003', 9, 135000),
(135, 'TR015', 'br001', 2, 4000),
(136, 'TR015', 'br002', 2, 4000),
(137, '', '', 0, 0),
(138, '', '', 0, 0),
(139, 'TR016', 'br002', 2, 6000),
(140, 'TR017', 'br002', 2, 6000);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(8) NOT NULL,
  `nama_jenis` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
('001', 'Makanan'),
('002', 'Minuman'),
('003', 'Elektronik'),
('004', 'Sembako');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_telp`, `email`) VALUES
('P001', 'Feyto hebat', 'Desa Bumiharjo', '085290042313', 'feyto81@gmail.com'),
('P002', 'Paijan', 'Kelet', '082023243841', 'paijan@gmail.com'),
('P003', 'Akbar', 'Blingoh', '0845832239', 'akbar@gmail.com'),
('P004', 'Maze', 'Tunahan', '0812345959595', 'maze123@gmail.com'),
('P005', 'Adek', 'Medani', '0193943049249', 'adek@gmail.com'),
('P006', 'Saipud', 'Blingoh', '08132837242', 'saipud@gmail.com'),
('P007', 'Adek Candra NurWijayanti', 'Desa Medani, Cluwak, Pati, Jawa Ten', '+6285216154924', 'Wadekcandra@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(7) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `level`) VALUES
('U01', 'admin', 'admin1', 'admin'),
('U02', 'manager', 'manager', 'manager'),
('U03', 'kasir', 'kasir1', 'kasir'),
('U04', 'Basar', 'basar', 'kasir'),
('U05', 'aan', 'aan', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(8) NOT NULL,
  `id_pelanggan` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_petugas` varchar(8) NOT NULL,
  `total` int(12) NOT NULL,
  `diskon` int(12) NOT NULL,
  `bayar` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `tanggal`, `id_petugas`, `total`, `diskon`, `bayar`) VALUES
('TR001', 'P001', '2019-12-03', 'U01', 17100, 900, 9000),
('TR002', 'P001', '2019-12-03', '', 25650, 1350, 90000),
('TR003', 'Non Pelanggan', '2019-12-03', 'U01', 0, 0, 9),
('TR004', 'P005', '2019-12-03', 'U01', 42792750, 2252250, 90000000),
('TR005', 'Non Pelanggan', '2019-12-03', 'U01', 18000, 0, 9000),
('TR006', 'P003', '2019-12-03', 'U01', 17100000, 900000, 900000),
('TR007', 'Non Pelanggan', '2019-12-03', 'U01', 27000, 0, 9000),
('TR008', 'P002', '2019-12-03', 'U01', 128250, 6750, 9000),
('TR009', 'P001', '2019-12-03', 'U01', 128250, 6750, 90000),
('TR010', 'P001', '2019-12-03', 'U01', 128250, 6750, 9000),
('TR011', 'p001', '2019-12-03', 'U01', 17100, 900, 18000),
('TR012', 'p001', '2019-12-03', 'U01', 19950, 1050, 50000),
('TR013', 'P002', '2019-12-04', 'U03', 17100, 900, 9000),
('TR014', 'P002', '2019-12-04', 'U03', 128250, 6750, 9000),
('TR015', 'p001', '2019-12-04', 'U03', 7600, 400, 10000),
('TR016', 'p002', '2019-12-05', 'U05', 5700, 300, 7000),
('TR017', 'p002', '2019-12-05', 'U05', 5700, 300, 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
