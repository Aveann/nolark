<?php

//start session
if(!isset($_SESSION)){
	session_start();
}

require_once 'includes/db_settings.php'; //connexion to MySQL $dbc

//include objects:
include_once "objects/product_class.php"; //"Produit" -> product to display

$product = new Product($dbc);

	
if($_SERVER['REQUEST_METHOD'] == 'POST'){
	if($_POST['task'] == 'del'){ //task 'del' to delete a product
		delete_product($_POST['product_id']);
	} elseif ($_POST['task'] == 'add' || $_POST['task'] == 'update') { //the other task is to add a product
		$result = $product->select_products_by_id($_POST['product_id']);
		$row = $result->fetch_assoc();
		if($row['stock'] != 0){
			add_product_to_cart($_POST['product_id']);
		}
		
	} 
}

/**
@param int $product_id The id of the product to add
*/
function add_product_to_cart($product_id){
	if(!isset($_SESSION['cart'])){
		$_SESSION['cart'] = array();
	}
	
	if(array_key_exists($product_id, $_SESSION['cart'])){
		if ($_POST['task'] == 'add'){
			++$_SESSION['cart'][$product_id]; 
			
		} elseif($_POST['task'] == 'update'){
			$_SESSION['cart'][$product_id] = $_POST['quantity'];
		} 
		
	} else { 
			// $_SESSION['cart_ids'][] = $product_id;
			$_SESSION['cart'][$product_id] = 1;
	}
}

/**
@param int $product_id The id of the product to delete
*/
function delete_product($product_id){
	if(isset($_SESSION['cart'])){
		unset($_SESSION['cart'][$product_id]);
	}
}

