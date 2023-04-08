
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user` (`na` TEXT, `pass` VARCHAR(15))   begin
	insert into users (`name`,`password`) values (`na`,`pass`);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modify` (IN `i` INT(11), `bus` INT(11), `tickets` INT(11))   begin 
	update tickets set id_bus=bus, `id_users`=tickets where id=i;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sale` (IN `i` INT(11), `bus` INT(11), `tickets` INT(11), `idu` INT)   begin 
	insert into tickets values (`i`,`bus`,`tickets`);
    update users set `n_ticket`= tickets where id=idu;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seatsbyuser` (IN `idu` INT)   BEGIN
    SELECT * FROM seats where id=(select id from users where id=idu);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `trips` (IN `idu` INT)   begin 
	select * from tickets where `id_users`=(select id from users where id=idu);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users` (IN `idu` INT)   BEGIN
    SELECT * FROM users where id=idu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usersbyname` (IN `nam` TEXT)   BEGIN
    SELECT * FROM users where name=nam;
END$$

DELIMITER ;

-- --------------------------------------------------------
