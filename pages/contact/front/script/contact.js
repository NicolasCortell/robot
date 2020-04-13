
//when the page is ready
$(document).ready(function(){

    //on form submit (btn type="submit")
    $('#form').submit(function(e){

        //we cancel the default operation (the page normally reload itself)
        e.preventDefault();

        //check form validity
        if(!checkForm()){
            alert("Erreur");
            return;
        }

        //send form values to PHP with ajax call
        $.ajax({
            url: "index.php?p=contact&a=send_email",
            type: "post",
            data: { 
                firstName : $("#first_name").val(), 
                lastName : $("#last_name").val(), 
                email : $("#email").val(),
                msg : $("#msg").val() 
            },
            success:function(result){
                /*if(result == ok){
                    masque le formulaire
                    affiche "message envoyé"
                }else{
                    affiche "une erreur est survenue"
                }*/
            }
        });

    });

});




/**
 * Verify form validity checking each input value length
 * return true when form is valid
 */
function checkForm(){
    //for each "input" in the form with id #form
    $("#form input").each(function(){
        //trim : remove whitespaces
        if($.trim($(this).val()).length == 0){
            return false;
        }
    });
    return true;
}
