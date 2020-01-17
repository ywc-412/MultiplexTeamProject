<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<c:if test="${!empty updateSuccess}">
	<script>
		alert('${updateSuccess}');
	</script>
</c:if>

<c:if test="${!empty noGoodBye}">
	<script>
		alert('${noGoodBye}');
	</script>
</c:if>

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
							<form action="/member/myInfoMod" method="get" id="myInfoModForm">
								<div class="mt-10 custom-input">
									
									<div>아이디</div>
									<sec:authorize access="isAuthenticated()">
										<input type="hidden" name="memberId"
											value="<sec:authentication property="principal.username"/>">
										<p>
											<sec:authentication property="principal.username" />
										</p>
									</sec:authorize>
								</div>
								<br>
								<div class="mt-10 custom-input">
									<div>이름</div>
									<sec:authorize access="isAuthenticated()">
										<p>
											<c:out value="${memberInfo.memberName }"></c:out>
										</p>
									</sec:authorize>
								</div>
								<br>
								<div class="mt-10 custom-input">
									<div>이메일</div>
									<sec:authorize access="isAuthenticated()">
										<p>
											<c:out value="${memberInfo.memberEmail}" />
											@
											<c:out value="${memberInfo.memberEmailSecond }" />
										</p>
									</sec:authorize>
								</div>
								<br>
								<div class="mt-10 custom-input">
									<div>핸드폰</div>
									<sec:authorize access="isAuthenticated()">
										<p>
											<c:out value="${memberInfo.memberPhoneFirst}" />
											-
											<c:out value="${memberInfo.memberPhoneSecond}" />
											-
											<c:out value="${memberInfo.memberPhoneThird}" />
										</p>
									</sec:authorize>
								</div>
								<br>
								<div class="mt-10 custom-input">
									<div>생년월일</div>
									<sec:authorize access="isAuthenticated()">
										<p>
											<fmt:formatDate pattern="yyyy-MM-dd"
												value="${memberInfo.memberBirth}" />
										</p>
									</sec:authorize>
								</div>
								<br>
							</form>
							<button class="btn btn-primary" id="myInfoModifyBtn">내
								정보 수정</button>
							<button type="button" class="btn btn-danger" id="removeBtn">회원탈퇴</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div id="modal" class="searchModal">
	<div class="search-modal-content">
		<div class="page-header">
			<h4>회원 탈퇴</h4>
			<hr>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						<form action="/member/remove" method="post" id="completeForm">
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }">
							<sec:authorize access="isAuthenticated()">
								<input type="hidden" name="memberId" value="<sec:authentication property="principal.username"/>">
							</sec:authorize>
							<div class="mt-10 custom-input">
								<div>비밀번호</div>
								<input type="password" name="memberPw" id="memberPw"
									class="single-input custom-text-right">
								<div class="custom-red-font custom-text-right"
									id="memberPwErrorMsg"></div>
							</div>
							<input type="hidden" name="memberId" value="${findMemberId}">
							<div class="mt-10 custom-input text-center">
								<button type="button" class="boxed-btn3" id="removeBtn2">회원
									탈퇴</button>
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
<!-- Modal -->


<script>
	$(function() {
		$('#myInfoModifyBtn').on("click", function(e) {
			e.preventDefault();

			$('#myInfoModForm').submit();
		});
		
		$('#closeBtn3').on("click", function(e){
			$('#modal').hide();
		});
		
		
		$('#removeBtn').on("click",function(e){
			e.preventDefault();
			
			$('#modal').show();
		});
		
		$('#removeBtn2').on("click", function(e){
			e.preventDefault();
			$('#completeForm').submit();
		})
	})
</script>

<%@ include file="../include/footer.jsp"%>









