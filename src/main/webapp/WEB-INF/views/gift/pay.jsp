<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board s -->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="custom-gift-divide-border">
            <h3 class="custom-pay-font-bold">결제완료</h3>
        </div>
        <div class="section-top-border">
            <div class="row">
                <div class="col-md-3">
                    <div class="gift_area" id="giftArea">
                    <div class="single_gift uploadDiv" id="${gift.giftNo}" >               
						<div class="uploadResult"> 
							<ul>							
								<!-- 사진 -->
							</ul>
						</div>
               	 	</div>
               	 	</div>
                </div>
                <div class="col-md-9 mt-sm-20">               		
                    <p>품목 : <c:out value="${gift.giftNo}" /></p>
                    <p>품목 : <c:out value="${gift.giftName}" /></p>
                    <p>금액 : <c:out value="${gift.giftPrice}" /></p>
                    <p>구성 : <c:out value="${gift.giftSet}" /></p>                
                </div>                
            </div>
            <div class="custom-gift-divide-border"></div>
        </div>
    </div>
</section>
<!--board e -->

<script>
//즉시 실행함수 - 첨부파일 목록 가져오기
(function(){
	$("#giftArea").find(".single_gift").each(function(){	
		var $this = $(this);			
		var li = ""; 	
		
		$.get("/gift/getAttachList",{giftNo : $(this).attr("id")}, function(data) {					
			var filePath = data[0].giftUploadPath+ "\\" + data[0].giftUuid + "_" + data[0].giftFileName;	 
			filePath = filePath.replace(new RegExp(/\\/g), "/");
			console.log(filePath);
			li += "<img class='giftImg' src='/giftUpload/display?giftFileName="+filePath+"'>"						  		
				  		$this.find(".uploadResult").find("ul").append(li);
		});//END JSON	
	});
	})();
</script>
<%@include file="../include/footer.jsp" %>