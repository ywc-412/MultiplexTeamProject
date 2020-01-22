<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="custom-container" >
		<div class="row custom-mobile" >
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">기프티콘</h3>
				</div>
				<a id="regGift" class="btn btn-primary btn-sm">등록</a>
				
				<!--first-line-s-->
				<div class="container" >
					<div class="custom-gift-divide-border">
						<h4 class="custom-divide">food</h4>
					</div>
					<div class="row-gift" >

						<!-- data-start -->
					
					
							<!-- <div class="col-md-3 col-sm-6" style="float: right;"> -->
							<div class="custom-col-md-3">
								
								<div class="custom-gift-items">	
								
								<div class="gift_area" id="giftArea">
									<c:forEach items="${list}" var="gift">	
								 <div class="single_gift uploadDiv" id="${gift.giftNo}" >
									<div class="uploadResult"> 
										<ul>
											<!-- 사진 -->
										</ul>
									</div>
										<a href="/gift/get?giftNo=${gift.giftNo}">
										 <span><c:out value="${gift.giftName}"/></span><br>																																	 
										 <span><c:out value="${gift.giftPrice}"/>원</span>
										</a> 
										</div>
									</c:forEach> 
									</div>
									</div>
							</div>
						</div>
						
						<!-- data-end -->

					</div>
					<!--first-line-e-->


				
			</div>
		</div>
		</div>
</section>
<!--board-end-->

<script>
//즉시 실행함수 - 첨부파일 목록 가져오기
	(function(){
		$("#giftArea").find(".single_gift").each(function(){	
			var $this = $(this);		
		
			var li = ""; 
			
			$.get("/gift/getAttachList",{giftNo : $(this).attr("id")}, function(data) {
			 console.log(data);				
				var filePath = data[0].giftUploadPath+ "\\" + data[0].giftUuid + "_" + data[0].giftFileName;
			 
				filePath = filePath.replace(new RegExp(/\\/g), "/");
				console.log(filePath);
				li += "<img class='giftImg' src='/giftUpload/display?giftFileName="+filePath+"'>"						  		
					  		$this.find(".uploadResult").find("ul").append(li);
				
				console.log(li);
			});//END JSON	
		});
		})(); 

$('#regGift').click(function() {
	self.location = "/gift/register";
});
</script>
<%@include file="../include/footer.jsp"%>