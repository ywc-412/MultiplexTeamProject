<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ include file="../../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">관리자 페이지</div>
		
	</div>
	<div class="title_under"></div>
	<!-- 검색 조건 및 키워드 입력 부분 -->
	<div class="row">
		<div class="col-lg-12">
			
		</div>
		       </div>
<!-- 왼쪽 메뉴바 START -->
	<div class="left_menu">
		<div class="left_menu_position">
			<div class="left_menu_title"></div>
			<ul class="user_manager">회원 관리
				<li class="unser_ma"></li>
				<li class="unser_ma"></li>
			</ul>
			<ul class="user_manager">신고관리
				<li class="unser_ma">리뷰 신고 관리</li>
				<li class="unser_ma">리뷰 댓글 신고 관리</li>
				<li class="unser_ma">한줄평 신고 관리</li>
			</ul>
			
		</div>
	</div>

<!-- 왼쪽 메뉴바 START END-->

	<div class="high_margin"></div>
	<div class="table_position1">
		<span class="button_position">
			<button id="reportRemove" class="btn btn-danger">삭제</button>
		</span>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>신고자ID<!-- Rendering engine --></th>
					<th>신고내용<!-- Browser --></th>
					<th>리뷰제목<!-- Platform(s) --></th>
					<th>삭제<!-- CSS grade --></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="rrvo">
				<tr class="odd gradeX">
					<td><c:out value="${rrvo.memberId }"/></td>
					<td><a class="getGo" href="${rrvo.reviewReportNo}">
                            		${rrvo.reviewReportContent }</a></td>
					<td><a class="move" href="${rrvo.reviewNo}">
                            		${rrvo.reviewTitle }</a></td>
					<td>
					<form action="/report/reply/remove" method="post" id="removeForm">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<input type="checkbox" value="reviewNo">
						</form>
						</td> 
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- END 게시물 출력 테이블 -->
	</div>
	<!--           table_position -->
<!-- 페이지 번호 출력 -->
                <div class="pull-right">
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
                <!-- END 페이지 번호 출력 -->
					 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
                <form id="actionForm" action="/report/review/list" method="get">
	           		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<!-- 검색 조건과 키워드 파라미터 추가 -->
    			</form>
    			
<!--신고받은 리뷰글의 상세보기 화면으로 이동하기위한 form -->

<!-- END 신고받은 리뷰글의 상세보기 화면으로 이동하기위한 form  END -->
	<form method="get" id="getReview"></form>




</div>
		<!-- 전체마진 END -->
<%@ include file="../../include/footer.jsp"%>



<script>
//페이지 번호 링트 처리
$(function(){
$(".paginate_button a").on("click", function(e) {
			 e.preventDefault(); //a태그라서 동작안되게 막아줌
			 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			 $('#actionForm').submit();
	  });
$("#reportRemove").on("click", function (e){
	$("#removeForm").submit();
});	  


$(".move").on("click", function(e) {
	 e.preventDefault();
	 $("#getReview").append("<input type='hidden' name='reviewNo' value='"+ $(this).attr("href")+"'>");
	 $("#getReview").attr("action", "/review/get");
	 $("#getReview").submit();
});
$(".getGo").on("click", function(e) {
	 e.preventDefault();
	 $("#getReview").append("<input type='hidden' name='reviewReportNo' value='"+ $(this).attr("href")+"'>");
	 $("#getReview").attr("action", "/report/review/get");
	 $("#getReview").submit();
	
	});

});
</script>