<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
	$().ready(function(){
		 $("#sign_in").click(function(){	
				if(!pyrmont){
					alert("위치 정보를 불러오는 중입니다.");
					return false;
				}
				
				if($("#latitude")){
					$("#latitude").remove();
				}
				if($("#longitude")){
					$("#longitude").remove();
				}
				var latDiv= $("<div style= 'display:none;'><input id='latitude' name='latitude' value="+ pyrmont['lat'] +"></input></div>");					
				var lngDiv= $("<div style= 'display:none;'><input id='longitude' name='longitude' value="+ pyrmont['lng'] +"></input></div>");
				
				
				$("#password").after(latDiv);
				$("#password").after(lngDiv);
				
				$.post("<c:url value="/signin"/>",
					$("#userForm").serialize()
				,function(response){
						$("#map_addr").load("<c:url value="/addrcheck"/>");
						$("#checkSign").load("<c:url value="/logincheck"/>");
				});
		});
		 
		$("#signoutBtn").click(function(){
			$("#latitude").remove();
			$("#longitude").remove();
			$("#checkSign").load("<c:url value="/signout"/>");
			$("#map_addr").load("<c:url value="/addrcheck"/>");
		});
		
		$("#modifyBtn").click(function(){
			$("#right").load("<c:url value="/modify"/>");
		});
		
		/* $("#modifyBtn").click(function(){
			$.post("<c:url value="/modify/${sessionScope.__USER__.email}"/>",
					$("#userForm").serialize()
				,function(response){
						$("#right").load("<c:url value="/signout"/>");
			});
		});  */
		
	});
</script>
	<c:if test="${ empty sessionScope.__USER__ }">
		<form:form modelAttribute="userForm">
			<div style=" display:inline-block;">
				<div><input type="text" id="email" name="email" placeholder="아이디" style="width:130px;"/> </div>
				<form:errors path="email"/>
				<div><input type="password" id="password" name="password" placeholder="비밀번호" style="width:130px;"/> </div>
				<form:errors path="password"/>
			</div> 
			<br/>
			<input class="button" type="button" id="sign_in" value="로그인" style="display:inline-block; width: 50px; height: 30px;" />
			<a href="<c:url value="/signup"/>">
				<input class="button" type="button" id="sign_up" value="회원가입"  style=" display:inline-block; width: 70px; height: 30px;" />
			</a>
		</form:form>
	</c:if>
				
		
	<c:if test="${ not empty sessionScope.__USER__ }">
		<form:form modelAttribute="signForm">
			${sessionScope.__USER__.nickname}님
			환영합니다.
			<br/>
			<input class="button" type="button" id="modifyBtn" value="정보수정" style="display:inline-block; width: 50px; height: 30px;" />				
			<input class="button" type="button" id="signoutBtn" value="로그아웃" style="display:inline-block; width: 50px; height: 30px;" />				
		</form:form>
	</c:if>