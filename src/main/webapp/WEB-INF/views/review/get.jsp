<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰</div>
	</div>
	<div class="title_under"></div>
	<div class="get_title_style">
		<div class="get_title">	<c:out value="${rvo.reviewTitle }"/></div>
	
		<div class = "title_under_div">
			<span aclass="title_under_ex2">작성일:<fmt:formatDate pattern="yyyy-MM-dd"
							value="${rvo.reviewDate }"/></span> 
			<span class="title_under_ex2">작성자:<c:out value="${rvo.memberId }"/></span> 
			<span class="title_under_ex2">조회수:<c:out value="${rvo.reviewView }"/></span>
		</div>
	</div>
	<div class="movie_title_style">
		<div class="movie_get_title">영화제목</div>
	</div>
	<textarea rows="10" cols="100" class="review_textarea">
	<c:out value="${rvo.reviewContent }"/>
	</textarea>
	
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 
	 <button data-oper="list" class="btn btn-info">List</button>
	 <div class="button_position">
	 		<button type="submit" class="btn btn-default" data-oper ="modify">수정</button>
				
				<form method="post" action="/review/remove">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
				<button id="reviewRemove" class="btn btn-danger" type="submit">
				삭제</button>
				</form>
			<button id="reviewReport" class="btn btn-danger">신고</button>
			
		</div>
		
	 </div>
<!-- 	END 버튼위치 style -->

		<form id='operForm' action="/review/modify" method="get">
					<input type="hidden" id="reviewNo" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		</form>
		
<!-- 	 리뷰댓글란 -->
	 <input type="text" name="reply" id="replyInput">
	  <button id="reviewReply" class="btn btn-primary">등록</button>
<!-- 	 END리뷰댓글란 -->

<div class="table_position">
		  <table class="table table-striped table-bordered table-hover">	   
                    <thead>
                        <tr>
                            <th>아이디<!-- Rendering engine --></th>
                            <th>내용<!-- Browser --></th>
                            <th>등록일<!-- Platform(s) --></th>
                            <th><!-- Engine version --></th>
                        </tr>
                    </thead>
                    <tbody>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"><button id="modalRegisterBtn" class="btn btn-primary">수정</button>  
                         <button id="modalRemoveBtn" class="btn btn-danger">삭제</button></td>  
                         </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                         <tr class="odd gradeX">  <td class="replySize">ghdrm12</td> <td class="replySize">이영화 너무너무 재미있어요</td> <td class="replySize">2020.1.12<</td> <td class="replySize"> <button id="modalRemoveBtn" class="btn btn-danger">신고</button></td>  </tr>
                     
                      	
                    </tbody>
                </table><!-- END 게시물 출력 테이블 -->
          </div>
<!--           table_position -->

<!-- 페이징 부분 -->
	<ul class="pagination">
		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item active"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>
		<li class="page-item"><a class="page-link" href="#">5</a></li>
		<li class="page-item"><a class="page-link" href="#">6</a></li>
		<li class="page-item"><a class="page-link" href="#">7</a></li>
		<li class="page-item"><a class="page-link" href="#">8</a></li>
		<li class="page-item"><a class="page-link" href="#">9</a></li>
		<li class="page-item"><a class="page-link" href="#">10</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
	<!-- 페이징 end -->
</div>
<!-- 전체마진 END -->
<script>
$(function(){
    var operForm = $("#operForm");
    
    $("button[data-oper='modify']").on("click", function (e){
    	operForm.attr("action", "/review/modify").submit();
    });
  	 
    $("button[data-oper='list']").on("click", function (e){
    	operForm.find("#reviewNo").remove();
    	operForm.attr("action", "/review/list")
    	operForm.submit();
    });
});

</script>
