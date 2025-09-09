/*
Consultas
*/

-- a) Básica (solo incluye una tabla)

-- Obtener los clientes cuyo apellido paterno comience con M.
SELECT * from cliente WHERE ap_pat_cliente LIKE 'M%';

-- b) Subconsulta (al menos 3 niveles)

-- Obtener al cliente que ha realizado la compra más cara.
SELECT CONCAT(nombre_cliente, ' ', ap_pat_cliente, ' ', ap_mat_cliente) AS nombre_cliente
FROM cliente
WHERE id_cliente IN (
    SELECT id_cliente
    FROM compra_cliente
    WHERE pago_total_cliente = (
        SELECT MAX(pago_total_cliente)
        FROM compra_cliente
    )
);

-- c) CTE’s (debe resolver lo mismo que la subconsulta del punto b)

-- Obtener al cliente que ha realizado la compra más cara.
WITH MaxPago AS (
    SELECT MAX(pago_total_cliente) AS max_pago
    FROM compra_cliente
),
ClienteMaxPago AS (
    SELECT id_cliente
    FROM compra_cliente
    WHERE pago_total_cliente = (SELECT max_pago FROM MaxPago)
)
SELECT CONCAT(nombre_cliente, ' ', ap_pat_cliente, ' ', ap_mat_cliente) AS nombre_cliente
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM ClienteMaxPago);

-- d) Compuesta (3 tablas al menos deben estar involucradas en un JOIN).

-- Obtener el nombre de los clientes y los detalles de sus compras, incluyendo los precios de los juguetes
SELECT c.nombre_cliente, 
c.ap_pat_cliente,
c.ap_mat_cliente, 
dcc.cantidad_cliente, 
j.precio_juguete
FROM cliente c
JOIN compra_cliente cc ON c.id_cliente = cc.id_cliente
JOIN detalle_compra_cliente dcc ON cc.folio_cliente = dcc.folio_cliente
JOIN juguete j ON dcc.id_juguete = j.id_juguete;

-- e) Paginación.

-- Mostrar los precios de los 5 juguetes más caros vendidos:
SELECT j.id_juguete, j.precio_juguete AS "Precio"
FROM juguete j
INNER JOIN detalle_compra_cliente
ON j.id_juguete=detalle_compra_cliente.id_juguete
ORDER BY precio_juguete DESC LIMIT 5;

-- f) CROSSTAB

/* En caso de ser necesario, ejecute el comando:

CREATE EXTENSION tablefunc;

para poder utilizar la función crosstab
*/

-- Mostrar las ganancias de los vendedores con ID del 1 al 5 por fecha.
SELECT *
FROM CROSSTAB('SELECT fecha_orden_cliente,id_vendedor,pago_total_cliente
	FROM compra_cliente
	ORDER BY 1,2',
	'SELECT DISTINCT id_vendedor 
	FROM compra_cliente
	ORDER BY 1')
AS ganancia_vendedores
("Fecha" DATE, "Sofía" MONEY, "Juan Carlos" MONEY, "Ana" MONEY, "Sócrates" MONEY, "Juana_Carla" MONEY);

-- g) Función de ventana

-- Obtener a los 100 clientes que, en promedio, gastan más en la juguetería.
SELECT
    CONCAT(c.nombre_cliente, ' ', c.ap_pat_cliente, ' ', c.ap_mat_cliente) AS nombre_cliente,
    AVG(cc.pago_total_cliente::NUMERIC) OVER (PARTITION BY cc.id_cliente) AS promedio_venta_por_cliente
FROM compra_cliente cc
JOIN cliente c ON c.id_cliente = cc.id_cliente
ORDER BY promedio_venta_por_cliente DESC LIMIT 100;







