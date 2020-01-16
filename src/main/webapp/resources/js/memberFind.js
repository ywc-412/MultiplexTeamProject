var memberDuplicatedService = (function() {

	function getId(memberId, callback, error) {
		$.get("/duplicated/" + memberId + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getEmail(totalEmail, callback, error) {
		console.log("function: " + totalEmail);
		$.get("/duplicated/email/" + totalEmail + ".json", function(result){
			console.log("get 안쪽: " + totalEmail);
			if(callback){
				console.log("callback 안쪽: " + totalEmail);
				console.log("result? : " + result);
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}

	return {
		getId : getId,
		getEmail : getEmail
	};
})();