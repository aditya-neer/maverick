<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

Class Uploadfiles extends CI_Model {

    public function upload_image() {
        if ((($_FILES["file"]["type"] == "image/gif")
                || ($_FILES["file"]["type"] == "image/jpeg")
                || ($_FILES["file"]["type"] == "image/jpg")
                || ($_FILES["file"]["type"] == "image/pjpeg"))
                && ($_FILES["file"]["size"] < 200000000)) {
            if ($_FILES["file"]["error"] > 0) {
                echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
            } else {

                if (file_exists("users/" . $_FILES["file"]["name"])) {
                    echo $_FILES["file"]["name"] . " already exists. ";
                } else {
                    move_uploaded_file($_FILES["file"]["tmp_name"],
                            "users/" . $_FILES["file"]["name"]);
                    echo 'File Uploaded Successfully';
                }
            }
        } else {
            echo "Invalid file";
        }
    }

}

?>
