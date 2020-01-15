<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="custom-container">
        <div class="row custom-mobile">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">기프티콘</h3>
                </div>
                <a href="/mtms/giftReg.html" class="btn btn-primary btn-sm">등록</a>
                <!--search-start-->
                <div class="pull-right">
                    <input type="text" placeholder="검색어를 입력하세요" class="input-group-btn ">
                    <button type="submit" class="btn btn-primary btn-sm">검색</button>
                </div>
                <!--search-end-->
                <!--first-line-s-->
                <div class="container">
                    <div class="custom-gift-divide-border">
                        <h4 class="custom-divide">팝콘</h4>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/popcorn.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">달콤팝콘(M)</a></h3>
                                    <div class="price"> 5,500원</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/popcorn2.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">고소팝콘(M)</a></h3>
                                    <div class="price">4,500원</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-2" src="/mtms/img/popcorn3.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">카라멜&치즈팝콘(L)</a></h3>
                                    <div class="price">6,000원</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/popcorn4.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">바질어니언팝콘(L)</a></h3>
                                    <div class="price">6,000원</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--first-line-e-->
                <!--second-line-s-->
                <div class="container">
                    <br>
                    <div class="custom-gift-divide-border">
                        <h4 class="custom-divide">음료</h4>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/soda.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">탄산음료(M)</a></h3>
                                    <div class="price"> 2,200원</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/americano.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">아메리카노(ICE)</a></h3>
                                    <div class="price">4,500원</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/icetea.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">아이스티(M)</a></h3>
                                    <div class="price">3,500원</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid9">
                                <div class="product-image9">
                                    <a href="#">
                                        <img class="pic-1" src="/mtms/img/orange.jpg">
                                    </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">오렌지에이드(M)</a></h3>
                                    <div class="price">3,500원</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--second-line-e-->
            </div>
        </div>
    </div>
</section>
<!--board-end-->

<%@include file="../include/footer.jsp" %> 