<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="cocheId"/> <!-- Parámetro cocheId recibido desde el catálogo -->

    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Formulario de Compra de Coche</title>
            </head>
            <body>
                <h1>Formulario de Compra de Coche</h1>
                
                <form action="procesar_compra.php" method="post">
                    
                    <!-- Datos del cliente -->
                    <label for="nombre">Nombre Completo:</label>
                    <input type="text" id="nombre" name="nombre" required/>
                    <br/>
                    
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" id="correo" name="correo" required />
                    <br/>
                    
                    <label for="telefono">Teléfono de Contacto:</label>
                    <input type="tel" id="telefono" name="telefono" required />
                    <br/>
                    
                    <!-- Coche seleccionado -->
                    <label for="coche">Seleccione el Coche:</label>
                    <select id="coche" name="coche" required>
                        <xsl:for-each select="factoria_de_velocidad/catalogo_coches/coche[@id=$cocheId]">
                            <option value="{@id}">
                                <xsl:value-of select="concat(marca, ' ', modelo, ' (', año, ')')" />
                            </option>
                        </xsl:for-each>
                    </select>
                    <br/>
                    
                    <!-- Versión del coche -->
                    <label for="version">Seleccione la Versión:</label>
                    <select id="version" name="version" required>
                        <xsl:for-each select="factoria_de_velocidad/catalogo_coches/coche[@id=$cocheId]/versiones/version">
                            <option value="{@nombre}">
                                <xsl:value-of select="@nombre" /> - <xsl:value-of select="precio" /> 
                                <xsl:value-of select="precio/@moneda"/>
                            </option>
                        </xsl:for-each>
                    </select>
                    <br/>
                    
                    <!-- Forma de Pago -->
                    <label for="pago">Forma de Pago:</label>
                    <select id="pago" name="pago" required>
                        <option value="Efectivo">Efectivo</option>
                        <option value="Tarjeta">Tarjeta de Crédito</option>
                        <option value="Financiamiento">Financiamiento</option>
                    </select>
                    <br/>
                    
                    <!-- Comentarios -->
                    <label for="comentarios">Comentarios Adicionales:</label>
                    <textarea id="comentarios" name="comentarios"></textarea>
                    <br/>
                    
                    <!-- Botones de Envío -->
                    <button type="submit">Enviar</button>
                    <button type="reset">Limpiar</button>
                </form>

                <!-- Enlace para volver al catálogo -->
                <div>
                    <a href="factoria_de_velocidad.xslt">Volver al Catálogo</a>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
