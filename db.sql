CREATE DATABASE techzone;

\c techzone

CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE direcciones (
    id_direccion SERIAL PRIMARY KEY,
    calle VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    codigo_postal VARCHAR(20),
    pais VARCHAR(50) DEFAULT 'colombia'
);

CREATE TABLE proveedor_direccion (
    id_proveedor INTEGER REFERENCES proveedores(id_proveedor),
    id_direccion INTEGER REFERENCES direcciones(id_direccion),
    tipo_direccion VARCHAR(50) DEFAULT 'Principal',
    PRIMARY KEY (id_proveedor, id_direccion)
);

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_compra DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    stock_minimo INTEGER DEFAULT 5,
    id_categoria INTEGER REFERENCES categorias(id_categoria),
    fecha_registro DATE DEFAULT CURRENT_DATE,
    ultimo_reabastecimiento DATE
);

CREATE TABLE producto_proveedor (
    id_producto INTEGER REFERENCES productos(id_producto),
    id_proveedor INTEGER REFERENCES proveedores(id_proveedor),
    es_proveedor_principal BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_producto, id_proveedor)
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE cliente_direccion (
    id_cliente INTEGER REFERENCES clientes(id_cliente),
    id_direccion INTEGER REFERENCES direcciones(id_direccion),
    tipo_direccion VARCHAR(50) DEFAULT 'Principal',
    PRIMARY KEY (id_cliente, id_direccion)
);

CREATE TABLE metodos_pago (
    id_metodo_pago SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

CREATE TABLE estados_venta (
    id_estado SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    descripcion TEXT
);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    fecha_venta DATE DEFAULT CURRENT_TIMESTAMP,
    id_cliente INTEGER REFERENCES clientes(id_cliente),
    total DECIMAL(12, 2) NOT NULL,
    id_metodo_pago INTEGER REFERENCES metodos_pago(id_metodo_pago),
    id_estado INTEGER REFERENCES estados_venta(id_estado) DEFAULT 1
);

CREATE TABLE detalle_ventas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INTEGER REFERENCES ventas(id_venta),
    id_producto INTEGER REFERENCES productos(id_producto),
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL
);

CREATE TABLE alertas_stock (
    id_alerta SERIAL PRIMARY KEY,
    id_producto INTEGER REFERENCES productos(id_producto),
    stock_actual INTEGER,
    stock_minimo INTEGER,
    fecha_alerta TIMESTAMP,
    procesada BOOLEAN DEFAULT FALSE
);
