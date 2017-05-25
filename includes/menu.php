<?php

$menu =  array (
	"Accueil" => "/",
	"Route" => "store.php?categorie=casque&type=route",
	"Cross" => "store.php?categorie=casque&type=cross",
	"Piste" => "store.php?categorie=casque&type=piste",
	"Enfants" => "store.php?categorie=casque&type=enfant",
	// "Blog" => "blog.php"
);

echo '
		<div id="menu">
			<div class="wrapper">
				<nav> 
					<ul>';
					

foreach($menu as $page_name => $page_address ){
	echo '<a href="' . $page_address . '"><li>' . $page_name .'</li></a>';
}

		echo 	'	</ul>
				</nav>
			</div>
		</div>';
