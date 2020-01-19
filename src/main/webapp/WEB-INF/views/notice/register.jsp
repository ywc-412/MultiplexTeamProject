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
                    <textarea class="form-control" rows="3" name="noticeContent"></textarea>
                </div>
                <hr>
                <div class="form-group text-center">               
                    <button type="submit"  id="register" class="btn btn-primary btn-sm">등록</button>
                    <button class="btn btn-secondary btn-sm">취소</button>   
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">                 
                </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!--board-end-->

<script>
	$(function(e){
		var formObj = $("form[role='form']");
		var registerForm = $("#registerForm");
		
		$("button[type='submit']").click(function(){
			if (!registerForm.find("input[name='noticeTitle']").val() || !registerForm.find("textarea[name='noticeContent']").val()) {
				alert("내용을 입력해주세요");
				return false;
			} else {
			e.preventDefault();
			console.log('submit clicked');
			formObj.submit();
			}
		});
	});

	
</script>

<%@include file="../include/footer.jsp" %>