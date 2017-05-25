<?php 
//start session
if(!isset($_SESSION)){
	session_start();
}

include_once 'get_url_param.php';

$title = "Shop !";
$description = "Shop";

require_once 'includes/db_settings.php'; //connexion to MySQL $dbc

//include objects:
include_once "objects/product_class.php"; //"Produit" -> product to display
//include objects Selection
include_once 'objects/selection_class.php';
include_once "objects/product_view_class.php";

//include paging functions
include_once "page_navigation_functions.php";

$categorie = get_param('categorie');

$type = get_param('type');

$marque = get_param('marque');

$selection_id = get_param('selection');

//new Selection
$selection = new Selection($dbc, $selection_id);

$selection_name = $selection->nom;

$product = new Product($dbc, $categorie, $type, $marque, $selection_name);

$product_view = new ProductView('html/product_block.html', 'store');

//*** -- page navigation -- ***//

//number of products to display per page
$offset = get_offset();

$records = $product->count();

//number of disponible pages
$pages = get_pages($records, $offset);

//the current page we're in
$page_current = get_page_current();

if($page_current > $pages) $page_current = 1;

$limit = $page_current * $offset - $offset;

//** -- end page navigation -- **//
$result = $product->select_products($limit, $offset);

//header	
include 'includes/header.html';

/*Pop up (appears when we click on the 'add to cart' icon)	*/
include 'html/popup.html';

//--display filter and products--
echo '<div class="product-store-block">';
 
		include 'html/filter_left_column.html';
		
		echo '<div class="right-column">';
			/**--Display sort bar--*/
			//contains the script that changes pages
			include 'html/sort_bar.html'; 
			
			/*** --- Display the products --- ***/
			echo '<div class="grid">';
				
				if($records > 0){
					
					while($row = $result->fetch_assoc()){
						$product_view->get_view($row);
					}
				} else {
					echo "<div class=\"error message\"><p>Il n'y a pour le moment aucun(e) <b>$categorie</b> correspondant à ces critères de recherche.</p></div>";
				}
			
			echo '</div>';
		
		echo '</div>';
	
echo '</div>';


//script that call add_product.php to add a product to temporary cart
//and shows pop to signal that the product was added to the cart
$scripts[] = '<script src="js/add_product_popup.js"></script>';

$scripts[] = '<script src="js/store_filter.js"></script>';

include 'includes/footer.html';




