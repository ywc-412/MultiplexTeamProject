<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row custom-mobile">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">건의사항</h3>
				</div>
				<div class="custom-sg-title">
					<p class="float-left custom-sg-font">${suggest.suggestTitle}</p>
					<c:if test="${suggest.suggestPrivateChk == true }">
						<p class="float-right custom-sg-font2">비밀글</p>
					</c:if>
					<p class="float-right custom-sg-font2">작성자: ${suggest.memberId}</p>
					<p class="float-right custom-sg-font2">조회수: ${suggest.suggestView}</p>
				</div>
				<div class="view_area">
					${suggest.suggestContent}
				</div>
				<form action="/suggest/remove" method="post" id="removeForm">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<input type="hidden" name="suggestNo" value="${suggest.suggestNo}"/>
				</form>
				<hr>
				<div class="pull-right">
					<button type="button" class="btn btn-primary btn-sm">LIST</button>
					<button type="button" class="btn btn-primary btn-sm" id="suggestModifyBtn">수정</button>
					<button type="button" class="btn btn-danger btn-sm" id="suggestRemoveBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	$(function(){
		$('#suggestRemoveBtn').on("click", function(e){
			var result = confirm('삭제하시겠습니까?');
			
			if(result == true){
				$('#removeForm').submit();
			}
			
		});
		
		$('#suggestModifyBtn').on("click", function(e){
			$('#removeForm').attr("method","get");
			$('#removeForm').attr("action","/suggest/modify");
			$('#removeForm').submit();
		});
		
	})
</script>

<%@ include file="../include/footer.jsp"%>