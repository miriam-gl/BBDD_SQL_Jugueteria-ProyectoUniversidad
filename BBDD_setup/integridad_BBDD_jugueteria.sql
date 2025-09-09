
/*
INTEGRIDAD AL ESQUEMA DE LA BASE DE DATOS
*/

/*
Integridad de Entidad:
Se agrega una llave primaria a cada una de las tablas construidas.
*/

ALTER TABLE cliente
ADD CONSTRAINT PK_cliente PRIMARY KEY (id_cliente);

ALTER TABLE empleado
ADD CONSTRAINT PK_empleado PRIMARY KEY (id_empleado);

ALTER TABLE compra_cliente
ADD CONSTRAINT PK_compra_cliente PRIMARY KEY (folio_cliente);

ALTER TABLE detalle_compra_cliente
ADD CONSTRAINT PK_detalle_compra_cliente PRIMARY KEY (folio_cliente, id_juguete);

ALTER TABLE vendedor
ADD CONSTRAINT PK_vendedor PRIMARY KEY (id_vendedor);

ALTER TABLE supervisor
ADD CONSTRAINT PK_supervisor PRIMARY KEY (id_supervisor);

ALTER TABLE compra_proveedor
ADD CONSTRAINT PK_compra_proveedor PRIMARY KEY (folio_proveedor);

ALTER TABLE detalle_compra_proveedor
ADD CONSTRAINT PK_detalle_compra_proveedor PRIMARY KEY (folio_proveedor, id_juguete);

ALTER TABLE proveedor
ADD CONSTRAINT PK_proveedor PRIMARY KEY (id_proveedor);

ALTER TABLE direccion_proveedor
ADD CONSTRAINT PK_direccion_proveedor PRIMARY KEY (id_proveedor);

ALTER TABLE envio_proveedor
ADD CONSTRAINT PK_envio_proveedor PRIMARY KEY (id_envio);

ALTER TABLE almacenista
ADD CONSTRAINT PK_almacenista PRIMARY KEY (id_almacenista);

ALTER TABLE local_jugueteria
ADD CONSTRAINT PK_local_jugueteria PRIMARY KEY (id_jugueteria);

ALTER TABLE dir_local
ADD CONSTRAINT PK_dir_local PRIMARY KEY (id_jugueteria);

ALTER TABLE juguete
ADD CONSTRAINT PK_juguete PRIMARY KEY (id_juguete);

ALTER TABLE afectividad
ADD CONSTRAINT PK_afectividad PRIMARY KEY (id_juguete);

ALTER TABLE motricidad_global
ADD CONSTRAINT PK_motricidad_global PRIMARY KEY (id_juguete);

ALTER TABLE motricidad_fina
ADD CONSTRAINT PK_motricidad_fina PRIMARY KEY (id_juguete);

ALTER TABLE inteligencia
ADD CONSTRAINT PK_inteligencia PRIMARY KEY (id_juguete);

ALTER TABLE sociabilidad
ADD CONSTRAINT PK_sociabilidad PRIMARY KEY (id_juguete);

/*
Integridad Referencial:
Se agregan las llaves foráneas correspondientes, de acuerdo al diagrama de clases realizado.
*/

ALTER TABLE vendedor
ADD CONSTRAINT FK_empleado__vendedor FOREIGN KEY (id_empleado)REFERENCES empleado(id_empleado)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE supervisor
ADD CONSTRAINT FK_empleado__supervisor FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE almacenista
ADD CONSTRAINT FK_empleado__almacenista FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE compra_cliente
ADD CONSTRAINT FK_compra_cliente__cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE compra_cliente
ADD CONSTRAINT FK_compra_cliente__vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE detalle_compra_cliente
ADD CONSTRAINT FK_detalle_compra_cliente__compra_cliente FOREIGN KEY(folio_cliente) REFERENCES compra_cliente(folio_cliente)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE detalle_compra_cliente
ADD CONSTRAINT FK_detalle_compra_cliente__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE compra_proveedor
ADD CONSTRAINT FK_compra_proveedor__proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE detalle_compra_proveedor
ADD CONSTRAINT FK_detalles_compra_proveedor__compra_proveedor FOREIGN KEY (folio_proveedor) REFERENCES compra_proveedor(folio_proveedor)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE detalle_compra_proveedor
ADD CONSTRAINT FK_detalles_compra_proveedor__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE direccion_proveedor
ADD CONSTRAINT FK_direccion_proveedor__proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE envio_proveedor
ADD CONSTRAINT FK_envio_proveedor__local_jugueteria FOREIGN KEY (id_jugueteria) REFERENCES local_jugueteria(id_jugueteria)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE envio_proveedor
ADD CONSTRAINT FK_envio_proveedor__compra_proveedor FOREIGN KEY (folio_proveedor) REFERENCES compra_proveedor(folio_proveedor)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dir_local
ADD CONSTRAINT FK_dir_local__local_jugueteria FOREIGN KEY (id_jugueteria) REFERENCES local_jugueteria(id_jugueteria)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE afectividad
ADD CONSTRAINT FK_afectividad__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE motricidad_global
ADD CONSTRAINT FK_motricidad_global__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE motricidad_fina
ADD CONSTRAINT FK_motricidad_fina__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE inteligencia
ADD CONSTRAINT FK_inteligencia__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE sociabilidad
ADD CONSTRAINT FK_sociabilidad__juguete FOREIGN KEY (id_juguete) REFERENCES juguete(id_juguete)
ON DELETE CASCADE ON UPDATE CASCADE;

