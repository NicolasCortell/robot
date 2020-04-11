<?php

class DatabaseLayer{

	# @object, The PDO object
	private $pdo;

	# @object, PDO statement object
	private $sQuery;

	# @array,  The database settings
	private $settings;

	# @bool ,  Connected to the database
	private $bConnected = false;

	# @array, The parameters of the SQL query
	private $parameters;
	
	# @array, The parameters of the SQL query
	private $parameters_exploded;
		
    /**
	*   Default Constructor 
	*
	*	2. Connect to database.
	*	3. Creates the parameter array.
	*/
	public function __construct( $dbHost, $dbUser, $dbPassword, $dbName ){ 				
		$this->Connect( $dbHost, $dbUser, $dbPassword, $dbName );
		$this->parameters = array();
		$this->parameters_exploded = array();
	}
		
	
    /**
	*	This method makes connection to the database.
	*	
	*	1. Reads the database settings from a ini file. 
	*	2. Puts  the ini content into the settings array.
	*	3. Tries to connect to the database.
	*	4. If connection failed, exception is displayed and a log file gets created.
	*/
	private function Connect( $dbHost, $dbUser, $dbPassword, $dbName ){
		//$this->settings = parse_ini_file("config.php");
		$dsn = 'mysql:dbname='.$dbName.';host='.$dbHost.'';
		try {
			# Read settings from INI file, set UTF8
			$this->pdo = new PDO($dsn, $dbUser, $dbPassword, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
			
			# We can now log any exceptions on Fatal error. 
			$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			# Disable emulation of prepared statements, use REAL prepared statements instead.
			$this->pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
			
			# Connection succeeded, set the boolean to true.
			$this->bConnected = true;
		} catch (PDOException $e) {
			# Write into log
			echo ($e->getMessage());
			die();
		}
	}

	/**
	 *   You can use this little method if you want to close the PDO connection
	 *
	 */
	public function CloseConnection(){
		# Set the PDO object to null to close the connection
		# http://www.php.net/manual/en/pdo.connections.php
		$this->pdo = null;
	}
		
    /**
	*	Every method which needs to execute a SQL query uses this method.
	*	
	*	1. If not connected, connect to the database.
	*	2. Prepare Query.
	*	3. Parameterize Query.
	*	4. Execute Query.	
	*	5. On exception : Write Exception into the log + SQL query.
	*	6. Reset the Parameters.
	*/	
	private function Init($query,$parameters = ""){

		# Connect to database
		if(!$this->bConnected) { $this->Connect(); }
		try {
			# Prepare query
			$this->sQuery = $this->pdo->prepare($query);

			# Add parameters to the parameter array	
			$this->bindMore($parameters);

			# Bind parameters
			if(!empty($this->parameters)) {
				foreach($this->parameters as $param){
					$parameters = explode("\x7F",$param);
					$this->parameters_exploded[$parameters[0]] = $parameters[1];
					if ( $parameters[1] === NULL ) {
						$this->sQuery->bindParam($parameters[0], $parameters[1], PDO::PARAM_NULL);
					} else {
						$this->sQuery->bindParam($parameters[0], $parameters[1]);
					}
				}		
			}

			# Execute SQL 
			$this->succes = $this->sQuery->execute();		

		}
		catch(PDOException $e) {
			# Write into log and display Exception
			echo ( $e->getMessage() );
			die();
		}

		# Reset the parameters	
		$this->parameters = array();
		$this->parameters_exploded = array();
	}
		
    /**
	*	@void 
	*
	*	Add the parameter to the parameter array
	*	@param string $para  
	*	@param string $value 
	*/	
	public function bind($para, $value){	
		$this->parameters[sizeof($this->parameters)] = ":" . $para . "\x7F" . $value;
	}

    /**
	*	@void
	*	
	*	Add more parameters to the parameter array
	*	@param array $parray
	*/	
	public function bindMore($parray){
		if(empty($this->parameters) && is_array($parray)) {
			$columns = array_keys($parray);
			foreach($columns as $i => &$column)	{
				if ( $parray[$column] === NULL ) {
					$this->sQuery->bindParam($column, $parray[$column], PDO::PARAM_NULL);
				} else {
					$this->bind($column, $parray[$column]);
				}			
			}
		}
	}

    /**
	*   If the SQL query  contains a SELECT or SHOW statement it returns an array containing all of the result set row
	*	If the SQL statement is a DELETE, INSERT, or UPDATE statement it returns the number of affected rows
	*
	*   @param  string $query
	*	@param  array  $params
	*	@param  int    $fetchmode
	*	@return mixed
	*/			
	public function query($query, $params = null, $fetchmode = PDO::FETCH_ASSOC) {
		$query = trim($query);

		$this->Init($query,$params);

		$rawStatement = explode(" ", $query);
		
		# Which SQL statement is used 
		$statement = strtolower($rawStatement[0]);
		
		if ($statement === 'select' || $statement === 'show') {
			return $this->sQuery->fetchAll($fetchmode);
		}elseif ( $statement === 'insert' ||  $statement === 'update' || $statement === 'delete' ) {
			return $this->sQuery->rowCount();	
		} elseif ( $statement === 'call' ) {
			$sp_name = strtolower($rawStatement[1]); 
			if ( substr($sp_name, -8) === '_update]' || substr($sp_name, -8) === '_delete]' || substr($sp_name, -8) === '_insert]') { 
				return $this->sQuery->rowCount(); 
			} else { 
				return $this->sQuery->fetchAll($fetchmode);
			} 
		} else {
			return NULL;
		}

	}
		
	/**
	 *  Returns the last inserted id.
	 *  @return string
	 */	
	public function lastInsertId() {
		return $this->pdo->lastInsertId();
	}	
		
    /**
	*	Returns an array which represents a column from the result set 
	*
	*	@param  string $query
	*	@param  array  $params
	*	@return array
	*/	
	public function column($query,$params = null){
		$this->Init($query,$params);
		$Columns = $this->sQuery->fetchAll(PDO::FETCH_NUM);		
		
		$column = null;

		foreach($Columns as $cells) {
			$column[] = $cells[0];
		}

		return $column;
		
	}	

    /**
	*	Returns an array which represents a row from the result set 
	*
	*	@param  string $query
	*	@param  array  $params
	*   	@param  int    $fetchmode
	*	@return array
	*/	
	public function row($query,$params = null,$fetchmode = PDO::FETCH_ASSOC) {				
		$this->Init($query,$params);
		return $this->sQuery->fetch($fetchmode);			
	}

    /**
	*	Returns the value of one single field/column
	*
	*	@param  string $query
	*	@param  array  $params
	*	@return string
	*/	
	public function single($query,$params = null){
		$this->Init($query,$params);
		return $this->sQuery->fetchColumn();
	}
       
				
}
?>
