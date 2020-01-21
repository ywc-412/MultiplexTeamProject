<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!-- Start Align Area -->
<div class="whole-wrap">
    <div class="container box_1170">
        <div class="custom-section-top-border">
            <div class="row">
                <!--mypage-side-->
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
                <!--board-start-->
                <div class="tab-content" id="nav-tabContent">
					<table class="table custom-th-size">				
						<tr>
							<th>이름</th>
							<th>가격</th>
							<th>현재상태</th>
							<th>만료일자</th>
							<th>기간연장</th>
						</tr>
						<%-- <c:forEach items="${gift}" var="gift">
							<tbody>
								<tr>
									<td>${gift.giftNo}</td>
									<td>${gift.giftPrice}</td>									
								</tr>
							</tbody>
						</c:forEach> --%>
						<c:forEach items="${mygift}" var="mygift" varStatus="status">
							<tbody>
								<tr>
									<td><span class="modalPop">${mygift.giftList[0].giftName}</span></td>
									<td>${mygift.giftList[0].giftPrice}</td>
									<td><c:set var="status" value="${mygift.status}"/>
										<c:choose>
											<c:when test="${status eq 0}">사용가능</c:when>
	      									<c:when test="${status eq 1}">사용완료</c:when>		
					    					<c:when test="${status eq 2}">기간만료</c:when>
	      									<c:otherwise>환불완료</c:otherwise>							
    									</c:choose></td>
									<td><fmt:formatDate value="${mygift.expireDate}" pattern="yyyy.MM.dd"/></td>
									<td><c:set var="extendChk" value="${mygift.extendChk}"/>
										<c:choose>
											<c:when test="${status eq 0}">가능</c:when>	      									
	      									<c:otherwise>불가능</c:otherwise>							
    									</c:choose></td>															
								</tr>
							</tbody>
						</c:forEach>
					</table>
<!-- Reply Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<div class="form-group">
            									<label>Reply</label>
           										<input class="form-control" 
           											   id="giftName" name="giftName" value="${mygift.giftList[0].giftName}">
          									</div>
                                        	<div class="form-group">
            									<label>Replyer</label>
           										<input class="form-control" 
           											   id="replyer" name="replyer" value="replyer">
          									</div>
                                        	<div class="form-group">
            									<label>Reply Date</label>
           										<input class="form-control" 
           											   id="replyDate" name="replyDate" value="2019-12-02 11:22:33">
          									</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button id="modalModBtn" class="btn btn-warning">Modify</button>
                                            <button id="modalRemoveBtn" class="btn btn-danger">Remove</button>
                                            <button id="modalRegisterBtn" class="btn btn-primary">Register</button>
                                            <button id="modalCloseBtn" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
					<!--paging-start-->
                <div class="custom-gift-pagination custom-th-size2">
							<div class="custom-pagination">
								<nav aria-label="Page navigation example">
									<!--<ul class="blog-pagination">-->
									<ul class="blog-pagination text-center custom-th-size2">
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
								</nav>
							</div>
							</div>
							<!--paging-end-->
                <!--board-end-->
            </div>
        </div>
    </div>
</div>
</div>
<script>
$(document).ready(function (){
	
	//#addReplyBtn 누르면 모달창 뜨면서 댓글달 수 있게 함
	var modal = $(".modal");
	var modalInputgiftName = modal.find("input[name='giftName']");
/* 	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']"); */
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
/* 	var replyer = null;	//로그인한 아이디
	
	
		<sec:authorize access="isAuthenticated()">
			replyer = '<sec:authentication property="principal.username"/>';
		</sec:authorize> */
		
		var csrHeaderName = '${_csrf.headerName}';
		var csrTokenValue = '${_csrf.token}';
		
	$(".modalPop").on("click", function(e){
		modal.find("input=[name='giftName']").val(giftName);
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		modal.modal("show");
	});
	

	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrHeaderName, csrTokenValue);
	});
</script>

<%@include file="../include/footer.jsp" %>