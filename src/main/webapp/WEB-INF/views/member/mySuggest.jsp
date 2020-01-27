<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/header.jsp"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="loginUsername" />
</sec:authorize>
<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row">

				<!-- 마이페이지 인클루드....start -- row 밑에서 include-->
				<%@ include file="../include/myPageMenu.jsp"%>
				<!-- 마이페이지 인클루드....end -->

				<div class="tab-content text-center" id="nav-tabContent" style="width: 800px; margin-top: 50px;">
					<table class="table custom-th-size4">
						<tr>
							<th style="width: 100px;">글번호</th>
							<th>건의사항 제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.suggestNo}" /></td>
								<c:choose>
									<c:when test="${list.suggestPrivateChk eq true}">
										<td id="td"><p class="fa fa-lock" style="margin-right: 8px;"></p>
											<a class="trMove" id="necessaryPw" value="${list.suggestPw}"
											href="<c:out value="${list.suggestNo}"/>"><c:out
													value="${list.suggestTitle}" /></a></td>
									</c:when>
									<c:when test="${list.suggestPrivateChk eq false}">
										<td id="td"><a class="trMove" id="nonNecessaryPw"
											href="<c:out value="${list.suggestNo}"/>"><c:out
													value="${list.suggestTitle}" /></a></td>
									</c:when>
								</c:choose>
								<td><c:out value="${list.memberId}" /></td>
							</tr>
						</c:forEach>
					</table>
					<!--paging-start-->
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.startPage -1}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class='page-item ${pageMaker.cri.pageNum == num? "custom-active-choi" : "" } '><a
								href="${num}">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.endPage +1}" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
					<!--paging-end-->
					<form id='actionForm' action="/member/mySuggest" method="get">
						<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
						<input type="hidden" name="type" value="W" /> 
						<input type="hidden" name="keyword" value="${loginUsername}" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="modal" class="searchModal">
	<div class="search-modal-content">
		<div class="page-header">
			<h4>비밀글 입니다!</h4>
			<hr>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }">
						<div class="mt-10 custom-input">
							<div>비밀번호</div>
							<input type="password" name="suggestPw2" id="suggestPw2" value=""
								class="single-input custom-text-right" placeholder="해당 게시글의 비밀번호를 입력해주세요!">
							<div class="custom-red-font custom-text-right"
								id="memberPwErrorMsg"></div>
						</div>
						<div class="mt-10 custom-input text-center">
							<button type="button" class="boxed-btn3" id="suggestPwBtn">입력</button>
							<button type="button" class="boxed-btn3" id="closeBtn3">닫기</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
</div>
<!-- Modal -->
	
	<script>
		$(function(){
			var actionForm = $('#actionForm');
			
			$(".page-item a").on("click", function(e){
				e.preventDefault();
				$("#pageNum").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(document).on("click", "#nonNecessaryPw", function(e){
				e.preventDefault();
			
				actionForm.append("<input type='hidden' name='suggestNo' value='"+$(this).attr("href") +"'>");
				actionForm.attr("action", "/suggest/get");
				actionForm.submit();
			});
			
			
			$(document).on("click", "#necessaryPw", function(e){
				e.preventDefault();
				$('#modal').show();
				
				var realPassword = $(this).attr('value');
				var inputSuggestNo = "<input type='hidden' name='suggestNo' value='"+$(this).attr("href") +"'>"
				
				$('#suggestPwBtn').on("click", function(e){
					
					var userInputPassword = $('input[name=suggestPw2]').val();
					
					if(realPassword === userInputPassword){
						actionForm.append(inputSuggestNo);
						actionForm.attr("action", "/suggest/get");
						actionForm.submit();
					}else{
						alert('비밀번호가 일치하지 않습니다');
						return false;
					}
				});
			});
			
			
			
			$('#closeBtn3').on("click", function(e){
				e.preventDefault();
				$('#modal').hide();
				$('#suggestPw2').val('');
			});
		})
		
	</script>

<%@ include file="../include/footer.jsp"%>