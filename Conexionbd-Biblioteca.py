import psycopg2

def ejecutar_procedimiento(procedimiento, *args):
    try:
        conn = psycopg2.connect(
            dbname="Biblioteca",
            user="postgres",
            password="12345",
            host="localhost"
        )
        print("¡Conexión exitosa!")
        cursor = conn.cursor()
        cursor.callproc(procedimiento, args)
        resultados = cursor.fetchall()
        conn.close()
        return resultados
    except psycopg2.Error as e:
        print("Error al conectar a la base de datos:", e)
        return None


# Llamar al procedimiento para obtener el nombre completo del profesor por su ID
nombre_profesor = ejecutar_procedimiento('obtener_nombre_profesor_por_id', 5)
print(nombre_profesor)

# Llamar al procedimiento para obtener el promedio de edades de todos los usuarios
promedio_edades = ejecutar_procedimiento('obtener_promedio_edades_usuarios')
print(promedio_edades)

# Llamar al procedimiento para obtener la cantidad de usuarios por tipo de usuario
cantidad_usuarios_por_tipo = ejecutar_procedimiento('obtener_cantidad_usuarios_por_tipo')
for tipo_usuario, cantidad in cantidad_usuarios_por_tipo:
    print(f'Tipo de usuario: {tipo_usuario}, Cantidad: {cantidad}')

# Llamar al procedimiento para obtener la información de una multa por su ID
informacion_multa = ejecutar_procedimiento('obtener_informacion_multa_por_id', 1)
print(informacion_multa)