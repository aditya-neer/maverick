<?php
class Registration extends CI_Model{
    public function index(){
        //direct access not allow
    }
    public function createfolder(){

        $inputs = $this->session->userdata('regData');
        $uname =$inputs['uname'];        
      
        if(file_exists("users")==FALSE){ 
        mkdir("users",0700);
        }else{}
        chdir("users");
        if(file_exists($uname)==FALSE){         
        mkdir($uname,0700);         
        }else{}
        chdir($uname);
        if(file_exists('reginfo')==FALSE){
        mkdir("reginfo",0700);
        }else{}
        if(file_exists('images')==False){
        mkdir("images",0700);
        }else{}
        if(file_exists('videos')==FALSE){
        mkdir("videos",0700);
        }else{}

     }
   public function register(){       
        $ip=$this->session->userdata('ip_address');
        $inputs = $this->session->userdata('regData');
        $fname =$inputs['fname'];
        $lname= $inputs['lname'];
        $uname= $inputs['uname'];
        $upass= $inputs['upass'];
        $email= $inputs['email'];
        $sex = $inputs['sex'];
        $dob = $inputs['dob'];
        
        $isadmin="0";
        $isactive="0";
        $today = date('Y-m-d');
        $query="insert into user values(0,'$uname','$email','$fname','$lname','$dob','$sex','$today','$ip')";
        $result = $this->db->query($query);
        if($result){
            $result = $this->create_login($email, $upass,$uname);
            if($result) {
                $result = $this->create_verification($email, $result,$uname);
                if($result){
                    return TRUE;
                } else {
                    return FALSE;
                }
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

    function create_login($emailId,$password,$uname){        
        $selectQuery = "SELECT user_id FROM user WHERE user_email='$emailId'";
        $selectResult = $this->db->query($selectQuery);
        if($selectResult->num_rows()==1){
            $row = $selectResult->result_array();
            $id=$row[0]['user_id'];
            $insertQuery = "INSERT INTO login VALUES($id,'$uname','$emailId','$password',0,1)";
            $insertResult = $this->db->query($insertQuery);
            if($insertQuery){
                return $id;
            } else {
                return FALSE;
            }
        }
    }

    function genRandomString(){
        $length = 6;
        $characters = "0123456789abcdefghijklmnopqrstuvwxyz";
        $string = "";
        for ($p = 0; $p < $length; $p++) {
            $string .= $characters[mt_rand(0, (strlen($characters)-1))];
        }
        return $string;
    }

    function create_verification($email,$id,$uname) {
        $randomstring=$this->genRandomString();
        $insertQuery = "insert into verification value($id,'$uname','$email','$randomstring')";
        $result=$this->db->query($insertQuery);
        if($result){
            $message = "Thank you for registering with us.
                This is your verification code - $randomstring
            Team Neer!";
//            mail($email, 'Verification Code', $message);
            return TRUE;
        } else {
            return FALSE;
        }
    }
}
?>
