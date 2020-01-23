<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="col-md-3">
	<div class="section-top-border">
		<div class="row">
			<div class="col-md-7 mt-sm-30">
				<h3 class="mb-20">마이페이지</h3>
				<div class="">
					<ul class="unordered-list">
						<li><a href="/member/myInfo" id="myInfoMove">내 정보 조회</a></li>
						<li><a href="/reserve/list?memberId=hue9404" id="myReserveMove">예매 내역</a></li>
						<li>내 리뷰</li>
						<li>내 한줄평</li>
						<li>내 기프티콘</li>
						<li>내 건의사항</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="loginUsername" />
</sec:authorize>
<script>
	$(function(){
		$('#myInfoMove').on("click", function(e){
			e.preventDefault();
			location.href="/member/myInfo?memberId=${loginUsername}";
		});
		
		$('#myReserveMove').on("click", function(e){
			e.preventDefault();
			location.href="/reserve/list?memberId=${loginUsername}";
		});
	});
</script>