<?php

//product object

class ProductView{
	//product_class, can be 'store' or 'selection'
	private $product_class;
	private $file_html;
	
	public function __construct($file_html, $product_class = 'store'){
		$this->file_html = $file_html;
		$this->product_class = $product_class;
	}
	
	/**
	@param $data array of data
	*/
	public function get_view($data){
		extract($data);
		$product_class = $this->product_class;
		$block_html = include $this->file_html;
		
		return $block_html;
	}
}