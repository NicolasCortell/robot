const first_name = document.getElementById("first_name");
const last_name = document.getElementById("last_name");
const email = document.getElementById("email");
const msg = document.getElementById("msg");
const btn = document.getElementById("btn");

let all_msg_received = [];

class message_received{
    constructor(first_name,last_name,email,msg){
        this.first_name = first_name,
        this.last_name = last_name,
        this.email = email,
        this.msg = msg;
    };
};

function envoyer_msg(){
    // Verif if input is not null
    if(first_name.value=="" || last_name.value=="" || email=="" || msg==""){
        alert("Merci de remplir les champs");
    }
    else{
        let new_msg = new message_received(first_name.value,last_name.value,email.value,msg.value);
        all_msg_received.push(new_msg);
        //alert(`NOM & PRENOM : ${new_msg.first_name} & ${new_msg.last_name}`);
    };
};


btn.addEventListener("click",()=>{
    envoyer_msg();
});
