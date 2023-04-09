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
  `id_bus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seats_trip`
--

CREATE TABLE `seats_trip` (
  `id_seats` int(11) NOT NULL,
  `id_travel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `home` varchar(50) NOT NULL,
  `departure` time NOT NULL,
  `destination` varchar(50) NOT NULL,
  `arrival` time NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trip`
--

INSERT INTO `trip` (`id`, `name`, `home`, `departure`, `destination`, `arrival`, `seats`) VALUES
(113, 'Aguascalientes - Calvillo', 'Aguascalientes, Aguascalientes', '16:45:02', 'Calvillo, Aguascalientes', '17:30:02', 48),
(114, 'Aguascalientes - San Juan de los Lagos', 'Aguascalientes, Aguascalientes', '10:48:02', 'San Juan de los Lagos, Jalisco', '11:53:02', 48),
(115, 'Aguascalientes - San Luis Potosí', 'Aguascalientes, Aguascalientes', '23:29:02', 'San Luis Potosí, San Luis Potosí', '01:49:02', 65),
(116, 'Aguascalientes - San Juan de los Lagos', 'Aguascalientes, Aguascalientes', '16:17:02', 'San Juan de los Lagos, Jalisco', '17:22:02', 48),
(117, 'Aguascalientes - Morelia', 'Aguascalientes, Aguascalientes', '14:14:02', 'Morelia, Michoacán', '18:14:02', 48),
(118, 'Aguascalientes - Cd. de México', 'Aguascalientes, Aguascalientes', '00:56:02', 'Cd. de México, Ciudad de México', '06:56:02', 65),
(119, 'Aguascalientes - Calvillo', 'Aguascalientes, Aguascalientes', '13:02:02', 'Calvillo, Aguascalientes', '13:47:02', 65),
(120, 'Aguascalientes - León', 'Aguascalientes, Aguascalientes', '16:12:02', 'León, Guanajuato', '17:23:02', 65),
(121, 'Aguascalientes - Querétaro', 'Aguascalientes, Aguascalientes', '15:52:02', 'Querétaro, Querétaro', '19:12:02', 65),
(122, 'Aguascalientes - León', 'Aguascalientes, Aguascalientes', '13:00:02', 'León, Guanajuato', '14:11:02', 65),
(123, 'Aguascalientes - Lagos de Moreno', 'Aguascalientes, Aguascalientes', '17:16:02', 'Lagos de Moreno, Jalisco', '18:31:02', 48),
(124, 'Aguascalientes - Querétaro', 'Aguascalientes, Aguascalientes', '14:58:02', 'Querétaro, Querétaro', '18:18:02', 48),
(125, 'Aguascalientes - Lagos de Moreno', 'Aguascalientes, Aguascalientes', '18:04:02', 'Lagos de Moreno, Jalisco', '19:19:02', 48),
(126, 'Aguascalientes - Monterrey', 'Aguascalientes, Aguascalientes', '10:12:02', 'Monterrey, Nuevo León', '17:12:02', 65),
(127, 'Aguascalientes - Monterrey', 'Aguascalientes, Aguascalientes', '19:22:02', 'Monterrey, Nuevo León', '02:22:02', 65),
(128, 'Aguascalientes - Calvillo', 'Aguascalientes, Aguascalientes', '19:21:02', 'Calvillo, Aguascalientes', '20:06:02', 65),
(129, 'Aguascalientes - San Juan de los Lagos', 'Aguascalientes, Aguascalientes', '05:13:02', 'San Juan de los Lagos, Jalisco', '06:18:02', 65),
(130, 'Aguascalientes - Cd. de México', 'Aguascalientes, Aguascalientes', '18:59:02', 'Cd. de México, Ciudad de México', '00:59:02', 48),
(131, 'Aguascalientes - San Luis Potosí', 'Aguascalientes, Aguascalientes', '12:46:02', 'San Luis Potosí, San Luis Potosí', '15:06:02', 65),
(132, 'Aguascalientes - Lagos de Moreno', 'Aguascalientes, Aguascalientes', '13:11:02', 'Lagos de Moreno, Jalisco', '14:26:02', 65),
(133, 'Aguascalientes - Querétaro', 'Aguascalientes, Aguascalientes', '23:35:02', 'Querétaro, Querétaro', '02:55:02', 65),
(134, 'Aguascalientes - Calvillo', 'Aguascalientes, Aguascalientes', '13:23:02', 'Calvillo, Aguascalientes', '14:08:02', 48),
(135, 'Aguascalientes - Cd. de México', 'Aguascalientes, Aguascalientes', '11:47:02', 'Cd. de México, Ciudad de México', '17:47:02', 48),
(136, 'Aguascalientes - Querétaro', 'Aguascalientes, Aguascalientes', '22:35:02', 'Querétaro, Querétaro', '01:55:02', 65),
(137, 'Puerto Vallarta - Aguascalientes', 'Puerto Vallarta, Jalisco', '05:18:02', 'Aguascalientes, Aguascalientes', '12:38:02', 65),
(138, 'Calvillo - Aguascalientes', 'Calvillo, Aguascalientes', '01:06:02', 'Aguascalientes, Aguascalientes', '01:51:02', 65),
(139, 'San Juan de los Lagos - Aguascalientes', 'San Juan de los Lagos, Jalisco', '21:58:02', 'Aguascalientes, Aguascalientes', '23:03:02', 48),
(140, 'Querétaro - Aguascalientes', 'Querétaro, Querétaro', '23:40:02', 'Aguascalientes, Aguascalientes', '03:00:02', 48),
(141, 'Calvillo - Aguascalientes', 'Calvillo, Aguascalientes', '02:43:02', 'Aguascalientes, Aguascalientes', '03:28:02', 65),
(142, 'Guadalajara - Aguascalientes', 'Guadalajara, Jalisco', '07:17:02', 'Aguascalientes, Aguascalientes', '10:17:02', 65),
(143, 'Calvillo - Aguascalientes', 'Calvillo, Aguascalientes', '07:32:02', 'Aguascalientes, Aguascalientes', '08:17:02', 65),
(144, 'León - Aguascalientes', 'León, Guanajuato', '07:53:02', 'Aguascalientes, Aguascalientes', '09:04:02', 48),
(145, 'Zacatecas - Aguascalientes', 'Zacatecas, Zacatecas', '04:20:02', 'Aguascalientes, Aguascalientes', '05:53:02', 48),
(146, 'Puerto Vallarta - Aguascalientes', 'Puerto Vallarta, Jalisco', '05:18:02', 'Aguascalientes, Aguascalientes', '12:38:02', 65),
(147, 'Guadalajara - Aguascalientes', 'Guadalajara, Jalisco', '10:15:02', 'Aguascalientes, Aguascalientes', '13:15:02', 48),
(148, 'Cd. de México - Aguascalientes', 'Cd. de México, Ciudad de México', '19:07:02', 'Aguascalientes, Aguascalientes', '01:07:02', 65),
(149, 'Calvillo - Aguascalientes', 'Calvillo, Aguascalientes', '17:18:02', 'Aguascalientes, Aguascalientes', '18:03:02', 65),
(150, 'San Juan de los Lagos - Aguascalientes', 'San Juan de los Lagos, Jalisco', '04:49:02', 'Aguascalientes, Aguascalientes', '05:54:02', 48),
(151, 'Monterrey - Aguascalientes', 'Monterrey, Nuevo León', '01:20:02', 'Aguascalientes, Aguascalientes', '08:20:02', 48),
(152, 'Querétaro - Aguascalientes', 'Querétaro, Querétaro', '17:37:02', 'Aguascalientes, Aguascalientes', '20:57:02', 65),
(153, 'San Luis Potosí - Aguascalientes', 'San Luis Potosí, San Luis Potosí', '09:54:02', 'Aguascalientes, Aguascalientes', '12:14:02', 65),
(154, 'Puerto Vallarta - Aguascalientes', 'Puerto Vallarta, Jalisco', '16:15:02', 'Aguascalientes, Aguascalientes', '23:35:02', 65),
(155, 'Calvillo - Aguascalientes', 'Calvillo, Aguascalientes', '23:41:02', 'Aguascalientes, Aguascalientes', '00:26:02', 48),
(156, 'Monterrey - Aguascalientes', 'Monterrey, Nuevo León', '11:53:02', 'Aguascalientes, Aguascalientes', '18:53:02', 48),
(157, 'San Luis Potosí - Aguascalientes', 'San Luis Potosí, San Luis Potosí', '06:00:02', 'Aguascalientes, Aguascalientes', '08:20:02', 48),
(158, 'Lagos de Moreno - Aguascalientes', 'Lagos de Moreno, Jalisco', '23:15:02', 'Aguascalientes, Aguascalientes', '00:30:02', 65),
(159, 'Guadalajara - Aguascalientes', 'Guadalajara, Jalisco', '08:45:02', 'Aguascalientes, Aguascalientes', '11:45:02', 65),
(160, 'Querétaro - Aguascalientes', 'Querétaro, Querétaro', '07:23:02', 'Aguascalientes, Aguascalientes', '10:43:02', 65),
(161, 'San Juan de los Lagos - Aguascalientes', 'San Juan de los Lagos, Jalisco', '20:28:02', 'Aguascalientes, Aguascalientes', '21:33:02', 48),
(162, 'San Luis Potosí - Aguascalientes', 'San Luis Potosí, San Luis Potosí', '08:32:02', 'Aguascalientes, Aguascalientes', '10:52:02', 65),
(163, 'Cd. de México - Aguascalientes', 'Cd. de México, Ciudad de México', '18:32:02', 'Aguascalientes, Aguascalientes', '00:32:02', 48),
(164, 'San Luis Potosí - Aguascalientes', 'San Luis Potosí, San Luis Potosí', '09:17:02', 'Aguascalientes, Aguascalientes', '11:37:02', 48),
(165, 'Morelia - Aguascalientes', 'Morelia, Michoacán', '03:30:02', 'Aguascalientes, Aguascalientes', '07:30:02', 65),
(166, 'León - Aguascalientes', 'León, Guanajuato', '17:47:02', 'Aguascalientes, Aguascalientes', '18:58:02', 48),
(167, 'San Juan de los Lagos - Aguascalientes', 'San Juan de los Lagos, Jalisco', '02:02:02', 'Aguascalientes, Aguascalientes', '03:07:02', 65),
(168, 'Zacatecas - Aguascalientes', 'Zacatecas, Zacatecas', '13:10:02', 'Aguascalientes, Aguascalientes', '14:43:02', 65);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `trips`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `trips` (
`id` int(11)
,`name` varchar(80)
,`home` varchar(50)
,`departure` time
,`destination` varchar(50)
,`arrival` time
,`seats` int(11)
);

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
