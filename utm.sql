-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-03-2022 a las 17:26:12
-- Versión del servidor: 8.0.27-0ubuntu0.21.10.1
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `utm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `idArticulo` bigint NOT NULL,
  `tipoCRL` int NOT NULL,
  `titulo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreCRL` text NOT NULL,
  `estado` text NOT NULL,
  `fechaedicion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoNI` int NOT NULL,
  `volumen` text NOT NULL,
  `paginas` text NOT NULL,
  `anyo` text NOT NULL,
  `issnisbn` int NOT NULL,
  `doi` text NOT NULL,
  `comprobante` text NOT NULL,
  `indexada` text NOT NULL,
  `issue` text NOT NULL,
  `editores` text NOT NULL,
  `ciudad` text NOT NULL,
  `pais` text NOT NULL,
  `editorial` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`idArticulo`, `tipoCRL`, `titulo`, `nombreCRL`, `estado`, `fechaedicion`, `tipoNI`, `volumen`, `paginas`, `anyo`, `issnisbn`, `doi`, `comprobante`, `indexada`, `issue`, `editores`, `ciudad`, `pais`, `editorial`) VALUES
(4, 1, 'Articulo 1', 'uno', 'Publicado', '2022-01-25', 1, '1', '5-8', '2022', 22112212, 'doi1', 'creado', 'no', '21222', 'UTM', 'Oaxaca de Juárez', 'México', 'UTM'),
(5, 1, 'Articulo 2', 'uno', 'Publicado', '2022-01-01', 1, '1', '10-22', '2022', 123123, 'doi2', 'existe', 'si', '2112', 'UTM', 'Huajuapan de León', 'México', 'UTM'),
(6, 1, '¿Por qué necesitamos estudiar?', '¿Por qué necesitamos estudiar?', 'publicado', '2012-04-01', 1, '1', '10-20', '2012', 11, 'www.publi-gtx.com', 'Registro', '98256', '100', 'R&R', 'Oaxaca', 'México', 'Publicaciones GTX'),
(7, 1, 'Misterios de la UTM', 'Misterios de la UTM', 'publicado', '2013-05-02', 1, '1', '10-20', '2012', 1, 'www.revista-gtx.com', 'Registro', '98256', '100', 'R&R', 'Oaxaca', 'México', 'Revista GTX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articuloYprofesor`
--

