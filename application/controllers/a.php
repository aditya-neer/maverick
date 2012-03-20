<?php

class A extends CI_Controller {

    public function index() {
        $this->load->view('welcome');
        //$this->load->view('ape');
    }
    function showRegistration(){
        $data = array(
            "title"=>"New User Registration",
            "styleSheets"=>array("main","jquery-ui-1.8.16.custom"),
            "javascripts"=>array("jquery","jquery-ui-1.8.12.custom.min")
        );
        $this->load->view('registration',$data);
    }
    public function uploadFiles(){
        $this->load->model('Uploadfiles');
        $this->Uploadfiles->upload_image();
    }
    function verify_user(){           
        $data = array(
            "title"=>"User Verification",
            "styleSheets"=>array("main"),
            "javascripts"=>array("jquery"),
            "submitURL"=>"a/verify"
        );
        $this->load->view('verify',$data);
    }
    public function createUser(){
        $this->load->model('registration');
        $this->registration->createfolder();        
    }

     public function register(){       
        $inputs = $this->input->post();
        $myData = array(
            'fname' => $inputs['fname'],
            'lname'=> $inputs['lname'],
            'uname'=> $inputs['uname'],
            'upass'=> $inputs['upass'],
            'email' => $inputs['email'],
            'sex' => $inputs['sex'],
            'dob' => $inputs['dob']
        );
        $this->session->set_userdata('regData',$myData);
        $this->load->model('registration');
        $success = $this->registration->register();
        if($success){
            $message = "Registration Successful-
                    Your account verification code has been sent to you on <i>".$inputs['email']."</i>.
                    You will need to provide this code to verify your account.

                    Please login and enter this code when asked to complete the verification process

                    Regards,
                    Team Neer";
//                mail($inputs['email'],'Account Verification', $message,'From:Neer Systems<test@neersys.com>');
            echo $message;               
        } else {
            echo "Registration Failed";
        }
         
        $this->load->model('registration');
        $this->registration->createfolder();
    }

    public function login() {
        $this->load->model('auth');
        $email = $this->input->post('email');
        $upass = $this->input->post('pass');

        $result = $this->auth->userAuthentication($email, $upass);
        
        if ($result == TRUE) {
            $email = $this->session->userdata('user_email');
            $user_id = $this->session->userdata('user_id');
            $username = $this->session->userdata('user_name');
            $user_verified = $this->session->userdata('user_verified');

            if($user_verified==0){
                echo 1;
                // Valid user but not yet verified.
            } else {
                echo 2;
                //redirect('a/saywtf');
            }
        } else {
            echo 0;
            //Invalid username or password.
        }
    }

    public function registration() {
        $this->load->view('registration');
    }

    public function verification(){
        echo "hi";
    }
   function verify(){

        $email = $this->input->post('email');
        $code=$this->input->post('code');
        $this->load->model('auth');            
        $success = $this->auth->verify_user($code,$email);
        if($success){          
        } else {
            echo "Invalid Credentials";
        }
    }

    function Is_verified(){
       $email=$this->input->post('email');
       $this->load->model('auth');
       $result=$this->auth->isVerify($email);
       echo $result;
    }
    
    function saywtf(){
        $data = array(
            "title"=>"Welcome - ".$this->session->userdata('user_name'),
            "styleSheets"=>array("saywtf","jquery-ui-1.8.16.custom"),
            "javascripts"=>array("jquery","jquery-ui-1.8.12.custom.min")
        );
        $this->load->view('saywtf',$data);
        //var_dump($this->session->userdata);
    }
}
