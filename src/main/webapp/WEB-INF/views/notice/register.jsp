<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">공지사항 등록</h3>
                </div>               
                <form id="registerForm" role="form" action="/notice/register" method="post">
                <div class="form-group">
                    <label>제목</label>
                    <input class="form-control" name="noticeTitle">
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea class="form-control" rows="3" name="noticeContent" id="custom-notice-content"></textarea>
                </div>
                <hr>
                <div class="form-group text-center">    
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">           
                    <button type="submit"  id="register" class="btn btn-primary btn-sm">등록</button>
                    <button type="button"  id="cancel" class="btn btn-secondary btn-sm">취소</button>                                     
                </div>
                </form>              
            </div>
        </div>
    </div>
</section>
<!--board-end-->

<script>
var formObj = $("form[role='form']");
var registerForm = $("#registerForm");
	$(function(e){				
		$("button[type='submit']").click(function(){
			if (!registerForm.find("input[name='noticeTitle']").val() || !registerForm.find("textarea[name='noticeContent']").val()) {
				alert("내용을 입력해주세요");
				return false;
			} 
			 if(confirm("정말로 등록하시겠습니까?") == true) { 
				 registerForm.submit();
			 } else {
	    		   return false;
	    	   }		
		});
	});
	
	$("#cancel").click(function(){
		if(confirm("정말로 취소하시겠습니까?") == true) { 
			self.location = "/notice/list";
		}else {
 		   false;
 	   }
	});
	
</script>

<%@include file="../include/footer.jsp" %>