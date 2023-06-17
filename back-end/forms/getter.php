<?php
    include_once(dirname(__DIR__).'/includes/connection.php');

    $r = array();
    //print_r($_POST); die();

    function getRegiones(){
        global $conn;

        $sql = 'SELECT id, region FROM regiones';
        $result = $conn->query($sql);
        $res = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();

        return $res;
    }

    function getComoEnterarse(){
        global $conn;

        $sql = 'SELECT id, como, short_name FROM comoenterarse';
        $result = $conn->query($sql);
        $res = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();
        return $res;
    }

    $function = $_POST['function'];

    switch($function){
        case 'getRegiones': $r = getRegiones(); break;
        case 'getComoEnterarse': $r = getComoEnterarse(); break;
        default: ;
    }

    echo json_encode($r);
?>