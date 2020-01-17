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
									<li id="movieClick" value="${m.movieVO.movieNo }">${m.movieVO.movieTitle }</li>
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
			</div>
		</div>
		
		<div class="row">
			<div class="col-xl-12 text-right">
				<button type="submit" class="hanna_button2" onclick = "location.replace('reserve_seat.html')">>좌석선택</button>
			</div>
		</div>
	</div> <!-- END hanna_container -->
	
	<script>
	
	
	
	$(document).ready(function(){
		$(document).on("click", "#movieClick", function(e){
			// 영화 버튼 클릭 시 ajax로 상영 날짜 받아오기
// 			alert($(this).val());
			var movieNo = $(this).val();
			var str ="";
			if(movieNo != null){
				$.getJSON("/reserve/getDay/"+movieNo+".json",
						function(data){
							for(d of data){
								str+= "<li id='dayClick' value='"+movieNo+"'>"+d+"</li>";
							}
// 							alert(str);
							$("#date").html(str);
						}).fail(function(xhr, status, error){
							if(error){
								error();
							}
				}); // END getJSON
			}
		}); // END movieClick
		
		$(document).on("click", "#dayClick", function(e){
			// 영화 날짜 선택 시 ajax로 상영 시간 받아오기
// 			alert($(this).val());
// 			alert($(this).html());
			var movieNo = $(this).val();
			var scheduleDate = $(this).html();
			var str = "";
			if(scheduleDate != null){
				$.getJSON("/reserve/getTime/"+movieNo+"/"+scheduleDate+".json",
						function(data){
							for(d of data){
								str+= "<li id='timeClick' value='"+movieNo+"'>"+d+"</li>";
								// 날짜도 넣어야하는디
							}
// 							alert(str);
							$("#time").html(str);
				}).fail(function(xhr, status, error){
					if(error){
						error();
					}
				}); // END getJSON
			}
		}); // END dayClick
		
		$(document).on("click", "#timeClick", function(e){
			alert($(this).val());
		}); // END timeClick
		
	})
	
	
	
	
	$(function() {

// 			var movieName = $("#movieName").val();
// 			var str="";
// 			if(movieName != null){
// 				$.getJSON("/movie/getName/"+movieName+".json",
// 					function(data){ // 결과값 받기
// 						for(mvo of data){
// 							str += "<li class='hanna_li'>";
// 							str += "<a href=\"javascript:movieChoice(\'"+ mvo.movieTitle +"', '" + mvo.movieNo +"\')\">";
// 							str += mvo.movieTitle + "</a></li>";
// 						}
// 						$(".hanna_ul_list").html(str);
// 					}).fail(function(xhr, status, error){
// 						if(error){
// 							error();
// 						}
// 					});
// 			}
	
	});
	</script>

<%@ include file="../include/footer.jsp" %>
	