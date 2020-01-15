<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="custom-container">
		<div class="row custom-mobile">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">기프티콘</h3>
				</div>
				<a href="/mtms/giftReg.html" class="btn btn-primary btn-sm">등록</a>
				<!--search-start-->
				<div class="pull-right">
					<input type="text" placeholder="검색어를 입력하세요"
						class="input-group-btn ">
					<button type="submit" class="btn btn-primary btn-sm">검색</button>
				</div>
				<!--search-end-->
				<!--first-line-s-->
				<div class="container">
					<div class="custom-gift-divide-border">
						<h4 class="custom-divide">팝콘</h4>
					</div>
					<div class="row">
						<!-- data-start -->
						<div class="col-md-3 col-sm-6">
							<div class="product-grid9">
								<div class="product-image9">
									<!-- 아마도 사진 start -->
									<div class="row">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-body">

													<!-- 업로드 결과 출력 -->
													<div class="uploadResult">
														<ul>

														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class='bigPictureWrapper'>
										<div class="bigPicture"></div>
									</div>
								</div>
								<!-- 아마도 사진 end -->
								<div class="product-content">
									<c:forEach items="${list}" var="gift">
										<h3 class="title">
											<c:out value="${gift.giftNo}" />
										</h3>
										<div class="price">
											<c:out value="${gift.giftPrice}" />
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- data-end -->
					</div>
				</div>
				<!--first-line-e-->

			</div>
		</div>
	</div>
</section>
<!--board-end-->
<script>
function showImage(filePath) {
	alert(filePath);		
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture").html("<img src='/display?fileName="+filePath+"'>").animate({width: '100%', height: '100%'}, 1000);	
	$(".bigPictureWrapper").click(function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		}, 1000);
	});
}
</script>
<%@include file="../include/footer.jsp"%>