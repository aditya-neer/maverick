$(document).ready(function(){
    createQuestion();
    createOption();
});

function getTotalOptionDivisions(){
    var mainWrapper = $("#opts .wrapper");
    var total = mainWrapper.length;
    return total;
}

function cleanUp(divId){
    $("#"+divId).empty();
}

function removeMe(divId){
    adjustLabelling(divId);
    $("#wrapper"+divId).hide("explode", 750);
    setTimeout(function(){$("#wrapper"+divId).remove();}, 10);
    setTimeout(function(){
        if(getTotalOptionDivisions()>2){
            $('.remove').css('display','block');
        }else{
            $('.remove').css('display','none');
        }
    },10);
}

function adjustLabelling(divId){
    $("#wrapper"+divId).hide("explode", 750);
    setTimeout(function(){
        $("#wrapper"+divId).remove();
    }, 10);
    setTimeout(function(){
        var t = getTotalOptionDivisions();
        var i=1;
        $('div[id*="wrapper"] div[id*="labelWrapper"]').each(function(){
            $(this).html("Option - "+i);
            i++;
        });
    },10);
}

function addOptions(){
    alert('adding');
}

function changeInputType(inputType,inputAreaId){
    var ipt = new inputTypes();
    var inputDiv;
    switch(inputType){
        case ipt.inputTypeNothing:{
                cleanUp("inpt"+inputAreaId);
        }break;
        case ipt.inputTypeImage:{
                cleanUp("inpt"+inputAreaId);
                inputDiv = createInputBoxes(inputType, inputAreaId);

        }break;
        case ipt.inputTypeVideo:{
                cleanUp("inpt"+inputAreaId);
                inputDiv = createInputBoxes(inputType, inputAreaId);
        }break;
        default:{
                cleanUp("inpt"+inputAreaId);
        }break;
    }
    document.getElementById('inpt'+inputAreaId).appendChild(inputDiv);
}

function createInputBoxes(inputType,inputAreaId){
    var ilt = new inputLabelTexts();
    var ipt = new inputTypes();

    var div = document.createElement('div');
    div.id="iptDiv"+inputAreaId;
    div.setAttribute('style', 'margin:5px 0px 0px 0px;padding:5px 0px 0px 0px;border-top:black 1px solid;');
    var label = document.createElement('label');
    var input = document.createElement('input');

    switch(inputType){
        case ipt.inputTypeImage:{
                label.innerHTML=ilt.imageInputLabelText;
                input.type="file";
        }break;
        case ipt.inputTypeVideo:{
                label.innerHTML=ilt.videoInputLabelText;
                input.type="text";
        }break;
        default:{
               alert('Invalid input Type');
        }break;
    }
    div.appendChild(label);
    div.appendChild(input);
    return div;
}

function createQuestion(){
    var total = getTotalOptionDivisions();
    var newName = total+1;

    var next = $("#opts .wrapper:last-child");
    var newDiv=next.attr('id');
    if(newDiv){
        newDiv=newDiv.match(/\d+/);
        newDiv++;
    } else{
        newDiv=1;
    }

    jQuery('<div/>', {
    }).attr('class','wrapper').appendTo('#pt');

    jQuery('<div/>', {
        text:'Enter title for your poll'
    }).attr('class','ptitle').appendTo('#pt');

    jQuery('<div/>', {
        id:'oc'
    }).attr('class','oc').appendTo('#pt');

    jQuery('<table/>', {
    }).appendTo('#pt #oc');

    jQuery('<tr/>', {
    }).appendTo('#pt #oc table');

    jQuery('<td/>', {
        id:'pt_td1',
        style:'width:90%'
    }).appendTo('#pt #oc table tr');

    jQuery('<textarea/>', {
        rows:'5',
        style:'width:99%;'
    }).appendTo('#pt #oc #pt_td1');

    jQuery('<label/>', {
        text:'Wanna attach something to this question?'
    }).appendTo('#pt #oc #pt_td1');

    jQuery('<span/>', {
        id:'radios'
    }).appendTo('#pt #oc #pt_td1');

    jQuery('<input/>', {
        type:'radio',
        name:'attachment',
        value:'0'
    }).bind('click',function(){
        changeInputType(0,'');
    }).attr('checked','TRUE').appendTo('#pt #oc #pt_td1 #radios');

    jQuery('<label/>', {
        text:'Nothing '
    }).appendTo('#pt #oc #pt_td1 #radios');

    jQuery('<input/>', {
        type:'radio',
        name:'attachment',
        value:'1'
    }).bind('click',function(){
        changeInputType(1,'');
    }).appendTo('#pt #oc #pt_td1 #radios');

    jQuery('<label/>', {
        text:'Image '
    }).appendTo('#pt #oc #pt_td1 #radios');

    jQuery('<input/>', {
        type:'radio',
        name:'attachment',
        value:'2'
    }).bind('click',function(){
        changeInputType(2,'');
    }).appendTo('#pt #oc #pt_td1 #radios');

    jQuery('<label/>', {
        text:'Video '
    }).appendTo('#pt #oc #pt_td1 #radios');

    jQuery('<div/>', {
        id:'inpt'
    }).attr('class','inpt').appendTo('#pt #oc #pt_td1');
}