CREATE TABLE `articuloYprofesor` (
  `idAyP` bigint NOT NULL,
  `idProfesor` bigint NOT NULL,
  `idArticulo` bigint NOT NULL,
  `posicion` int NOT NULL,
  `validado` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articuloYprofesor`
--

INSERT INTO `articuloYprofesor` (`idAyP`, `idProfesor`, `idArticulo`, `posicion`, `validado`) VALUES
(5, 5, 4, 1, 1),
(6, 1, 4, 1, 1),
(7, 5, 5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idCarrera` bigint NOT NULL,
  `codigoCarrera` text NOT NULL,
  `nombreCarrera` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idInstituto` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`idCarrera`, `codigoCarrera`, `nombreCarrera`, `idInstituto`) VALUES
(1, '02', 'Ingeniería en Computación', 1),
(6, '03', 'Ingeniería en Mecatrónica', 7),
(7, '01', 'Ingeniería en Electrónica', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institutos`
--

CREATE TABLE `institutos` (
  `idInstituto` bigint NOT NULL,
  `nombreInstituto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoInstituto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `institutos`
--

INSERT INTO `institutos` (`idInstituto`, `nombreInstituto`, `codigoInstituto`) VALUES
(1, 'Computación', '002'),
(2, 'Mecatrónica y Electrónica', '007'),
(3, 'Fisica', '005'),
(7, 'Fisica y Matematicas', '010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` bigint NOT NULL,
  `idPlan` bigint NOT NULL,
  `semestre` int NOT NULL,
  `nombreMateria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMateria`, `idPlan`, `semestre`, `nombreMateria`) VALUES
(1, 1, 5, 'Materia 1'),
(2, 2, 3, 'Materia 2'),
(3, 1, 1, 'Materia 3'),
(4, 4, 1, 'Materia 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `idPeriodo` bigint NOT NULL,
  `nombrePeriodo` text NOT NULL,
  `inicio` text NOT NULL,
  `fin` text NOT NULL,
  `actual` tinyint(1) NOT NULL,
  `avance1` text NOT NULL,
  `avance2` text NOT NULL,
  `avance3` text NOT NULL,
  `avanceFinal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`idPeriodo`, `nombrePeriodo`, `inicio`, `fin`, `actual`, `avance1`, `avance2`, `avance3`, `avanceFinal`) VALUES
(1, 'A', '2021', '2022', 1, 'avance 1', 'avance 2', 'avance 3', 'avance final'),
(2, 'B', '2021', '2022', 0, 'avance 1', 'avance 2', 'avance 3', 'avance final');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `idPlan` bigint NOT NULL,
  `idCarrera` bigint NOT NULL,
  `nombrePlan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`idPlan`, `idCarrera`, `nombrePlan`) VALUES
(1, 1, 'Nuevo Plan'),
(2, 6, 'Nuevo Plan'),
(3, 7, 'Plan actual'),
(4, 1, 'Viejo Plan'),
(5, 6, 'Viejo Plan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `idProfesor` bigint NOT NULL,
  `nombres` text NOT NULL,
  `apellidoPaterno` text NOT NULL,
  `apellidoMaterno` text NOT NULL,
  `nombreApa` text NOT NULL,
  `correoProfesor` text NOT NULL,
  `password` text NOT NULL,
  `nivel` int NOT NULL,
  `idInstituto` bigint NOT NULL,
  `idCarrera` bigint NOT NULL,
  `grado` text NOT NULL,
  `idTipoProfesor` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`idProfesor`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `nombreApa`, `correoProfesor`, `password`, `nivel`, `idInstituto`, `idCarrera`, `grado`, `idTipoProfesor`) VALUES
(1, 'Profesor 1', 'Apellido Paterno 1', 'Apellido Materno 2', '', 'correo_profe_1@gmail.com', 'password01', 2, 0, 1, 'grado 1', 1),
(2, 'Profesor 2', 'Apellido Paterno 2', 'Apellido Materno 2', '', 'correo_profe_2@gmail.com', 'password02', 1, 0, 6, 'grado 2', 2),
(3, 'Profesor 3', 'Apellido Paterno 3', 'Apellido Materno 3', '', 'correo_profe_3@gmail.com', 'password03', 3, 0, 7, 'grado 3', 3),
(4, 'Profesor 4', 'Apellido Paterno 4', 'Apellido Materno 4', '', 'correo_profe_4@gmail.com', 'password04', 3, 0, 7, 'grado 4', 1),
(5, 'Axel Isaac', 'Garcia', 'Gonzalez', '', 'axldorian3@gmail.com', '$2a$10$Ym4x3pp25L79f86DhQVKsOnaP35Beon2JqB7gwtOqqUMcaNwxTnja', 1, 0, 1, 'grado 1', 1),
(6, 'Isaac', 'Do', 'Rian', '', 'axlfake3@gmail.com', '$2a$10$i8FE01P85a/RPWYSSL9RfOJWrjryvkinbrryZNXK28TD/hVOHO4eq', 1, 0, 1, 'grado 1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesorYmateria`
--

CREATE TABLE `profesorYmateria` (
  `idProfesorYMateria` bigint NOT NULL,
  `idProfesor` bigint NOT NULL,
  `idMateria` bigint NOT NULL,
  `grupo` text NOT NULL,
  `anyo` int NOT NULL,
  `idPeriodo` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesorYmateria`
--

INSERT INTO `profesorYmateria` (`idProfesorYMateria`, `idProfesor`, `idMateria`, `grupo`, `anyo`, `idPeriodo`) VALUES
(1, 1, 1, 'A', 2021, 1),
(2, 2, 1, 'A', 2021, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoProfesor`
--

CREATE TABLE `tipoProfesor` (
  `idTipoProfesor` bigint NOT NULL,
  `nombreTipo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipoProfesor`
--

INSERT INTO `tipoProfesor` (`idTipoProfesor`, `nombreTipo`) VALUES
(1, 'Tipo 1'),
(2, 'Tipo 2'),
(3, 'Tipo 3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`idArticulo`);

--
-- Indices de la tabla `articuloYprofesor`
--
ALTER TABLE `articuloYprofesor`
  ADD PRIMARY KEY (`idAyP`),
  ADD KEY `profesorValido` (`idProfesor`),
  ADD KEY `articuloValido` (`idArticulo`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idCarrera`),
  ADD KEY `InstitutoValido` (`idInstituto`);

--
-- Indices de la tabla `institutos`
--
ALTER TABLE `institutos`
  ADD PRIMARY KEY (`idInstituto`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `PlanValido` (`idPlan`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`idPeriodo`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`idPlan`),
  ADD KEY `validacarrera` (`idCarrera`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`idProfesor`),
  ADD KEY `CarreraValida` (`idCarrera`),
  ADD KEY `TipoProfesorValido` (`idTipoProfesor`);

--
-- Indices de la tabla `profesorYmateria`
--
ALTER TABLE `profesorYmateria`
  ADD PRIMARY KEY (`idProfesorYMateria`),
  ADD KEY `PeriodoValido` (`idPeriodo`),
  ADD KEY `profesorValid` (`idProfesor`),
  ADD KEY `MateriaValida` (`idMateria`);

--
-- Indices de la tabla `tipoProfesor`
--
ALTER TABLE `tipoProfesor`
  ADD PRIMARY KEY (`idTipoProfesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `idArticulo` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `articuloYprofesor`
--
ALTER TABLE `articuloYprofesor`
  MODIFY `idAyP` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idCarrera` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `institutos`
--
ALTER TABLE `institutos`
  MODIFY `idInstituto` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idMateria` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `idPeriodo` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `idPlan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `idProfesor` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `profesorYmateria`
--
ALTER TABLE `profesorYmateria`
  MODIFY `idProfesorYMateria` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoProfesor`
--
ALTER TABLE `tipoProfesor`
  MODIFY `idTipoProfesor` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articuloYprofesor`
--
ALTER TABLE `articuloYprofesor`
  ADD CONSTRAINT `articuloValido` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `profesorValido` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `InstitutoValido` FOREIGN KEY (`idInstituto`) REFERENCES `institutos` (`idInstituto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `PlanValido` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`idPlan`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `validacarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `CarreraValida` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `TipoProfesorValido` FOREIGN KEY (`idTipoProfesor`) REFERENCES `tipoProfesor` (`idTipoProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `profesorYmateria`
--
ALTER TABLE `profesorYmateria`
  ADD CONSTRAINT `MateriaValida` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `PeriodoValido` FOREIGN KEY (`idPeriodo`) REFERENCES `periodos` (`idPeriodo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `profesorValid` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
