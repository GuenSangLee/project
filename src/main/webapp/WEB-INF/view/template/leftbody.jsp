<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/button.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/leftBody.css"/>"/>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){
			
		$("#sign_in").click(function(){		
			$("#userForm").attr({
				"action": "<c:url value ="/signin"/>", 
				"method": "post"
			}).submit();
		});
			
		<c:if test="$(not empty sessionScope.__USER__)">
			$("#signForm").show();
			$("#userForm").hide();
		</c:if>
		
		$("#modifyBtn").click(function(){
			$("#signForm").attr({
				"action":"<c:url value="/modify/${sessionScope.__USER__.email}"/>",
				"method": "post"
			}).submit();
		});
	
	});
</script>
<div id="leftBody">
			<div style="margin:5px; border:1px solid; height:150px;">
				<c:if test="${empty sessionScope.__USER__}">
					<form:form modelAttribute="userForm">
						<div style=" display:inline-block;">
							<div><input type="text" id="email" name="email" placeholder="아이디" style="width:130px;"/> </div>
							<div><input type="password" id="password" name="password" placeholder="비밀번호" style="width:130px;"/> </div>
						</div> 
						<input class="button" type="button" id="sign_in" value="로그인" style="display:inline-block; width: 50px; height: 30px;" />
						<a href="<c:url value="/signup"/>">
						<input class="button" type="button" id="sign_up" value="회원가입"  style=" display:inline-block; width: 70px; height: 30px;" />
						</a>
					</form:form>
				</c:if>
				
						
				<c:if test="${not empty sessionScope.__USER__}">
					<form:form modelAttribute="signForm">
					${sessionScope.__USER__.nickname}님
					환영합니다.
					<a href="<c:url value="/modify"/>"><div>회원정보 수정</div></a>
					<a href="<c:url value="/logout"/>"><div>로그아웃</div></a>					
				</form:form>
				</c:if>
			</div>
</div>
