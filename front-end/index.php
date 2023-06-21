<?php
    include_once('./includes/constants.php');
?>

<html lang="es">
    <head>
        <title>Votación<?php echo $serverName ?></title>

        <!-- Estandar header, Charset, Estilos genéricos, Bootstrap 4 -->
        <?php include_once('./includes/header.php'); ?>

        <!-- SweetAlert 2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <div class="container">
            <?php include_once('./pages/votar.php'); ?>
        </div>
    </body>

    <script src="./js/functions.js"></script>
</html>