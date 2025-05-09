INSERT INTO proveedores (nombre, contacto, telefono, email) VALUES 
('TechC', 'Juan Lopez', '555-4561', 'juan@techc.com'),
('Electron', 'Maria Mora', '555-9784', 'maria@electron.com'),
('Dell Colombia', 'Carlos Ramírez', '601-2574000', 'carlos.ramirez@dell.com'),
('HP Colombia', 'Andrea Sánchez', '601-6383000', 'andrea.sanchez@hp.com'),
('Logitech Colombia', 'Felipe Martínez', '601-7452136', 'felipe.martinez@logitech.com'),
('Samsung Electronics', 'Daniela Rodríguez', '601-6001272', 'drodriguez@samsung.com'),
('Lenovo Colombia', 'Jorge Medina', '601-3907800', 'jorge.medina@lenovo.com'),
('Apple Colombia', 'Laura Torres', '601-7460000', 'laura.torres@apple.com'),
('Microsoft Colombia', 'Gabriel Pérez', '601-3139000', 'gabriel.perez@microsoft.com'),
('LG Electronics', 'Valentina Castro', '601-4850000', 'valentina.castro@lg.com'),
('Asus Colombia', 'Ricardo Vargas', '601-3751515', 'ricardo.vargas@asus.com'),
('Huawei Colombia', 'Carolina Mejía', '601-3139800', 'carolina.mejia@huawei.com'),
('Kingston Technology', 'Eduardo Gómez', '601-7423695', 'eduardo.gomez@kingston.com'),
('Compumax', 'Patricia Duarte', '601-4237890', 'patricia.duarte@compumax.co'),
('Alkosto Tecnología', 'Sergio Martínez', '601-4456000', 'smartinez@alkosto.com');

INSERT INTO direcciones (calle, ciudad, estado, codigo_postal) VALUES 
('Av. Inventada 123', 'Bogotá', 'Metropolitana', '02555'),
('Calle 8 No. 456', 'Valledupar', 'Cesar', '11220'),
('Carrera 7 # 71-21', 'Bogotá', 'Cundinamarca', '110231'),
('Calle 100 # 19-61', 'Bogotá', 'Cundinamarca', '110111'),
('Diagonal 53d # 21-23', 'Medellín', 'Antioquia', '050034'),
('Av. El Poblado # 37-95', 'Medellín', 'Antioquia', '050016'),
('Calle 77 # 59-85', 'Barranquilla', 'Atlántico', '080020'),
('Carrera 56 # 72-146', 'Barranquilla', 'Atlántico', '080002'),
('Calle 12 # 1-17', 'Cali', 'Valle del Cauca', '760045'),
('Av. 6N # 25N-42', 'Cali', 'Valle del Cauca', '760046'),
('Carrera 27 # 34-44', 'Bucaramanga', 'Santander', '680003'),
('Calle 9 # 23-55', 'Pereira', 'Risaralda', '660003'),
('Av. Bolívar # 19N-46', 'Armenia', 'Quindío', '630004'),
('Carrera 5 # 21-87', 'Ibagué', 'Tolima', '730006'),
('Av. Francisco Newball # 4-138', 'San Andrés', 'San Andrés y Providencia', '880001');

INSERT INTO proveedor_direccion (id_proveedor, id_direccion) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

INSERT INTO categorias (nombre, descripcion) VALUES 
('Laptops', 'Computadoras portátiles de diversas marcas'),
('Accesorios', 'Teclados, mouse, audífonos, etc.'),
('Smartphones', 'Teléfonos inteligentes de diferentes marcas'),
('Tablets', 'Dispositivos tipo tableta de varios tamaños'),
('Monitores', 'Pantallas para computadoras'),
('Almacenamiento', 'Discos duros, SSDs, memorias USB'),
('Componentes PC', 'Tarjetas madre, procesadores, tarjetas gráficas'),
('Impresoras', 'Dispositivos de impresión y escáners'),
('Audio', 'Parlantes, barras de sonido, equipos de audio'),
('Redes', 'Routers, switches, extensores WiFi'),
('Software', 'Programas y licencias'),
('Gaming', 'Consolas y accesorios para videojuegos'),
('Servidores', 'Equipos para centros de datos'),
('Smart Home', 'Dispositivos inteligentes para el hogar'),
('Cables y adaptadores', 'Conectores, convertidores y cables');

