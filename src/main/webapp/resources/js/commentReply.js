console.log("commentReply Module......");

var commentService = (function(){ 
   
   function getList(param, callback, error){   //댓글 목록보기
      console.log("commentReply getList......");
      var movieNo = param.movieNo;
      var pageNum = param.pageNum || 1;
      
      console.log(movieNo);
      
      $.getJSON("/comment/pages/" + movieNo + "/" + pageNum + ".json",
         function(data){
            if(callback){
               callback(data.replyCnt, data.list);
            }
         }).fail(function(xhr, status, err){
            if(error){
               error();
            }
         });
   }
   
   function add(comment, callback, error){   //댓글 추가  실행하는방법 replyService.add
      console.log("comment add......");
      
      $.ajax({
         type : 'post',                  //타입
         url : '/comment/new',            //url 어디로 보내냐
         data : JSON.stringify(comment),      //보내야하는 데이터는 뭐냐
         contentType : "application/json; charset=utf-8",   //데이터 전송타입을 어떤 방식으로 전송할꺼냐
         success : function(result, status, xhr){   //성공했을때 어떻게 처리할꺼냐
            if(callback){
               callback(result);
            }
         },
         error : function(xhr, status, err){         //에러로났을때 어떻게 처리할꺼냐
            if (error){
               error(err);
            }
         }
      })
   }
   
   function remove(commentNo, memberId, callback, error){   //댓글 삭데
      console.log("remove add......");
      
       $.ajax({
            type : 'delete',
            url : '/comment/'+commentNo,
            data : JSON.stringify({commentNo : commentNo, memberId : memberId}),
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
   
   function update(comment, callback, error){   //댓글 수정
      console.log("update add......");
      console.log(comment.commentNo);
      
      $.ajax({
         type : 'put',                  //타입지정
         url : '/comment/' + comment.commentNo,            //수정할때 reply 넘오옴
         data : JSON.stringify(comment),
         contentType : "application/json; charset=utf-8",
         success : function(result, status, xhr){   //성공했을때 어떻게 처리할꺼냐
            if(callback){
               callback(result);
            }
         },
         error : function(xhr, status, err){         //에러로났을때 어떻게 처리할꺼냐
            if (error){
               error(err);
            }
         }
      })
   }
   
   function get(commentNo, callback, error){   //댓글 조회
      console.log("get add......");
      console.log(commentNo);
      
      $.get("/comment/" + commentNo + ".json",
         function(result){
            if(callback){
               callback(result);
            }
         }).fail(function(xhr, status, err){
            if(error){
               error();
            }
         });
   }
   
   return {
      getList : getList,
      add : add,
      remove : remove,
      update : update,
      get : get
   };
   
   
   
   
})()










