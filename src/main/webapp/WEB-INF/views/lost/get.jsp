<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<div class="container">
			<!--<div class="row">-->
			<div class="row no-mean">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">습득물</h3>
					</div>
	<div class="get_title_style">
		<div class="get_title" name="lostTitle">${lvo.lostTitle }</div>
		<div class="title_under_div">
			작성일 : <span class="title_under_ex2" name="lostDate"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${lvo.lostDate }"/></span>
			조회수 : <span class="title_under_ex2" name="lostView">${lvo.lostView }</span>
		</div>
	</div>
	<textarea rows="10" cols="100" class="review_textarea" name="lostContent" readonly="readonly">
		<c:out value="${lvo.lostContent }"/>
	</textarea>
	<div class="title_under2"></div>
	<!-- 	버튼위치 style -->
	<div class="buttln_style">
		<button id="reviewList" class="btn btn-primary">LIST</button>
		<span class="button_position">
		<sec:authorize access="hasRole('ROLE_ADMIN')">	
			<button id="reviewModify" class="btn btn-primary">수정</button>
			<button id="reviewRemove" class="btn btn-danger">삭제</button>
			</sec:authorize>
		</span>
	</div>
	<!-- 	END 버튼위치 style -->
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="modal" id="getModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="okBtn">확인</button> 
        <button type="button" id="noBtn" class="btn btn-secondary">취소</button>
	 </div>
    </div>
  </div>
</div>
<form action="/lost/remove" method="post" id="formGet">
	<input type="hidden" name="lostNo" value="${lvo.lostNo }">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

</div>
</div>
</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script>
$(function(){
	var getModal = $("#getModal");
	$("#reviewModify").on("click",function(e){
		e.preventDefault();
			$("#formGet").attr("method","get");
			$("#formGet").attr("action","/lost/modify").submit();
	});
	$("#reviewRemove").on("click",function(e){
		e.preventDefault();
		$(".modal-body").html('삭제하시겠습니까?');
		getModal.modal('show');	
		$("#okBtn").on("click",function(e){
			$("#formGet").submit();
		})
	});
	$("#reviewList").on("click",function(e){
		location.href="/lost/list";
	});
	$("#noBtn").on("click",function(e){
		getModal.modal('hide');
	});
});
</script>