<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html> 
            <head>
                <title>Catálogo de Coches</title>
                <!-- Enlazamos el archivo CSS externo -->
                <link rel="stylesheet" type="text/css" href="media/css/styles.css"/>
            </head>
            <body>
                <h1>Catálogo de Coches</h1>
                <div>
                    <!-- Llama al template de coches para cada uno -->
                    <xsl:apply-templates select="/factoria_de_velocidad/catalogo_coches/coche" />
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Template para cada coche -->
    <xsl:template match="coche">
        <div class="car-card">
            <div class="car-title">
                <xsl:value-of select="marca" /> <xsl:value-of select="modelo" /> (<xsl:value-of select="año" />)
            </div>
            <div class="version-info">
                <h3>Versiones</h3>
                <xsl:for-each select="versiones/version">
                    <div>
                        <strong><xsl:value-of select="@nombre" /></strong> - Precio: 
                        <xsl:value-of select="precio" /> 
                        <xsl:value-of select="precio/@moneda" />
                        <p>Color: <xsl:value-of select="color" /></p>
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

            <div class="opinion-info">
                <h3>Opiniones</h3>
                <xsl:for-each select="opiniones/opinion">
                    <article>
                        <p><strong><xsl:value-of select="@autor" /></strong> - <xsl:value-of select="fecha" /></p>
                        <p>Calificación: <xsl:value-of select="calificacion" /></p>
                        <p><xsl:value-of select="comentario" /></p>
                    </article>
                </xsl:for-each>
            </div>

            <div class="media-info">
                <h3>Media</h3>
                <xsl:for-each select="media/imagen">
                    <img src="{@src}" alt="Imagen del coche"/>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
