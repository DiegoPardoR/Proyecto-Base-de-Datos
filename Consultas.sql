/*-articulos que mas se prestan durante un rango de tiempo*/

SELECT 
    a.NUM_INVENTARIO,
    a.NOMBRE_ARTICULO,
    COUNT(p.ID_PRESTAMOS) AS CANTIDAD_PRESTAMOS
FROM 
    PRESTAMOS p
JOIN 
    ARTICULOS a ON p.NUM_INVENTARIO = a.NUM_INVENTARIO
WHERE 
    p.FECHA_INICIO BETWEEN '2020-01-01' AND '2024-05-31'
GROUP BY 
    a.NUM_INVENTARIO, 
    a.NOMBRE_ARTICULO
ORDER BY 
    CANTIDAD_PRESTAMOS DESC;

/*Libros prestados por personas (Estudiantes, profesores)*/

SELECT 
    U.ID_USUARIO,
    U.P_NOMBRE,
    U.P_APELLIDO,
    A.NUM_INVENTARIO,
    A.NOMBRE_ARTICULO,
    P.FECHA_INICIO,
    P.FECHA_VENCIMIENTO,
    P.ESTADO_ARTICULO
FROM 
    USUARIO U
JOIN 
    PRESTAMOS P ON U.ID_USUARIO = P.ID_USUARIO
JOIN 
    ARTICULOS A ON P.NUM_INVENTARIO = A.NUM_INVENTARIO
ORDER BY 
    U.ID_USUARIO, P.FECHA_INICIO;

/*- Multas pendientes por pago x Estudiante en un rango de tiempo*/

SELECT 
    U.ID_USUARIO,
    U.P_NOMBRE,
    U.P_APELLIDO,
    M.ID_MULTA,
    M.ARTICULO_NO_DEVUELTO,
    M.FECHA_MULTA,
    M.MONTO_DEBIDO_USUARIO
FROM 
    USUARIO U
JOIN 
    MULTAS M ON U.ID_USUARIO = M.ID_USUARIO
JOIN 
    PRESTAMOS P ON M.ID_MULTA = P.ID_MULTA
WHERE 
    U.TIPO_USUARIO = 'Estudiante'
    AND M.FECHA_MULTA BETWEEN '2020-04-01' AND '2024-04-30'
ORDER BY 
    U.ID_USUARIO, M.FECHA_MULTA;


/* articulos pendientes por entregar*/
SELECT 
    A.NUM_INVENTARIO,
    A.NOMBRE_ARTICULO,
    P.ID_PRESTAMOS,
    P.FECHA_INICIO,
    P.FECHA_VENCIMIENTO,
    U.P_NOMBRE AS NOMBRE_USUARIO,
    U.P_APELLIDO AS APELLIDO_USUARIO
FROM 
    ARTICULOS A
JOIN 
    PRESTAMOS P ON A.NUM_INVENTARIO = P.NUM_INVENTARIO
JOIN 
    USUARIO U ON P.ID_USUARIO = U.ID_USUARIO
ORDER BY 
    P.FECHA_VENCIMIENTO;
