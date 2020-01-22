<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
${mygift }
${mygift[0].myGiftNo}
${mygift[0].memberId}
${mygift[0].giftList[0].giftName}

    <div class="container">
        <div class="custom-gift-divide-border">
         
        
            <h3 class="custom-font-bold"></h3> 
                  
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
		                    <p>구입일자 : <span>${mygift[0].buyingDate}</span></p>
		                    <p>만료일자 : <span>${mygift[0].expireDate}</span></p>
		                    
		                    
		                    <input type="hidden" name="myGiftNo" value="${mygift[0].myGiftNo}"/>
		                    <input type="hidden" value="${mygift[0].extendChk}"/>
		                    
		                    <input type='hidden' name="memberId" value="${mygift[0].memberId}"/>
		            		
		                    <input type="hidden" name="pageNum"  value="${cri.pageNum }"> 
							<input type="hidden" name="amount" value="${cri.amount}">
                       	</form>  
                       <button type="button" class="btn btn-primary custom-button-gift" id="extendBtn">기간연장</button> 
                       	
				

                </div>
            </div>
            <div class="custom-gift-divide-border"></div>
                <br>
                <button type="button" class="btn btn-primary float-left custom-button-gift">LIST</button>
                 <div class="pull-right">      
                <button type="button" class="btn btn-primary custom-button-gift">환불</button>
              </div>
            
       </div>
    </div>
</section>
<!--board-end-->
<script>
$(function(){
	console.log('${cri.pageNum }');
	
	var formObj = $("#extendForm");
	$('#extendBtn').on("click", function(e){
		e.preventDefault();
		console.log("clicked");
		formObj.submit();
	});
});

</script>
<%@include file="../include/footer.jsp" %>