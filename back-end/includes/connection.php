<?php
    include_once(dirname(__DIR__).'/includes/constants.php');

    /*$mysqli = new mysqli($host, $username, $password, $db);
    if ($mysqli->connect_errno) {
        echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    }
    echo $mysqli->host_info . "\n";*/

    try{
        $conn = new PDO('mysql:host='.$host.';dbname='.$db, $username, $password);
    } catch(PDOException $e){
        die('Fallo al conectar con la base de datos: '.$e->getMessage());
    }
?>