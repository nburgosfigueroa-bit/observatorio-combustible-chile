# Metodología

## 1. Fuente

Los archivos históricos provienen de la Comisión Nacional de Energía (CNE), plataforma Energía Abierta / Bencina en Línea.

Período consolidado: **2012–2026**.

## 2. Auditoría inicial

Los archivos no poseen una única estructura durante todo el período.

### Esquema histórico 2012–2022

12 campos principales:

`id, razon_social, distribuidor, direccion_calle, direccion_numero, comuna, region, precio, fecha_actualizacion, combustible, latitud, longitud`

### Esquema 2023–2026

16 campos principales:

`codigo, razon_social, distribuidor, direccion, latitud, longitud, nom_comuna, nom_region, combustible, precio, unidad_cobro, atencion, fecha_actualizacion, hora_actualizacion, es_electrolinera, es_gasolinera`

Por esta razón fue necesaria una capa de homologación antes de consolidar.

## 3. ETL

### Extract

- lectura de archivos `.csv.bz2`
- detección de separador y esquema
- inventario por archivo y año

### Transform

- homologación de columnas
- conversión de tipos
- filtro por año correspondiente al archivo
- normalización de combustibles
- normalización territorial
- auditoría de variantes de marca
- creación de banderas de calidad

### Load

- carga a DuckDB
- exportación analítica a Parquet
- construcción de tablas de hechos y dimensiones para Power BI

## 4. Decisión metodológica central

Una fila del dataset fuente representa principalmente una **actualización o cambio de precio**, no necesariamente una observación diaria independiente.

Promediar directamente todas las filas produciría sesgo: una estación que actualiza el precio más veces tendría más peso que otra con menos eventos.

Por eso el análisis debe trabajar con una representación comparable por estación, combustible y período, por ejemplo:

- último precio válido del mes
- precio vigente en el tiempo
- snapshot mensual por estación
- mediana entre estaciones comparables

## 5. Normalización de combustibles

Combustibles principales del observatorio:

- Gasolina 93
- Gasolina 95
- Gasolina 97
- Diésel

Electricidad y otros combustibles pueden mantenerse para trazabilidad, pero se analizan por separado cuando sus unidades o comportamiento no son directamente comparables.

## 6. Normalización geográfica

Se corrigen variantes históricas de nombres regionales, acentos y espacios para obtener una geografía consistente.

Ejemplos:

- `Metropolitana de Santiago` → `Metropolitana`
- `Los Ríos` / `De los Ríos` → `Los Ríos`
- `Santiago Centro` → `Santiago`

## 7. Agregación

Para evitar sobreponderación por frecuencia de actualización, los indicadores de mercado se calculan a una granularidad comparable antes de agregar a comuna, región o marca.

La **mediana** se utiliza con frecuencia como medida robusta frente a valores extremos.

## 8. Proyección

La tarjeta de proyección +12 meses es una estimación referencial basada en el período seleccionado. **No reemplaza un modelo econométrico o de series de tiempo validado.**

La evolución futura del proyecto contempla:

- validación temporal
- baseline estacional
- ETS / SARIMA u otros métodos apropiados
- intervalos de predicción
- escenarios central, bajo y alto
