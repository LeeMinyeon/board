<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<form method="post" action="/member/modify">
	<div>
		<label>ID</label>
		<input type="text" name="userId" value="${member.userId}" readonly>
	</div>
	<div>
		<label>Name</label>
		<input type="text" name="userName" value="${member.userName}" >
	</div>
	<div>
		<label>新パスワード</label>
		<input type="password" name="userPass" >
	</div>

	<div>
		<button type="submit" class="btn btn-success">修正完了</button>
	</div>
	<div>
		<a href="/member/delete">社員脱会</a>
		<a href="/">ホームへ</a>
	</div>
</form>
</body>
</html>