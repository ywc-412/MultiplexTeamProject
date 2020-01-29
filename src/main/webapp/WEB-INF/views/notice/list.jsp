<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board s-->
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row no-mean">		
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">공지사항</h3>
				</div>
				<div class="custom-search-position">
				<sec:authorize access="hasRole('ROLE_ADMIN')">						
					<button id="regNotice" type="button" class="btn btn-primary btn-sm">등록</button>						
				</sec:authorize>
					<!--search s -->
					<div class="pull-right">
						<form id="searchForm" action="/notice/list" method="get">							
						<select name="type" class="typeChk">
							<option value="" <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
							<option value="T" <c:out value="${ pageMaker.cri.type =='T'?'selected':''}"/>>제목</option>
							<option value="C" <c:out value="${ pageMaker.cri.type =='C'?'selected':''}"/>>내용</option>
						</select>
						<input type="text" placeholder="검색어를 입력하세요" class="input-group-btn" name="keyword" value="${ pageMaker.cri.keyword }"/>
						<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }" /> 
						<input type="hidden" name="amount" value="${ pageMaker.cri.amount }" />
						<button class="btn btn-primary btn-sm" id="search">검색</button>							
						</form>
						<br>
					</div>					
					<!--search e -->					
					<div class="tab-content" id="nav-tabContent">					
						<table class="table custom-th-size">								
							<tr>
								<th style="width: 100px;">번호</th>
								<th>제목</th>
								<th>등록일</th>
							</tr>								
							<c:forEach items="${list}" var="notice">
							<tbody>
								<tr>												
									<td>${notice.noticeNo}</td>
									<td><a class="move" href="${notice.noticeNo}">${notice.noticeTitle}</a></td>
									<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy.MM.dd"/></td>									
								</tr>									
							</tbody>
							</c:forEach>
						</table>							
					<!-- paging s -->
					<div class="pagination justify-content-center">
						<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item previous">
										<a class="page-link"href="${pageMaker.startPage-1}" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>										
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item + ${pageMaker.cri.pageNum == num ? 'active' : ''}">
										<a class="page-link" href="${num}">${num}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item next">
										<a class="page-link"href="${pageMaker.endPage+1}" aria-label="Next"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
						<!--paging e -->
							<form id="actionForm" action="/notice/list" method="get">
								<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}"> 
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<input type="hidden" name="type" value="${ pageMaker.cri.type }" /> 
								<input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }" />
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--board e-->

<script>

$(function() {  	
	$("#search").click(function(e) {
		var searchForm = $("#searchForm");
		if (!searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("내용을 입력해주세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});

$('.move').click(
	function(e) {
		e.preventDefault();
		//actionForm에 hidden으로 name 속성 추가 값은 noticeNo 지정, value 속성 추가 값은 ~~ 지정한 후 append
		$('#actionForm').append(
				"<input type='hidden' name='noticeNo' value='"
						+ $(this).attr("href") + "'>");
		$('#actionForm').attr("action", "/notice/get");

		$('#actionForm').submit();
	});
});

//페이지번호 링크 처리
$('.page-item a').click(function(e) {
	e.preventDefault();
	$('#pageNum').val($(this).attr('href'));
	$('#actionForm').submit();
});

$('#regNotice').click(function() {
	self.location = "/notice/register";
});

</script>
	
<%@include file="../include/footer.jsp" %>