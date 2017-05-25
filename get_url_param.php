<?php

//gets the value of a give parameter through the GET server request method
function get_param($param_name){
	$param = isset($_GET[$param_name]) ? $_GET[$param_name] : '';
	
	if(strpos($param, ' ')){
		$param_arr = explode(' ', $param);
		return $param_arr;
	}
	
	return $param;
}

