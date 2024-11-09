<?php
// catalogo.php
$xml = new DOMDocument;
$xml->load('factoria_de_velocidad.xml');

$xsl = new DOMDocument;
$xsl->load('factoria_de_velocidad.xslt');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?>
