$( document ).ready(function() {
	
	console.log( "ready!" );

	$.ajax({
		url: "index.php?p=home&a=ajax_test",
		type: "post",
		data: {
			testKey : "MME"
		},
		success:function(result){
			let res = JSON.parse(result);
			console.log(res);
		}
	});

});