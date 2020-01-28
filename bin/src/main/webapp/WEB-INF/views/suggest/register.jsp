<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<body>
	<section id="tabs" class="project-tab">
		<div class="container">
			<div class="row custom-mobile">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">건의사항 등록</h3>
					</div>
					<form action="/suggest/register" method="post" id="suggestForm">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<input type="hidden" name="memberId" value="<sec:authentication property="principal.username" />"/>
						
						<div class="form-group">
							<div class="primary-checkbox float-left custom-margin-sg-reg">
								<input type="checkbox" id="primary-checkbox"> 
								<label for="primary-checkbox"></label>
							</div>
							<div class="float-left custom-margin-sg-reg">비밀글</div>
							<div class="float-left" id="pwHere">
								<input type="hidden" class="form-control custom-sg-pw-input" id="suggestPw" name="suggestPw" placeholder="비밀번호를 입력해주세요">
							</div>
							<div id="pwChkHidden">
								<input type="hidden" class="form-control custom-sg-pw-input" id="suggestPrivateChk" name="suggestPrivateChk" value="0">
							</div>
						</div>
						<br><br>
						<div class="form-group">
							<label class="float-left">제목</label>
							<p class="float-right" id="current">2020.01.14</p>
							<p class="float-right custom-margin-suggest">
								작성자 : <sec:authentication property="principal.username" />
							</p>
							<input type="text" class="form-control" name="suggestTitle" id="suggestTitle">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="20" name="suggestContent" id="suggestContent"></textarea>
						</div>
						<hr>
					</form>
					<div class="form-group text-center">
						<button type="button" class="btn btn-primary btn-sm" id="registerBtn">등록</button>
						<button type="button" class="btn btn-secondary btn-sm" id="registerCancleBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
	$(function() {
		$('#suggestPw').val("");
		var currentDate = new Date();
		console.log($('#suggestPwChk').val());
		
		var msg = currentDate.getFullYear() + ".";
		msg += (currentDate.getMonth() + 1) + ".";
		msg += currentDate.getDate();

		$('current').append(msg);
		
		$('input#primary-checkbox').on("click", function(e){
			
			if($("input#primary-checkbox").is(":checked") == true) {
				$('#suggestPw').attr("type","password");
				$('#suggestPrivateChk').val("1");
				console.log($('#suggestPrivateChk').val());
				$('#suggestPw').show();
			}else{
				$('#suggestPw').attr("type","hidden");
				$('#suggestPw').val("");
				$('#suggestPrivateChk').val("0");
				console.log($('#suggestPrivateChk').val());
				$('#suggestPw').hide();
			}
		});
		
		$('#registerBtn').on("click",function(e){
			e.preventDefault();
			var submitOk = false;
			if($("input#primary-checkbox").is(":checked") == true){
				if(!$('input#suggestPw').val()){
					alert('건의사항 게시글 비밀번호를 입력해주세요!');
				}else{
					submitOk = true;
				}
			}else{
				submitOk = true;
			}
			
			if(!$('input#suggestTitle').val()){
				alert('제목을 입력해주세요!');
			}else if(!$('textarea#suggestContent').val()){
				alert('내용을 입력해주세요!');
			}else if(submitOk == true){
				$('#suggestForm').submit();
			}
		});
		
	});
</script>

<%@ include file="../include/footer.jsp"%>