<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
$().ready(function(){
	function checkLogin(){
		<c:if test="$(not empty sessionScope.__USER__)">
			$("#userForm").hide();
	  		$("#signForm").show();
		</c:if>
		
		<c:if test="$(empty sessionScope.__USER__)">
			 $("#userForm").show();
		   	 $("#signForm").hide();
		</c:if>
	}
	 $("#sign_in").click(function(){	
			var latDiv= $("<div style= 'display:none;'><input id='latitude' name='latitude' value="+ pyrmont['lat'] +"></input></div>");
			var lngDiv= $("<div style= 'display:none;'><input id='longitude' name='longitude' value="+ pyrmont['lng'] +"></input></div>");
			alert("으아");
			
			$("#password").after(latDiv);
			$("#password").after(lngDiv);
			
			$.post("<c:url value="/api/exists/email"/>",
				$("#userForm").serialize()
			,function(response){
				
			});
			
	});
	
	$("#signout").click(function(){
			$("#checkSign").load("<c:url value="/signout"/>");
	});	
});

</script>
<div id="checkSign2">
		<form:form modelAttribute="userForm">
			<div style=" display:inline-block;">
				<div><input type="text" id="email" name="email" placeholder="아이디" style="width:130px;"/> </div>
				<form:errors path="email"/>
				<div><input type="password" id="password" name="password" placeholder="비밀번호" style="width:130px;"/> </div>
				<form:errors path="password"/>
			</div> 
			<input class="button" type="button" id="sign_in" value="로그인" style="display:inline-block; width: 50px; height: 30px;" />
			<a href="<c:url value="/signup"/>">
			<input class="button" type="button" id="sign_up" value="회원가입"  style=" display:inline-block; width: 70px; height: 30px;" />
			</a>
		</form:form>
				
		

	<form:form modelAttribute="signForm">
	${sessionScope.__USER__.nickname}님
	환영합니다.
		<a href="<c:url value="/modify"/>">회원정보 수정</a>
		<input class="button" type="button" id="signout" value="로그아웃" style="display:inline-block; width: 50px; height: 30px;" />				
	</form:form>
</div>	