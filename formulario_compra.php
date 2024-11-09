<?php
// Obtener el ID del coche de la URL
$cocheId = $_GET['cocheId'];

// Cargar el archivo XML
$xml = simplexml_load_file('factoria_de_velocidad.xml');

// Buscar el coche por ID
$coche = $xml->xpath("/factoria_de_velocidad/catalogo_coches/coche[@id='$cocheId']")[0];
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Compra</title>
    <link rel="stylesheet" href="media/css/styles.css">
</head>
<body>
    <h1>Formulario de Compra del Coche</h1>
    
    <div class="car-details">
        <h2><?php echo $coche->marca . ' ' . $coche->modelo . ' (' . $coche->año . ')'; ?></h2>
        <p><strong>Precio:</strong> <?php echo $coche->versiones->version[0]->precio . ' ' . $coche->versiones->version[0]->precio['moneda']; ?></p>
        <p><strong>Color:</strong> <?php echo $coche->versiones->version[0]->color; ?></p>
        <p><strong>Motor:</strong> <?php echo $coche->versiones->version[0]->motor->tipo; ?>, <?php echo $coche->versiones->version[0]->motor->cilindrada; ?>, <?php echo $coche->versiones->version[0]->motor->potencia . ' ' . $coche->versiones->version[0]->motor->potencia['unidad']; ?></p>
    </div>

    <h3>Detalles de Compra</h3>
    <form action="procesar_compra.php" method="post">
        <input type="hidden" name="coche" value="<?php echo $coche->marca . ' ' . $coche->modelo; ?>">
        <input type="hidden" name="version" value="<?php echo $coche->versiones->version[0]['nombre']; ?>">

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        
        <label for="correo">Correo Electrónico:</label>
        <input type="email" id="correo" name="correo" required>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" required>

        <label for="pago">Forma de Pago:</label>
        <select id="pago" name="pago" required>
            <option value="Tarjeta">Tarjeta</option>
            <option value="Transferencia">Transferencia</option>
            <option value="PayPal">PayPal</option>
        </select>

        <label for="comentarios">Comentarios:</label>
        <textarea id="comentarios" name="comentarios"></textarea>

        <button type="submit">Realizar Compra</button>
    </form>
</body>
</html>
