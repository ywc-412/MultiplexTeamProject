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
                    <h3 class="custom-font-bold">리뷰 수정</h3>
                </div>     

	<form role="form" action="/review/modify" method="post" class="formModify">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
	<input type="text" id="movie_register1" name="reviewTitle" value="<c:out value='${rvo.reviewTitle }'/>"><br>
	
	<input type="text" id="content_register" name="reviewContent" value="<c:out value='${rvo.reviewContent }'/>">
	
<!-- 	페이지 번호를 위한 hidden 태그 -->
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
<!-- 	페이지 번호를 위한 hidden 태그  END-->
 </form>
	
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button type="button" id="reviewList" class="btn btn-primary" data-oper='modify'>수정</button>
	 <button id="censle" class="btn btn-primary" data-oper='list'>취소</button>
	 </div>
	
<!-- 	END 버튼위치 style -->
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="modal" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	수정하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="modifyBtn">확인</button> 
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
<script>
$(document).ready(function(){
	var formObj = $("form");
	var modifyModal = $("#modifyModal");
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log("operation");
		
		if(operation === 'list'){
			self.location = "/review/list";
			return;
		}
		if(!($("#movie_register1").val())){
			alert('제목을 입력해주세요');
		} else if(!($("#content_register").val())){
			alert('내용을 입력해주세요');
		}else{
			modifyModal.show();
		}
	}); //button 처리 END
	$("#modifyBtn").on("click",function(e){
		formObj.submit();
	});
	$("#noBtn").on("click",function(e){
		modifyModal.hide();
	});
}); //documentEND

</script>