<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
	<section id="tabs" class="project-tab">
		<div class="container">
			<!--<div class="row">-->
			<div class="row no-mean">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">공지사항</h3>
					</div>
					<div class="custom-search-position">
						<!--추가-->
						<a href="/mtms/noticeReg.html" class="btn btn-primary btn-sm">등록</a>
						<!--search-start-->
						<div class="pull-right">
							<input type="text" placeholder="검색어를 입력하세요"
								class="input-group-btn ">
							<button type="submit" class="btn btn-primary btn-sm">검색</button>
						</div>
						<!--search-end-->
						<div class="tab-content" id="nav-tabContent">
							<!--<table class="table">-->
							<table class="table custom-th-size">
								<!--<thead>-->
								<tr>
									<!--<th>-->
									<th style="width: 100px;">번호</th>
									<th>제목</th>
									<th>등록일</th>
								</tr>
								<!--</thead>-->
								<tbody>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2019 문화주간 관련 안내</a></td>
										<td>2019.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
									<tr>
										<td>1</td>
										<td><a href="/mtms/noticeGet.html">2020 문화주간 관련 안내</a></td>
										<td>2020.01.10</td>
									</tr>
								</tbody>
							</table>
							<!--paging-start-->
							<div class="custom-pagination">
								<nav aria-label="Page navigation example">
									<!--<ul class="blog-pagination">-->
									<ul class="blog-pagination text-center custom-th-size2">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">4</a></li>
										<li class="page-item"><a class="page-link" href="#">5</a></li>
										<li class="page-item"><a class="page-link" href="#">6</a></li>
										<li class="page-item"><a class="page-link" href="#">7</a></li>
										<li class="page-item"><a class="page-link" href="#">8</a></li>
										<li class="page-item"><a class="page-link" href="#">9</a></li>
										<li class="page-item"><a class="page-link" href="#">10</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
							<!--paging-end-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--board-end-->
	
<%@include file="../include/footer.jsp" %>