<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-md-3">
						<div class="section-top-border">
							<div class="row">
								<div class="col-md-10 mt-sm-30">
									<h3 class="mb-20">관리자페이지</h3>
									<div class="">
										<ul class="unordered-list">
											<li class="custom-active">회원 관리</li>
											<li>리뷰 신고 관리
												<ul>
													<li>리뷰 신고 관리</li>
													<li>리뷰 댓글 신고 관리</li>
													<li>한줄평 신고 관리</li>
												</ul>
											</li>
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
										<div>해당 회원의 예매내역은 다음과 같습니다.</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!--예매내역-->
					<div class="row justify-content-lg-center custom-table-margin2">
						<div class="row col-md-12">
							<!--여기 테이블-->
							<table class="table custom-table-align ">
								<tr>
									<th class="custom-table-size2">영화 제목</th>
									<th class="custom-table-size2">관람 일시</th>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
								<tr>
									<td>조커</td>
									<td>2019.12.18</td>
								</tr>
							</table>
						</div>
						<ul class="pagination justify-content-center">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">6</a></li>
							<li class="page-item"><a class="page-link" href="#">7</a></li>
							<li class="page-item"><a class="page-link" href="#">8</a></li>
							<li class="page-item"><a class="page-link" href="#">9</a></li>
							<li class="page-item"><a class="page-link" href="#">10</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End Align Area -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">탈퇴하시려면 비밀번호를 입력해주세요</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mt-10 custom-input">
						<input type="password" name="first_name" class="single-input custom-text-right custom-input-color">
					</div><br>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-danger">회원탈퇴</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>