<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">기프티콘 수정</h3>
				</div>
				<form method="post" action="/gift/modify" role="form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="form-group">
						<label>No.</label> <input class="form-control" name="giftNo" readonly
							value='<c:out value="${gift.giftNo}"/>'>
					</div>
					<div class="form-group">
						<label>이름</label> <input class="form-control" name="giftName"
							value='<c:out value="${gift.giftName}"/>'>
					</div>
					<div class="form-group">
						<label>가격</label> <input class="form-control" name="giftPrice"
							value='<c:out value="${gift.giftPrice}"/>'>
					</div>

					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary btn-sm" data-oper="modify">수정</button>
						<%-- <button data-oper='modify' class="btn btn-default" onclick="location.href='/gift/modify?giftNo=<c:out value="${gift.giftNo}"/>'">수정</button> --%>
						<input type="button" onclick="modifyCancel()" class="btn btn-secondary btn-sm" value="취소">
					</div>
				</form>

				<div class="form-group">
					<label>사진</label><br>
					<div class="custom-photo">
						<input type="file" name="uploadFile" multiple>
					</div>
				</div>
				<hr>
				<!-- 업로드 결과 출력 -->
				<div class="uploadResult">
					<ul>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class='bigPictureWrapper'>
		<div class="bigPicture"></div>
	</div>

</section>
<!--board-end-->


<script>
	function modifyCancel() {
		if(confirm("수정을 취소하시겠습니까?") == true) {
			location.href = "/gift/list"
		} else {
			self.close();
		}
	}

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
	 }//END checkExetension()

	 var csrHeaderName = '${_csrf.headerName}';
	 var csrTokenValue = '${_csrf.token}';
	 
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
		 }
			
		$.ajax({			
			url : '/giftUpload/uploadAjaxAction',			
			processData : false,
			contentType : false,			
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrHeaderName, csrTokenValue);
			},
			data : formData,
			type : 'POST',
			dataType : 'json',	//반환된 정보를 처리하도록 추가
			success : function(result) {	
				alert("upload ok");
				console.log(result);						
				showUpLoadedFile(result);
			},error : function(error) {
				alert("upload not ok");
			}		
		});//END ajax
		});//END click
		
		var formObj = $("form");
		   $('button').on("click", function(e){
		      e.preventDefault();
		      var operation = $(this).data("oper");
		     /*  if(operation === 'remove'){	//삭제 버튼
		         formObj.attr("action", "/gift/remove");
		      } else if(operation === 'list'){	//목록 버튼
		         formObj.attr("action", "/gift/list").attr("method", "get");		        
		      } else  */if(operation === 'modify') {
					var tags = "";		
					
					$('.uploadResult ul li').each(function(i,obj){
						var o = $(obj);
						tags += "<input type='hidden' name='attachList["+i+"].giftFileName' value='" + o.data("filename") + "'>";
						tags += "<input type='hidden' name='attachList["+i+"].giftUuid' value='" + o.data("uuid") + "'>";
						tags += "<input type='hidden' name='attachList["+i+"].giftUploadPath' value='" + o.data("path") + "'>";
					});		
					//console.log(tags);
					formObj.append(tags).submit(); 	  
		      }
		   		formObj.submit();
		   });
		   
		   function showUpLoadedFile(result) {
				var li = "";
				$(result).each(function(index, obj){	
				//이미지이면 그대로 표시
				//li += ('<li>' + obj.fileName + '</li>');
				var filePath = encodeURIComponent(obj.giftUploadPath + obj.giftUuid + "_" + obj.giftFileName);				
				li += "<li data-path='"+obj.giftUploadPath+"' data-uuid='"+obj.giftUuid+"' data-fileName='"+obj.giftFileName+"'><div>" +
					  "<button data-file=\'" + filePath + "\' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
					  + "<img src='/giftUpload/display?giftFileName="+filePath+"'></div></li>";
						
				});	
				$('.uploadResult ul').append(li);
			} 
			
			$(".uploadResult").on("click", "button", function(e){
				if(confirm("파일을 삭제하시겠습니까?")) {
					var targetLi = $(this).closest("li");
					targetLi.remove();
				}
			});
			
			(function() {	
				$.getJSON("/gift/getAttachList", { giftNo : ${gift.giftNo}}, function(data) {
					console.log(data)
							
					var li = "";
					$(data).each(function(index, obj){								
						//이미지이면 그대로 표시				
							var filePath = encodeURIComponent(obj.giftUploadPath + obj.giftUuid + "_" + obj.giftFileName);				
							li += "<li data-path='"+obj.giftUploadPath+"' data-uuid='"+obj.giftUuid+"' data-fileName='"+obj.giftFileName+"'><div>" +
							  "<button data-file=\'" + filePath + "\' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
							  + "<img src='/giftUpload/display?giftFileName="+filePath+"'></div></li>";							
					});
							$('.uploadResult ul').append(li);		
						}).fail(function(xhr, status, err) {
							/* if(error) {
								error(err);
							} */
							console.log(err);
						
				});//END JSON	
			})();
</script>
<%@ include file="../include/footer.jsp" %>
