<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">습득물</div>
		
	</div>
	<div class="title_under"></div>
	<!-- 검색 조건 및 키워드 입력 부분 -->
	<div class="row">
		<div class="col-lg-12">
			<!--                 		<form id="searchForm" action="/board/list"> -->
			<select name='type' id="select_box">
				<%--                 				<c:set var="type" value="${pageMaker.cri.type}"/> --%>
				<option value="">제목</option>
				<option value="">내용</option>
				<option value="">아이디</option>
<%-- 				<option value="T" <c:out value="${type == 'T'?'selected':''}"/>제목</option> --%>
<%-- 				<option value="C" <c:out value="${type == 'C'?'selected':''}"/>내용</option> --%>
<%-- 				<option value="W" <c:out value="${type == 'W'?'selected':''}"/>작성자</option> --%>
			</select> 
			<input type="text" name="keyword" id="keyword"
				value="${pageMaker.cri.keyword}">
			 <button id="modalRegisterBtn" class="btn btn-primary">검색</button>
		</div>
		       </div>
		       
		       <!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <span class="button_position">
	 <button id="reviewModify" class="btn btn-primary">등록</button>
	</span>
	 </div>
<!-- 	END 버튼위치 style -->
		<div class="table_position">
		  <table class="table table-striped table-bordered table-hover">	   
                    <thead>
                        <tr>
                            <th>글번호<!-- Rendering engine --></th>
                            <th>제목<!-- Browser --></th>
                            <th>등록일<!-- Platform(s) --></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                    </tbody>
                </table><!-- END 게시물 출력 테이블 -->
          </div>
<!--           table_position -->
<!-- 페이징 부분 -->
	<ul class="pagination">
		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item active"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>
		<li class="page-item"><a class="page-link" href="#">5</a></li>
		<li class="page-item"><a class="page-link" href="#">6</a></li>
		<li class="page-item"><a class="page-link" href="#">7</a></li>
		<li class="page-item"><a class="page-link" href="#">8</a></li>
		<li class="page-item"><a class="page-link" href="#">9</a></li>
		<li class="page-item"><a class="page-link" href="#">10</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
	<!-- 페이징 end -->
    </div>
		<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>