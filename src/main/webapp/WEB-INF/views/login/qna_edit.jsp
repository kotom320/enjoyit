<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
		function modify_auth() {

			document.ansform.submit();
		};
	</script>
</head>
<body>
	
	<div class="container">
	<h3>content_view</h3>
	상품판매자 :${session_bid }
	<form action="qnamodify" method="post" name="ansform" id="ansform">
		<input type="hidden" name="sbcode" value="${qa.sbcode }">
		<input type="hidden" name="qanum" value="${qa.qanum }">
		<input type="hidden" name="wid" value="${session_bid }">
		<table class="table table-hover">
			<tr>
				<td>글번호</td>
				<td>${qa.qanum }</td>

				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" rows="10" name="content">${qa.qacontent }</textarea>
					</td>
				</tr>
			</table>
		<input type="submit" style="display: none;">

		<a><button onclick="javascript:modify_auth()">수정하기</button></a>
		<a href="qnadelete?qanum=${qa.qanum}&wid=${session_bid }&sbcode=${qa.sbcode}"><button>삭제하기</button></a>
		<a href="qna_list"> 목록가기</a>
		</form>
		&nbsp;&nbsp;
	</div>
</body>
</html>