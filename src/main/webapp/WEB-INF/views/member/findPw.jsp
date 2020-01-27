<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<c:if test="${!empty findNull}">
	<script>
		alert('${findNull}');
	</script>
</c:if>
<c:if test="${!empty findMemberIdError}">
	<script>
		alert('${findMemberIdError}');
	</script>
</c:if>
<c:if test="${!empty findPwError}">
	<script>
		alert('${findPwError}');
	</script>
</c:if>
<div class="offers_area padding_top">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-left mb-100 custom-border-bottom">
					<h2>비밀번호 찾기</h2>
				</div>
			</div>
		</div>
		<div class="row justify-content-lg-center">
			<div class="col-lg-8 col-md-8">
				<form action="/member/findPw" method="post" id="findPwForm">
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
					<div class="mt-10 custom-input">
						<div>아이디</div>
						<input type="text" name="memberId" id="memberId"
							class="single-input custom-text-right">
					</div>
					<div class="custom-red-font custom-text-right"
						id="memberIdErrorMsg"></div>
					<br>
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
						<br>
						<div class="custom-red-font custom-text-right"
							id="memberEmailErrorMsg"></div>
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
							<button type="submit" class="boxed-btn3" id="findPwBtn">비밀번호
								찾기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div id="modal" class="searchModal">
	<div class="search-modal-content">
		<div class="page-header">
			<h4>비밀번호 변경</h4>
			<hr>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						<form action="/member/findPwComplete" method="post" id="completeForm">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<div class="mt-10 custom-input">
								<div>비밀번호</div>
								<input type="password" name="memberPw" id="memberPw"
									class="single-input custom-text-right">
								<div class="custom-red-font custom-text-right"
									id="memberPwErrorMsg"></div>
							</div>
							<br>
							<div class="mt-10 custom-input">
								<div>비밀번호 확인</div>
								<input type="password" id="memberPwChk"
									class="single-input custom-text-right">
								<div class="custom-red-font custom-text-right"
									id="memberPwChkErrorMsg"></div>
							</div>
							<input type="hidden" name="memberId" value="${findMemberId}">
							<div class="mt-10 custom-input text-center">
								<button type="button" class="boxed-btn3" id="pwModBtn">비밀번호 수정 완료</button>
								<button type="button" class="boxed-btn3" id="closeBtn3">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
</div>


<script>
	$(function() {
		var registerResult = false;
		var findMemberId = '${findMemberId}';

		if (findMemberId) {
			$('#modal').show();
		}
		
		$('#closeBtn3').on("click", function(e){
			$('#modal').hide();
		}); 
		
		var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

		$('input#memberPw').keyup(function(e) {
			
			v = $(this).val();

			if (regex.test(v)) {
				$('#memberPwErrorMsg').html('사용 가능합니다!');
				$(this).focus();
			}else{
				$('#memberPwErrorMsg').html('영어 대소문자/숫자/특수문자의 조합으로 8자리 이상으로 입력해주세요');
				
			}
			
		});

		
		$('input#memberPwChk').keyup(function(e) {
			if($(this).val() != $('input#memberPw').val()){
				$('#memberPwChkErrorMsg').html('비밀번호 항목과 일치하지 않습니다.');
			}else {
				$('#memberPwChkErrorMsg').html('비밀번호 확인 되었습니다.');
			}
		});
		
		$('#pwModBtn').on("click", function(e){
			e.preventDefault();
			
			var memeberPw = $('input#memberPw').val();
			var memberPwChk = $('input#memberPwChk').val();

			var memberPwErrorMsg = $('#memberPwErrorMsg').html('');
			var memberPwChkErrorMsg = $('#memberPwChkErrorMsg').html('');
			
			v = $('input#memberPw').val();
			
			if (!memeberPw) {
				$('#memberPwErrorMsg').html('필수 항목입니다');
			} else if (!memberPwChk) {
				$('#memberPwChkErrorMsg').html('필수 항목입니다');
			} else if(regex.test(v)){
				$('#memberPwErrorMsg').html('사용 가능합니다!');
				$('input#memberPw').focus();
				registerResult = true;
			} else if(!regex.test(v)){
				$('#memberPwErrorMsg').html('영어 대소문자/숫자/특수문자의 조합으로 8자리 이상으로 입력해주세요');
				registerResult = false;
			}else if($('input#memberPwChk').val() == $('input#memberPw').val()){
				$('#memberPwChkErrorMsg').html('비밀번호 확인 되었습니다.');
				registerResult = true;
			}else{
				$('#memberPwChkErrorMsg').html('비밀번호 항목과 일치하지 않습니다.');
				registerResult = false;
			}
			
			if(registerResult){
				$('#completeForm').submit();
			}
		});
		
		
		$('#findPwBtn').on("click", function(e) {
			e.preventDefault();
			
			var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			var memberId = $('input#memberId').val();
			var memberEmail = $('input#memberEmail').val();
			var memberEmailSecond = $('select#memberEmailSecond').val();
			var memberPhoneFirst = $('select#memberPhoneFirst').val();
			var memberPhoneSecond = $('input#memberPhoneSecond').val();
			var memberPhoneThird = $('input#memberPhoneThird').val();

			var memberIdErrorMsg = $('#memberIdErrorMsg').html('');
			var memberEmailErrorMsg = $('#memberEmailErrorMsg').html('');
			var memberPhoneErrorMsg = $('#memberPhoneErrorMsg').html('');
			
			var regForPhoneNum = memberPhoneFirst +"-"+ memberPhoneSecond + "-" + memberPhoneThird;
			
			if (!memberId) {
				$('#memberIdErrorMsg').html('필수 항목입니다');
			} else if (!memberEmail) {
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
			} else {
				$('#findPwForm').submit();
			}

		});

	})
</script>

<%@ include file="../include/footer.jsp"%>