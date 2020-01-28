<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<c:if test="${!empty findMemberId }">
	<script>
		alert('회원님의 아이디는 ' + '${findMemberId}' + '입니다');
	</script>
</c:if>
<c:if test="${!empty findPw}">
	<script>
		alert('${findPw}');
	</script>
</c:if>
<c:if test="${!empty error} ">
	<script>
		alert('아이디와 비밀번호를 확인해주세요');
	</script>
</c:if>

<div class="offers_area padding_top">
	<div class="container">
		<div class="row">
			<div class="col-md-3 my-auto gj-text-align-center">
				<h2 class="mb-30 custom-my-auto">LOGIN</h2>
			</div>
			<div class="col-md-5 mt-sm-20 custom-border-left custom-text-right">
				<form role="form" method="post" action="/login">
					<div class="mt-10 custom-input-size-login">
						<input type="text" name="username"
							class="single-input custom-text-right custom-input-color" id="userIdInput" maxlength="25">
					</div>
					<div class="mt-10 custom-input-size-login">
						<input type="password" name="password"
							class="single-input custom-text-right custom-input-color" id="userPassword" maxlength="60">
					</div>
					<div class="">
						<button class="btn btn-primary custom-button" id="loginBtn">로그인</button>
						<button class="btn btn-secondary custom-button" type="button" id="findIdBtn">ID
							찾기</button>
						<button class="btn btn-secondary custom-button" type="button" id="findPwBtn2">PW
							찾기</button>
						<button class="btn btn-secondary custom-button" type="button" id="joinBtn2">회원가입</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('#findIdBtn').on("click", function(e) {
			e.preventDefault();
			location.href = "/member/findId";
		});

		$('#findPwBtn2').on("click", function(e) {
			e.preventDefault();
			location.href = "/member/findPw";
		});

		$('#joinBtn2').on("click", function(e) {
			e.preventDefault();
			location.href = "/member/join";
		});
	})
</script>

<%@ include file="include/footer.jsp"%>