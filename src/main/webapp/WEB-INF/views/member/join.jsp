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
		<div class="row justify-content-lg-center" id="regForm">
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
								<option value="">선택</option>
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
						<div class="float-left">주소</div>
						<button type="button" id="postcodify_search_button"
							class="btn btn-primary btn-sm">검색</button>
						<input type="text" name="memberAddress" id="memberAddress"
							class="postcodify_address single-input custom-text-right"
							placeholder="상세주소는 입력받지 않습니다" readonly>
						<div class="custom-red-font custom-text-right"
							id="memberAddressErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input align-middle">
						<div>핸드폰</div>
						<button type="button" class="btn btn-primary btn-sm"
							id='phoneAuthBtn'>인증하기</button>
						<div class="default-select custom-text-left">
							<select name="memberPhoneFirst" id="memberPhoneFirst">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="018">018</option>
							</select>
						</div>
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneSecond" id="memberPhoneSecond"
							class="single-input custom-text-left custom-input-size-phone"
							max="9999" maxlength="4">
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneThird" id="memberPhoneThird"
							class="single-input custom-text-left custom-input-size-phone"
							max="9999" maxlength="4">
						<div class="custom-red-font custom-text-right"
							id="memberPhoneErrorMsg"></div>
						<input type="hidden" id="phoneAuthChk" value=""/>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div>생년월일</div>
						<div class="row">
							<div class="col-xl-6">
								<input id="datepicker" placeholder="생년월일" name="memberBirth" autocomplete="off">
							</div>
							<div class="custom-red-font custom-text-right"
								id="memberBirthErrorMsg"></div>
							<div class="col-xl-12 text-right">
								<button type="submit" class="boxed-btn3" id="regBtn1">회원가입</button>
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
				</form>
			</div>
		</div>
	</div>
</div>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src="/resources/js/memberFind.js"></script>

<script>
	function popup(url){
        var name = "본인인증 서비스";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
	
	$(function() {
		
		
		$('#phoneAuthBtn').on("click", function(e){
			e.preventDefault();
			var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			var phoneAuthNullChk = false;	// 인증 버튼 눌렀을때 핸드폰 번호 널값 처리
			
			var phoneFirst = $('select#memberPhoneFirst').val();
			var phoneSecond = $('input#memberPhoneSecond').val();
			var phoneThird = $('input#memberPhoneThird').val();
			var phone = phoneFirst + phoneSecond + phoneThird;
			var regForPhoneNum = phoneFirst +"-"+ phoneSecond + "-" + phoneThird;
			var url = "/phoneAuthPopup?phone=" + phone;
			
			if(!phoneFirst){
				$('#memberPhoneErrorMsg').html('핸드폰 번호를 입력해주세요');
			}else if(!phoneSecond){
				$('#memberPhoneErrorMsg').html('핸드폰 번호를 입력해주세요');
			}else if(!phoneThird){
				$('#memberPhoneErrorMsg').html('핸드폰 번호를 입력해주세요');
			}else if(!phoneRegExp.test(regForPhoneNum)){
				$('#memberPhoneErrorMsg').html('번호 형식에 맞지않습니다');
			}else{
				$('#memberPhoneErrorMsg').html('');
				phoneAuthNullChk = true;
				if(phoneAuthNullChk == true){
					popup(url);
				}
			}
		});
		
		
		$("#postcodify_search_button").postcodifyPopUp(function(e){
			e.preventDefault();
		});
		
		var registerResult = false;
		
		// id 정규표현식
		var idReg =  /^[A-Za-z0-9+]{4,12}$/; 
		$('input#memberId').keyup(function(e){
			vv = $(this).val();
			var memberId = $('input#memberId').val();
			
			var idTest = idReg.test(vv);
			
			if (idTest == true) {
				$('#memberIdErrorMsg').html('');
			}else{
				$('#memberIdErrorMsg').html('아이디는 영문자 또는 숫자로 입력해주세요(4자~12자)');
			}
			
			if(memberId.length >= 4){// 6자리 이상 들어가면 중복 아이디 확인 ajax 실행
				memberDuplicatedService.getId(memberId, function(result){
					if(result.memberId == memberId){
						$('#memberIdErrorMsg').html('중복된 아이디 입니다');
					}else if(idTest == false){
						$('#memberIdErrorMsg').html('아이디는  영문자 또는 숫자로 입력해주세요(4자~12자)');
					}else if(idTest == true && result.memberId != memberId) {
						$('#memberIdErrorMsg').html('사용 가능한 아이디 입니다');
					}
				});
			}
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
				$('#memberPwErrorMsg').html('영어/숫자/특수문자의 조합으로 8자리 이상으로 입력해주세요');
			}
			
		});

		
		$('input#memberPwChk').keyup(function(e) {
			if($(this).val() != $('input#memberPw').val()){
				$('#memberPwChkErrorMsg').html('비밀번호 항목과 일치하지 않습니다.');
			}else {
				$('#memberPwChkErrorMsg').html('비밀번호 확인 되었습니다.');
			}
		});
		
		

		$('#regBtn1').on("click", function(e) {
			console.log('phoneAuthChk reg: ' + $('input#phoneAuthChk').val());
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
			
			var idReg =  /^[A-Za-z0-9+]{4,12}$/; 
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
			}else if(idReg.test($('input#memberId').val()) == false){
				vv = $(this).val();
				var idTest = idReg.test(vv);
				console.log(idTest);
				$('#memberIdErrorMsg').html('아이디는 영문자 또는 숫자로 입력해주세요(4자~12자)');
			}else if(!$('#phoneAuthChk').val()){
				$('#memberPhoneErrorMsg').html('휴대폰 인증이 필요합니다');
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




