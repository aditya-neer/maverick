<html>
    <head>
        <title>Welcome</title>
        <?php echo attachStylesheets(array('main'))?>
        <?php echo attachJavascripts(array('jquery'));?>
    </head>
    <body>
        <div id="main">
            <div id="header"></div>
            <div id="content">
                <div id="advert" class="bars"></div>
                <div id="action" class="bars">
                    <div id="oldUser">
                        <?php echo generateLoginForm('a/login'); ?>
                    </div>
                    <hr/>
                    <div id="newUser">
                        New user ? <?php echo anchor('a/showregistration', 'Click here') ?> to get registered.
                    </div>
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>