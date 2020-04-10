<?php

    global $dbInstance;

    require("includes/database/database_mysql.php");
    
    $dbInstance = new DatabaseLayer( 
        "localhost",
        "root",
        "",
        "robot" 
    );
    
?>