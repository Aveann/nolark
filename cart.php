<?php
//start session
if(!isset($_SESSION)){
	session_start();
}
	require_once 'includes/db_settings.php'; //connexion to MySQL $dbc

	//include objects:
	include_once "objects/product_class.php"; //"Produit" -> product to display
	include_once "objects/product_view_class.php";

	$product = new Product($dbc);
	$product_view = new ProductView('html/product_cart.html');
	
	if(isset($_SESSION['cart'])){
		foreach($_SESSION['cart'] as $id => $v){
			$ids[] = $id;
		}
		if(!empty($ids)){
			$result = $product->select_products_by_id($ids);
		}
	}
	
	$total = 0;
	

$css = 'cart.css';

$scripts[] = '<script src="js/cart_update.js"></script>';

include 'includes/header.html';	
?>

<div id="cart_block">
	<?php
		if(!empty($ids)){
			while($row = $result->fetch_assoc()){

				$product_view->get_view($row);
				$total += $row['prix'] * $_SESSION['cart'][$row['produit_id']];
			} 
			echo '<div class="amount">
					<p>Total: <span id="total">' . $total . '</span> €</p>
				</div>';
		} else {
				echo '<div class="error message" style="margin-top:30px;"><p>Il n\'y a aucun produit dans votre panier </p>
					</div>';
		}
	?>
	
</div>



<?php
include 'includes/footer.html';
