<!-- Necesario para formulario, createInputs, SelectPicker -->
<?php include_once('./includes/form.php'); ?>

<!-- Se establece como para la votación de id 1 -->
<meta name="votacion" content="1">

<div class="row">
    <div class="col-6">
    <form onsubmit="return false;">
        <div class="form-group">
            <h4>FORMULARIO DE VOTACIÓN</h4>
        </div>

        <?php /*createTextInput('text', 'Nombre y Apellido *', 'nombreApellido', 'Ingresar Nombre y Apellido'); ?>

        <?php createTextInput('text', 'Alias *', 'alias', 'Ingresar Alias', true,'Su alias debe ser de al menos 5 caracteres, con letras y números.'); ?>
        
        <?php createTextInput('text', 'RUT *', 'rut', 'Ingresar RUT', true, 'Su RUT debe estar sin puntos y con guión'); ?>

        <?php createTextInput('email', 'Email *', 'email', 'Ingresar Email'); */?>
        
        <?php createTextInput('text', 'Nombre y Apellido *', 'nombreApellido', 'Ingresar Nombre y Apellido', false); ?>

        <?php createTextInput('text', 'Alias *', 'alias', 'Ingresar Alias', false,'Su alias debe ser de al menos 5 caracteres, con letras y números.'); ?>
        
        <?php createTextInput('text', 'RUT *', 'rut', 'Ingresar RUT', false, 'Su RUT debe estar sin puntos y sin guión'); ?>

        <?php createTextInput('email', 'Email *', 'email', 'Ingresar Email', false); ?>

        <?php //$arr_regiones = array(null => 'Seleccione una opción', '1' => 'Arica y Parinacota'); ?>
        <?php //createSelect('Región *', 'region', $arr_regiones); ?>

        <div class="form-group">
            <label>Región</label>
            <select class="form-control" id="regionSelect" data-live-search="true" onChange="getComunaByRegion()">

            </select>
            <div class="invalid-feedback" id="regionSelect-invalid-feedback">
            </div>
        </div>
        <div class="form-group">
            <label>Comuna</label>
            <select class="form-control" id="comunaSelect" data-live-search="true" disabled>

            </select>
            <div class="invalid-feedback" id="comunaSelect-invalid-feedback">
            </div>
        </div>
        <div class="form-group">
            <label>Candidato</label>
            <select class="form-control" id="candidatoSelect" data-live-search="true">

            </select>
            <div class="invalid-feedback" id="candidatoSelect-invalid-feedback">
            </div>
        </div>

        <div id="comoSeEntero">
            <div class="form-group">
                <label>Cómo se enteró de Nosotros * (Al menos 2 opciones)</label>
            </div>

            <div class="invalid-feedback" id="How-invalid-feedback"></div>
        </div>

        <?php //$arr_enterarse = array('web' => 'Web', 'tv' => 'TV', 'redes' => 'Redes Sociales', 'amigo' => 'Amigo');?>
        <?php //createCheckBox('checkbox', 'Cómo se enteró de Nosotros *', 'How', $arr_enterarse); ?>

        <button type="submit" class="btn btn-primary" id="votarFormSubmit" onclick="enviarVoto()">Votar</button>
    </form>
    </div>
</div>

<script>
    $(document).ready(function(){   
        // Obliga a que en el input de RUT solo puedan ingresar números y K
        document.getElementById('inputRut').addEventListener('keypress', function(e) {
            if (!/\d+|k/i.test(e.key)) e.preventDefault();
        });

        // Conseguir los registros correspondientes a los selects y checkbox
        getRegiones();
        getCandidatos();
        getComoEnterarse();
    });
</script>