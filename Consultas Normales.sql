select * from USUARIO;
select * from ARTICULOS;
select * from PRESTAMOS;
select * from MULTAS;

SELECT 'El nombre completo del profesor Arturo es: ' || ' ' ||
P_NOMBRE || ' ' || S_NOMBRE || ' ' || P_APELLIDO || ' ' ||
S_APELLIDO
FROM USUARIO WHERE ID_USUARIO=5;


SELECT AVG(EDAD) AS PROMEDIO_EDADES FROM USUARIO;


SELECT TIPO_USUARIO, P_NOMBRE, S_NOMBRE, P_APELLIDO,
S_APELLIDO
FROM USUARIO
WHERE EDAD = (SELECT MAX(EDAD) FROM USUARIO);


SELECT TIPO_USUARIO, COUNT(*) AS Cantidad
FROM USUARIO
GROUP BY TIPO_USUARIO;


SELECT ID_USUARIO,FECHA_MULTA,
MONTO_DEBIDO_USUARIO
FROM MULTAS
WHERE ID_MULTA = 1;