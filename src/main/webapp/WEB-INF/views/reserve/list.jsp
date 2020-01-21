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
			<div class="col-md-9">
								<div class="hanna_container" style="padding-left : 0px; padding-right : 5px; padding-top : 50px;">
									<div class="hanna_table">
										<div class="table-head">
											<div class="hanna_movie">영화명</div>
											<div class="hanna_reserveNo">예매번호</div>
											<div class="hanna_reserveTime">관람일시</div>
											<div class="hanna_reserveSeat">관람좌석</div>
											<div class="hanna_reserveStatus">현재상태</div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
										<div class="table-row">
											<div class="hanna_movie">겨울왕국2</div>
											<div class="hanna_reserveNo">2020-0101-0111-0101</div>
											<div class="hanna_reserveTime">2020.01.01 19:00</div>
											<div class="hanna_reserveSeat">B1, B2</div>
											<div class="hanna_reserveStatus"><button>리뷰작성</button></div>
										</div>
									</div>
									<hr>
									<!-- PAGING -->
									<nav class="blog-pagination justify-content-center d-flex">
			                            <ul class="pagination">
			                                <li class="page-item">
			                                    <a href="#" class="page-link" aria-label="Previous">
			                                        <i class="ti-angle-left"></i>
			                                    </a>
			                                </li>
			                                <li class="page-item">
			                                    <a href="#" class="page-link">1</a>
			                                </li>
			                                <li class="page-item active">
			                                    <a href="#" class="page-link">2</a>
			                                </li>
			                                <li class="page-item">
			                                    <a href="#" class="page-link" aria-label="Next">
			                                        <i class="ti-angle-right"></i>
			                                    </a>
			                                </li>
			                            </ul>
			                        </nav> <!-- END PAGING -->
								</div> <!-- END 내 예매내역 -->
							</div>
						</div>
					</div>
				</div>	<!-- End Align Area -->
			</div> 
			

<%@ include file="../include/footer.jsp"%>
