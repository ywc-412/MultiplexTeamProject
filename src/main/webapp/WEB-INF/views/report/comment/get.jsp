<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../../include/header.jsp" %>



<!-- 제목 -->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title text-center yeong-movieTitle">
                    <h3>한줄평 신고 조회</h3>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
       <form role="form" action="/report/comment/register" method="post" id="frm">
          <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
          <div class="form-group">
            <label for="memberId"></label>
            <sec:authentication property="principal" var="pinfo"/>
                   <sec:authorize access="isAuthenticated()">
                      <input type="text" class="form-control" id="memberId" name="memberId" readonly="readonly" value="${pinfo.username }">
                   </sec:authorize>
         </div>
         <div class="form-group">
            <label for="commentContent"></label>
            <input type="text" class="form-control" id="commentContent" name="commentContent" readonly="readonly" value="${comment.commentContent }">
         </div>
         <div class="form-group">
             <label for="reportContent"></label>
             <textarea class="form-control" id="commentReportContent" name="commentReportContent" readonly="readonly" rows="10" placeholder="${commentReport.commentReportContent }"></textarea>
            <small id="content" class="yeong-small"></small>
         </div>
         
         <input type="hidden" id="commentNo" name="commentNo" value='<c:out value="${comment.commentNo }"/>'>
         <input type="hidden" id="movieNo" name="movieNo" value='<c:out value="${movie.movieNo }"/>'>
         <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
         <input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
                  <!--  검색 조건과 키워드 파라미터 추가 -->
           <input type="hidden" id="type" name="type" value='<c:out value="${cri.type }"/>'>
           <input type="hidden" id="keyword" name="keyword" value='<c:out value="${cri.keyword }"/>'>
           
           <div class="col-xl-12">
               <div class="section_title text-center">
                  <button type="button" id="reportBtn" class="btn btn-danger yeong-margin">삭제</button>
                  <button type="button" id="cancel" class="btn btn-secondary yeong-margin">취소</button>
             </div>
          </div>
      </form>
    </div>
    
    <hr class="clear">
    
    <script>
   $(function(){
      var formObj = $("form[role='form']");
      console.log(formObj);
       $('#reportBtn').on("click",function(e){   
           
         var result = confirm("삭제 하시겠습니까? ");
           
           if(result) {
              formObj.find("#reportContent").remove();
              formObj.find("#commentContent").remove();
              formObj.attr("method", "get")
              formObj.attr("action", "/report/comment/remove").submit();
           }else{
              return;
           }
          
       });
   
       $(document).on("click", "#cancel", function(e){

           var result = confirm(" 취소하시겠습니까? ");
           
           if(result) {
              formObj.find("#commentNo").remove();
              formObj.find("#reportContent").remove();
              formObj.find("#commentContent").remove();
              formObj.attr("method", "get")
              formObj.attr("action", "/report/comment/list").submit();
           }else{
              return;
           }
       });
      
   });
   
   </script>
   
   
   
   
<%@ include file="../../include/footer.jsp" %>