<?php 

    /**
     * Crea un form-group para un @string label, @string id, @string placeholder, @string smallHelper
     */
    function createTextInput($type, $label, $id, $placeholder, $smallHelper = null){

        echo '
            <div class="form-group">
                <label>'.$label.'</label>
                <input type="'.$type.'" class="form-control" id="input'.ucfirst($id).'" aria-describedby="'.$id.'Help" placeholder="'.$placeholder.'">   
            ';

        // Crea un small helper si corresponde
        if(!is_null($smallHelper)) echo '<small id="'.$id.'Help" class="form-text text-muted">'.$smallHelper.'</small>';

        echo '</div>';
    }

    function createCheckBox(){
        
    }

?>