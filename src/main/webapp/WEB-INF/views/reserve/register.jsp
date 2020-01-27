<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>

<div class="hanna_head">
		<h3>RESERVE_TIME</h3>
	</div>
	
	<!-- 예매 화면 -->
	<div class="hanna_container">
		<div class="section-top-border">
			<h3 class="mb-30">영화 예매</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="single-defination">
						<h4 class="mb-20">영화 선택</h4>
						<div class="">
							<ul class="hanna_ul_list">
								<c:forEach items="${movieList }" var="m">
									<li id="movieClick" value="${m.movieNo }">
										${m.movieTitle }
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-defination">
						<h4 class="mb-20">날짜 선택</h4>
						<div class="">
							<ul class="hanna_ul_list" id="date">
<!-- 								<li>1월 1일</li> -->
<!-- 								<li>1월 2일</li> -->
<!-- 								<li>1월 3일</li> -->
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-defination">
						<h4 class="mb-20">시간 선택</h4>
						<div class="">
							<ul class="hanna_ul_list" id="time">
<!-- 								<li>10:00</li> -->
<!-- 								<li>12:00</li> -->
<!-- 								<li>14:00</li> -->
<!-- 								<li>16:00</li> -->
<!-- 								<li>18:00</li> -->
<!-- 								<li>20:00</li> -->
							</ul>
						</div>
					</div>
				</div>
<!-- 				<div class="col-md-2"> -->
<!-- 					<div class="single-defination"> -->
<!-- 						<h4 class="mb-20">나의 선택</h4> -->
<!-- 						<div class=""> -->
<!-- 							<ul class="hanna_ul_list"> -->
<!-- 								<li>영화 : </li> -->
<!-- 								<li>날짜 : </li> -->
<!-- 								<li>시간 : </li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
		
		<div class="row">
			<div class="col-xl-12 text-right">
				<form id="timeForm" action="/reserve/seat" method="post">
					<input type="hidden" name="movieNo" >
					<input type="hidden" name="movieTitle" >
					<input type="hidden" name="scheduleDate" >
					<input type="hidden" name="scheduleTime" >
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
					<button id="goSeatBtn" class="hanna_button2">>좌석선택</button>
				</form>
			</div>
		</div>
	</div> <!-- END hanna_container -->
	
	<script>
	
	
	$(document).ready(function(){
		
		
		$(document).on("click", "#goSeatBtn", function(e){
			
			var regResult = false;

			var movieNo = $('input[name=movieNo]').val();
			var scheduleDate = $('input[name=scheduleDate]').val();
			var scheduleTime = $('input[name=scheduleTime]').val();
			
			if(!regResult){
				e.preventDefault();
			}
			
			if(!movieNo){
				alert('영화를 선택 후 클릭해주세요.');
			} else if(!scheduleDate){
				alert('날짜를 선택 후 클릭해주세요.');
			} else if(!scheduleTime){
				alert('시간을 선택 후 클릭해주세요.');
			} else {
				regResult = true;
			}
			
			if(regResult){
				$('#timeForm').submit();
			}

		}); // goSeatBtn (좌석선택) 버튼 클릭 시
		
		$(document).on("click", "#movieClick", function(e){
			// 영화 버튼 클릭 시 ajax로 상영 날짜 받아오기
			var movieNo = $(this).val();
			$("input[name=movieNo]").val(movieNo);
			$("input[name=movieTitle]").val($(this).html());
			var str ="";
			if(movieNo != null){
				$.getJSON("/reserve/getDay/"+movieNo+".json",
						function(data){
							for(date of data){
								var year = date.substring(0, 4);
								var month = date.substring(4, 6);
								var day = date.substring(6, 8);
								str+= "<li id='dayClick' value1='"+movieNo+"' value2='"+date+"'>"+month+"/"+day+"</li>";
							}
							$("#date").html(str); // 상영 날짜 list 출력
							$("#time").html(""); // 영화를 새로 선택하면 상영 시간 지워줌
							$("input[name=scheduleDate]").val(""); // 영화 새로 선택하면 상영날짜 값 지워줌
							$("input[name=scheduleTime]").val(""); // .. 시간 지워줌
						}).fail(function(xhr, status, error){
							if(error){
								error();
							}
				}); // END getJSON
			}
		}); // END movieClick
		
		$(document).on("click", "#dayClick", function(e){
			// 영화 날짜 선택 시 ajax로 상영 시간 받아오기
			var movieNo = $(this).attr("value1");
			var scheduleDate = $(this).attr("value2");
			$("input[name=scheduleDate]").val(scheduleDate);
			var str = "";
			if(scheduleDate != null){
				$.getJSON("/reserve/getTime/"+movieNo+"/"+scheduleDate+".json",
						function(data){
							for(d of data){
								str+= "<li id='timeClick' value1='"+movieNo + "' value2='"+scheduleDate+"'>"+d+"</li>";
								// value1 : 영화번호 / value2 : 상영날짜
							}
							$("#time").html(str); // 상영 시간 list 출력
							$("input[name=scheduleTime]").val(""); // .. 시간 지워줌
				}).fail(function(xhr, status, error){
					if(error){
						error();
					}
				}); // END getJSON
			}
		}); // END dayClick
		
		$(document).on("click", "#timeClick", function(e){
			var scheduleTime = $(this).html();
			$("input[name=scheduleTime]").val(scheduleTime);
// 			alert("영화 : " + $("input[name=movieTitle]").val() + "\n상영 날짜 : " + $("input[name=scheduleDate]").val() + "\n상영 시간 : " + $("input[name=scheduleTime]").val() + "을 선택하셨습니다.");
		}); // END timeClick
		
	})

	</script>

<%@ include file="../include/footer.jsp" %>
	