INSERT INTO productos (codigo, nombre, descripcion, precio_compra, precio_venta, stock, id_categoria) VALUES 
('LT001', 'Laptop Dell XPS', 'Portátil de alto rendimiento', 15000, 18000, 15, 1),
('LT002', 'Laptop Dell XP', 'Portátil de bajo rendimiento', 5000, 10000, 4, 1),
('PRF002', 'Mouse Logitech', 'Mouse inalámbrico', 300, 500, 25, 2),
('LT003', 'MacBook Air M2', 'Laptop Apple con chip M2', 9000000, 11000000, 8, 1),
('LT004', 'Lenovo ThinkPad X1', 'Laptop empresarial de alto rendimiento', 6500000, 7800000, 10, 1),
('SP001', 'Samsung Galaxy S23', 'Smartphone gama alta Samsung', 3200000, 3800000, 12, 3),
('SP002', 'iPhone 15 Pro', 'Smartphone Apple premium', 4500000, 5200000, 6, 3),
('TB001', 'iPad Pro 12.9', 'Tablet Apple con pantalla XDR', 5800000, 6500000, 4, 4),
('ACC001', 'Teclado Logitech MX Keys', 'Teclado inalámbrico premium', 480000, 550000, 15, 2),
('MON001', 'Monitor Samsung Odyssey G7', 'Monitor curvo gaming 32"', 2200000, 2600000, 7, 5),
('ALM001', 'SSD Samsung 1TB', 'Disco de estado sólido', 380000, 450000, 20, 6),
('COMP001', 'Procesador AMD Ryzen 9', 'CPU de alta gama', 1800000, 2100000, 5, 7),
('IMP001', 'Impresora HP LaserJet', 'Impresora láser monocromática', 850000, 950000, 10, 8),
('AUD001', 'Audífonos Sony WH-1000XM5', 'Audífonos con cancelación de ruido', 1300000, 1500000, 8, 9),
('RED001', 'Router TP-Link Archer AX90', 'Router WiFi 6', 750000, 850000, 12, 10);

INSERT INTO producto_proveedor (id_producto, id_proveedor, es_proveedor_principal) VALUES 
(1, 1, TRUE),
(2, 2, TRUE),
(3, 5, TRUE),
(4, 8, TRUE),
(5, 7, TRUE),
(6, 6, TRUE),
(7, 8, TRUE),
(8, 8, TRUE),
(9, 5, TRUE),
(10, 6, TRUE),
(11, 6, FALSE),
(11, 14, TRUE),
(12, 3, FALSE),
(12, 15, TRUE),
(13, 4, TRUE),
(14, 6, TRUE),
(15, 10, TRUE);

INSERT INTO clientes (nombre, apellido, email, telefono) VALUES 
('Catalina', 'Llanes', 'catalina.llanes@gmail.com', '3159017696'),
('Luis', 'Talero', 'luis.talero@gmail.com', '3008932430'),
('Andrés', 'Gutiérrez', 'andres.gutierrez@gmail.com', '3001234567'),
('Carolina', 'Ruiz', 'carolina.ruiz@hotmail.com', '3109876543'),
('Fernando', 'Ocampo', 'fernando.ocampo@outlook.com', '3176543210'),
('Martha', 'Gómez', 'martha.gomez@gmail.com', '3201472583'),
('Héctor', 'Salazar', 'hector.salazar@yahoo.com', '3008529637'),
('Patricia', 'Hernández', 'patricia.hernandez@outlook.com', '3117539514'),
('Diego', 'Vargas', 'diego.vargas@gmail.com', '3214561237'),
('Natalia', 'Mendoza', 'natalia.mendoza@hotmail.com', '3159638527'),
('Carlos', 'Jaramillo', 'carlos.jaramillo@gmail.com', '3107418529'),
('Valentina', 'Cardona', 'valentina.cardona@outlook.com', '3183692581'),
('Roberto', 'Restrepo', 'roberto.restrepo@yahoo.com', '3128527419'),
('Mariana', 'Álvarez', 'mariana.alvarez@gmail.com', '3169517538'),
('Javier', 'Quintero', 'javier.quintero@hotmail.com', '3004567891');

