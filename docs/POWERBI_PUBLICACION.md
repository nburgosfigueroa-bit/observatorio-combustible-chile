# Publicación pública con Power BI + GitHub Pages

La página pública del proyecto ya está preparada en `docs/index.html`.

## Objetivo

Mostrar el informe Power BI dentro de una página pública conservando los mismos segmentadores y filtros del reporte:

- período
- combustible
- región
- comuna
- empresa

## Paso 1 - Publicar el informe en Power BI Service

Desde Power BI Desktop, publique el informe en Power BI Service.

## Paso 2 - Crear el vínculo público

En Power BI Service:

`Archivo > Insertar informe > Publicar en la web (público)`

Cree el código de inserción y copie la URL pública o el `src` del iframe.

## Paso 3 - Insertar la URL en GitHub Pages

En `docs/index.html`, ubicar:

```javascript
const POWER_BI_PUBLIC_URL = "";
```

y reemplazarlo por la URL pública:

```javascript
const POWER_BI_PUBLIC_URL = "https://app.powerbi.com/view?r=...";
```

El iframe conservará la experiencia interactiva de Power BI, incluidos segmentadores y filtros del informe.

## Paso 4 - Habilitar GitHub Pages

En GitHub:

1. Abrir el repositorio.
2. Ir a **Settings**.
3. Abrir **Pages**.
4. En **Build and deployment**, seleccionar **Deploy from a branch**.
5. Branch: **main**.
6. Folder: **/docs**.
7. Guardar.

La URL habitual será:

`https://nburgosfigueroa-bit.github.io/observatorio-combustible-chile/`

## Advertencia importante

**Publicar en la web** convierte el informe en contenido público y no requiere autenticación.

Antes de hacerlo, confirmar que el modelo no contiene:

- información privada
- datos personales
- información interna de una empresa
- credenciales
- rutas sensibles
- fuentes privadas

Este proyecto utiliza como fuente principal datos públicos de la Comisión Nacional de Energía, pero el modelo final debe revisarse antes de publicar.
