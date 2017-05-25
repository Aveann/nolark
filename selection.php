<?php
//include objects Product
require_once 'objects/product_class.php';
//include objects Selection
require_once 'objects/selection_class.php';
//include objects ProductView
require_once 'objects/product_view_class.php';

$selection_name = 'En ce moment';

$selection = new Selection($dbc, $selection_name);

$selection_id = $selection->selection_id;

$product = new Product($dbc, '', '', '', $selection_name);

$product_view = new ProductView('html/product_block.html', 'selection');

$result_selection = $product->select_products(0, 4);

$records = $result_selection->num_rows;

?>

<!-- Selectionned products-->
	<div class="section">
		<div class="section_title">
			<h1>
				<?php 
					echo $selection_name;
				?>
			</h1>
			<p>
				<a href="store.php?selection=<?php echo $selection_id;?>">Voir les produits '<?php echo $selection->nom;?>'</a>

			</p>
		</div>
		<div class="section_content">
			<?php
				if($records > 0){
					while($row = $result_selection->fetch_assoc()){
						$product_view->get_view($row);
					}
				} else {
					echo "<div class=\"error message\">
							Il n'y a aucun produit dans la sélection '<b>$selection_name</b>'.
						</div>";
				}		
			?>
		</div>
	</div>
	
	