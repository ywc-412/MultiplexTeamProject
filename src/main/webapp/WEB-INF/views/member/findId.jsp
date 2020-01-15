<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
						<div class="col-xl-12 text-right">
							<button type="submit" class="boxed-btn3">id 찾기</button>
						</div>
						<p class="custom-red-font custom-text-right"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
    
<%@ include file="../include/footer.jsp" %>