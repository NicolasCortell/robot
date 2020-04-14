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

    </head>

    <body class="bg-grey"> 
        <!-- DESKTOP MENU -->
        <div class="row menu valign-wrapper bg-white hide-on-med-and-down">
            <div class="col s1"></div>
            <div class="col s1 brand-logo"><img src="resources/img/logo.svg"/></div>
            <div class="col s1 menu-item txt-dark-blue valign-wrapper"><i class="material-icons-outlined prefix">home</i>Accueil</div>
            <div class="col s1 menu-item txt-dark-blue valign-wrapper"><i class="material-icons prefix">list_alt</i>Recettes</div>
            <div class="col s1 menu-item txt-dark-blue valign-wrapper"><span class="svg-icon"></span>Robots</div>
            <div class="col s2"><a href="#"class="brand-logo-txt brand-logo txt-green">COMPANY NAME</a></div>
            <div class="col s1 "></div>
            <div class="col s2">
                <div id="search" class="input-field txt-light-blue bg-grey">
                    <i class="material-icons prefix">search</i>
                    <input placeholder="Rechercher" type="text">
                </div>
            </div>
            <div class="col s1 menu-item txt-dark-blue">Connexion</div>
            <div class="col s1"></div>
        </div>
        <!-- TABLET MENU -->
        <div class="row menu valign-wrapper bg-white hide-on-large-only hide-on-small-only">
            <div class="col s1"></div>
            <div class="col s1 menu-item txt-dark-blue valign-wrapper"><i class="material-icons-outlined prefix">home</i>Accueil</div>
            <div class="col s1 menu-item txt-dark-blue valign-wrapper"><i class="material-icons prefix">list_alt</i>Recettes</div>
            <div class="col s1 menu-item txt-dark-blue valign-wrapper"><span class="svg-icon"></span>Robots</div>
            <div class="col s1"></div>
            <div class="col s1 brand-logo"><img src="resources/img/logo.svg"/></div>
            <div class="col s1"></div>
            <div class="col s3">
                <div id="search" class="input-field txt-light-blue bg-grey">
                    <i class="material-icons prefix">search</i>
                    <input placeholder="Rechercher" type="text">
                </div>
            </div>
            <div class="col s1 menu-item txt-dark-blue">Connexion</div>
            <div class="col s1"></div>
        </div>
        <!-- MOBILE MENU -->
        <div class="row menu valign-wrapper bg-white hide-on-med-and-up">
            <div class="col s1 "></div>
            <div class="col s3 txt-dark-blue left-align"><i class="material-icons-outlined prefix">home</i></div>
            <div class="col s4 brand-logo center-align"><img src="resources/img/logo.svg"/></div>
            <div class="col s3 txt-dark-blue right-align"><i class="material-icons-outlined prefix">home</i></div>
            <div class="col s1 "></div>
        </div>

        <div id="left-menu" class="hide-on-small-only txt-dark-blue">
            <p>Catégories</p>
            <ul>Recettes
                <li>Entrée</li>
                <li>Plat</li>
                <li>Dessert</li>
                <li>Boisson</li>
                <li>Vegan</li>
                <li>Rapide</li>
            </ul>
            <ul>Robots
                <li>Thermomix</li>
                <li>Moulinex</li>
                <li>Cookéo</li>
                <li>Délimix</li>
            </ul>
        </div>

        <div class="container">
            <div id="separator" class="bg-light-blue"></div>

            <!-- CURRENT PAGE CONENT START  -->
        
