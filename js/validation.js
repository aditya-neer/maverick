var x = $(document).ready(function(){
   $("#sbmt").bind("click",function(){

       if(checkIfRequiredFieldsAreNotEmpty()){
           if(performDatatypeValidation()){
               if(validatePasswords()){
                   document.getElementById('f1').submit();
               }else {
                   
               }
           } else {
               
           }
       } else {
           
       }
       
    });
});

function validation() {
    this.noValidation = -1;
    this.numberValidation = 0;
    this.textValidation = 1;
    this.emailValidation= 2;
    this.userNameValidation = 3;
}

function validate(validationType,stringToBeValidated){
    var v = new validation();
    var textPattern = /^[a-zA-Z]*$/;
    var numberPattern = /^[0-9]*/;
    var emailPattern = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/;
    var usernamePattern = /^[a-zA-Z0-9_]*$/;
    
    if(validationType == v.numberValidation){
        if(stringToBeValidated.match(numberPattern)){
            return true;
        } else {
            return false;
        }
    } else if(validationType == v.textValidation){
        if(stringToBeValidated.match(textPattern)){
            return true;
        } else {
            return false;
        }
    } else if(validationType == v.emailValidation){
        if(stringToBeValidated.match(emailPattern)){
            return true;
        } else {
            return false;
        }
    } else if(validationType == v.userNameValidation){
        if(stringToBeValidated.match(usernamePattern)){
            return true;
        } else {
            return false;
        }
    } else if(validationType == v.noValidation) {
        return true;
    }
    
    return false;
    
}

function performDatatypeValidation(){
    var i=0;
    var len = document.getElementById("gForm").getElementsByTagName("input").length;
    var isError = 0;
    var errorMessage = "";
    
    while(i<len){
        var isElement = document.getElementById("gForm").getElementsByTagName("input")[i];
        if(isElement){
            var validationType = isElement.getAttribute("validation");
            var stringToBeValidated = isElement.value;
            var elementAttr = isElement.getAttribute("errorMessage");
            if(validate(validationType,stringToBeValidated)){
                applyOKStyle(isElement);
            } else {
                applyErrorStyle(isElement);
                isError = 1;
                errorMessage+="Invalid "+elementAttr+"<br />";
            }
        }
        i++;
    }
    if(isError){
        dispayErrorMessage(errorMessage);
        return false;
    } else {
        hideErrorMessage();
        return true;
        //alert("success");
    }
    
}

function checkIfRequiredFieldsAreNotEmpty(){

    //alert("to while loop");
    var errorMessage = "* Oops Some Errors occured. Please make sure the field indicated by red border are correctly filled.";

    var i=0;
    var len = document.getElementById("gForm").getElementsByTagName("input").length;
    var isError = 0;
    //alert(len);
    while(i<len){
        
        var isElement = document.getElementById("gForm").getElementsByTagName("input")[i];
        if(isElement){
            var Name = isElement.name;
            var Type = isElement.type;
            var Value = isElement.value;
            var isRequired = isElement.getAttribute('required');
            //alert("Name - "+Name+" | Type - "+Type+" | Value - "+Value);
            
            if(isRequired==1){
                if(!Value.match(/\S/)){
                    //alert("failed at - "+Name);
                    isError=1;
                    applyErrorStyle(isElement);
                    dispayErrorMessage(errorMessage);
                } else {
                    applyOKStyle(isElement);
                }
            } else {
                if(!Value.match(/\S/)){
                    //alert("failed at - "+Name+" But Its OK, since its not mandatory");
                } else {
                    applyOKStyle(isElement);
                }
            }

            if(i==len-1){
                if(!isError){
                    hideErrorMessage();
                }

            }

        } 
        i++;
    }
    var returnValue=false;
    if(!isError){
        returnValue=true;
    }
    return returnValue;
}

function validatePasswords(){
    var errorMessage = "The two passwords do not match";
    var inputs = document.getElementsByTagName("input");
    var passFields = new Array();
    var passDivs = new Array();
    var len = inputs.length;
    var j=0;
    var isError =0;
    for(var i=0;i<len;i++){
        if(inputs[i].type == 'password'){
            passDivs[j]=inputs[i];
            j++;
        }
    }
    if(j>1){
        if(passDivs[0].value == passDivs[1].value) {
            isError=0;
            applyOKStyle(passDivs[0]);
            applyOKStyle(passDivs[1]);
        } else {
            isError=1;
            applyErrorStyle(passDivs[0]);
            applyErrorStyle(passDivs[1]);
        }
    }
    
    if(isError){
        dispayErrorMessage(errorMessage);
        return false;
    } else {
        hideErrorMessage();
        return true;
    }
}

function applyErrorStyle(elementPointer){
    elementPointer.setAttribute("style","border: red 1px solid;background-color:yellow;color:black");
}

function applyOKStyle(elementPointer){
    elementPointer.setAttribute("style","border: grey 1px solid;background-color:white;color:black");
}

function dispayErrorMessage(errorMessage){
    hideErrorMessage();
    $("#errorField").html(errorMessage);
}

function hideErrorMessage(){
    $("#errorField").empty();
};