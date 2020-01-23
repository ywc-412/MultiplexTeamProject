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
                    <h3>한줄평 신고 상세보기</h3>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
    	<form role="form" action="/report/comment/list" method="get" id="frm">
    		<div class="form-group">
				<label for="commentReportNo"></label>
				<input type="hidden" class="form-control" id="commentReportNo" name="commentReportNo" readonly="readonly" value="${commentReport.commentReportNo }">
			</div>
    		<div class="form-group">
				<label for="memberId"></label>
				<input type="text" class="form-control" id="memberId" name="memberId" readonly="readonly" value="dudwn">
			</div>
			<div class="form-group">
				<label for="commentContent"></label>
				<input type="text" class="form-control" id="commentContent" name="commentContent" readonly="readonly" value="${comment.commentContent }">
			</div>
			<div class="form-group">
			    <label for="reportContent"></label>
			    <textarea class="form-control" id="commentReportContent" name="commentReportContent" rows="10" placeholder="${commentReport.commentReportContent }" readonly="readonly"></textarea>
				<small id="content" class="yeong-small"></small>
			</div>
			
			<input type="hidden" id="commentNo" name="commentNo" value='<c:out value="${comment.commentNo }"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
	        
	        <div class="col-xl-12">
	            <div class="section_title text-center">
			   		<button data-oper="delete" type="button" id="reportBtn" class="btn btn-danger yeong-margin">삭제</button>
		   			<button data-oper="list" type="button" id="list" class='btn btn-secondary yeong-margin'>List</button>
		   			
	    		</div>
	    	</div>
		</form>
    </div>
    
    
    
    <hr class="clear">
	
	<script>
	$(function(){
		var frm = $("#frm");
	    
	    $("button[data-oper='delete']").on("click", function (e){
	    	frm.find("#commentReportNo").remove();
	    	frm.attr("action", "/report/comment/remove").submit();
	    });
	  	 
	    $("button[data-oper='list']").on("click", function (e){
	    	frm.find("#commentReportNo").remove();
	    	frm.find("#commentNo").remove();
	    	frm.attr("action", "/report/comment/list")
	    	frm.submit();
	    });
	    
	    
	    
	    
	});
	</script>
	
	
	
<%@ include file="../../include/footer.jsp" %>