<?php

class Createpoll extends CI_Model {

    public function index() {
        //direct access not allow
    }

    public function insertpoll() {
        $userid = '1';
        $user_name = 'sushil';
        $user_email = 'sushil.zavare@gmail.com';
        $user_ip = '121.0.0.2';
        $creattime = "1.13.12";
        $pollstartdate = "14.2.2012";
        $pollenddate = "null";
        $pollabuse = 0;
        $pollvotes = 0;
        $json = '{"q": "Sample Question","at": "0","aurl": "","o": {"o1": {"t": "Option 1","at": "1","aurl": "heder_img - Copy.jpg"},"o2": {"t": "Option 2","at": "2","aurl": "http://www.youtube.com/watch?v=vBTJwVVTfGQ"}}}';
        $decodejson = json_decode($json, TRUE);
        $q = $decodejson['q'];
        $at = $decodejson['at'];
        $aurl = $decodejson['aurl'];

        $query = "insert into poll values(0,$userid,'$user_name','$user_email','$q',$at,'$aurl','$user_ip','$creattime','$pollstartdate','$pollenddate',$pollabuse,$pollvotes)";        $insert = $this->db->query($query);

        if ($insert) {
            echo "sucess";
        } else {
            echo "fail";
        }
        $selectQuery = "select poll_id from poll where poll_title='$q'";
        $result = $this->db->query($selectQuery);
        foreach ($result->Result() as $rows) {
            $poll_id = $rows->poll_id;
        }
 
        $count= count($decodejson['o']);
        for($i=1;$i<$count+1;$i++){
        $t[$i]=($decodejson['o']['o'.$i]['t']);
        $at[$i]=$decodejson['o']['o'.$i]['at'];
        $aurl[$i]=$decodejson['o']['o'.$i]['aurl'];
        }

        for($i=1;$i<$count+1;$i++){
        $insertquery="insert into `option` values(null,$poll_id,'$t[$i]',$at[$i],'$aurl[$i]',0)";
        $insert=$this->db->query($insertquery);
        }
        if($insert){
        echo "sucessfully inserted into option";
        }else{
        echo "fail to insert into option";
        }
   }

}
