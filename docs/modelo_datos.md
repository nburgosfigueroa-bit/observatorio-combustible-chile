# Modelo de datos

## Dimensiones

### `dim_fecha`

Campos típicos:

- mes
- año
- numero_mes
- nombre_mes
- mes_corto
- periodo
- periodo_orden

### `dim_combustible`

Homologa códigos y nombres históricos de combustible.

### `dim_geografia`

Contiene geografía normalizada para análisis territorial.

### `dim_estacion`

Identifica estaciones, dirección, comuna, región, coordenadas y atributos asociados.

### `dim_marca`

Consolida variantes textuales de marcas sin eliminar cambios históricos reales de operador.

## Tablas de hechos

### `fact_precios_mensuales`

Tabla central del dashboard.

Incluye o alimenta medidas relacionadas con:

- precio mediano
- precio asistido
- precio autoservicio
- precio mínimo disponible
- cobertura
- estaciones analizadas
- región / comuna / marca
- variaciones por período
- proyección referencial +12 meses

### `fact_mercado_comuna`

Resume condiciones de mercado por comuna y período.

### `fact_premium_marca`

Permite comparar el precio de una marca contra la mediana de su mercado local, evitando comparar directamente territorios con estructuras de precio distintas.

### `fact_variacion_yoy`

Soporta análisis de variaciones interanuales e históricos.

## Principio de modelado

El dashboard está diseñado para que los filtros de período, combustible, región, comuna y empresa interactúen con las medidas sin mezclar granularidades incompatibles.

## Nota sobre estaciones y modalidad

Una estación puede registrar atención asistida, autoservicio o ambas modalidades. Por eso, para análisis de composición, las categorías correctas son:

- solo asistida
- solo autoservicio
- ambas modalidades

Estas categorías son mutuamente excluyentes dentro del contexto de filtros seleccionado.
