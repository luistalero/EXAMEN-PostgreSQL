# 🛠️ Base de Datos TechZone - Documentación

Este proyecto consiste en una base de datos PostgreSQL para gestionar ventas, inventario, clientes y proveedores de una tienda de tecnología. Incluye tablas, relaciones, datos de ejemplo, consultas útiles, procedimientos almacenados y triggers para automatizar tareas críticas.

---

## 📂 Estructura de la Base de Datos

### **Tablas Principales**
1. **`clientes`**: Almacena información de clientes (nombre, apellido, email, teléfono).
2. **`proveedores`**: Registra proveedores con datos de contacto.
3. **`direcciones`**: Guarda direcciones físicas (calle, ciudad, código postal).
4. **`categorias`**: Categorías de productos (ej: Laptops, Smartphones).
5. **`productos`**: Detalla productos con precios, stock y categoría.
6. **`ventas`** y **`detalle_ventas`**: Gestionan transacciones de ventas y sus detalles.
7. **`alertas_stock`**: Registra alertas cuando el stock está bajo.

### **Relaciones Clave**
- `proveedor_direccion` y `cliente_direccion`: Asocian direcciones a proveedores/clientes.
- `producto_proveedor`: Relaciona productos con sus proveedores.
- `ventas` se vinculan a `clientes`, `metodos_pago` y `estados_venta`.
- `detalle_ventas` enlaza ventas con productos.

---

## 🚀 Instalación y Configuración

1. **Crear la base de datos**:
   ```sql
   CREATE DATABASE techzone;
   \c techzone
   

2. *Ejecutar el script SQL*:
   - Copia y ejecuta todas las sentencias CREATE TABLE del archivo proporcionado.
   - Ejecuta los INSERT para cargar datos de ejemplo.

3. *Eliminar la base de datos (opcional)*:
   
   \c postgres
   DROP DATABASE techzone;
   

---

## 🔍 Consultas Destacadas

### 1. Productos con stock bajo (<5 unidades)
SELECT 
    p.id_producto,
    p.codigo,
    p.nombre,
    p.stock,
    c.nombre AS categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock < 5;

### 2. Ventas totales por mes
SELECT 
    EXTRACT(YEAR FROM fecha_venta) AS año,
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(total) AS ventas_totales
FROM ventas
WHERE EXTRACT(MONTH FROM fecha_venta) = 2 -- Cambiar el mes
GROUP BY año, mes;

### 3. Cliente más activo
SELECT 
    c.nombre || ' ' || c.apellido AS cliente,
    COUNT(v.id_venta) AS total_compras
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_compras DESC
LIMIT 1;

---

## ⚙️ Funciones y Procedimientos

### **1. registrar_venta**
Registra una venta y actualiza el stock automáticamente.

*Parámetros*:
- p_id_cliente: ID del cliente.
- p_id_metodo_pago: ID del método de pago.
- p_detalles: JSON con productos y cantidades (ej: [{"id_producto": 1, "cantidad": 2}]).

*Ejemplo de uso*:
CALL registrar_venta(
    2, 
    1, 
    '[{"id_producto": 1, "cantidad": 2}]'::JSON
);

### **2. verificar_stock_minimo (Trigger)**
Genera una alerta en alertas_stock si el stock cae debajo del mínimo.

### *3. Funciones de validación*
- cliente_existe(id_cliente): Retorna TRUE si el cliente existe.
- metodo_pago_existe(id_metodo): Verifica la existencia de un método de pago.

---

## 📊 Ejemplos de Datos

### *Productos de ejemplo*
| Código | Nombre               | Precio Venta | Stock |
|--------|----------------------|--------------|-------|
| LT001  | Laptop Dell XPS      | $18,000      | 15    |
| SP001  | Samsung Galaxy S23   | $3,800,000   | 12    |

### *Clientes registrados*
- Catalina Llanes (catalina.llanes@gmail.com)
- Luis Talero (luis.talero@gmail.com)

---

## 🛑 Alertas de Stock
El trigger trigger_verificar_stock_minimo inserta una alerta en alertas_stock cuando el stock de un producto está por debajo de su mínimo. Ejemplo:
SELECT * FROM alertas_stock WHERE stock_actual < stock_minimo;

---

## 📝 Notas Adicionales
- *Fecha de ventas*: Los datos de ejemplo incluyen fechas futuras (ej: 2025) para pruebas.
- *Métodos de pago*: Efectivo, Tarjeta de Crédito, Transferencia, PayPal.
- *Estados de venta*: Completada, Pendiente, Cancelada, En envío.

---

✨ *Contribuciones*: Siéntete libre de mejorar las consultas o añadir nuevas funcionalidades. ¡Bienvenido al equipo TechZone!
```