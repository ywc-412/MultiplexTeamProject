<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<c:if test="${!empty registerComplete}">
	<script>
		alert('${registerComplete}');
	</script>
</c:if>
<c:if test="${!empty suggestRemoveComplete}">
	<script>
		alert('${suggestRemoveComplete}');
	</script>
</c:if>
<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">건의사항</h3>
				</div>

				<div class="custom-search-position">
					<a href="/suggest/register" class="boxed-btn3" id="registerA">등록</a>
					<!--search-start-->
					<form id="searchForm" action="/suggest/list" method="get">
						<button value="${pageMaker.cri.keyword }" type="submit"
							class="btn btn-primary btn-sm float-right" id="searchBtn">검색</button>
						<c:set var="type" value="${pageMaker.cri.type }" />

						<input type="text" name="keyword" id="keywordInput"
							placeholder="검색어를 입력하세요" class="input-group-btn  float-right"
							value="${pageMaker.cri.keyword }">
						<div
							class="default-select custom-text-left custom-margin-choi float-right"
							style="margin: 4px; margin-top: -6px;" id="default-select">
							<select name='type' id="selectType">
								<option value=""
									<c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type=='T'?'selected':'' }"/>>제목</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type=='W'?'selected':'' }"/>>작성자</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type=='TW'?'selected':'' }"/>>제목,
									작성자</option>
							</select>
						</div>
						<input type="hidden" name='pageNum'
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name='amount' value="${pageMaker.cri.amount }">
					</form>
				</div>
			</div>
			<br>
			<br>
			<!--search-end-->
			<!-- include start-->
			<div class="tab-content text-center" id="nav-tabContent">
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
									<td id="td"><p class="fa fa-lock"
											style="margin-right: 8px;"></p> <a class="trMove"
										id="necessaryPw" value="${list.suggestPw}"
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
				<form id='actionForm' action="/suggest/list" method="get">
					<input type="hidden" name="pageNum" id="pageNum"
						value="${pageMaker.cri.pageNum}" /> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}" /> <input
						type="hidden" name="type" value="${pageMaker.cri.type}" /> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
				</form>
			</div>
			<!-- include end -->
		</div>
	</div>
	</div>
</section>
<!--board-end-->
<!-- Modal -->
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
								class="single-input custom-text-right"
								placeholder="해당 게시글의 비밀번호를 입력해주세요!">
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
<sec:authorize access="isAuthenticated()">
	<c:set value="<sec:authentication property='principal.username'/>"
		var="userId"></c:set>
</sec:authorize>
<script>
	$(function() {

		$('#searchBtn').on("click", function(e) {
			e.preventDefault();

			if (!$('#selectType').val()) {
				alert('검색 조건을 선택해주세요');
				return;
			} else if (!$('#keywordInput').val()) {
				alert('검색어를 입력해주세요');
				return;
			} else {
				$('#searchForm').submit();
			}
		});

		$('#registerA').on("click", function(e) {
			e.preventDefault();
			var userConnect = '<c:out value="${userId}"/>';
			if (!userConnect) {
				alert('로그인이 필요한 서비스입니다');
				return;
			} else {
				location.href = "/suggest/register";
			}
		});

		var actionForm = $('#actionForm');

		$('.page-item a').on("click", function(e) {
			e.preventDefault();
			$("#pageNum").val($(this).attr("href"));
			actionForm.submit();
		});

		$(document)
				.on(
						"click",
						"#nonNecessaryPw",
						function(e) {
							e.preventDefault();

							actionForm
									.append("<input type='hidden' name='suggestNo' value='"
											+ $(this).attr("href") + "'>");
							actionForm.attr("action", "/suggest/get");
							actionForm.submit();
						});

		$(document)
				.on(
						"click",
						"#necessaryPw",
						function(e) {
							e.preventDefault();
							$('#modal').show();

							var realPassword = $(this).attr('value');
							var inputSuggestNo = "<input type='hidden' name='suggestNo' value='"
									+ $(this).attr("href") + "'>";

							$('#suggestPwBtn')
									.on(
											"click",
											function(e) {

												var userInputPassword = $(
														'input[name=suggestPw2]')
														.val();

												if (realPassword === userInputPassword) {
													actionForm
															.append(inputSuggestNo);
													actionForm.attr("action",
															"/suggest/get");
													actionForm.submit();
												} else {
													alert('비밀번호가 일치하지 않습니다');
													return false;
												}
											});
						});

		$('#closeBtn3').on("click", function(e) {
			e.preventDefault();
			$('#modal').hide();
			$('#suggestPw2').val('');
		});
	})
</script>



<%@ include file="../include/footer.jsp"%>