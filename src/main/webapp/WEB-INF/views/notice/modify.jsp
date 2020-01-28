<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board s -->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">공지사항 수정</h3>
                </div>
                <form method="post" action="/notice/modify" role="form" id="modifyForm">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="form-group">
						<label>번호</label> <input readonly class="form-control" name="noticeNo" value='<c:out value="${notice.noticeNo}"/>'>
				</div>             
                <div class="form-group">
                    <label>제목</label>
                    <input class="form-control" name="noticeTitle" value="${notice.noticeTitle}">
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea class="form-control" rows="6" name="noticeContent" id="custom-notice-content"><c:out value="${notice.noticeContent}"/></textarea>
                </div>
                <hr>
                	<input type="hidden"  name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="type" value="${ cri.type }" /> 
					<input type="hidden" name="keyword" value="${ cri.keyword }" />
                <div class="form-group text-center">
                
                    <button data-oper="modify" type="submit" class="btn btn-primary btn-sm">수정</button>
                    <button data-oper="cancel" type="button" class="btn btn-secondary btn-sm">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!--board e -->

<script>
 var formObj = $("form");
 var modifyForm = $("#modifyForm");
   $('button').on("click", function(e){
      e.preventDefault();
      var operation = $(this).data("oper");
      if(operation === 'cancel'){	//목록 버튼	    	
    		if(confirm("정말로 취소하시겠습니까?") == true) {     	
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
    		} else {
 	 		   		false;
 	 	   		}
      } else if(operation === 'modify') {
    	  if(!modifyForm.find("input[name='noticeTitle']").val() || !modifyForm.find("textarea[name='noticeContent']").val()) {
				alert("내용을 입력해주세요");
				return false;
			} 	    	  
    	  if(confirm("정말로 수정하시겠습니까?") == true) { 
			  formObj.attr("action", "/notice/modify");
			  formObj.submit();
	    	   } else {
	    		   false;
	    	   }
     	 }  		
   });
	   
</script>
	   
<%@include file="../include/footer.jsp" %>