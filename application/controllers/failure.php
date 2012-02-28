<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

class Failure extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function index(){
        //not allowed
    }
    
    public function login(){
        echo "Login Failed";
        // go back to welcome page
    }
    
    public function verify_user(){
        echo "Verification Failed";
    }
    
}