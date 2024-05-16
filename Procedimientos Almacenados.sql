--Procedimiento para obtener el nombre completo de un profesor por su ID:
CREATE OR REPLACE FUNCTION obtener_nombre_profesor_por_id(p_id_usuario INT)
RETURNS TEXT AS
$$
DECLARE
    v_nombre_completo TEXT;
BEGIN
    SELECT 'El nombre completo del profesor ' || P_NOMBRE || ' es: ' || P_NOMBRE || ' ' || S_NOMBRE || ' ' || P_APELLIDO || ' ' || S_APELLIDO
    INTO v_nombre_completo
    FROM USUARIO
    WHERE ID_USUARIO = p_id_usuario AND TIPO_USUARIO = 'Profesor';

    RETURN v_nombre_completo;
END;
$$
LANGUAGE plpgsql;

--Procedimiento para obtener el promedio de edades de todos los usuarios:
CREATE OR REPLACE FUNCTION obtener_promedio_edades_usuarios()
RETURNS DECIMAL AS
$$
DECLARE
    v_promedio DECIMAL;
BEGIN
    SELECT AVG(EDAD) INTO v_promedio FROM USUARIO;
    RETURN v_promedio;
END;
$$
LANGUAGE plpgsql;

--Procedimiento para obtener el tipo de usuario con la cantidad de usuarios de cada tipo:
CREATE OR REPLACE FUNCTION obtener_cantidad_usuarios_por_tipo()
RETURNS TABLE (tipo_usuario VARCHAR(40), cantidad INT) AS
$$
BEGIN
    RETURN QUERY SELECT TIPO_USUARIO, COUNT(*) AS cantidad FROM USUARIO GROUP BY TIPO_USUARIO;
END;
$$
LANGUAGE plpgsql;

--Procedimiento para obtener la información de una multa por su ID:
CREATE OR REPLACE FUNCTION obtener_informacion_multa_por_id(p_id_multa INT)
RETURNS TABLE (id_usuario INT, fecha_multa DATE, monto_debido DECIMAL) AS
$$
BEGIN
    RETURN QUERY SELECT ID_USUARIO, FECHA_MULTA, MONTO_DEBIDO_USUARIO FROM MULTAS WHERE ID_MULTA = p_id_multa;
END;
$$
LANGUAGE plpgsql;
