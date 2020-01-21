<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/header.jsp"%>

<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row">

				<!-- 마이페이지 인클루드....start -- row 밑에서 include-->
				<%@ include file="../include/myPageMenu.jsp"%>
				<!-- 마이페이지 인클루드....end -->

				<%@ include file="../include/suggestListInclude.jsp" %>
			</div>
		</div>
	</div>
</div>
<div id="modal" class="searchModal">
	<div class="search-modal-content">
		<div class="page-header">
			<h4>비밀글 입니다!</h4>
			<hr>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }">
						<div class="mt-10 custom-input">
							<div>비밀번호</div>
							<input type="password" name="suggestPw2" id="suggestPw2" value=""
								class="single-input custom-text-right" placeholder="해당 게시글의 비밀번호를 입력해주세요!">
							<div class="custom-red-font custom-text-right"
								id="memberPwErrorMsg"></div>
						</div>
						<div class="mt-10 custom-input text-center">
							<button type="button" class="boxed-btn3" id="suggestPwBtn">입력</button>
							<button type="button" class="boxed-btn3" id="closeBtn3">닫기</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
</div>
<!-- Modal -->
	
	<script>
		$(function(){
			var actionForm = $('#actionForm');
			
			$(document).on("click", ".page-item a", function(e){
				e.preventDefault();
				
				actionForm.find("a[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(document).on("click", "#nonNecessaryPw", function(e){
				e.preventDefault();
			
				actionForm.append("<input type='hidden' name='suggestNo' value='"+$(this).attr("href") +"'>");
				actionForm.attr("action", "/suggest/get");
				actionForm.submit();
			});
			
			
			$(document).on("click", "#necessaryPw", function(e){
				e.preventDefault();
				$('#modal').show();
				
				var realPassword = $(this).attr('value');
				var inputSuggestNo = "<input type='hidden' name='suggestNo' value='"+$(this).attr("href") +"'>"
				
				$('#suggestPwBtn').on("click", function(e){
					
					var userInputPassword = $('input[name=suggestPw2]').val();
					
					if(realPassword === userInputPassword){
						actionForm.append(inputSuggestNo);
						actionForm.attr("action", "/suggest/get");
						actionForm.submit();
					}else{
						alert('비밀번호가 일치하지 않습니다');
						return false;
					}
				});
			});
			
			
			
			$('#closeBtn3').on("click", function(e){
				e.preventDefault();
				$('#modal').hide();
				$('#suggestPw2').val('');
			});
		})
		
	</script>

<%@ include file="../include/footer.jsp"%>