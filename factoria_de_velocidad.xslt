<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template principal que define la estructura base de la página -->
    <xsl:template match="/">
        <html> 
            <head>
                <title>Catálogo de Coches</title>
                <!-- Enlace al archivo CSS externo para aplicar estilos a la página -->
                <link rel="stylesheet" type="text/css" href="media/css/styles.css"/>
            </head>
            <body>
                <h1>Catálogo de Coches</h1>
                <div>
                    <!-- Aplica el template "coche" para cada coche en el catálogo -->
                    <xsl:apply-templates select="/factoria_de_velocidad/catalogo_coches/coche" />
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Template que define cómo se muestra cada coche -->
    <xsl:template match="coche">
        <div class="car-card">
            <!-- Muestra la marca, el modelo y el año del coche en un solo bloque -->
            <div class="car-title">
                <xsl:value-of select="marca" /><xsl:text> </xsl:text><xsl:value-of select="modelo" /> (<xsl:value-of select="año" />)
            </div>
            
            <!-- Sección para mostrar la información de las versiones del coche -->
            <div class="version-info">
                <h3>Versiones</h3>
                <!-- Bucle para cada versión del coche -->
                <xsl:for-each select="versiones/version">
                    <div>
                        <!-- Muestra el nombre de la versión y el precio -->
                        <strong><xsl:value-of select="@nombre" /></strong> - Precio: 
                        <xsl:value-of select="precio" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="precio/@moneda" />
                        
                        <!-- Muestra el color de la versión -->
                        <p>Color: <xsl:value-of select="color" /></p>
                        
                        <!-- Muestra la información del motor, incluyendo tipo, cilindrada (si existe), potencia y autonomía (si existe) -->
                        <p>Motor: <xsl:value-of select="motor/tipo" />
                            <xsl:if test="motor/cilindrada">
                                <xsl:text> - Cilindrada: </xsl:text><xsl:value-of select="motor/cilindrada" />
                            </xsl:if>
                            <xsl:text> - Potencia: </xsl:text><xsl:value-of select="motor/potencia" /> <xsl:value-of select="motor/potencia/@unidad" />
                            <xsl:if test="motor/autonomia">
                                <xsl:text> - Autonomía: </xsl:text><xsl:value-of select="motor/autonomia" /> <xsl:value-of select="motor/autonomia/@unidad" />
                            </xsl:if>
                        </p>
                    </div>
                </xsl:for-each>
            </div>

            <!-- Sección para mostrar las opiniones sobre el coche -->
            <div class="opinion-info">
                <h3>Opiniones</h3>
                <!-- Bucle para cada opinión -->
                <xsl:for-each select="opiniones/opinion">
                    <article>
                        <!-- Muestra el autor y la fecha de la opinión -->
                        <p><strong><xsl:value-of select="@autor" /></strong> - <xsl:value-of select="fecha" /></p>
                        <!-- Muestra la calificación de la opinión -->
                        <p>Calificación: <xsl:value-of select="calificacion" /></p>
                        <!-- Muestra el comentario de la opinión -->
                        <p><xsl:value-of select="comentario" /></p>
                    </article>
                </xsl:for-each>
            </div>

            <!-- Sección para mostrar las imágenes del coche -->
            <div class="media-info">
                <h3>Media</h3>
                <!-- Bucle para cada imagen en la sección "media" -->
                <xsl:for-each select="media/imagen">
                    <img src="{@src}" alt="Imagen del coche"/>
                </xsl:for-each>
            </div>

            <!-- Enlace al formulario de compra del coche, pasando el ID del coche como parámetro -->
            <div>
                <a href="formulario_compra.php?cocheId={@id}">Comprar este coche</a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
