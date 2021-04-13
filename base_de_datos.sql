			
			CREATE TABLE `cliente` (
			`IdCliente` int(15) NOT NULL,
			`Identificacion` varchar(25) NOT NULL,
			`Nombres` varchar(250) NOT NULL,
			`Apellidos` varchar(250) NOT NULL,
			`DireccionEnvio` varchar(100) NOT NULL,
			`TelefonoFijo` varchar(25) NOT NULL,
			`Celular` varchar(25) NOT NULL,
			`Email` varchar(100) NOT NULL
		);
		ALTER TABLE `cliente` ADD PRIMARY KEY (`IdCliente`);
		CREATE TABLE `editorial` (
			`IdEditorial` int(15) NOT NULL,
			`Nombre` varchar(250) NOT NULL
		);
		ALTER TABLE `editorial` ADD PRIMARY KEY (`IdEditorial`);
		CREATE TABLE `empleado` (
			`IdEmpleado` int(15) NOT NULL,
			`Nombres` varchar(100) NOT NULL,
			`Apellidos` varchar(100) NOT NULL,
			`Direccion` varchar(100) NOT NULL,
			`TelefonoFijo` varchar(35) NOT NULL,
			`Celular` varchar(35) NOT NULL,
			`Cargo` varchar(100) NOT NULL
		);
		ALTER TABLE `empleado` ADD PRIMARY KEY (`IdEmpleado`);
	
		CREATE TABLE `libro` (
			`IdLibro` int(15) NOT NULL,
			`Titulo` varchar(250) NOT NULL,
			`IdEditorial` int(15) NOT NULL,
			`Fecha` date NOT NULL,
			`Costo` double NOT NULL,
			`PrecioSugerido` double NOT NULL,
			`Autor` varchar(250) NOT NULL
		);
		ALTER TABLE `libro` ADD PRIMARY KEY (`IdLibro`),
			ADD KEY `Libro_Editorial` (`IdEditorial`);
		ALTER TABLE `libro` ADD CONSTRAINT `Libro_Editorial` FOREIGN KEY (`IdEditorial`) REFERENCES `editorial` (`IdEditorial`);
		CREATE TABLE `compra` (
			`IdCompraLibro` int(15) NOT NULL,
			`IdLibro` int(15) NOT NULL,
			`IdCliente` int(15) NOT NULL,
			`Fecha` date NOT NULL,
			`Valor` double NOT NULL,
			`IdEmpleado` int(15) NOT NULL
		);
		
	

		INSERT INTO `cliente` (`IdCliente`, `Identificacion`, `Nombres`, `Apellidos`, `DireccionEnvio`, `TelefonoFijo`, `Celular`, `Email`) VALUES
		(1, '1193215687', 'Javier', 'Hernández Benavides', 'Cra 101 a # 42 - 45', '3148663984', '3137554705', 'jhb130220003@gmail.com'),
		(2, '12345678', 'Usuario', 'Prueba', 'Calle evergreen', '3066642069', '3066642069', 'prueba@megadev.com'),
		(3, '125679', 'Usuario', 'Prueba33', 'Calle 1', '3066642069', '3066642069', 'prueba33@megadev.com'),
		(4, '12346789', 'Usuario', 'Prueba34', 'Calle 2', '3066642069', '3066642069', 'prueba33@megadev.com'),
		(5, '123489', 'Usuario', 'Prueba35453', 'Calle 3', '3066642069', '3066642069', 'prueba33@megadev.com');
		INSERT INTO `compra` (`IdCompraLibro`, `IdLibro`, `IdCliente`, `Fecha`, `Valor`, `IdEmpleado`) VALUES
		(1, 1, 1, '2020-12-18', 50000, 1),
		(2, 1, 2, '2018-12-18', 60000, 2),
		(3, 2, 1, '2019-12-11', 50000, 1),
		(4, 2, 1, '2020-12-11', 50000, 1),
		(5, 2, 1, '2019-12-11', 50000, 1),
		(6, 3, 3, '2020-12-11', 50000, 1),
		(7, 2, 4, '2019-12-11', 50000, 2),
		(8, 1, 3, '2020-12-11', 50000, 1),
		(9, 4, 1, '2019-12-11', 50000, 3),
		(10, 5, 1, '2021-12-11', 50000, 1);
		INSERT INTO `editorial` (`IdEditorial`, `Nombre`) VALUES
		(1, 'Editorial Ficticia'),
		(2, 'Segunda Editorial'),
		(3, 'Tercera Editorial');
		INSERT INTO `empleado` (`IdEmpleado`, `Nombres`, `Apellidos`, `Direccion`, `TelefonoFijo`, `Celular`, `Cargo`) VALUES
		(1, 'Empleado', 'Principal', 'Eeee', '333', '333', 'Vendedor'),
		(2, 'Auxiliar', 'Ventas', '4444', '444', '444', 'Vendedor'),
		(3, 'Bodega', 'Ventas', '4444', '444', '444', 'Vendedor'),
		(4, 'Auxiliar', 'Bodega', '4444', '444', '444', 'Vendedor'),
		(5, 'Auxiliar', 'Cocina', '4444', '444', '444', 'Vendedor');
		INSERT INTO `libro` (`IdLibro`, `Titulo`, `IdEditorial`, `Fecha`, `Costo`, `PrecioSugerido`, `Autor`) VALUES
		(1, 'Primer libro de la app', 1, '2019-04-18', 50000, 50000, 'Isabel'),
		(2, 'Segundo libro de la app', 2, '2019-09-14', 60000, 60000, 'Laura'),
		(3, 'Tercer libro de la app', 2, '2019-10-14', 60000, 60000, 'Patrixc'),
		(4, 'Cuarto libro de la app', 2, '2019-11-14', 60000, 60000, 'Alonso'),
		(5, 'Quinto libro de la app', 2, '2019-08-14', 60000, 60000, 'Augusto');