//when the page is ready
$(document).ready(function(){
    //on form submit (btn type='submit')
    $('#form').submit(function(e){
        //we cancel the default operation (the page normally reload itself)
        e.preventDefault();
        //check form validity
        if(!checkForm()){
            alert("Erreur dans les champs");
            return;
        };
        //send form values to PHP with ajax call
        $.ajax({
            url: 'index.php?p=contact&a=send_email',
            type: 'post',
            data: { 
                name : $('#name').val(),
                email : $('#email').val(),
                msg : $('#msg').val()
            },
            success:function(success){
                if(success == "ok"){
                    let name = $('#name').val();
                    $('#input').hide();
                    $('#form').append("<div>Message envoyé.<br>Merci pour votre message "+ name +"</div>").addClass("back bg-green");
                }else{
                    alert("Une erreur est survenue pendant l'envoi de l'email");
                }
            }
        });
    });
});

/**
 * Verify form validity checking each input value length
 * return true when form is valid
 */
function checkForm(valid){
    valid = true;
    //for each 'input' in the form with id #form
    $('#form input').each(function(){
        //trim : remove whitespaces
        if($.trim($(this).val()).length == 0){
            return valid = false;
        }
        if($(this).attr('type')=='email'){
            return valid = isEmail($(this).val());
        }
    });
    return valid;
}
function isEmail($email){
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    return emailReg.test($email);
}