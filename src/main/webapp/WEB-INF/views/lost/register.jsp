<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../include/header.jsp"%>   
<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">습득물 등록</h3>
                </div>              
	<form action="/lost/register" method="post" class="registerForm">
	<input type="text" id="lost_register" name="lostTitle"><br>
	
	<input type="text" id="content_register" name="lostContent">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	</form>
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button type="button" id="reviewList" class="btn btn-primary">등록</button>
	<button id="censle" class="btn btn-primary">취소</button>
  </div>

  <!-- 	END 버튼위치 style -->
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
</div>
</div>
</section>

<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>  

<script>!
$(function(){
	var registerModal = $("#registerModal");
	
	$("#reviewList").on("click",function(e){
		e.preventDefault();
		if(!($("#lost_register").val())){
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
	$("#censle").on("click",function(e){
		location.href="/lost/list";
	});
});
</script>