var product_id = 0;

$(document).ready(function () {
	//Clicking on delete button makes a confirmation message appear
	$(".delete").click(function(){
		$(".confirmation").hide();
		product_id = this.id;
		$("#confirmation_" + product_id).show();
	});
	
	//Clicking on 'delete' deletes product from cart and tells
	//the server to delete the product in the user's cart.
	//The total amount is updated too
	$(".confirmation_delete").click(function(){
		var id = this.id;
		var quantity = $("#quantity_" + product_id).val();
		var amount = $("#price_" + product_id) * quantity ;
		var total = $("#total").val() - amount;
		// $(".confirmation").hide();
		$.ajax({url: 'cart_update.php',
				type: 'post',
				data: {'task': 'del', 'product_id': product_id },
				dataType: 'text',
				
				success : function(text, statut){
					$("#product_" + product_id).hide( "medium");
					//the number displayed next to the cart...
					var cartNumber = $("#cart_number").text();
					//change number of items in cart
					--cartNumber;
					$("#cart_number").text(cartNumber);
					$("#total").text(total);
					$("#product_" + id ).hide("slow");
					$("#product_" + id ).remove();
					update_total();
					console.log("success, product deleted");
					
				},
				
				error : function(resultat, statut, erreur){
					console.log("error");
				},
			
		});
		
	});
	
	//Clicking on cancel hides the confirmation message
	$(".cancel").click(function(){
		$(".confirmation").hide();
		$(".delete").show();
	});
	
	//Clicking on 'Update' button sends the new quantity to the server.
	//If quantity is 0, then it asks for a confirmation to delete
	//the product
	$( "input[name='update_cart']" ).click(function(){
		var id = this.id;
		var new_quantity = $( "input[name='quantity_" + id + "']" ).val();
		
		$.ajax({url: 'cart_update.php',
				type: 'post',
				data: {'task' : 'update', 'product_id': id, 'quantity': new_quantity},
				dataType: 'text',
				success : function(text, statut){
					console.log("success, product updated" + text);
					location.reload();
				},
				
				error : function(resultat, statut, erreur){
					console.log("error");
				},
		});
	});

	
	
	$( ".quantity").change(update_total);
	
	
});

function update_total(){
	var amount = 0;
		var id = 0;
		$('.product_content').each(function( index ) {
			id = $(this).attr('id');
			var quantity = $( "input[name='quantity_" + id + "']" ).val();
			var price = $("#price_" + id).text();
			amount = amount + price * quantity ;
			console.log(id);
		});
		$("#total").text(parseFloat(amount).toFixed(2));
		
		//make total glow on change
		var glow = $('#total');
		glow.toggleClass('glow');
		setTimeout(function() {
            glow.removeClass('glow');
        }, 2000);
		
}