<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>

<!-- msg값 넘어오면 alert 창 띄우기 -->
	<c:if test="${msg != null}">
		<script>
			// 영화 삭제 불가능한 경우
			$(document).ready(function(){
				alert("해당 영화의 상영스케줄이 존재하는 경우 삭제가 불가능합니다.");
			});
		</script>
	</c:if>

<!-- 제목 -->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title text-center yeong-movieTitle">
                    <h3>영화 상세보기</h3>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        
       <div class="movie-container-left">
          <div class="uploadResult">
            <ul>
            </ul>
         </div>
      </div>
      <div class="movie-container-right">
         <h3 class="yeongth_movieGetTilte">${movie.movieTitle }</h3>
           <hr>
           <table>
            <tbody>
               <tr>
                  <td scope="col" class="yeongth_movie30">감독</td>
                  <td scope="col" class="yeongth_movie70">${movie.movieManager }</td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">주연배우</td>
                  <td scope="col" class="yeongth_movie70">${movie.movieMainActor }</td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">조연배우</td>
                  <td scope="col" class="yeongth_movie70">${movie.movieSupportActor }</td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">장르</td>
                  <td scope="col" class="yeongth_movie70">${movie.movieGenre }</td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">등급</td>
                  <td scope="col" class="yeongth_movie70">
                     <c:choose>
                          <c:when test = "${movie.movieGrade eq 0}">
                                 전체 관람가
                          </c:when>
                          <c:when test = "${movie.movieGrade eq 12}">
                              12세 관람가
                          </c:when>
                          <c:when test = "${movie.movieGrade eq 15}">
                                15세 관람가
                          </c:when>
                          <c:otherwise>
                                청소년 관람 불가
                          </c:otherwise>
                      </c:choose>
                   </td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">러닝타임</td>
                  <td scope="col" class="yeongth_movie70">${movie.runningTime } 분</td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">예매율</td>
                  <td scope="col" class="yeongth_movie70">${ percentMovie } % </td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">개봉일</td>
                  <td scope="col" class="yeongth_movie70"><fmt:formatDate value="${movie.openDate }" pattern="yyyy.MM.dd"/></td>
               </tr>
               <tr>
                  <td scope="col" class="yeongth_movie30">줄거리</td>
                  <td scope="col" class="yeongth_movie70">${movie.summary }</td>
               </tr>
               
            </tbody>
         </table>
      </div>
    </div>
    
    <form id='operForm' action="/movie/modify" method="get">
      <input type="hidden" id="movieNo" name="movieNo" value='<c:out value="${movie.movieNo }"/>'>
      
      <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
      <input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
               <!--  검색 조건과 키워드 파라미터 추가 -->
        <input type="hidden" id="type" name="type" value='<c:out value="${cri.type }"/>'>
        <input type="hidden" id="keyword" name="keyword" value='<c:out value="${cri.keyword }"/>'>
        <input type="hidden" id="commentNo" name="commentNo" value=''>
        <input type="hidden" id="memberId" name="memberId" value=''>
   </form><br>
    
    <hr class="clear">
    
    <div class="container">
        <div class="col-xl-12">
             <div class="section_title yeong-center">
               <button data-oper="list" class='btn btn-primary yeong-list'>List</button>
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <button data-oper="modify" class='btn btn-primary'>영화 수정</button>
                  <button data-oper="remove" class='btn btn-danger'>영화 삭제</button>
               </sec:authorize>
          </div>
       </div>
    </div>
    <div class="container">
       <div class="score_area">
          <div class="section_title yeong-star yeong-starRed" id="star_grade_total">
             <h2 class="starTotalTitle">평균 평점 </h2>
             <h2 class="total">
            </h2>
                <h2 class="yeong-allStar">
                   <fmt:formatNumber value="${totalComment}" type="pattern" pattern="0.00" />
                </h2>
            </div>
       </div>
    </div>
    
    <div class="container">
        <div class="row">
         <div class='comment_register'>
             <form id="searchForm" action="#" method="get">
             
                <span class="yeong-star yeong-starRed" id="star_grade">
                    <a href="#" class="star1">★</a>
                    <a href="#" class="star2">★</a>
                    <a href="#" class="star3">★</a>
                    <a href="#" class="star4">★</a>
                    <a href="#" class="star5">★</a>
               </span>
                    <sec:authentication property="principal" var="pinfo"/>
                       <sec:authorize access="isAuthenticated()">
                          <input class="yeong-commentInput yeong_input" type="hidden" id="memberId" name='memberId' value="${pinfo.username }">
                       </sec:authorize>
               
               <input class="yeong-commentInput yeong_input" type="hidden" id="commentStar" name='commentStar'>
                 <input class="yeong-commentInput yeong_input" type='text' id="commentContent" name='commentContent' placeholder="한줄평을 등록해주세요">
                 <button id="commentRegisterBtn" type="button" class='btn btn-primary yeong-list'>등록</button>
             </form>
          </div>
       </div>
   </div>
    
    <div class="container">
        <div class="col-xl-12">
          <table class="table table-hover">
            <thead>
               <tr>
                  <th scope="col" class="yeongth10">평점</th>
                  <th scope="col" class="yeongth10">아이디</th>
                  <th scope="col" class="yeongth60">한줄평</th>
                  <th colspan="2" scope="col" class="yeongth20" >버튼</th>
               </tr>
            </thead>
            <tbody class="chat">
            
            </tbody>
         </table>
      </div>
   </div>
   <!-- END 댓글 목록 페이징 -->
     <div class="panel-footer pagination justify-content-center">
     
     </div>
     

   <!-- Modal -->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">수정하실 내용을  입력해주세요</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <span class="yeong-star yeong-starRed" id="star_grade_modify">
                    <a href="#" class="starModify1">★</a>
                    <a href="#" class="starModify2">★</a>
                    <a href="#" class="starModify3">★</a>
                    <a href="#" class="starModify4">★</a>
                    <a href="#" class="starModify5">★</a>
               </span>
               <input class="yeong-commentInput" type="hidden" id="commentStarModify" name='commentStar'>
                 <input class="yeong-commentInput" type='text' id="commentContentModify" name='commentContent' placeholder="한줄평을  수정해주세요">
               
               <input class="yeong-commentInput" type="hidden" id="movieNo" name='movieNo'>
                 <sec:authentication property="principal" var="pinfo"/>
                       <sec:authorize access="isAuthenticated()">
                       <input class="yeong-commentInput" type="hidden" id='memberId' name='memberId' value='memberId' readonly="readonly" value="${pinfo.username }">
                    </sec:authorize>
                 <input class="yeong-commentInput" type="hidden" id="commentDate" name='commentDate' value='commentDate' readonly="readonly">
                     
            </div>
            <div class="modal-footer justify-content-center">
               <button type="button" id="modalModify" class="btn btn-primary">수정</button>
               <button type="button" data-oper="cancel" id="modalCancel"class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
         </div>
      </div>
   </div>
   
   <!-- Modal -->
    <div class="modalmodal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
   
   <script src="/resources/js/commentReply.js"></script>
   <script>
   $('#star_grade a').click(function(){
      $(this).parent().children("a").removeClass("on");
      $(this).addClass("on").prevAll("a").addClass("on");
      
      return false;
   });
   
   $('.star1').on("click",function(e){   
        $('#commentStar').val(1);
   });
   $('.star2').on("click",function(e){   
        $('#commentStar').val(2);
   });
   $('.star3').on("click",function(e){   
        $('#commentStar').val(3);
   });
   $('.star4').on("click",function(e){   
        $('#commentStar').val(4);
   });
   $('.star5').on("click",function(e){   
        $('#commentStar').val(5);
   });
   
   
   $('#star_grade_modify a').click(function(){
      $(this).parent().children("a").removeClass("on");
      $(this).addClass("on").prevAll("a").addClass("on");
      
      return false;
   });
   
   $('.starModify1').on("click",function(e){   
        $('#commentStarModify').val(1);
   });
   $('.starModify2').on("click",function(e){   
        $('#commentStarModify').val(2);
   });
   $('.starModify3').on("click",function(e){   
        $('#commentStarModify').val(3);
   });
   $('.starModify4').on("click",function(e){   
        $('#commentStarModify').val(4);
   });
   $('.starModify5').on("click",function(e){   
        $('#commentStarModify').val(5);
   });
   
   
   </script>
   <script>
      $(function(){
             
         var totalStar = '<fmt:formatNumber value="${totalComment}" type="pattern" pattern="0.00" />';
          console.log(" 평균 : " + totalStar);
          var totalStarZero = isNaN(totalStar);
          console.log(totalStarZero);
          
          var total = $(".total");
          var starZero = $(".yeong-allStar");
          var str = "";
          var zero = "";
          
          if(totalStarZero){
             str += "<h2 class='starTotalTitle yeong-starRed'></h2>";
             zero += "0";
             total.html(str);
             starZero.html(zero);
          } else if(totalStar <= 1){
             $('.starTotal1').addClass("on").prevAll("a").addClass("on");
             str += "<h2 class='starTotalTitle yeong-starRed'>★</h2>";
             total.html(str);
          } else if(totalStar > 1 && totalStar <= 2){
             $('.starTotal2').addClass("on").prevAll("a").addClass("on");
             str += "<h2 class='starTotalTitle yeong-starRed'>★★</h2>";
             total.html(str);
          } else if(totalStar > 2 && totalStar <= 3){
             $('.starTotal3').addClass("on").prevAll("a").addClass("on");
             str += "<h2 class='starTotalTitle yeong-starRed'>★★★</h2>";
             total.html(str);
          } else if(totalStar > 3 && totalStar <= 4){
             $('.starTotal4').addClass("on").prevAll("a").addClass("on");
             str += "<h2 class='starTotalTitle yeong-starRed'>★★★★</h2>";
             total.html(str);
          } else if(totalStar > 4){
             $('.starTotal5').addClass("on").prevAll("a").addClass("on");
             str += "<h2 class='starTotalTitle yeong-starRed'>★★★★★</h2>";
             total.html(str);
          } 
          
      });
      
   
       $(function(){
          var movieNo = '<c:out value="${movie.movieNo}"/>';
          
          $.getJSON("/movie/getAttachList", {movieNo: movieNo}, function(result){
             console.log(result);
             var str = "";
             
             $(result).each(function(i, attach){
                var fileCallPath = encodeURIComponent( attach.movieUploadPath + "/s_" + attach.movieUuid + "_" + attach.movieFileName);
               var originPath = attach.movieUploadPath + "\\" + attach.movieUuid + "_" + attach.movieFileName;
               originPath = originPath.replace(new RegExp(/\\/g), "/");
               
               str += "<img class='yeong_moveImg' src='/movieUpload/display?movieFileName=" + originPath + "'>"
                
             });
             $(".uploadResult ul").html(str);
          }).fail(function(xhr, status, err){
             console.log(err);
          });
          
          var operForm = $("#operForm");
          var cno = $("#commentNo");
          var mId = $("#memberId");
          
          $("button[data-oper='modify']").on("click", function (e){
             operForm.find("#memberId").remove();
             operForm.attr("action", "/movie/modify").submit();
          });
            
          $("button[data-oper='list']").on("click", function (e){
             operForm.find("#memberId").remove();
             operForm.find("#movieNo").remove();
             operForm.attr("action", "/movie/list")
             operForm.submit();
          });
          
          $("button[data-oper='remove']").on("click", function (e){
        	  if(confirm('영화를 삭제하시겠습니까?')){
	             operForm.find("#memberId").remove();
	             operForm.attr("action", "/movie/remove").submit();
        	  }
          });
          
          $(document).on("click", "#commentReport", function(e){
             var memberId = null;
             
             <sec:authorize access="isAuthenticated()">
                memberId = '<sec:authentication property="principal.username" />';
             </sec:authorize>
          
             console.log(memberId);
             if(memberId == null){
                 alert("로그인이 필요한 시스템입니다.");
                 return;
              }
             
             var cmno = $(this).data("commentno");
             console.log(cmno);
             cno.attr("value", cmno);
             operForm.attr("action", "/report/comment/register").submit();
             
          });
          
          var result = '<c:out value="${result}"/>';
            
             //result 값이 있는지 확인하는 함수 호출
            checkModal(result);
         
             //뒤로가기 할때 발생하는 오류잡기
             history.replaceState({}, null, null);
         
             //result 값이 있는지 확인하는 함수
             function checkModal(result){
              if(result === '' || history.state){
                 return;
              }
              console.log(result);
              $('#myModal').modal('show');
            }
          
         
      });
       
     
       $(function(){
          
          var movieNo = '<c:out value="${movie.movieNo}"/>'; 
          var replyUL = $(".chat");

         console.log("1?");
          showList(1);

          function showList(page){
             
             commentService.getList({movieNo : movieNo, pageNum:pageNum||1}, //페이지 번호가 없을경우 1로설정
                function(replyCnt, list){
                var str = "";
                //page번호가 -1로 전달되면 마지막페이지를 호출하게된다 
                if(pageNum == -1){
                   //Math.ceil() 소숫점 이하 올림 -> 댓글갯수에따라 페이지번호 결정
                   pageNum = Math.ceil(replyCnt/10.0);
                   showList(pageNum);
                   return;
                }
                
                //댓글목록이 없으면 replyUL의 내용을 비우고 중단
                if(list == null || list.length == 0){
                   //마지막페이지에 댓글이1개 일때 삭제하면 그전페이지로 이동
                   if(pageNum>1){
                      pageNum = pageNum - 1;
                      showList(pageNum);
                   }
                   return;
                }
                //댓글 달기
                for(var i=0, len=list.length||0; i<len; i++){
                   if(list[i].commentStar == 1){
                      list[i].commentStar = "★";
                   } else if(list[i].commentStar == 2){
                      list[i].commentStar = "★★";
                   } else if(list[i].commentStar == 3){
                      list[i].commentStar = "★★★";
                   } else if(list[i].commentStar == 4){
                      list[i].commentStar = "★★★★";
                   } else if(list[i].commentStar == 5){
                      list[i].commentStar = "★★★★★";
                   } 
                  
                   var adminId = '<c:out value="admin"/>';
                   
                   var auth = '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities}';
                   
                   var adminAuth = '<c:out value="[ROLE_ADMIN, ROLE_MEMBER]"/>';
                   var memberAuth = '<c:out value="[ROLE_MEMBER]"/>';
                   
                   console.log(auth);
                   console.log(list[i].memberId);
                   
                  str += "<tr data-commentNo='"+list[i].commentNo+"'>";
                  str += "  <td scope='row' class='yeongth10 yeong-starRed'>" + list[i].commentStar + "</td>";
                  str += "  <td class='yeongth10'>" + list[i].memberId + "</td>";
                  str += "  <td scope='col' class='yeongth60'>" + list[i].commentContent + "</td>";
                  if(auth == adminAuth){
                     str += "     <td colspan='2' class='yeongth20'>";
                     str += "        <a href='#' class='custom-blue' id='commentUpdate' data-commentNo='"+list[i].commentNo+"'>수정</a>";
                     str += "        <a href='#' id='commentDelete' class='custom-red' data-commentNo='"+list[i].commentNo+"'>삭제</a>";
                  }else if(memberId == list[i].memberId){
                     str += "     <td colspan='2' class='yeongth20'>";
                     str += "        <a href='#' class='custom-blue' id='commentUpdate' data-commentNo='"+list[i].commentNo+"'>수정</a>";
                     str += "        <a href='#' id='commentDelete' class='custom-red' data-commentNo='"+list[i].commentNo+"'>삭제</a>";
                  }else{
                     str += "    <td colspan='2' class='yeongth20'><a href='#' id='commentReport' class='custom-red' data-commentNo='"+list[i].commentNo+"'>신고</a></td>";
                  }
                  str += "</td>";
                   
                }
                replyUL.html(str);
                showReplyPage(replyCnt);
             }); //end function
             
          }//end showList
          
          var pageNum = 1;
          var replyPageFooter = $(".panel-footer");
          function showReplyPage(replyCnt){   
             //Criteria cri = new Criteria(page, 3); - 컨트롤러 댓글 페이지수조절
              var endNum = Math.ceil(pageNum / 10.0) * 10;
              var startNum = endNum - 9;
              var prev = startNum != 1;
              var next = false;
             
              if(endNum * 10 >= replyCnt) {
                 endNum = Math.ceil(replyCnt/10.0);
              }
             
              if(endNum * 10 < replyCnt) {
                 next = true;
              }
             
             var str = "<ul class='pagination'>";
             
             if(prev) {
                str += "<li class='paginate_button previous'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
             }
             
             for(var i = startNum ; i<= endNum; i++) {
                var active = pageNum == i? "active" : "";
                str += "<li class='paginate_button " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
             }
             
             if(next) {
                str += "<li class='paginate_button'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
             }
             str += "</ul></div>";
             
             console.log(str);
             replyPageFooter.html(str);
          }//End 댓글 목록 페이징
          
          replyPageFooter.on("click", "li a", function(e){
             e.preventDefault();
             console.log("page click");
             
             var targetPageNum = $(this).attr("href");
             
             pageNum = targetPageNum;
             
             showList(pageNum);
          });
          
          //새로운 댓글의 추가버튼
          var container = $(".container");
          var inputStar = container.find("input[name='commentStar']");
          var inputContent = container.find("input[name='commentContent']");
          var inputMemberId = container.find("input[name='memberId']");
          
          
          
          //모달창
          var modal = $(".modal");
          var modalInputStar = modal.find("input[name='commentStar']");
          var modalInputContent = modal.find("input[name='commentContent']");
          var modalcommentDate = modal.find("input[name='commentDate']");
          var modalmemberId = modal.find("input[name='memberId']");
          var modalmovieNo = modal.find("input[name='movieNo']");
          
          var modalModify = $("#modalModify");
          
          
          var commentDelete = $("#commentDelete");
          var commentRegisterBtn = $("#commentRegisterBtn");
       
          
          var memberId = null; //로그인한 아이디
          
          <sec:authorize access="isAuthenticated()">
             memberId = '<sec:authentication property="principal.username" />';
          </sec:authorize>
          
          var csrfHeaderName = "${_csrf.headerName}";   //CSRF 토큰 관련 변수 추가
          var csrfTokenValue = "${_csrf.token}";   //CSRF
          
          //beforeSend 대신 사용
          $(document).ajaxSend(function(e, xhr, options){   //전송 전 추가 헤더 설정
             xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
          });
   
          commentRegisterBtn.on("click", function(e){
             var commentStar = $('#commentStar').val();
              var commentContent = $('#commentContent').val();
              
              if(memberId == null){
                 alert("로그인이 필요한 시스템입니다.");
                 return;
              } else if( commentStar == "" || commentStar.length < 0){
                 alert('별점을 선택해주세요');
                 $('#commentStar').focus();
                 return;
             } else if( commentContent == "" || commentContent.length < 0){
                alert('한줄평을 입력해주세요');
                 $('#commentContent').focus();
                return;
             } else if(commentContent.length > 50){
                alert('한줄평을 50자 이내로 입력해주세요');
                $('#commentContent').val("");
                 $('#commentContent').focus();
                return;
             } else{
                  var comment = {
                        commentStar : inputStar.val(),
                        commentContent : inputContent.val(),
                        movieNo : movieNo,
                        memberId : inputMemberId.val()
                  };
                  commentService.add(comment, function(result){
                     if(result == "success"){
                        alert("한줄평이 등록되었습니다.");
                     } else if(result == "already"){
                        alert("이미 해당 영화에 대한 한줄평을 작성했습니다.");
                     }
                     inputStar.val("");
                     inputContent.val("");
                     $(".star1").parent().children("a").removeClass("on"); // 등록하면 별점 초기화
                     location.reload();
                     pageNum = 1;         // 등록할때 페이지번호가 1로 가게할려고
                     showList(pageNum);
                  });
             }
           });
          
          $(document).on("click", "#commentUpdate", function(e){
              
             commentService.get($(this).data("commentno"), function(data){      //rno값 보낸다

                   if(data.commentStar == 1){
                      $('.starModify1').addClass("on").prevAll("a").addClass("on");
                } else if(data.commentStar == 2){
                   $('.starModify2').addClass("on").prevAll("a").addClass("on");
                } else if(data.commentStar == 3){
                   $('.starModify3').addClass("on").prevAll("a").addClass("on");
                } else if(data.commentStar == 4){
                   $('.starModify4').addClass("on").prevAll("a").addClass("on");
                } else if(data.commentStar == 5){
                   $('.starModify5').addClass("on").prevAll("a").addClass("on");
                } 
                   
                   modal.data("commentNo", data.commentNo);
                   
                 modalInputStar.val(data.commentStar);      
                 modalInputContent.val(data.commentContent);
                 modalmemberId.val(data.memberId);
                 modalcommentDate.val(data.commentDate);   
                 modalmovieNo.val(data.movieNo);   
                
                $('#exampleModal').modal('show');
                   
             }, function(err){
                console.log(err);
             });
           });
          
          
            //댓글 수정 버튼 이벤트 처리 - 동적이게 처리할필요없음 .on("click"
           $(document).on("click", "#modalModify", function(e){

              console.log(modal.data('commentNo'));
              var commentStarModify = $('#commentStarModify').val();
              var commentContentModify = $('#commentContentModify').val();
              
              if( commentStarModify == "" || commentStarModify.length < 0){
                 alert('별점을 선택해주세요');
                 $('#commentStarModify').focus();
                 return;
             } else if( commentContentModify == "" || commentContentModify.length < 0){
                alert('한줄평을 입력해주세요');
                 $('#commentContentModify').focus();
                return;
             } else if(commentContentModify.length > 50){
                alert('한줄평을 50자 이내로 입력해주세요');
                $('#commentContentModify').val("");
                 $('#commentContentModify').focus();
                return;
             } 
              
              commentService.update({
                 commentNo : modal.data('commentNo'),
                 commentStar : modalInputStar.val(),
                   commentContent : modalInputContent.val()
                
             }, function(result){
                alert("수정완료");
                
                modal.modal("hide");         
                  showList(pageNum);
                
             }, function(err){
                console.log(err);
             });
           });
           //END 수정 버튼 이벤트 처리
           
           
            $(document).on("click", "#commentDelete", function(e){
               var commentNo = $(this).data('commentno');
               console.log(commentNo);
               
               e.preventDefault();
               
                 if(!memberId){
                      // 로그인하지 않은 경우
                      alert('로그인 후 삭제가 가능합니다.');
                      return ;
                   }
                   var originalReplyer = inputMemberId.val();
                   console.log(originalReplyer);
                   console.log(memberId);
   
                   console.log(originalReplyer + " + " + memberId);
                   
                   if(memberId != originalReplyer){
                      // 자신의 댓글이 아닌 경우
                      alert('자신의 댓글만 삭제 가능합니다.');
                      return ;
                   }
                   
                   if(confirm('삭제하시겠습니까?')){
	                   commentService.remove(commentNo, originalReplyer, function(result){
	                	   if(result == 'success'){
	                		   alert('한줄평이 삭제되었습니다.');
	                		   location.reload();
	                	   }
	                   });
                   }
            });
           
           
          
       });
      </script>
   
   
   
<%@ include file="../include/footer.jsp" %>