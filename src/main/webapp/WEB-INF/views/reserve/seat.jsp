<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>

	<div class="hanna_head">
		<h3>RESERVE_SEAT</h3>
		<p> ${reserveTime.movieNo } / ${reserveTime.scheduleDate } / ${reserveTime.scheduleTime } / ${movieName } </p>
	</div>
	
	<!-- 예매 화면 -->
	<div class="hanna_container">
		<div class="section-top-border">
			<h3 class="mb-30">영화 예매</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="single-defination">
						<h4 class="mb-20">인원 선택</h4>
						<div class="">
							<h6 class="mb-10">성인</h6>
							<h6 class="mb-10" id="adultNum">0</h6>
								<button class="hanna_button3" id="adultPlus"><i class="fa fa-plus" aria-hidden="true"></i></button>
								<button class="hanna_button3" id="adultMinus"><i class="fa fa-minus" aria-hidden="true"></i></button>
								<br><br>
							<h6 class="mb-10">청소년</h6>
							<h6 class="mb-10" id="teenNum">0</h6>
								<button class="hanna_button3" id="teenPlus"><i class="fa fa-plus" aria-hidden="true"></i></button>
								<button class="hanna_button3" id="teenMinus"><i class="fa fa-minus" aria-hidden="true"></i></button>
								<br>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="single-defination">
						<h4 class="mb-20">좌석 선택</h4>
						<div style="padding-left:30px;"> ---- SCREEN ---- </div>
						<div class="hanna_seat">
							<input type="checkbox" id="a1">
							<label for="a1"></label>
							<input type="checkbox" id="a2">
							<label for="a2"></label>
							<input type="checkbox" id="a3">
							<label for="a3"></label>
							<input type="checkbox" id="a4">
							<label for="a4"></label>
							<input type="checkbox" id="a5">
							<label for="a5"></label>
						</div>
						<div class="hanna_seat">
							<input type="checkbox" id="b1" class="reserved_seat">
							<label for="b1"></label>
							<input type="checkbox" id="b2">
							<label for="b2" class="reserved_seat"></label>
							<input type="checkbox" id="b3" class="reserved_seat" disabled="disabled">
							<label for="b3"></label>
							<input type="checkbox" id="b4">
							<label for="b4"></label>
							<input type="checkbox" id="b5">
							<label for="b5"></label>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xl-12 text-right">
				<button type="submit" class="hanna_button2" onclick = "location.replace('#')">>결제하기</button>
			</div>
		</div>
	</div> <!-- END hanna_container -->
	
	<script>
		$(function(){
			
			$('#adultPlus').on("click", function() {
				if(Number($('#adultNum').html()) == 2){
					alert('최대 2명까지 선택 가능합니다.');
				} else {
					$('#adultNum').html(Number($('#adultNum').html()) + 1);
				}
			});
			
			$('#adultMinus').on("click", function() {
				if(Number($('#adultNum').html()) == 0){
					alert('0이하로는 선택하실 수 없습니다.');
				} else {
					$('#adultNum').html(Number($('#adultNum').html()) - 1);
				}
			});
			
			$('#teenPlus').on("click", function() {
				if(Number($('#teenNum').html()) == 2){
					alert('최대 2명까지 선택 가능합니다.');
				} else {
					$('#teenNum').html(Number($('#teenNum').html()) + 1);
				}
			});
			
			$('#teenMinus').on("click", function() {
				if(Number($('#teenNum').html()) == 0){
					alert('0이하로는 선택하실 수 없습니다.');
				} else {
					$('#teenNum').html(Number($('#teenNum').html()) - 1);
				}
			});
			
		});	
	</script>

<%@ include file="../include/footer.jsp" %>