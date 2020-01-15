<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>


<div class="container">
    	<div class="mycomment-left">
		    <h3 class="mb-20">마이페이지</h3>
			<div class="">
				<ul class="unordered-list">
					<li class="yeong-myfont">내 정보 조회</li>
					<li class="yeong-myfont">예매 내역</li>
					<li class="yeong-myfont">내 리뷰</li>
					<li class="custom-active yeong-myfont">내 한줄평</li>
					<li class="yeong-myfont">내 기프티콘</li>
					<li class="yeong-myfont">내 건의사항</li>
				</ul>
			</div>
		</div>
		<div class="mycomment-left-right">
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
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
				    <tr>
						<td scope="row" class="yeongth10">☆</td>
						<td class="yeongth10">dudwn</td>
						<td scope="col" class="yeongth60">한줄평</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
				    </tr>
				    <tr>
				        <td scope="row" class="yeongth10">3</td>
				        <td class="yeongth10">dudwn8034ssss</td>
						<td scope="col" class="yeongth60">한줄평</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
				    </tr>
				    <tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
					<tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
					<tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
					<tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
					<tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
					<tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
					<tr>
						<td scope="row" class="yeongth10">☆☆☆☆☆</td>
						<td class="yeongth10">dudwn8034</td>
						<td scope="col" class="yeongth60">아아아아아안ㅁ아ㅓㄴ호차ㅣ뉴판웇하ㅓ눜/퓨위츈머ㅏ.ㅠㅏㅓㅍㄹㅇ퓨ㅓㄴ.ㅋ</td>
						<td colspan="2" class="yeongth20"><a class="custom-blue" id="update" href="#">수정</a>
						<a class="custom-red" href="#">삭제</a></td>
					</tr>
				</tbody>
			</table>
		</div>
    </div>
	
	<!-- 페이징 -->
	<div class="pagination justify-content-center clear">
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
			       <input class="comment_register_input" type='text' name='content' value="한줄평을 등록해주세요">
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
<%@ include file="../include/footer.jsp" %>