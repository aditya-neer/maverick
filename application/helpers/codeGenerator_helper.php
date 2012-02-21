<?php

if (!function_exists('attachStylesheets')) {
    function attachStylesheets($stylesheets){
        $htmlCode = '';
        if(is_array($stylesheets)){
            $len = count($stylesheets);
            for($i=0;$i<$len;$i++){
                $htmlCode.='<link rel="stylesheet" type="text/css" href="'.base_url().'css/'.$stylesheets[$i].'.css" />';
            }
        } else{
            $htmlCode='<link rel="stylesheet" type="text/css" href="'.base_url().'css/'.$stylesheets.'.css" />';
        }
        return $htmlCode;
    }
}

if (!function_exists('attachJavascripts')) {
    function attachJavascripts($javascripts){
        $htmlCode = '';
        if(is_array($javascripts)){
            $len = count($javascripts);
            for($i=0;$i<$len;$i++){
                $htmlCode.='<script type="text/javascript" src="'.base_url().'js/'.$javascripts[$i].'.js"></script>';
            }
        } else{
            $htmlCode='<script type="text/javascript" src="'.base_url().'js/'.$javascripts.'.js"></script>';
        }
        return $htmlCode;
    }
}