/*
Integridad de dominio:
Se agregan los comandos CHECK correspondientes, delimitando el dominio de algunos atributos.
*/

-- Tabla cliente
ALTER TABLE cliente
ADD CHECK(tel_cliente >= 1000000000 AND tel_cliente <= 9999999999);

-- Tabla compra_cliente
ALTER TABLE compra_cliente
ADD CHECK(pago_total_cliente > 0::MONEY);

-- Tabla detalle_compra_cliente
ALTER TABLE detalle_compra_cliente
ADD CHECK(cantidad_cliente > 0);

-- Tabla proveedor
ALTER TABLE proveedor
ADD CHECK(tel_proveedor >= 1000000000 AND tel_proveedor <= 9999999999);

-- Tabla compra_proveedor
ALTER TABLE compra_proveedor
ADD CHECK(pago_total_proveedor > 0::MONEY);

-- Tabla detalle_compra_proveedor
ALTER TABLE detalle_compra_proveedor
ADD CHECK(cantidad_proveedor > 0);

-- Tabla local_jugueteria
ALTER TABLE local_jugueteria
ADD CHECK(tel_local >= 1000000000 AND tel_local <= 9999999999);

-- Tabla juguete
ALTER TABLE juguete
ADD CHECK(precio_juguete > 0::MONEY);

/*
 Integridad de No Nulidad:
Determinar qué atributos no deben tener valores nulos.
*/

-- Tabla Cliente
ALTER TABLE cliente
ALTER COLUMN id_cliente SET NOT NULL;

ALTER TABLE cliente
ALTER COLUMN nombre_cliente SET NOT NULL;

ALTER TABLE cliente
ALTER COLUMN ap_pat_cliente SET NOT NULL;

ALTER TABLE cliente
ALTER COLUMN ap_mat_cliente SET NOT NULL;

-- Tabla compra_cliente
ALTER TABLE compra_cliente
ALTER COLUMN folio_cliente SET NOT NULL;

ALTER TABLE compra_cliente
ALTER COLUMN id_cliente SET NOT NULL;

ALTER TABLE compra_cliente
ALTER COLUMN id_vendedor SET NOT NULL;

ALTER TABLE compra_cliente
ALTER COLUMN pago_total_cliente SET NOT NULL;

ALTER TABLE compra_cliente
ALTER COLUMN fecha_orden_cliente SET NOT NULL;

-- Tabla empleado
ALTER TABLE empleado
ALTER COLUMN id_empleado SET NOT NULL;

ALTER TABLE empleado
ALTER COLUMN nombre_empleado SET NOT NULL;

-- Tabla detalle_compra_cliente
ALTER TABLE detalle_compra_cliente
ALTER COLUMN cantidad_cliente SET NOT NULL;

ALTER TABLE detalle_compra_cliente
ALTER COLUMN id_juguete SET NOT NULL;

-- Tabla vendedor
ALTER TABLE vendedor
ALTER COLUMN id_vendedor SET NOT NULL;

ALTER TABLE vendedor
ALTER COLUMN id_empleado SET NOT NULL;

ALTER TABLE vendedor
ALTER COLUMN nombre_vendedor SET NOT NULL;

ALTER TABLE vendedor
ALTER COLUMN salario_vendedor SET NOT NULL;

ALTER TABLE vendedor
ALTER COLUMN ap_pat_vendedor SET NOT NULL;

ALTER TABLE vendedor
ALTER COLUMN ap_mat_vendedor SET NOT NULL;

-- Tabla supervisor
ALTER TABLE supervisor
ALTER COLUMN id_supervisor SET NOT NULL;

ALTER TABLE supervisor
ALTER COLUMN id_empleado SET NOT NULL;

ALTER TABLE supervisor
ALTER COLUMN nombre_supervisor SET NOT NULL;

ALTER TABLE supervisor
ALTER COLUMN ap_pat_supervisor SET NOT NULL;

ALTER TABLE supervisor
ALTER COLUMN ap_mat_supervisor SET NOT NULL;

