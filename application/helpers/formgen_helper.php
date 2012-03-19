<?php

class config{
    public static $server = "192.168.137.1";
    public static $username = "root";
    public static $password = "";
    public static $phpFileExtension = '.php';
}

class formGeneratorStructure{
    public $text;
    public $type;
    public $id;
    public $name;
    public $required;
    public $validation;
    public $errorMessageName;
    public $parameters = array();
    
    public function __construct($labelText,$inputType,$inputId,$inputFieldName,$isRequired,$validationType,$errorMessageName,$otherParameters) {
        $this->text=$labelText;
        $this->type=$inputType;
        $this->id=$inputId;
        $this->name=$inputFieldName;
        $this->required=$isRequired;
        $this->validation=$validationType;
        $this->errorMessageName=$errorMessageName;
        $this->parameters=$otherParameters;
    }
    
    public function createFormElement(){
        return array(
            "text"=>$this->text,
            "type"=>$this->type,
            "id"=>$this->id,
            "name"=>$this->name,
            "required"=>$this->required,
            "validation"=>$this->validation,
            "errorMessage"=>$this->errorMessageName,
            "parameters"=>$this->parameters
        );
    }
}

class validation {
    public static $noValidation = -1;
    public static $numberValidation = 0;
    public static $textValidation = 1;
    public static $emailValidation = 2;
    public static $usernameValidation = 3;

    public static function validate($validationType){
        $success =FALSE;
        switch($validationType){
            case self::$numberValidation:{
            }break;

            case self::$textValidation:{
            }break;

            case self::$emailValidation:{
            }break;
            
            case self::$usernameValidation:{
            }break;
        }
        return $success;
    }
}

class inputTypes{
    public static $Button="button";
    public static $Checkbox="checkbox";
    public static $File="file";
    public static $Hidden="hidden";
    public static $Image="image";
    public static $Password="password";
    public static $Radio="radio";
    public static $Reset="reset";
    public static $Submit="submit";
    public static $Text="text";
    public static $Select = "select";
    public static $Date = "date";
}

class isRequired {
    public static $required = TRUE;
    public static $notRequired = FALSE;
}

class database {
    private static $connection;

    function  __construct() {
        if(!isset(self::$connection)){
            self::$connection = mysql_connect(config::$server,  config::$username,  config::$password);
        }
    }

    function getInstance(){
        if(!isset(self::$connection)){
            self::$connection = mysql_connect(config::$server,  config::$username,  config::$password);
        }
        return $this;
    }

    function connectToDatabase($server,$username,$password,$database){
        $conn=mysql_connect($server,$username,$password);
        if($conn){
            $this->connection=$conn;
            if($this->selectDatabase($database)){
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    function selectDatabase($database){
        $db=mysql_select_db($database, $this->connection);
        if($db){
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

function generateForm($formElements,$submitURL,$style='v',$type='r'){

    
    
    $structure = array(
        0=>"text",
        1=>"type",
        2=>"id",
        3=>"name",
        4=>"required",
        5=>"validation",
        6=>"errorMessage",
        7=>"parameters"
        
    );


    $htmlCode="";

    //$submitURL.=config::$phpFileExtension;

    $htmlCode.='
        <style type="text/css">
input{
border:grey 1px solid;
}
</style>
<script type="text/javascript" src="'.base_url().'js/jquery.js"></script>
<script type="text/javascript" src="'.base_url().'js/jquery-ui-1.8.12.custom.min.js"></script>
    <script type="text/javascript" src="'.base_url().'js/validation.js"></script>
<div style="width:100%" id="gForm">
    <form id = "f1" method="post" action="'.base_url().index_page().'/'.$submitURL.'">
        
        <table width="100%">
                    ';
    $totalElements = count($formElements);
    $innerElements = count($formElements[0]);
    for($i=0;$i<$totalElements;$i++){
        $htmlCode.='
            <tr>
                <td width="50%" align="right">';
        if($formElements[$i][$structure[4]]==TRUE){ //if it is a mandatory field
            $htmlCode.='
                    <span style="color:red;font-size: xx-small;">* </span>';
        }
        $htmlCode.=$formElements[$i][$structure[0]].'
                </td>
                <td align="left">';
        if($formElements[$i][$structure[1]] === inputTypes::$Select){
            $htmlCode.='<select ';
             $htmlCode.='id="'.$formElements[$i][$structure[2]].'" ';
            $htmlCode.='name="'.$formElements[$i][$structure[3]].'" ';
            $htmlCode.='required="'.$formElements[$i][$structure[4]].'" ';
            $htmlCode.='validation="'.$formElements[$i][$structure[5]].'" ';
            $htmlCode.='errorMessage="'.$formElements[$i][$structure[6]].'" >';
            
            $options = count($formElements[$i][$structure[7]]);
            for($j=0;$j<$options;$j++){
                $htmlCode.='<option name = "'.$formElements[$i][$structure[7]][$j][0].'">'.$formElements[$i][$structure[7]][$j][1].'</option>';
            }
            $htmlCode.='</select>';
            
        }else{
            $htmlCode.='<input ';
            $htmlCode.='type="'.$formElements[$i][$structure[1]].'" ';
            $htmlCode.='id="'.$formElements[$i][$structure[2]].'" ';
            $htmlCode.='name="'.$formElements[$i][$structure[3]].'" ';
            $htmlCode.='required="'.$formElements[$i][$structure[4]].'" ';
            $htmlCode.='validation="'.$formElements[$i][$structure[5]].'" ';
            $htmlCode.='errorMessage="'.$formElements[$i][$structure[6]].'" ';
            $jqCode = '';
            if($formElements[$i][$structure[1]] == inputTypes::$Date){
                $htmlCode.='readonly="readonly" ';
                $d=date("Y");
                $jqCode='<script type="text/javascript">$(document).ready(function(){$("#'.$formElements[$i][$structure[2]].'").datepicker({dateFormat:"yy-m-d",changeYear:true,changeMonth:true,yearRange:"1910:'.$d.'",defaultDate:"-12y -363d"})});</script>';
            }
    
            $htmlCode.=' />'.$jqCode;
        }
        $htmlCode.='
                </td>
            </tr>';
    }
    $htmlCode.='
        </table></div><div style="width:100%;">
        <table width="100%">
            <tr>
                <td width="100%" align="center">
                    <input type="button" value="asd" id="';
     if($type=='r'){
        $htmlCode.='rgstr"';
     } else{
         $htmlCode.='lgn"';
     }
    $htmlCode.='/>
                </td>
            </tr>
        </table></div>
    </form><div style="width:100%;text-align:center;color:red;" id="errorField"></div>';
    return $htmlCode;
}

function generateLoginForm($submitUrl){
    $element1 = new formGeneratorStructure("Enter Email Id", inputTypes::$Text, "email", "email", isRequired::$required, validation::$noValidation, "Email Id", NULL);
    $element2 = new formGeneratorStructure("Enter Password", inputTypes::$Password, "pass", "pass", isRequired::$required, validation::$noValidation, "Password", NULL);
                            
    $formElements=array(
        0=>$element1->createFormElement(),
        1=>$element2->createFormElement()
    );
    return generateForm($formElements,$submitUrl,'v','l');
}