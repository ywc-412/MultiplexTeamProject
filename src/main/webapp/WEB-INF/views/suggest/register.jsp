<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<body>
<section id="tabs" class="project-tab">
		<div class="container">
			<div class="row custom-mobile">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">건의사항 등록</h3>
					</div>
					<div class="form-group">
						<div class="primary-checkbox float-left custom-margin-sg-reg">
							<input type="checkbox" id="primary-checkbox" checked>
							<label for="primary-checkbox"></label>
						</div>
						<div class="float-left custom-margin-sg-reg">
							비밀글
						</div>
					<div class="float-left">
						<input class="form-control custom-sg-pw-input" name="title">
					</div>
					</div><br>
					<div class="form-group">
						<label class="float-left">제목</label>
						<p class="float-right">2020.01.14</p>
						<p class="float-right custom-margin-suggest">작성자 : ywc412</p>
						<input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="20" name="content"></textarea>
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
</body>
<%@ include file="../include/footer.jsp" %>