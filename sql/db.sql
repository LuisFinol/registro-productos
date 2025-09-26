CREATE DATABASE productosdb;
USE productosdb;

CREATE TABLE bodegas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE sucursales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    bodega_id INT,
    FOREIGN KEY (bodega_id) REFERENCES bodegas(id)
);

CREATE TABLE monedas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(15) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    bodega_id INT,
    sucursal_id INT,
    moneda_id INT,
    precio DECIMAL(10,2) NOT NULL,
    materiales TEXT NOT NULL,
    descripcion TEXT NOT NULL,
    FOREIGN KEY (bodega_id) REFERENCES bodegas(id),
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
    FOREIGN KEY (moneda_id) REFERENCES monedas(id)
);

-- Datos de prueba
INSERT INTO bodegas (nombre) VALUES ('Central'), ('Norte');
INSERT INTO sucursales (nombre, bodega_id) VALUES ('Sucursal A', 1), ('Sucursal B', 2);
INSERT INTO monedas (codigo, nombre) VALUES ('CLP', 'Peso Chileno'), ('USD', 'Dólar');
