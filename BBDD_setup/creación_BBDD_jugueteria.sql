
/*
CREACIÓN DE LA BASE DE DATOS
*/

-- Para asegurarse de que no haya errores en la base de datos que trabajaremos, es necesario eliminar la base de datos en caso de que exista, ejecutando el comando:

-- DROP DATABASE IF EXISTS jugueteria;

-- En caso de que no lo permita, dar click derecho en la base de datos 'jugueteria' y presionar 'Delete (Force)'.

-- Ahora creamos la base de datos llamada ‘jugueteria’. El siguiente comando se debe ejecutar antes de todos los demás:

-- CREATE DATABASE jugueteria;

-- Una vez ejecutado el comando anterior, es necesario conectarse a la base de datos ‘jugueteria’ que acaba de ser creada. 
-- Dentro de la ventana de Query de la base de datos ‘jugueteria’, ejecute los comandos de creación de tablas, adición de identidades, e inserción de datos.


/*
	ESQUEMA DE LA BASE DE DATOS
*/

-- Comenzamos a crear las tablas de acuerdo a las clases de nuestro modelo orientado a objetos. Con el propósito de evitar crear tablas duplicadas, utilizamos el comando ‘CREATE TABLE IF NOT EXISTS’.

-- Tabla ‘cliente’, con la información de las personas que compran juguetes.
CREATE TABLE IF NOT EXISTS cliente( 
	id_cliente INT,
        nombre_cliente VARCHAR(50),
        ap_pat_cliente VARCHAR(50),
        ap_mat_cliente VARCHAR(50),
        tel_cliente BIGINT
);

-- Tabla ‘empleado’ con la información de cada empleado.
CREATE TABLE IF NOT EXISTS empleado(
	id_empleado INT,
	nombre_empleado VARCHAR(50)
);

-- Tabla ‘compra_cliente’ con la información de cada compra realizada en la tienda.
CREATE TABLE IF NOT EXISTS compra_cliente(
	folio_cliente INT,
	id_cliente INT,
	id_vendedor INT,
	pago_total_cliente MONEY,
	fecha_orden_cliente DATE
);

-- Tabla ‘detalle_compra_cliente’ con los detalles de cada compra realizada en la tienda.
CREATE TABLE IF NOT EXISTS detalle_compra_cliente(
	folio_cliente INT,
	id_juguete INT,
	cantidad_cliente INT
);
 
 -- Tabla ‘vendedor’, con la información de los vendedores que concretan las ventas.
CREATE TABLE IF NOT EXISTS vendedor(
	id_vendedor INT,
	id_empleado INT,
nombre_vendedor VARCHAR(50),
      salario_vendedor MONEY,
      ap_pat_vendedor VARCHAR(50),
      ap_mat_vendedor VARCHAR(50)
);

-- Tabla ‘supervisor’, con la información del supervisor de la juguetería.
CREATE TABLE IF NOT EXISTS supervisor(
        id_supervisor INT,
  id_empleado INT,
        nombre_supervisor VARCHAR(50),
        ap_pat_supervisor VARCHAR(50),
        ap_mat_supervisor VARCHAR(50),
        salario_supervisor MONEY
);

-- Tabla ‘compra_proveedor’, con la información de las compras de suministros a los proveedores.
CREATE TABLE IF NOT EXISTS compra_proveedor(
        folio_proveedor INT,
        pago_total_proveedor MONEY,
        fecha_orden_proveedor DATE,
        id_proveedor INT
);

-- Tabla ‘detalle_compra_proveedor’, con la información de las compras de suministros a los proveedores.
CREATE TABLE IF NOT EXISTS detalle_compra_proveedor(
	folio_proveedor INT,
	id_juguete INT,
        costo_unitario_proveedor MONEY,
	cantidad_proveedor INT
);

-- Tabla ‘proveedor’, con la información de los proveedores de juguetes a la tienda.
CREATE TABLE IF NOT EXISTS proveedor(
        id_proveedor INT,
        nombre_proveedor VARCHAR(50),
        tel_proveedor BIGINT
);


-- Tabla ‘direccion_proveedor’, con el desglose de la dirección de cada proveedor.
CREATE TABLE IF NOT EXISTS direccion_proveedor(
        id_proveedor INT,
        calle_proveedor VARCHAR(50),
        colonia_proveedor VARCHAR(50),
        delegacion_proveedor VARCHAR(50),
        num_int_proveedor VARCHAR(50),
        num_ext_proveedor VARCHAR(50)
);

-- Tabla 'envio_proveedor', con la información del envío proveniente de los proveedores.
CREATE TABLE IF NOT EXISTS envio_proveedor(
	id_envio INT,
	id_jugueteria INT,
	folio_proveedor INT,
	costo_envio MONEY,
	fecha_envio DATE,
	fecha_entrega DATE
);

-- Tabla ‘almacenista’, con la información del almacenista de la juguetería.
CREATE TABLE IF NOT EXISTS almacenista(
        id_almacenista INT,
	   id_empleado INT,
        salario_almacenista MONEY,
        nombre_almacenista VARCHAR(50),
        ap_pat_almacenista VARCHAR(50),
        ap_mat_almacenista VARCHAR(50)
);

-- Tabla ‘local_jugueteria’, con la información de la sucursal de la juguetería.
CREATE TABLE IF NOT EXISTS local_jugueteria(
	id_jugueteria INT,
	tel_local BIGINT
);

-- Tabla ‘dir_local’, con el desglose de la dirección de la sucursal de la juguetería.
CREATE TABLE IF NOT EXISTS dir_local(
	id_jugueteria INT,
	calle_jugueteria VARCHAR(50),
	colonia_jugueteria VARCHAR(50),
	delegacion_jugueteria VARCHAR(50),
	num_int_jugueteria VARCHAR(50),
	num_ext_jugueteria VARCHAR(50)
);

-- Tabla ‘juguete’, con la información de cada artículo.
CREATE TABLE IF NOT EXISTS juguete(
        id_juguete INT,
        precio_juguete MONEY
);

-- Tabla ‘afectividad’, con la información de la categoría de juguetes de afectividad.
CREATE TABLE IF NOT EXISTS afectividad(
	id_juguete INT,
	nombre_af VARCHAR(50),           	
	marca_af VARCHAR(50),
	rango_edad_af VARCHAR(50)
);

-- Tabla ‘motricidad_global’, con la información de la categoría de juguetes de motricidad global.
CREATE TABLE IF NOT EXISTS motricidad_global(
        id_juguete INT,
        nombre_global VARCHAR(50),
        marca_global VARCHAR(50),
	rango_edad_global VARCHAR(50)
);

-- Tabla ‘motricidad_fina’, con la información de la categoría de juguetes de motricidad fina.
CREATE TABLE IF NOT EXISTS motricidad_fina(
        id_juguete INT,
	nombre_fina VARCHAR(50),
        marca_fina VARCHAR(50),
        rango_edad_fina VARCHAR(50)
);

-- Tabla ‘inteligencia’, con la información de la categoría de juguetes de inteligencia.
CREATE TABLE IF NOT EXISTS inteligencia(
        id_juguete INT,
        nombre_int VARCHAR(50),
        marca_int VARCHAR(50),
        no_jugadores_int INT
);

-- Tabla ‘sociabilidad’, con la información de la categoría de juguetes de sociabilidad.
CREATE TABLE IF NOT EXISTS sociabilidad(
        id_juguete INT,
	nombre_social VARCHAR(50),
        marca_social VARCHAR(50)
);

