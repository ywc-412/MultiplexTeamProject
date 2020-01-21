<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row custom-mobile">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">건의사항 수정</h3>
				</div>
				<div class="form-group"></div>
				<form action="/suggest/modify" method="post" id="modForm">
					<input type="hidden" name="suggestNo" value="${suggest.suggestNo }"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="form-group">
						<label class="float-left">제목</label>
						<p class="float-right custom-margin-suggest">작성자 : ${suggest.memberId }</p>
						<input class="form-control" id="suggestTitle" name="suggestTitle" value="${suggest.suggestTitle }">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="20" id="suggestContent" name="suggestContent">${suggest.suggestContent}</textarea>
					</div>
					<hr>
				</form>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary btn-sm" id="suggestModifyComplete">수정</button>
					<button type="submit" class="btn btn-secondary btn-sm" id="suggestModifyCancel">취소</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	$(function(){
		var nullChk = false;
		$('#suggestModifyComplete').on("click", function(e){
			e.preventDefault();
			if(!$('input#suggestTitle').val()){
				alert('제목을 입력해주세요');
			}else if(!$('textarea#suggestContent').val()){
				alert('내용을 입력해주세요');
			}else{
				nullChk = true;
			}
			
			if(nullChk == true){
				$('#modForm').submit();
			}
			
		});
		
		$('#suggestModifyCancel').on("click", function(e){
			e.preventDefault();
			$('#modForm').attr("action","/suggest/get");
			$('#modForm').attr("method","get");
			$('#modForm').submit();
		})
		
		
	})
</script>
<%@ include file="../include/footer.jsp"%>