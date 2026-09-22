# Medidas DAX — referencia

Este documento registra medidas utilizadas o propuestas en el dashboard. Los nombres de columnas pueden ajustarse según la versión final del modelo.

## Precio promedio asistido

```DAX
Precio Promedio Asistido =
AVERAGE(fact_precios_mensuales[precio_asistido])
```

## Precio promedio autoservicio

```DAX
Precio Promedio Autoservicio =
AVERAGE(fact_precios_mensuales[precio_autoservicio])
```

## Medida visual con formato moneda

```DAX
Precio Promedio Autoservicio Mostrar =
"$" &
FORMAT(
    AVERAGE(fact_precios_mensuales[precio_autoservicio]),
    "#,##0"
)
```

## Ventaja autoservicio $/L

```DAX
Ventaja Autoservicio $/L =
VAR Auto =
    AVERAGE(fact_precios_mensuales[precio_autoservicio])

VAR Asistido =
    AVERAGE(fact_precios_mensuales[precio_asistido])

RETURN
    IF(
        ISBLANK(Auto) || ISBLANK(Asistido),
        BLANK(),
        Asistido - Auto
    )
```

Interpretación:

- positivo → autoservicio más barato
- negativo → autoservicio más caro

## Solo asistidas

```DAX
Solo Asistidas =
COUNTROWS(
    FILTER(
        VALUES(fact_precios_mensuales[estacion_key]),
        CALCULATE(COUNT(fact_precios_mensuales[precio_asistido])) > 0
            &&
        CALCULATE(COUNT(fact_precios_mensuales[precio_autoservicio])) = 0
    )
)
```

## Solo autoservicio

```DAX
Solo Autoservicio =
COUNTROWS(
    FILTER(
        VALUES(fact_precios_mensuales[estacion_key]),
        CALCULATE(COUNT(fact_precios_mensuales[precio_autoservicio])) > 0
            &&
        CALCULATE(COUNT(fact_precios_mensuales[precio_asistido])) = 0
    )
)
```

## Ambas modalidades

```DAX
Ambas Modalidades =
COUNTROWS(
    FILTER(
        VALUES(fact_precios_mensuales[estacion_key]),
        CALCULATE(COUNT(fact_precios_mensuales[precio_asistido])) > 0
            &&
        CALCULATE(COUNT(fact_precios_mensuales[precio_autoservicio])) > 0
    )
)
```

## Título dinámico de proyección

```DAX
Título Precio Proyectado =
VAR FechaFin =
    MAXX(
        ALLSELECTED(dim_fecha[mes]),
        dim_fecha[mes]
    )

VAR FechaProyeccion =
    EDATE(FechaFin, 12)

RETURN
    "Precio proyectado · " &
    FORMAT(
        FechaProyeccion,
        "[$-es-CL]mmm yyyy"
    )
```

> Las medidas de presentación que usan `FORMAT()` devuelven texto. Para cálculos posteriores conviene conservar una medida numérica equivalente.
