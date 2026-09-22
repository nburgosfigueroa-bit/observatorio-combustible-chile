# Datos

Este repositorio **no contiene los archivos masivos originales**.

Los datos históricos deben descargarse desde la fuente oficial de la Comisión Nacional de Energía (CNE):

https://energiaabierta.cl/datasets-estadistica/precios-historicos-de-bencina-en-linea/

Estructura local sugerida:

```text
data/
├── raw/
└── processed/
```

- `data/raw/`: archivos originales descargados de la CNE.
- `data/processed/`: archivos generados por el ETL, por ejemplo Parquet.

Los archivos originales, Parquet, CSV masivos y bases DuckDB están excluidos mediante `.gitignore`.

## Principio de trazabilidad

La limpieza no reemplaza el dato original. El proyecto conserva la referencia al archivo de origen y utiliza banderas de calidad para distinguir registros válidos, dudosos o incompletos.