-- Tabla compra_proveedor
ALTER TABLE compra_proveedor
ALTER COLUMN folio_proveedor SET NOT NULL;

ALTER TABLE compra_proveedor
ALTER COLUMN pago_total_proveedor SET NOT NULL;

ALTER TABLE compra_proveedor
ALTER COLUMN fecha_orden_proveedor SET NOT NULL;

ALTER TABLE compra_proveedor
ALTER COLUMN id_proveedor SET NOT NULL;

-- Tabla detalle_compra_proveedor
ALTER TABLE detalle_compra_proveedor
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE detalle_compra_proveedor
ALTER COLUMN costo_unitario_proveedor SET NOT NULL;

ALTER TABLE detalle_compra_proveedor
ALTER COLUMN cantidad_proveedor SET NOT NULL;

-- Tabla proveedor
ALTER TABLE proveedor
ALTER COLUMN id_proveedor SET NOT NULL;

ALTER TABLE proveedor
ALTER COLUMN nombre_proveedor SET NOT NULL;

ALTER TABLE proveedor
ALTER COLUMN tel_proveedor SET NOT NULL;

--Tabla direccion_proveedor
ALTER TABLE direccion_proveedor
ALTER COLUMN id_proveedor SET NOT NULL;

ALTER TABLE direccion_proveedor
ALTER COLUMN calle_proveedor SET NOT NULL;

ALTER TABLE direccion_proveedor
ALTER COLUMN colonia_proveedor SET NOT NULL;

ALTER TABLE direccion_proveedor
ALTER COLUMN delegacion_proveedor SET NOT NULL;

ALTER TABLE direccion_proveedor
ALTER COLUMN num_ext_proveedor SET NOT NULL;

--Tabla envio_proveedor
ALTER TABLE envio_proveedor
ALTER COLUMN id_envio SET NOT NULL;

ALTER TABLE envio_proveedor
ALTER COLUMN id_jugueteria SET NOT NULL;

ALTER TABLE envio_proveedor
ALTER COLUMN folio_proveedor SET NOT NULL;

--Tabla almacenista
ALTER TABLE almacenista
ALTER COLUMN id_almacenista SET NOT NULL;

ALTER TABLE almacenista
ALTER COLUMN id_empleado SET NOT NULL;

ALTER TABLE almacenista
ALTER COLUMN salario_almacenista SET NOT NULL;

ALTER TABLE almacenista
ALTER COLUMN nombre_almacenista SET NOT NULL;

ALTER TABLE almacenista
ALTER COLUMN ap_pat_almacenista SET NOT NULL;

ALTER TABLE almacenista
ALTER COLUMN ap_mat_almacenista SET NOT NULL;


--Tabla local_jugueteria
ALTER TABLE local_jugueteria
ALTER COLUMN id_jugueteria SET NOT NULL;

ALTER TABLE local_jugueteria
ALTER COLUMN tel_local SET NOT NULL;

--Tabla dir_local
ALTER TABLE dir_local
ALTER COLUMN id_jugueteria SET NOT NULL;

ALTER TABLE dir_local
ALTER COLUMN calle_jugueteria SET NOT NULL;

ALTER TABLE dir_local
ALTER COLUMN colonia_jugueteria SET NOT NULL;

ALTER TABLE dir_local
ALTER COLUMN delegacion_jugueteria SET NOT NULL;

ALTER TABLE dir_local
ALTER COLUMN num_ext_jugueteria SET NOT NULL;

--Tabla juguete
ALTER TABLE juguete
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE juguete
ALTER COLUMN precio_juguete SET NOT NULL;

--Tabla afectividad
ALTER TABLE afectividad
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE afectividad
ALTER COLUMN nombre_af SET NOT NULL;

ALTER TABLE afectividad
ALTER COLUMN marca_af SET NOT NULL;

--Tabla motricidad_global
ALTER TABLE motricidad_global
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE motricidad_global
ALTER COLUMN nombre_global SET NOT NULL;

ALTER TABLE motricidad_global
ALTER COLUMN marca_global SET NOT NULL;

--Tabla motricidad_fina
ALTER TABLE motricidad_fina 
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE motricidad_fina
ALTER COLUMN nombre_fina SET NOT NULL;

ALTER TABLE motricidad_fina
ALTER COLUMN marca_fina SET NOT NULL;

--Tabla inteligencia
ALTER TABLE inteligencia
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE inteligencia
ALTER COLUMN nombre_int SET NOT NULL;

ALTER TABLE inteligencia
ALTER COLUMN marca_int SET NOT NULL;

--Tabla sociabilidad
ALTER TABLE sociabilidad
ALTER COLUMN id_juguete SET NOT NULL;

ALTER TABLE sociabilidad
ALTER COLUMN nombre_social SET NOT NULL;

ALTER TABLE sociabilidad
ALTER COLUMN marca_social SET NOT NULL;
