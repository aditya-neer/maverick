$(document).ready(function(){
    //var json = '{"list": [{"questionId": "1","question": "Question text entered by user","image": "","video": "http://www.youtube.com/embed/anOTJh9BKug","creator": "Aditya","creation": "8-12-2011","options": [{"optionId": "1","option": "OPtion text entered by user","image": "images/car.jpg","video": ""},{"optionId": "2","option": "OPtion text entered by user","image": "images/car.jpg","video": ""}],"totalComments": "15","comments": [{"commentId": "1","comment": "Comment Text","commentator": {"name": "Aditya","display": "images/up.gif"}}]}]}';
    var json = '{"list": [{"questionId": "1","question": "Who is best?","image": "","video": "","creator": "Aditya","creation": "8-12-2011","options": [{"optionId": "1","option": "Ronaldo(Brazil)","image": "","video": ""},{"optionId": "2","option": "Zidane","image": "","video": ""},{"optionId": "3","option": "Pele","image": "","video": ""}],"totalComments": "3","comments": [{"commentId": "1","comment": "Ronaldo!!! always","commentator": {"name": "Aditya","display": "images/up.gif"}},{"commentId": "2","comment": "Ronaldo - *RESPECT*","commentator": {"name": "Mr.LOL","display": "images/up.gif"}},{"commentId": "3","comment": "Pele","commentator": {"name": "qqwe","display": "images/up.gif"}}]},{"questionId": "2","question": "Which car is best?","image": "","video": "","creator": "Rajiv","creation": "8-12-2011","options": [{"optionId": "4","option": "BMW","image": "","video": ""},{"optionId": "5","option": "Ferrari","image": "","video": ""},{"optionId": "6","option": "Tata Nano","image": "","video": ""},{"optionId": "7","option": "Wagon-R","image": "","video": ""},{"optionId": "8","option": "Haatgaadi","image": "","video": ""},{"optionId": "9","option": "Best is yet to come","image": "","video": ""}],"totalComments": "10","comments": [{"commentId": "4","comment": "Hahaha! Best is yet to come","commentator": {"name": "Aditya","display": "images/up.gif"}},{"commentId": "5","comment": "Shit!!! This was great","commentator": {"name": "Mr.LOL","display": "images/up.gif"}},{"commentId": "6","comment": "zzzz","commentator": {"name": "Piyush","display": "images/up.gif"}},{"commentId": "7","comment": "chya maila","commentator": {"name": "Omya","display": "images/up.gif"}},{"commentId": "8","comment": "This was one of the extraordinary question man","commentator": {"name": "Nikhil","display": "images/up.gif"}},{"commentId": "9","comment": "Aaichya gaawat","commentator": {"name": "Shrikant","display": "images/up.gif"}},{"commentId": "10","comment": "Jai Ho!","commentator": {"name": "Rajiv","display": "images/up.gif"}},{"commentId": "11","comment": "Pahe he","commentator": {"name": "Kurhe","display": "images/up.gif"}},{"commentId": "12","comment": "Good one","commentator": {"name": "Kedar","display": "images/up.gif"}},{"commentId": "13","comment": "this is the german technology.... (other technical bullshit)","commentator": {"name": "Yo!","display": "images/up.gif"}}]},{"questionId": "1","question": "Who is best?","image": "","video": "","creator": "Aditya","creation": "8-12-2011","options": [{"optionId": "1","option": "Ronaldo(Brazil)","image": "","video": ""},{"optionId": "2","option": "Zidane","image": "images/car.jpg","video": ""},{"optionId": "3","option": "Pele","image": "","video": ""}],"totalComments": "3","comments": [{"commentId": "1","comment": "Ronaldo!!! always","commentator": {"name": "Aditya","display": "images/up.gif"}},{"commentId": "2","comment": "Ronaldo - *RESPECT*","commentator": {"name": "Mr.LOL","display": "images/up.gif"}},{"commentId": "3","comment": "Pele","commentator": {"name": "qqwe","display": "images/up.gif"}}]}]}';
    //var json = '{"list": [{"questionId": "1","question": "Who is best?","image": "","video": "","creator": "Aditya","creation": "8-12-2011","options": [{"optionId": "1","option": "Ronaldo(Brazil)","image": "","video": ""},{"optionId": "2","option": "Zidane","image": "","video": ""},{"optionId": "3","option": "Pele","image": "","video": ""}],"totalComments": "3","comments": [{"commentId": "1","comment": "Ronaldo!!! always","commentator": {"name": "Aditya","display": "images/up.gif"}},{"commentId": "2","comment": "Ronaldo - *RESPECT*","commentator": {"name": "Mr.LOL","display": "images/up.gif"}},{"commentId": "3","comment": "Pele","commentator": {"name": "qqwe","display": "images/up.gif"}}]}]}';
    showPolls('test',json);
});

