<?php

if($_SERVER['REQUEST_METHOD'] == 'POST'){
	if(!empty($_POST['filters']) && !empty($_POST['values'])){
		echo $_POST['values'];
		
	}
}