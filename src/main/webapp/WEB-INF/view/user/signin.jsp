<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Need SignIn</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/input.css"/>"/>
</head>
<body>
	<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
	<script type="text/javascript">
	$().ready(function(){	
		$("#sign_in").click(function(){
			var checkEmail= $("#email").val();
			if(email_check(checkEmail)){
				$("#userForm").attr({
					"action": "<c:url value ="/signin"/>", 
					"method": "post"
				}).submit();	
			}else{
				alert("잘못된 접속입니다.");
			}
		});
		
		
		
		function email_check( email ) {
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email));
		}
	});
	</script>
	<div id="wrapper">
		<div id="needLogin" style="margin:1px auto; border:1px solid; width:400px; text-align: center;:">
			<div style="margin:1px auto; "><b>로그인이 필요합니다.</b></div>
			<form:form modelAttribute="userForm">
					<div style=" display:inline-block;">
						<div><input type="text" id="email" name="email" placeholder="이메일" style="width:130px;"/> </div>
						<div><input type="password" id="password" name="password" placeholder="비밀번호" style="width:130px;"/> </div>
					</div>
					<div></div>
					<div style="margin:3px auto; border:1px solid; width:140px; padding:1px 3px;">
						<input class="button" type="button" id="sign_in" value="로그인" style="display:inline-block; width: 50px; height: 30px;" />
						<a href="<c:url value="/signup"/>">
							<input class="button" type="button" id="sign_up" value="회원가입"  style=" display:inline-block; width: 70px; height: 30px;" />
						</a>
					</div>
			</form:form>
		</div>
	</div>
	
	</div>
</body>
</html>