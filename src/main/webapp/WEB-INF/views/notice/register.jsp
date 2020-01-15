<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>

<!--board-start-->
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">공지사항 등록</h3>
                </div>
                <div class="form-group">
                    <label>제목</label>
                    <input class="form-control" name="title">
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea class="form-control" rows="3" name="content"></textarea>
                </div>
                <hr>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary btn-sm">등록</button>
                    <button type="submit" class="btn btn-secondary btn-sm">취소</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!--board-end-->

<%@include file="../include/footer.jsp" %>