function createOption(){

    var total = getTotalOptionDivisions();
    var newName = total+1;

    var next = $("#opts .wrapper:last-child");
    var newDiv=next.attr('id');
    if(newDiv){
        newDiv=newDiv.match(/\d+/);
        newDiv++;
    } else{
        newDiv=1;
    }

    jQuery('<div/>', {
        id:'wrapper'+newDiv
    }).attr('class','wrapper').appendTo('#opts');

    jQuery('<div/>', {
        id:'labelWrapper'+newDiv,
        text:'Option - '+newName
    }).attr('class','labelWrapper').appendTo('#wrapper'+newDiv);

    jQuery('<div/>', {
        id:'oc'+newDiv
    }).attr('class','oc').appendTo('#wrapper'+newDiv);

    jQuery('<table/>', {
        id:'tbl'+newDiv
    }).appendTo('#oc'+newDiv);

    jQuery('<tr/>', {
        id:'tbl_tr'+newDiv
    }).appendTo('#tbl'+newDiv);

    jQuery('<td/>', {
        id:'tbl_tr_td1_'+newDiv,
        style:'width:90%'
    }).appendTo('#tbl_tr'+newDiv);

    jQuery('<textarea/>', {
        id:'ta'+newDiv,
        rows:'5',
        style:'width:100%;'
    }).appendTo('#tbl_tr_td1_'+newDiv);

    jQuery('<label/>', {
        text:'Wanna attach something to this option?'
    }).appendTo('#tbl_tr_td1_'+newDiv);

    jQuery('<span/>', {
        id:'radios'+newDiv
    }).appendTo('#tbl_tr_td1_'+newDiv);

    jQuery('<input/>', {
        type:'radio',
        name:'attachment'+newDiv,
        value:'0'
    }).bind('click',function(){
        changeInputType(0,newDiv);
    }).attr('checked','TRUE').appendTo('#radios'+newDiv);

    jQuery('<label/>', {
        text:'Nothing '
    }).appendTo('#radios'+newDiv);

    jQuery('<input/>', {
        type:'radio',
        name:'attachment'+newDiv,
        value:'1'
    }).bind('click',function(){
        changeInputType(1,newDiv);
    }).appendTo('#radios'+newDiv);

    jQuery('<label/>', {
        text:'Image '
    }).appendTo('#radios'+newDiv);

    jQuery('<input/>', {
        type:'radio',
        name:'attachment'+newDiv,
        value:'2'
    }).bind('click',function(){
        changeInputType(2,newDiv);
    }).appendTo('#radios'+newDiv);

    jQuery('<label/>', {
        text:'Video '
    }).appendTo('#radios'+newDiv);

    jQuery('<div/>', {
        id:'inpt'+newDiv
    }).attr('class','inpt').appendTo('#tbl_tr_td1_'+newDiv);

    jQuery('<td/>', {
        id:'tbl_tr_td2_'+newDiv,
        style:'width:10%'
    }).appendTo('#tbl_tr'+newDiv);

    jQuery('<img/>', {
        src:'Icon_Delete.gif',
        id:'remove'+newDiv
    }).bind('click',function(){
        removeMe(newDiv);
    }).attr('class','remove').appendTo('#tbl_tr_td2_'+newDiv);
    if(total>1){
        $('.remove').css('display','block');
    } else {
        $('.remove').css('display','none');
    }
}

function createJSON(){
    var options = new Array();
    var attachmentTypes = new Array();
    var attachments = new Array();
    var question = new Array();
    var i=0,j=0,k=0,l=0,x=0;

    question[l++]=$("#pt textarea").val();

    $('#pt input[type="radio"]').each(function(){
        if($(this).attr('checked')=='checked'){
            x=$(this).val();
        }
    });
    question[l++]= x;
    if(x==2){
        question[l++]=$('#pt input[type="text"]').val();
    } if(x==1){
        question[l++]=$('#pt input[type="file"]').val().replace("C:\\fakepath\\","");
    }else{
        question[l++]='';
    }


    $('#opts .wrapper textarea').each(function(){
        options[i++]=$(this).val();
    });

    $('#opts .wrapper').each(function(){
        $(this).find('input[type="radio"]').each(function(){
            if($(this).attr('checked')){
                attachmentTypes[j++]=$(this).val();
            }
        });
    });

    $('#opts .wrapper div[id*="inpt"]').each(function(){
        if(attachmentTypes[k]==2){
            attachments[k] = $(this).find('input[type="text"]').val();
        } else if(attachmentTypes[k]==1){
            attachments[k] = $(this).find('input[type="file"]').val().replace("C:\\fakepath\\","");
        } else {
            attachments[k]='';
            alert('Nothing to be attached');
        }
        k++;
    });
    var json = buildActualJSON(question,options,attachmentTypes,attachments);
    document.write(json);
}

function buildActualJSON(question,options,attachmentTypes,attachments){
    var json='{"q":"'+question[0]+'","at":"'+question[1]+'","aurl":"'+question[2]+'",';
    var count=options.length;
    var i,j,k;
    json+= '"o":{'; // TODO while integrating remove the first {
    for(i=0;i<count;i++){
        json+='"o'+(i+1)+'":{"t":"'+options[i]+'","at":"'+attachmentTypes[i]+'","aurl":"'+attachments[i]+'"}';
        if(i<(count-1)){
            json+=','
        }
    }
    json+='}}';
    return json;
}