<?php
    //Archivo para la conexion a la base de datos 
    $conn = mysqli_connect("localhost","root","");
    mysqli_select_db($conn, "academico");
?>