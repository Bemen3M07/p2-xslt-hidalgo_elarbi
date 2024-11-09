[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/G9fQk55K) 
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=16836887&assignment_repo_type=AssignmentRepo)

# Factoria de Velocidad

Este proyecto es un catálogo de coches deportivos, mostrando información sobre diversas marcas y modelos de coches, junto con versiones, precios, características y opiniones de usuarios.

## Descripción

El archivo XML contiene un catálogo de coches de diferentes marcas y modelos. Cada coche tiene detalles como:

- **Marca** y **Modelo**
- **Año** de fabricación
- **Versiones** disponibles, con sus respectivos precios, colores, características del motor (potencia, tipo de motor, autonomía) y más.
- **Opiniones** de los usuarios, incluyendo comentarios y calificaciones.
- **Imágenes** relacionadas con cada coche.

Además, el archivo se encuentra preparado para su transformación con XSLT para crear una representación visual del catálogo en una página web.

## Estructura del Proyecto

El proyecto está compuesto por los siguientes elementos:

- **factoria_de_velocidad.xml**: El archivo principal que contiene el catálogo de coches.
- **factoria_de_velocidad.xslt**: Hoja de estilos XSLT que define cómo transformar los datos XML en una página web visualmente atractiva.
  
La información de cada coche está organizada en diferentes bloques, con comentarios explicativos para cada sección.

## ¿Cómo utilizar este proyecto?

### Requisitos

- Un navegador web moderno (para ver la transformación XSLT).
- Un editor de texto o IDE para visualizar o editar el código XML.

### Instrucciones

1. **Ver en el navegador**:
   - Si tienes el archivo `factoria_de_velocidad.xml` y `factoria_de_velocidad.xslt` en el mismo directorio, solo abre el archivo XML en tu navegador. El navegador aplicará automáticamente el XSLT y mostrará el contenido de manera visual.
  
2. **Modificar el catálogo**:
   - Puedes agregar, editar o eliminar coches, versiones, opiniones y cualquier otro dato directamente en el archivo XML.

3. **Ampliar el proyecto**:
   - Puedes agregar más coches y versiones al catálogo simplemente siguiendo la misma estructura XML.

## Ejemplo de uso

Aquí tienes un fragmento del archivo `factoria_de_velocidad.xml` con la descripción de un coche:

```xml
<coche id="1">
    <marca>Ford</marca>
    <modelo>Mustang GT</modelo>
    <año>2022</año>
    <versiones>
        <version nombre="GT Premium">
            <precio moneda="EUR">45000</precio>
            <color>Rojo</color>
            <motor>
                <tipo>V8</tipo>
                <cilindrada>5.0L</cilindrada>
                <potencia unidad="HP">450</potencia>
                <autonomia unidad="km">444</autonomia>
            </motor>
        </version>
    </versiones>
</coche>
