<?php
if(!isset($_SESSION['username'])){
    header('Location: ' . Home);
}

if($_SESSION['role'] != 'admin'){
    header('Location: ' . Home);
}
date_default_timezone_set('America/Chicago');
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="with=device-width, scale=1"/>
        <title>COSC 4806</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script src="http://localhost/cosc4806/public/js/cosc.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
            <div class="container-fluid">
                <div class="float-right">
                    <a class="navbar-brand" 
                       href="<?=Util::getHome();?>"><h2>COSC</h2></a>
                </div>

                <div class="float-right">
                    <span class="navbar-text">
                        <?php echo "Welcome " . $_SESSION['username']; ?>
                        <a href="<?= Util::userLogout(); ?>">Logout</a>
                    </span>
                </div>
            </div>
        </nav>
        <div class="container-fluid" style="padding-top: 100px;">
