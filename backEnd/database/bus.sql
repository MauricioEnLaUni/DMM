-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2023 a las 21:28:44
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bus`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `allusers` ()   BEGIN
    SELECT * FROM users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buses` ()   begin 
	select * from bus;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel` (IN `i` INT(11))   begin 
	delete from tickets where id=i;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user` (`na` TEXT, `last` TEXT, `pass` VARCHAR(15))   begin
	insert into users (`name`,`last name`,`password`) values (`na`,`last`,`pass`);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modify` (IN `i` INT(11), `bus` INT(11), `tickets` INT(11))   begin 
	update tickets set id_bus=bus, `id_users`=tickets where id=i;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sale` (IN `i` INT(11), `bus` INT(11), `tickets` INT(11), `idu` INT)   begin 
	insert into tickets values (`i`,`bus`,`tickets`);
    update users set `n_ticket`= tickets where id=idu;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `trips` (IN `idu` INT)   begin 
	select * from tickets where `id_users`=(select id from users where id=idu);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users` (IN `idu` INT)   BEGIN
    SELECT * FROM users where id=idu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seatsbyuser` (IN `idu` INT)   BEGIN
    SELECT * FROM seats where id=(select id from users where id=idu);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL,
  `home` varchar(25) NOT NULL,
  `home_datetime` datetime NOT NULL,
  `destination` varchar(25) NOT NULL,
  `destination_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `columns` text NOT NULL,
  `number` int(11) NOT NULL,
  `id_bus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `id_bus` int(11) NOT NULL,
  `id_users` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `last_name` text DEFAULT NULL,
  `password` varchar(85) NOT NULL,
  `telefono` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bus` (`id_bus`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bus` (`id_bus`),
  ADD KEY `id_users` (`id_users`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
