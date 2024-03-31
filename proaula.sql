create database proaula;
use proaula;

CREATE TABLE Muelles (
    id_muelle int NOT NULL AUTO_INCREMENT,
    nombre varchar(25),
    CONSTRAINT PK_Muelle PRIMARY KEY (id_muelle)
);

CREATE TABLE Rutas (
    id_ruta int NOT NULL AUTO_INCREMENT,
    id_muelle_origen int NOT NULL,
    id_muelle_destino int NOT NULL,
    CONSTRAINT PK_Ruta PRIMARY KEY (id_ruta),
    CONSTRAINT FK_MuelleOrigenRuta FOREIGN KEY (id_muelle_origen) REFERENCES Muelles(id_muelle),
    CONSTRAINT FK_MuelleDestinoRuta FOREIGN KEY (id_muelle_destino) REFERENCES Muelles(id_muelle)
);

CREATE TABLE Barcos (
    id_barco int NOT NULL AUTO_INCREMENT,
    codigo_barco varchar(25),
    capacidad int default 25,
    CONSTRAINT PK_Barco PRIMARY KEY (id_barco)
);

CREATE TABLE formulario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    
    email VARCHAR(100) NOT NULL,
    contraseña VARCHAR(255) NOT NULL
);


CREATE TABLE Programaciones (
    id_programacion int NOT NULL AUTO_INCREMENT,
    horario varchar(255),
    valor float default 0,
    id_ruta int NOT NULL,
    id_barco int NOT NULL,
    CONSTRAINT PK_Programacion PRIMARY KEY (id_programacion),
    CONSTRAINT FK_RutaProgramacion FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    CONSTRAINT FK_BarcoProgramacion FOREIGN KEY (id_barco) REFERENCES Barcos(id_barco)
);

CREATE TABLE Clientes (
    id_cliente int NOT NULL AUTO_INCREMENT,
    nombre varchar(25),
    CONSTRAINT PK_Cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE Tiquetes (
    id_tiquete int NOT NULL AUTO_INCREMENT,
    id_programacion int NOT NULL,
    id_cliente int NOT NULL,
    fecha_compra datetime NOT NULL default NOW(),
    CONSTRAINT PK_Tiquete PRIMARY KEY (id_tiquete),
    CONSTRAINT FK_ProgramacionTiquete FOREIGN KEY (id_programacion) REFERENCES Programaciones(id_programacion),
    CONSTRAINT FK_ClienteTiquete FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO `proaula`.`Muelles` (`nombre`) VALUES ('Boquilla');
INSERT INTO `proaula`.`Muelles` (`nombre`) VALUES ('Bocana');
INSERT INTO `proaula`.`Muelles` (`nombre`) VALUES ('Las Americas');
INSERT INTO `proaula`.`Muelles` (`nombre`) VALUES ('La Perimetral');

INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (1,2);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (1,3);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (1,4);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (2,1);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (2,3);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (2,4);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (3,1);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (3,2);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (3,4);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (4,1);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (4,2);
INSERT INTO `proaula`.`Rutas` (`id_muelle_origen`,`id_muelle_destino`) VALUES (4,3);

INSERT INTO `proaula`.`Barcos` (`codigo_barco`,`capacidad`) VALUES('Barco 1', 20);
INSERT INTO `proaula`.`Barcos` (`codigo_barco`,`capacidad`) VALUES('Barco 2', 30);
INSERT INTO `proaula`.`Barcos` (`codigo_barco`,`capacidad`) VALUES('Barco 3', 50);

INSERT INTO `proaula`.`Programaciones` (`horario`, `valor`, `id_ruta`,`id_barco`) VALUES ('10:00 AM - 11:00 AM', 10, 1, 1);
INSERT INTO `proaula`.`Programaciones` (`horario`, `valor`, `id_ruta`,`id_barco`) VALUES ('12:00 AM - 02:00 PM', 20, 1, 2);
INSERT INTO `proaula`.`Programaciones` (`horario`, `valor`, `id_ruta`,`id_barco`) VALUES ('03:00 PM - 04:00 PM', 30, 1, 3);
INSERT INTO `proaula`.`Programaciones` (`horario`, `valor`, `id_ruta`,`id_barco`) VALUES ('10:00 AM - 11:00 AM', 10, 1, 2);
INSERT INTO `proaula`.`Programaciones` (`horario`, `valor`, `id_ruta`,`id_barco`) VALUES ('12:00 AM - 02:00 PM', 20, 1, 3);
INSERT INTO `proaula`.`Programaciones` (`horario`, `valor`, `id_ruta`,`id_barco`) VALUES ('03:00 PM - 04:00 PM', 30, 1, 1);

INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Daniel');
INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Andres');
INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Camilo');
INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Jorge');
INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Ernesto');
INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Juana');
INSERT INTO `proaula`.`Clientes` (`nombre`) VALUES ('Estefania');

INSERT INTO `proaula`.`Tiquetes` (`id_programacion`,`id_cliente`,`fecha_compra`) VALUES (1, 1, NOW());
INSERT INTO `proaula`.`Tiquetes` (`id_programacion`,`id_cliente`,`fecha_compra`) VALUES (2, 2, NOW());
INSERT INTO `proaula`.`Tiquetes` (`id_programacion`,`id_cliente`,`fecha_compra`) VALUES (3, 3, NOW());
INSERT INTO `proaula`.`Tiquetes` (`id_programacion`,`id_cliente`,`fecha_compra`) VALUES (4, 4, NOW());
INSERT INTO `proaula`.`Tiquetes` (`id_programacion`,`id_cliente`,`fecha_compra`) VALUES (5, 5, NOW());
INSERT INTO `proaula`.`Tiquetes` (`id_programacion`,`id_cliente`,`fecha_compra`) VALUES (6, 6, NOW());

/*select 
 c.nombre as nombre_cliente,
 mo.nombre as muelle_origen,
 md.nombre as muelle_destino,
 p.horario as horario,
 p.valor as valor_tiquete,
 t.fecha_compra
from Tiquetes as t
left join Clientes as c on t.id_cliente = c.id_cliente
left join Programaciones as p on t.id_programacion = p.id_programacion
left join Rutas as r on r.id_ruta = p.id_ruta
left join Muelles as mo on mo.id_muelle = r.id_muelle_origen
left join Muelles as md on md.id_muelle = r.id_muelle_destino
where c.nombre = 'Daniel'
*/