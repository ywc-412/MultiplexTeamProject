<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>

<!--board s -->
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">기프티콘 등록</h3>
				</div>
				<div class="form-group">
					<label>사진</label><br>
					<div class="custom-photo">
						<input type="file" name="uploadFile" multiple>
					</div>
				</div>				
				<div class="uploadResult">
					<ul>
						<!-- 사진 -->
					</ul>
				</div>				
				<form id="registerForm" action="/gift/register" method="post" role="form">
					<div class="form-group">
						<label>이름</label><input class="form-control" name="giftName" id="giftName">
					</div>
					<div class="form-group">
						<label>가격</label><input class="form-control" name="giftPrice" id="giftPrice">
					</div>
					<div class="form-group">
						<label>구성</label><input class="form-control" name="giftSet" id="giftSet">
					</div>
					<hr>
					<div class="form-group text-center">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<button type="button" class="btn btn-primary btn-sm" id="regBtn">등록</button>
						<button type="button" class="btn btn-secondary btn-sm" onclick="registerCancel()">취소</button>						
					</div>
				</form>				
			</div>
		</div>
	</div>
</section>
<!--board e -->

<script>
	//등록 취소 알림창
	function registerCancel() {
		if(confirm("등록을 취소하시겠습니까?") == true) {
			location.href = "/gift/list"
		} else {
			self.close();
		}
	}
	
	//form 전송 
	$(function(){
		var formObj = $("form[role='form']");
		$("#regBtn").click(function(){					
			var tags = "";			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;	
			
			if ($("#giftName").val() == "" || $("#giftPrice").val() == "" || $("#giftSet").val() == "") {
				alert("내용을 입력해주세요");	
			} else if(files.length == 0) {
				alert('파일을 선택해주세요');
			} else {								 
				$('.uploadResult ul li').each(function(i,obj){
					var o = $(obj);
					tags += "<input type='hidden' name='attachList["+i+"].giftFileName' value='" + o.data("filename") + "'>";
					tags += "<input type='hidden' name='attachList["+i+"].giftUuid' value='" + o.data("uuid") + "'>";
					tags += "<input type='hidden' name='attachList["+i+"].giftUploadPath' value='" + o.data("path") + "'>";
				});	//each	
				
				if(confirm("정말로 등록하시겠습니까?") == true) { 
					formObj.append(tags).submit();
				}
			}
		});//END form
		
	//파일의 확장자와 크기를 설정하고 이를 검사하는 함수
	 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	 var maxSize = 5242880; //5MB
	 
	 function checkExtension(fileName, fileSize) {
		if(fileSize >= maxSize) {	//파일 크기가 maxSize를 초과하는 경우
			alert("업로드 파일 사이즈가 초과되었습니다.");
			return false;				
		}
		if(regex.test(fileName)) {	//파일 확장자가 exe, sh, zip, alz인 경우
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}			
		return true;
	 }//END check
			 
	 var csrfHeaderName = "${_csrf.headerName}";
	 var csrfTokenValue = "${_csrf.token}";
	
	 //file 업로드
	$("input[type='file']").change(function(e){
		 var formData = new FormData();	//jQuery를 이용하는 경우 파일 업로드는 FormData라는 객체를 이용. 쉽게 말하면 가상의 <form>태그
		 var inputFile = $("input[name='uploadFile']");
		 var files = inputFile[0].files;		
		 console.log(files);
		 
		 /* add filedata to formdata */
		 for (var i = 0; i < files.length; i++) {
		 	alert('giftFileName : ' + files[i].name + '\nsize : ' + files[i].size);
		 	if(!checkExtension(files[i].name, files[i].size)) {					
				return false;
			} 
			formData.append('uploadFile',files[i]);			
	 	}//END 업로드
					 
		$.ajax({					
			url : '/giftUpload/uploadAjaxAction',					
			processData : false,
			contentType : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data : formData,
			type : 'POST',
			dataType : 'json',	//반환된 정보를 처리하도록 추가
			success : function(result) {	
				alert("upload ok");
				console.log(result);
				showUpLoadedFile(result)
			},error : function(error) {
				alert("upload not ok");								
			}		
		});//END ajax
		});//END change	
	
	$("button[type='submit']").click(function(e){
		e.preventDefault();		
	});
	
	//사진 보여주기
	function showUpLoadedFile(result) {
		var li = "";
		$(result).each(function(index, obj){							
			var filePath = encodeURIComponent(obj.giftUploadPath +  obj.giftUuid + "_" + obj.giftFileName);
			li += "<li data-path='"+obj.giftUploadPath+"' data-uuid='"+obj.giftUuid+"' data-fileName='"+obj.giftFileName+"'><div>" 
				  + "<button data-file=\'" + filePath + "\' class='btn btn-warning btn-circle'>"
				  + "<i class='fa fa-times'></i></button><br><img src='/giftUpload/display?giftFileName="+filePath+"'></div></li>";			
		});	
		$('.uploadResult ul').append(li);
	}
	
	//전송 전 사진 삭제(X버튼)
	$(".uploadResult").on("click", "button", function(e){
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		console.log(targetFile);
		
		var targetLi = $(this).closest("li");
		$.ajax({
			url: '/giftUpload/deleteFile',
			data: {giftFileName: targetFile},				
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				console.log('remove clicked!');
				targetLi.remove();
			}, error : function(error){
				alert(error);
			}
		});
	});
});
</script>

<%@ include file="../include/footer.jsp" %>