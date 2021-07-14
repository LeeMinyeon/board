<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
	<form method="post" action="/member/delete">
	<c:if test="${ msg==false}">
		<p style="color: #f00">パスワードを確認して入力してっください。</p>
	</c:if>
		<div>
			<input type="hidden" name="userId" value="${member.userId }">
			<p>パスワードを入力してください。</p>
			<input type="password" name="userPass">
		</div>
		<div>
			<button type="submit">社員脱会</button>
		</div>
	</form>
</body>
</html>