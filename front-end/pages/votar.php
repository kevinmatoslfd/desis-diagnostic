<!-- Necesario para formulario, createInputs, SelectPicker -->
<?php include_once('./includes/form.php'); ?>

<!-- Se establece como para la votación de id 1 -->
<meta name="votacion" content="1">

<div class="row">
    <div class="col-6">
    <form>
        <div class="form-group">
            <h4>FORMULARIO DE VOTACIÓN</h4>
        </div>

        <?php createTextInput('text', 'Nombre y Apellido *', 'nombreApellido', 'Ingresar Nombre y Apellido'); ?>

        <?php createTextInput('text', 'Alias *', 'alias', 'Ingresar Alias', true,'Su alias debe ser de al menos 5 caracteres, con letras y números.'); ?>
        
        <?php createTextInput('text', 'RUT *', 'rut', 'Ingresar RUT', true, 'Su RUT debe estar sin puntos y con guión'); ?>

        <?php createTextInput('email', 'Email *', 'email', 'Ingresar Email'); ?>

        <?php //$arr_regiones = array(null => 'Seleccione una opción', '1' => 'Arica y Parinacota'); ?>
        <?php //createSelect('Región *', 'region', $arr_regiones); ?>

        <div class="form-group">
            <label>Región</label>
            <select class="form-control" id="regionSelect" data-live-search="true" onChange="getComunaByRegion()">

            </select>
        </div>
        <div class="form-group">
            <label>Comuna</label>
            <select class="form-control" id="comunaSelect" data-live-search="true" disabled>

            </select>
        </div>
        <div class="form-group">
            <label>Candidato</label>
            <select class="form-control" id="candidatoSelect" data-live-search="true">

            </select>
        </div>

        <div id="comoSeEntero">
            <div class="form-group">
                <label>Cómo se enteró de Nosotros * (Al menos 2 opciones)</label>
            </div>
        </div>

        <?php //$arr_enterarse = array('web' => 'Web', 'tv' => 'TV', 'redes' => 'Redes Sociales', 'amigo' => 'Amigo');?>
        <?php //createCheckBox('checkbox', 'Cómo se enteró de Nosotros *', 'How', $arr_enterarse); ?>

        <button type="submit" class="btn btn-primary">Votar</button>
    </form>
    </div>
</div>

<script>
    $(document).ready(function(){
        // Conseguir los registros correspondientes a los selects y checkbox
        getRegiones();
        getCandidatos();
        getComoEnterarse();
    });
</script>