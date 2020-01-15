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
                    <h3>영화 상세보기</h3>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        
    	<div class="movie-container-left">
		    <img class="yeong_moveImg" src="img/instragram/3.jpg" alt="">
		</div>
		<div class="movie-container-right">
			<h3>명량</h3>
	        <hr>
			<h4>감독 <span>dddddd</span> </h4>
			<h4>배우</h4>
			<h4>장르</h4>
			<h4>러닝타임</h4>
			<h4>예매율</h4>
			<h4>개봉일</h4>
			<h4>줄거리</h4>
		</div>
    </div>
    
    <hr class="clear">
    
    <div class="container">
        <div class="col-xl-12">
             <div class="section_title yeong-center">
		   		<button class='btn btn-primary yeong-list'>List</button>
		   		<button class='btn btn-primary'>영화 수정</button>
		   		<button class='btn btn-danger'>영화 삭제</button>
    		</div>
    	</div>
    </div>
    <div class="container">
	    <div class="score_area">
	    	<div class="section_title">
                    <h2 class="yeong-allStar">전체 평점 : ★★★★★ (100%) </h2>
            </div>
	    </div>
    </div>
    <div class="container">
        <div class="row">
			<div class='comment_register'>
			    <form id="searchForm" action="#" method="get">
			       <span class="yeong-star">☆☆☆☆☆</span>
			       <input class="yeong-commentInput yeong_input" type='text' name='content' value="한줄평을 등록해주세요">
			       <button class='btn btn-primary yeong-list'>등록</button>
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
						<th colspan="2" scope="col" class="yeongth20">버튼</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" class="yeongth10">☆☆☆☆☆</th>
						<td class="yeongth10">dudwn8034</td>
						<th scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</th>
						<td colspan="2" class="yeongth20"><a class="custom-red" href="#">신고</a></td>
					</tr>
				    <tr>
						<th scope="row" class="yeongth10">☆</th>
						<td class="yeongth10">dudwn</td>
						<th scope="col" class="yeongth60">한줄평</th>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정  </a>
						<a class="custom-red" href="#">삭제</a></td>
				    </tr>
				    <tr>
				        <th scope="row" class="yeongth10">3</th>
				        <td class="yeongth10">dudwn8034ssss</td>
						<th scope="col" class="yeongth60">한줄평</th>
						<td colspan="2" class="yeongth20"><a class="custom-red" href="#">신고</a></td>
				    </tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<!-- 페이징 -->
	<div class="pagination justify-content-center">
       <ul class="pagination">
	       <li class="paginate_button previous">
	          <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">1</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">2</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">3</a></li>
	       <li class="paginate_button next">
	          <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
       </ul>
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
			       <span>☆☆☆☆☆</span>
			       <input class="yeong-commentInput" type='text' name='content' value="한줄평을 등록해주세요">
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
<%@ include file="../include/footer.jsp" %>