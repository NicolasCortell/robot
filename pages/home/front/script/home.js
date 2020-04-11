$( document ).ready(function() {
	
	console.log( "Document is ready" );

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
			$("#"+res[0]["code"]).css("background-color", "green");
		}
	});
}