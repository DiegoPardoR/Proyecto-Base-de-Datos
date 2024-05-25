

-- Creación de la tabla USUARIO para almacenar información de los usuarios
create table USUARIO(
ID_USUARIO int primary key,
TIPO_USUARIO varchar (40),
P_NOMBRE varchar (40),
S_NOMBRE varchar (40),
P_APELLIDO varchar (40),
S_APELLIDO varchar (40),
FECHA_NACIMIENTO date,
TELEFONO varchar(40),
DIRECCION varchar (45),
PAPEL_UNIVERSIDAD varchar (40),
PROYECTO_CURRICULAR varchar (40),
EDAD int,
CORREO_INSTITUCIONAL varchar (40),
CORREO_PERSONAL varchar (40),
NACIONALIDAD varchar (40),
FECHA_VINCULACION date
);
-- Creación de la tabla ARTICULOS para almacenar información de los artículos
create table ARTICULOS(
NUM_INVENTARIO int primary key,
NOMBRE_ARTICULO varchar(40),
FECHA_COMPRA date,
SERIAL_NUMTIPO_ARTICULO varchar(40),
MARCA_TITULO_ARTICULO varchar (40),
MODELO_EDITORIAL_ARTICULO varchar (40)
);
-- Creación de la tabla PRESTAMOS para almacenar información de los préstamos

create table PRESTAMOS(
ID_PRESTAMOS int primary key,
ARTICULO_PRESTADO varchar (40),
DURACION varchar (40),
ESTADO_ARTICULO varchar (40),
FECHA_INICIO date,
FECHA_VENCIMIENTO date
);
-- Creación de la tabla MULTAS para almacenar información de las multas

create table MULTAS(
ID_MULTA int primary key,
ARTICULO_NO_DEVUELTO varchar (40),
FECHA_MULTA date,
MONTO_DEBIDO_USUARIO decimal(10,2)
);


--alter table para sus recpectivas llaves
alter table PRESTAMOS add column ID_USUARIO int;
alter table PRESTAMOS add constraint fk_PRESTAMOS_USUARIO
foreign key (ID_USUARIO) references USUARIO (ID_USUARIO);
alter table PRESTAMOS add column ID_MULTA int;
alter table PRESTAMOS add constraint fk_PRESTAMOS_MULTAS
foreign key (ID_MULTA) references MULTAS (ID_MULTA);
alter table PRESTAMOS add column NUM_INVENTARIO int;
alter table PRESTAMOS add constraint
fk_PRESTAMOS_ARTICULOS foreign key (NUM_INVENTARIO)
references ARTICULOS (NUM_INVENTARIO);
alter table MULTAS add column ID_USUARIO int;
alter table MULTAS add constraint fk_MULTAS_USUARIO foreign key
(ID_USUARIO) references USUARIO (ID_USUARIO);


--Realziar los respectivos Insert Into
--Tabla Usuario
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(1,'Estudiante','Daniel','Alejandro','Presiga','Presiga','2003/07/11',3193920139,'Cra 8a 14-27 sur','Estudiar','Ingenieria deSistemas',20,'dapresiga@ud.edu.co','pda6@gmail.com','Colombiano','2022/01/20');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(2,'Estudiante','Daniela','Carolina','Restrepo','Perez','2002/12/12',3193920138,'Cra 9a 15-27 sur','Estudiar','IngenieriaElectrica',21,'daperez@ud.edu.co','daco8@gmail.com','Colombiana','2021/01/20');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(3,'Profesor','Carlos','Jose','Perez','Castro','1978/09/11',3103920136,'Calle 9 26-27 sur','Enseñar','Ingenieria deSistemas',45,'cajopc@ud.edu.co','cajo78@gmail.com','Colombiano','2014/08/20');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(4,'Estudiante','Nicolas','Alejandro','Perez','Osso','2003/12/27',3136392013,'Cra 8a Bis 14-27 sur','Estudiar','IngenieriaIndustrial',20,'niapo@ud.edu.co','elnico6@gmail.com','Colombiano','2022/01/20');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(5,'Profesor','Arturo','Felipe','Orozco','Zapata','1980/02/27',3105920135,'Calle 57 34-29','Enseñar','IngenieriaIndustrial',44,'aforza@ud.edu.co','profearturo9@gmail.com','Colombiano','2018/01/20');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(6, 'Estudiante','Laura', NULL,'Gómez','Martínez','2004/08/25',3112345678,'Cra 10 20-30 sur','Estudiar','Ingeniería Civil',18,'laurag@ud.edu.co','lauragomez@gmail.com','Colombiana','2023/02/15');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(7,'Profesor','Ana','Maria','Lopez','Hernández','1975/05/12',3109876543,'Calle 5 15-25','Enseñar','Matemáticas',47,'anal@ud.edu.co','analopez@gmail.com','Colombiana','2010/04/10');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(8, 'Estudiante','Juan',NULL,'García','Martínez','2003/11/07',3101234567,'Cra 15 25-35 sur','Estudiar','Administración de Empresas',19,'juang@ud.edu.co','juangarcia@gmail.com','Colombiano','2023/03/20');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(9, 'Estudiante', 'María', 'José', 'Rodríguez', 'Gómez', '2004/02/15', 3112345678, 'Calle 20 30-40 sur', 'Estudiar', 'Psicología', 18, 'mariaj@ud.edu.co', 'mariajose@gmail.com', 'Colombiana', '2023/04/15');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(10, 'Profesor', 'Luis', 'Alberto', 'Herrera', 'Pérez', '1982/08/20', 3123456789, 'Cra 25 35-45 sur', 'Enseñar', 'Química', 42, 'luisha@ud.edu.co', 'luisherrera@gmail.com', 'Colombiano', '2016/05/10');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(11, 'Estudiante', 'Camilo', 'Andrés', 'Mendoza', 'Gómez', '2003/04/10', 3134567890, 'Calle 30 40-50 sur', 'Estudiar', 'Derecho', 20, 'camiloa@ud.edu.co', 'camiloandres@gmail.com', 'Colombiano', '2022/08/10');
INSERT INTO USUARIO
(ID_USUARIO,TIPO_USUARIO,P_NOMBRE,S_NOMBRE,P_APELLIDO,S_APELLIDO,FECHA_NACIMIENTO,TELEFONO,DIRECCION,PAPEL_UNIVERSIDAD,PROYECTO_CURRICULAR,EDAD,CORREO_INSTITUCIONAL,CORREO_PERSONAL,NACIONALIDAD,FECHA_VINCULACION) values
(12, 'Profesor', 'Patricia', 'Isabel', 'Ramírez', 'Rojas', '1979/07/25', 3145678901, 'Cra 35 45-55 sur', 'Enseñar', 'Literatura', 45, 'patricia@ud.edu.co', 'patriciar@gmail.com', 'Colombiana', '2013/09/20');


