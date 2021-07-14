<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
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
		<div id="nav" style="margin-bottom:50px">
			<%@ include file="../include/nav.jsp"%>
		</div>
		<form method="post" class="form-horizontal">
			<div class="form-group">
				<label class="control-label">タイトル</label> <input type="text"
					name="title" value="${view.title }" class="form-control" />
			</div>
			<div class="form-group">
				<label class="control-label">作成者</label> <input type="text"
					name="writer" value="${view.writer }" class="form-control" />
			</div>
			<div class="form-group">
				<label class="control-label">内容</label><br />
				<textarea rows="5" cols="50" name="content" class="form-control">${view.content }</textarea>
			</div>

			<button type="submit" class="btn btn-success">完了</button>
		</form>
	</div>
</body>
</html>