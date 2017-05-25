<?php

//product object

class Product{
	//database connection and table name
	private $dbc;
	const TABLE_NAME = 'produit';
	private $columns = array();
	//object properties
	// public $produit_id;
	// public $model;
	private $marque = '';
	private $type = '';
	// public $prix; //price
	// public $reduction;
	// public $should_price; 
	// public $image; //image path
	// public $stock;
	public $selection;
	// public $description;
	private $categorie = '';
	// public $note; //rating from 0 to 5
	// public $timestamp;
	
	function __construct($dbc, $categorie = '', $type = '', $marque = '', $selection = ''){
		$this->dbc = $dbc;
		$this->columns = [
			'categorie' => $categorie,
			'type' => $type,
			'marque' => $marque,
			'selection' => $selection,
		];
	}
	
	private function sql_where(){
		$conditions = array();
		
		//generate a 'column = value' if the value is not empty
		foreach($this->columns as $column => $value){
			if(!empty($value)){
				if (is_array($value)){
					$value = implode('\',\'', $value);
					$conditions[] = $column . ' IN (\'' . $value . '\')';
				} else {
					$conditions[] = $column . ' = \'' . $value . '\'';
				}
			}
		}
		
		$where = implode(' AND ', $conditions);
		
		//return a 'WHERE' statement if there is no empty value
		if(!empty($where)){
			return 'WHERE ' . $where;
		} else { //else return an empty string
			return '';
		}
	}
	
	/**
		Selects a number of products in the database from 
		a start number.
		@param int $limit The start number of products to display
		@param int $offset The number of products to display.
		@return The prepared query statement and the number of products found.
	*/
	public function select_products($limit = 0, $offset = 0){
		
		//select all products query
		$query = "SELECT *
				FROM
					" . self::TABLE_NAME . "
				{$this->sql_where()}
				ORDER BY 
					date_created DESC";
					
		if($limit + $offset != 0 ){
			$query .= "
				LIMIT
					?, ? ;";
			//prepare query statement
			$stmt = $this->dbc->prepare($query);
				
			//bind limit and offset variables
			$stmt->bind_param('ii', $limit, $offset);
		} else {
			$query .= ";";
		
			//prepare query statement
			$stmt = $this->dbc->prepare($query);
		}
		
		//execute query
		$stmt->execute();
		
		//get results
		$result = $stmt->get_result();

		//return values
		return $result; 
	}
	
	/**
		Select all products from given selection
	*/
	public function select_selection($selection){
		
		//--select all products from given selection query
		$query = "SELECT *
				FROM
					" . self::TABLE_NAME . "
				WHERE
					selection = ?
				ORDER BY 
					date_created DESC;";
		
		//prepare query statement
		$stmt = $this->dbc->prepare($query);
		
		//bind selection variable
		$stmt->bind_param('s', $selection);
		
		//execute query
		$stmt->execute();
		
		//get results
		$result = $stmt->get_result();
		
		//return values
		return $result; 
	}
	
	/**
		Used to display products in the cart.
		@param array(int) $product_ids Array of product ids to select
	*/
	public function select_products_by_id($product_ids){
		$ids = is_array($product_ids) ? implode(',', $product_ids) : $product_ids;
		
		//select all products query
		$query = "SELECT *
				FROM
					" . self::TABLE_NAME . "
				WHERE
					produit_id IN ($ids);";
					
		//prepare query statement
		$stmt = $this->dbc->prepare($query);
		
		//execute query
		$stmt->execute();
		
		//get results
		$result = $stmt->get_result();
		
		return $result;
	}
	
	public function modify($product_id, $column_name, $value){
		$query = "UPDATE " . self::TABLE_NAME . "
				SET $column_name = ?
				WHERE produit_id = ? ;";
		
		//prepate query statement
		$stmt = $this->dbc->prepare($query);
		
		//bind selection variable
		$stmt->bind_param('ss', $column_name, $product_id);
		
		//execute query
		$stmt->execute();
	}
	
	/**
		Count number of records from a query.
		@return int Number of products found
	*/
	public function count(){
		//query to count all products records
		$query = "SELECT 
					count(*) 
				FROM 
					(
						SELECT 
							*
						FROM
							" . self::TABLE_NAME . "
						{$this->sql_where()} 
							
					) as req;";
		
		//prepate query statement
		$stmt = $this->dbc->prepare($query);
		
		//execute query
		$stmt->execute();
		
		//get results
		$result = $stmt->get_result();
		
		//number returned by query
		$rows = $result->fetch_row();
		
		return $rows[0];
	}
	
	private function get_condition($value){
		if ($value == ''){
			return "'' OR 1 = 1";
		} else {
			return "'$value'";
		}
	}
	
	
}