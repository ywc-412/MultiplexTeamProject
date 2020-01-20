<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>

	<div class="container">
		<div class="row">
	           <div class="col-xl-12">
	               <div class="section_title text-center yeong-movieTitle">
	                   <h3>영화 수정</h3>
	               </div>
	           </div>
	       </div>
		<div class="row justify-content-lg-center">
			<div class="col-lg-8 col-md-8">
				<form role="form" action="/movie/modify" method="post" id="frm">
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
	           		<!--  검색 조건과 키워드 파라미터 추가 -->
	           		<input type="hidden" id="type" name="type" value='<c:out value="${cri.type }"/>'>
	           		<input type="hidden" id="keyword" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	           		<input type="hidden" id="movieNo" name="movieNo" value='<c:out value="${movie.movieNo }"/>'>
	           		
					<div class="form-group">
						<label for="movieTitle">영화제목</label>
						<input type="text" class="form-control" id="movieTitle" name="movieTitle" value="${movie.movieTitle }" placeholder="영화 제목 입력">
						<small id="title" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieManager">영화감독</label>
						<input type="text" class="form-control" id="movieManager" name="movieManager" value="${movie.movieManager }" placeholder="영화 감독 입력(여러명 입력가능)">
						<small id="manager" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieMainActor">주연배우</label>
						<input type="text" class="form-control" id="movieMainActor" name="movieMainActor" value="${movie.movieMainActor }" placeholder="주연 배우 입력(여러명 입력가능)">
						<small id="mainActor" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieSupportActor">조연배우</label>
						<input type="text" class="form-control" id="movieSupportActor" name="movieSupportActor" value="${movie.movieSupportActor }" placeholder="조연 배우 입력(여러명 입력가능)">
					</div>
					
					<div class="form-group">
					<label for="movieGenre">장르</label>
					<select class="form-control yeong-form-control" name="movieGenre" id="movieGenre">
					    <option class="form-control" value="액션/드라마" ${movie.movieGenre=='액션/드라마' ? "selected" : ""}>액션/드라마</option>
					    <option class="form-control" value="멜로/로맨스" ${movie.movieGenre=='멜로/로맨스' ? "selected" : ""}>멜로/로맨스</option>
					    <option class="form-control" value="공포" ${movie.movieGenre=='공포' ? "selected" : ""}>공포</option>
					    <option class="form-control" value="판타지" ${movie.movieGenre=='판타지' ? "selected" : "" }>판타지</option>
					    <option class="form-control" value="가족" ${movie.movieGenre=='가족' ? "selected" : ""}>가족</option>
					    <option class="form-control" value="범죄" ${movie.movieGenre=='범죄' ? "selected" : ""}>범죄</option>
					    <option class="form-control" value="뮤지컬" ${movie.movieGenre=='뮤지컬' ? "selected" : ""}>뮤지컬</option>
					    <option class="form-control" value="코미디" ${movie.movieGenre=='코미디' ? "selected" : ""}>코미디</option>
					</select>
						<small id="genre" class="yeong-small"></small>
					</div>
					<div class="form-group">
						<label for="movieGrade">등급</label>
						<select class="form-control yeong-form-control" name="movieGrade" id="movieGrade">
					    <option class="form-control" value="0" ${movie.movieGrade=='0' ? "selected" : ""}>0</option>
					    <option class="form-control" value="12" ${movie.movieGrade=='12' ? "selected" : ""}>12</option>
					    <option class="form-control" value="15" ${movie.movieGrade=='15' ? "selected" : ""}>15</option>
					    <option class="form-control" value="19" ${movie.movieGrade=='19' ? "selected" : ""}>19</option>
					</select>
					</div>
					<div class="form-group">
						<label for="runningTime">러닝타임</label>
						<input type="text" class="form-control" id="runningTime" name="runningTime" value="${movie.runningTime }" placeholder="러닝타임(분으로 입력)">
						<small id="time" class="yeong-small">숫자만 입력해주세요.</small>
					</div>
					<div class="form-group">
						<label for="openDate">개봉일</label>
						<input id="datepicker" placeholder="개봉일" name="openDate" value="<fmt:formatDate value="${movie.openDate }" pattern="yyyy.MM.dd"/>">
					</div>
					
					<div class="form-group">
					    <label for="summary">줄거리</label>
					    <textarea class="form-control" id="summary" name="summary" rows="3" placeholder="${movie.summary }"></textarea>
					</div>
					
					<div class="form-group uploadDiv">
						<label for="uploadFile">포스터</label><br>
						<div class="custom-file">
					    	<input class="yeong-input" type="file" id="uploadFile" name="uploadFile" multiple="multiple">
					    	<small id="picture" class="yeong-small"></small>
						    <div class="uploadResult">
	           					<ul>
	           					</ul>
	           				</div>
					    </div>
					</div>
					
					<div class="col-xl-12">
			            <div class="section_title text-center">
					   		<button type="button" data-oper="modify" id="regButton" class="btn btn-primary yeong-margin">영화 수정</button>
					   		<button type="button" data-oper="list" id="cancel" class="btn btn-secondary yeong-margin">수정 취소</button>
			    		</div>
			    	</div>
			    	
				 </form>
			  </div>
		  </div>
	  </div>
	
	<script>
	
	$(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
// 	    $("button[type='submit']").on("click",function(e){
	    $('#regButton').on("click",function(e){	
	  		
	  		var str ="";
	  		
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
		    } 
// 		    else if( uploadFile == "" || uploadFile.length < 0){
// 		 	    $('#picture').text('포스터를 선택해주세요');
// 		 	    $('#uploadFile').focus();
// 		    } 
		    else {
		    	$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					
					str += "<input type='hidden' name='attachList[" + i + "].movieFileName' value='" + jobj.data("moviefilename") + "'>"
					+ "<input type='hidden' name='attachList[" + i + "].movieUuid' value='" + jobj.data("movieuuid") + "'>"
					+ "<input type='hidden' name='attachList[" + i + "].movieUploadPath' value='" + jobj.data("movieuploadpath") + "'>"
					
				});
		    	formObj.append(str).submit();
		    }
	    }); //끝
	
	(function(){	
	    var movieNo = '<c:out value="${movie.movieNo}"/>';
    	
    	$.getJSON("/movie/getAttachList", {movieNo: movieNo}, function(result){
    		console.log(result);
    		var str = "";
    		
    		$(result).each(function(i, attach){
    			var fileCallPath = encodeURIComponent( attach.movieUploadPath + "/s_" + attach.movieUuid + "_" + attach.movieFileName);
				var originPath = attach.movieUploadPath + "\\" + attach.movieUuid + "_" + attach.movieFileName;
				originPath = originPath.replace(new RegExp(/\\/g), "/");
				
// 				str += "<img class='yeong_registerImg' src='/movieUpload/display?movieFileName=" + originPath + "'>"
						
				str += "<li data-movieuploadpath='" + attach.movieUploadPath + "'"
				+ " data-movieuuid='" + attach.movieUuid + "' data-moviefilename='" + attach.movieFileName + "'"
				+ "<div><span> " + attach.movieFileName + "</span>"
				+ "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>"
				+ "<i class='fa fa-times'></i></button><br>"
				+ "<img class='yeong_registerImg' src='/movieUpload/display?movieFileName=" + originPath +"'></div></li>";
				
    		});
    		$(".uploadResult ul").html(str);
    	}).fail(function(xhr, status, err){
    		console.log(err);
    	});
	})();
    	
	    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		
		//첨부 파일 확장자 및 크기 확인 함수
		function checkExtension(fileName, fileSize){
			//파일 크기가 maxSize를 초과하는 경우
			if(fileSize >= maxSize){
				alert('파일 사이즈 초과');
				return false;
			}
			//파일 확장자가 exe, sh, zip, alz인 경우
			if(regex.test(fileName)){
				alert('해당 종류의 파일은 업로드 할 수 없습니다');
				return false;
			}
			return true;
		}
		