function determineAttachmentType(image,video){
    var returnValue=-1; // -1 for no attachment
    if(image!='' && video==''){
        returnValue=0; // O For image
    }
    if(image=='' && video!=''){
        returnValue=1; // 1 For video
    }
    return returnValue;
}

function createQuestionDivision(){}

function showPolls(divId,json){
    var myObject = eval('(' + json + ')');
    var total = myObject.list.length;
    createMainWrapper(divId); // Main UL Element that wraps all the polls
    for(var i=0;i<total;i++){
        var questionId = myObject.list[i].questionId;
        var question = myObject.list[i].question;
        var creator = myObject.list[i].creator;
        var creation = myObject.list[i].creation;
        var image = myObject.list[i].image;
        var video = myObject.list[i].video;
        var options = myObject.list[i].options;
        var totalComments = myObject.list[i].totalComments;
        var comments = myObject.list[i].comments;

        var attachmentType=determineAttachmentType(image, video);
        var attachmentURL;

        if(attachmentType==0){attachmentURL=image;}
        else if(attachmentType==1){attachmentURL=video;}
        else{attachmentURL="";}
        var questionData = new Array(questionId,question,attachmentType,attachmentURL,creator,creation);
        createQuestionElement(i,questionData);  // List Element that wraps a question
        createOptionElement(i,questionId,options);
        createCommentElement(i,questionId,totalComments,comments);
        //delete questionId,question,questionData,comments,creation,creator,image,video,options,totalComments;
    }
}

function createMainWrapper(divId){
    jQuery('<ul />').attr('class','pList').appendTo("#"+divId);
}

function createQuestionElement(count,questionData){
    jQuery('<li />',{id:'q'+count}).attr('style','margin:10px 0px 10px 0px;').appendTo('.pList');
    createInnerWrapper(count);
    createQuestionWrapper(count);
    createQuestionDivision(count,questionData);
}

function lol(){
    return;
}

function createInnerWrapper(count){
    jQuery('<div />',{id:'qd'}).attr('class','pDiv').appendTo('#q'+count);
}

function createQuestionWrapper(count){
    jQuery('<ul />').appendTo('#q'+count+' #qd');
}

function createQuestionDivision(count,questionData){
    var qId = questionData[0];
    var q = questionData[1];
    var a = questionData[2];
    var u = questionData[3];
    var ct = questionData[4];
    var cr = questionData[5];

    var t1td1 = jQuery('<td />').attr('class','qAttachment');

    var t1td2 = jQuery('<td />',{text:q}).attr('class','qText');
    var t1td3 = jQuery('<td />',{text:'[x]'}).attr('class','qClose').bind('click',function(){
        closeQuestion(qId,count);
    });

    var t1tr = jQuery('<tr />');

    if(a==0){
        var img = jQuery('<img />',{src:u}).attr('class','qAImg');
        t1td1.append(img);
        t1tr.append(t1td1);
    } else if(a==1){
        var iframe = jQuery('<iframe />').attr({src:u,height:"100%",width:"100%",frameborder:"1",allowfullscreen:"TRUE"});
        t1td1.append(iframe);
        t1tr.append(t1td1);
    }

    t1tr.append(t1td2);
    t1tr.append(t1td3);

    var t1 = jQuery('<table />').append(t1tr);

    var creation = "Created by "+ct+" on "+cr;
    var t2td = jQuery('<td />',{text:creation});

    var t2tr = jQuery('<tr />').attr('class','qFooter').append(t2td);
    var t2 = jQuery('<table />').append(t2tr);

    var liElem = jQuery('<li />').append(t1);
    liElem.append(t2);
    liElem.appendTo("#q"+count+" #qd ul");

    createSeparator(count,'qd');
}

function createQuestionFooter(count,creator,creation){
    jQuery('<table />',{id:'q'+count+'_t2'}).appendTo('#q'+count+' ul li');
    jQuery('<tr />').attr('class','qFooter').appendTo('#q'+count+'_t2');
    jQuery('<td />',{text:'Created by - '+creator+' on '+creation}).appendTo('#q'+count+'_t2 tr');
}

function createSeparator(count,id){
    jQuery('<li />').attr('class','separator').appendTo("#q"+count+" #"+id+" ul");
}

