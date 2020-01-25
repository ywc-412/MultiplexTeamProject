<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="841929901504-rjhbj9a4obp0vp06ib87f52fiq2rg29r.apps.googleusercontent.com">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>S_CINEMA</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="manifest" href="site.webmanifest"> -->
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon2.png">
	<!-- Place favicon.ico in the root directory -->
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<!-- CSS here -->
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="/resources/css/themify-icons.css">
	<link rel="stylesheet" href="/resources/css/flaticon.css">
	<link rel="stylesheet" href="/resources/css/gijgo.css">
	<link rel="stylesheet" href="/resources/css/animate.css">
	<link rel="stylesheet" href="/resources/css/slicknav.css">
	<link rel="stylesheet" href="/resources/css/style.css">
<title>본인인증 서비스</title>
</head>
<body>
	<br><br>
	<div>
		<div style="margin-left: 30px;">
			<h3>본인인증 서비스</h3>
		</div>
		<br><br>
		<div style="margin-left: 30px;">
			<button class="btn btn-primary btn-sm" id="phoneAuthSendBtn">인증 문자 보내기</button>
		</div><br>
		<div style="margin-left: 30px;">
			<input type="text" class="single-input float-left" id="authNumber" style="width: 200px; background-color: aqua;"/>
			<button class="btn btn-primary btn-sm" id="authChkBtn">확인</button>
		</div><br>
		<form action="/sendSmsPhoneAuth" method="post" id="sendForm">
			<div id="needForAuth">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</div>
		</form>
	</div>
	
	<script>
		$(function(){
			$('#phoneAuthSendBtn').on("click", function(e){
				e.preventDefault();
				var phone = new URLSearchParams(location.search).get('phone');
				var authNumber = String(Math.floor(Math.random() * 10)) + String(Math.floor(Math.random() * 10)) + 
								+ String(Math.floor(Math.random() * 10)) + String(Math.floor(Math.random() * 10))
								+ String(Math.floor(Math.random() * 10)); 
				
				$('#needForAuth').append("<input type='hidden' value='"+ phone +"' name='authPhone'/>");
				$('#needForAuth').append("<input type='hidden' value='" + authNumber + "' name='authNumber'/>");
				$('#needForAuth').append("<input type='hidden' value='인증번호는 ["+ authNumber +"] 입니다.' name='text'/>");
				
				$('#sendForm').submit();
				
				alert('회원님에게 인증 번호를 보내드렸습니다. 5분 이내에 입력해주세요');
			});
			
			$('#authChkBtn').on("click", function(e){
				var authChkBtnValidate = false;
				if(!$('#authNumber').val()){
					alert('인증번호를 입력해주세요');
				}else{
					authChkBtnValidate = true;
				}
				
				if(authChkBtnValidate == true){
					var param = {
						authPhone : new URLSearchParams(location.search).get('phone'),
						authNumber : $('input#authNumber').val()
					};
					
					phoneAuthService.getPhone(param, function(result){
						var currentTime = new Date();
						// 현재 시간에서 authDate를 빼서 밀리초를 구한 다음 그게 5분 이상 지나면 시간 초과
						// 5분 이상 1000*60*5
						console.log((currentTime.getTime() - result.authDate));
						console.log((currentTime.getTime() - result.authDate) >= 1000*60*5);
						if((currentTime.getTime() - result.authDate) >= 1000*60*5){
							alert('제한 시간이 초과되었습니다');
						}else if(result.authNumber == $('input#authNumber').val()){
							if((currentTime.getTime() - result.authDate) >= 1000*60*5){
								console.log('제한 시간이 초과되었습니다');
							}else{
								// 해당 핸드폰 번호 레코드 delete
								phoneAuthService.remove(param.authPhone, function(deleteResult){
									if(deleteResult != null){
										alert('인증되었습니다');
										//팝업창 꺼지면서 인증 완료 값 넘기기
										$('#memberPhoneErrorMsg',opener.document).html('인증되었습니다');
										$('#phoneAuthChk',opener.document).val('chk');
										window.close();
									}
								});
							}
						}else if(result.authNumber != $('input#authNumber').val()){
							alert("인증번호가 일치하지않습니다");
						}
					});
				}
			});
		})
		
	</script>
	
	<script src="/resources/js/phoneAuth.js"></script>
	<script src="/resources/js/vendor/modernizr-3.5.0.min.js"></script>
   
   <script src="/resources/js/popper.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
   <script src="/resources/js/owl.carousel.min.js"></script>
   <script src="/resources/js/isotope.pkgd.min.js"></script>
   <script src="/resources/js/ajax-form.js"></script>
   <script src="/resources/js/waypoints.min.js"></script>
   <script src="/resources/js/jquery.counterup.min.js"></script>
   <script src="/resources/js/imagesloaded.pkgd.min.js"></script>
   <script src="/resources/js/scrollIt.js"></script>
   <script src="/resources/js/jquery.scrollUp.min.js"></script>
   <script src="/resources/js/wow.min.js"></script>
   <script src="/resources/js/nice-select.min.js"></script>
   <script src="/resources/js/jquery.slicknav.min.js"></script>
   <script src="/resources/js/jquery.magnific-popup.min.js"></script>
   <script src="/resources/js/plugins.js"></script>
   <script src="/resources/js/gijgo.min.js"></script>

   <!--contact js-->
   <script src="/resources/js/contact.js"></script>
   <script src="/resources/js/jquery.ajaxchimp.min.js"></script>
   <script src="/resources/js/jquery.form.js"></script>
   <script src="/resources/js/jquery.validate.min.js"></script>
   <script src="/resources/js/mail-script.js"></script>

   <script src="/resources/js/main.js"></script>
</body>
</html>