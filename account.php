<?php


$title = 'Votre compte';
$description = "Consulter et éditer son compte";

include 'includes/header.html';

if(isset($_GET['id']) && isset($_SESSION['user_id'])){
	echo "Ceci est votre compte {$_SESSION['first_name']}";
} else {
	
}


include 'includes/footer.html';