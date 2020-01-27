
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="include/header.jsp" %>

   <div class="yeong_offers_area">
      <div class="container">
         <div class="row" id="movieContArea">
            <c:forEach items="${moveList }" var="moveList">
               <div class="col-xl-4 col-md-4">
                  <div class="single_offers">
                     <div class="gj-text-align-center uploadDiv" id="${moveList.movieNo}">
                        <div class="uploadResult">
                               <ul>
                             </ul>
                          </div>
                     </div>
                     <div class="gj-text-align-center"><br>
                        <p class="custom-movie-title-font">${moveList.movieTitle }</p>
                        <fmt:formatNumber value="${(moveList.yesterdayNum / totalMovie) * 100 } " type="pattern" pattern="0.0" /> %
                     </div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
   </div>
   
   
   
   <!-- offers_area_end -->

   <!-- 실제 클릭하면 동작하는 부분 처리 -->
    <form id="actionForm" action="/movie/get" method="get">
    
    </form>
   
   <script>   
       $(function(){
          $("#movieContArea").find(".uploadDiv").each(function() {
             var $this = $(this);
             var str = "";
             
             $.get("/getAttachList", {movieNo : $(this).attr("id") }, function(result) {
                var mNo = result[0].movieNo;
                console.log(mNo);
                
                var fileCallPath = encodeURIComponent( result[0].movieUploadPath + "/s_" + result[0].movieUuid + "_" + result[0].movieFileName);
               var originPath = result[0].movieUploadPath + "\\" + result[0].movieUuid + "_" + result[0].movieFileName;
               originPath = originPath.replace(new RegExp(/\\/g), "/");
               
               str += "<a href='#' id='imageMovie' class='imageMovie' data-movieNo='"+mNo+"'>";
               str += "<img class='customImgSize' src='/movieUpload/display?movieFileName=" + originPath + "'></a>";
                $this.find(".uploadResult").find("ul").append(str);
               
             });
          });
          
          $(document).on("click", "#imageMovie", function(e){
            console.log($(this).data("movieno"));
            e.preventDefault();
            $("#actionForm").append("<input type='hidden' name='movieNo' value='"+ $(this).data("movieno") +"'>");
            $("#actionForm").attr("action", "/movie/get");
            $("#actionForm").submit();
             
          });
      });
      </script>

   <%@ include file="include/footer.jsp" %>
   
   