<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/header.jsp"%>

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
										<li><a href="/member/client" class="custom-active">회원 관리</a></li>
										<li><a href="/report/review/list">리뷰 신고 관리</a>
											<ul>
												<li><a href="/report/review/list">리뷰 신고 관리</a></li>
												<li><a href="/report/reply/list">리뷰 댓글 신고 관리</a></li>
												<li><a href="/report/comment/list">한줄평 신고 관리</a></li>
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
							<div class="row">
								<button id="clientRemoveBtn" class="pull-right boxed-btn3">강퇴</button>
								<button id="clientSemdMsgBtn" class="pull-right boxed-btn3">메시지보내기</button>
							</div>
							<div class="mt-10 custom-input">
								<div>아이디</div>
								<p>${member.memberId }</p>
							</div>
							<br>
							<div class="mt-10 custom-input">
								<div>이름</div>
								<p>${member.memberName }</p>
							</div>
							<br>
							<div class="mt-10 custom-input">
								<div>이메일</div>
								<p>${member.memberEmail }@${member.memberEmailSecond }</p>
							</div>
							<br>
							<div class="mt-10 custom-input">
								<div>핸드폰</div>
								<p>${member.memberPhoneFirst}-${member.memberPhoneSecond}-${member.memberPhoneThird }</p>
							</div>
							<br>
							<div class="mt-10 custom-input">
								<div>해당 회원의 예매내역은 다음과 같습니다.</div>
								
								
							</div>
							<!--예매내역-->
								<div class="row justify-content-lg-center custom-table-margin2">
									<div class="row col-md-12" style="margin : 0px; padding : 0px; position : relative; left : -100px; ">
										<!--여기 테이블-->
											<table class="table custom-table-align">
												<tr>
													<th style="width : 150px; margin : auto; ">영화 제목</th>
													<th style="width : 150px; margin : auto; ">관람 일시</th>
												</tr>
												<c:forEach items="${reserveList }" var="r">	
													<tr>
														<td style="width : 150px; margin : auto; ">${r.movieTitle }</td>
														<td style="width : 150px; margin : auto; "><c:set var="sdate" value="${r.scheduleDate }" />${fn:substring(sdate,0,4)}.${fn:substring(sdate,4,6) }.${fn:substring(sdate,6,8) }</td>
													</tr>
												</c:forEach>
											</table>
											
									</div>
								</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- End Align Area -->
	<!-- 메시지 모달 -->
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h4>관리자 메시지 서비스</h4>
				<hr>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<form action="/sendSms" method="POST" id="completeForm">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }">
								<input type="hidden" name="memberId" value="${member.memberId }"/>
								<div class="mt-10 custom-input">
									<div>${member.memberId} 회원님에게 메시지를 보냅니다</div>
									<br><br>
									<input type="text" name="text" id="text" placeholder="메시지 내용을 입력해주세요" class="single-input custom-text-right">
									<div id="memberPhoneNumberHere">
										
									</div>
								</div> 
								<br>
								<div class="mt-10 custom-input text-center">
									<button type="button" class="boxed-btn3" id="sendMsgBtn">전송</button>
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
			var phoneFirst = '${member.memberPhoneFirst}';
			var phoneSecond = '${member.memberPhoneSecond}';
			var phoneThird = '${member.memberPhoneThird}';
			
			var phoneFull = phoneFirst + phoneSecond + phoneThird;
			
			$('#sendMsgBtn').on("click", function(e){
				e.preventDefault();
				$('#memberPhoneNumberHere').append("<input type='hidden' name='to' value='"+phoneFull+"'/>");
				
				if(!$('input#text').val()){
					alert('메시지 내용을 입력해주세요');
					return;
				}else{
					$('#completeForm').submit();
				}
				
			});
			
			$('#clientRemoveBtn').on("click", function(e) {
				var confirmRemove = confirm("해당 회원을 강퇴하시겠습니까?");

				if (confirmRemove === true) {
					$('#clientRemoveForm').submit();
				}
			});
			
			$('#clientSemdMsgBtn').on("click", function(e){
				$('#modal').show();
			});
			
			$('#closeBtn3').on("click", function(e){
				e.preventDefault();
				$('#modal').hide();
			});
		})
	</script>

	<%@ include file="../include/footer.jsp"%>