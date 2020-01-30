<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp"%>

<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row">
			
			<!-- 마이페이지 인클루드....start -- row 밑에서 include-->
				<%@ include file="../include/myPageMenu.jsp"%>
			<!-- 마이페이지 인클루드....end -->
			
			<!-- 내 예매 내역 -->
				<div class="hanna_container" style="width : 100%; padding : 0px; margin : 0px;">
                    <table class="table" style="width : 100%;">
                        <thead>
                        <tr>
                            <th style="width : 20%;">영화명</th>
                            <th style="width : 30%;">예매번호</th>
                            <th style="width : 20%;">관람일시</th>
                            <th style="width : 15%;">관람좌석</th>
                            <th style="width : 20%;"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${reserveList}" var="r">
	                        <tr>
	                            <td>${r.movieTitle }</td>
	                            <td>${r.reserveNo }</td>
	                            <td><c:set var="sdate" value="${r.scheduleDate }"/>${fn:substring(sdate,4,6) }.${fn:substring(sdate,6,8) } / ${r.scheduleTime } </td>
	                            <td>${r.seat }</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${r.status == 0 }">
	                            			<form id="reserveCanForm" ae="${_csrf.parameterName }" value="${_csrf.token }">
	                            				<input type="hidden" name="reserveNo" value="${r.reserveNo }">
	                            				<sec:authorize access="isAuthenticated()">
													<input type="hidden" name="memberId"
														value="<sec:authentication property="principal.username"/>">
												</sec:authorize>
	                            				<button class="btn btn-primary" id="reserveCanBtn">예매취소</button>
	                            			</form>
	                            		</c:when>
	                            		<c:when test="${r.status == 1 }">
	                            			<form id="reviewForm" action="/review/register">
	                            				<input type="hidden" name="movieNo" value="${r.movieNo }">
			                            		<button class="btn btn-primary">리뷰작성</button>
	                            			</form>
										</c:when>
	                            		<c:when test="${r.status == 2 }">취소완료</c:when>
	                            		<c:when test="${r.status == 3 }">취소불가</c:when>
	                            	</c:choose>
	                            </td>
	                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    
                     <div class="custom-gift-pagination custom-th-size2">
                    
	                    <div class="pagination justify-content-center">
					       <ul class="pagination">
					             <c:if test="${pageMaker.prev }">
					                <li class="paginate_button previous">
					                   <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
					          </c:if>
					          <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					                <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
					                  <a class="page-link" href="${num}">${num }</a></li>
					          </c:forEach>
					          <c:if test="${pageMaker.next }">
					                <li class="paginate_button next">
					                   <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
					          </c:if>
					       </ul>
					    </div>
					    <!-- 실제 클릭하면 동작하는 부분 처리 -->
					    <form id="actionForm" action="/reserve/list" method="get">
					    	<sec:authorize access="isAuthenticated()">
								<input type="hidden" name="memberId" id="memberId"
									value="<sec:authentication property="principal.username"/>">
							</sec:authorize>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
					         <input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum }">
					         <input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount }">
					    </form>
                </div>
                </div>
               
               </div>
              </div>
             </div>
            </div>
            
            <script>
	            $(function() {
					$("#reserveCanBtn").on("click", function(){
						if(confirm("정말 환불하시겠습니까?")){
							$("#reserveCanForm").action("/reserve/refund");
							$("#reserveCanForm").submit();
						}
					});
	            });
	            
	          //페이지 번호 링크 처리
	          $(document).on("click", ".paginate_button a", function(e){
	               e.preventDefault();
	               $('#pageNum').val($(this).attr('href'));   //내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
	               $('#actionForm').submit();
	            });
					
			</script>

<%@ include file="../include/footer.jsp"%>
