#### Listar los productos con stock menor a 5 unidades

SELECT 
    p.id_producto,
    p.codigo,
    p.nombre,
    p.stock,
    p.stock_minimo,
    c.nombre AS categoria
FROM 
    productos p
JOIN 
    categorias c ON p.id_categoria = c.id_categoria
WHERE 
    p.stock < 5
ORDER BY 
    p.stock ASC, c.nombre;


#### Calcular ventas totales de un mes específico

SELECT 
    EXTRACT(YEAR FROM fecha_venta) AS año,
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(total) AS ventas_totales,
    COUNT(*) AS numero_ventas
FROM 
    ventas
WHERE 
    EXTRACT(MONTH FROM fecha_venta) = 2 --Aqui se realiza el cambio para seleccionar el 											mes de busqueda
    AND EXTRACT(YEAR FROM fecha_venta) = 2025
GROUP BY 
    EXTRACT(YEAR FROM fecha_venta),
    EXTRACT(MONTH FROM fecha_venta);
 

#### Obtener el cliente con más compras realizadas

SELECT 
    c.id_cliente,
    c.nombre || ' ' || c.apellido AS cliente,
    COUNT(v.id_venta) AS total_compras,
    SUM(v.total) AS monto_total_gastado
FROM 
    clientes c
JOIN 
    ventas v ON c.id_cliente = v.id_cliente
GROUP BY 
    c.id_cliente, c.nombre, c.apellido
ORDER BY 
    total_compras DESC, monto_total_gastado DESC
LIMIT 1;


#### Listar los 5 productos más vendidos

SELECT 
    p.id_producto,
    p.codigo,
    p.nombre,
    c.nombre AS categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.subtotal) AS ingresos_totales
FROM 
    productos p
JOIN 
    detalle_ventas dv ON p.id_producto = dv.id_producto
JOIN 
    categorias c ON p.id_categoria = c.id_categoria
GROUP BY 
    p.id_producto, p.codigo, p.nombre, c.nombre
ORDER BY 
    unidades_vendidas DESC
LIMIT 5;


#### Consultar ventas realizadas en un rango de fechas (3 días en un mes específico)

SELECT 
    v.id_venta,
    v.fecha_venta,
    c.nombre || ' ' || c.apellido AS cliente,
    mp.nombre AS metodo_pago,
    ev.nombre AS estado,
    v.total,
    COUNT(dv.id_detalle) AS items_comprados
FROM 
    ventas v
JOIN 
    clientes c ON v.id_cliente = c.id_cliente
JOIN 
    metodos_pago mp ON v.id_metodo_pago = mp.id_metodo_pago
JOIN 
    estados_venta ev ON v.id_estado = ev.id_estado
JOIN 
    detalle_ventas dv ON v.id_venta = dv.id_venta
WHERE 
    v.fecha_venta BETWEEN '2025-01-01' AND '2025-04-11' -- se cambian las fechas para 											poder ver las compras deseas de mes especifico
GROUP BY 
    v.id_venta, v.fecha_venta, c.nombre, c.apellido, mp.nombre, ev.nombre, v.total
ORDER BY 
    v.fecha_venta DESC;


#### Identificar clientes que no han comprado en los últimos 6 meses

SELECT 
    c.id_cliente,
    c.nombre || ' ' || c.apellido AS cliente,
    c.email,
    c.telefono,
    MAX(v.fecha_venta) AS ultima_compra,
    CURRENT_DATE - MAX(v.fecha_venta) AS dias_sin_comprar
FROM 
    clientes c
LEFT JOIN 
    ventas v ON c.id_cliente = v.id_cliente
GROUP BY 
    c.id_cliente, c.nombre, c.apellido, c.email, c.telefono
HAVING 
    MAX(v.fecha_venta) < CURRENT_DATE - INTERVAL '6 months'
    OR MAX(v.fecha_venta) IS NULL
ORDER BY 
    ultima_compra ASC NULLS FIRST;
