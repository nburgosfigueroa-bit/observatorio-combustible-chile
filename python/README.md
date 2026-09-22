# Pipeline Python

El proyecto original se construyó de forma incremental mediante scripts numerados.

| Script | Propósito |
|---|---|
| `01_crear_base.py` | Crear DuckDB y control de proyecto |
| `02_auditar_2012.py` | Auditoría inicial del primer año |
| `03_cargar_2012.py` | Carga staging 2012 |
| `04_calidad_2012.py` | Validaciones SQL de calidad |
| `05_flags_calidad_2012.py` | Banderas de duplicado, precio, coordenadas y outliers |
| `06_comparar_esquemas.py` | Comparar estructura histórica y nueva |
| `07_inventario_archivos.py` | Inventario general de archivos |
| `08_etl_master.py` | Consolidación principal 2012–2026 |
| `09_inventario_combustibles.py` | Auditoría de combustibles |
| `10_normalizar_combustibles.py` | Normalización inicial |
| `10b_corregir_combustibles.py` | Corrección de duplicados de mapeo |
| `10c_revisar_no_mapeados.py` | Revisión de combustibles no homologados |
| `10d_mapear_electricidad.py` | Homologación de Electricidad |
| `11_auditar_geografia_marcas.py` | Auditoría geográfica y de marcas |
| `12_normalizar_geografia.py` | Normalización territorial |
| `12b_corregir_geografia.py` | Corrección robusta de claves geográficas |

## Próximo paso

Agregar los scripts productivos reales y parametrizarlos para que el pipeline pueda ejecutarse desde cero sobre los archivos oficiales.
