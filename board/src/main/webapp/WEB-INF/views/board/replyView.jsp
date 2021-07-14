<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
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
	<form name="replyView" method="post">
		<div>
			<p>
				<label>コメント作成者</label><input type="text" name="writer"
					class="form-control" value="${replyView.writer }" readonly>
			</p>
			<p>
				<textarea rows="5" cols="50" name="content" class="form-control">${replyView.content}</textarea>
			</p>

			<p>
				<input type="hidden" name="rno" value="${replyView.rno }"> <input
					type="hidden" name="bno" value="${replyView.bno }">
				<button type="button" class="update btn btn-success">修正完了</button>
			</p>
		</div>
	</form>
</body>
<script type="text/javascript">
	const replyView = document.forms.replyView;
	const close = document.querySelector(".update");
	const bno = document.getElementsByName("bno")[0].value;

	function handleClose() {
		replyView.action = "/reply/modify";
		replyView.submit();

		opener.parent.location.reload();

	}
	close.addEventListener("click", handleClose);
</script>
</html>