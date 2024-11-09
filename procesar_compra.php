<?php
// Recoger los datos del formulario
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$telefono = $_POST['telefono'];
$coche = $_POST['coche'];
$version = $_POST['version'];
$pago = $_POST['pago'];
$comentarios = $_POST['comentarios'];

// Procesar la compra (aquí puedes añadir código para almacenar o enviar los datos)
// Ejemplo: Guardar en una base de datos o enviar un correo electrónico

// Mostrar un mensaje de confirmación
echo "<h1>Compra realizada con éxito</h1>";
echo "<p>Gracias, $nombre. Su solicitud de compra ha sido procesada.</p>";
echo "<p>Detalles:</p>";
echo "<ul>";
echo "<li><strong>Coche:</strong> $coche</li>";
echo "<li><strong>Versión:</strong> $version</li>";
echo "<li><strong>Forma de Pago:</strong> $pago</li>";
echo "<li><strong>Comentarios:</strong> $comentarios</li>";
echo "</ul>";
echo "<a href='factoria_de_velocidad.xml'>Volver al catálogo</a>";
?>
