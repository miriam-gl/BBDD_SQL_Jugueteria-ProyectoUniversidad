/*
Funciones
*/

-- a) Devuelva un valor.

CREATE OR REPLACE FUNCTION obtener_nombre_cliente(id INT) 
RETURNS VARCHAR(150)
AS
$$
DECLARE
    nombre_completo VARCHAR(150);
BEGIN
    SELECT CONCAT(nombre_cliente, ' ', ap_pat_cliente, ' ', ap_mat_cliente)
    INTO nombre_completo
    FROM cliente
    WHERE id_cliente = id;
    
    RETURN nombre_completo;
END;
$$
LANGUAGE plpgsql;

-- b) Devuelva una tabla
-- Una función que devuelve todas las compras realizadas por un cliente específico.

CREATE OR REPLACE FUNCTION obtener_compras_cliente(id INT)
RETURNS TABLE (
    folio_cliente INT,
    id_vendedor INT,
    pago_total_cliente MONEY,
    fecha_orden_cliente DATE
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT cc.folio_cliente, cc.id_vendedor, cc.pago_total_cliente, cc.fecha_orden_cliente
    FROM compra_cliente cc
    WHERE cc.id_cliente = id;
END;
$$
LANGUAGE plpgsql;

-- c) Que realice acciones en su BD (inserción, actualización y borrado).

-- Inserción
-- Función que realiza la inserción de nuevos clientes.

CREATE OR REPLACE FUNCTION SP_Insert_nuevos_cliente(
    nombre_nuevo_cliente VARCHAR(50), 
    ap_pat_nuevo_cliente VARCHAR(50), 
    ap_mat_nuevo_cliente VARCHAR(50), 
    tel_nuevo_cliente NUMERIC(10,0)
)
RETURNS VARCHAR(25)
AS
$$
DECLARE 
    id_cliente_calculado INTEGER;
    estatus_insercion VARCHAR(25);
BEGIN
    IF ((SELECT COUNT(*) 
         FROM cliente c
         WHERE c.nombre_cliente = nombre_nuevo_cliente 
           AND c.ap_pat_cliente = ap_pat_nuevo_cliente 
           AND c.ap_mat_cliente = ap_mat_nuevo_cliente) = 0) 
    THEN
        id_cliente_calculado = COALESCE((SELECT MAX(id_cliente) FROM cliente), 0) + 1;

        INSERT INTO cliente (id_cliente, nombre_cliente, ap_pat_cliente, ap_mat_cliente, tel_cliente) 
        VALUES (id_cliente_calculado, nombre_nuevo_cliente, ap_pat_nuevo_cliente, ap_mat_nuevo_cliente, tel_nuevo_cliente);
        
        estatus_insercion = 'Insercion_Exitosa';
    ELSE
        estatus_insercion = 'El_cliente_ya_existe';
    END IF;

    RETURN estatus_insercion;
END;
$$
LANGUAGE plpgsql;

-- Actualización

CREATE FUNCTION actualizar_telefono_cliente(id INT, nuevo_telefono BIGINT)
RETURNS VOID
AS
$$
BEGIN
    UPDATE cliente
    SET tel_cliente = nuevo_telefono
    WHERE id_cliente = id;
END;
$$
LANGUAGE plpgsql;

-- Borrado

CREATE FUNCTION eliminar_cliente(id INT)
RETURNS VOID
AS
$$
BEGIN
    DELETE FROM cliente
    WHERE id_cliente = id;
END;
$$
LANGUAGE plpgsql;

