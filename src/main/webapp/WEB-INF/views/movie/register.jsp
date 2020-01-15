<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>
	
	<script>
	$(function(){
		var formObj = $("form[role='form']");
		
	    $("button[type='submit']").on("click",function(e){
	  		e.preventDefault(); //submit 처리 취소
	  		console.log("submit clicked");
	  		
	  		var movieTitle = $('#movieTitle').val();
	  		var movieManager = $('#movieManager').val();
	  		var movieMainActor = $('#movieMainActor').val();
	  		var movieGenre = $('#movieGenre').val();
	  		var runningTime = $('#runningTime').val();
	  		var poster = $('#poster').val();
		    
		    if( movieTitle == "" || movieTitle.length < 0){
		 	    $('#title').text('영화 제목을 입력해주세요');
		 	    $('#movieTitle').focus();
		    } else if( movieManager == "" || movieManager.length < 0){
		 	    $('#manager').text('영화 감독을 입력해주세요');
		 	    $('#mainActor').focus();
		    } else if( movieMainActor == "" || movieMainActor.length < 0){
		 	    $('#mainActor').text('영화 주연배우를 입력해주세요');
		 	    $('#movieMainActor').focus();
		    } else if( movieGenre == "영화 장르"){
		 	    $('#genre').text('영화 장르를 선택해주세요');
		 	    $('#movieGenre').focus();
		    } else if( runningTime == "" || runningTime.length < 0){
		 	    $('#time').text('러닝타임을 숫자로만 입력해주세요  ex) 180');
		 	    $('#runningTime').focus();
		    } else {
		    	formObj.submit();
		    }
		    
// 		    else if( poster == "" || poster.length < 0){
// 		 	    $('#picture').text('포스터를 선택해주세요');
// 		 	    $('#poster').focus();
// 		    }

	    });
		
		//러닝타임 숫자로만 입력
	    $('#runningTime').on("keyup", function() {
	        $(this).val($(this).val().replace(/[^0-9]/g,""));
	    });
		
	    $('#cancel').on("click", function() {
	        var result = confirm(" 취소하시겠습니까? ");
	        
	        if(result) {
	        	location.href="/movie/list";
	        }else{
	        	return;
	        }
	    });
		
	});
	
	</script>
	<div class="container">
		<div class="row">
	           <div class="col-xl-12">
	               <div class="section_title text-center yeong-movieTitle">
	                   <h3>영화 등록</h3>
	               </div>
	           </div>
	       </div>
		<div class="row justify-content-lg-center">
			<div class="col-lg-8 col-md-8">
				<form role="form" action="/movie/register" method="post" name="frm">
					<div class="form-group">
						<label for="movieTitle">영화제목</label>
						<input type="text" class="form-control" id="movieTitle" name="movieTitle" placeholder="영화 제목 입력">
						<small id="title" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieManager">영화감독</label>
						<input type="text" class="form-control" id="movieManager" name="movieManager" placeholder="영화 감독 입력(여러명 입력가능)">
						<small id="manager" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieMainActor">주연배우</label>
						<input type="text" class="form-control" id="movieMainActor" name="movieMainActor" placeholder="주연 배우 입력(여러명 입력가능)">
						<small id="mainActor" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieSupportActor">조연배우</label>
						<input type="text" class="form-control" id="movieSupportActor" name="movieSupportActor" placeholder="조연 배우 입력(여러명 입력가능)">
					</div>
					
					<div class="form-group">
					<label for="movieGenre">장르</label>
					<select class="form-control yeong-form-control" name="movieGenre" id="movieGenre">
					    <option class="form-control">영화 장르</option>
					    <option class="form-control">액션/드라마</option>
					    <option class="form-control">멜로/로맨스</option>
					    <option class="form-control">공포</option>
					    <option class="form-control">판타지</option>
					    <option class="form-control">가족</option>
					    <option class="form-control">범죄</option>
					    <option class="form-control">뮤지컬</option>
					    <option class="form-control">코미디</option>
					</select>
						<small id="genre" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieGrade">등급</label>
						<select class="form-control yeong-form-control" name="movieGenre" id="movieGenre">
					    <option class="form-control">0</option>
					    <option class="form-control">12</option>
					    <option class="form-control">15</option>
					    <option class="form-control">19</option>
					</select>
					</div>
					<div class="form-group">
						<label for="runningTime">러닝타임</label>
						<input type="text" class="form-control" id="runningTime" name="runningTime" placeholder="러닝타임(분으로 입력)">
						<small id="time" class="yeong-small">숫자만 입력해주세요.</small>
					</div>
					<div class="form-group">
						<label for="openDate">개봉일</label>
						<input id="datepicker" placeholder="개봉일" name="openDate">
					</div>
					
					<div class="form-group">
					    <label for="summary">줄거리</label>
					    <textarea class="form-control" id="summary" name="summary" rows="3" placeholder="줄거리를 입력해주세요"></textarea>
					</div>
					
					<div class="form-group">
						<label for="poster">포스터</label><br>
						<div class="custom-file">
					    <input class="yeong-input" type="file" id="poster" name="poster">
					    <small id="picture" class="yeong-small"></small>
					    </div>
					</div>
					
					<div class="col-xl-12">
			            <div class="section_title text-center">
					   		<button type="submit" id="submit" class="btn btn-primary yeong-margin">영화 등록</button>
					   		<button type="button" id="cancel" class="btn btn-secondary yeong-margin">등록 취소</button>
			    		</div>
			    	</div>
			    	
				 </form>
			  </div>
		  </div>
	  </div>
	
	
	
	
<%@ include file="../include/footer.jsp" %>