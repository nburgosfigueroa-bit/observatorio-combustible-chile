# Observatorio de Combustibles Chile 🇨🇱⛽

Proyecto de análisis de datos orientado a transformar información histórica de precios de combustibles en una herramienta interactiva para apoyar decisiones de costos, planificación y comparación territorial.

## ¿Qué problema busca resolver?

El proyecto nace de preguntas simples y concretas:

- ¿Cómo ha cambiado el precio del combustible durante un período seleccionado?
- ¿Dónde conviene cargar dentro de una región o comuna?
- ¿Cuál es la brecha entre la estación más barata y la más cara?
- ¿Qué marcas, comunas o estaciones mantienen precios relativamente más bajos?
- ¿El autoservicio realmente significa pagar menos?
- ¿Qué precio referencial podría observarse 12 meses después del período analizado?

El objetivo no es solo visualizar datos, sino convertirlos en información útil para presupuestos, planificación de flotas, evaluación de costos y análisis de mercado.

## Datos

Fuente principal: **Comisión Nacional de Energía (CNE) — Energía Abierta / Bencina en Línea**.

- Período consolidado: **2012–2026**
- Registros consolidados: **5.373.956**
- Cobertura: estaciones de servicio a nivel nacional
- Combustibles principales: **Gasolina 93, Gasolina 95, Gasolina 97 y Diésel**
- Otros combustibles se conservan para trazabilidad, pero no necesariamente forman parte de todos los análisis.

Fuente pública:  
https://energiaabierta.cl/datasets-estadistica/precios-historicos-de-bencina-en-linea/

> Los archivos originales no se versionan en este repositorio debido a su tamaño. El repositorio documenta el proceso para reconstruir el dataset desde la fuente oficial.

## Metodología

Se implementó un proceso **ETL (Extract, Transform, Load)**:

1. **Extracción** de archivos históricos publicados por la CNE.
2. **Auditoría** de estructura, fechas, precios, coordenadas y duplicados.
3. **Homologación** de esquemas antiguos y nuevos.
4. **Normalización** de combustibles, regiones, comunas y marcas.
5. **Carga** a DuckDB.
6. **Construcción** de tablas analíticas mensuales.
7. **Modelado** para Power BI.
8. **Visualización** y creación de indicadores interactivos.

Una decisión metodológica clave fue evitar promediar directamente todos los registros originales. Los archivos históricos contienen principalmente **eventos de actualización de precios**, por lo que una estación que actualiza más veces podría quedar sobrerrepresentada. El modelo analítico trabaja a una granularidad comparable por estación, combustible y período.

Más detalle: [Metodología](docs/metodologia.md)

## Arquitectura

```text
Datos CNE (.csv.bz2)
        │
        ▼
      Python
  limpieza / ETL
        │
        ▼
      DuckDB
        │
        ├── Parquet
        │
        └── tablas analíticas
                │
                ▼
             Power BI
                │
                ▼
      Dashboard interactivo
```

Ver: [Arquitectura del proyecto](docs/arquitectura.md)

## Stack tecnológico

- **Python** — ETL, validaciones y automatización
- **DuckDB** — motor analítico local
- **SQL** — transformaciones y consultas
- **Parquet** — almacenamiento columnar
- **Power BI** — modelado y visualización
- **Excel / OneDrive** — apoyo operativo y revisión puntual

## Dashboard

### 1. Resumen Ejecutivo

Permite filtrar por período, combustible, región, comuna y empresa.

Responde preguntas como:

- ¿Cómo cambió el precio durante el período?
- ¿Cuál es el precio mediano?
- ¿Qué brecha existe entre la estación más cara y la más barata?
- ¿Dónde conviene cargar?
- ¿Cuál es una proyección referencial a 12 meses?

### 2. Autoservicio vs. Asistido

Segunda línea analítica orientada a estudiar:

- estaciones solo asistidas
- estaciones solo autoservicio
- estaciones con ambas modalidades
- precio promedio asistido
- precio promedio autoservicio
- comunas donde el autoservicio presenta mayor ventaja de precio
- persistencia de la ventaja en el tiempo

Ver: [Análisis Autoservicio vs. Asistido](docs/analisis_autoservicio.md)

## Modelo de datos

Principales entidades:

- `dim_combustible`
- `dim_estacion`
- `dim_fecha`
- `dim_geografia`
- `dim_marca`
- `fact_precios_mensuales`
- `fact_mercado_comuna`
- `fact_premium_marca`
- `fact_variacion_yoy`

Documentación:
- [Modelo de datos](docs/modelo_datos.md)
- [Diccionario de datos](docs/diccionario_datos.md)
- [Medidas DAX](docs/medidas_dax.md)
- [Dashboard Power BI](docs/dashboard_powerbi.md)

## Calidad de datos

Se controlan, entre otros:

- duplicados exactos
- precios nulos o no válidos
- coordenadas incompletas
- cambios de esquema
- normalización territorial
- variantes de marca
- combustibles no homologados
- observaciones fuera de rango para revisión

Las anomalías se **marcan antes de eliminarse**. La prioridad es conservar trazabilidad y evitar limpieza arbitraria.

Ver: [Calidad de datos](docs/calidad_datos.md)

## Estructura del repositorio

```text
observatorio-combustible-chile/
├── assets/                 # material visual del dashboard
├── data/                   # documentación de fuentes, no datos masivos
├── docs/                   # metodología y documentación técnica
├── powerbi/                # documentación del modelo Power BI
├── python/                 # guía de scripts ETL
├── sql/                    # consultas analíticas de referencia
├── .gitignore
├── PROJECT_STATUS.md
├── requirements.txt
└── README.md
```

## Documentación rápida

- [Fuentes](docs/fuentes.md)
- [Metodología ETL](docs/metodologia.md)
- [Arquitectura](docs/arquitectura.md)
- [Calidad de datos](docs/calidad_datos.md)
- [Modelo de datos](docs/modelo_datos.md)
- [Diccionario de datos](docs/diccionario_datos.md)
- [Dashboard Power BI](docs/dashboard_powerbi.md)
- [Medidas DAX](docs/medidas_dax.md)
- [Autoservicio vs. Asistido](docs/analisis_autoservicio.md)
- [Roadmap](docs/roadmap.md)
- [Estado actual](PROJECT_STATUS.md)

## Roadmap

Próximas líneas de análisis:

- autoservicio vs. atención asistida por comuna y marca
- persistencia de marcas sistemáticamente más económicas
- comunas con prima territorial de precio
- volatilidad de precios
- frecuencia de cambios de precio
- ahorro estimado por carga
- proyección 2027 con modelos de series de tiempo e intervalos de confianza
- validación temporal de modelos predictivos

Ver: [Roadmap](docs/roadmap.md)

## Autor

**Nicolás Burgos Figueroa**  
Proyecto personal de análisis de datos, automatización y Business Intelligence aplicado al mercado de combustibles en Chile.

---

**Información para decisiones que mueven a Chile.**
