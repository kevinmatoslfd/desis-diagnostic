<?php 

    /**
     * @function createTextInput
     * Crea un form-group para un @string label, @string id, @string placeholder, @string smallHelper
     */
    function createTextInput($type, $label, $id, $placeholder, $required = true, $smallHelper = null){
        $required = $required? 'required': '';

        echo '
            <div class="form-group">
                <label>'.$label.'</label>
                <input type="'.$type.'" class="form-control" id="input'.ucfirst($id).'" aria-describedby="'.$id.'Help" placeholder="'.$placeholder.'" '.$required.'>   
            ';

        // Crea un small helper si corresponde
        if(!is_null($smallHelper)) echo '<small id="'.$id.'Help" class="form-text text-muted">'.$smallHelper.'</small>';

        echo '
            <div class="invalid-feedback" id="'.$id.'-invalid-feedback"></div>
            </div>';
    }

    /**
     * @function createSelect
     * 
     */
    function createSelect($label, $id, $arr_data){
        echo '
            <div class="form-group">
                <label>'.$label.'</label>
                <select class="form-control" id="'.$id.'Select" data-live-search="true">
            ';

        foreach($arr_data as $key => $value){
            echo '<option value="'.$key.'">'.$value.'</option>';
        }

        echo '</select></div>';
    }

    /**
     * @function createCheckBox
     * 
     */
    function createCheckBox($type, $label, $grupo, $arr_data){
        echo '
            <div class="form-group">
                <label>'.$label.'</label>
            </div>
            ';
        foreach($arr_data as $id => $value){
            echo '
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="'.$id.'Check'.$grupo.'">
                    <label class="form-check-label" for="'.$id.'Check'.$grupo.'">'.$value.'</label>
                </div>
                ';
        }
    }

?>