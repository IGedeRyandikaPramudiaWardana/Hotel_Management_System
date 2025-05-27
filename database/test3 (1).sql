-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 06 Jan 2025 pada 11.54
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
-- Database: `test3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `akses` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama`, `password`, `akses`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'user', 'user', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `avaibility`
--

CREATE TABLE `avaibility` (
  `nomorKamar` varchar(4) NOT NULL,
  `tipeKamar` enum('Standard Non AC','Standard AC','Deluxe','Suite','Junior Suite','Family','Executive','Presidental Suite') NOT NULL,
  `tipeBed` enum('Single Bed','Double Bed','Twin Bed','King Bed','Queen Bed') NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('Avaible','Booked','Check In','Check Out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `avaibility`
--

INSERT INTO `avaibility` (`nomorKamar`, `tipeKamar`, `tipeBed`, `harga`, `status`) VALUES
('1', 'Standard Non AC', 'Single Bed', 150, 'Avaible');

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkin`
--

CREATE TABLE `checkin` (
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
-- Dumping data untuk tabel `checkin`
--

INSERT INTO `checkin` (`nama`, `nomorTelepon`, `kewarganegaraan`, `gender`, `email`, `idKtp`, `alamat`, `checkIN_Date`, `bed`, `tipeKamar`, `nomorKamar`, `harga`) VALUES
('nanang', '8888888', 'Indonesia', 'Laki-laki', 'uwayfu@gmail.com', 'qwertyuiu', 'tak tau', '2024-12-30', 'Single Bed', 'Standard Non AC', '1', 150),
('nanang', '8888888', 'Indonesia', 'Laki-laki', 'uwayfu@gmail.com', 'qwertyuiu2', 'tak tau', '2025-01-02', 'Single Bed', 'Standard Non AC', '1', 150);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `avaibility`
--
ALTER TABLE `avaibility`
  ADD PRIMARY KEY (`nomorKamar`);

--
-- Indeks untuk tabel `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`idKtp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
