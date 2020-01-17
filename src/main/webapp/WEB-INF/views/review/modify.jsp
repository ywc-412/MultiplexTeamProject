<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰 수정 화면</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->

	<form role="form" action="/review/modify" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
	<input type="text" id="movie_register1" name="reviewTitle" value="<c:out value='${rvo.reviewTitle }'/>"><br>
	
	<input type="text" id="content_register" name="reviewContent" value="<c:out value='${rvo.reviewContent }'/>">
	
<!-- 	페이지 번호를 위한 hidden 태그 -->
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
<!-- 	페이지 번호를 위한 hidden 태그  END-->

	
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button type="submit" id="reviewList" class="btn btn-primary" data-oper='modify'>수정</button>
	 <button data-oper='list'>취소</button>
	 </div>
	 </form>
<!-- 	END 버튼위치 style -->




</div>
<!-- 전체마진 END -->
<script>
$(document).ready(function(){
	var formObj = $("form");
	$('button').on("click",function(e){
		alter('버튼클릭했다.');
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log("operation");
		
		if(operation === 'list'){
			self.location = "/review/list";
			return;
		}
		formObj.submit;
	}); //button 처리 END
}); //documentEND
</script>