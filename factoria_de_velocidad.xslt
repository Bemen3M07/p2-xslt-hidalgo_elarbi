<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html> 
            <head>
                <title>Catálogo de Coches</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f5f5f5;
                        color: #333;
                        margin: 0;
                        padding: 20px;
                    }
                    h1 {
                        text-align: center;
                        color: #4CAF50;
                    }
                    .car-card {
                        background-color: #fff;
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        padding: 20px;
                        margin: 20px auto;
                        max-width: 600px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
                    .car-title {
                        font-size: 1.5em;
                        font-weight: bold;
                        color: #333;
                        margin-bottom: 10px;
                    }
                    .car-info, .version-info, .opinion-info, .media-info {
                        margin-bottom: 15px;
                    }
                    h3 {
                        color: #4CAF50;
                        margin-top: 0;
                    }
                    ul {
                        padding-left: 20px;
                    }
                    li {
                        line-height: 1.6;
                    }
                    .car-info p, .version-info p, .opinion-info p {
                        margin: 5px 0;
                    }
                    .car-card img {
                        border-radius: 5px;
                        max-width: 100%;
                        height: auto;
                        margin: 10px 0;
                    }
                    .media-info a {
                        color: #4CAF50;
                        text-decoration: none;
                    }
                    .media-info a:hover {
                        text-decoration: underline;
                    }
                    .strong {
                        font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <h1>Catálogo de Coches</h1>
                <div>
                    <!-- Llama al template de coches para cada uno -->
                    <xsl:apply-templates select="//coche" />
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
            <div class="car-info">
                <!-- Concesionarios -->
                <h3>Concesionarios</h3>
                <ul>
                    <xsl:for-each select="concesionarios/concesionario">
                        <li><xsl:value-of select="@nombre" /> - <xsl:value-of select="@ciudad" /> (<xsl:value-of select="@disponibilidad" />)</li>
                    </xsl:for-each>
                </ul>
            </div>

            <div class="version-info">
                <!-- Versiones del coche -->
                <h3>Versiones</h3>
                <xsl:for-each select="versiones/version">
                    <div>
                        <strong><xsl:value-of select="@nombre" /></strong> - Precio: <xsl:value-of select="precio" /> <xsl:value-of select="precio/@moneda" />
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
                <!-- Opiniones -->
                <h3>Opiniones</h3>
                <xsl:for-each select="opiniones/opinion">
                    <p><strong><xsl:value-of select="@autor" /></strong> - <xsl:value-of select="fecha" /></p>
                    <p>Calificación: <xsl:value-of select="calificacion" /></p>
                    <p><xsl:value-of select="comentario" /></p>
                </xsl:for-each>
            </div>

            <div class="media-info">
                <!-- Media -->
                <h3>Media</h3>
                <xsl:for-each select="media/imagen">
                    <img src="{@url}" alt="{@descripcion}" style="max-width:200px; max-height:150px;" />
                    <p><xsl:value-of select="@descripcion" /></p>
                </xsl:for-each>
                <xsl:for-each select="media/video">
                    <p><a href="{@url}">Ver video: <xsl:value-of select="@descripcion" /></a></p>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
