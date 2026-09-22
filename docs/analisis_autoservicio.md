# Análisis Autoservicio vs. Asistido

## Pregunta central

**¿El autoservicio realmente significa pagar menos?**

El objetivo es comprobar con datos si las estaciones o modalidades de autoservicio presentan precios sistemáticamente menores que la atención asistida.

## Variables principales

- precio promedio autoservicio
- precio promedio asistido
- diferencia $/L
- diferencia porcentual
- cantidad de estaciones solo autoservicio
- cantidad de estaciones solo asistidas
- cantidad de estaciones con ambas modalidades

## Comparación correcta

Para evitar conclusiones engañosas, la comparación debe controlar al menos por:

- combustible
- período
- región
- comuna

Cuando sea posible, también puede controlarse por marca.

Comparar directamente promedios nacionales sin controlar territorio puede confundir una diferencia geográfica con una diferencia real de modalidad.

## Clasificación de estaciones

Dentro del contexto filtrado, cada estación se clasifica como:

1. **Solo asistida**
2. **Solo autoservicio**
3. **Ambas modalidades**

Las tres categorías son mutuamente excluyentes.

## Ventaja de autoservicio

Una medida útil es:

`Precio asistido - Precio autoservicio`

Interpretación:

- resultado positivo: autoservicio más barato
- cero: sin diferencia
- resultado negativo: autoservicio más caro

## Ranking territorial

El visual **Top 10 comunas donde más conviene autoservicio** utiliza la ventaja en $/L y debe:

- excluir comunas sin ambas referencias de precio
- considerar solo resultados positivos cuando la pregunta sea “dónde conviene más”
- reaccionar a los filtros de período, combustible, región y empresa

## Línea futura

El siguiente paso analítico es estudiar **persistencia temporal**: no basta con observar una diferencia en un solo período. Se debe medir en qué proporción de meses el autoservicio fue realmente más barato dentro del mismo territorio.
