<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>

	<jsp:useBean id="date" class="java.util.Date"/>
	<c:set var="to" value="<%=new Date(new Date().getTime())%>"/>
	<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
	<c:set var="tonext" value="<%=new Date(new Date().getTime() + 60*60*48*1000)%>"/>
	
	<div class="hanna_head">
		<h3>TIME TABLE </h3>
		<h4>
			<c:set var="loop_flag" value="false"/>
			<c:forEach items="${schedule1 }" var ="s">
				<c:if test="${not loop_flag }">
					<fmt:formatDate value="${s.scheduleDate }" pattern="yyyy/MM/dd"/>
					<c:set var="loop_flag" value="true"/>
				</c:if>
			</c:forEach>
		</h4>
	</div>
	
	<!-- 상영 날짜 선택 탭 -->
	<hr>
	<div class="schedule_item">
		<a href='/schedule/get?scheduleDate=<fmt:formatDate value="${to }" pattern="yyyyMMdd"/>' class="schedule_item_date">
			<h3><fmt:formatDate value="${to }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${to }" pattern="MM"/></p>
		</a>
		<a href='/schedule/get?scheduleDate=<fmt:formatDate value="${tomorrow }" pattern="yyyyMMdd"/>' class="schedule_item_date">
			<h3><fmt:formatDate value="${tomorrow }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${tomorrow }" pattern="MM"/></p>
		</a>
		<a href='/schedule/get?scheduleDate=<fmt:formatDate value="${tonext }" pattern="yyyyMMdd"/>' class="schedule_item_date">
			<h3><fmt:formatDate value="${tonext }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${tonext }" pattern="MM"/></p>
		</a>
	</div> <!-- 상영 날짜 선택 탭 END -->

	<!-- 상영시간표  -->
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule1 }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 1관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule1 }" var="s" >
							<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule2 }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 2관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule2 }" var="s">
						<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule3 }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 3관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule3 }" var="s">
						<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<!-- 상영시간표 END -->

	<!-- 해당 날짜 받아오기 : 삭제할 때 form으로 보내기 -->
	<form id="actionForm" action="/schedule/remove" method="post">
		<c:set var="loop_flag" value="false"/>
		<c:forEach items="${schedule1 }" var ="s">
			<c:if test="${not loop_flag }">
				<input type="hidden" name="scheduleDate" value='<fmt:formatDate value="${s.scheduleDate }" pattern="yyyyMMdd"/>' />
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<c:set var="loop_flag" value="true"/>
			</c:if>
		</c:forEach>
	</form>
	
    <!-- 관리자에게만 보임 : 시간표 등록/수정/삭제 버튼 -->
    <div class="hanna_container">
	   	<button class="hanna_button" id="scheduleRegBtn" style="cursor : pointer;">시간표 등록</button>
		<button class="hanna_button" id="scheduleModBtn" style="cursor : pointer;">시간표 수정</button>
		<button class="hanna_button delete_button" id="scheduleDelBtn" style="cursor : pointer;">시간표 삭제</button>
    </div>
    
    	<script>
    	
		$(function(){
			// 삭제한 후에 get 화면으로 돌아왔을 때 
			var removeResult = '<c:out value="${result}"/>';
			
			// Result값이 있는지 확인하는 함수 호출
			checkResult(removeResult);
			
			// Result값이 있는지 확인하는 함수
			function checkResult(result){
				if(result === ''){
					return ;
				}
				if(result === 'removeSuccess'){
					alert('상영스케줄 삭제가 완료되었습니다.');
				} else if (result === 'removeFail'){
					alert('상영스케줄 삭제가 실패되었습니다.');
				} else if (result === 'todaySchedule'){
					alert('오늘 날짜의 상영스케줄은 삭제가 불가능합니다.');
				}
			}
			
			$("#scheduleRegBtn").click(function(){
				// 시간표 등록 버튼 눌렀을 때
				self.location.href="/schedule/register";
				// 시간표 등록 화면으로 이동
			});
			$("#scheduleModBtn").click(function(){
				// 시간표 수정 버튼 눌렀을 때
				self.location.href="/schedule/modify";
			});
			$("#scheduleDelBtn").click(function(){
				// 시간표 삭제 버튼 눌렀을 때
				if(confirm("삭제하시겠습니까?")){
					$("#actionForm").submit();
				}
			});
		});
	
	</script>
	
	
	
	
<%@ include file="../include/footer.jsp" %>