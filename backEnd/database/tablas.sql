--
-- Estructura de tabla para la tabla `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL,
  `home` varchar(25) NOT NULL,
  `departure` datetime NOT NULL,
  `destination` varchar(25) NOT NULL,
  `arrival` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `features`
--

CREATE TABLE `features` (
  `id_bus` int(11) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `num_bathrooms` int(11) NOT NULL,
  `individual_trunk` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `assigned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seats_trip`
--

CREATE TABLE `seats_trip` (
  `id_seats` int(11) NOT NULL,
  `id_trip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `id_bus` int(11) DEFAULT NULL,
  `id_usr` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `home_city` varchar(50) NOT NULL,
  `home_state` varchar(50) NOT NULL,
  `departure` datetime NOT NULL,
  `destination_city` varchar(50) NOT NULL,
  `destination_state` varchar(50) NOT NULL,
  `arrival` datetime NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_bus`
--

CREATE TABLE `users_bus` (
  `id_bus` int(11) NOT NULL,
  `id_users` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_bus`
--

CREATE TABLE `x_bus` (
  `id_bus` int(11) NOT NULL,
  `state` varchar(80) NOT NULL,
  `seats` int(11) NOT NULL,
  `luxury` int(11) NOT NULL,
  `brand` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
