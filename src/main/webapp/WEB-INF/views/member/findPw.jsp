<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<c:if test="${!empty findMemberIdError}">
		<script>
			alert('${findMemberIdError}');
		</script>
	</c:if>
	<div class="offers_area padding_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-left mb-100 custom-border-bottom">
						<h2>비밀번호 찾기</h2>
					</div>
				</div>
			</div>
			<div class="row justify-content-lg-center">
				<div class="col-lg-8 col-md-8">
					<form action="/member/findPw" method="post" id="findPwForm">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="mt-10 custom-input">
							<div>아이디</div>
							<input type="text" name="memberId" id="memberId" class="single-input custom-text-right">
						</div>
						<div class="custom-red-font custom-text-right"
							id="memberIdErrorMsg"></div>
						<br>
						<div class="mt-10 custom-input">
							<div>이메일</div>
							<input type="text" name="memberEmail" id="memberEmail" class="single-input custom-text-left custom-input-size">
							<div class="custom-text-left custom-my-auto">
								@
							</div>
							<div class="default-select custom-text-left" id="default-select">
								<select name="memberEmailSecond" id="memberEmailSecond">
									<option value="">선택</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
							</div><br>
							<div class="custom-red-font custom-text-right"
							id="memberEmailErrorMsg"></div>
						</div><br>
						<div class="mt-10 custom-input  align-middle">
							<div>핸드폰</div>
							<div class="default-select custom-text-left">
								<select name="memberPhoneFirst" id="memberPhoneFirst">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="018">018</option>
								</select>
							</div>
							<div class="custom-text-left custom-my-auto">
								-
							</div>
							<input type="text" name="memberPhoneSecond" id="memberPhoneSecond" class="single-input custom-text-left custom-input-size-phone">
							<div class="custom-text-left custom-my-auto">
								-
							</div>
							<input type="text" name="memberPhoneThird" id="memberPhoneThird" class="single-input custom-text-left custom-input-size-phone">
							<div class="custom-red-font custom-text-right"
							id="memberPhoneErrorMsg"></div>
						</div><br>
						<div class="mt-10 custom-input">
							<div class="col-xl-12 text-right">
								<button type="submit" class="boxed-btn3" id="findPwBtn">비밀번호 찾기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="scheduleModifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">스케줄 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div>비밀번호&nbsp&nbsp
						<input type="text" name="movieTitle" readOnly="readonly">
						<input type="hidden" name="movieNo">
					</div> <br>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="submit" class="boxed-btn3">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			$('#findPwBtn').on("click",function(e){
				e.preventDefault();
				
				var memberId = $('input#memberId').val();
				var memberEmail = $('input#memberEmail').val();
				var memberEmailSecond = $('select#memberEmailSecond').val();
				var memberPhoneFirst = $('select#memberPhoneFirst').val();
				var memberPhoneSecond = $('input#memberPhoneSecond').val();
				var memberPhoneThird = $('input#memberPhoneThird').val();
				
				
				var memberIdErrorMsg = $('#memberIdErrorMsg').html('');
				var memberEmailErrorMsg = $('#memberEmailErrorMsg').html('');
				var memberPhoneErrorMsg = $('#memberPhoneErrorMsg').html('');
				
				
				if (!memberId) {
					$('#memberIdErrorMsg').html('필수 항목입니다');
				}else if (!memberEmail) {
					$('#memberEmailErrorMsg').html('필수 항목입니다');
				}else if (!memberEmailSecond) {
					$('#memberEmailErrorMsg').html('필수 항목입니다');
				}else if (!memberPhoneFirst) {
					$('#memberPhoneErrorMsg').html('필수 항목입니다');
				}else if (!memberPhoneSecond) {
					$('#memberPhoneErrorMsg').html('필수 항목입니다');
				}else if (!memberPhoneThird) {
					$('#memberPhoneErrorMsg').html('필수 항목입니다');
				}else{
					$('#findPwForm').submit();
				}
				
			});
			
			var findMemberId = '${findMemberId.memberId}';
			
			/* if(!findMemberId){
				$('.modal').show();
			} */
			
		})
	</script>
<%@ include file="../include/footer.jsp" %>