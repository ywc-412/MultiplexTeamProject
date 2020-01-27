<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>

<!-- 제목 -->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title text-center yeong-movieTitle">
                    <h3>영화 뿌</h3>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 중간부분 -->
    <div class="container">
        <div class="row justify-content-lg-center">
          <div class="section_title movie_register">
          
               <sec:authorize access="hasRole('ROLE_ADMIN')">
               <a href="/movie/register" class="btn btn-primary">영화등록</a>
            </sec:authorize>
         </div>
         
         <div class='movie_search'>
             <form id="searchForm" action="/movie/list" method="get">
                <select name='type' class="yeong_select">
                      <option value="" <c:out value="${pageMaker.cri.type ==null?'selected':'' }"/>> 검색 조건 지정 </option>
                     <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>감독</option>
                </select>
                <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
                   <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                   <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                     
                <button class="btn btn-primary yeong-list">검색</button>
             </form>
          </div>
       </div>
   </div>
    
    <!-- 무비사진 -->
    <div class="container">
        <div class="row">
          <div class="movie_area" id="movieContArea">
             <c:forEach items="${moveList }" var="moveList">
                 <div class="single_movie uploadDiv" id="${moveList.movieNo}">
                    <div class="uploadResult">
                         <ul>
                       </ul>
                    </div>
                     <div class="ovrer">
                        <a href="${moveList.movieNo }" class="move">
                                ${moveList.movieTitle }<br>
                                <fmt:formatNumber value="${(moveList.yesterdayNum / totalMovie) * 100 } " type="pattern" pattern="0.0" /> %
                         </a>
                     </div>
                 </div>
              </c:forEach>
          </div>
       </div>
    </div>
   <!-- 페이징 -->
   <div class="pagination justify-content-center">
       <ul class="pagination">
             <c:if test="${pageMaker.prev }">
                <li class="paginate_button previous">
                   <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
          </c:if>
          <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
                  <a class="page-link" href="${num}">${num }</a></li>
          </c:forEach>
          <c:if test="${pageMaker.next }">
                <li class="paginate_button next">
                   <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
          </c:if>
       </ul>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                       처리가 완료되었습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 실제 클릭하면 동작하는 부분 처리 -->
    <form id="actionForm" action="/movie/list" method="get">
         <input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum }">
         <input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount }">
         <!--  검색 조건과 키워드 파라미터 추가 -->
         <input type="hidden" id="type" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
         <input type="hidden" id="keyword" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
    </form>
  
<<<<<<< HEAD
	    <script>	
	    $(function(){
	    	
	    	$("#movieContArea").find(".single_movie").each(function() {
	    		
	    		var $this = $(this);
	    		
	    		var str = "";
	    		
	    		$.get("/movie/getAttachList", {movieNo : $(this).attr("id") }, function(result) {
	    			console.log($(this).attr("id"));
	    			
	    			var fileCallPath = encodeURIComponent( result[0].movieUploadPath + "/s_" + result[0].movieUuid + "_" + result[0].movieFileName);
					var originPath = result[0].movieUploadPath + "\\" + result[0].movieUuid + "_" + result[0].movieFileName;
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					str += "<img class='yeong_moveImg' src='/movieUpload/display?movieFileName=" + originPath + "'>"
	    			$this.find(".uploadResult").find("ul").append(str);
	    			console.log(str);
					
	    		});
	    	});
	    	
	    	var str = "";
			
			 var result = '<c:out value="${result}"/>';
	      
	      	 //result 값이 있는지 확인하는 함수 호출
	     	 checkModal(result);
	      
	      	 //뒤로가기 할때 발생하는 오류잡기
	      	 history.replaceState({}, null, null);
	      
	      	 //result 값이 있는지 확인하는 함수
	      	 function checkModal(result){
	    	    if(result === '' || history.state){
	    		    return;
	    	    }console.log(result);
		    	 $('#myModal').modal('show');
	         }
		      
			  
			//페이지 번호 링트 처리
			$(".paginate_button a").on("click", function(e) {
				e.preventDefault(); //a태그라서 동작안되게 막아줌
				$('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
				$('#actionForm').submit();
			});
			  
			  //게시물 조회 링크처리
			$(".move").on("click", function(e) {
				 e.preventDefault();
				 $("#actionForm").append("<input type='hidden' name='movieNo' value='"+ $(this).attr("href")+"'>");
				 $("#actionForm").attr("action", "/movie/get");
				 $("#actionForm").submit();
			});
			  
			var searchForm = $("#searchForm");
			  
			$("#searchForm button").on("click", function(e) {
				if(!searchForm.find("option:selected").val()){	//검색 조건을 지정안했을때
					alert('검색종류를 선택하세요');
					return false;
				} 
				if(!searchForm.find("input[name='keyword']").val()){	//키워드를 입력하지 않았을때
					alert('키워드를 선택하세요');
					return false;
				}
				//검색 결과 페이지 번호가 1이 되도록 처리
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				 
				searchForm.submit();
			});
		    
			
		});
		</script>
	
	
=======
       <script>   
       $(function(){
          
          $("#movieContArea").find(".single_movie").each(function() {
             
             var $this = $(this);
             
             var str = "";
             
             $.get("/movie/getAttachList", {movieNo : $(this).attr("id") }, function(result) {
                console.log($(this).attr("id"));
                
                var fileCallPath = encodeURIComponent( result[0].movieUploadPath + "/s_" + result[0].movieUuid + "_" + result[0].movieFileName);
               var originPath = result[0].movieUploadPath + "\\" + result[0].movieUuid + "_" + result[0].movieFileName;
               originPath = originPath.replace(new RegExp(/\\/g), "/");
               
               str += "<img class='yeong_moveImg' src='/movieUpload/display?movieFileName=" + originPath + "'>"
                $this.find(".uploadResult").find("ul").append(str);
                console.log(str);
               
             });
          });
          
          var str = "";
         
          var result = '<c:out value="${result}"/>';
         
             //result 값이 있는지 확인하는 함수 호출
            checkModal(result);
         
             //뒤로가기 할때 발생하는 오류잡기
             history.replaceState({}, null, null);
         
             //result 값이 있는지 확인하는 함수
             function checkModal(result){
              if(result === '' || history.state){
                 return;
              }console.log(result);
              $('#myModal').modal('show');
            }
            
           
         //페이지 번호 링트 처리
         $(".paginate_button a").on("click", function(e) {
            e.preventDefault(); //a태그라서 동작안되게 막아줌
            $('#pageNum').val($(this).attr('href'));   //내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
            $('#actionForm').submit();
         });
           
           //게시물 조회 링크처리
         $(".move").on("click", function(e) {
             e.preventDefault();
             $("#actionForm").append("<input type='hidden' name='movieNo' value='"+ $(this).attr("href")+"'>");
             $("#actionForm").attr("action", "/movie/get");
             $("#actionForm").submit();
         });
           
         var searchForm = $("#searchForm");
           
         $("#searchForm button").on("click", function(e) {
            if(!searchForm.find("option:selected").val()){   //검색 조건을 지정안했을때
               alert('검색종류를 선택하세요');
               return false;
            } 
            if(!searchForm.find("input[name='keyword']").val()){   //키워드를 입력하지 않았을때
               alert('키워드를 선택하세요');
               return false;
            }
            //검색 결과 페이지 번호가 1이 되도록 처리
            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
             
            searchForm.submit();
         });
          
         
      });
      </script>
   
   
>>>>>>> master
<%@ include file="../include/footer.jsp" %>