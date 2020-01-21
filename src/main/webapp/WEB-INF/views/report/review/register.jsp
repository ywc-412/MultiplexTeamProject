<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">신고 하기</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->
	<form action="/report/review/register" method="post">
	<div class="high_margin"></div>
	<div class="movie_title_style">
		<div class="movie_get_title">${rvo.reviewTitle }</div>
	</div>
	<div class="high_margin"></div>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="text" id="content_register" name="reviewReportContent">
	<input type="hidden" name="memberId" value="홍홍">
	<input type="hidden" name="reviewNo" value="${rvo.reviewNo }">
		<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	<button id="reviewReport" class="btn btn-danger" type="submit">신고</button>
	 <button id="censle" class="btn btn-primary">취소</button>
	 </div>
	 </form>
<!-- 	END 버튼위치 style -->




</div>
<!-- 전체마진 END -->
<%@ include file="../../include/footer.jsp"%>