--Tabla Articulos
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(132,'Computador','2020/05/27','PFK5ED','HP','HP Spectre');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(22,'Tablet','2019/02/15','FDJ27GP','Samsung','Samsung Galaxy Flip');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(154,'Libro','2020/08/27','DPN54J','Fisica2','Editorial Peru');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(157,'Computador','2022/11/20','PKJDF5GP','Lenovo','LenovoPavilion');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(55,'Tablet','2022/04/13','FDGHUP7D','Apple','Ipad Pro');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(233, 'Proyector', '2021/10/18', 'ABC123', 'Sony', 'Sony XYZ');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(324, 'Impresora', '2023/03/08', 'XYZ789', 'Epson', 'Epson ABC');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(435, 'Monitor', '2022/06/15', 'MON678', 'LG', 'LG UltraGear');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(546, 'Teléfono', '2023/08/20', 'TEL901', 'Xiaomi', 'Xiaomi Redmi Note');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(657, 'Cámara', '2024/01/10', 'CAM234', 'Canon', 'Canon EOS Rebel');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(768, 'Teclado', '2023/04/05', 'TEC567', 'Logitech', 'Logitech G Pro');
INSERT INTO ARTICULOS 
(NUM_INVENTARIO, NOMBRE_ARTICULO, FECHA_COMPRA, SERIAL_NUMTIPO_ARTICULO, MARCA_TITULO_ARTICULO, MODELO_EDITORIAL_ARTICULO) values
(879, 'Silla', '2023/12/30', 'SIL012', 'Herman Miller', 'Herman Miller Aeron');


--Tabla multas
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(1,'Computador','2024/02/27',10000,1);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(2,'Libro','2024/03/5',1000,2);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(3,'Tablet','2024/03/4',10000,3);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(4,'Tablet','2024/02/15',10000,4);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(5,'Computador','2024/02/10',10000,5);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(6, 'Proyector', '2024/04/25', 5000, 6);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(7, 'Impresora', '2024/04/29', 8000, 7);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(8, 'Monitor', '2024/05/04', 2000, 8);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(9, 'Teléfono', '2024/05/12', 3000, 9);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(10, 'Cámara', '2024/05/08', 1500, 10);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(11, 'Teclado', '2024/05/11', 1800, 11);
INSERT INTO MULTAS
(ID_MULTA,ARTICULO_NO_DEVUELTO,FECHA_MULTA,MONTO_DEBIDO_USUARIO,ID_USUARIO) values
(12, 'Silla', '2024/05/20', 2500, 12);


--Tabla prestamos
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(1,'Computador','2dias','Perfecto','2024/03/12','2024/03/14',1,1,132);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(2,'Computador','1 mes','Falla Pila ypantalla rayada','2024/02/12','2024/03/14',2,2,22);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(3,'Tablet','15 dias','FallaPantalla','2024/03/11','2024/03/26',3,3,154);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(4,'Libro','10 dias','SinPortada','2024/01/30','2024/02/9',4,4,157);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(5,'Tablet','5dias','Perfecto','2024/02/10','2024/02/15',5,5,55);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(6, 'Proyector', '5 días', 'Perfecto', '2024/04/20', '2024/04/25', 6, NULL, 233);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(7, 'Impresora', '7 días', 'Bueno', '2024/04/22', '2024/04/29', 7, NULL, 324);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(8, 'Monitor', '3 días', 'Bueno', '2024/05/01', '2024/05/04', 8, NULL, 435);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(9, 'Teléfono', '10 días', 'Perfecto', '2024/05/02', '2024/05/12', 9, NULL, 546);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(10, 'Cámara', '5 días', 'Bueno', '2024/05/03', '2024/05/08', 10, NULL, 657);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(11, 'Teclado', '7 días', 'Bueno', '2024/05/04', '2024/05/11', 11, NULL, 768);
INSERT INTO PRESTAMOS 
(ID_PRESTAMOS, ARTICULO_PRESTADO, DURACION, ESTADO_ARTICULO, FECHA_INICIO, FECHA_VENCIMIENTO, ID_USUARIO, ID_MULTA, NUM_INVENTARIO) values
(12, 'Silla', '15 días', 'Perfecto', '2024/05/05', '2024/05/20', 12, NULL, 879);