<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="offers_area padding_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-left mb-100 custom-border-bottom">
						<h2>내 정보 수정</h2>
					</div>
				</div>
			</div>
			<div class="row justify-content-lg-center">
				<div class="col-lg-8 col-md-8">
					<div class="mt-10 custom-input">
						<div>아이디</div>
						<p>ywc412</p>
					</div><br>
					<div class="mt-10 custom-input">
						<div>이름</div>
						<p>최영우</p>
					</div><br>
					<div class="mt-10 custom-input">
						<div>비밀번호</div>
						<input type="text" name="first_name" class="single-input custom-text-left custom-input-size">
						<p class="custom-red-font">비밀번호 형식에 맞지 않습니다.</p>
					</div><br>
					<div class="mt-10 custom-input">
						<div>비밀번호 확인</div>
						<input type="text" name="first_name" class="single-input custom-text-left custom-input-size">
						<p class="custom-red-font">비밀번호와 비밀번호 항목이 일치하지 않습니다</p>
					</div><br>
					<div class="mt-10 custom-input">
						<div>이메일</div>
						<input type="text" name="first_name" class="single-input custom-text-left custom-input-size">
						<div class="custom-text-left custom-my-auto">
							@
						</div>
						<div class="default-select custom-text-left" id="default-select">
							<select>
								<option value="1">-직접 입력-</option>
								<option value="1">naver.com</option>
								<option value="1">gmail.com</option>
								<option value="1">hanmail.net</option>
							</select>
						</div><br>
						<p class="custom-red-font custom-text-right">이미 사용 중인 email 입니다.</p>
					</div><br>
					<div class="mt-10 custom-input  align-middle">
						<div>핸드폰</div>
						<div class="default-select custom-text-left">
							<select>
								<option value="1">010</option>
								<option value="1">011</option>
								<option value="1">018</option>
							</select>
						</div>
						<div class="custom-text-left custom-my-auto">
							-
						</div>
						<input type="text" name="first_name" class="single-input custom-text-left custom-input-size-phone">
						<div class="custom-text-left custom-my-auto">
							-
						</div>
						<input type="text" name="first_name" class="single-input custom-text-left custom-input-size-phone">
						<p class="custom-red-font custom-text-right">필수 입력 항목입니다.</p>
					</div><br>
					<div class="mt-10 custom-input">
						<div class="col-xl-12 text-center">
							<button type="submit" class="boxed-btn3 custom-button">수정완료</button>
							<button type="submit" class="boxed-btn custom-button">취소</button>
						</div>
						<p class="custom-red-font custom-text-right"></p>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>