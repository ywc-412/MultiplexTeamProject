<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="offers_area padding_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-left mb-100 custom-border-bottom">
						<h2>회원가입</h2>
					</div>
				</div>
			</div>
			<div class="row justify-content-lg-center">
				<div class="col-lg-8 col-md-8">
					<form method="post" action="/member/join" role="form">
						<div class="mt-10 custom-input">
							<div>아이디</div>
							<input type="text" name="memberId" class="single-input custom-text-right">
							<p class="custom-red-font custom-text-right">이미 사용 중인 id 입니다.</p>
						</div><br>
						<div class="mt-10 custom-input">
							<div class="">이름</div>
							<input type="text" name="memberName" class="single-input custom-text-right">
							<p class="custom-red-font custom-text-right">필수 입력 항목입니다.</p>
						</div><br>
						<div class="mt-10 custom-input">
							<div>비밀번호</div>
							<input type="password" name="memberPw" class="single-input custom-text-right">
							<p class="custom-red-font custom-text-right">영어 대소문자/ 숫자/ 특수문자의 조합으로 8자리 이상 입력해주세요</p>
						</div><br>
						<div class="mt-10 custom-input">
							<div>비밀번호 확인</div>
							<input type="password" name="memberPwChk" class="single-input custom-text-right">
							<p class="custom-red-font custom-text-right">비밀번호와 비밀번호 확인이 일치하지 않습니다.</p>
						</div><br>
						<div class="mt-10 custom-input">
							<div>이메일</div>
							<input type="text" name="memberEmailFirst" class="single-input custom-text-left custom-input-size">
							<div class="custom-text-left custom-my-auto">
								@
							</div>
							<div class="default-select custom-text-left" id="default-select">
								<select name="memberEmailSecond">
									<option value="1">-직접 입력-</option>
									<option value="1">naver.com</option>
									<option value="1">gmail.com</option>
									<option value="1">hanmail.net</option>
								</select>
							</div><br>
							<p class="custom-red-font custom-text-right">이미 사용 중인 email 입니다.</p>
						</div><br>
						<div class="mt-10 custom-input">
							<div>주소</div>
							<input type="text" name="memberAddress" class="single-input custom-text-right">
							<p class="custom-red-font custom-text-right">필수 입력 항목입니다.</p>
						</div><br>
						<div class="mt-10 custom-input  align-middle">
							<div>핸드폰</div>
							<div class="default-select custom-text-left">
								<select name="memberPhoneFirst">
									<option value="1">010</option>
									<option value="1">011</option>
									<option value="1">018</option>
								</select>
							</div>
							<div class="custom-text-left custom-my-auto">
								-
							</div>
							<input type="text" name="memberPhoneSecond" class="single-input custom-text-left custom-input-size-phone">
							<div class="custom-text-left custom-my-auto">
								-
							</div>
							<input type="text" name="memberPhoneThird" class="single-input custom-text-left custom-input-size-phone">
							<p class="custom-red-font custom-text-right">필수 입력 항목입니다.</p>
						</div><br>
						<div class="mt-10 custom-input">
							<div>생년월일</div>
							<div class="row">
								<div class="col-xl-6">
									<input id="datepicker" placeholder="생년월일" name="memberBirth">
								</div>
								<div class="col-xl-12 text-right">
									<button type="submit" class="boxed-btn3">회원가입</button>
								</div>
							</div>
							<p class="custom-red-font custom-text-right"></p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>