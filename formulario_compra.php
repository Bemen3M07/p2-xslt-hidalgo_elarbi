<?php
// formulario_compra.php
$cocheId = isset($_GET['cocheId']) ? $_GET['cocheId'] : '';

$xml = new DOMDocument;
$xml->load('factoria_de_velocidad.xml');

$xsl = new DOMDocument;
$xsl->load('compra_coche.xslt');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);
$proc->setParameter('', 'cocheId', $cocheId);

echo $proc->transformToXML($xml);
?>
