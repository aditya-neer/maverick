<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

class Error extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function index(){
        //not allowed
    }
    
    public function verify_user(){
        echo "Oops! Something went wrong whileverification please try again!";
    }
    
}
