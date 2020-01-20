<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="custom-gift-divide-border">
            <h3 class="custom-pay-font-bold">결제완료</h3>
        </div>
        <div class="section-top-border">
            <div class="row">
                <div class="col-md-3">
                    <img src="/mtms/img/popcorn.jpg" alt="" class="img-fluid">
                </div>
                <div class="col-md-9 mt-sm-20">
                <c:out value="${gift.giftPrice}" />
                    <p>품목 : <c:out value="${gift.giftName}" /></p>
                    <p>금액 : <c:out value="${gift.giftPrice}" /></p>
                    <p>구성 : <c:out value="${gift.giftSet}" /></p>
                    <p>구입일자 : 2020.01.13</p>
                    <p>만료일자 : 2020.02.12</p>
                </div>
            </div>
            <div class="custom-gift-divide-border"></div>
        </div>
    </div>
</section>
<!--board-end-->

<%@include file="../include/footer.jsp" %>