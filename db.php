<?php
/**
* DB Connection
*/
class DB
{
	
	const DB_SERVER = "localhost";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB = "webservices";
	public $con = NULL;

	public function __construct()
	{
$this->dbConnect();// Initiate Database connection
}

//Database connection
private function dbConnect()
{

	$this->con = mysqli_connect(self::DB_SERVER,self::DB_USER,self::DB_PASSWORD,self::DB);
// Check connection
	if (mysqli_connect_errno())
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
}

}

?>