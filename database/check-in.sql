-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 06 Jan 2025 pada 09.10
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `check`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `check-in`
--

CREATE TABLE `check-in` (
  `nama` varchar(250) NOT NULL,
  `nomorTelepon` varchar(250) NOT NULL,
  `kewarganegaraan` varchar(250) NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL,
  `email` varchar(250) NOT NULL,
  `idKtp` varchar(250) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `checkIN_Date` date NOT NULL,
  `bed` enum('Single Bed','Double Bed','Twin Bed','King Bed','Queen Bed') NOT NULL,
  `tipeKamar` enum('Standard Non AC','Standard AC','Deluxe','Suite','Junior Suite','Family','Executive','Presidential Suite') NOT NULL,
  `nomorKamar` varchar(3) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `check-in`
--

INSERT INTO `check-in` (`nama`, `nomorTelepon`, `kewarganegaraan`, `gender`, `email`, `idKtp`, `alamat`, `checkIN_Date`, `bed`, `tipeKamar`, `nomorKamar`, `harga`) VALUES
('nanang', '8888888', 'Indonesia', 'Laki-laki', 'uwayfu@gmail.com', 'qwertyuiu', 'tak tau', '2024-12-30', 'Single Bed', 'Standard Non AC', '1', 150),
('nanang', '8888888', 'Indonesia', 'Laki-laki', 'uwayfu@gmail.com', 'qwertyuiu2', 'tak tau', '2025-01-02', 'Single Bed', 'Standard Non AC', '1', 150);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `check-in`
--
ALTER TABLE `check-in`
  ADD PRIMARY KEY (`idKtp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
