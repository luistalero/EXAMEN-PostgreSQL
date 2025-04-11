CREATE OR REPLACE FUNCTION cliente_existe(p_id_cliente INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente);
END;
$$;

CREATE OR REPLACE FUNCTION verificar_stock_minimo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stock <= NEW.stock_minimo THEN
        INSERT INTO alertas_stock (id_producto, stock_actual, stock_minimo, fecha_alerta)
        VALUES (NEW.id_producto, NEW.stock, NEW.stock_minimo, CURRENT_TIMESTAMP);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_stock_minimo
AFTER UPDATE OF stock ON productos
FOR EACH ROW
EXECUTE FUNCTION verificar_stock_minimo();

CREATE OR REPLACE FUNCTION metodo_pago_existe(p_id_metodo_pago INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM metodos_pago WHERE id_metodo_pago = p_id_metodo_pago);
END;
$$;

SELECT metodo_pago_existe(2);

CREATE OR REPLACE FUNCTION obtener_nombre_cliente(p_id_cliente INTEGER)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    v_nombre TEXT;
BEGIN
    SELECT CONCAT(nombre, ' ', apellido) INTO v_nombre
    FROM clientes
    WHERE id_cliente = p_id_cliente;
    
    RETURN v_nombre;
EXCEPTION WHEN OTHERS THEN
    RETURN NULL;
END;
$$;

SELECT obtener_nombre_cliente(2);


CREATE OR REPLACE PROCEDURE registrar_venta(
    p_id_cliente INTEGER,
    p_id_metodo_pago INTEGER,
    p_detalles JSON
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_id_venta INTEGER;
    v_total DECIMAL(12, 2) = 0;
    v_detalle JSON;
    v_id_producto INTEGER;
    v_cantidad INTEGER;
    v_precio_unitario DECIMAL(10, 2);
    v_subtotal DECIMAL(10, 2);
    v_stock_actual INTEGER;
    v_cliente_existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente) INTO v_cliente_existe;
    IF NOT v_cliente_existe THEN
        RAISE EXCEPTION 'El cliente con ID % no existe', p_id_cliente;
    END IF;
    
    FOR v_detalle IN SELECT * FROM json_array_elements(p_detalles)
    LOOP
        v_id_producto = (v_detalle->>'id_producto')::INTEGER;
        v_cantidad = (v_detalle->>'cantidad')::INTEGER;

        IF NOT EXISTS (SELECT 1 FROM productos WHERE id_producto = v_id_producto) THEN
            RAISE EXCEPTION 'El producto con ID % no existe', v_id_producto;
        END IF;

        SELECT stock INTO v_stock_actual FROM productos WHERE id_producto = v_id_producto;
        
        IF v_stock_actual < v_cantidad THEN
            RAISE EXCEPTION 'Stock insuficiente para el producto con ID % (Stock actual: %, Cantidad solicitada: %)', 
                            v_id_producto, v_stock_actual, v_cantidad;
        END IF;
    END LOOP;

    INSERT INTO ventas (id_cliente, id_metodo_pago, total, id_estado)
    VALUES (p_id_cliente, p_id_metodo_pago, 0, 2) -- 2 para registrar que la compra esta Pendiente
    RETURNING id_venta INTO v_id_venta;

    FOR v_detalle IN SELECT * FROM json_array_elements(p_detalles)
    LOOP
        v_id_producto = (v_detalle->>'id_producto')::INTEGER;
        v_cantidad = (v_detalle->>'cantidad')::INTEGER;
        
        SELECT precio_venta INTO v_precio_unitario 
        FROM productos WHERE id_producto = v_id_producto;
        
        v_subtotal = v_precio_unitario * v_cantidad;
        v_total = v_total + v_subtotal;
        
        INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        VALUES (v_id_venta, v_id_producto, v_cantidad, v_precio_unitario, v_subtotal);
        
        UPDATE productos
        SET stock = stock - v_cantidad
        WHERE id_producto = v_id_producto;
    END LOOP;
    
    UPDATE ventas 
    SET total = v_total, 
        id_estado = 1 -- 1 para registar que la venta esta Completada
    WHERE id_venta = v_id_venta;
    
    RAISE NOTICE 'Venta registrada exitosamente con ID: %, Total: %', v_id_venta, v_total;
EXCEPTION 
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error al registrar la venta: %', SQLERRM;
END;
$$;

-- caso para que el procedimiento se cumpla
CALL registrar_venta(
    2, -- ID del cliente
    1, -- ID del método de pago 
    '[{"id_producto": 1, "cantidad": 2}, {"id_producto": 2, "cantidad": 1}]'::JSON
);

-- caso para que este procedimiento no se cumpla
CALL registrar_venta(
    1, 
    2, 
    '[{"id_producto": 2, "cantidad": 15}]'::JSON
);
