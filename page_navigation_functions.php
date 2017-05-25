<?php
/**
Gets the current page we're in.
@param string $page_parameter The name of the page parameter in the url.
example : if url is: "http://example.com?page=3", the page parameter is
'page'.
*/
function get_page_current(){
	$page_current = (isset($_GET['page']) && is_numeric($_GET['page'])) ? $_GET['page'] : 1;
	
	return $page_current;
}

/**
Gets the number of pages, depending on the number of items is displayed 
per page and depending on number of items there is in the database.
*/
function get_pages($n_items, $n_display){
	//number of pages to display in the navigation
	$pages = ceil ($n_items / $n_display);
	
	return $pages;
}

/**
Gets the number of pages, depending on the number of items is displayed 
per page and depending on number of items there is in the database.
*/
function get_offset(){
	$offset = (isset($_GET['offset']) && is_numeric($_GET['offset'])) ? $_GET['offset'] : 10;

	return $offset;
}