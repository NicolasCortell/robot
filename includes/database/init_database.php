<?php

    //Global : accessible everywhere in the project
    global $dbInstance;

    //SQL layer for security purposes
    require("includes/database/database_mysql.php");
    
    //Initialize $dbInstance (DB connexion)
    $dbInstance = new DatabaseLayer( 
        "localhost",
        "root",
        "",
        "robot" 
    );
    
?>