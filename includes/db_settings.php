<?php

// ** MYSQL settings ** //

//MySQL hostname
DEFINE('DB_HOST', 'localhost');

//MySQL user
DEFINE('DB_USER', 'root');

//MySQL password
DEFINE('DB_PASS', '');

//MySQL database name
DEFINE('DB_NAME', 'nolark');

$dbc = new MySQLi(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if(mysqli_connect_error()){
	die('Erreur lors de la connexion à la base de données.');
} else {
	$dbc->set_charset('utf8');
}

mysqli_set_charset($dbc, 'utf8');

