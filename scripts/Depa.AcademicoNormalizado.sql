CREATE TABLE carrera (
    Id_Carrera INT PRIMARY KEY,
    Nombre_Carrera VARCHAR(50)
);


CREATE TABLE semestre (
    Id_Semestre INT PRIMARY KEY,
    Num_Semestre INT
);


CREATE TABLE grupo (
    Id_Grupo INT PRIMARY KEY,
    Num_Grupo INT
);

CREATE TABLE visita (
    Id_Visita INT PRIMARY KEY,
    Fecha_Visita DATE,
    Horario_Visita TIME
);


CREATE TABLE empresa (
    Id_Empresa INT PRIMARY KEY,
    Nombre_Empresa VARCHAR(50),
    Telefono VARCHAR(15),
    Domicilio VARCHAR(100),
    Codigo_Postal VARCHAR(10),
    Ciudad VARCHAR(50),
    Ref_Visita INT,
    FOREIGN KEY (Ref_Visita) REFERENCES visita(Id_Visita)
);


CREATE TABLE departamento (
    Id_Departamento INT PRIMARY KEY,
    Nombre_Departamento VARCHAR(50),
    Codigo_Departamento VARCHAR(10),
    Num_Departamento INT,
    Telefono VARCHAR(15),
    Ref_Empresa INT,
    FOREIGN KEY (Ref_Empresa) REFERENCES empresa(Id_Empresa)
);


CREATE TABLE jefe_departamento (
    Id_Jefe INT PRIMARY KEY,
    Nombre_Jefe VARCHAR(50),
    RFC CHAR(13),
    Apellido_Paterno VARCHAR(50),
    Apellido_Materno VARCHAR(50),
    Telefono VARCHAR(15),
    Ref_Departamento INT,
    FOREIGN KEY (Ref_Departamento) REFERENCES departamento(Id_Departamento)
);


CREATE TABLE estudiante (
    Id_Estudiante INT PRIMARY KEY,
    Nombre_Contacto VARCHAR(100),
    Telefono VARCHAR(15),
    Apellido_Paterno VARCHAR(50),
    Apellido_Materno VARCHAR(50),
    Ref_Carrera INT,
    Ref_Grupo INT,
    Ref_Semestre INT,
    FOREIGN KEY (Ref_Carrera) REFERENCES carrera(Id_Carrera),
    FOREIGN KEY (Ref_Grupo) REFERENCES grupo(Id_Grupo),
    FOREIGN KEY (Ref_Semestre) REFERENCES semestre(Id_Semestre)
);


CREATE TABLE docente (
    Id_Docente INT PRIMARY KEY,
    Nombre_Docente VARCHAR(50),
    RFC CHAR(13),
    Apellido_Paterno VARCHAR(50),
    Apellido_Materno VARCHAR(50),
    Telefono VARCHAR(15),
    Cedula VARCHAR(20),
    Ref_Carrera INT,
    FOREIGN KEY (Ref_Carrera) REFERENCES carrera(Id_Carrera)
);


INSERT INTO carrera VALUES
(1, 'Ingeniería de Software'),
(2, 'Ingeniería Civil'),
(3, 'Derecho'),
(4, 'Medicina'),
(5, 'Arquitectura');


INSERT INTO semestre VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);


INSERT INTO grupo VALUES
(1, 101),
(2, 102),
(3, 201),
(4, 202),
(5, 301),
(6, 302),
(7, 401),
(8, 402);


INSERT INTO visita VALUES
(1, '2024-06-01', '09:00:00'),
(2, '2024-06-02', '10:00:00'),
(3, '2024-06-03', '11:00:00'),
(4, '2024-06-04', '12:00:00'),
(5, '2024-06-05', '13:00:00');


INSERT INTO empresa VALUES
(1, 'Empresa A', '5551231234', 'Calle 1, Ciudad A', '12345', 'Ciudad A', 1),
(2, 'Empresa B', '5552342345', 'Calle 2, Ciudad B', '23456', 'Ciudad B', 2),
(3, 'Empresa C', '5553453456', 'Calle 3, Ciudad C', '34567', 'Ciudad C', 3),
(4, 'Empresa D', '5554564567', 'Calle 4, Ciudad D', '45678', 'Ciudad D', 4),
(5, 'Empresa E', '5555675678', 'Calle 5, Ciudad E', '56789', 'Ciudad E', 5);


