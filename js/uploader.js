/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function getNewIframe(id){
    var iFrame = document.createElement('iFrame');
    iFrame.setAttribute('id', id);
    iFrame.setAttribute("name", id);
    iFrame.setAttribute("width", "10");
    iFrame.setAttribute("height", "10");
    iFrame.setAttribute("border", "10");
    iFrame.setAttribute("style", "width: 0; height: 0; border: none;");
    return iFrame;
}
function createForm(iframeId,action_url){
    var form = document.createElement('form');
    form.setAttribute("target", iframeId);
    form.setAttribute("action", action_url);
    form.setAttribute("method", "post");
    form.setAttribute("enctype", "multipart/form-data");
    form.setAttribute("encoding", "multipart/form-data");
    return form;
}
function uploadImage(fileInput,div_id,action_url){
    iFrameId = 'iFrame'+div_id;
    iframe = getNewIframe(iFrameId);
    document.getElementById(div_id).appendChild(iframe);
    var form = createForm(iFrameId, action_url);
    document.getElementById(div_id).appendChild(form);
    fileInput.setAttribute('name', 'file');
    form.appendChild(fileInput);
    var eventHandler = function () {

        if (iframe.detachEvent) iframe.detachEvent("onload", eventHandler);
        else iframe.removeEventListener("load", eventHandler, false);
        if (iframe.contentDocument) {
            content = iframe.contentDocument.body.innerHTML;
        } else if (iframe.contentWindow) {
            content = iframe.contentWindow.document.body.innerHTML;
        } else if (iframe.document) {
            content = iframe.document.body.innerHTML;
        }

        document.getElementById(div_id).innerHTML = content;
    }
    if (iframe.addEventListener) iframe.addEventListener("load", eventHandler, true);
    if (iframe.attachEvent) iframe.attachEvent("onload", eventHandler);
    
    form.submit();
    
}
$(document).ready(function(){
    $("#cp_btn").bind("click",function(){
        var elements = $('.oc input:file');
        var totalFiles = elements.size();
        for (var i=0;i< totalFiles;i++) {
            iptDiv = "iptDiv"
            if(i!=0)
                iptDiv = iptDiv+i
            element = elements[i]
            
            uploadImage(element, iptDiv,  "http://localhost/project/saywtf/index.php/a/uploadFiles");
        }
        return false;

    });
    
});