function createOptionElement(count,qId,options){

    var ul = jQuery('<ul />');
    var div = jQuery('<div />',{id:'od'}).attr('class','pDiv').append(ul).appendTo('#q'+count);
    
    var totalOptions = options.length;
    for(var i=0;i<totalOptions;i++){
        createOption(count,options[i],qId);
    }
}

function createOption(count,optionDetails,qId){
    var oId = optionDetails.optionId;
    var o = optionDetails.option;
    var image = optionDetails.image;
    var video = optionDetails.video;
    var a = determineAttachmentType(image, video);

    var t1td1 = jQuery('<td />').attr('class','oAttachment');

    var t1td2 = jQuery('<td />',{text:o}).attr('class','oText').bind('click',function(){
        registerVote(qId, oId, count);
    });
//    var t1td3 = jQuery('<td />',{text:'?'}).attr('class','oHelp').bind('click',function(){
//        helpOption(qId, oId, count);
    var t1td3 = jQuery('<td />',{text:'?'}).attr('class','oHelp').attr('onclick','helpOption('+qId+','+ oId+','+ count+')');
    //});

    var t1tr = jQuery('<tr />');

    if(a==0){
        var img = jQuery('<img />',{src:image}).attr('class','oImg');
        t1td1.append(img);
        t1tr.append(t1td1);
    } else if(a==1){
        var iframe = jQuery('<iframe />').attr({src:video,height:"100%",width:"100%",frameborder:"1",allowfullscreen:"TRUE"});
        t1td1.append(iframe);
        t1tr.append(t1td1);
    }

    t1tr.append(t1td2);
    t1tr.append(t1td3);

    var t1 = jQuery('<table />').append(t1tr);

    var liElem = jQuery('<li />').append(t1);
    liElem.appendTo("#q"+count+" #od ul");
}

function createCommentElement(count,qId,total,comments){
    var anchor = jQuery('<a />',{text:total+' Comments'});
    var li = jQuery('<li />').attr('class','commentHeader').append(anchor);
    var ul = jQuery('<ul />').append(li);
    var div = jQuery('<div />',{id:'cd'}).attr('class','pDiv').append(ul).appendTo('#q'+count);
    var tc = comments.length;
    
    for(var i=0;i<tc;i++){
        
        createComment(count,comments[i],qId);
    }
}

function createComment(count,comment,qId){

    var cId = comment.commentId;
    var cText = comment.comment;
    var commentator = comment.commentator.name;
    var picURL = comment.commentator.display;

    var li1 = jQuery('<li />',{text:commentator}).attr('style','font-weight: bold;cursor:pointer').bind('click',function(){
        loadProfile(commentator);
    });
    var li2 = jQuery('<li />',{text:cText});
    var li3 = createCommentAction(cId, qId);

    var iul = jQuery('<ul />').attr('style','margin-left:10px;').append(li1);
    iul.append(li2);
    iul.append(li3);

    var img = jQuery('<img />',{src:picURL});
    var td1 = jQuery('<td />').attr('class','pp').append(img);
    var td2 = jQuery('<td />').append(iul);

    var tr = jQuery('<tr />').append(td1);
    tr.append(td2);

    var table = jQuery('<table />').append(tr);

    var li = jQuery('<li />').append(table).appendTo($('#q'+count+' #cd ul').get(0));
    //delete cId,cText,commentator,picURL,li,table,tr,td1,img,td2,iul,li1,li2,li3;

}

function closeQuestion(qId,divId){
    //TODO implementation
    alert("Hide #q"+divId+" and report questionId="+qId);
}

function helpOption(qId,oId,divId){
    alert('Show Details of '+oId+' option :)');
    // TODO implementation
}

function createCommentAction(cId,qId){
    var actionIds = new Array(0,1,2,3); // 0 - Thumbs up 1 - thumbs down 2 - reply 3 - Challenge
    var actions = new Array('Thumbs up','Thumbs down','Reply','Challenge');
    var li = jQuery('<li />').attr('class','cursor');
    var t = actions.length;
    for(var i=0;i<t;i++){
        var se = jQuery('<span />',{text:actions[i]}).bind('click',function(){
            actionOnComment(cId,qId,actionIds[i]);
        }).attr('class','cursor actn').appendTo(li);
    }
    return li;
}

function actionOnComment(cId,qId,aId){
    alert('Perform action - '+aId+' on comment - '+cId+' of question - '+qId);
}

function loadProfile(username){
    alert('Load profile for user - '+username);
}