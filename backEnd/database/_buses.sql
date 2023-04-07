-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2023 a las 03:44:33
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
-- Base de datos: ` buses`
--

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
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bus`
--
--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`);

--
-- Filtros para la tabla `users`
--


 
DELIMITER $$
CREATE PROCEDURE users(in idu int)
BEGIN
    SELECT * FROM users where id=idu;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE allusers()
BEGIN
    SELECT * FROM users;
END$$
DELIMITER ;

DELIMITER $$
create procedure insert_user(`na` text,`last` text,`pass` varchar(15))
begin
	insert into users (`name`,`last name`,`password`) values (`na`,`last`,`pass`);
end$$
DELIMITER ;

DELIMITER $$
create procedure buses()
begin 
	select * from bus;
end$$
DELIMITER ;

DELIMITER $$
create procedure trips(in idu int)
begin 
	select * from tickets where `id_users`=(select id from users where id=idu);
end$$
DELIMITER ;

DELIMITER $$
create procedure sale(in `i` int(11),`bus` int(11),`tickets` int(11), idu int)
begin 
	insert into tickets values (`i`,`bus`,`tickets`);
    update users set `n_ticket`= tickets where id=idu;
end$$
DELIMITER ;

DELIMITER $$
create procedure `modify`(in `i` int(11),`bus` int(11),`tickets` int(11))
begin 
	update tickets set id_bus=bus, `id_users`=tickets where id=i;
end$$
DELIMITER ;

DELIMITER $$
create procedure cancel(in `i` int(11))
begin 
	delete from tickets where id=i;
end$$
DELIMITER ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
