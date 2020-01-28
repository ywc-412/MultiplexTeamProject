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
			<!-- 예매한 영화의 포스터 -->
		</div>
		<div class="reserve_success_info">
			<h3> ${schedule.movieTitle } </h3>
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
	
	<script>
	
	$(function(){
        var movieNo = '<c:out value="${schedule.movieNo}"/>';
        
        $.getJSON("/movie/getAttachList", {movieNo: movieNo}, function(result){
           console.log(result);
           var str = "";
           
           $(result).each(function(i, attach){
              var fileCallPath = encodeURIComponent( attach.movieUploadPath + "/s_" + attach.movieUuid + "_" + attach.movieFileName);
             var originPath = attach.movieUploadPath + "\\" + attach.movieUuid + "_" + attach.movieFileName;
             originPath = originPath.replace(new RegExp(/\\/g), "/");
             
             str += "<img class='yeong_moveImg' src='/movieUpload/display?movieFileName=" + originPath + "'>"
              
           });
           $(".reserve_success_pic").html(str);
        }).fail(function(xhr, status, err){
           console.log(err);
        });
	});
	
	
	</script>




<%@ include file="../include/footer.jsp" %>