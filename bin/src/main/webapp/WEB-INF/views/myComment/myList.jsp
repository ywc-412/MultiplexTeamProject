<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>

<div class="container">
    	<div class="mycomment-left">
		    <h3 class="mb-20">마이페이지</h3>
			<div class="">
				<ul class="unordered-list">
					<li class="yeong-myfont">내 정보 조회</li>
					<li class="yeong-myfont">예매 내역</li>
					<li class="yeong-myfont">내 리뷰</li>
					<li class="custom-active yeong-myfont">내 한줄평</li>
					<li class="yeong-myfont">내 기프티콘</li>
					<li class="yeong-myfont">내 건의사항</li>
				</ul>
			</div>
		</div>
		<div class="mycomment-left-right">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" class="yeongth_myComment20">영화명</th>
						<th scope="col" class="yeongth_myComment05">별점</th>
						<th scope="col" class="yeongth_myComment35">한줄평</th>
						<th scope="col" class="yeongth_myComment10">등록일</th>
						<th colspan="2" scope="col" class="yeongth_myComment20">버튼</th>
					</tr>
				</thead>
				<c:forEach items="${comment }" var="comment">
                        <tr class="odd gradeX">
                        	<c:forEach items="${movie }" var="movie">
                        		<c:if test="${comment.movieNo eq movie.movieNo }">
				                    <td scope="col" class="yeongth_myComment20">${movie.movieTitle}</td>
				                </c:if>
                        	</c:forEach>
                       		<c:choose>
						    	<c:when test="${comment.commentStar == 1}">
						 			<td scope="col" class="yeongth_myComment05 yeong-starRed" id="commentStar">★</td>
						    	</c:when>
						    	<c:when test="${comment.commentStar == 2}">
						 			<td scope="col" class="yeongth_myComment05 yeong-starRed" id="commentStar">★★</td>
						    	</c:when>
						    	<c:when test="${comment.commentStar == 3}">
						 			<td scope="col" class="yeongth_myComment05 yeong-starRed" id="commentStar">★★★</td>
						    	</c:when>
						    	<c:when test="${comment.commentStar == 4}">
						 			<td scope="col" class="yeongth_myComment05 yeong-starRed" id="commentStar">★★★★</td>
						    	</c:when>
						        <c:otherwise>
						        	<td scope="col" class="yeongth_myComment05 yeong-starRed" id="commentStar">★★★★★</td>
						        </c:otherwise>
						    </c:choose>
                        	<td scope="col" class="yeongth_myComment35">${comment.commentContent }</td>
                        	<td scope="col" class="yeongth_myComment10">
                        		<fmt:formatDate value="${comment.commentDate}" pattern="yyyy.MM.dd"/>
                        	</td>
                        	<td colspan='2' class='yeongth_myComment20'>
								<a href='#' id='myCommentUpdate' class='custom-blue'  data-commentNo="${comment.commentNo }">수정</a><br>
								<a href='#' id='myCommentDelete' class='custom-red' data-commentNo="${comment.commentNo }">삭제</a>
							</td>
                        </tr>
                </c:forEach>
			</table>
		</div>
    </div>
	
	<!-- 페이징 -->
	<div class="pagination justify-content-center clear">
       <ul class="pagination">
       	   <c:if test="${pageMaker.prev }">
	       		<li class="paginate_button previous">
	          		<a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
	       </c:if>
	       <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	       		<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	         		<a class="page-link" href="${num}">${num }</a></li>
	       </c:forEach>
	       <c:if test="${pageMaker.next }">
	       		<li class="paginate_button next">
	          		<a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
	       </c:if>
       </ul>
    </div>
    
    <!-- 실제 클릭하면 동작하는 부분 처리 -->
    <form id="actionForm" action="/myComment/myList" method="get">
   		<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum }">
   		<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount }">
   		
   		<sec:authentication property="principal" var="pinfo"/>
       		<sec:authorize access="isAuthenticated()">
       			<input type="hidden" id="memberId" name="memberId" value="${pinfo.username }">
       		</sec:authorize>
   		
    </form>
    
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정하실 내용을  입력해주세요</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="yeong-star yeong-starRed" id="star_grade_modify">
				        <a href="#" class="starModify1">★</a>
				        <a href="#" class="starModify2">★</a>
				        <a href="#" class="starModify3">★</a>
				        <a href="#" class="starModify4">★</a>
				        <a href="#" class="starModify5">★</a>
					</span>
					<input class="yeong-commentInput" type="hidden" id="commentStarModify" name='commentStar'>
			        <input class="yeong-commentInput" type='text' id="commentContent" name='commentContent' placeholder="한줄평을  수정해주세요">
					
					<input class="yeong-commentInput" type="hidden" id="movieNo" name='movieNo'>
			        <sec:authentication property="principal" var="pinfo"/>
 	                	<sec:authorize access="isAuthenticated()">
			        		<input class="yeong-commentInput" type="hidden" id='memberId' name='memberId' value='memberId' readonly="readonly" value="${pinfo.username }">
			        	</sec:authorize>
			        <input class="yeong-commentInput" type="hidden" id="commentDate" name='commentDate' value='commentDate' readonly="readonly">
			            
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" id="modalModify" class="btn btn-primary">수정</button>
					<button type="button" data-oper="cancel" id="modalCancel"class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
    
    
    
    <script src="/resources/js/commentReply.js"></script>
    <script>
	$('#star_grade_modify a').click(function(){
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		
		return false;
	});
	
	$('.starModify1').on("click",function(e){	
  		$('#commentStarModify').val(1);
	});
	$('.starModify2').on("click",function(e){	
  		$('#commentStarModify').val(2);
	});
	$('.starModify3').on("click",function(e){	
  		$('#commentStarModify').val(3);
	});
	$('.starModify4').on("click",function(e){	
  		$('#commentStarModify').val(4);
	});
	$('.starModify5').on("click",function(e){	
  		$('#commentStarModify').val(5);
	});
	
	
	</script>
    <script>
    
    $(function(){
		 var result = '<c:out value="${result}"/>';
      
      	 //result 값이 있는지 확인하는 함수 호출
     	 checkModal(result);
      
      	 //뒤로가기 할때 발생하는 오류잡기
      	 history.replaceState({}, null, null);
      
      	 //result 값이 있는지 확인하는 함수
      	 function checkModal(result){
    	    if(result === '' || history.state){
    		    return;
    	    }
	    	 console.log(result);
	    	 $('#myModal').modal('show');
         }
		  
		//페이지 번호 링트 처리
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault(); //a태그라서 동작안되게 막아줌
			$('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			$('#actionForm').submit();
		});
	    
		
	});
    
    var modal = $(".modal");
	var modalInputStar = modal.find("input[name='commentStar']");
	var modalInputContent = modal.find("input[name='commentContent']");
	var modalcommentDate = modal.find("input[name='commentDate']");
	var modalmemberId = modal.find("input[name='memberId']");
	var modalmovieNo = modal.find("input[name='movieNo']");
	
	var modalModify = $("#modalModify");
	var commentDelete = $("#commentDelete");
	
	var memberId = null; //로그인한 아이디
	
	<sec:authorize access="isAuthenticated()">
		memberId = '<sec:authentication property="principal.username" />';
	</sec:authorize>
	
	
	var csrfHeaderName = "${_csrf.headerName}";	//CSRF 토큰 관련 변수 추가
	var csrfTokenValue = "${_csrf.token}";
	
    $(function(){
	    $(document).on("click", "#myCommentUpdate", function(e){
	    	
			commentService.get($(this).data("commentno"), function(data){
    	   		
    	   		if(data.commentStar == 1){
    	   			$('.starModify1').addClass("on").prevAll("a").addClass("on");
				} else if(data.commentStar == 2){
					$('.starModify2').addClass("on").prevAll("a").addClass("on");
				} else if(data.commentStar == 3){
					$('.starModify3').addClass("on").prevAll("a").addClass("on");
				} else if(data.commentStar == 4){
					$('.starModify4').addClass("on").prevAll("a").addClass("on");
				} else if(data.commentStar == 5){
					$('.starModify5').addClass("on").prevAll("a").addClass("on");
				} 
    	    	
    	   		modal.data("commentNo", data.commentNo);
    	   		
    	   		modalInputStar.val(data.commentStar);		
    	    	modalInputContent.val(data.commentContent);
    	    	modalmemberId.val(data.memberId);
    	    	modalcommentDate.val(data.commentDate);	
    	    	modalmovieNo.val(data.movieNo);
    	   		
				$('#exampleModal').modal('show');
		   		
			}, function(err){
				console.log(err);
			});
	    });
	    
	    
	  //댓글 수정 버튼 이벤트 처리 - 동적이게 처리할필요없음 .on("click"
        $(document).on("click", "#modalModify", function(e){

        	commentService.update({
        		commentNo : modal.data('commentNo'),
        		commentStar : modalInputStar.val(),
                commentContent : modalInputContent.val()
    			
    		}, function(result){
    			alert("한줄평 수정이 완료되었습니다.");
    			
    			modal.modal("hide");
    			
    		}, function(err){
    			console.log(err);
    		});
        });
	  
	  
    });
		
	</script>
	
	
	
<%@ include file="../include/footer.jsp" %>