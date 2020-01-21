<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row">
			
			<!-- 마이페이지 인클루드....start -- row 밑에서 include-->
				<%@ include file="../include/myPageMenu.jsp"%>
			<!-- 마이페이지 인클루드....end -->
			
			<!-- 내 예매 내역 -->
				<div class="hanna_container" id="nav-tabContent">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>영화명</th>
                            <th>예매번호</th>
                            <th>관람일시</th>
                            <th>관람좌석</th>
                            <th>현재상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>겨울왕국2</td>
                            <td>2020-0101-0101-0101</td>
                            <td>2020.01.10 19:00</td>
                            <td>'A1', 'A2'</td>
                            <td><button>리뷰작성</button></td>
                        </tr>
                        <tr>
                            <td>겨울왕국3</td>
                            <td>2020-0101-0101-0101</td>
                            <td>2020.01.10 19:00</td>
                            <td>'A1', 'A2'</td>
                            <td><button>리뷰작성</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="custom-gift-pagination custom-th-size2">
                    <div class="custom-pagination">
                        <nav aria-label="Page navigation example">
                            <ul class="blog-pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
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
	                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
               </div>
              </div>
             </div>
            </div>
			

<%@ include file="../include/footer.jsp"%>