INSERT INTO metodos_pago (nombre, descripcion) VALUES
('Efectivo', 'Pago con dinero en efectivo'),
('Tarjeta de Crédito', 'Pago con tarjeta de crédito bancaria'),
('Transferencia Bancaria', 'Pago mediante transferencia bancaria'),
('PayPal', 'Pago mediante plataforma PayPal');

INSERT INTO estados_venta (nombre, descripcion) VALUES
('Completada', 'Venta finalizada y pagada'),
('Pendiente', 'Venta en proceso'),
('Cancelada', 'Venta cancelada'),
('En envío', 'Productos en proceso de envío');

INSERT INTO cliente_direccion (id_cliente, id_direccion) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

INSERT INTO ventas (id_cliente, total, id_metodo_pago, id_estado, fecha_venta) VALUES 
(1, 18000.00, 1, 1, '2025-04-09'),
(2, 10000.00, 2, 2, '2025-04-11'),
(3, 1500000.00, 1, 1, '2025-03-15'),
(4, 3800000.00, 3, 1, '2025-03-20'),
(5, 550000.00, 2, 1, '2025-03-25'),
(6, 2100000.00, 4, 1, '2025-02-10'),
(7, 450000.00, 1, 1, '2025-02-15'),
(8, 950000.00, 2, 1, '2025-02-20'),
(9, 5200000.00, 3, 1, '2025-01-05'),
(10, 850000.00, 4, 1, '2025-01-12'),
(11, 11000000.00, 2, 1, '2025-01-18'),
(12, 2600000.00, 1, 1, '2024-12-05'),
(13, 7800000.00, 3, 1, '2024-09-15'),
(14, 1500000.00, 4, 1, '2024-12-22'),
(15, 6500000.00, 2, 1, '2024-11-30');

INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 1, 18000.00, 18000.00),
(2, 2, 1, 500.00, 500.00),
(3, 9, 3, 550000.00, 1500000.00),
(4, 6, 1, 3800000.00, 3800000.00),
(5, 9, 1, 550000.00, 550000.00),
(6, 12, 1, 2100000.00, 2100000.00),
(7, 11, 1, 450000.00, 450000.00),
(8, 13, 1, 950000.00, 950000.00),
(9, 7, 1, 5200000.00, 5200000.00),
(10, 15, 1, 850000.00, 850000.00),
(11, 4, 1, 11000000.00, 11000000.00),
(12, 10, 1, 2600000.00, 2600000.00),
(13, 5, 1, 7800000.00, 7800000.00),
(14, 14, 1, 1500000.00, 1500000.00),
(15, 8, 1, 6500000.00, 6500000.00);

INSERT INTO alertas_stock (id_producto, stock_actual, stock_minimo, fecha_alerta) VALUES 
(1, 3, 5, '2025-04-09'),
(2, 2, 5, '2025-04-11'),
(4, 4, 5, '2025-03-20'),
(7, 3, 5, '2025-03-15'),
(8, 2, 3, '2025-03-10'),
(12, 3, 5, '2025-02-28'),
(5, 4, 5, '2025-02-20'),
(13, 4, 5, '2025-02-15'),
(6, 5, 6, '2025-01-30'),
(10, 3, 5, '2025-01-25'),
(11, 4, 6, '2025-01-15'),
(14, 3, 5, '2024-12-20'),
(15, 4, 5, '2024-12-10'),
(3, 5, 8, '2024-11-30'),
(9, 4, 5, '2024-11-25');
