<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

class Auth extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    function index(){
        //not allowed
    }
    
    function userAuthentication($email,$pass){

        if (preg_match("^[a-zA-Z]([.]?([a-zA-Z0-9_-]+)*)?@([a-zA-Z0-9\-_]+\.)+[a-zA-Z]{2,4}$^", $email)){
            $query = "SELECT user_user_id,user_user_password,user_user_verified FROM login WHERE user_user_email='$email'";
            $result = $this->db->query($query);
        }
        else{
            $username=$email;
            $query = "SELECT user_user_id,user_user_password,user_user_verified FROM login WHERE user_user_name='$username'";
            $result = $this->db->query($query);
        }
        
        if($result->num_rows() == 1){
            $row = $result->result_array();
            $upass = $row[0]['user_user_password'];
            if($upass === $pass){
                $q="SELECT user_name,user_email,user_user_verified FROM user WHERE user_id=".$row[0]['user_user_id'];
                $res = $this->db->query($q);
                $r = $res->result_array();
                $user_id=$row[0]['user_user_id'];
                $user_verified=$row[0]['user_user_verified'];

                
                $this->session->set_userdata('user_email',$r[0]['user_email']);
                $this->session->set_userdata('user_name',$r[0]['user_name']);
                $this->session->set_userdata('user_verified',$user_verified);
                $this->session->set_userdata('user_id',$user_id);
                return true;
            } else {
                //Passwords do not match
                return FALSE;
            }
        } else {
            // Either User does not exist or database inconsitency (multiple users with same credentials)
            return FALSE ;
        }
    }

    function verify_user($code,$email){

//var_dump($this->session->userdata);



//            $userId = $this->session->userdata('user_id');
//
//
//            $v_code = $this->session->userdata('user_vcode');

            $query = "SELECT user_user_code FROM verification WHERE user_user_email='$email'";
           

            $result = $this->db->query($query);

            if($result->num_rows()===1){
               //echo "<br /> Only ONE";
               $row = $result->result_array();
               $vCode = $row[0]['user_user_code'];
               if($code === $vCode){
//                   $this->session->unset_userdata('user_vcode');

                   $query = "UPDATE login SET user_user_verified=1 WHERE user_user_email='$email'";
                   
                   $result = $this->db->query($query);
                   if($result){
                       redirect('success/verify_user');
                   } else {
                       redirect('error/verify_user');
                   }
               } else {
                   redirect('failure/verify_user');
               }
           }
    }

    function IsVerify($email){
        

        $no=-1;
        $query="SELECT user_user_verified FROM login WHERE user_user_email='$email'";
        $result=$this->db->query($query);

        
                if($result->num_rows()===1){
                $row = $result->result_array();
                $verified = $row[0]['user_user_verified'];
                return $verified;
                }else{
                    return $no ;
                }


    }
    
   

    
    
}