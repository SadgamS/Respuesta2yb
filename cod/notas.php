<?php
    include("conexion.php"); //Incluimos los datos de la conxion a bd

      //Definimos la variable sql para hacer las consultas
      $sql= "SELECT lugar_red,nota FROM identificador i, notas n WHERE i.ci = n.ci";

      // Variable en donde se gurda el resultado de la consulta en la bd
      $resultado = mysqli_query($conn, $sql);
      
      //Definimos los arrays para mostrar al usuario
      $depto = array(
                '01' => 'Chuquisaca',
                '02' => 'La Paz',
                '03' => 'Cochabamba',
                '04' => 'Oruro',
                '05' => 'Potosi',
                '06' => 'Tarija',
                '07' => 'Santa Cruz',
                '08' => 'Beni',
                '09' => 'Pando'

      );
      $cantidad = array(
                '01' => 0,
                '02' => 0,
                '03' => 0,
                '04' => 0,
                '05' => 0,
                '06' => 0,
                '07' => 0,
                '08' => 0,
                '09' => 0

      );

      // Creamos dos arrays para guardar la informacion de la bd
      $dep = array();
      $nota = array();
     while ($fila = $resultado -> fetch_assoc()) {
         array_push($dep,$fila["lugar_red"]);
         array_push($nota,$fila["nota"]); 

     }
     //Contandor de materias aprobadas
     $c=0;
     
     //Recorremos el array cantidad el cual contiena la cantidad
     // de departamos y su numero de aprobados
        foreach ($cantidad as $key => $value) {
            //recorremos el array de dep el cual contiene la informacion
            //extraida de la bd
           for ($i=0; $i < count($dep); $i++) { 
               //verficicamos si el departamento es igual al de la base de datos
               if ($key == $dep[$i]) {
                   //Si es igual consultamos si aprobo
                   if ($nota[$i] >= 51) {
                       //Incrementamos el contador
                       $c= $c + 1;
                   }
               }
           }
           // una vez de terminar con el primer departamento 
           //guardamos la cantidad de aprobados 
           $cantidad[$key]=$c;
           //reiniciamos el contador
           $c=0;
           //Seguimos con el siguiente dep.
        }
 


?>