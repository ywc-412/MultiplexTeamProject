<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="container">
			<!--<div class="row">-->
			<div class="row no-mean">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">리뷰</h3>
					</div>
					
					
				
					
					
                      <form id="searchForm" action="/review/list" method="get">
                         <select name='type' id="select_box">
                               <option value="" <c:out value="${pageMaker.cri.type ==null?'selected':'' }"/>> 검색 조건 </option>
                               <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                               <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                               <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                         </select>
                         <input type='text' name='keyword' id="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                         <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                         <button class="btn btn-primary">검색</button>
                      </form>
                <!-- END 검색 조건 및 키워드 입력부분 -->
		       
		       
		<div class="tab-content text-center" id="nav-tabContent">
		  <table class="table custom-th-size">	   
                    <thead>
                        <tr>
                            <th>영화명<!-- Rendering engine --></th>
                            <th>제목<!-- Browser --></th>
                            <th style="width: 90xp;">작성자<!-- Platform(s) --></th>
                            <th style="width: 80px;">조회수<!-- Engine version --></th>
                            <th>등록일<!-- CSS grade --></th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${list }" var="rvo">
						<tr class="odd gradeX">
							<td><c:out value="${rvo.movieTitle }"/></td>
							<td><a class="move" href="${rvo.reviewNo}">
                            		${rvo.reviewTitle }</a></td>
                            <td><c:out value="${rvo.memberId }"/></td>
							<td><c:out value="${rvo.reviewView }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${rvo.reviewDate }"/></td>
						</tr>
					</c:forEach>
                    </tbody>
                </table><!-- END 게시물 출력 테이블 -->
          </div>
<!--           table_position -->
 <!-- 페이지 번호 출력 -->
	         <!-- 페이지 번호 출력 -->
	<div class="pagination justify-content-center">
						<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item previous">
										<a class="page-link"href="${pageMaker.startPage-1}" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>										
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item + ${pageMaker.cri.pageNum == num ? 'active' : ''}">
										<a class="page-link" href="${num}">${num}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item next">
										<a class="page-link"href="${pageMaker.endPage+1}" aria-label="Next"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
	 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
                <form id="actionForm" action="/review/list" method="get">
	           		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<!-- 검색 조건과 키워드 파라미터 추가 -->
                	<input type="hidden" name="type" value="${pageMaker.cri.type}">
                	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    			</form>
    			</div>
    			</div>
    			</div>
    			
		<!-- 전체마진 END -->
		<%@ include file="../include/footer.jsp"%>
<script>

//페이지 번호 링크 처리
$(function(){
	  //검색 버튼 이벤트 처리
  	//검색 조건을 지정하지 않은경우
  		//'검색 종류를 선택하세요' 메시지 출력
  	//검색어를 입력하지 않은경우
  		//'키워드를 입력하세요' 출력
  var searchForm = $("#searchForm");
  
  $("#searchForm button").on("click", function(e) {
	 if(!searchForm.find("option:selected").val()){	//검색 조건을 지정안했을때
		 alert('검색종류를 선택하세요');
		 return false;
	 }else if(!($("#keyword").val())){
			alert('내용을 입력해주세요.'); 
			 return false;
	 }
	 //검색 결과 페이지 번호가 1이 되도록 처리
	 searchForm.find("input[name='pageNum']").val("1");
	 e.preventDefault();
	 
	 searchForm.submit();
  });//END 컴색처리
  
	 //페이지 번호 링트 처리
	   $(".page-item a").on("click", function(e) {
				 e.preventDefault(); //a태그라서 동작안되게 막아줌
				 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
				 $('#actionForm').submit();
		  });
	  
	  //게시물 조회 링크처리
	   $(".move").on("click", function(e) {
		 	 e.preventDefault();
		 	 $("#actionForm").append("<input type='hidden' name='reviewNo' value='"+ $(this).attr("href")+"'>");
		 	 $("#actionForm").attr("action", "/review/get");
		 	 $("#actionForm").submit();
	  });
	  
});

</script>