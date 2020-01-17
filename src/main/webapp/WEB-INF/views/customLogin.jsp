<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

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
							class="single-input custom-text-right custom-input-color">
					</div>
					<div class="mt-10 custom-input-size-login">
						<input type="password" name="password"
							class="single-input custom-text-right custom-input-color">
					</div>
					<div class="">
						<button class="btn btn-primary custom-button">로그인</button>
						<button class="btn btn-secondary custom-button">ID 찾기</button>
						<button class="btn btn-secondary custom-button">PW 찾기</button>
						<button class="btn btn-secondary custom-button">회원가입</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$('.custom-button').on("click", function(e){
		e.preventDefault();
		
		$("form").submit();
	});
</script>

<%@ include file="include/footer.jsp"%>