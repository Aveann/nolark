$(document).ready(function () {
	
	$(".add_product").click(function(){
		$(".popup").hide();
		var product_id = this.id;
		
		//change button when a product has been added
		$(this).replaceWith('<div class="added add">Ajouté (x 1)</div>');
		
		// $(".added").on("click", {
			// product_id: product_id
		// }, addedProduct);
		
		$.ajax({url:'cart_update.php',
				type: 'post',
				data: {'task' : 'add', 'product_id': product_id},
				dataType: 'text',
				
				success : function(text, statut){
					//the number displayed next to the cart...
					var cartNumber = $("#cart_number").text();
					//change number of items in cart
					++cartNumber;
					$("#cart_number").text(cartNumber);
					//show pop up success
					showPopUp("#popup_success");
					console.log("success");
				},
				
				error : function(resultat, statut, erreur){
					showPopUp("#popup_error");
					console.log("error");
				},
		});
	});
					
	// $(".added").click(function(){
		// $(".popup").hide();
		// var product_id = this.id;
		
		// $.ajax({url:'cart_update.php',
			// type: 'post',
			// data: {'task' : 'add', 'product_id': product_id},
			// dataType: 'text',
			
			// success : function(text, statut){
				// //show pop up success
				// showPopUp("#popup_success");
				// console.log("success");
			// },
			
			// error : function(resultat, statut, erreur){
				// showPopUp("#popup_error");
				// console.log("error: " + erreur);
			// },
		// });
	// });
					
});

// //for the new div generated
// function addedProduct(event){
					// $(".popup").hide();
					// var product_id = event.data.product_id;
					
					// $.ajax({url:'cart_update.php',
							// type: 'post',
							// data: {'task' : 'add','product_id': product_id},
							// dataType: 'text',
							
							// success : function(text, statut){
								// showPopUp("#popup_success", "+1 Ajouté!");
								// console.log(product_id);
							// },
							
							// error : function(resultat, statut, erreur){
								// showPopUp("#popup_error");
								// console.log("error");
							// },
					// });
				// }
					
function showPopUp(element, msg){
	
	msg = msg || $(element).text();
	$(element).text(msg);
	$(element).show();
	setTimeout(function(){
	$(element).fadeOut("slow");
	}, 2000);
}