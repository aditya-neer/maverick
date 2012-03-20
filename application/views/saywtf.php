<html>
    <head>
        <title>Welcome</title>
        <?php echo attachStylesheets($styleSheets)?>
        <?php echo attachJavascripts($javascripts);?>
        <script type="text/javascript">
            function show(id){
                alert('Id is - '+id);
            }
        </script>
    </head>
    <body>
        <div id="mainContainer">
            <div id="header">
                <ul>
                    <li><a href="#">Welcome, Maverick</a></li>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Logoff</a></li>
                </ul>
            </div>
            <div id="sidebar">
                <div style="margin: 10px 0px 10px 0px;">
                    <div style="width: 100%;height: 5%;background-color: yellowgreen; margin: 5px 0px 5px 0px;cursor: pointer;" onclick="show(1)">
                        <label style="position: absolute; margin:5px 0px 0px 5px;cursor: pointer;">Create New Poll</label>
                        <label style="position: absolute;left:90%;margin-top: 7px;cursor: pointer;"> >> </label>
                    </div>
                    
                    <div style="width: 100%;height: 5%;background-color: yellowgreen; margin: 5px 0px 5px 0px;cursor: pointer;" onclick="show(2)">
                        <label style="position: absolute; margin:5px 0px 0px 5px;cursor: pointer;">Create New Poll</label>
                        <label style="position: absolute;left:90%;margin-top: 7px;cursor: pointer;"> >> </label>
                    </div>
                    
                    <div style="width: 100%;height: 5%;background-color: yellowgreen; margin: 5px 0px 5px 0px;cursor: pointer;" onclick="show(3)">
                        <label style="position: absolute; margin:5px 0px 0px 5px;cursor: pointer;">Create New Poll</label>
                        <label style="position: absolute;left:90%;margin-top: 7px;cursor: pointer;"> >> </label>
                    </div>
                    
                    <div style="width: 100%;height: 5%;background-color: yellowgreen; margin: 5px 0px 5px 0px;cursor: pointer;" onclick="show(4)">
                        <label style="position: absolute; margin:5px 0px 0px 5px;cursor: pointer;">Create New Poll</label>
                        <label style="position: absolute;left:90%;margin-top: 7px;cursor: pointer;"> >> </label>
                    </div>
                    
                </div>
                
            </div>
            <div id="workingArea">
                <div id="area"></div>
            </div>
        </div>
    </body>
</html>