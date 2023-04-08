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
-- Indices de la tabla `seats/travel`
--
ALTER TABLE `seats/travel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_seats` (`id_seats`),
  ADD KEY `id_travel` (`id_travel`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bus` (`id_bus`),
  ADD KEY `id_users` (`id_users`);

--
-- Indices de la tabla `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH,
  ADD UNIQUE KEY `name_2` (`name`) USING HASH;

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
-- AUTO_INCREMENT de la tabla `travel`
--
ALTER TABLE `travel`
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
-- Filtros para la tabla `seats/travel`
--
ALTER TABLE `seats/travel`
  ADD CONSTRAINT `seats/travel_ibfk_1` FOREIGN KEY (`id_seats`) REFERENCES `seats` (`id`),
  ADD CONSTRAINT `seats/travel_ibfk_2` FOREIGN KEY (`id_travel`) REFERENCES `travel` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`);

--
-- Filtros para la tabla `x_bus`
--
ALTER TABLE `x_bus`
  ADD CONSTRAINT `x_bus_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `bus` (`id`);
COMMIT;
