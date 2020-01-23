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
					<jsp:useBean id="toDay" class="java.util.Date" />
					<fmt:formatDate value='${toDay}' pattern='yyyyMMdd' var="nowDate"/>


						
						<c:forEach items="${mygift}" var="mygift" varStatus="status">
							<tbody>
								<tr>
									
										 
										
									<td><a class="move" href="${mygift.myGiftNo}">${mygift.giftList[0].giftName}</a></td>									
									<td>${mygift.giftList[0].giftPrice}</td>
									
									
									
									<td class=""><c:set var="status" value="${mygift.status}" />
										<c:choose>
											<c:when test="${status eq 0}">사용가능</c:when>		
					    					<c:when test="${status eq 1}">기간만료</c:when>
					    					<c:when test="${status eq 2}">환불완료</c:when>
	      									<c:otherwise></c:otherwise>							
    									</c:choose></td>
									<td><fmt:formatDate value="${mygift.expireDate}" pattern="yyyy.MM.dd"/></td>
									<td><c:set var="extendChk" value="${mygift.extendChk}"/>
										<c:choose>
											<c:when test="${extendChk eq 0}">가능</c:when>	      									     									
											<c:when test="${extendChk eq 1}">불가능</c:when>	      									     									
	      									<c:otherwise></c:otherwise>							
    									</c:choose></td>	
    																							
								</tr>
							</tbody>
						</c:forEach>
						
					</table>

					<!--paging-start-->               
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
						
							<!--paging-end-->
								<form id="actionForm" action="/myGift/list" method="get">
									<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}"> 
									<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								</form>
                <!--board-end-->
            </div>
        </div>
    </div>
</div>
</div>
<script>

$(function() {  
$('.move').click(
		function(e) {
			e.preventDefault();
			//actionForm에 hidden으로 name 속성 추가 값은 noticeNo 지정, value 속성 추가 값은 ~~ 지정한 후 append
			$('#actionForm').append(
					"<input type='hidden' name='myGiftNo' value='"
							+ $(this).attr("href") + "'>");
			$('#actionForm').attr("action", "/myGift/get");

			$('#actionForm').submit();
		});
});

$('.page-item a').click(function(e) {
	e.preventDefault();
	$('#pageNum').val($(this).attr('href'));
	$('#actionForm').submit();

});



</script>

<%@include file="../include/footer.jsp" %>