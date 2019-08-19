<?php
include('Rest.php');
class Api extends REST{
	public $data = "";

  public function __construct()
  {
    parent::__construct();
  }


//Public method for access api.
//This method dynmically call the method based on the query string
  public function processApi()
  {
    $func = strtolower(trim(str_replace("/","",$_REQUEST['rquest'])));
    if((int)method_exists($this,$func) > 0 && $this->checkAuth()==true)
      $this->$func();
    else
      $this->response($this->json([],'Route not found',404,0), 404);
// If the method not exist with in this class, response would be "Page not found".

  }


// function to save order details
  public function saveDetails(){
    $nameErr = $productIdErr = $emailErr = ''; 
    $status = 0;
    $statusCode = 400;

    if(empty($this->_request->name)){
      $nameErr = 'Name is required';
    }else{
      $name = htmlspecialchars($this->_request->name);
    }

    if(empty($this->_request->productId)){
      $productIdErr = 'Product id is required';
    }else{
      $productId = htmlspecialchars($this->_request->productId);
    }

    if(empty($this->_request->email)){
      $emailErr = 'Email id is required';
    }else{
      $email = htmlspecialchars($this->_request->email);
    }
    
    if($nameErr != ''){
      $message = $nameErr;
    }
    elseif($productIdErr != ''){
      $message = $productIdErr;
    }
    elseif($emailErr != ''){
      $message = $emailErr;
    }
    else{
      $age = !empty($this->_request->age) ? htmlspecialchars($this->_request->age) : ''; 
      $company = !empty($this->_request->company) ? htmlspecialchars($this->_request->company) : ''; 
      $address = !empty($this->_request->address) ? htmlspecialchars($this->_request->address) : ''; 
      $mobile = !empty($this->_request->mobile) ? htmlspecialchars($this->_request->mobile) : ''; 
      $height = !empty($this->_request->height) ? htmlspecialchars($this->_request->height) : ''; 
      $weight = !empty($this->_request->weight) ? htmlspecialchars($this->_request->weight) : '';

      $sql = "INSERT into detail (name,age,product_id,company,address,mobile,email,height,weight)
      VALUES('".$name."','".$age."','".$productId."','".$company."','".$address."','".$mobile."','".$email."','".$height."','".$weight."')";
      $result = $this->con->query($sql);
      if($result){
        $status = 1;
        $statusCode = 200;
      }
      $message = 'Details saved';
    }
    $this->response($this->json([],$message,$statusCode,$status), $statusCode); 
  }

// function to get products
  public function getProducts(){
  // install mamche before using it
  // sudo apt-get install memcached
  // sudo pecl install memcache
   // $memcacheObj = new Memcache;
// memcache host : localhost
// memcache port : 11211
  //  $memcacheObj->connect('localhost',11211) or die('Memcache could not connect');
    $cacheResults = array();
    $products = array();
   // $cacheResults = $memcacheObj->get('products');
    if(!empty($cacheResults)){
      $products = $cacheResults;
    }
    else{
      $sql = "SELECT id,product_name FROM products";
      $result = $this->con->query($sql);
      if ($result->num_rows > 0) {
    // output data of each row
        while($row = $result->fetch_assoc()) {
          $products[] = $row;
        }
    // cache 5 minutes or 300 seconds
       // $memcacheObj->set('products',$products,MEMCACHE_COMPRESSED, 300);
      } 
    }

    $this->response($this->json($products,'Products List',200,1), 200);
  }

}
// Initiiate Library
$api = new Api;
$api->processApi();
?>