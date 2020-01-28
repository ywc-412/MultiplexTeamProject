<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../../include/header.jsp" %>


<div class="container">
    	<div class="mycomment-left">
		    <h3 class="mb-20">관리자 페이지</h3>
			<div class="">
				<ul class="unordered-list">
					<li>회원 관리</li>
					<li>리뷰 신고 관리
						<ul>
							<li>리뷰 신고 관리</li>
							<li>리뷰 댓글 신고 관리</li>
							<li class="custom-active">한줄평 신고 관리</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="mycomment-left-right">
			<input type="checkbox" id="allCheck" name="allCheck"><label for="allCheck">모두선택</label>
			<button data-oper="remove" class='btn btn-danger yeong-right' id="selectDelete">선택 삭제</button>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" class="yeongth10">신고자ID</th>
						<th scope="col" class="yeongth35">신고내용</th>
						<th scope="col" class="yeongth35">한줄평내용</th>
						<th scope="col" class="yeongth10">처리결과</th>
						<th scope="col" class="yeongth10">삭제</th>
					</tr>
				</thead>
				<c:forEach items="${commentReport }" var="commentReport">
                        <tr class="odd gradeX">
                        	<td scope="col" class="yeongth10">${commentReport.memberId }</td>
                        	<td scope="col" class="yeongth35" id="commentReport" data-commentReportNo=${commentReport.commentReportNo }>${commentReport.commentReportContent }</td>
                        	<c:forEach items="${comment }" var="comment">
                        	
                        		<c:if test="${comment.commentNo eq commentReport.commentNo }">
				                    <td scope="col" class="yeongth35">${comment.commentContent }</td>
				                </c:if>
                        	</c:forEach>
                        	<td scope="col" class="yeongth10">
                        		<c:if test="${commentReport.commentReportResult == 0}">
				                   	 미처리
				                </c:if>
				            <c:forEach items="${comment }" var="comment">
				            	<c:if test="${comment.commentNo eq commentReport.commentNo }">
                        			<td scope="col" class="yeongth10"><input type="checkbox" name="delete" id="chBox" class="chBox" data-commentNo=${comment.commentNo } data-commentReportNo=${commentReport.commentReportNo }></td>
                        		</c:if>
                       		</c:forEach>
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
    
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    	처리가 완료되었습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 실제 클릭하면 동작하는 부분 처리 -->
    <c:forEach items="${commentReport }" var="commentReport">
	    <c:forEach items="${comment }" var="comment">
	        <c:if test="${comment.commentNo eq commentReport.commentNo }">
			    <form id="actionForm" action="/report/comment/list" method="get">
			   		<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum }">
			   		<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount }">
			    </form>
	    	</c:if>
	    </c:forEach>
	</c:forEach>


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
        
        $(".paginate_button a").on("click", function(e) {
			e.preventDefault(); //a태그라서 동작안되게 막아줌
			$('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			$('#actionForm').submit();
		});
		
	 	$(document).on("click", "#commentReport", function(e){
			 e.preventDefault();

			console.log($(this).data("commentreportno"));
			var commentreportno = $(this).data("commentreportno");
				
			 $("#actionForm").append("<input type='hidden' name='commentReportNo' value='"+ $(this).data("commentreportno")+"'>");
// 			 $("#actionForm").append("<input type='hidden' name='commentNo' value='"+ $(this).attr("href")+"'>");
			 $("#actionForm").attr("action", "/report/comment/get");
			 $("#actionForm").submit();
		});
	});
	
	$(document).on("click", "#allCheck", function(e){
		var chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});
	
	$(document).on("click", "#chBox", function(e){
		$("#allCheck").prop("checked", false);
	});
	
	$(document).on("click", "#selectDelete", function(e){
		var result = confirm("정말 삭제하시겠습니까?");
		console.log(result);
		
		if(result){
			var checkArr = new Array();
			var checkComment = "";
			
			$("input[class='chBox']:checked").each(function(index, item){
				if(index!=0){
					checkComment += ',';
				}
				checkComment += $(this).data("commentno");

			});
// 			checkComment = checkComment.substring(0,checkComment.lastIndexOf(","));
			console.log(checkComment.toString().split(","));
			
			var check = checkComment.toString().split(",");
			console.log(checkComment);
			
			$("#actionForm").find("#commentNo").remove();
			$("#actionForm").append("<input type='hidden' name='checkComment' value='"+ checkComment +"'>");
			$("#actionForm").attr("action", "/report/comment/deleteAll");
			$("#actionForm").submit();
			

		}
	});
	
	
	
	
	
	
	</script>
	
	
	
	
<%@ include file="../../include/footer.jsp" %>