function maverick(){
    this.base_url = "http://localhost/saywtf/";
    this.index_base_url = "http://localhost/saywtf/index.php/";
    this.images = "images/";
    this.base_controller = "a/";
    this.close_image = "Icon_Delete.gif";
}

function inputTypes () {
    this.inputTypeNothing = 0;
    this.inputTypeImage = 1;
    this.inputTypeVideo = 2;
    
}

function inputLabelTexts(){
    this.imageInputLabelText="Select the image to  upload - ";
    this.videoInputLabelText="Enter youtube URL of the video - ";
}