# Create and select database
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica; 

CREATE TABLE IF NOT EXISTS proveedores
(
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre_proveedor VARCHAR(30),
    telefono_proveedor VARCHAR(9),
    fax_proveedor VARCHAR(9),
    NIF_proveedor VARCHAR(9),
    PRIMARY KEY(id_proveedor)
);

CREATE TABLE IF NOT EXISTS direcciones (
    id_direccion INT NOT NULL AUTO_INCREMENT,
    calle VARCHAR(30),
    numero INT,
    piso INT,
    puerta VARCHAR(5),
    ciudad VARCHAR(30),
    codigo_postal VARCHAR(5),
    pais VARCHAR(30),
    proveedor_id INT,
    PRIMARY KEY(id_direccion),
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS gafas
(
    id_gafa INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(30),
    graduacion_izq FLOAT(2),
    graduacion_der FLOAT(2),
    tipo_montura ENUM("flotante","pasta","metalica"),
    color_montura VARCHAR(12),
    color_cristales VARCHAR(12),
    precio FLOAT(2),
    proveedor_id INT,
    PRIMARY KEY(id_gafa),
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS clientes
(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(30),
    direccion_cliente VARCHAR(60),
    telefono_cliente CHARACTER(9),
    email_cliente VARCHAR(30),
    fecha_registro DATE,
    recomendado_por VARCHAR(20),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS ventas
(
    order_id INT NOT NULL AUTO_INCREMENT,
    empleado_venta VARCHAR(20),
    fecha_venta DATE,
    cliente_id INT,
    gafa_id INT,
    proveedor_id INT,
    PRIMARY KEY(order_id),
    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id_cliente),
    FOREIGN KEY (gafa_id)
    REFERENCES gafas(id_gafa),
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedores(id_proveedor)
);

INSERT INTO proveedores (nombre_proveedor, telefono_proveedor, fax_proveedor, NIF_proveedor)
VALUES ("Gafas de Acero","666666661", "666666662", "10666666A");
INSERT INTO proveedores (nombre_proveedor, telefono_proveedor, fax_proveedor, NIF_proveedor)
VALUES ("Gafas de Madera","666666663", "666666664", "10666666M");
INSERT INTO proveedores (nombre_proveedor, telefono_proveedor, fax_proveedor, NIF_proveedor)
VALUES ("Gafas de Plastico","666666665", "666666666", "10666666P");
INSERT INTO proveedores (nombre_proveedor, telefono_proveedor, fax_proveedor, NIF_proveedor)
VALUES ("Gafas de Ceramica","666666667", "666666668", "10666666C");
INSERT INTO proveedores (nombre_proveedor, telefono_proveedor, fax_proveedor, NIF_proveedor)
VALUES ("Gafas de Oro","666666669", "666666660", "10666666O");

INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais, proveedor_id)
VALUES ("Carrer del Acero","1", "1", "1", "Valencia", 08001, "España",1);
INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais, proveedor_id)
VALUES ("Carrer de la Madera","2", "2", "2", "Medellin", 08002, "Colombia",2);
INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais, proveedor_id)
VALUES ("Carrer del Plastico","3", "3", "3", "Paris", 08003, "Francia",3);
INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais, proveedor_id)
VALUES ("Carrer de la Ceramica","4", "4", "4", "Pekín", 08004, "China",4);
INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais, proveedor_id)
VALUES ("Carrer del Oro","5", "5", "5", "Pretoria", 08005, "Sudáfrica",5);

INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Acero Frío","0.10", "0.10", "flotante", "Gris", "Negro", 10.00, 1);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Acero Cálido","0.10", "0.10", "flotante", "Gris", "Negro", 10.00, 1);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Madera Roble","0.20", "0.20", "flotante", "Marrón", "Naranja", 20.00, 2);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Madera Pino","0.20", "0.20", "flotante", "Marrón", "Naranja", 20.00, 2);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Plastico","0.30", "0.30", "pasta", "Azul", "Cielo", 30.00, 3);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Ceramica","0.40", "0.40", "pasta", "Blanco", "Crema", 40.00 , 4);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Oro Blanco","0.50", "0.50", "metalica", "Amarillo", "Dorado", 50.00, 5);
INSERT INTO gafas (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_cristales, precio, proveedor_id)
VALUES ("Oro Rojo","0.50", "0.50", "metalica", "Amarillo", "Dorado", 50.00, 5);

INSERT INTO clientes (nombre_cliente, direccion_cliente, telefono_cliente, email_cliente, recomendado_por, fecha_registro)
VALUES ("Pepito","Metro Urquinaona", "678787878", "pepito@gmail.com", "Menganito","2022-01-01");
INSERT INTO clientes (nombre_cliente, direccion_cliente, telefono_cliente, email_cliente, recomendado_por, fecha_registro)
VALUES ("Señor","Metro Sants", "678787879", "señor@gmail.com", "Señora","2022-01-02");
INSERT INTO clientes (nombre_cliente, direccion_cliente, telefono_cliente, email_cliente, recomendado_por, fecha_registro)
VALUES ("Señora","Metro Gracia", "678787890", "señora@gmail.com", "Señoro","2022-01-03");
INSERT INTO clientes (nombre_cliente, direccion_cliente, telefono_cliente, email_cliente, recomendado_por, fecha_registro)
VALUES ("Menganito","Metro Poblenou", "678787890", "señora@gmail.com","1","2022-01-04");
INSERT INTO clientes (nombre_cliente, direccion_cliente, telefono_cliente, email_cliente, recomendado_por, fecha_registro)
VALUES ("John","Metro Liceu", "678787891","john.travolta@gmail.com","2","2022-01-05");

INSERT INTO ventas (empleado_venta, fecha_venta, cliente_id, gafa_id, proveedor_id)
VALUES ("Pau","2022-01-01", "1","1","1");
INSERT INTO ventas (empleado_venta, fecha_venta, cliente_id, gafa_id, proveedor_id)
VALUES ("Pau","2022-01-03", "1","2","1");
INSERT INTO ventas (empleado_venta, fecha_venta, cliente_id, gafa_id, proveedor_id)
VALUES ("Pere","2022-01-02", "2","3","2");

SELECT COUNT(*) FROM ventas WHERE cliente_id = 2;
SELECT DISTINCT gafa_id FROM ventas WHERE empleado_venta = "Pau" AND YEAR(fecha_venta) = 2022;
SELECT DISTINCT proveedor_id FROM ventas;