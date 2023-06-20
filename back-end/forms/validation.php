<?php
    include_once(dirname(__DIR__).'/includes/connection.php');

    $patt5caracteres_an = '/^(?=[A-Za-z ]+[0-9]|[0-9]+[A-Za-z ])[A-Za-z0-9 ]{5,}$/';
    $pattEmail = '/^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/';

    $r = array();

    /**
     * @function haVotado
     * Determinar si un RUT ha votado o no.
     */
    function haVotado($data){
        global $conn;

        $sql = 'SELECT usuario_rut FROM votos WHERE usuario_rut = "'.$data['rut'].'" AND votacion_id='.$data['votacion_id'];
        $result = $conn->query($sql);
        $res = $result->rowCount();
        $result->closeCursor();
        
        return array($res);
    }

    /**
     * @function toVote
     * Llama a las validaciones PHP del formulario
     * Crea el voto en la base de datos
     */
    function toVote($data){
        global $conn;
        global $patt5caracteres_an;
        global $pattEmail;

        $respuesta = true;
        $respuesta_str = array();

        // Validar Nombre y apellido no vacío
        if(strlen(trim($data['nombreApellido'])) == 0){
            $respuesta = false;
            $respuesta_str[] = 'El nombre y apellido son inválidos.';
        }

        // Validar Alias al menos 5 caracteres no alfanuméricos
        if(!preg_match($patt5caracteres_an, trim($data['alias']))){
            $respuesta = false;
            $respuesta_str[] = 'El alias es inválido.';
        }

        // Validar RUT
        $haVotado = haVotado(['rut' => $data['rut'], 'votacion_id' => $data['votacion_id']]);
        if($haVotado[0] != 0){
            $respuesta = false;
            $respuesta_str[] = 'Este RUT ya ha votado.';
        }

        // Validar Correo
        if(!preg_match($pattEmail, trim($data['alias']))){
            $respuesta = false;
            $respuesta_str[] = 'El correo es inválido.';
        }

        // Validar Región
        if($data['region'] != null && $data['region'] != 'null'){
            $sql = 'SELECT  id FROM regiones WHERE id = '.$data['region'];
            $result = $conn->query($sql);
            if($result->rowCount() == 0){
                $respuesta = false;
                $respuesta_str[] = 'No se encontró la región seleccionada.';
            }
        }else{
            $respuesta = false;
            $respuesta_str[] = 'Debe seleccionar algún región.';
        }

        // Validar Comuna
        if($data['comuna'] != null && $data['comuna'] != 'null'){
            $sql = 'SELECT  id FROM comunas WHERE id = '.$data['comuna'];
            $result = $conn->query($sql);
            if($result->rowCount() == 0){
                $respuesta = false;
                $respuesta_str[] = 'No se encontró la comuna seleccionada.';
            }
        }else{
            $respuesta = false;
            $respuesta_str[] = 'Debe seleccionar alguna comuna.';
        }

        // Validar Candidato
        if($data['candidato'] != null && $data['candidato'] != 'null'){
            $sql = 'SELECT  id FROM candidatos WHERE id = '.$data['candidato'];
            $result = $conn->query($sql);
            if($result->rowCount() == 0){
                $respuesta = false;
                $respuesta_str[] = 'No se encontró el candidato seleccionado.';
            }
        }else{
            $respuesta = false;
            $respuesta_str[] = 'Debe seleccionar algún candidato.';
        }

        // Validar count
        if(count($data['how']) == 0){
            $respuesta = false;
            $respuesta_str[] = 'Debe seleccionar al menos 2 opciones en "Cómo se enteró de nosotros".';
        }

        if($respuesta){
            $sql = 'INSERT INTO votos (usuario_rut, votacion_id, candidato_id) VALUES ("'.$data['rut'].'", "'.$data['votacion_id'].'", "'.$data['candidato'].'")';
            if($conn->query($sql) == true){
                $respuesta_str[] = 'Voto emitido.';
            }else{
                $respuesta = false;
                $respuesta_str[] = 'Se produjo un error y no se pudo emitir el voto.';
            } 
        }

        return array($respuesta);
    }

    // Según la function parámetro se decide qué función asignar
    $function = $_POST['function'];
    switch($function){
        case 'haVotado': $r = haVotado($_POST['data']); break;
        case 'toVote': $r = toVote($_POST['data']); break;
        default: ;
    }

    echo json_encode($r);
?>