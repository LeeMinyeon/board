<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>회원가입</title>
</head>
<body>
<div class="container">
	<form action="/member/register"  class="form-signin" method="post">
		<h2 class="form-signin-heading">sign in</h2>
		<div>
			<label class="sr-only">아이디</label> <input type="text" id="userId" name="userId" class="form-control" placeholder="id" required autofocus>
			<button type="button" class="idCheck btn btn-default">Check</button>
		</div>
		<div class=" result">
			<label class="text-center">IDを確認してください。</label>
		</div>
		<div>
			<label for="inputPassword" class="sr-only">Password</label> <input type="password" name="userPass"  class="form-control" placeholder="Password" required>

		</div>
		<div>
			<label class="sr-only">닉네임</label> <input type="text" name="userName" class="form-control" placeholder="name" >
		</div>
		<div>
			<button type="submit" class="btn btn-primary btn-block" id="submit" disabled>社員登録</button>
		</div>
		<div>
			<a href="/" class="btn btn-info btn-block">ホームへ</a>
		</div>
	</form>
	</div>
	<script>
		$(".idCheck").click(function() {

			var query = {
				userId : $("#userId").val()
			};

			$.ajax({
				url : "/member/idCheck",
				type : "post",
				data : query,
				success : function(data) {
					if (data == 2) {
						$(".result .msg").text("IDを入力してください。");
						$(".result .msg").attr("style", "color:#f00");
						$("#submit").attr("disabled", "disabled");
					} else if (data == 1) {
						$(".result .msg").text("入力したIDが存在する。");
						$(".result .msg").attr("style", "color:#f00");
						$("#submit").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("入力したIDは使用できます。");
						$(".result .msg").attr("style", "color:#00f");
						$("#submit").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
	</script>
</body>

</html>