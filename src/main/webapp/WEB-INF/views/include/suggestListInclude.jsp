<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form id='actionForm' action="/suggest/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" name="type" value="${pageMaker.cri.type}" /> <input
			type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
	</form>
</div>