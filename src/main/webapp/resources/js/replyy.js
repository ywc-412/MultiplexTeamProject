console.log("Reply Module............");

var replyService = (function() {
	function add(reply, callback) {
		console.log("reply add.....");
		$.ajax({
			type : 'post',
			// url은 replies/new로 접근
			url : '/replies/new',
			// JSON.stringify() 는 json객체를 String객체로 
			// JSON.parse()는 String 객체를 json 객체로!
			data : JSON.stringify(reply),
			contentType : 'application/json; charset=utf-8',
			success : function(result, status, xhr) {
				callback(result);
			},
			error : function(xhr, status, err) {
				if(err){
					error(err);
				}
			}
		}) // end ajax()
	} // end add()
	
	function getList(param, callback, error){
		console.log('getList................');
		var bno = param.bno;
		var page = param.page || 1;
		var url = "/replies/pages/" + bno + "/" + page + ".json";
		$.getJSON(url,
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
		});	// end getJSON
	} // end getList
	
	
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	function update(reply, callback, error){
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result); 
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	
	function get(rno, callback, error){
		var url = "/replies/" + rno + ".json";
		$.get(url,
			function(result){
				if(callback){
					callback(result);
				}
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
		});	// end get
	} // end get
	
	
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime()-timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		// 오늘 작성한 댓글은 시:분:초 출력
		if(gap<(1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return (hh>9?'':'0') + hh + ':' +  (mi>9?'':'0')+mi + ':' + (ss>9?'':'0') + ss;
		}else{
			// 오늘 이전 작성한 앳글은 연/월/일 출력
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return yy + '/' + (mm>9?'':'0') + mm + '/' + (dd>9?'':'0')+dd;
		}
	};
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
})()




