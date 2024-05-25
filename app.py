from flask import Flask, render_template, request, redirect, url_for, flash, get_flashed_messages
import psycopg2
from datetime import datetime
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)



# Conexión a la base de datos PostgreSQL
def conectar_bd():
    return psycopg2.connect(
        dbname="Biblioteca",
        user="postgres",
        password="12345",
        host="localhost",
        port="5432"
    )

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/consultar_articulos', methods=['GET'])
def consultar_articulos():
    articulos = obtener_articulos()
    return render_template('lista_articulos.html', articulos=articulos)


# Obtener todos los artículos de la base de datos
def obtener_articulos():
    conn = conectar_bd()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM ARTICULOS;")
            articulos = cursor.fetchall()
    except Exception as e:
        flash(f"Error al obtener artículos: {str(e)}", 'error')
        articulos = []
    finally:
        conn.close()
    return articulos

# Obtener un artículo por su número de inventario
def obtener_articulo(num_inventario):
    conn = conectar_bd()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM ARTICULOS WHERE NUM_INVENTARIO = %s;", (num_inventario,))
            articulo = cursor.fetchone()
    except Exception as e:
        flash(f"Error al obtener el artículo: {str(e)}", 'error')
        articulo = None
    finally:
        conn.close()
    return articulo

# Agregar un nuevo artículo a la base de datos
def agregar_articulo(num_inventario, nombre_articulo, fecha_compra, serial_tipo_articulo, marca_titulo_articulo, modelo_editorial_articulo):
    conn = conectar_bd()
    with conn.cursor() as cursor:
        cursor.execute("INSERT INTO ARTICULOS (NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) VALUES (%s, %s, %s, %s, %s, %s)",
                       (num_inventario, nombre_articulo, fecha_compra, serial_tipo_articulo, marca_titulo_articulo, modelo_editorial_articulo))
        conn.commit()
    conn.close()

# Actualizar un artículo en la base de datos
def actualizar_articulo_bd(num_inventario, nombre_articulo, fecha_compra, serial_tipo_articulo, marca_titulo_articulo, modelo_editorial_articulo):
    conn = conectar_bd()
    with conn.cursor() as cursor:
        cursor.execute("UPDATE ARTICULOS SET NOMBRE_ARTICULO = %s, FECHA_COMPRA = %s, SERIAL_NUMTIPO_ARTICULO = %s, MARCA_TITULO_ARTICULO = %s, MODELO_EDITORIAL_ARTICULO = %s WHERE NUM_INVENTARIO = %s;",
                       (nombre_articulo, fecha_compra, serial_tipo_articulo, marca_titulo_articulo, modelo_editorial_articulo, num_inventario))
        conn.commit()
        flash('Artículo actualizado correctamente', 'success')
    conn.close()

# Eliminar un artículo de la base de datos
def eliminar_articulo_bd(num_inventario):
    conn = conectar_bd()
    try:
        with conn.cursor() as cursor:
            cursor.execute("DELETE FROM ARTICULOS WHERE NUM_INVENTARIO = %s;", (num_inventario,))
            conn.commit()
        flash('Artículo eliminado correctamente', 'success')
    except psycopg2.IntegrityError:
        conn.rollback()
        flash('No se puede eliminar el artículo porque está relacionado con préstamos', 'error')
    finally:
        conn.close()

# Ruta para mostrar la lista de artículos
@app.route('/')
def mostrar_articulos():
    articulos = obtener_articulos()
    return render_template('lista_articulos.html', articulos=articulos)

# Ruta para mostrar el formulario de creación de artículos
@app.route('/nuevo_articulo', methods=['GET', 'POST'])
def nuevo_articulo():
    if request.method == 'POST':
        num_inventario = request.form['num_inventario']
        nombre_articulo = request.form['nombre_articulo']
        fecha_compra = request.form['fecha_compra']
        serial_tipo_articulo = request.form['serial_tipo_articulo']
        marca_titulo_articulo = request.form['marca_titulo_articulo']
        modelo_editorial_articulo = request.form['modelo_editorial_articulo']
        
        agregar_articulo(num_inventario, nombre_articulo, fecha_compra, serial_tipo_articulo, marca_titulo_articulo, modelo_editorial_articulo)
        return redirect(url_for('mostrar_articulos'))
    return render_template('formulario_articulo.html')

# Ruta para mostrar el formulario de edición de un artículo
@app.route('/editar_articulo/<int:num_inventario>', methods=['GET', 'POST'])
def editar_articulo(num_inventario):
    if request.method == 'POST':
        nombre_articulo = request.form['nombre_articulo']
        fecha_compra = request.form['fecha_compra']
        serial_tipo_articulo = request.form['serial_tipo_articulo']
        marca_titulo_articulo = request.form['marca_titulo_articulo']
        modelo_editorial_articulo = request.form['modelo_editorial_articulo']

        actualizar_articulo_bd(num_inventario, nombre_articulo, fecha_compra, serial_tipo_articulo, marca_titulo_articulo, modelo_editorial_articulo)
        return redirect(url_for('consultar_articulos'))

    articulo = obtener_articulo(num_inventario)
    return render_template('formulario_editar_articulo.html', articulo=articulo)

# Ruta para manejar la eliminación de un artículo
@app.route('/eliminar_articulo/<int:num_inventario>', methods=['GET', 'POST'])
def eliminar_articulo(num_inventario):
    if request.method == 'POST':
        eliminar_articulo_bd(num_inventario)
        return redirect(url_for('consultar_articulos'))
    
    articulo = obtener_articulo(num_inventario)
    return render_template('confirmacion_eliminar_articulo.html', articulo=articulo)

if __name__ == '__main__':
    app.run(debug=True)


#Validaciones
def es_fecha_valida(fecha_str):
    try:
        datetime.strptime(fecha_str, '%Y-%m-%d')
        return True
    except ValueError:
        return False

# Validador de longitud de cadena
def es_longitud_valida(cadena, longitud_maxima):
    return len(cadena) <= longitud_maxima

def es_numero_valido(numero_str):
    return numero_str.isdigit()  # Devolverá True si la cadena contiene solo dígitos, de lo contrario False


