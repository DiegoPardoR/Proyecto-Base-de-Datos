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

# Llamar al procedimiento para obtener multas pendientes de pago de un estudiante en un rango de tiempo
multas_pendientes = ejecutar_procedimiento('multas_pendientes_estudiante_rango', '2024-01-01', '2024-12-31')
print("Multas pendientes de pago de estudiantes en 2024:")
for multa in multas_pendientes:
    print(multa)

# Llamar al procedimiento para obtener artículos prestados por cada usuario
articulos_prestados = ejecutar_procedimiento('articulos_prestados_usuario')
print("\nArtículos prestados por cada usuario:")
for articulo in articulos_prestados:
    print(articulo)

# Llamar al procedimiento para obtener artículos pendientes por entregar
articulos_pendientes = ejecutar_procedimiento('articulos_pendientes_entregar')
print("\nArtículos pendientes por entregar:")
for articulo in articulos_pendientes:
    print(articulo)

resultados_articulos_mas_prestados = ejecutar_procedimiento("articulos_mas_prestados_rango")

# Imprimir resultados
for resultado in resultados_articulos_mas_prestados:
    print(resultado)


