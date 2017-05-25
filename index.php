<?php 

require_once 'includes/db_settings.php'; //connexion to MySQL $dbc

$title = "Nolark Casques : Sécurité et confort, nos priorités !";
$description = "Découvrez des casques moto dépassant même les exigences des tests de sécurité. Tous les casques Nolark au meilleur prix et avec en prime la livraison gratuite !";

include 'includes/header.html';

include 'carousel.php';

include 'selection.php';

//script that call add_product.php to add a product to temporary cart
//and shows pop to signal that the product was added to the cart
$scripts[] = '<script src="js/add_product_popup.js"></script>';

include 'includes/footer.html';


//close mysqli connection
$dbc->close();
unset($dbc);