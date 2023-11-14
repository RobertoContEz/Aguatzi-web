-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/

--
-- Base de datos: `aguatzidatabase`
--


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `compra_producto` (
  `id_venta` int(11) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `subtotal_precio` float NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 --------------------------------------------------------

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(80) NOT NULL,
  `numero_casa` int(40) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `codigo_postal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `direccion` (`id_direccion`, `calle`, `numero_casa`, `colonia`, `estado`, `ciudad`, `codigo_postal`, `id_usuario`) VALUES
(1, 'a', 400, 'c', 'd', 'e', 85040, 'f', 3);

INSERT INTO `direccion` (`id_direccion`, `calle`, `numero_casa`, `colonia`, `estado`, `ciudad`, `codigo_postal`, `id_usuario`) VALUES
(2, 'g', 500, 'h', 'i', 'j', 85041, 'k', 4);

INSERT INTO `direccion` (`id_direccion`, `calle`, `numero_casa`, `colonia`, `estado`, `ciudad`, `codigo_postal`, `id_usuario`) VALUES
(3, 'l', 700, 'm', 'n', 'o', 85042, 'p', 5);

--------------------------------------------------------

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `img_producto` varchar(80) NOT NULL,
  `precio` float NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `productos` (`id_producto`, `nombre`, `img_producto`, `precio`, `tipo`, `stock`) VALUES
(1, 'garrafon rojo', 'assets/img/GARRAFON-19-LTS-ROJO.jpg', 200, 'garrafon', 20),
(2, 'garrafon amarillo', 'assets/img/GARRAFON-19-LTS-AMARILLO.jpg', 200, 'garrafon', 20),
(3, 'garrafon verde', 'assets/img/GARRAFON-19-LTS-VERDE.jpg', 200, 'garrafon', 20),
(4, 'garrafon azul', 'assets/img/GARRAFON-19-LTS-AZUL.jpg', 200, 'garrafon', 20),
(5, 'garrafon morado', 'assets/img/GARRAFON-19-LTS-MORADO.jpg', 200, 'garrafon', 20),
(6, 'garrafon rosa', 'assets/img/GARRAFON-19-LTS-ROSA.jpg', 200, 'garrafon', 20);

--------------------------------------------------------

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `telefono` varchar(40) NOT NULL,
  `tipo` enum('usuario','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `usuarios` (`id_usuario`, `nombre`, `pass`, `correo`, `telefono`, `tipo`) VALUES
(1, 'scooby', 'scooby', 'scooby@potros.mx', '6442331515', 'usuario'),
(2, 'Hannah', 'Hannitah', 'hannah@potros.mx', '6442337575', 'administrador');

--------------------------------------------------------
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`);

ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`id_venta`);

ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD UNIQUE KEY `idusuario` (`id_usuario`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `compra_producto`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;
