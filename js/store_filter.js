$(function(){
	$('.filter_apply').click(function(){
						var categorie = this.id;
						var id = '';
						var values = '';
						var filters = []; //list of filters to check
						
						
						$('.filter-list').each(function(i){
							if( i > 0 && values){
								values += '&';
							}
							id = this.id;
							console.log('id:' + id);
							filters.push(id);
							
							$('input[id*=' + id + ']:checked').each(function(j) {
								if( j > 0 ){
									values += '+';
								} else if(j == 0){
									values += id + '=';
								}
								values += $(this).val();
								
							});
						});
						
						if(values && categorie){
							values += '&categorie=' + categorie;
						}
						
						$.ajax({url: 'filter_apply.php',
								type: 'post',
								data: {filters : filters, values : values},
								
								success : function(query){
									$(location).attr('href', 'store.php?' + query);
								},
							
						});
						
	});
});