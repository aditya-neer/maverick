function registerVote(qId,oId,divId){

    showActivityForDiv(divId);

//    $.post('target.php',{'qId':qId,'oId':oId},function(){
//
//    });
}

function showActivityForDiv(divId){
    var activityDiv = $("#q"+divId+" div").get(1);
    var n = $(activityDiv).position();
    var st="position:absolute;top:"+n.top+"px;left:0px;height:"+$(activityDiv).css('height')+";width:"+$(activityDiv).css('width')+";text-align:center;background-color: gray;opacity:0.3;filter: alpha(opacity=70);;";
    jQuery('<div />',{id:"act"}).attr('style',st).appendTo(activityDiv).append(jQuery('<img />',{src:"images/proc4.gif"}).attr('style','position:relative;top:48%;'));
}