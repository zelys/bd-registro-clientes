CREATE DATABASE IF NOT EXISTS registroClientes;

USE registroClientes;

CREATE TABLE servicios (
    servicio_id int PRIMARY KEY AUTO_INCREMENT,
    tipo_servicio varchar(30) NOT NULL
);

CREATE TABLE zonas (
    zona_id int PRIMARY KEY AUTO_INCREMENT,
    ciudad varchar(30) NOT NULL
);

CREATE TABLE clientes (
    cliente_id int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    genero char(1),
    fecha_nacimiento date,
    zona int,
    FOREIGN KEY (zona) REFERENCES zonas (zona_id)
);

CREATE TABLE contratos (
    contrato_id int PRIMARY KEY AUTO_INCREMENT,
    cliente int,
    monto_mensual float,
    FOREIGN KEY (cliente) REFERENCES clientes (cliente_id)
);

CREATE TABLE registros (
    registro_id int PRIMARY KEY AUTO_INCREMENT,
    servicio int,
    cliente int,
    fecha_contrato date,
    FOREIGN KEY (servicio) REFERENCES servicios (servicio_id),
    FOREIGN KEY (cliente) REFERENCES clientes (cliente_id)
);