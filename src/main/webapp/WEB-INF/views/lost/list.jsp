<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">습득물</div>
		
	</div>
	<div class="title_under"></div>
	<form action="/lost/register" method="get" class="formRegister"></form>
	<div class="buttln_style">
	 <span class="button_position">
	 <button id="reviewModify" class="btn btn-primary">등록</button>
	</span>
	 </div>
<!-- 	END 버튼위치 style -->
		<div class="table_position">
		  <table class="table table-striped table-bordered table-hover">	   
                    <thead>
                        <tr>
                            <th>제목<!-- Rendering engine --></th>
                            <th>조회수<!-- Platform(s) --></th>
                            <th>작성일<!-- Platform(s) --></th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${list }" var="lvo">
						<tr class="odd gradeX">

							<td><a class="move" href="${lvo.lostNo}">
                            		${lvo.lostTitle }</a></td>
							<td><c:out value="${lvo.lostView }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${lvo.lostDate }"/></td>
						</tr>
					</c:forEach>
                      	
                    </tbody>
                </table><!-- END 게시물 출력 테이블 -->
          </div>
<!--           table_position -->
<!-- 페이지 번호 출력 -->
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

	 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
                <form id="actionForm" action="/lost/list" method="get">
	           		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<!-- 검색 조건과 키워드 파라미터 추가 -->
                	<input type="hidden" name="type" value="${pageMaker.cri.type}">
                	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    			</form>
    			</div>
		<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script>
//페이지 번호 링트 처리
$(function(){ 
$(".paginate_button a").on("click", function(e) {
			 e.preventDefault(); //a태그라서 동작안되게 막아줌
			 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			 $('#actionForm').submit();
	  });

//게시물 조회 링크처리
$(".move").on("click", function(e) {
	 	 e.preventDefault();
	 	 $("#actionForm").append("<input type='hidden' name='lostNo' value='"+ $(this).attr("href")+"'>");
	 	 $("#actionForm").attr("action", "/lost/get");
	 	 $("#actionForm").submit();
	 	 

});
$("#reviewModify").on("click", function(e) {
	 e.preventDefault();
	$(".formRegister").submit();
});
});
</script>