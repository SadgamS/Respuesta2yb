<?php
    include("cod/notas.php");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <title>Cantidad De Aprobados</title>
</head>
<body>
    <!-- Titulo de la pagina -->
    <div class="titulo">
        <h1>Cantidad de Aprobados</h1>
    </div>
<div class="contenedor">
    
        <h4>Tabla de resultados</h4>
        <table>
            <caption>Datos por Departamento</caption>
            <tr>
                <!-- Extrancion de los datos para mostrar  -->
                <?php 
                    foreach ($depto as $cod => $depart) {
                        echo '<td>'.$depart.'</td>';
                    }
                ?>
                
            </tr>
            <tr>
                <!-- Extrancion de los datos para mostrar  -->
                <?php 
                    foreach ($cantidad as $cod => $cant) {
                         echo '<td>'.$cant.'</td>';
                    }
                ?>

            </tr>
                
        </table>
        <p>
            Estos datos 
            fueron procesados con PHP
        </p>
    </div>
</body>
</html>