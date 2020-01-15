<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container custom-mobile">
        <div class="custom-gift-divide-border">
            <h3 class="custom-font-bold">카라멜팝콘 (M)</h3>
        </div>
        <div class="section-top-border">
            <div class="row">
                <div class="col-md-3">
                    <img src="/mtms/img/popcorn.jpg" alt="" class="img-fluid">
                </div>
                <div class="col-md-9 mt-sm-20">
                    <p>가격 : 6,000원</p>
                    <p>구성 : 카라멜팝콘</p>
                    <div class="qty mt-5">
                        <span class="minus bg-dark">-</span>
                        <input type="number" class="num-count" name="qty" value="1">
                        <span class="plus bg-dark">+</span>
                        <span class="custom-price">6,000원</span>
                    </div>
                </div>
            </div>
            <div class="custom-divide-border-top">
                <span class="custom-pull-right">총 구매금액 &emsp; : &emsp; 6,000원</span><br><br>
            </div>
            <div class="">
                <button type="submit" class="btn btn-primary float-left custom-button-gift">LIST</button>
                <button type="submit" class="btn btn-danger float-right custom-button-gift">삭제</button>
                <button type="submit" class="btn btn-primary float-right custom-button-gift">수정</button>
                <button type="submit" class="btn btn-primary float-right custom-button-gift">구입</button>
            </div>
        </div>
    </div>
</section>
<!--board-end-->

<%@include file="../include/footer.jsp" %> 
<script>
    //기프티콘 수량 변경
    $(document).ready(function () {
        $('.num-count').prop('disabled', true);
        $(document).on('click', '.plus', function () {
            $('.num-count').val(parseInt($('.num-count').val()) + 1);
        });
        $(document).on('click', '.minus', function () {
            $('.num-count').val(parseInt($('.num-count').val()) - 1);
            if ($('.num-count').val() == 0) {
                $('.num-count').val(1);
            }
        });
    });
</script>

