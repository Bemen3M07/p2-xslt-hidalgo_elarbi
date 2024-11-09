<?php
// procesar_compra.php

// Recoger los datos del formulario
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$telefono = $_POST['telefono'];
$coche = $_POST['coche'];
$version = $_POST['version'];
$pago = $_POST['pago'];
$comentarios = $_POST['comentarios'];

// Procesar la compra (aquí puedes añadir código para almacenar o enviar los datos)

// Mostrar un mensaje de confirmación
echo "<h1>Compra realizada con éxito</h1>";
echo "<p>Gracias, $nombre. Su solicitud de compra ha sido procesada.</p>";
echo "<p>Detalles:</p>";
echo "<ul>";
echo "<li>Coche: $coche</li>";
echo "<li>Versión: $version</li>";
echo "<li>Forma de Pago: $pago</li>";
echo "<li>Comentarios: $comentarios</li>";
echo "</ul>";
echo "<a href='factoria_de_velocidad.xslt'>Volver al catálogo</a>";
?>
