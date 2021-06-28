<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>

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
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<!-- <p><a href="/board/list">게시물 목록</a></p> -->
	<p>
		<a href="/board/listPageSearch?num=1">게시물 목록</a>
	</p>
	<p>
		<a href="/board/write">게시물 작성</a>
	</p>

	<c:if test="${member == null}">
		<form method="post" action="/member/login">
			<div>
				<label>ID</label> <input type="text" name="userId" />

			</div>
			<div>
				<label>Password</label> <input type="password" name="userPass" />
			</div>
			<div>
				<button type="submit" class="btn btn-success">로그인</button>
			</div>
			<div>
				<a href="/member/register" class="btn btn-warning">회원가입</a>
			</div>
		</form>
	</c:if>
	<c:if test="${msg==false}">
		<p style="color: #f00">로그인 정보를 확인후 다시 로그인해주세요</p>
		
	</c:if>
</body>
</html>
