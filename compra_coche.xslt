<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Formulario de Compra de Coche</title>
            </head>
            <body>
                <h1>Formulario de Compra de Coche</h1>
                
                <form action="procesar_compra.php" method="post">
                    
                    <!-- Nombre completo -->
                    <label for="nombre">Nombre Completo:</label>
                    <input type="text" id="nombre" name="nombre" required />
                    <br/>
                    
                    <!-- Correo Electrónico -->
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" id="correo" name="correo" required />
                    <br/>
                    
                    <!-- Teléfono de Contacto -->
                    <label for="telefono">Teléfono de Contacto:</label>
                    <input type="tel" id="telefono" name="telefono" required />
                    <br/>
                    
                    <!-- Selección de Coche -->
                    <label for="coche">Seleccione el Coche:</label>
                    <select id="coche" name="coche" required>
                        <xsl:for-each select="factoria_de_velocidad/catalogo_coches/coche">
                            <option value="{@id}">
                                <xsl:value-of select="concat(marca, ' ', modelo, ' (', año, ')')" />
                            </option>
                        </xsl:for-each>
                    </select>
                    <br/>
                    
                    <!-- Selección de Versión -->
                    <label for="version">Seleccione la Versión:</label>
                    <select id="version" name="version" required>
                        <xsl:for-each select="factoria_de_velocidad/catalogo_coches/coche/versiones/version">
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
                    
                    <!-- Comentarios Adicionales -->
                    <label for="comentarios">Comentarios Adicionales:</label>
                    <textarea id="comentarios" name="comentarios"></textarea>
                    <br/>
                    
                    <!-- Botones de Envío -->
                    <button type="submit">Enviar</button>
                    <button type="reset">Limpiar</button>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
