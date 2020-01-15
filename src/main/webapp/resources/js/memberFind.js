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
	
	function getEmail(param, callback, error) {
		$.getJSON("/duplicated/" + param.memberEmail + "/" + param.memberEmailSecond + ".json",
				function(data) {
					if (callback) {
						callback(data.memberEmail, data.memberEmailSecond);
					}
				}).fail(function(xhr, status, err) {
			error();
		});
	}

	return {
		getId : getId,
		getEmail : getEmail
	};
})();