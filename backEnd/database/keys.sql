--
-- Estructura para la vista `trips`
--
DROP TABLE IF EXISTS `trips`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `trips`  AS SELECT `trip`.`id` AS `id`, `trip`.`name` AS `name`, `trip`.`home` AS `home`, `trip`.`departure` AS `departure`, `trip`.`destination` AS `destination`, `trip`.`arrival` AS `arrival`, `trip`.`seats` AS `seats` FROM `trip` WHERE `trip`.`departure` > current_timestamp() AND `trip`.`departure` <= current_timestamp() + interval 10 minute LIMIT 0, 2525  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `features`
--
ALTER TABLE `features`
  ADD KEY `features_ibfk_1` (`id_bus`);

--
-- Indices de la tabla `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bus` (`id_bus`);

--
-- Indices de la tabla `seats_trip`
--
ALTER TABLE `seats_trip`
  ADD KEY `id_seats` (`id_seats`),
  ADD KEY `id_travel` (`id_travel`);

--
-- Indices de la tabla `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH,
  ADD UNIQUE KEY `name_2` (`name`) USING HASH;

--
-- Indices de la tabla `users_bus`
--
ALTER TABLE `users_bus`
  ADD KEY `id_bus` (`id_bus`),
  ADD KEY `id_users` (`id_users`);

--
-- Indices de la tabla `x_bus`
--
ALTER TABLE `x_bus`
  ADD KEY `id_bus` (`id_bus`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seats_trip`
--
ALTER TABLE `seats_trip`
  ADD CONSTRAINT `seats_trip_ibfk_1` FOREIGN KEY (`id_seats`) REFERENCES `seats` (`id`),
  ADD CONSTRAINT `seats_trip_ibfk_2` FOREIGN KEY (`id_travel`) REFERENCES `trip` (`id`);

--
-- Filtros para la tabla `users_bus`
--
ALTER TABLE `users_bus`
  ADD CONSTRAINT `users_bus_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`);

--
-- Filtros para la tabla `x_bus`
--
ALTER TABLE `x_bus`
  ADD CONSTRAINT `x_bus_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`);
COMMIT;
