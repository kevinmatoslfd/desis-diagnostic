<?php
    include_once('./includes/constants.php');
?>

<html lang="es">
    <head>
        <title>Votación<?php echo $serverName ?></title>

        <!-- Estandar header, Charset, Estilos genéricos, Bootstrap 4 -->
        <?php include_once('./includes/header.php'); ?>

        <!-- Necesario para formulario, createInputs, SelectPicker -->
        <?php include_once('./includes/form.php'); ?>

        <!-- SweetAlert 2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <form>
            <div class="form-group">
                <h4>FORMULARIO DE VOTACIÓN</h4>
            </div>

            <?php createTextInput('text', 'Nombre y Apellido', 'nombreApellido', 'Ingresar Nombre y Apellido'); ?>

            <?php createTextInput('text', 'Alias', 'alias', 'Ingresar Alias', 'Su alias debe ser de al menos 5 caracteres, con letras y números.'); ?>
            
            <?php createTextInput('text', 'RUT', 'rut', 'Ingresar RUT'); ?>

            <?php createTextInput('email', 'Email', 'email', 'Ingresar Email'); ?>

            <div class="form-group">
                <label>Región</label>
                <select class="form-control" id="regionSelect" data-live-search="true">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group">
                <label>Comuna</label>
                <select class="form-control" id="comunaSelect" data-live-search="true">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group">
                <label>Candidato</label>
                <select class="form-control" id="candidatoSelect" data-live-search="true">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Cómo se enteró de Nosotros</label>
            </div>

            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="webCheckHow">
                <label class="form-check-label" for="webCheckHow">Web</label>
            </div>

            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="tvCheckHow">
                <label class="form-check-label" for="tvCheckHow">TV</label>
            </div>

            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="redesCheckHow">
                <label class="form-check-label" for="redesCheckHow">Redes Sociales</label>
            </div>

            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="amigoCheckHow">
                <label class="form-check-label" for="amigoCheckHow">Amigo</label>
            </div>

            <button type="submit" class="btn btn-primary">Votar</button>
        </form>
    </body>

    <script>
        $('select').selectpicker();
    </script>
</html>