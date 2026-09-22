-- Observatorio de Combustibles Chile
-- Cobertura territorial por modalidad de atención.
--
-- El campo de atención está disponible de forma explícita principalmente
-- en el esquema 2023-2026, por lo que este análisis se concentra en ese período.

SELECT
    region_normalizada,
    comuna_normalizada,
    combustible,
    tipo_atencion,
    COUNT(DISTINCT id_estacion) AS estaciones
FROM master.vw_precios_geo
WHERE fecha_actualizacion >= DATE '2023-01-01'
  AND combustible IN ('Gasolina 93', 'Gasolina 95', 'Gasolina 97', 'Diésel')
GROUP BY
    region_normalizada,
    comuna_normalizada,
    combustible,
    tipo_atencion
ORDER BY
    region_normalizada,
    comuna_normalizada,
    combustible,
    estaciones DESC;
