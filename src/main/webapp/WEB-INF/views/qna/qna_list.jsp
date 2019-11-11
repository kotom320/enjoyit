<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/jQueryRotateCompressed.js"></script>
<title>Insert title here</title>

</head>
<body>
	<script type="text/javascript">
		//<![CDATA[
		function show_block(elem, ID) {
			var menu = document.getElementById(ID);
			if (elem.className != 'opened') {
				elem.className = 'opened';
				menu.style.display = "block";
				$
						.ajax({
							type : "POST",
							url : "answer_view.do",
							data : {
								ID : ID
							},
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								/* alert("success"+data); */
								document.getElementById("answer_view" + ID).value = data;
							},
							error : function(data) {
								alert("전송실패" + data);
							}
						});

			} else {
				elem.className = 'closed';
				menu.style.display = "none";
			}

		}
		//]]>
	</script>

	<div class="container">

		<form action="qna_list" method="post" name="form1">

			<script type="text/javascript">
				function fnSubmitForm(page) {
					document.form1.page.value = page;
					document.form1.submit();
				}
			</script>
		</form>

		<input type="hidden" value="${sbcode }" name="sbcode">
		<input type="hidden" value="${wid }" name="wid">
		<h3>qnalist</h3>
		qaTitle : ${qatitle } &nbsp;&nbsp; qaContent : ${qacontent }
		&nbsp;&nbsp; searchKeyword : ${searchKeyword } <input type="hidden"
			name="page">


		<table class="table table-hover">

			<tr class="table-success">
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>

			</tr>

			<c:forEach items="${qnalist }" var="dto">
				<c:if test="${dto.qaindent ==0}">
					<tr>

						<td>${dto.qanum }</td>
						<c:set value="${dto.qaindent }" var="endIndent" />

						<td><c:forEach begin="1" end="${dto.qaindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endIndent }">
									<a>[re]</a>
								</c:if>
							</c:forEach> <a href="qnacontent_view?num=${dto.qanum }&wid=${wid}">${dto.qatitle }</a>
							<a class="closed"
							href="javascript:show_block(this,${dto.qanum })"><img
								id="image" src="resources/imgs/tri_edit.png"
								style="width: 30px; height: 30px;"></a></td>

						<c:if test="${dto.qaindent==0 }">
							<td>${dto.cuid }</td>
						</c:if>
						<c:if test="${dto.qaindent==1 }">
							<td>${dto.buid }</td>
						</c:if>

					</tr>

					
					
					<td></td>
					<td id="${dto.qanum }" style="display: none;" colspan="3"><textarea
							rows="7" cols="40" id="answer_view${dto.qanum }" readonly>
					</textarea></td>
					<td></td>
				</c:if>
			</c:forEach>
			<c:if test="${session_cid != null}">

				<tr>
					<td colspan="3"><a
						href="qna_write_view?sbcode=${sbcode }&wid=${wid}">QnA 작성하기</a></td>
				</tr>
			</c:if>
		</table>

		TotRow : ${searchVO.totRow }&nbsp; page /totPage : ${searchVO.page }/${searchVO.totPage }

		<div>
			<c:if test="${searchVO.page > 1 }">
				<a href="qna_list?page=1">맨앞</a>
				<a href="qna_list?page=${searchVO.page-1 }">이전</a>
			</c:if>
			<c:if test="${searchVO.totPage > 1 }">
				<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
					var="i">
					<c:choose>
						<c:when test="${i eq searchVO.page }">
							<c:out value="${i }"></c:out>
						</c:when>
						<c:otherwise>

							<a href="javascript:fnSubmitForm(${i })"><c:out value="${i }"></c:out></a>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<c:if test="${searchVO.page <searchVO.totPage }">
					<a href="qna_list?page=${searchVO.page+1 }">다음</a>
					<a href="qna_list?page=${searchVO.totPage }">맨뒤</a>
				</c:if>
			</c:if>
		</div>
		<div>
			<c:choose>
				<c:when test="${qatitle}">
					<input type="checkbox" name="searchType" checked="checked"
						value="qatitle" />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="qatitle" />
				</c:otherwise>
			</c:choose>

			<label>제목</label>
			<c:choose>

				<c:when test="${qacontent}">
					<input type="checkbox" name="searchType" value="qacontent"
						checked="checked" />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="qacontent" />
				</c:otherwise>
			</c:choose>
			<label>내용</label> <input type="text" name="sk" style="width: 150px;"
				maxlength="50" value="" /> <input type="submit" name="btn_search"
				value="검색">
		</div>


		<div>
			<a href="review_list?wid=${wid }&sbcode=${sbcode }">리뷰보기</a> <a
				href="board_list">게시글로 가기</a>
		</div>
	</div>

</body>
</html>