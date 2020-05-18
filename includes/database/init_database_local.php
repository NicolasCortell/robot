<?php

    //Global : accessible everywhere in the project
    global $dbInstance;


    //SQL layer for security purposes
    require("includes/database/database_mysql.php");
    
    //Initialize $dbInstance (DB connexion)
    $dbInstance = new DatabaseLayer( 
        "194.5.156.28",
        "u699560698_root",
        "qvYPmQjQ42$",
        "u699560698_robot" 
    );

    
?>