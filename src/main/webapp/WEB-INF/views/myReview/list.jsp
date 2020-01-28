<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
   
   <!-- Start Align Area -->
   <div class="whole-wrap">
      <div class="container box_1170">
         <div class="section-top-border">
            <div class="row">
               <jsp:include page="../include/myPageMenu.jsp"/>
               <div class="mytable_position">
                  <table class="table table-striped table-bordered table-hover">
         <thead>
            <tr>
               <th>영화제목<!-- Rendering engine --></th>
               <th>리뷰제목<!-- Browser --></th>
               <th>등록일<!-- Platform(s) --></th>
            </tr>
         </thead>
         <tbody>
         <c:forEach items="${list }" var="rvo">
            <tr class="odd gradeX">
               <td><c:out value="${rvo.movieNo }"/></td>
               <td><a class="move" href="${rvo.reviewNo}">
                                  ${rvo.reviewTitle }</a></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd"
                     value="${rvo.reviewDate }"/></td>
            </tr>
            <input type="hidden" value="${rvo.memberId }">
         </c:forEach>
         </tbody>
      </table>
      </div>
               </div>
               </div>
               </div> 
               
<!--       페이징 시작하는 부분 -->
               <div class="pull-right">
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
                <!-- END 페이지 번호 출력 -->
			    <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
			                <form id="actionForm" action="/myReview/list" method="get">
			                    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
			                   <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			                   <sec:authorize access="isAuthenticated()">
									<input type="hidden" name="memberId" id="memberId"
										value="<sec:authentication property="principal.username"/>">
								</sec:authorize>
			                   <!-- 검색 조건과 키워드 파라미터 추가 -->
			             </form>   
			   <!-- End Align Area -->
      
<%@ include file="../include/footer.jsp"%>
   <script>
   $(function(){
       //페이지 번호 링트 처리
         $(".paginate_button a").on("click", function(e) {
                e.preventDefault(); //a태그라서 동작안되게 막아줌
                $('#pageNum').val($(this).attr('href'));   //내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
                $('#actionForm').submit();
           });
        
        //게시물 조회 링크처리
         $(".move").on("click", function(e) {
              e.preventDefault();
              $("#actionForm").append("<input type='hidden' name='reviewNo' value='"+ $(this).attr("href")+"'>");
              $("#actionForm").attr("action", "/review/get");
              $("#actionForm").submit();
        });
   });

   </script>



