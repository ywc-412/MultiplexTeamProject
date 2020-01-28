<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>
<div class="hanna_head">
		<h3>TIME_TABLE_ADD</h3>
	</div>
	
	<!-- 상영 날짜 입력 -->
	<hr>
	<div class="hanna_container" style="padding-bottom : 10px;">
		<div class="mt-10 custom-input">
			<div>상영일자</div>
			<div class="row">
				<div class="col-xl-6">
					<form id="dateForm" action="/schedule/register">
						<select id="selectMon" onchange="monChange(this)">
							<option value="01" <c:if test="${selMonth == 01 }">selected</c:if>>1</option>
							<option value="02" <c:if test="${selMonth == 02 }">selected</c:if>>2</option>
							<option value="03" <c:if test="${selMonth == 03 }">selected</c:if>>3</option>
							<option value="04" <c:if test="${selMonth == 04 }">selected</c:if>>4</option>
							<option value="05" <c:if test="${selMonth == 05 }">selected</c:if>>5</option>
							<option value="06" <c:if test="${selMonth == 06 }">selected</c:if>>6</option>
							<option value="07" <c:if test="${selMonth == 07 }">selected</c:if>>7</option>
							<option value="08" <c:if test="${selMonth == 08 }">selected</c:if>>8</option>
							<option value="09" <c:if test="${selMonth == 09 }">selected</c:if>>9</option>
							<option value="10" <c:if test="${selMonth == 10 }">selected</c:if>>10</option>
							<option value="11" <c:if test="${selMonth == 11 }">selected</c:if>>11</option>
							<option value="12" <c:if test="${selMonth == 12 }">selected</c:if>>12</option>
						</select> / 
						<select id="selectDay" onchange="dayChange(this)">
							<!-- 선택된 달의 day들 출력 (28 / 30 / 31) -->
						</select>
						<input type="hidden" name="scheduleDate">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 상영 날짜 입력 END -->
	<hr>
	<div class="hanna_container" style="padding-bottom : 0px;">
		<div class="mt-10 custom-input">
			<div>영화선택</div>
			<input type="text" name="movieName" id="movieName" class="hanna_input">
			<button class="hanna_button" id = "searchMovie" style="cursor : pointer;"> 검색 </button>
		</div>
	</div>
	<div class="hanna_container" style="padding-top : 0px;">
		<div class="">
			<ul class="hanna_ul_list">
					<!-- 영화명 검색한 거 ajax로 나타나는 부분 -->
			</ul>
		</div>
	</div>
	
	<!-- msg값 넘어오면 alert 창 띄우기 -->
	<c:if test="${msg != null}">
		<script>
			// 해당 날짜, 상영관에 스케줄이 존재하는 경우
			$(document).ready(function(){
				alert("${msg}");
			});
		</script>
	</c:if>
	
	<!-- 등록된 상영시간표 표시 -->
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule1 }" var="s1" varStatus="status">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie" style="cursor:pointer;" id="movieTitle" value="sc1" value2="${s1.movieNo }">${s1.movieTitle }</div>
				<div class="hanna_schedule_screen" id="screen1">${s1.screen }</div>
				<c:set var="loop_flag" value="true"/>
				<hr>	
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule1 }" var="os" varStatus="status">
						<div class="hanna_schedule_time" id="time1${status.count }">${os.scheduleTime }</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule2 }" var="s1" varStatus="status">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie" style="cursor:pointer;" id="movieTitle" value="sc2" value2="${s1.movieNo }">${s1.movieTitle }</div>
				<div class="hanna_schedule_screen" id="screen2">${s1.screen }</div>
				<c:set var="loop_flag" value="true"/>
				<hr>	
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule2 }" var="os" varStatus="status">
						<div class="hanna_schedule_time" id="time2${status.count }">${os.scheduleTime }</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule3 }" var="s1" varStatus="status">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie" style="cursor:pointer;" id="movieTitle" value="sc3" value2="${s1.movieNo }">${s1.movieTitle }</div>
				<div class="hanna_schedule_screen" id="screen3">${s1.screen }</div>
				<c:set var="loop_flag" value="true"/>
				<hr>	
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule3 }" var="os" varStatus="status">
						<div class="hanna_schedule_time" id="time3${status.count }">${os.scheduleTime }</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<!-- 등록된 상영시간표 표시 END -->
	
	<div class="hanna_container">
		<Button class="hanna_button" id="addFinBtn">등록</Button>
		<form id="seqForm" method="post" action="/schedule/cancel">
		<!-- 취소 클릭 시 등록한 시간표 다시 삭제하기 -->
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<c:if test="${empty listSeq}">
				<input type="hidden" name="regSeq" value="">
			</c:if>
			<c:forEach items="${listSeq }" var="seq">
				<input type="hidden" name="regSeq" value="${seq }">
			</c:forEach>
			<Button class="hanna_button" id="addCanBtn">취소</Button>
		</form>
	</div>

    <!-- Schedule Add Modal -->
	<div class="modal fade" id="scheduleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">스케줄 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form id="addForm" action="/schedule/register" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div>영화명&nbsp&nbsp
						<input type="text" name="movieTitle" readOnly="readonly">
						<input type="hidden" name="movieNo">
						<input type="hidden" name="scheduleDate">
					</div> <br>
					<div>상영관&nbsp&nbsp
						<select name="screen">
							<option value="1관 3층"> 1관 3층 </option>
							<option value="2관 3층"> 2관 3층 </option>
							<option value="3관 3층"> 3관 3층 </option>
						</select>
					</div> <br>
					<div>상영시간</div>
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<c:if test="${empty listSeq}">
							<input type="hidden" name="regSeq" value="">
						</c:if>
						<c:forEach items="${listSeq }" var="seq" varStatus="status">
							<input type="hidden" name="regSeq" value="${seq }">
						</c:forEach>
				</form>
				</div>
				<div class="modal-footer justify-content-center">
					<button id ="modalAddBtn" class="hanna_button">추가</button>
					<button id ="modalCanBtn" class="hanna_button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div> <!-- Schedule Add Modal END -->
	
	<!-- Schedule Modify Modal -->
	<div class="modal fade" id="scheduleModifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">스케줄 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="modifyForm" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div>영화명&nbsp&nbsp
						<input type="text" name="movieTitle" readOnly="readonly">
						<input type="hidden" name="movieNo">
					</div> <br>
					<div>상영관&nbsp&nbsp
						<select name="screen">
							<option value="1관 3층">1관 3층</option>
							<option value="2관 3층">2관 3층</option>
							<option value="3관 3층">3관 3층</option>
						</select>
					</div> <br>
					<div>상영시간</div>
						<input type="text" class="hanna_add_time" name="time" id="modifyTime1">
						<input type="text" class="hanna_add_time" name="time" id="modifyTime2">
						<input type="text" class="hanna_add_time" name="time" id="modifyTime3">
						<input type="text" class="hanna_add_time" name="time" id="modifyTime4">
						<input type="text" class="hanna_add_time" name="time" id="modifyTime5">
						<input type="text" class="hanna_add_time" name="time" id="modifyTime6">
					</form>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="submit" class="hanna_button" id="modifyBtn">수정</button>
					<button type="button" class="hanna_button delete_button" id="modifyDel">삭제</button>
					<button type="button" class="hanna_button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	
	<script>

		// 1, 3, 5, 7, 8, 10, 12월
		var thirtyone = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
			"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
		// 4, 6, 9, 11월
		var thirty = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
			"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"];
		// 2월
		var twenty = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
			"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"];
		
		$(window).load(function(){
			var month = ${selMonth};
			var date = ${selDate};
			switch(month){
				case "04": case "06": case "09": case "11":
					var d = thirty;
					break;
				case "02":
					var d = twenty;
					break;
				default :
					var d = thirtyone;
					break;
			}
			var str = "";
			for(x in d){
				if(d[x]==date){
					str += "<option value ='"+d[x]+"' selected>"+d[x]+"</option>";
				} else {
					str += "<option value ='"+d[x]+"' <c:if test='${selDate}'>selected</c:if>>"+d[x]+"</option>";
				}
			}
			$("#selectDay").append(str);
		});
		
		function monChange(month){
			// 체크박스에서 month 선택시
			switch(month.value){
				case "04": case "06": case "09": case "11":
					var d = thirty;	break;
				case "02":
					var d = twenty;		break;
				default:
					var d = thirtyone;		break;
			}
			var str = "";
			for(x in d){
				str += "<option value ='"+d[x]+"' <c:if test='${selDate}'>selected</c:if>>"+d[x]+"</option>";
			}
			$("#selectDay").append(str);

			var today = new Date();
			var yyyy = today.getFullYear();
			var scheduleDate = yyyy+$('#selectMon').val()+$('#selectDay').val();
			$("input[name='scheduleDate']").val(scheduleDate);
			$("#dateForm").submit();
		}
		
		function dayChange(day){
			// 체크박스에서 day 선택 시
			var today = new Date();
			var yyyy = today.getFullYear();
			var scheduleDate = yyyy+$('#selectMon').val()+$('#selectDay').val();
			$("input[name='scheduleDate']").val(scheduleDate);
			$("#dateForm").submit();
		}
	
	
		function movieChoice(movieName, movieNo){
			// 검색된 영화명을 클릭했을 때 영화명, 영화번호, 날짜 모달에 넣고 모달창 띄움
			$('#scheduleAddModal').find("input[name='movieTitle']").val(movieName);
			$('#scheduleAddModal').find("input[name='movieNo']").val(movieNo);
			
			var today = new Date();
			var yyyy = today.getFullYear();
			
			$('#scheduleAddModal').find("input[name='scheduleDate']").val(yyyy+$('#selectMon').val()+$('#selectDay').val());
			$('#scheduleAddModal').modal('show');
		}

		$(function() {
			
			$("#addCanBtn").on("click", function(){
				if(confirm("정말 취소하시겠습니까?")){
					$("#seqForm").submit();
				}
			}); // 취소 버튼 클릭 시
			
			$("#addFinBtn").on("click", function(){
				location.href="/schedule/get";
			}); // 등록 버튼 클릭 시
			
			
			$("#searchMovie").on("click", function(){
				// 검색 버튼 클릭 시 ajax로 영화명 받아오기
				var movieName = $("#movieName").val();
				var str="";
				if(movieName != null){
					$.getJSON("/movie/getName/"+movieName+".json",
						function(data){ // 결과값 받기
							for(mvo of data){
								str += "<li class='hanna_li'>";
								str += "<a href=\"javascript:movieChoice(\'"+ mvo.movieTitle +"', '" + mvo.movieNo +"\')\">";
								str += mvo.movieTitle + "</a></li>";
							}
							$(".hanna_ul_list").html(str);
						}).fail(function(xhr, status, error){
							if(error){
								error();
							}
						});
				}
			});
			
			// ADD 모달창 관련 처리
			var addModal = $("#scheduleAddModal");

			var addScheduleBtn = $("#modalAddBtn");
			var canScheduleBtn = $("#modalCanBtn");
			
			addScheduleBtn.on("click", function(){
				$("#addForm").submit();
			}); // 스케줄 추가 버튼 클릭 END

			// 수정모달창에 값 넘기기
			var modifyModal = $("#scheduleModifyModal");
			var modifyModalMovie = modifyModal.find("input[name='movieTitle']");
			var modifyModalMovieNo = modifyModal.find("input[name='movieNo']");
			var modifyModalScreen = modifyModal.find("input[name='screen']");
			var modifyModalTime1 = modifyModal.find("input[id='modifyTime1']");
			var modifyModalTime2 = modifyModal.find("input[id='modifyTime2']");
			var modifyModalTime3 = modifyModal.find("input[id='modifyTime3']");
			var modifyModalTime4 = modifyModal.find("input[id='modifyTime4']");
			var modifyModalTime5 = modifyModal.find("input[id='modifyTime5']");
			var modifyModalTime6 = modifyModal.find("input[id='modifyTime6']");

			$(document).on("click", "#movieTitle", function(e){
				var scNo = $(this).attr("value");
				modifyModalMovieNo.val($(this).attr("value2"));
				modifyModalMovie.val($(this).html());
				var str = "";
				if(scNo == "sc1"){
// 					str += "<option value='1관 3층' selected>1관 3층</option>";
// 					str += "<option value='2관 3층'>2관 3층</option>";
// 					str += "<option value='3관 3층'>3관 3층</option>";
					modifyModalTime1.val($('#time11').html());
					modifyModalTime2.val($('#time12').html());
					modifyModalTime3.val($('#time13').html());
					modifyModalTime4.val($('#time14').html());
					modifyModalTime5.val($('#time15').html());
					modifyModalTime6.val($('#time16').html());
				} else if (scNo == "sc2"){
// 					str += "<option value='1관 3층'>1관 3층</option>";
// 					str += "<option value='2관 3층' selected>2관 3층</option>";
// 					str += "<option value='3관 3층'>3관 3층</option>";
					modifyModalTime1.val($('#time21').html());
					modifyModalTime2.val($('#time22').html());
					modifyModalTime3.val($('#time23').html());
					modifyModalTime4.val($('#time24').html());
					modifyModalTime5.val($('#time25').html());
					modifyModalTime6.val($('#time26').html());
				} else if (scNo == "sc3"){
// 					str += "<option value='1관 3층'>1관 3층</option>";
// 					str += "<option value='2관 3층'>2관 3층</option>";
// 					str += "<option value='3관 3층' selected>3관 3층</option>";
					modifyModalTime1.val($('#time31').html());
					modifyModalTime2.val($('#time32').html());
					modifyModalTime3.val($('#time33').html());
					modifyModalTime4.val($('#time34').html());
					modifyModalTime5.val($('#time35').html());
					modifyModalTime6.val($('#time36').html());
				}
// 				modifyModalScreen.append(str);
				$('#scheduleModifyModal').modal('show');
			});

			$(document).on("click", "#modifyBtn", function(e){
				alert("modifyBtn");
			});
			
			$(document).on("click", "#modifyDel", function(e){
				alert("del Btn");
			});
			
			
		})
	</script>
	
	
	
	
<%@ include file="../include/footer.jsp" %>