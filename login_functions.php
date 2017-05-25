<?php

/**Checks if the provided Id (can be email or login) ans Password match
a user from the database.

@param mysqli_connect $dbc The database connection

@param string $id The email/login entered by the user in the login form

@param string $password The password entered by user in login form

@return array(bool, array()) The function returns an array of two value : boolean and an array.
If the user has correctyle been authentified, the function 
returns an array containing true and an array of the user's data. Else it 
returns an array containing false and an array of errors. 
*/
function check_login($dbc, $id = '', $password = ''){
	//Initialize an error array : contains all the error messages caused by the user like 
	//bad email adress or passwords that don't match
	$errors = array();
	
	//if user forget to enter email or password, generate an error message
	if(empty($id)){
		$errors[] = 'Veuillez saisir votre email/login.';
	} elseif(empty($password)) {
		$errors[] = 'Veuillez saisir votre mot de passe.';
	} else {
		
		$sql = "SELECT user_id, first_name, last_name FROM user ";
		
		//check if user entered an email
		//select users by email if yes, or by login if not.
		if(filter_var(strtolower($id), FILTER_VALIDATE_EMAIL)){
			$email = strtolower($id);
			
			$sql .= "WHERE email = '$email' ";
			
		} else {
			$login = $id;
			
			$sql .= "WHERE login = '$login' ";
		}
		
		$sql .= "AND password = SHA1('$password')";
		
		if($result = mysqli_query($dbc, $sql)){
			//check if one user match the email/login/password combinaison.
			if(mysqli_num_rows($result) == 1 ){
				
				$user = mysqli_fetch_assoc($result);
				
				//returns an array of true and the user's data
				return array(true, $user);
			} else {
				if(isset($login)){
					$identificator = 'nom d\'utilisateur';
				} else {
					$identificator = 'email';
				}
				
				$errors[] = "Votre $identificator et/ou votre mot de passe sont incorrects.";
			}
			
		} else {
			$errors[] = "Nous n'avons pas pu vous connecter à cause d'une erreur de notre système. Veuillez rafraichir la page et réessayer à nouveau. Si le problème persiste, veuillez signaler l'erreur à notre administrateur.";
		}
		
	}
	
	//returns an array of false and the list of errors.
	return array(false, $errors);
	
} //END of check_login() function


/**
Redirects the user to the specified page. By default, it redirects the user to the 
index.php page.

@param string $page The page where we want the user to be redirected to. Default value
is 'index.php'.
*/
function redirect_user ($page = 'index.php'){
	//The current url: http:// + the host name + the current directory
	$url = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']);
	
	//remove trailing slashes at the end of the url
	$url = rtrim($url, '/\\');
	
	//add the page to the url
	$url .= '/' . $page;
	
	//redirect the user
	// header ("Location : $url");
	header( "Location: $url" ); 
	
	//quit the script
	exit();
	
} // End of redirect_user() FUNCTION