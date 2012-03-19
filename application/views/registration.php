<?php echo attachStylesheets($styleSheets); ?>
<div id="regDiv">
<?php
    
    $selectableElements = array(
        array("m","Male"),
        array("f","Female"),
        array("n","Prefer not to say")
    );
    
    $element1 = new formGeneratorStructure("Enter First Name", inputTypes::$Text, "fname", "fname", TRUE, validation::$textValidation, "First Name", NULL);
    $element2 = new formGeneratorStructure("Enter Last Name", inputTypes::$Text, "lname", "lname", TRUE, validation::$textValidation, "Last Name", NULL);
    $element3 = new formGeneratorStructure("Enter Username", inputTypes::$Text, "uname", "uname", TRUE, validation::$usernameValidation, "Username", NULL);
    $element4 = new formGeneratorStructure("Enter Password", inputTypes::$Password, "upass", "upass", TRUE, NULL, "Password", NULL);
    $element5 = new formGeneratorStructure("Confirm Password", inputTypes::$Password, "cupass", "cupass", TRUE, NULL, "Confirm Password", NULL);
    $element6 = new formGeneratorStructure("Enter Email Id", inputTypes::$Text, "email", "email", TRUE, validation::$emailValidation, "Email address", NULL);
    //$element7 = new formGeneratorStructure('Enter Gender', inputTypes::$Text, 'sex', 'sex', TRUE, validation::$textValidation, "Gender", NULL);
    $element7 = new formGeneratorStructure('Enter Gender', inputTypes::$Select, 'sex', 'sex', TRUE, NULL, "Gender", $selectableElements);
    $element8 = new formGeneratorStructure('Enter Date of Birth', inputTypes::$Date, 'dob', 'dob', TRUE, NULL, 'Date of Birth', NULL);

    $formElements=array(
        0=>$element1->createFormElement(),
        1=>$element2->createFormElement(),
        2=>$element3->createFormElement(),
        3=>$element4->createFormElement(),
        4=>$element5->createFormElement(),
        5=>$element6->createFormElement(),
        6=>$element7->createFormElement(),
        7=>$element8->createFormElement()
    );
        
    $submitURL = 'a/register';
        
    echo generateForm($formElements,$submitURL);
?>
</div>