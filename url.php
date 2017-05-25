<?php



/**
Creates a new url, adding a parameter at the end each time the
user changes settings like page, filter...
*/
function form_new_url($parameter){
$url = $_SERVER["REQUEST_URI"];

	//check if this parameter actually exists in the url
	if(isset($_GET[$parameter]) && is_numeric($_GET[$parameter])){
		$posParam = strpos($url, '&' . $parameter . '=');
		
		//if it is the first parameter in url
		if(!$posParam) $posParam = strpos($url, $parameter . '=');
		
		//check if there are other parameters afer it.
		$posAmp = strpos($url, "&", $posParam + 1 );
		
		$new_url = substr($url, 0, $posParam);
		
		//if there are other parameters after it
		if($posAmp) {
			$new_url .=  substr($url, $posAmp);
			
		} 
		//add '&' at the end so that we can add the parameter
		$new_url .= '&';

	} else {
		//if there are other parameters, add '&parameter=' at the end
		if ($_GET) {
			$new_url = $url . '&' ;
		} else { //else add 'parameter=' after '?' | ex: nolark/store.php?'parameter='
			$new_url = $url . '?';
		}
	}
	
$url = $new_url;

return $url . $parameter . '=';
}




?>