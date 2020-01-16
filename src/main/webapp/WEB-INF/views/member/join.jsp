<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="offers_area padding_top">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-left mb-100 custom-border-bottom"
					id="memberIdNav">
					<h2>회원가입</h2>
				</div>
			</div>
		</div>
		<div class="row justify-content-lg-center" name="regForm">
			<div class="col-lg-8 col-md-8">
				<form method="post" action="/member/join" role="form" id="joinForm">
					<div class="mt-10 custom-input">
						<div>아이디</div>
						<input type="text" name="memberId" id="memberId"
							class="single-input custom-text-right">
						<div class="custom-red-font custom-text-right"
							id="memberIdErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div class="">이름</div>
						<input type="text" name="memberName" id="memberName"
							class="single-input custom-text-right">
						<div class="custom-red-font custom-text-right"
							id="memberNameErrorMsg"></div>
					</div>
					<br>
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
					<br>
					<div class="mt-10 custom-input">
						<div>이메일</div>
						<input type="text" name="memberEmail" id="memberEmail"
							class="single-input custom-text-left custom-input-size">
						<div class="custom-text-left custom-my-auto">@</div>
						<div class="default-select custom-text-left" id="default-select">
							<select name="memberEmailSecond" id="memberEmailSecond">
								<option value="direct">-직접 입력-</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hamail.net">hanmail.net</option>
							</select>
						</div>
						<br>
						<div class="custom-red-font custom-text-right"
							id="memberEmailErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div>주소</div>
						<input type="text" name="memberAddress" id="memberAddress"
							class="single-input custom-text-right">
						<div class="custom-red-font custom-text-right"
							id="memberAddressErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input align-middle">
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
							class="single-input custom-text-left custom-input-size-phone">
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneThird" id="memberPhoneThird"
							class="single-input custom-text-left custom-input-size-phone">
						<div class="custom-red-font custom-text-right"
							id="memberPhoneErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div>생년월일</div>
						<div class="row">
							<div class="col-xl-6">
								<input id="datepicker" placeholder="생년월일" name="memberBirth">
							</div>
							<div class="custom-red-font custom-text-right"
							id="memberBirthErrorMsg"></div>
							<div class="col-xl-12 text-right">
								<button type="submit" class="boxed-btn3">회원가입</button>
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/memberFind.js"></script>
<script>
	$(function() {
		var registerResult = false;
		
		//id 중복 처리..
		$('input#memberId').blur(function(){
			var memberId = $('input#memberId').val();
			memberDuplicatedService.getId(memberId, function(result){
				if(result.memberId != memberId){
					$('#memberIdErrorMsg').html('사용 가능한 아이디 입니다');
				}else{
					$('#memberIdErrorMsg').html('중복된 아이디 입니다');	
				}
			});
		});
		
		// email 중복 처리 해야함
		$('select#memberEmailSecond').on('change', function(){
			var memberEmail = $('input#memberEmail').val()
			var memberEmailSecond = $('select#memberEmailSecond').val();
			
			var totalEmail = memberEmail + "@" + memberEmailSecond;
			
			memberDuplicatedService.getEmail(totalEmail, function(result){
				if(memberEmail == result.memberEmail && memberEmailSecond == result.memberEmailSecond){
					$('#memberEmailErrorMsg').html('중복된 이메일 입니다');
				}else{
					$('#memberEmailErrorMsg').html('사용 가능한 이메일 입니다');
				}
			});
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
		
		

		$('.boxed-btn3').on("click", function(e) {
			var memberId = $('input#memberId').val();
			var memberName = $('input#memberName').val();
			var memberPw = $('input#memberPw').val();
			var memberPwChk = $('input#memberPwChk').val();
			var memberEmail = $('input#memberEmail').val();
			var memberEmailSecond = $('select#memberEmailSecond').val();
			var memberAddress = $('input#memberAddress').val();
			var memberPhoneFirst = $('select#memberPhoneFirst').val();
			var memberPhoneSecond = $('input#memberPhoneSecond').val();
			var memberPhoneThird = $('input#memberPhoneThird').val();
			var memberBirth = $('input#datepicker').val();
			
			if(!registerResult){
				e.preventDefault();
			}
			
			var memberIdErrorMsg = $('#memberIdErrorMsg').html('');
			var memberNameErrorMsg = $('#memberNameErrorMsg').html('');
			var memberPwErrorMsg = $('#memberPwErrorMsg').html('');
			var memberPwChkErrorMsg = $('#memberPwChkErrorMsg').html('');
			var memberEmailErrorMsg = $('#memberEmailErrorMsg').html('');
			var memberAddressErrorMsg = $('#memberAddressErrorMsg').html('');
			var memberPhoneErrorMsg = $('#memberPhoneErrorMsg').html('');
			var memberBirthErrorMsg = $('#memberBirthErrorMsg').html('');
			
			
			//memberId select 해서 없으면 중복된 id 처리해야함
			if (!memberId) {
				$('#memberIdErrorMsg').html('필수 항목입니다');
				var offset = $("#memberIdNav").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if (!memberName) {
				$('#memberNameErrorMsg').html('필수 항목입니다');
				var offset = $("#memberIdNav").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if (!memberPw) {
				$('#memberPwErrorMsg').html('필수 항목입니다');
				var offset = $("#memberIdNav").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberPwChk) {
				$('#memberPwChkErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberEmail) {
				$('#memberEmailErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberEmailSecond) {
				$('#memberEmailErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberAddress) {
				$('#memberAddressErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberPhoneFirst) {
				$('#memberPhoneErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberPhoneSecond) {
				$('#memberPhoneErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberPhoneThird) {
				$('#memberPhoneErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else if(!memberBirth) {
				$('#memberBirthErrorMsg').html('필수 항목입니다');
				var offset = $("#memberId").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else{
				registerResult = true;
			}
			
			v = $('input#memberPw').val();

			if (regex.test(v)) {
				$('#memberPwErrorMsg').html('사용 가능합니다!');
				$(this).focus();
			}else{
				registerResult = false;
				$('#memberPwErrorMsg').html('영어 대소문자/숫자/특수문자의 조합으로 8자리 이상으로 입력해주세요');
				var offset = $("#memberIdNav").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}
				
			if($('input#memberPwChk').val() != $('input#memberPw').val()){
				$('#memberPwChkErrorMsg').html('비밀번호 항목과 일치하지 않습니다.');
				registerResult = false;
				var offset = $("#memberIdNav").offset();
				$('html, body').animate({
					scrollTop : offset.top
				}, 400);
			}else {
				$('#memberPwChkErrorMsg').html('비밀번호 확인 되었습니다.');
			}
			
			if(registerResult){
				$('#joinForm').submit();
			}
			
			
		});
	});
</script>

<%@ include file="../include/footer.jsp"%>


















