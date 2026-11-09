-- C-01 INNER JOIN 
SELECT
  Medico.id_medico,
  Medico.nombre AS nombre_medico,
  Especialidad.nombre AS especialidad
FROM Medico
INNER JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad; 

--C-02 LEFT JOIN
SELECT
  Medico.id_medico,
  Medico.nombre AS nombre_medico,
  Especialidad.nombre AS especialidad
FROM Medico
LEFT JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad;

-- C-03 RIGHT JOIN 
SELECT
  Especialidad.id_especialidad,
  Especialidad.nombre AS especialidad,
  Medico.id_medico,
  Medico.nombre AS nombre_medico
FROM Medico
RIGHT JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad;

-- C-04 JOIN DE 3 TABLAS
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

-- C-05 JOIN + WHERE
SELECT 
  Medico.nombre AS nombre_medico,
  Especialidad.nombre AS especialidad,
  Medico.honorario
FROM Medico
INNER JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad
WHERE Medico.honorario > 55;

-- C-06 JOIN + ORDER BY
SELECT
  Medico.id_medico,
  Medico.nombre AS nombre_medico,
  Especialidad.nombre AS especialidad,
  Medico.honorario
FROM Medico
LEFT JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad
ORDER BY Medico.honorario DESC;

-- C-07 FULL OUTER JOIN SIMULADO
SELECT
  Medico.id_medico,
  Medico.nombre AS nombre_medico,
  Especialidad.id_especialidad,
  Especialidad.nombre AS especialidad
FROM Medico
LEFT JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad

UNION ALL

SELECT
  Medico.id_medico,
  Medico.nombre AS nombre_medico,
  Especialidad.id_especialidad,
  Especialidad.nombre AS especialidad
FROM Medico
RIGHT JOIN Especialidad
ON Medico.id_especialidad = Especialidad.id_especialidad
WHERE Medico.id_medico IS NULL; 
