<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>

	<div class="hanna_head">
		<h3>TIME TABLE</h3>
	</div>
	

	<jsp:useBean id="date" class="java.util.Date"/>
<%-- 	<fmt:formatDate value="${today }" pattern="MM" var="month"/> --%>
<%-- 	<fmt:formatDate value="${today }" pattern="dd" var="day"/> --%>
	<c:set var="to" value="<%=new Date(new Date().getTime())%>"/>
	<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
	<c:set var="tonext" value="<%=new Date(new Date().getTime() + 60*60*48*1000)%>"/>

	<!-- 상영 날짜 선택 탭 -->
	<hr>
	<div class="schedule_item">
		<a href="#" class="schedule_item_date">
			<h3><fmt:formatDate value="${to }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${to }" pattern="MM"/></p>
		</a>
		<a href="#" class="schedule_item_date">
			<h3><fmt:formatDate value="${tomorrow }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${tomorrow }" pattern="MM"/></p>
		</a>
		<a href="#" class="schedule_item_date">
			<h3><fmt:formatDate value="${tonext }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${tonext }" pattern="MM"/></p>
		</a>
	</div> <!-- 상영 날짜 선택 탭 END -->
	
	<!-- 상영시간표  -->
	<c:set var="loop_flag" value="false"/>
	<c:set var="loop_flag2" value="false"/>
	<c:forEach items="${schedule }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 1관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule }" var="s" varStatus="status">
						<c:if test="${not loop_flag2 }">
							<c:if test="${status.count == 6}">
								<c:set var="loop_flag2" value="true"/>
							</c:if>
							<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	
	
	
	
	
	<div class="hanna_container">
		<br>
		<div class="hanna_schedule_movie"> 미드웨이 </div>
		<div class="hanna_schedule_screen"> 2관 3층 </div>
		<hr>
		<div class="hanna_schedule_time_wrap">
			<div class="hanna_schedule_time"> 09:00 </div>
			<div class="hanna_schedule_time"> 11:00 </div>
			<div class="hanna_schedule_time"> 13:00 </div>
			<div class="hanna_schedule_time"> 15:00 </div>
			<div class="hanna_schedule_time"> 17:00 </div>
			<div class="hanna_schedule_time"> 19:00 </div>
		</div>
	</div>
	
<!-- 	<div class="hanna_container"> -->
<!-- 		<br> -->
<!-- 		<div class="hanna_schedule_movie"> 백두산 </div> -->
<!-- 		<div class="hanna_schedule_screen"> 3관 3층 </div> -->
<!-- 		<hr> -->
<!-- 		<div class="hanna_schedule_time_wrap"> -->
<!-- 			<div class="hanna_schedule_time"> 09:30 </div> -->
<!-- 			<div class="hanna_schedule_time"> 11:30 </div> -->
<!-- 			<div class="hanna_schedule_time"> 13:30 </div> -->
<!-- 			<div class="hanna_schedule_time"> 15:30 </div> -->
<!-- 			<div class="hanna_schedule_time"> 17:30 </div> -->
<!-- 			<div class="hanna_schedule_time"> 19:30 </div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- 상영시간표 END -->

	<!-- 관리자에게만 보임 : 시간표 등록/수정/삭제 버튼 -->
<!--     <div class="container"> -->
<!--         <div class="row"> -->
<!--             <div class="col-xl-10 offset-xl-1 col-md-12"> -->
<!--                 <div class="Query_border"> -->
<!--                     <div class="row align-items-center justify-content-center"> -->
<!--                         <div class="col-xl-6 col-md-6"> -->
<!-- 							<a href="#" class="hanna_button">시간표 등록</a> -->
<!-- 							<a href="#" class="hanna_button">시간표 수정</a> -->
<!-- 							<a href="#" class="hanna_button delete_button">시간표 삭제</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
    <div class="hanna_container">
<!--     	<div class="container"> -->
<!--     	<div class="row"> -->
<!-- 			<div class="col-xl-12"> -->
<!-- 				<div class="section_title text-center"> -->
			    	<button class="hanna_button">시간표 등록</button>
					<button class="hanna_button">시간표 수정</button>
					<button class="hanna_button delete_button">시간표 삭제</button>
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
    </div>
	
	
	
	
<%@ include file="../include/footer.jsp" %>