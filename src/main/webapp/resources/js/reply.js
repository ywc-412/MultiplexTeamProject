console.log("Reply Module......");

//안쪽 괄호에 쓴 내용을 바깥쪽 괄호에서 처리하고, 그 결과 값을 replyService에 담아줌
var replyService = (function(){
	
	function add(reply, callback){ // 댓글 추가
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply), // 파라미터로 받은 reply를 json으로 전송함
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){ // /replies/new 컨트롤러를 통해 가져온 리턴값 : result
				if(callback){
					callback(result); // 받아온 리턴값을 다시 callback함수에 보냄
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		}) // END ajax
	} // END add()
	
	function getList(param, callback, error){ // 그 페이지의 목록 불러오기
		// 파라미터로 bno, page 보낼거임 - 글번호 bno인 값의 댓글 page
		var bno = param.bno;
		var page = param.page || 1;
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
				// /replies/pages/bno/page.json으로 url 받을거야
				function(data){ // 결과에 대한 데이터를 받아서
										// (/replies/pages/bno/page를 통해 컨트롤러에서 가져온 리턴값)
					if(callback){
//						callback(data); // 콜백함수에 넣어줌
						callback(data.replyCnt, data.list);
					}
			}).fail(function(xhr, status, error){
				if(error){
					error();
				}
			});
	}
	
	function remove(rno, replyer, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/'+rno,
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
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
		});
	}
	
	function update(reply, callback, error){
		$.ajax({
			type : 'put',
			url : '/replies/'+reply.rno,
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
		});
	}
	
	function get(rno, callback, error){
		$.get("/replies/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		var replyDate = new Date(timeValue);
		
		// 오늘 작성한 댓글
		if(today.getDate() === replyDate.getDate()){
//		if(gap < ( 1000*60*60*24 )){
			var hh = replyDate.getHours();
			var mi = replyDate.getMinutes();
			var ss = replyDate.getSeconds();

//			return [ (hh>9 ? '' : '0') + hh, ' : ', (mi>9 ? '' : '0') + mi, ' : ', (ss>9 ? '' : '0') + ss ].join('');
			return (hh>9 ? '' : '0') + hh + ' : ' + (mi>9 ? '' : '0') + mi + ' : ' + (ss>9 ? '' : '0') + ss;
		} else {
			var yy = replyDate.getFullYear();
			var mm = replyDate.getMonth() + 1;
			var dd = replyDate.getDate();

//			return [ yy, '/', (mm>9?'':'0')+mm, '/', (dd>9?'':'0')+dd].join('');
			return yy + '/' + (mm>9?'':'0') + mm + '/' + (dd>9?'':'0') + dd;
			// .join : 배열을 문자열로 연결해준다.
		}
	};
	
	
	return {
		// 왼쪽 변수 명에 오른쪽 함수의 리턴 값을 담아서 돌려줌
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
})();

