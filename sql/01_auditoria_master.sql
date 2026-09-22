-- Observatorio de Combustibles Chile
-- Controles básicos de integridad del master

-- Total consolidado esperado al cierre de la carga 2012-2026:
-- 5.373.956 registros.

SELECT
    COUNT(*) AS registros_master
FROM master.precios_eventos;

SELECT
    anio_archivo,
    COUNT(*) AS registros
FROM master.precios_eventos
GROUP BY anio_archivo
ORDER BY anio_archivo;

SELECT
    MIN(fecha_actualizacion) AS fecha_minima,
    MAX(fecha_actualizacion) AS fecha_maxima,
    COUNT(DISTINCT id_estacion) AS estaciones
FROM master.precios_eventos;

-- Control de integridad después de normalizar combustibles.
SELECT
    (SELECT COUNT(*) FROM master.precios_eventos) AS eventos_base,
    (SELECT COUNT(*) FROM master.vw_precios_normalizados) AS eventos_normalizados;
