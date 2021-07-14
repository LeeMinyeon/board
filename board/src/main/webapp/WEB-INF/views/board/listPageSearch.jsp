<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
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
		<div>
			<c:if test="${member!=null}">
				<p>${member.userName}様　おはようございます。</p>
				<a href="/member/modify">ユーザー情報修正</a> /
				<a href="/member/logout">ログアウト</a>
			</c:if>
		</div>
		<div id="nav">
			<%@ include file="../include/nav.jsp"%>
		</div>
		<!-- 게시물 목록 시작-->
		<table class="table table-hover">
			<thead>
				<tr>
					<td>番号</td>
					<td>タイトル</td>
					<td>作成日</td>
					<td>作成者</td>
					<td>ビュー数</td>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.bno}</td>
						<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
						<td><fmt:formatDate value="${list.regDate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${list.writer}</td>
						<td>${list.viewCnt}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<!-- 게시물 목록 끝-->

		<!-- 페이징영역 시작 -->
		<div class="col-md-offset-3 ">
			<ul class="pagination">
				<c:if test="${page.prev}">
					<li><a
						href="/board/listPageSearch?num=${page.startPageNum-1 }${page.searchTypeKeyword}">前へ</a>
					</li>
				</c:if>
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
					var="num">
					<li <c:out value="${select==num  ? 'class=active' : ''}"/>><a
						href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>

					</li>
				</c:forEach>
				<c:if test="${page.next}">
					<li><a
						href="/board/listPageSearch?num=${page.endPageNum+1 }${page.searchTypeKeyword}">次へ</a>
					</li>
				</c:if>
			</ul>
			<%-- 	 <c:forEach begin="1" end="${pageNum}" var="num">
	 	<span>
	 		<a href="/board/listPage?num=${num}">${num}</a>
	 	</span>
	 </c:forEach> --%>
		</div>
		<!-- 페이징영역 끝 -->
		<!-- 검색영역 시작-->
		<div class="row">
			<div class="col-xs-2 col-sm-2">
				<select name="searchType" class="form-control">
					<option value="title"
						<c:if test="${page.searchType eq 'title'}">selected</c:if>>タイトル</option>
					<option value="content"
						<c:if test="${page.searchType eq 'content'}">selected</c:if>>内容</option>
					<option value="title_content"
						<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>タイトル+内容</option>
					<option value="writer"
						<c:if test="${page.searchType eq 'writer'}">selected</c:if>>作成者</option>
				</select>
			</div>
			<div class="col-xs-10 col-sm-10">
				<div class="input-group">
					<input type="text" name="keyword" value="${page.keyword}"
						class="form-control inline" /> <span class="input-group-btn">
						<button type="button" id="searchBtn" class="btn btn-primary"
							style="margin: 0 25px">검색</button>
					</span>
				</div>
			</div>
		</div>
		<!-- 검색영역 끝-->


	</div>
</body>
<script type="text/javascript">
	document.getElementById("searchBtn").onclick = function() {
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
		console.log(keyword);
		location.href = "/board/listPageSearch?num=1" + "&searchType="
				+ searchType + "&keyword=" + keyword;
	}
</script>
</html>