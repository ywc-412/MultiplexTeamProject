<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰</div>
	</div>
	<div class="title_under"></div>
	<div class="get_title_style">
		<div class="get_title">	<c:out value="${rvo.reviewTitle }"/></div>
	
		<div class = "title_under_div">
			<span class="title_under_ex2">작성일:<fmt:formatDate pattern="yyyy-MM-dd"
							value="${rvo.reviewDate }"/></span> 
			<span class="title_under_ex2">작성자:<c:out value="${rvo.memberId }"/></span> 
			<span class="title_under_ex2">조회수:<c:out value="${rvo.reviewView }"/></span>
		</div>
	</div>
	<div class="movie_title_style">
		<div class="movie_get_title">영화제목</div>
	</div>
	<textarea rows="10" cols="100" class="review_textarea">
	<c:out value="${rvo.reviewContent }"/>
	</textarea>
	
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 
	 <button data-oper="list" class="btn btn-info">List</button>
	 <div class="button_position">
	 		<button type="submit" class="btn btn-default" data-oper ="modify">수정</button>
				
				<form method="post" action="/review/remove">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
				<button id="reviewRemove" class="btn btn-danger" type="submit">
				삭제</button>
				</form>
				<form method="get" action="/report/review/register">
				<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
				<input type="hidden" name="reviewTitle" value='<c:out value="${rvo.reviewTitle }"/>'>
				<input type="hidden" name="memberId" value="로옹로옹">
			<button id="reviewReport" class="btn btn-danger" type="submit">신고</button>
			</form>
			
		</div>
		
	 </div>
<!-- 	END 버튼위치 style -->

		<form id='operForm' action="/review/modify" method="get">
					<input type="hidden" id="reviewNo" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
					<input type="hidden" id="reviewTitle" name="reviewTitle" value='<c:out value="${rvo.reviewTitle }"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		</form>
		
<!-- 	 리뷰댓글란 -->
	 <input type="text" name="reply" id="replyInput">
<!-- 	  <button id="reviewReply" class="btn btn-primary">등록</button> -->
	   <button id='modalRegisterBtn' type="button" class="btn btn-primary">
	   Register</button>
<!-- 	 END리뷰댓글란 -->

<!-- 리뷰 댓글 목록 -->
	            <div class='row'>
	               <div class="col-lg-12">
	                  <!--  /.panel -->
	                  <div class="panel panel-default">
	                     <div class="panel-heading">
	                        <i class="fa fa-comments fa-fw"></i> Reply
	                        <!-- 댓글 달기 버튼 생성 -->
<%-- 	                        <sec:authorize access="isAuthenticated()"> --%>
	                        	<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">new Reply</button>
<%-- 	                        </sec:authorize> --%>
	                     </div>
	                     <!-- /.panel-heading -->
	                     <div class="panel-body">
	                        <ul class="chat">
	                           <!-- start reply -->
	                           <li class="left clearfix" data-rno='12'>
	                              <div>
	                                 <div class="header">
	                                    <strong class="primary-font"></strong>
	                                    <small class="pull-right text-muted"></small>
	                                 </div>
	                                 <p></p>
	                              </div>
	                           </li> <!-- END Reply -->
	                        </ul> <!-- ./END ul -->                     
	                     </div> <!-- /.panel .chat-panel -->
	                     <!-- 댓글 목록 페이징 -->
	                     <div class="panel-footer">
	                     </div>
	                     <!-- 댓글 목록 페이징 END -->
	                     
<!-- 리뷰 댓글 목록END -->
<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&tiems;</button>
							  <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				         </div> <!-- /.modal-header END -->
				         <div class="modal-body">
				            <div class="form-group">
				               <label>Reply</label>
				               <input class="form-control" name='reply' value='New Reply!!!!'>
				            </div> <!-- /.form-group END -->
				            <div class="form-group">
				               <label>Replyer</label>
				               <input class="form-control" name='replyer' value='Replyer' readonly="readonly">
				               
				            </div> <!-- /.form-group END -->
				            <div class="form-group">
				               <label>Reply Date</label>
				               <input class="form-control" name='replyDate' value='2019'>
				            </div> <!-- /.form-group END -->
				         </div> <!-- /.modal-body END -->
				         <div class="modal-footer">
				            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				            <button id="reviewReport" class="btn btn-danger" type="submit">댓글신고</button>
				            <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				            <!-- data-dismiss="modal" 창닫기 -->
				         </div> <!-- /.modal-footer END -->
				      </div> <!-- /.modal-content END -->
				   </div>   <!-- /.modal-dialog END -->
				</div> <!-- /.modal END -->






</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script>
$(function(){
	var reviewNo = '<c:out value="${rvo.reviewNo}"/>';
	var replyUL = $(".chat");
	var replyNo = #(revo.reply);=='
	
	
	
	
	

    var operForm = $("#operForm");
    
    $("button[data-oper='modify']").on("click", function (e){
    	operForm.attr("action", "/review/modify").submit();
    });
  	 
    $("button[data-oper='list']").on("click", function (e){
    	operForm.find("#reviewNo").remove();
    	operForm.attr("action", "/review/list")
    	operForm.submit();
    });
});

</script>
