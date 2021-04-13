SELECT C.IdCliente AS `Identificacion`, C.nombres AS `Nombres`, C.Apellidos AS `Apellido`, 
			SUM(CO.Valor) AS `TotalCompras`, YEAR(CO.fecha) AS `Año`
		FROM `compra` AS CO
		LEFT JOIN `cliente` AS C ON (CO.IdCliente = C.IdCliente)
		GROUP BY C.IdCliente, `Nombres`, `Apellido`, YEAR(CO.fecha);
	


		SELECT E.`Nombres`, E.`Apellidos`, COUNT(CO.IdCompraLibro) AS `TotalLibros`
		FROM empleado as E
		LEFT JOIN `compra` AS CO ON CO.IdEmpleado = E.IdEmpleado AND YEAR(CO.Fecha) = 2019
		GROUP BY E.`Nombres`, E.`Apellidos`
		ORDER BY COUNT(CO.IdCompraLibro) DESC;
	

	
		SELECT CONCAT(E.nombres, ' ', E.Apellidos) AS `NombreCompleto`, SUM(CO.Valor) AS ValorTotalVentas
			FROM empleado as E
			LEFT JOIN `compra` AS CO ON CO.IdEmpleado = E.IdEmpleado AND YEAR(CO.Fecha) = 2019
			GROUP BY `NombreCompleto`
			ORDER BY COUNT(CO.IdCompraLibro) DESC;
		


	SELECT C.Identificacion, C.Nombres, C.Apellidos,
		F.IdEditorial
		FROM `compra` AS CO
		LEFT JOIN `cliente` AS C ON CO.IdCliente = C.IdCliente
		LEFT JOIN `libro` AS L ON CO.IdLibro = L.IdLibro
		LEFT JOIN `editorial` AS E ON L.IdEditorial = F.IdEditorial
        LEFT JOIN (SELECT C.IdCliente, E.IdEditorial AS IdEditorial,
			 COUNT(E.IdEditorial)
		FROM `compra` AS CO
		LEFT JOIN `cliente` AS C ON CO.IdCliente = C.IdCliente
		LEFT JOIN `libro` AS L ON CO.IdLibro = L.IdLibro
		LEFT JOIN `editorial` AS E ON L.IdEditorial = E.IdEditorial
        GROUP BY  C.IdCliente, E.IdEditorial LIMIT 1) AS F ON C.IdCliente = F.IdCliente
        GROUP BY  C.Identificacion, C.Nombres, C.Apellidos, E.IdEditorial 
	


		SELECT C.Identificacion, C.Nombres, C.Email 
		FROM `cliente` AS C
		WHERE C.IdCliente NOT IN( SELECT CO.IdCliente FROM `compra` AS CO WHERE YEAR(CO.Fecha) = 2019 )
		AND C.Email like '%@gmail.com'
