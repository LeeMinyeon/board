<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시물 작성</title>
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
		<div id="nav">
			<%@ include file="../include/nav.jsp"%>
		</div>

		<h2 style="margin: 30px;">${view.title }</h2>

		<label class="col-sm-2 control-label">タイトル</label>
		<p>${view.title }</p>
		<br /> <label class="col-sm-2 control-label">作成者</label>
		<p>${view.writer }</p>
		<br /> <label class="col-sm-2 control-label">内容</label><br />
		<p style="margin: 20px">${view.content}<br />
		<div style="margin: 35px 13px">

			<a href="/board/modify?bno=${view.bno}" class="btn btn-warning"
				style="margin-right: 10px">修正</a><a
				href="/board/delete?bno=${view.bno} " class="btn btn-danger"> 削除</a>
		</div>

		<!-- 댓글  -->
		<hr />
		<div>
			<ul>
				<!-- <li>
				<div>
					<p>첫번째 댓글 작성자</p>
					<p>첫번째 댓글</p>
				</div>
			</li>
			<li>
				<div>
					<p>두번째 댓글 작성자</p>
					<p>두번째 댓글</p>
				</div>
			</li>
			<li>
				<div>
					<p>세번째 댓글 작성자</p>
					<p>세번째 댓글</p>
				</div>
			</li> -->
				<c:forEach items="${reply}" var="reply">
					<li>
						<div>
							<p>${reply.writer }
								(
								<fmt:formatDate value="${reply.regDate }" pattern="yyyy-MM-dd" />
								)
							</p>
							<p>${reply.content }</p>
							<!--<a href="/reply/modify?rno=${reply.rno}">댓글 수정</a>-->
							<input type="hidden" name="bno" value="${reply.bno }">
							<button type="button"
								class="replyModifyBtn btn btn-warning btn-xs"
								value="${reply.rno}">修正</button>
							<button type="button"
								class="replyDeleteBtn btn btn-danger btn-xs"
								value="${reply.rno}">削除</button>

							<!--<a href="/reply/delete?rno=${reply.rno}&bno=${reply.bno}">삭제</a>-->
						</div>
					</li>

				</c:forEach>
			</ul>
		</div>
		<div>
			<form method="post" action="/reply/write" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 text-center">作成者</label>
					<div class="col-sm-8">
						<input type="text" name="writer" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 text-center">内容</label>
					<div class="col-sm-8">
						<textarea rows="5" cols="50" name="content" class="form-control"></textarea>
					</div>

				</div>
				<div class="form-group">
					<input type="hidden" name="bno" value="${view.bno }">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success ">登録</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	const select = document.querySelector(".replyModifyBtn");
	const remove = document.querySelector(".replyDeleteBtn");
	const bno = document.getElementsByName("bno")[0].value;
	function handleSelect() {
		const rno = select.value;
		window
				.open(
						'/reply/select?rno=' + rno,
						'',
						'location=no, directories=no, resizable=no, status=no, toolbar=no, menubar=no, width=570, height=400, left=0, top=0, scrollbars=no');
	}
	function handleRemove() {
		const rno = remove.value;
		const link = "/reply/delete?rno=" + rno + "&bno=" + bno;
		location.href = link;

	}
	select.addEventListener("click", handleSelect);
	remove.addEventListener("click", handleRemove);
</script>
</html>