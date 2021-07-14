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
	<div class="container">
		<h1>Hello world!</h1>

		<P>The time on the server is ${serverTime}.</P>
		<!-- <p><a href="/board/list">게시물 목록</a></p> -->
		<p>
			<a href="/board/listPageSearch?num=1">リスト</a>
		</p>
		<p>
			<a href="/board/write">掲示物作成</a>
		</p>

		<c:if test="${member == null}">
			<form method="post" action="/member/login">
				
				<div>
					<label class="sr-only">ID</label> <input type="text" name="userId" class="form-control" placeholder="id" required />

				</div>
				<div>
					<label class="sr-only">Password</label> <input type="password" name="userPass"   class="form-control" placeholder="Password" required/>
				</div>
				<div>
					<button type="submit" class="btn btn-success btn-block">ログイン</button>
				</div>
				<div>
					<a href="/member/register" class="btn btn-warning btn-block" >社員登録</a>
				</div>
			</form>
		</c:if>
		<c:if test="${msg==false}">
			<p style="color: #f00">ログイン情報を確認してください。</p>

		</c:if>
	</div>
</body>
</html>
