<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		var idchk = 0;
		function chk_id() {
			var userid = $('input#cuid').val();
			var result;
			$.ajax({
				type : "POST",
				url : "chk_cid.do",
				data : {
					userid : userid
				},
				success : function(data) {if (data == 'false') {
					alert("이미 사용중인 아이디입니다.");
					idchk=0;
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
		
function checkfield() {
	if(document.addjoin.cuid.value==""){
		alert("아이디를 입력하세요");
		document.addjoin.cuid.focus();
		exit;
	}else if(document.addjoin.cupw.value==""){
		alert("비밀번호를 입력하세요");
		document.addjoin.cupw.focus();
		exit;
		
	}else if(document.addjoin.cupw2.value==""){
		alert("비밀번호확인을 입력하세요");
		document.addjoin.cupw2.focus();
		exit;
		
	}else if(document.addjoin.cuname.value==""){
		alert("이름을 입력하세요");
		document.addjoin.cuname.focus();
		exit;
		
	}else if(document.addjoin.cuyear.value==""){
		alert("생년월일을 입력하세요");
		document.addjoin.cuyear.focus();
		exit;
		
	}else if(document.addjoin.cumonth.value==""){
		alert("생년월일을 입력하세요");
		document.addjoin.cumonth.focus();
		exit;
		
	}else if(document.addjoin.cuday.value==""){
		alert("생년월일을 입력하세요");
		document.addjoin.cuday.focus();
		exit;
		
	}else if(document.addjoin.cutel.value==""){
		alert("연락처를 입력하세요");
		document.addjoin.cutel.focus();
		exit;
		
	}else if(document.addjoin.cuemail.value==""){
		alert("이메일을 입력하세요");
		document.addjoin.cuemail.focus();
		exit;
	}else if(idchk == 0 ){
		alert("아이디 중복체크 바랍니다.");
		document.addjoin.chk_cid.focus();
		exit;
	}
	
	if(document.addjoin.cupw.value!=document.addjoin.cupw2.value){
		alert("비밀번호가 일치하지않습니다.");
		document.addjoin.cupw2.focus();
		exit;
		
	}
	document.addjoin.submit();
}

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
						, emdNo, entX, entY){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.addjoin.roadAddrPart1.value = roadAddrPart1;
	document.addjoin.roadAddrPart2.value = roadAddrPart2;
	document.addjoin.addrDetail.value = addrDetail;
	document.addjoin.zipNo.value = zipNo;
	document.addjoin.entX.value = entX;
	document.addjoin.entY.value = entY;
}
</script>

<div class="container">
	<h3>this is join page</h3>
	<form action="joinProc" method="post" name="addjoin" id="addjoin">
		<label><strong>아이디*</strong></label> <input type="text" name="cuid" id="cuid"> 
		<input type="button" id="chk_cid" onclick="javascript:chk_id()" value="중복확인"><br> 
		<label><strong>비밀번호*</strong></label> <input type="password" name="cupw" id="cupw"><br> 
		<label><strong>비밀번호 확인*</strong></label> <input type="password" name="cupw2" id="cupw2"><br> 
		<label><strong>이름*</strong></label> <input type="text" name="cuname" id="cuname"><br> 
		<label>성별</label> 
		<select name="cugender">
			<option value="" selected>성별</option>
			<option value="male">남자</option>
			<option value="female">여자</option>
		</select><br>
		<label><strong>생년월일*</strong></label>
		<select name="cuyear" id="cuyear">
			<option value="" selected>년도</option>
			<c:forEach begin="0" end="50" var="i">
				<c:forEach begin="99" end="99" var="j">
					<option value="19${j - i }">${j - i }</option>
				</c:forEach>
			</c:forEach>
		</select> 
		<select name="cumonth" id="cumonth"> 
			<option value="" selected>월</option>
				<c:forEach var="i" begin="1" end="12">
					<c:if test="${i < 10 }">
						<option value="0${i }">0${i }</option>
					</c:if>
					<c:if test="${i >= 10 }">
						<option value="${i }">${i }</option>
					</c:if>
				</c:forEach>
		</select> 
		<select name="cuday" id="cuday">
			<option value="" selected>일</option>
			<c:forEach var="i" begin="1" end="31">
				<c:if test="${i <10}">
					<option value="0${i }">0${i }</option>
				</c:if>
				<c:if test="${i >=10 }">
					<option value="${i }">${i }</option>
				</c:if>
			</c:forEach>			
		</select><br> 
		<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th><label>도로명주소</label></th>
					<td><input type="text" id="roadAddrPart1" name="addr1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail" name="addr2" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  name="addr3" style="width:40%" value="">
					</td>
				</tr>
				<tr style="display:none;">
					<th>좌표정보</th>
					<td>
						<input type="text" id="entX" name="entX" style="width:40%" value="">
						<input type="text" id="entY"  name="entY" style="width:40%" value="">
					</td>
				</tr>
			</tbody>
		</table>
		<label><strong>연락처*</strong></label> <input type="tel" name="cutel" id="cutel"><br> 
		<label><strong>이메일*</strong></label> <input type="email" name="cuemail" id="cuemail"><br> 
		<input type="button" value="회원가입" onclick="checkfield()"> 
	</form><a href="login"><button>취소</button></a>
</div>
</body>
</html>