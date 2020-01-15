<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-md-3">
						<div class="section-top-border">
							<div class="row">
								<div class="col-md-7 mt-sm-30">
									<h3 class="mb-20">마이페이지</h3>
									<div class="">
										<ul class="unordered-list">
											<li class="custom-active">내 정보 조회</li>
											<li>예매 내역</li>
											<li>내 리뷰</li>
											<li>내 한줄평</li>
											<li>내 기프티콘</li>
											<li>내 건의사항</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!--내 정보 조회 ... 떠야하는 부분-->
					<div class="row">
						<div class="row justify-content-lg-center">
							<div class="custom-col-md col-md-12">
								<form action="#">
									<div class="mt-10 custom-input">
										<div>아이디</div>
										<p>ywc412</p>
									</div><br>
									<div class="mt-10 custom-input">
										<div>이름</div>
										<p>최영우</p>
									</div><br>
									<div class="mt-10 custom-input">
										<div>이메일</div>
										<p>ywc412@naver.com</p>
									</div><br>
									<div class="mt-10 custom-input">
										<div>핸드폰</div>
										<p>010-4189-5485</p>
									</div><br>
									<div class="mt-10 custom-input">
										<div>생년월일</div>
										<p>94.03.27</p>
									</div><br>
								</form>
								<button class="btn btn-primary">내 정보 수정</button>
								<button type="button" class="btn btn-danger" data-toggle="modal" id="exampleModalBtn">
									회원탈퇴
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

<%@ include file="../include/footer.jsp" %>