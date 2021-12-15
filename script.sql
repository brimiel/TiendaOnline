-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2021 at 07:38 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiendaonlinebd`
--
CREATE DATABASE IF NOT EXISTS `tiendaonlinebd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tiendaonlinebd`;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES(1, 'Electrónica');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(2, 'Ropa');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(3, 'Hogar');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(4, 'Alimentos');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(5, 'Construcción');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(6, 'Oficina');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(7, 'Accesorios');
INSERT INTO `categoria` (`id`, `nombre`) VALUES(8, 'Otro');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(48) NOT NULL,
  `email` varchar(48) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(1, 'Lina Ordoñez', 'lina@mail.com', 'abc123', '3010001234');
INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(2, 'Daniela Ortiz', 'danny@mail.com', 'xyz123', '3020002654');
INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(3, 'Diego Solar', 'diego@mail.com', 'abc123', '3010009513');
INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(4, 'Joan Prieto', 'joan@mail.com', 'abc123', '3111239513');
INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(5, 'Manuel Arciniega', 'manuel@mail.com', 'abc123', '3111111111');
INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(10, 'John Ortiz', 'johnortizo@outlook.com', '$2b$10$4sPtVVpaQMlo1CPtksn.QucYtOnXEuEy.0F3ltWVfO7lgJy2C.Ic2', '3167174740');
INSERT INTO `cliente` (`id`, `nombre_completo`, `email`, `password`, `telefono`) VALUES(11, 'Andres', 'a@mail.co', '$2b$10$mbMyNBBNysillBgD5/bwMu7mfOvx.8aS44S5XRXAUT00xYSaadfRS', '3167174740');

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `impuesto` double NOT NULL DEFAULT '0.19',
  `total` double NOT NULL,
  `factura_estado_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `factura_estado`
--

DROP TABLE IF EXISTS `factura_estado`;
CREATE TABLE `factura_estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factura_estado`
--

INSERT INTO `factura_estado` (`id`, `nombre`) VALUES(1, 'Cancelada');
INSERT INTO `factura_estado` (`id`, `nombre`) VALUES(2, 'Inactiva');
INSERT INTO `factura_estado` (`id`, `nombre`) VALUES(3, 'Retirada');
INSERT INTO `factura_estado` (`id`, `nombre`) VALUES(4, 'Removida');

