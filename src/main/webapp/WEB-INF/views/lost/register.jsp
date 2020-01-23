<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../include/header.jsp"%>   
<div class="side_margin">
	<div class="row">
		<div class="review_title">습득물 등록화면</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->
	
	<input type="text" id="lost_register" value="습득물 제목"><br>
	
	<input type="text" id="content_register">
	
	
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button id="reviewList" class="btn btn-primary">등록</button>
	 <button id="censle" class="btn btn-primary">취소</button>
	 </div>
<!-- 	END 버튼위치 style -->




</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>  