<!DOCTYPE html>
    <head>
        <meta charset="utf-8" />
        <title>ROBOT</title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <!--Import Google Icon Font - See : https://material.io/resources/icons/ -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet"/>
        <link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <!--Import Acumin font from Adobe-->
        <link rel="stylesheet" href="https://use.typekit.net/puj2mai.css">
        <link href="<?php echo $this->versionized('resources/css/main.css')?>" rel="stylesheet" id="MainCss" type="text/css"/>
        
        <script src="resources/plugins/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="resources/plugins/jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>
    </head>
    <body> 

        <div id="menu" class="row valign-wrapper">
            <div class="col s1"></div>
            <div class="col s1 valign-wrapper brand-logo"><img src="resources/img/logo.svg"/></div>
            <div class="menu-item col s1 valign-wrapper"><i class="material-icons-outlined prefix">home</i>Accueil</div>
            <div class="menu-item col s1 valign-wrapper"><i class="material-icons prefix">list_alt</i>Recettes</div>
            <div class="menu-item col s1 valign-wrapper"><span class="svg-icon"></span>Robots</div>
            <div class="col s2 center-align"><a href="#" id="brand-logo-txt" class="brand-logo hide-on-med-and-down">COMPANY NAME</a></div>
            <div class="col s1"></div>
            <div class="col s2">
                <div id="search" class="input-field">
                    <i class="material-icons prefix">search</i>
                    <input placeholder="Rechercher" type="text">
                </div>
            </div>
            <div class="menu-item col s1">Connexion</div>
            <div class="col s1"></div>
        </div>

        <div class="container">
            <div id="separator"></div>
        
