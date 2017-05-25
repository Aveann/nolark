<?php

//selection object

class Selection{
	//database connection and table name
	private $dbc;
	const TABLE_NAME = 'selection';
	
	public $selection_id;
	public $nom;
	
	function __construct($dbc, $selection = ''){
		$this->dbc = $dbc;
		
		if(is_numeric($selection)){ //selection initialized by its id
			$this->selection_id = $selection;
			$this->nom = $this->select_selection_name($this->selection_id);
			
		} elseif ($selection == '') {
			$this->nom = $selection;
			$this->selection_id = $selection;
			
		} else {//or by its name
			$this->nom = $selection;
			$this->selection_id = $this->select_selection_id($this->nom);
		}
	}
	
	private function select_selection_name($selection_id){
		//--select selection's id
		$query = "SELECT 
					nom
				FROM
					" . self::TABLE_NAME . "
				WHERE
					selection_id = ? ;";
					
		//prepare query statement
		$stmt = $this->dbc->prepare($query);
		
		//bind selection's name
		$stmt->bind_param('i', $selection_id);
		
		//execute query
		$stmt->execute();
		
		//get results
		$result = $stmt->get_result();
		
		//name returned by query
		$selection_name = $result->fetch_row();
		
		return $selection_name[0];
	}
	
	private function select_selection_id($selection_name){
		//--select selection's id
		$query = "SELECT 
					selection_id
				FROM
					" . self::TABLE_NAME . "
				WHERE
					nom = ? ;";
		
		//prepare query statement
		$stmt = $this->dbc->prepare($query);
		
		//bind selection's name
		$stmt->bind_param('s', $selection_name);
		
		//execute query
		$stmt->execute();
		
		//get results
		$result = $stmt->get_result();
		
		//id returned by query
		$selection_id = $result->fetch_row();
		
		return $selection_id[0];
	}
	
	public function _get($name){
		if(property_exists ( 'Selection' , $name )){
			return $this->$name;
		} else {
			$trace = debug_backtrace();
			trigger_error(
            'Propriété non-définie via __get() : ' . $name .
            ' dans ' . $trace[0]['file'] .
            ' à la ligne ' . $trace[0]['line'],
            E_USER_NOTICE);
			return null;
		}
		
	}
}