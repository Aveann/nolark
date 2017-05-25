<?php
/**
Checks each input. If an error is found, a message is sent to the user. Else
we add the user to the database.
*/

if($_SERVER['REQUEST_METHOD'] == 'POST' ) {
	//Initialize an error array : contains all the error messages caused by the user like 
	//bad email adress or passwords that don't match
	$errors = array();
	
	// Check if entries are empty
	if(empty($_POST['first_name'])){
		$errors[] = "Veuillez entrer votre prénom.";
	} else {
		$first_name =  ucfirst($dbc->real_escape_string(trim($_POST['first_name'])));
	}
	
	if(empty($_POST['last_name'])){
		$errors[] = "Veuillez entrer votre nom.";
	} else {
		$last_name = ucfirst($dbc->real_escape_string(trim($_POST['last_name'])));
	}
	
	if(empty($_POST['date_birth'])){
		$errors[] = "Veuillez entrer votre date de naissance.";
	} else {
		$date_birth = $dbc->real_escape_string(trim($_POST['date_birth']));
	}
	
	if(empty($_POST['address'])){
		$errors[] = "Veuillez entrer votre adresse.";
	} else {
		$address = $dbc->real_escape_string(trim($_POST['address']));
	}
	
	if(empty($_POST['zip'])){
		$errors[] = "Veuillez entrer votre code postal.";
	} else {
		$zip = $dbc->real_escape_string(trim($_POST['zip']));
	}
	
	if(empty($_POST['tel'])){
		$errors[] = "Veuillez entrer votre numéro de télephone.";
	} else {
		
		$tel = $dbc->real_escape_string(trim($_POST['tel']));
	}
	
	if(empty($_POST['email'])){
		$errors[] = "Veuillez entrer votre email.";
	} else {
		
		$email = strtolower($dbc->real_escape_string(trim($_POST['email'])));
		
		if(filter_var($email, FILTER_VALIDATE_EMAIL)){
			$sql = "SELECT email FROM user WHERE email = '$email'";
		
			if($result = @mysqli_query($dbc, $sql)){
				//check if email already exists
				if(mysqli_num_rows($result) > 0 ) {
					$errors[] = 'L\'email saisi existe déjà. Saisissez-en un nouveau ou <a href="login.php">connectez-vous</a> si vous avez déjà un compte.';
				}
			}
		} else {
			$error[] = 'Veuillez entrer un email valide.';
		}
		
	}
	
	if(empty($_POST['login'])){
		$errors[] = "Veuillez choisir un nom d'utilisateur.";
	} else {
		$login = $dbc->real_escape_string(trim($_POST['login']));
		
		$sql = "SELECT email FROM user WHERE login = '$login'";
		
		if($result = @mysqli_query($dbc, $sql)){
			//check if email already exists
			if(mysqli_num_rows($result) > 0 ) {
				$errors[] = 'Le nom d\'utilisateur saisi existe déjà. Saisissez-en un nouveau ou <a href="login.php">connectez-vous</a> si vous avez déjà un compte.';
			}
		}
	}
	
	if(empty($_POST['password'])){
		$errors[] = "Veuillez saisir votre mot de passe.";
	} else {
		if($_POST['password'] != $_POST['password_confirm']){
			$error = 'Les mots de passes ne sont pas identiques';
		} else {
			$password = $dbc->real_escape_string(trim($_POST['password']));
		}
	}
	

	//Check if there is any error
	//if no, insert user in database
	if(empty($errors)){
		//query to insert user into table
		$sql = "INSERT INTO user (first_name, last_name, gender, tel, email, login, password, address, zip, date_birth, date_creation) VALUES('$first_name', '$last_name', '{$_POST['gender']}', '$tel', '$email', '$login', SHA1('$password'), '$address', '$zip', '$date_birth', NOW());";
		
		if($result = @mysqli_query($dbc, $sql)){
			echo '<div id="registration_success">
					<p>Bienvenue sur le site Nolark, ' . $first_name . '.</p>
					<p> Pour continuer vos achats, vous pouvez vous <a href="login.php">connecter</a></p>
				</div>';
			
		} else {
			echo "<p>Une erreur s'est produite: nous n'avons pas pu vous enregistrer. Veuillez rafraichir la page et réessayer à nouveau. Si le problème persiste veuillez contacter l'administrateur.</p>";
		}
	} else{
		//display all error messages if there is any
		foreach($errors as $msg){
			echo '<p class="errors">' . $msg . '</p>';
		}
	}
}