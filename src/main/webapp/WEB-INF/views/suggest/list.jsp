<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!--board-start-->
	<section id="tabs" class="project-tab">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">건의사항</h3>
					</div>
					
					<div class="custom-search-position">
						<a href="/suggest/register" class="boxed-btn3">등록</a>
						<!--search-start-->
						<div class="">
							
							<form id="searchForm" action="/suggest/list" method="get">
								<button value="${pageMaker.cri.keyword }" type="submit" class="btn btn-primary btn-sm  float-right">검색</button>
			                	<c:set var="type" value="${pageMaker.cri.type }"/>
			
								<input type="text" name="keyword" placeholder="검색어를 입력하세요" class="input-group-btn  float-right">
								<div class="default-select custom-text-left custom-margin-choi float-right" style="margin: 4px; margin-top: -6px;" id="default-select">
									<select name='type'>
										<option value="" <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
										<option value="T" <c:out value="${pageMaker.cri.type=='T'?'selected':'' }"/>>제목</option>
										<option value="W" <c:out value="${pageMaker.cri.type=='W'?'selected':'' }"/>>작성자</option>
										<option value="TW" <c:out value="${pageMaker.cri.type=='TW'?'selected':'' }"/>>제목, 작성자</option>
									</select>
								</div>
								<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum }">
								<input type="hidden" name='amount' value="${pageMaker.cri.amount }">
							</form>
						</div>
					</div>
					<br><br>
					<!--search-end-->
					<div class="tab-content text-center" id="nav-tabContent">
						<table class="table custom-th-size4">
							<tr>
								<th style="width: 100px;">글번호</th>
								<th>건의사항 제목</th>
								<th>작성자</th>
							</tr>
							<c:forEach items="${list}" var="list">
								<tr>
									<td><c:out value="${list.suggestNo}"/></td>
									<c:choose>
										<c:when test="${list.suggestPrivateChk eq true}">
											<td><p class="fa fa-lock" style="margin-right: 8px;"></p><c:out value="${list.suggestTitle}"/></td>
										</c:when>
										<c:when test="${list.suggestPrivateChk eq false}">
											<td><c:out value="${list.suggestTitle}"/></td>
										</c:when>
									</c:choose>
									<td><c:out value="${list.memberId}"/></td>
								</tr>
							</c:forEach>
						</table>
						<!--paging-start-->
						<div class="custom-pagination ">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span></a>
										</li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class='page-item ${pageMaker.cri.pageNum == num? "custom-active-choi" : "" } '><a href="${num}">${num}</a></li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
						<!--paging-end-->
						<form id='actionForm' action="/suggest/list" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
							<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--board-end-->
	
	<script>
		$(function(){
			var actionForm = $('#actionForm');
			
			$('.page-item a').on("click", function(e){
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
		})
	</script>
	
	<%@ include file="../include/footer.jsp" %>