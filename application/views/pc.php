<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Test</title>
        <?php
            echo attachStylesheets(array('main','jquery-ui-1.8.16.custom'));
            echo attachJavascripts(array('jquery','jquery-ui-1.8.16.custom.min','config','newpoll'));
        ?>
<!--        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="js/config.js"></script>
        <script type="text/javascript" src="js/newpoll.js"></script>-->
    </head>
    <body>
        <div id="cpc">
            <div id="pt">
            </div>
            <div id="opts">
            </div>
            <div id="controls">
                <input type="button" value="Create Poll" id="cp_btn" onclick="createJSON()" />
                <input type="button" value="Add more options" id="addOpts" onclick="createOption()"/>
            </div>
        </div>
    </body>
</html>