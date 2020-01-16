<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">기프티콘 수정</h3>
                </div>
                <form method="post" action="/gift/modify" role="form">
                <div class="form-group">
                    <label>이름</label>
                    <input class="form-control" name="giftName" value='<c:out value="${gift.giftNo}"/>'>                    
                </div>
                <div class="form-group">
                    <label>가격</label>
                    <input class="form-control" name="giftName" value='<c:out value="${gift.giftPrice}"/>'>
                </div>
                <div class="form-group">
                    <label>사진</label><br>
                    <div class="custom-photo"><input type="file"></div>
                </div>
                <hr>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary btn-sm">수정</button>
                    <button type="submit" class="btn btn-secondary btn-sm">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!--board-end-->

	<div class="row">
   		<div class="col-lg-12">
      		<div class="panel panel-default">
       			<div class="panel-heading">File Attach</div>
       				<div class="panel-body">
       					<div class="form-group uploadDiv">
       						<input type="file" name="uploadFile" multiple>
       					</div>
       					<!-- 업로드 결과 출력 -->
	       				<div class="uploadResult">
	       					<ul>
	       	
	       					</ul>
	       				</div>
       				</div>
      			</div>
       		</div>
       </div>

<%@include file="../include/footer.jsp" %> 