<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>

	<div class="hanna_head" style="background:pink;">
		<h3 style="color : white;">예매가 완료되었습니다!</h3>
	</div>
	<br><br>
	<div class="hanna_container">
		<div class="reserve_success_pic">
			<img class="custom_moveImg" src="/resources/img/instragram/winter.jpg" alt="">			
		</div>
		<div class="reserve_success_info">
			<h3> ${schedule.movieVO.movieTitle } </h3>
			<hr>
			
			<style>
				h4 {
					float : left;
				}
			</style>

			<h4>관람일시 : &nbsp</h4> <h5>
				<c:set var="sdate" value="${schedule.scheduleDate}"/>
				${fn:substring(sdate,0,4) }.${fn:substring(sdate,4,6) }.${fn:substring(sdate,6,8) }
					/ ${schedule.scheduleTime }</h5> <br>
			<h4>결제금액 : &nbsp</h4> <h5>${reserve.adultNum *10000 + reserve.teenNum *9000}</h5> <br>
			<h4>예매번호 : &nbsp</h4> <h5>${reserve.reserveNo }</h5> <br>
			<h4>관람인원 : &nbsp</h4> <h5>${reserve.adultNum + reserve.teenNum } 명</h5> <br>
			<h4>관람좌석 : &nbsp</h4> <h5>${reserve.seat }</h5> <br>
			<h4>상영관 : &nbsp</h4> <h5>${schedule.screen }</h5>
		</div>
	</div> <!-- hanna_container END -->
	
	<hr><hr>




<%@ include file="../include/footer.jsp" %>