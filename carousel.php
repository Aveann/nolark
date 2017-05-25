<?php

$style = file_get_contents('css/carousel.css');

$images = [
	'img1.jpg' => 'store.php?selection=1',
	'img2.jpg' => 'store.php',
	'img3.jpg' => 'store.php?categorie=piste',
];
/*<?php echo 3 * 100.?>*/

?>

<!-- Carousel -->
	<?php 
		echo '<style>' . $style . '</style>' ;
	?>
	
	<div id="carousel">
		<figure style="width: 300%;">
			<?php 
			foreach($images as $image => $link){
				echo '<a href="' . $link . '"><img src="img/carousel/' . $image . '" alt="' . $image . '" /></a>';
			}
			?>
		</figure>
	</div>