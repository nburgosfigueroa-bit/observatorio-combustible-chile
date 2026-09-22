# Diccionario de datos

## Tabla maestra de eventos

La consolidación principal normaliza ambos esquemas históricos en una estructura común.

| Campo | Descripción |
|---|---|
| `id_estacion` | Identificador de estación proveniente de la fuente |
| `razon_social` | Razón social informada |
| `distribuidor` | Marca o distribuidor informado en el evento |
| `direccion` | Dirección de la estación |
| `comuna` | Comuna normalizada o de origen según la capa |
| `region` | Región normalizada o de origen según la capa |
| `combustible_origen` | Código o nombre original del combustible |
| `precio` | Precio informado en el evento |
| `fecha_actualizacion` | Fecha de actualización del precio |
| `hora_actualizacion` | Hora de actualización cuando la fuente la incluye |
| `latitud` | Latitud informada |
| `longitud` | Longitud informada |
| `unidad_cobro` | Unidad de cobro cuando está disponible |
| `tipo_atencion` | Modalidad de atención: asistido, autoservicio u otra |
| `es_electrolinera` | Indicador de electrolinera en el esquema nuevo |
| `es_gasolinera` | Indicador de gasolinera en el esquema nuevo |
| `anio_archivo` | Año nominal del archivo procesado |
| `archivo_origen` | Archivo fuente para trazabilidad |
| `esquema_origen` | Esquema histórico o nuevo |

## Dimensión combustible

Campos relevantes:

- combustible origen
- combustible normalizado
- familia
- octanaje
- atención por defecto cuando corresponde
- indicador de combustible objetivo principal

## Dimensión estación

Campos típicos:

- `estacion_key`
- `id_estacion`
- dirección
- comuna
- región
- latitud
- longitud
- razón social
- atributos históricos de la estación

## Tabla mensual analítica

`fact_precios_mensuales` alimenta el dashboard y contiene o soporta:

- mes
- combustible
- estación
- geografía
- marca
- precio de referencia
- precio asistido
- precio autoservicio
- precio mínimo disponible
- cobertura
- medidas de variación y brecha

## Nota metodológica

Los campos del evento original no deben interpretarse automáticamente como una observación diaria. La frecuencia de actualización varía entre estaciones, por lo que las comparaciones se realizan después de construir una granularidad analítica comparable.