// 		var csrfHeaderName = "${_csrf.headerName}";	//CSRF 토큰 관련 변수 추가
// 		var csrfTokenValue = "${_csrf.token}";	//CSRF
		
		//첨부 파일 클릭 이벤트 처리
		$("input[type='file']").change(function(e){
			var formData = new FormData(); //formData는 쉽게말해 가상의 form태그
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			if(files.length == 0){
				alert('파일을 선택해주세요');
			}else{
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]); //formData에 추가
				}
				//formData를 이용해서 필요한 파라미터를 담아서 전송하는 방식
				$.ajax({
					type : 'POST',
					url : '/movieUpload/uploadAjaxAction',
					data : formData,
					dataType : 'json',
					processData : false,
					contentType : false,
// 					beforeSend : function(xhr){	//전송 전 추가 헤더 설정
// 						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
// 					},
					success : function(result){
						alert("업로드 성공");
						console.log(result);
						showUploadedFile(result);	// 업로된된 파일명 출력
					},
					error : function(error){
						alert('업로드 실패');
					}
				}); //END ajax
			}
		});
		
		function showUploadedFile(uploadResultArr){
//	 		uploadResult.html("");	//계속업로드할경우 리셋해서 올린다
			var uploadUL = $(".uploadResult ul");
			var str = "";
			//for문을 돌려야하지만 제이쿼리에서는 each를 쓸수있다
			$(uploadResultArr).each(function(i, obj){
				var fileCallPath = encodeURIComponent( obj.movieUploadPath + "/s_"+obj.movieUuid+"_"+obj.movieFileName);
				var originPath = obj.movieUploadPath + "\\" + obj.movieUuid + "_" + obj.movieFileName;
				
				originPath = originPath.replace(new RegExp(/\\/g), "/");
				console.log(originPath);
				
				str += "<li data-movieuploadpath='" + obj.movieUploadPath + "'"
				+ " data-movieuuid='" + obj.movieUuid + "' data-moviefilename='" + obj.movieFileName + "'"
				+ "<div><span> " + obj.movieFileName + "</span>"
				+ "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>"
				+ "<i class='fa fa-times'></i></button><br>"
				+ "<img src='/movieUpload/display?movieFileName=" + fileCallPath+"'></div></li>";
					
			});
			uploadUL.append(str);
		}
		
		//x표시 클릭이벤트처리 삭제 -> x표시 버튼이다
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			//삭제시 이미지 제거할려고
			var targetLi = $(this).closest("li");
			
			$(".uploadResult").on("click", "button", function(e){
				console.log("delete file");
				
				if(confirm("Remove this file? ")){
					var targetLi = $(this).closest("li");
					targetLi.remove();
				}
			});
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
	    
	    $(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			
			if(confirm("Remove this file? ")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
	    
		
	});
	
	</script>
	
	
	
	
<%@ include file="../include/footer.jsp" %>