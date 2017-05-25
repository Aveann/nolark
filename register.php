<?php

require_once 'includes/db_settings.php'; //connexion to MySQL $dbc

$title = "S'inscrire sur le site Nolark";
$description = "S'inscrire sur le site Nolark";

//register process
include 'register_check.php';

//header
include 'includes/header.html';

//register form
include 'html/register.html';

//footer
include 'includes/footer.html';