<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰 작성 화면</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->
	<form action="/review/register" method="post" class="registerForm">
	<input type="text" id="title_register" value="영화명 : ${movieTitle }" readOnly="readOnly" style="cursor : Default;"><br>
     <input type="hidden" value="${movieNo }" name="movieNo">
	
	<input type="text" id="movie_register"  name="reviewTitle"><br>
	
	<input type="text" id="content_register" name="reviewContent">
	<div class="form-group">
	<input type="hidden" name="memberId" value='<sec:authentication property="principal.username" />'>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	</div>
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button id="reviewList" class="btn btn-primary" type="button">작성완료</button>
	 <button id="censle" class="btn btn-primary">취소</button>
	 </div>
<!-- 	END 버튼위치 style -->
</form>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="modal" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	등록하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="okBtn">확인</button> 
        <button type="button" id="noBtn" class="btn btn-secondary">취소</button>
	 </div>
    </div>
  </div>
</div>
 
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --> 

</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>

<script>!
$(function(){
	var registerModal = $("#registerModal");
	
	$("#reviewList").on("click",function(e){
		e.preventDefault();
		if(!($("#movie_register").val())){
			alert('제목을 입력해주세요.');
		}else if(!($("#content_register").val())){
			alert('내용을 입력해주세요.');
		}else{
		registerModal.modal('show');
		}
	});
	$("#okBtn").on("click",function(e){
		e.preventDefault();
		$(".registerForm").submit();
	});
	$("#noBtn").on("click",function(e){
		e.preventDefault();
		$("#registerModal").modal('hide');
	});
	
	
	
});
</script>