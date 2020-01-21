<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="custom-gift-divide-border">
            <h3 class="custom-font-bold">카라멜팝콘</h3>
            ${mygift}
        </div>
        <div class="section-top-border">
            <div class="row">
                <div class="col-md-3">
                    <img src="/mtms/img/popcorn.jpg" alt="" class="img-fluid">
                </div>
                <div class="col-md-9 mt-sm-20">
                    <p>금액 : 6,000원</p>
                    <p>구성 : 카라멜팝콘</p>
                    <p>구입일자 : 2020.01.13</p>
                    <p>만료일자 : 2020.02.12</p>
                </div>
            </div>
            <div class="custom-gift-divide-border"></div>
            <div class="">
                <br>
                <button type="submit" class="btn btn-primary float-right custom-button-gift">기간연장</button>
                <button type="submit" class="btn btn-primary float-right custom-button-gift">환불</button>
                <button type="submit" class="btn btn-primary float-right custom-button-gift">닫기</button>
            </div>
        </div>
    </div>
</section>
<!--board-end-->

<%@include file="../include/footer.jsp" %>