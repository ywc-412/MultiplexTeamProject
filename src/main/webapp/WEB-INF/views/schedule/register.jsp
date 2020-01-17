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
					<select id="selectMon">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> / 
					<select id="selectDay">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>
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
<%-- 				<c:forEach items="${movieList }" var="m"> --%>
<!-- 					영화명 검색한 거 ajax로 처리해야함!! -->
<!-- 					<li class="hanna_li"> -->
<%-- 						<a href="javascript:movieChoice('${m.movieTitle}', '${m.movieNo }')"><c:out value='${m.movieTitle }'/></a> --%>
<!-- 					</li> -->
<%-- 				</c:forEach> --%>
			</ul>
		</div>
	</div>
	
	<!-- 등록된 상영시간표 표시 - 여러 개 생겨야함 -->
	
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${oneSchedule }" var="o">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie" style="cursor:pointer;" id="movieTitle">${o.movieVO.movieTitle }</div>
				<div class="hanna_schedule_screen" id="screen">${o.screen } / ${o.scheduleDate }</div>
				<c:set var="loop_flag" value="true"/>
				<hr>	
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${oneSchedule }" var="os">
						<div class="hanna_schedule_time" id="time">${os.scheduleTime }</div>
					</c:forEach>
				</div>
			</div>
	</c:if>
	</c:forEach>
	<!-- 등록된 상영시간표 표시 END -->
	
	<div class="hanna_container">
		<a href="#" class="hanna_button">등록</a>
		<a href="#" class="hanna_button">취소</a>
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
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
						<input type="text" class="hanna_add_time" name="time">
				</div>
				<form id="modifyForm" method="post">
				</form>
				<div class="modal-footer justify-content-center">
					<button type="submit" class="hanna_button">수정</button>
					<button type="button" class="hanna_button delete_button">삭제</button>
					<button type="button" class="hanna_button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	
	<script>
		function movieChoice(movieName, movieNo){
			// 검색된 영화명을 클릭했을 때 영화명, 영화번호, 날짜 모달에 넣고 모달창 띄움
			$('#scheduleAddModal').find("input[name='movieTitle']").val(movieName);
			$('#scheduleAddModal').find("input[name='movieNo']").val(movieNo);
			
			var today = new Date();
			var yyyy = today.getFullYear();
			alert(yyyy+$('#selectMon').val()+$('#selectDay').val());
			
			$('#scheduleAddModal').find("input[name='scheduleDate']").val(yyyy+$('#selectMon').val()+$('#selectDay').val());
			$('#scheduleAddModal').modal('show');
		}

		$(function() {
			
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
			var modifyModalScreen = modifyModal.find("select[name='screenNo']");
			var modifyModalTime1 = modifyModal.find("input[name='time']");
			var modifyModalTime2 = modifyModal.find("input[name='time2']");
			var modifyModalTime3 = modifyModal.find("input[name='time3']");
			var modifyModalTime4 = modifyModal.find("input[name='time4']");
			var modifyModalTime5 = modifyModal.find("input[name='time5']");
			var modifyModalTime6 = modifyModal.find("input[name='time6']");
			
			$('#movieTitle').on("click", function(){
				modifyModalTime1.val($('#time1').html());
				modifyModalTime2.val($('#time2').html());
				modifyModalTime3.val($('#time3').html());
				modifyModalTime4.val($('#time4').html());
				modifyModalTime5.val($('#time5').html());
				modifyModalTime6.val($('#time6').html());
				modifyModalScreen.val($('#screenNo').html());
				modifyModalMovie.val($('#movieTitle').html());
				
				$('#scheduleModifyModal').modal('show');
			});
			
		})
	</script>
	
	
	
	
<%@ include file="../include/footer.jsp" %>