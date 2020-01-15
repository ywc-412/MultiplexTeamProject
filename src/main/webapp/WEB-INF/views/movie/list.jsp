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
				<a href="#" class="btn btn-primary">영화등록</a>
			</div>
		
			<div class='movie_search'>
			    <form id="searchForm" action="/movie/list" method="get">
			       <select name='type' class="yeong_select">
			             <option>제목</option>
			             <option>영주</option>
			       </select>
			       <input class="yeong_input" type='text' name='keyword' value="검색어를 입력해주세요">
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
		    <div class="movie_area">
		        <div class="single_movie">
		            <img class="yeong_moveImg" src="/resources/img/instragram/1.jpg" alt="">
		            <div class="ovrer">
		              	<a href="#">
		                  	  백두산
		                </a>
		            </div>
		        </div>
		        <div class="single_movie">
		            <img class="yeong_moveImg" src="/resources/img/instragram/2.jpg" alt="">
		            <div class="ovrer">
		                <a href="#">
		                  	  겨울왕국 2
		                </a>
		            </div>
		        </div>
		        <div class="single_movie">
		            <img class="yeong_moveImg" src="/resources/img/instragram/3.jpg" alt="">
		            <div class="ovrer">
		                <a href="#">
		                  	  명량
		                </a>
		            </div>
		        </div>
		        <div class="single_movie">
		            <img class="yeong_moveImg" src="/resources/img/instragram/4.jpg" alt="">
		            <div class="ovrer">
		                <a href="#">
		                  	  조커
		                </a>
		            </div>
		        </div>
		        <div class="single_movie">
		            <img class="yeong_moveImg" src="/resources/img/instragram/5.jpg" alt="">
		            <div class="ovrer">
		                <a href="#">
		                  	  극한직업
		                </a>
		            </div>
		        </div>
		        <div class="single_movie">
		            <img class="yeong_moveImg" src="/resources/img/instragram/6.jpg" alt="">
		            <div class="ovrer">
		                <a href="#">
		                  	  미드웨이
		                </a>
		            </div>
		        </div>
		    </div>
    	</div>
    </div>
    <!-- 무비사진 -->
	
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
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">4</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">5</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">6</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">7</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">8</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">9</a></li>
	       <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	          <a class="page-link" href="#">10</a></li>
	       
	       <li class="paginate_button next">
	          <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
       </ul>
    </div>
	
	
	
	
<%@ include file="../include/footer.jsp" %>