-- --------------------------------------------------------

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orden_producto`
--

DROP TABLE IF EXISTS `orden_producto`;
CREATE TABLE `orden_producto` (
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `precio_compra` double NOT NULL,
  `precio_venta` double NOT NULL,
  `minimo_stock` smallint(6) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(1, 'Steel', 'Aluminum', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(2, 'Rubber', 'Wood', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(3, 'Wood', 'Aluminum', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(4, 'Granite', 'Vinyl', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(5, 'Wood', 'Vinyl', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(6, 'Stone', 'Brass', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(7, 'Rubber', 'Plexiglass', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(8, 'Glass', 'Wood', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(9, 'Brass', 'Rubber', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(10, 'Wood', 'Plexiglass', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(11, 'Vinyl', 'Wood', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(12, 'Plastic', 'Stone', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(13, 'Vinyl', 'Plastic', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(14, 'Plexiglass', 'Steel', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(15, 'Rubber', 'Vinyl', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(16, 'Wood', 'Granite', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(17, 'Rubber', 'Vinyl', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(18, 'Stone', 'Wood', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(19, 'Plastic', 'Plastic', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(20, 'Plastic', 'Vinyl', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(21, 'Plexiglass', 'Wood', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(22, 'Plastic', 'Plastic', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(23, 'Granite', 'Vinyl', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(24, 'Plastic', 'Granite', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(25, 'Brass', 'Brass', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(26, 'Granite', 'Plastic', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(27, 'Wood', 'Glass', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(28, 'Plexiglass', 'Plexiglass', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(29, 'Steel', 'Stone', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(30, 'Wood', 'Brass', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(31, 'Plastic', 'Aluminum', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(32, 'Plexiglass', 'Stone', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(33, 'Vinyl', 'Vinyl', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(34, 'Aluminum', 'Plastic', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(35, 'Wood', 'Glass', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(36, 'Wood', 'Steel', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(37, 'Wood', 'Brass', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(38, 'Plastic', 'Plexiglass', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(39, 'Brass', 'Stone', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(40, 'Granite', 'Stone', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(41, 'Plexiglass', 'Steel', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(42, 'Plexiglass', 'Stone', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(43, 'Aluminum', 'Stone', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(44, 'Rubber', 'Granite', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(45, 'Wood', 'Plastic', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(46, 'Granite', 'Vinyl', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(47, 'Plastic', 'Rubber', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(48, 'Plastic', 'Wood', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(49, 'Rubber', 'Aluminum', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(50, 'Wood', 'Aluminum', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(51, 'Stone', 'Granite', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(52, 'Brass', 'Stone', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(53, 'Steel', 'Aluminum', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(54, 'Plexiglass', 'Aluminum', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(55, 'Glass', 'Stone', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(56, 'Plexiglass', 'Plastic', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(57, 'Rubber', 'Brass', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(58, 'Wood', 'Vinyl', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(59, 'Plexiglass', 'Rubber', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(60, 'Glass', 'Rubber', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(61, 'Aluminum', 'Brass', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(62, 'Rubber', 'Aluminum', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(63, 'Aluminum', 'Aluminum', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(64, 'Granite', 'Aluminum', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(65, 'Vinyl', 'Plastic', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(66, 'Wood', 'Granite', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(67, 'Plexiglass', 'Wood', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(68, 'Plexiglass', 'Plexiglass', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(69, 'Glass', 'Steel', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(70, 'Rubber', 'Plexiglass', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(71, 'Glass', 'Vinyl', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(72, 'Rubber', 'Wood', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(73, 'Wood', 'Aluminum', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(74, 'Brass', 'Vinyl', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(75, 'Brass', 'Wood', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(76, 'Plastic', 'Rubber', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(77, 'Stone', 'Wood', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(78, 'Granite', 'Plexiglass', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(79, 'Wood', 'Stone', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(80, 'Brass', 'Stone', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(81, 'Stone', 'Wood', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(82, 'Glass', 'Steel', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(83, 'Plexiglass', 'Steel', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(84, 'Steel', 'Steel', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(85, 'Plastic', 'Brass', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(86, 'Rubber', 'Granite', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(87, 'Plastic', 'Brass', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(88, 'Glass', 'Brass', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(89, 'Plexiglass', 'Granite', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(90, 'Plastic', 'Brass', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(91, 'Steel', 'Aluminum', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(92, 'Rubber', 'Stone', 1000, 1100, 10, 100, 4);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(93, 'Granite', 'Stone', 1000, 1100, 10, 100, 5);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(94, 'Stone', 'Glass', 1000, 1100, 10, 100, 6);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(95, 'Glass', 'Plexiglass', 1000, 1100, 10, 100, 7);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(96, 'Vinyl', 'Granite', 1000, 1100, 10, 100, 8);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(97, 'Brass', 'Wood', 1000, 1100, 10, 100, 1);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(98, 'Plexiglass', 'Plastic', 1000, 1100, 10, 100, 2);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(99, 'Brass', 'Aluminum', 1000, 1100, 10, 100, 3);
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `minimo_stock`, `cantidad`, `categoria_id`) VALUES(100, 'Brass', 'Plastic', 1000, 1100, 10, 100, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_factura_factura_estado1_idx` (`factura_estado_id`),
  ADD KEY `fk_factura_orden1_idx` (`orden_id`);

--
-- Indexes for table `factura_estado`
--
ALTER TABLE `factura_estado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orden_cliente_idx` (`cliente_id`);

--
-- Indexes for table `orden_producto`
--
ALTER TABLE `orden_producto`
  ADD PRIMARY KEY (`orden_id`,`producto_id`),
  ADD KEY `fk_orden_has_producto_producto1_idx` (`producto_id`),
  ADD KEY `fk_orden_has_producto_orden1_idx` (`orden_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `factura_estado`
--
ALTER TABLE `factura_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_factura_estado1` FOREIGN KEY (`factura_estado_id`) REFERENCES `factura_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_orden1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_orden_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orden_producto`
--
ALTER TABLE `orden_producto`
  ADD CONSTRAINT `fk_orden_has_producto_orden1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_has_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
