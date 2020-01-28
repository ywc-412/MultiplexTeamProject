var phoneAuthService = (function() {

	function getPhone(param, callback, error) {
		$.get("/" + param.authPhone +"/" + param.authNumber + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function remove(authPhone, callback, error){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type : 'delete',
			url : '/deleteAuth/'+ authPhone,
			data : JSON.stringify(authPhone),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(deleteResult, status, xhr){
				console.log('deleteResult : in ajax : '+String(deleteResult));
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return {
		getPhone : getPhone,
		remove : remove
	};
})();