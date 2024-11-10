<?php
// Recoger los datos del formulario
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$telefono = $_POST['telefono'];
$coche = $_POST['coche'];
$version = $_POST['version'];
$pago = $_POST['pago'];
$comentarios = $_POST['comentarios'];

// Mostrar un mensaje de confirmación
echo "
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <title>Compra Realizada</title>
    <link rel='stylesheet' href='media/css/styles.css'>
</head>
<body>
    <div class='car-details confirmation'>
        <h1>Compra realizada con éxito</h1>
        <p>Gracias, $nombre. Su solicitud de compra ha sido procesada con éxito.</p>
        <h3>Detalles de la Compra</h3>
        <ul class='confirmation-list'>
            <li><strong>Coche:</strong> $coche</li>
            <li><strong>Versión:</strong> $version</li>
            <li><strong>Forma de Pago:</strong> $pago</li>
            <li><strong>Comentarios:</strong> $comentarios</li>
        </ul>
        <a href='factoria_de_velocidad.xml' class='back-button'>Volver al catálogo</a>
    </div>
</body>
</html>
";
?>