INSERT INTO departamento VALUES
(1, 'Departamento A', 'DPTA1', 1, '5556786789', 1),
(2, 'Departamento B', 'DPTB2', 2, '5557897890', 2),
(3, 'Departamento C', 'DPTC3', 3, '5558908901', 3),
(4, 'Departamento D', 'DPTD4', 4, '5559019012', 4),
(5, 'Departamento E', 'DPTE5', 5, '5550120123', 5);


INSERT INTO jefe_departamento VALUES
(1, 'Manuel Lopez', 'LOPMA678901H1', 'Lopez', 'Martinez', '5552342346', 1),
(2, 'Lucia Alvarez', 'ALVLU789012H2', 'Alvarez', 'Garcia', '5553453457', 2),
(3, 'Fernando Perez', 'PERFE890123H3', 'Perez', 'Ramirez', '5554564568', 3),
(4, 'Gabriela Torres', 'TORGA901234H4', 'Torres', 'Hernandez', '5555675679', 4),
(5, 'Javier Gutierrez', 'GUTJA012345H5', 'Gutierrez', 'Fernandez', '5556786780', 5);


INSERT INTO estudiante VALUES
(1, 'Juan Perez', '5551234567', 'Perez', 'Lopez', 1, 1, 1),
(2, 'Maria Garcia', '5552345678', 'Garcia', 'Martinez', 2, 2, 2),
(3, 'Luis Ramirez', '5553456789', 'Ramirez', 'Sanchez', 3, 3, 3),
(4, 'Ana Hernandez', '5554567890', 'Hernandez', 'Diaz', 4, 4, 4),
(5, 'Jose Fernandez', '5555678901', 'Fernandez', 'Gonzalez', 5, 5, 5);


INSERT INTO docente VALUES
(1, 'Carlos Martinez', 'MARCA123456H1', 'Martinez', 'Lopez', '5556789012', '123456789', 1),
(2, 'Laura Sanchez', 'SANLA234567H2', 'Sanchez', 'Garcia', '5557890123', '234567890', 2),
(3, 'Miguel Torres', 'TORMI345678H3', 'Torres', 'Ramirez', '5558901234', '345678901', 3),
(4, 'Patricia Flores', 'FLOPA456789H4', 'Flores', 'Hernandez', '5559012345', '456789012', 4),
(5, 'Roberto Gutierrez', 'GUTRO567890H5', 'Gutierrez', 'Fernandez', '5550123456', '567890123', 5);


/*1. SELECT * FROM carrera;*/
SELECT * FROM carrera;

/*2. SELECT * FROM estudiante;*/
SELECT * FROM estudiante;

/*3. SELECT * FROM estudiante JOIN grupo ON estudiante.Ref_Grupo = grupo.Id_Grupo;*/
SELECT * FROM estudiante
JOIN grupo ON estudiante.Ref_Grupo = grupo.Id_Grupo;

/*4. SELECT * FROM empresa JOIN visita ON empresa.Ref_Visita = visita.Id_Visita;*/
SELECT * FROM empresa
JOIN visita ON empresa.Ref_Visita = visita.Id_Visita;

/*5. JOIN entre estudiante y grupo;*/
SELECT e.Nombre_Contacto AS nombre_estudiante, g.Num_Grupo
FROM estudiante e
JOIN grupo g ON e.Ref_Grupo = g.Id_Grupo;

/*6. SELECT * FROM empresa WHERE Ciudad = 'A';*/
SELECT * FROM empresa WHERE Ciudad = 'Ciudad A';

/*7. Suma total de visitas por empresa;*/
SELECT emp.Nombre_Empresa AS nombre_empresa, COUNT(v.Id_Visita) AS total_visitas
FROM empresa emp
JOIN visita v ON emp.Ref_Visita = v.Id_Visita
GROUP BY emp.Nombre_Empresa;

/*8. Departamentos en más de una empresa;*/
SELECT d.*
FROM departamento d
JOIN empresa e ON d.Ref_Empresa = e.Id_Empresa
GROUP BY d.Id_Departamento
HAVING COUNT(e.Id_Empresa) > 1;

/*9. Empresas con nombre más corto que 8 caracteres y sus visitas;*/
SELECT e.Nombre_Empresa AS nombre_empresa, v.Fecha_Visita, v.Horario_Visita
FROM empresa e
JOIN visita v ON e.Ref_Visita = v.Id_Visita
WHERE LENGTH(e.Nombre_Empresa) < 8;