<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container custom-mobile">
        <div class="custom-gift-divide-border">
            <h3 class="custom-font-bold"><input class="giftName" value="${gift.giftName}"/></h3>
        </div>
        <div class="section-top-border">
            <div class="row">
                <div class="col-md-3">
                    <img src="/resources/img/popcorn.jpg" alt="" class="img-fluid">
                </div>
                <div class="col-md-9 mt-sm-20">
                	<div class="form-group">
						<label>No.</label> <span name="giftNo"><c:out value="${gift.giftNo}"/> </span>
					</div>
					<div class="form-group">
						<label>가격 : </label> <input name="giftPrice" class="giftPrice" value="${gift.giftPrice}">
					</div>					
                    <div class="form-group">
						<label>구성 : </label> <span name="giftSet"><c:out value="${gift.giftSet}"/></span>
					</div>
                    <div class="qty mt-5">
                        <span class="minus bg-dark">-</span>
                        <input type="number" class="num-count" name="qty" value="1">
                        <span class="plus bg-dark">+</span>
                        <span class="custom-price"><input name="totalPrice" class="totalPrice" value="5500"/></span>
					</div>
                    </div>
                </div>
            </div>
            <div class="custom-divide-border-top">
                <span class="custom-pull-right"><label>총 구매금액 </label>&emsp; : &emsp;<input name="totalPrice" class="totalPrice" value="5500"/></span><br><br>
            </div>
            <div class="">
                <button type="submit" class="btn btn-primary float-left custom-button-gift">LIST</button>
                <button type="submit" class="btn btn-danger float-right custom-button-gift">삭제</button>
                <button type="submit" class="btn btn-primary float-right custom-button-gift">수정</button>
                <button type="button" id="payment" class="btn btn-primary float-right custom-button-gift">구입</button>
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
            $('.totalPrice').val(parseInt($('.giftPrice').val() * $('.num-count').val()));
            
        });
        $(document).on('click', '.minus', function () {
            $('.num-count').val(parseInt($('.num-count').val()) - 1);
            $('.totalPrice').val(parseInt($('.totalPrice').val() - $('.giftPrice').val()));
            if ($('.num-count').val() == 0) {
                $('.num-count').val(1);
                alert("0 이하는 불가능");
                $('.totalPrice').val(parseInt($('.giftPrice').val() * 1));
            }
        });
    });
    
    //결제
	$("#payment").click(function () {

		var IMP = window.IMP; // 생략가능
		IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용


		IMP.request_pay({
			pg: 'inicis', // version 1.1.0부터 지원.
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime()+30,
			name: $('.giftName').val(),
			amount: $('.totalPrice').val(),
			buyer_email: 'iamport@siot.do',
			buyer_name: '박진주',
			buyer_tel: '010-6626-2818',
			buyer_addr: '서울특별시 강남구 삼성동',
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>

