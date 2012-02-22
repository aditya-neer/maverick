<?php

class A extends CI_Controller
{
    public function index(){
        $this->load->view('pc');
        //echo 'lol';
    }
    public function uploadFiles(){
        $this->load->model('Uploadfiles');
        $this->Uploadfiles->upload_image();
    }
}
