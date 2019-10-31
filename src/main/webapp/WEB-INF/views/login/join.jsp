<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/include/header.jsp"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<script type="text/javascript">
var idchk =0;
function chk_id(){
	var userid = $('input#cuid').val();
	var result;
		$.ajax({
		 	type:"POST",
			url:"chk_cid.do",
			data : {userid : userid},
            success: function(data){
            	
				 if (data == 'false') {
					alert("이미 사용중인 아이디입니다.");
				} else {
					alert("사용가능한 아이디입니다.");
					idchk=1;
				} 
            },
			error : function(data) {
				alert("fail..");
			} 
		}); 
}

</script>

	<h3>this is join page</h3>
	<form action="joinProc" method="post">
		<label>아이디</label> <input type="text" name="cuid" id="cuid"> 
		<input type="button" id="chk_cid" onclick="javascript:chk_id()" value="중복확인"><br> <label>비밀번호</label> <input
			type="text" name="cupw"><br> <label>비밀번호 확인</label> <input
			type="text" name="cupw2"><br> <label>이름</label> <input
			type="text" name="cuname"><br> <label>성별</label> <input
			type="text" name="cugender"><br> <label>생년월일</label> <select
			name="cuyear">
			<option value="" selected>년도</option>
			<c:forEach begin="0" end="50" var="i">
				<c:forEach begin="99" end="99" var="j">
					<option value="${j - i }">${j - i }</option>
				</c:forEach>
			</c:forEach>
		</select> <select name="cumonth">
			<option value="" selected>월</option>
			<c:forEach var="i" begin="1" end="12">
			<option value="${i }">${i }</option>
			</c:forEach>

		</select> <select name="cuday">
			<option value="" selected>일</option>
			<c:forEach var="i" begin="1" end="31">
			<option value="${i }">${i }</option>			
			</c:forEach>
			
		</select><br> <label>주소</label> <input type="text" name="cuaddr"><br>
		<label>연락처</label> <input type="tel" name="cutel"><br> <label>이메일</label>
		<input type="email" name="cuemail"><br> <input
			type="submit" value="회원가입"> 
	</form><a href="login"><button>취소</button></a>
</body>
</html>