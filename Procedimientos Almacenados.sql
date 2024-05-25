/*multas_pendientes_estudiante_rango*/
REATE OR REPLACE FUNCTION multas_pendientes_estudiante_rango(
    IN fecha_inicio DATE,
    IN fecha_fin DATE
) 
RETURNS TABLE (
    id_multa INT,
    articulo_no_devuelto VARCHAR(40),
    fecha_multa DATE,
    monto_debido_usuario DECIMAL(10,2),
    id_usuario INT,
    p_nombre VARCHAR(40),
    p_apellido VARCHAR(40)
) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        M.ID_MULTA,
        M.ARTICULO_NO_DEVUELTO,
        M.FECHA_MULTA,
        M.MONTO_DEBIDO_USUARIO,
        M.ID_USUARIO,
        U.P_NOMBRE,
        U.P_APELLIDO
    FROM 
        MULTAS M
    JOIN 
        USUARIO U ON M.ID_USUARIO = U.ID_USUARIO
    WHERE 
        U.TIPO_USUARIO = 'Estudiante'
        AND M.FECHA_MULTA BETWEEN fecha_inicio AND fecha_fin;
END;
$$ LANGUAGE plpgsql;

/*articulos_prestados_usuario*/

CREATE OR REPLACE FUNCTION articulos_prestados_usuario()
RETURNS TABLE (
    id_usuario INT,
    p_nombre VARCHAR(40),
    p_apellido VARCHAR(40),
    num_inventario INT,
    nombre_articulo VARCHAR(40),
    fecha_inicio DATE,
    fecha_vencimiento DATE,
    estado_articulo VARCHAR(40)
) 
AS $$
BEGIN
    RETURN QUERY 
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
        ARTICULOS A ON P.NUM_INVENTARIO = A.NUM_INVENTARIO;
END;
$$ LANGUAGE plpgsql;

/*articulos_pendientes_entregar*/
CREATE OR REPLACE FUNCTION articulos_pendientes_entregar()
RETURNS TABLE (
    num_inventario INT,
    nombre_articulo VARCHAR(40),
    id_prestamo INT,
    fecha_inicio DATE,
    fecha_vencimiento DATE,
    p_nombre VARCHAR(40),
    p_apellido VARCHAR(40)
) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        A.NUM_INVENTARIO,
        A.NOMBRE_ARTICULO,
        P.ID_PRESTAMOS,
        P.FECHA_INICIO,
        P.FECHA_VENCIMIENTO,
        U.P_NOMBRE,
        U.P_APELLIDO
    FROM 
        ARTICULOS A
    JOIN 
        PRESTAMOS P ON A.NUM_INVENTARIO = P.NUM_INVENTARIO
    JOIN 
        USUARIO U ON P.ID_USUARIO = U.ID_USUARIO;
END;
$$ LANGUAGE plpgsql;

/*articulos_pendientes_entregar_alternativo*/

CREATE OR REPLACE FUNCTION articulos_pendientes_entregar_alternativo()
RETURNS TABLE (
    num_inventario INT,
    nombre_articulo VARCHAR(40)
) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        NUM_INVENTARIO,
        NOMBRE_ARTICULO
    FROM 
        PRESTAMOS P
    JOIN 
        ARTICULOS A ON P.NUM_INVENTARIO = A.NUM_INVENTARIO;
END;
$$ LANGUAGE plpgsql;
