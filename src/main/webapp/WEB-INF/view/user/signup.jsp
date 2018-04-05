<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/input.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/signup.css"/>"/>
<title>Insert title here</title>
<%-- <c:choose>
		<c:when test="${~~~}"
		</c:when>
		<c:otherwise>
		</c:otherwise>
	 </c:choose>
 --%>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
		<c:if test="${not empty sessionScope.__USER__}">
			$("#pageTitle").text("회원 정보 수정");
			$("#email").attr("readonly", true);
			$("#email").hidd;
			$("#signupBtn").val("수정하기");
		</c:if>
		
		$("#signupBtn").click(function(){
				var url="<c:url value="/signup"/>";
			<c:if test="${not empty sessionScope.__USER__}">
				var url="<c:url value="/modify/${userVO.email}"/>";
			</c:if>
			
			$("#writeForm").attr({
				"method": "post",
				"action": url
			});
			writeForm.submit();
		});
		
		
	});
	
</script>
</head>
<body>
	<div id="body" style="">
		<div id="pageTitle" style="padding:3px; font-size:25px; font-color:#000000; bgcolor:#9bbb59; border: 1px solid; width:600px; margin:0 auto;">회원가입</div>
		<div style="margin-top: 10px; width:600px; margin:0 auto;">
			<form:form modelAttribute="writeForm" >
			<div class="pageList">아이디</div><input type="text" name="email" id="email" style="display:inline-block"  value="${userVO.email}" /><br/>
			<div class="pageList"">비밀번호</div> <input type="password" name="password" id="password" /><br/>
			<div class="pageList">
				<%-- <div style="display:inline-block; width:70px;">비밀번호 확인</div> <input type="password" name="password" id="password" style="position: relative; transform: translateY(-50%);"/> --%>
			</div><br/>
			
			
			<div class="pageList">닉네임</div> <input type="text" name="nickname" id="nickname" value="${userVO.nickname}"/><br/>
			<div class="pageList">전화번호</div> <input type="text" name="phoneNum" id="phoneNum" value="${userVO.phoneNum}"/><br/><br/>
			<div class="pageList">주소</div> <input type="text" name="addr" id="addr" value="${userVO.addr}"/><br/>
			<input type="button" id="signupBtn" value="가입하기" style="fond-size:20pt; width:200px;">
			
			</form:form>
		</div>	
	</div>


</body>
</html>