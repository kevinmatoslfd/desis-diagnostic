<?php
    include_once(dirname(__DIR__).'/includes/connection.php');

    $r = array();

    /**
     * @function getRegiones
     * Devuelve las Regiones registradas en la base de datos
     */
    function getRegiones(){
        global $conn;

        $sql = 'SELECT id, region FROM regiones';
        $result = $conn->query($sql);
        $res = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();

        return $res;
    }

    /**
     * @function getComunaByRegion
     * Devuelve las Comunas asociadas a una Región según su id
     */
    function getComunaByRegion($data){
        global $conn;

        $sql = 'SELECT id, comuna FROM comunas WHERE region_id = "'.$data['region_id'].'"';
        $result = $conn->query($sql);
        $res = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();

        return $res;
    }

    /**
     * @function getCandidatos
     * Devuelve los Candidatos registrados en la base de datos
     */
    function getCandidatos($data){
        global $conn;

        $sql = 'SELECT candidatos.id AS id, candidatos.candidato as candidato FROM `votacion_candidato` LEFT JOIN candidatos ON votacion_candidato.candidato_id = candidatos.id WHERE votacion_candidato.votacion_id='.$data['votacion_id'];
        $result = $conn->query($sql);
        $res = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();

        return $res;
    }

    /**
     * @function getComoEnterarse
     * Devuelve los tipos de cómo enterarse registrados en la base de datos
     */
    function getComoEnterarse(){
        global $conn;

        $sql = 'SELECT id, como, short_name FROM comoenterarse';
        $result = $conn->query($sql);
        $res = $result->fetchAll(PDO::FETCH_ASSOC);
        $result->closeCursor();
        return $res;
    }

    // Según la function parámetro se decide qué función asignar
    $function = $_POST['function'];
    switch($function){
        case 'getRegiones': $r = getRegiones(); break;
        case 'getComunaByRegion': $r = getComunaByRegion($_POST['data']); break;
        case 'getCandidatos': $r = getCandidatos($_POST['data']); break;
        case 'getComoEnterarse': $r = getComoEnterarse(); break;
        default: ;
    }

    echo json_encode($r);
?>