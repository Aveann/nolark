<?php
require_once 'includes/db_settings.php'; //connexion to MySQL $dbc

$title = "Se connecter";
$description = "Se connecter sur le site Nolark";

//login process
include 'login_check.php';

//header
include 'includes/header.html';

//login form
include 'html/login.html';

//footer
include 'includes/footer.html';