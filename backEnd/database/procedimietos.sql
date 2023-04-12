DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `allusers` ()   BEGIN
    SELECT * FROM users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel` (IN `i` INT(11))   begin 
	delete from tickets where id=i;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user` (`na` TEXT, `pass` VARCHAR(15))   begin
	insert into users (`name`,`password`) values (`na`,`pass`);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modify` (IN `i` INT(11), IN `bus` INT(11), IN `user` INT(11))   begin 
	update users_bus set id_bus=bus where `id_users`=user;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seatsbyuser` (IN `idu` INT)   BEGIN
    SELECT * FROM seats where id=(select id from users where id=idu);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `trip` ()   begin 
	select * from trip;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `trips` ()   BEGIN
    SELECT * FROM TRIP WHERE (SELECT DATE_ADD(NOW(), INTERVAL 10 MINUTE_SECOND))limit 25;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usersbyid` (IN `idu` INT)   BEGIN
    SELECT * FROM users where id=idu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usersbyname` (IN `nam` TEXT)   BEGIN
    SELECT * FROM users where name=nam;
END$$

DELIMITER ;

-- --------------------------------------------------------
