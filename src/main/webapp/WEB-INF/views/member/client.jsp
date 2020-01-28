<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<c:if test="${!empty removeCompleteMsg}">
	<script>
		alert('${removeCompleteMsg}');
	</script>
</c:if>

<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row">
				<!-- 관리자 페이지 메뉴 바 include? -->
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
				<div class="row custom-table-margin">
					<div class="justify-content-lg-center custom-table-size">
						<div class="col-lg-12">
							<form id='searchForm' action="/member/client" method="get">
								<div class="default-select custom-text-left custom-margin-choi" id="default-select">
									<select name='type' id="keywordSelect">
										<option value="" <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
										<option value="I" <c:out value="${pageMaker.cri.type=='I'?'selected':'' }"/>>회원 아이디</option>
										<option value="N" <c:out value="${pageMaker.cri.type=='N'?'selected':'' }"/>>회원 이름</option>
										<option value="IN" <c:out value="${pageMaker.cri.type=='IN'?'selected':'' }"/>>회원 ID, 회원 이름</option>
									</select>
								</div>
								<input type="text" id="keywordInput" class="single-input custom-text-left custom-input-size custom-margin-choi" name="keyword" value="${pageMaker.cri.keyword }">
								<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum }">
								<input type="hidden" name='amount' value="${pageMaker.cri.amount }">
								<div class="custom-text-left">
									<button class="btn btn-primary btn-sm" id="clientSearchBtn">회원 검색</button>
								</div>
							</form>
						</div><br><br>
						<div class="row col-md-12">
							<!--여기 테이블-->
							<table class="table custom-table-align">
								<tr>
									<th class="custom-table-size">회원 ID</th>
									<th class="custom-table-size">회원 이름</th>
									<th class="custom-table-size">가입 일자</th>
								</tr>
								<c:forEach items="${list}" var="list">
									<tr>
										<td><a class="trMove" href="<c:out value="${list.memberId}"/>"><c:out value="${list.memberId}"/></a></td>
										<td>${list.memberName}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.memberRegDate}"/></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						
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
						
						<form id='actionForm' action="/member/client" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
							<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<script>
	$(function(){
		
		$('#clientSearchBtn').on("click", function(e){
			e.preventDefault();
			if(!$('#keywordSelect').val()){
				alert('검색 조건을 선택해주세요');
			}else if(!$('#keywordInput').val()){
				alert('검색어를 입력해주세요');
			}else{
				$('#searchForm').submit();
			}
		});
		
		var actionForm = $('#actionForm');
		
		$('.page-item a').on("click", function(e){
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$('.trMove').on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href") +"'>");
			
			actionForm.attr("action", "/member/clientInfo");
			actionForm.submit();
		});
	})
</script>
<%@ include file="../include/footer.jsp"%>