$( document ).ready(function() {
	
	console.log( "Document is ready" );
	
	$("th").each(function(){
		$(this).css("cursor", "pointer");
	});

	$("th").on("click", function(){
		callAjax($(this).attr("id"));
	});

});



function callAjax(selectedId){
	$.ajax({
		url: "index.php?p=home&a=ajax_test",
		type: "post",
		data: {
			myKey : selectedId
		},
		success:function(result){
			let res = JSON.parse(result);
			if(res.length == 0){
				$("th").each(function(){
					$(this).css("background-color", "#34719e");
				});
				$("#customer").html("Aucun client !");
			}else{
				let elt = $("#"+res[0]["code"]);
				$("th").each(function(){
					if($(this).attr("id") == elt.attr("id")){
						$(this).css("background-color", "green");
					}else{
						$(this).css("background-color", "#34719e");
					}
				});
				let customersStr = "Liste des clients : <br><br>";
				for(let i = 0 ; i < res.length ; i++){
					customersStr += res[i]["first_name"] + " " + res[i]["last_name"] + "<br>";
				}
				$("#customer").html(customersStr);

			}

			
		}
	});
}