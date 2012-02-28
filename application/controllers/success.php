<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

class Success extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function index(){
        //not allowed
    }
    
    public function login(){
        redirect('vs/show_poll_list');
    }
    
    public function verify_user(){
        echo "Verification Succeeded - ".  anchor('vs/show_poll_list','Click here to go to home page!');
    }
    public function newpoll(){
        
    }
    
}