<?php
include 'login_functions.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
	//assign the first value of the array returned by check_login function to
	//$check and the second value (an array) to $data
	list ($check, $data) = check_login($dbc, $_POST['email_login'], $_POST['password']);
	
	//check if user was correctly authentified
	if($check){
        //starts a new session
		if(!isset($_SESSION)){
		   session_start();
		}
		
		//Assigns correct values to the session
		$_SESSION['user_id'] = $data['user_id'];
		$_SESSION['first_name'] = $data['first_name'];
		
		echo '<p>Vous êtes connecté(e) avec succés ' . $_SESSION['first_name'] . '</p>';
		
	} else {
		foreach($data as $msg){
			echo '<p class="error">'
				. $msg .
				'</p>';
		}
	}
	
}
