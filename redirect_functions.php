<?php

function redirect($page = 'index.php', $timer = 0){

	$host = $_SERVER['HTTP_HOST'];

	if($timer == 0){
		header("Location: http://$host/$page");
		exit;
	} else {		
		header( "refresh:$timer; url=http://$host/$page" ); 
	}

}