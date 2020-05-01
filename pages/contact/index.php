<?php


// if it's an ajax call, call the file first
if ( isset($_GET['a']) ) {

    // include the ajax file
    switch($_GET['a']) {
        case 'ajax_test': $ajax_url = 'a_ajax_test'; break;
    }

    if ( isset($ajax_url) ) {
        require_once("pages/$page/ajax/$ajax_url.php");
    }

} else {

    // include the view
    $view = 'contact';
    switch(isset($_GET['v']) ? $_GET['v'] : '') {
        case 'contact': $view = 'contact'; break;
    }

    require_once("pages/$page/back/$view.php");
}
