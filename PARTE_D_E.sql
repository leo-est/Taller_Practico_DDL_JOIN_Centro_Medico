-- ==========================================
-- PARTE D. VISTAS
-- ==========================================

-- D-01. Vista de médicos y especialidades

CREATE VIEW Vista_Medicos_Especialidad AS
SELECT
    Medico.id_medico,
    Medico.nombre AS nombre_medico,
    Medico.honorario,
    Especialidad.nombre AS especialidad
FROM Medico
LEFT JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad;

-- Verificar la vista D-01
SELECT * FROM Vista_Medicos_Especialidad;


-- D-02. Vista de consultas detalladas

CREATE VIEW Vista_Consultas_Detalle AS
SELECT
    Consulta.id_consulta,
    Medico.nombre AS nombre_medico,
    Paciente.nombre AS nombre_paciente,
    Consulta.fecha_consulta,
    Consulta.costo
FROM Consulta
INNER JOIN Medico
ON Consulta.id_medico = Medico.id_medico
INNER JOIN Paciente
ON Consulta.id_paciente = Paciente.id_paciente;

-- Verificar la vista D-02
SELECT * FROM Vista_Consultas_Detalle;


-- D-03. Eliminar la vista de consultas detalladas

DROP VIEW Vista_Consultas_Detalle;

-- ==========================================
-- PARTE E. DELETE, TRUNCATE Y DROP
-- ==========================================

-- E-01. Crear tabla auxiliar RegistroTemporal

CREATE TABLE RegistroTemporal (
    id INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

-- Insertar tres registros de prueba

INSERT INTO RegistroTemporal (id, descripcion) VALUES
(1, 'Primer registro'),
(2, 'Segundo registro'),
(3, 'Tercer registro');

-- Verificar los registros insertados
SELECT * FROM RegistroTemporal;


-- E-02. DELETE: eliminar únicamente el registro con id 2

DELETE FROM RegistroTemporal
WHERE id = 2;

-- Verificar que solamente queden dos registros
SELECT * FROM RegistroTemporal;


-- E-03. TRUNCATE: vaciar completamente la tabla

TRUNCATE TABLE RegistroTemporal;

-- Verificar que la tabla sigue existiendo, pero está vacía
SELECT * FROM RegistroTemporal;


-- E-04. DROP TABLE: eliminar la tabla auxiliar

DROP TABLE RegistroTemporal;


-- E-05. DROP INDEX: eliminar el índice compuesto

DROP INDEX idx_consulta_medico_fecha ON Consulta;


-- E-06. Comparación conceptual

-- DELETE elimina registros específicos cuando se utiliza WHERE;
-- TRUNCATE elimina todos los registros, pero conserva la estructura
-- de la tabla; DROP elimina completamente la tabla y su estructura.
