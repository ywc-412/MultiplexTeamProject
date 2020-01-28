<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<c:if test="${!empty findMemberId }">
	<script>
		alert('${findMemberId}');
	</script>
</c:if>

<div class="offers_area padding_top">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-left mb-100 custom-border-bottom">
					<h2>아이디 찾기</h2>
				</div>
			</div>
		</div>
		<div class="row justify-content-lg-center">
			<div class="col-lg-8 col-md-8">
				<form action="/member/findId" method="post" id="findIdForm">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="mt-10 custom-input">
						<div>이메일</div>
						<input type="text" name="memberEmail" id="memberEmail"
							class="single-input custom-text-left custom-input-size">
						<div class="custom-text-left custom-my-auto">@</div>
						<div class="default-select custom-text-left" id="default-select">
							<select name="memberEmailSecond" id="memberEmailSecond">
								<option value="">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
						<div class="custom-red-font custom-text-right"
							id="memberEmailErrorMsg"></div>
						<br>
					</div>
					<br>
					<div class="mt-10 custom-input  align-middle">
						<div>핸드폰</div>
						<div class="default-select custom-text-left">
							<select name="memberPhoneFirst" id="memberPhoneFirst">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="018">018</option>
							</select>
						</div>
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneSecond" id="memberPhoneSecond"
							class="single-input custom-text-left custom-input-size-phone" max="9999" maxlength="4">
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneThird" id="memberPhoneThird"
							class="single-input custom-text-left custom-input-size-phone" max="9999" maxlength="4">
						<div class="custom-red-font custom-text-right"
							id="memberPhoneErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div class="col-xl-12 text-right">
							<button type="submit" class="boxed-btn3">아이디 찾기</button>
						</div>
						<p class="custom-red-font custom-text-right"></p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$('.boxed-btn3').on("click", function(e) {
			e.preventDefault();
			
			var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			var memberEmail = $('input#memberEmail').val();
			var memberEmailSecond = $('select#memberEmailSecond').val();
			var memberPhoneFirst = $('select#memberPhoneFirst').val();
			var memberPhoneSecond = $('input#memberPhoneSecond').val();
			var memberPhoneThird = $('input#memberPhoneThird').val();
			var regForPhoneNum = memberPhoneFirst +"-"+ memberPhoneSecond + "-" + memberPhoneThird;
			
			$('#memberEmailErrorMsg').html('');
			$('#memberPhoneErrorMsg').html('');

			if (!memberEmail) {
				$('#memberEmailErrorMsg').html('필수 항목입니다');
			} else if (!memberEmailSecond) {
				$('#memberEmailErrorMsg').html('필수 항목입니다');
			} else if (!memberPhoneFirst) {
				$('#memberPhoneErrorMsg').html('필수 항목입니다');
			} else if (!memberPhoneSecond) {
				$('#memberPhoneErrorMsg').html('필수 항목입니다');
			} else if (!memberPhoneThird) {
				$('#memberPhoneErrorMsg').html('필수 항목입니다');
			} else if(!phoneRegExp.test(regForPhoneNum)){
				$('#memberPhoneErrorMsg').html('번호 형식에 맞지않습니다');
			} else{
				$('#findIdForm').submit();
			}

		});

	})
</script>


<%@ include file="../include/footer.jsp"%>