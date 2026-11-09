
-- PARTE B. ALTER TABLE e índices

-- B-01. Nueva columna (Agregar telefono a Paciente, permitiendo NULL)
ALTER TABLE Paciente
ADD COLUMN telefono VARCHAR(20) NULL;

-- B-02. Modificar columna (Ampliar telefono de Paciente a VARCHAR(30))
ALTER TABLE Paciente
MODIFY COLUMN telefono VARCHAR(30);

-- B-03. Renombrar columna (Agregar consultorio a Medico y luego cambiar su nombre a sala_consulta)
ALTER TABLE Medico
ADD COLUMN consultorio VARCHAR(20);

ALTER TABLE Medico
CHANGE COLUMN consultorio sala_consulta VARCHAR(20);

-- B-04. Valor predeterminado (Agregar activo a Medico con DEFAULT TRUE)
ALTER TABLE Medico
ADD COLUMN activo BOOLEAN DEFAULT TRUE;

-- B-05. Índice simple (Crear idx_medico_especialidad sobre id_especialidad)
CREATE INDEX idx_medico_especialidad 
ON Medico(id_especialidad);

-- B-06. Índice compuesto (Crear idx_consulta_medico_fecha sobre id_medico y fecha_consulta)
CREATE INDEX idx_consulta_medico_fecha 
ON Consulta(id_medico, fecha_consulta);


-- DATOS DE PRUEBA

-- Insertar datos en Especialidad
INSERT INTO Especialidad (id_especialidad, nombre, piso) VALUES
(1, 'Cardiologia', 2),
(2, 'Pediatria', 3),
(3, 'Dermatologia', 4),
(4, 'Neurologia', 5);

-- Insertar datos en Medico
INSERT INTO Medico (id_medico, nombre, honorario, id_especialidad, sala_consulta, activo) VALUES
(201, 'Laura', 60.00, 1, 'A-12', TRUE),
(202, 'Carlos', 75.00, 1, 'A-14', TRUE),
(203, 'Elena', 55.00, 2, 'B-08', TRUE),
(204, 'Diego', 50.00, NULL, 'C-02', TRUE);

-- Insertar datos en Paciente
INSERT INTO Paciente (id_paciente, nombre, ciudad, correo, telefono) VALUES
(301, 'Sofia', 'Guayaquil', 'sofia@mail.com', '0991111111'),
(302, 'Andres', 'Quito', 'andres@mail.com', '0992222222'),
(303, 'Valeria', 'Cuenca', 'valeria@mail.com', '0993333333'),
(304, 'Mateo', 'Guayaquil', 'mateo@mail.com', NULL);

-- Insertar datos en Consulta
INSERT INTO Consulta (id_consulta, id_medico, id_paciente, fecha_consulta, costo, observacion) VALUES
(401, 201, 301, '2026-11-01', 60.00, 'Control'),
(402, 202, 302, '2026-11-02', 75.00, 'Revision'),
(403, 202, 303, '2026-11-03', 75.00, 'Seguimiento'),
(404, 203, 301, '2026-11-04', 55.00, 'Consulta inicial');