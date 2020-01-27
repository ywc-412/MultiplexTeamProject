<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰댓글/한줄평신고 상세보기</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->
	<div class="high_margin"></div>
	<div class="reply_title_style">
		<input type="hidden" name="reviewReportNo">
		<div class="reply_report_get_title">${rrvo.reviewTitle }</div>
	</div>
	<div class="reply_title_style2">
		<div class="reply_report_get_title">${rrvo.memberId }</div>
	</div>
	<div class="high_margin"></div>
	<input type="text" id="content_register" readonly="readonly" value="${rrvo.reviewReportContent }" name="reviewReportContent">

	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button id="reviewList" class="btn btn-primary">닫기</button>
	 <span class="button_position">
	 <button id="reviewRemove" class="btn btn-danger">삭제</button>
	</span>
	 </div>
<!-- 	END 버튼위치 style -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	삭제 하시겠습니까?
      </div>
      <div class="modal-footer">
      <form action="/report/review/remove" method="post">
      	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
      	<input type="hidden" name="reviewNo" value="${rrvo.reviewNo }">
        <button type="submit" class="btn btn-primary">확인</button>
      </form>  
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	 </div>
    </div>
  </div>
</div>
<!-- END modal -->

</div>
<!-- 전체마진 END -->
<%@ include file="../../include/footer.jsp"%>
<script>
$(function(){
	var modal = $(".modal"); //모달창 찾아옴
	$("#reviewRemove").on("click",function(e){
		e.preventdefault
		modal.modal('show');
	})
});
</script>