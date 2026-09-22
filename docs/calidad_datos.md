# Calidad de datos

## Controles aplicados

- conteo de filas por archivo
- período mínimo y máximo
- valores nulos
- duplicados exactos
- precios menores o iguales a cero
- coordenadas faltantes
- valores extremos para revisión
- variantes de región y comuna
- combustibles sin homologar
- integridad entre tabla base y vistas normalizadas

## Resultados relevantes

La consolidación final contiene **5.373.956 registros** luego de filtrar cada archivo al año que corresponde.

Una auditoría inicial de 2012 detectó, entre otros:

- 251.917 registros originales
- 1.622 estaciones
- 299 comunas
- 16 regiones
- 307 duplicados exactos
- 5.216 precios menores o iguales a cero

Estas observaciones motivaron el uso de banderas de calidad y una estrategia conservadora: **marcar antes de eliminar**.

## Coordenadas

Para los combustibles objetivo se identificaron **1.485 registros con coordenadas incompletas** dentro de un universo de más de 4,7 millones de eventos objetivo. La cobertura geográfica es, por tanto, muy alta.

Los eventos con coordenadas faltantes no se eliminan automáticamente si todavía aportan información válida de precio.

## Valores extremos

Los outliers no se eliminan automáticamente. Deben revisarse en contexto de combustible, año y período para distinguir errores de datos de eventos reales.

## Principio general

La prioridad es conservar trazabilidad y evitar decisiones de limpieza arbitrarias. Cada transformación importante debe poder explicarse y reproducirse.
