<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href="/";
	</script>
</body>
</html>