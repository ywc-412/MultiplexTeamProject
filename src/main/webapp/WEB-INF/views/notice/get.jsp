<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">공지사항</h3>
				</div>
				<ul class="custom-notice">
					<li><span name="noticeTitle"><c:out value='${notice.noticeTitle}' /></span></li>
					<li>등록일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${notice.noticeDate}" /></li>
					<li>조회수 : <c:out value='${notice.noticeView}' /></li>
				</ul>
				<div class="view_area">
					<p>
						<span class="custom-font-only-bold" name="noticeContent">
						<c:out value='${notice.noticeContent}' /></span>
					</p>
				
				</div>
				<hr>
				
				<div class="">
				
				<button type="button" data-oper="list" class="btn btn-primary float-left custom-button-gift">LIST</button>		
						<sec:authorize access="isAuthenticated()">		
					<form action="/notice/modify" id="operForm" method="get">
						<input type="hidden" id="noticeNo" name="noticeNo"
							value="${notice.noticeNo}"> <input type="hidden"
							name="pageNum" value="${cri.pageNum}"> <input
							type="hidden" name="amount" value="${cri.amount}"> <input
							type="hidden" name="type" value="${cri.type}"> <input
							type="hidden" name="keyword" value="${cri.keyword}">
						<button data-oper="modify"
							class="btn btn-primary float-right custom-button-gift">수정</button>
					</form>
					
					<form role="form" action="/notice/remove" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}"> <input type="hidden"
							name="noticeNo" value="${notice.noticeNo}">
						<button type="submit" data-oper="remove"
							class="btn btn-danger float-right custom-button-gift">삭제</button>
					</form>
					</sec:authorize>
				</div>
			
		
	</div>
	</div>
</section>
<!--board-end-->
<script>
	$(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			if (operation === 'modify') {
				formObj.attr("action", "/notice/modify");
				formObj.submit();
			} else if (operation === 'remove') { //삭제 버튼
				  if(confirm("정말로 삭제하시겠습니까?") == true) { 
					  formObj.attr("action", "/notice/remove");
					  formObj.submit();
			    	   } else {
			    		   false;
			    	   }
				
			} else if (operation === 'list') {
				formObj.attr("action", "/notice/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
				
				formObj.submit();
			}
			
		});
	});
</script>

<%@include file="../include/footer.jsp"%>