<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">


    <div class="container">
        <div class="custom-gift-divide-border">
         
        
            <h3 class="custom-font-bold">${mygift[0].giftList[0].giftName}</h3> 
                  
        </div>
        
        <div class="section-top-border">
            <div class="row">
                <div class="col-md-3">
                    <!-- <img src="/mtms/img/popcorn.jpg" alt="" class="img-fluid"> -->
                </div>
                <div class="col-md-9 mt-sm-20">            
                    <p>금액 : ${mygift[0].giftList[0].giftPrice}</p>
                    <p>구성 : ${mygift[0].giftList[0].giftSet}</p>
                       <form action="/myGift/extend" method="POST" id="extendForm">
		                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                    <p>구입일자 : <span><fmt:formatDate value="${mygift[0].buyingDate}" pattern="yyyy.MM.dd"/></span></p>
		                    <p><span class="expireNotice">만료일자 :</span><fmt:formatDate value="${mygift[0].expireDate}" pattern="yyyy.MM.dd"/></p>                    
		                    <input type="hidden" name="myGiftNo" value="${mygift[0].myGiftNo}"/>
		                    <input type="hidden" value="${mygift[0].extendChk}"/>	                    
		                    <input type='hidden' name="memberId" value="${mygift[0].memberId}"/>	            		
		                    <input type="hidden" name="pageNum"  value="${cri.pageNum }"> 
							<input type="hidden" name="amount" value="${cri.amount}">
                       	</form>  
                       	
                       	<form action="/myGift/refund" method="POST" id="refundForm">
                       		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                       		<input type="hidden" name="myGiftNo" value="${mygift[0].myGiftNo}"/>
                       		<input type="hidden" value="${mygift[0].status}"/>	                    
                       		<input type="hidden" value="${mygift[0].extendChk}"/>	                    
		                    <input type='hidden' name="memberId" value="${mygift[0].memberId}"/>	            		
		                    <input type="hidden" name="pageNum"  value="${cri.pageNum }"> 
							<input type="hidden" name="amount" value="${cri.amount}">
                       	</form>  
                </div>
            </div>
			<div class="custom-gift-divide-border"></div>
			<br>
			<form id="listForm" action="/myGift/list" method="get">
			<input type="hidden" name="pageNum" id="pageNum" value="${cri.pageNum}"> 
			<input type="hidden" name="amount" value="${cri.amount}">
			</form>
			<button type="button" class="btn btn-primary float-left custom-button-gift"  id="listBtn">LIST</button>
			<div class="pull-right">
				<button type="button" class="btn btn-primary custom-button-gift" id="extendBtn">기간연장</button>
				<button type="button" class="btn btn-primary custom-button-gift" id="refundBtn">환불</button>
			</div>

		</div>
    </div>
</section>
<!--board-end-->
<script>

	$(function() {
		var extendForm = $("#extendForm");
		var refundForm = $("#refundForm");
		var listForm = $("#listForm");

		$('#extendBtn').on("click", function(e) {
			e.preventDefault();
			console.log("clicked");
			extendForm.submit();
		});
		
		$('#refundBtn').on("click", function(e) {
			e.preventDefault();
			console.log("clicked");
			refundForm.submit();
		});
		
		$('#listBtn').on("click", function(e) {
			e.preventDefault();
			console.log("clicked");
			listForm.submit();
		});
		
		
		
	});
	
	$(function() {
		if('${mygift[0].expireDate}' == '') {
			$('#extendBtn').hide();
			$('#refundBtn').hide();
			$('#expireNotice').hide();
		} 
	})();
	
</script>
<%@include file="../include/footer.jsp" %>