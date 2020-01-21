<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
							<div class="custom-col-md col-md-12 custom-row-width">
								<form action="/member/client/remove" method="post" id="clientRemoveForm">
									<input type="hidden" name="memberId" value="<c:out value="${member.memberId}"/>">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								</form>
								
								<div>
									<button id="clientRemoveBtn" class="pull-right boxed-btn3">강퇴</button>
								</div>
								
								<div class="mt-10 custom-input">
									<div>아이디</div>
									<p>${member.memberId }</p>
								</div><br>
								<div class="mt-10 custom-input">
									<div>이름</div>
									<p>${member.memberName }</p>
								</div><br>
								<div class="mt-10 custom-input">
									<div>이메일</div>
									<p>${member.memberEmail }@${member.memberEmailSecond }</p>
								</div><br>
								<div class="mt-10 custom-input">
									<div>핸드폰</div>
									<p>${member.memberPhoneFirst}-${member.memberPhoneSecond}-${member.memberPhoneThird }</p>
								</div><br>
								<div class="mt-10 custom-input">
									<div>해당 회원의 예매내역은 다음과 같습니다.</div>
								</div>
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
								<c:forEach items="${reserveList }" var="r">
									<tr>
										<td>${r.movieTitle }</td>
										<td><c:set var="sdate" value="${r.scheduleDate }"/>${fn:substring(sdate,0,4)}.${fn:substring(sdate,4,6) }.${fn:substring(sdate,6,8) }</td>
									</tr>
								</c:forEach>
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

	
	<script>
		$(function(){
			$('#clientRemoveBtn').on("click", function(e){
				var confirmRemove = confirm("해당 회원을 강퇴하시겠습니까?");
				
				if(confirmRemove === true){
					$('#clientRemoveForm').submit();
				}
			});
		})
	</script>
	
<%@ include file="../include/footer.jsp" %>