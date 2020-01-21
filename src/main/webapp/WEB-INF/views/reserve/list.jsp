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
	                            	<c:if test="${r.status == 1 }">
	                            			<form id="reviewForm" action="/review/register">
	                            				<input type="text" name="movieNo" value="${r.movieNo }">
			                            		<button class="btn btn-primary">리뷰작성</button>
	                            			</form>
	                            	</c:if>
	                            	<c:if test="${r.status == 0 }">
	                            		<button class="btn btn-primary">취소</button>
	                            	</c:if>
	                            	<c:if test="${r.status == 2 }">
	                            		환불완료
	                            	</c:if>
	                            
	                            </td>
	                            
	                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="custom-gift-pagination custom-th-size2">
                    <div class="custom-pagination">
                        <nav aria-label="Page navigation example">
                            <ul class="blog-pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
	                                <li class="page-item"><a class="page-link" href="#">1</a></li>
	                                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                <li class="page-item"><a class="page-link" href="#">4</a></li>
	                                <li class="page-item"><a class="page-link" href="#">5</a></li>
	                                <li class="page-item"><a class="page-link" href="#">6</a></li>
	                                <li class="page-item"><a class="page-link" href="#">7</a></li>
	                                <li class="page-item"><a class="page-link" href="#">8</a></li>
	                                <li class="page-item"><a class="page-link" href="#">9</a></li>
	                                <li class="page-item"><a class="page-link" href="#">10</a></li>
	                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
               </div>
              </div>
             </div>
            </div>
			

<%@ include file="../include/footer.jsp"%>
