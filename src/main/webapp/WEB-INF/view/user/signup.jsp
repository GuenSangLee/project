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
		
		/*이메일 체크 */
		$("#email").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$.post("<c:url value="/api/exists/email"/>",{
					email: value
				},function(response){
					if( response.isEmail) {
						$("#email").removeClass("valid");
						$("#email").addClass("invalid");
						$("#email-duplication").show();
					}else{
						if(email_check(value)){
							$("#email").removeClass("invalid");
							$("#email").addClass("valid");
							$("#email-duplication").css("display","none");
						}else{
							$("#email").removeClass("valid");
							$("#email").addClass("invalid");
							$("#email-duplication").show();
						}
					}
				});				
			} else {
				$("#email").removeClass();
			}
		})
		;
		/*닉네임 체크*/
		$("#nickname").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$.post("<c:url value="/api/exists/nickname"/>",{
					nickname: value
				},function(response){
					if( response.isNickname) {
						$("#nickname").removeClass("valid");
						$("#nickname").addClass("invalid");
						$("#nickname-duplication").show();
					}else{
						$("#nickname").removeClass("invalid");
						$("#nickname").addClass("valid");
						$("#nickname-duplication").css("display","none");
					}
				});				
			} else {
				$("#nickname").removeClass();
			}
		});
		/* 비밀번호 중복 체크 */
		$("#password, #password-confirm").keyup(function() {
			var value = $("#password").val();
			if (value != "") {
				$("#password").removeClass("invalid");
				$("#password").addClass("valid");
				$("#password").removeClass("valid");
				$("#password").addClass("invalid");
			}

			var password = $("#password-confirm").val();
			//틀리면
			if (value != password) {
				$("#password").removeClass("valid");
				$("#password").addClass("invalid");
				$("#password-confirm").removeClass("valid");
				$("#password-confirm").addClass("invalid");
				$("#password-duplication").show();
					
			} else {
				$("#password").removeClass("invalid");
				$("#password").addClass("valid");
				$("#password-confirm").removeClass("invalid");
				$("#password-confirm").addClass("valid");
				$("#password-duplication").css("display", "none");
			}
		});
		
		$("#signupBtn").click(function(){
			$.post("<c:url value="/api/exists/email"/>",{
				email: $("#email").val()
			},function(response){
				if(email_check($("#email").val())){
					if( response.isEmail) {
						alert("사용할 수 없는 아이디입니다.");
						$("#email").focus();
						return false;
					}else if(!response.isEmail){
						$.post("<c:url value="/api/exists/nickname"/>",{
							nickname: $("#nickname").val()
						},function(response){
							if( response.isNickname ){
								alert("사용할 수 없는 닉네임입니다.");							
							}else if(!response.isNickname){						
								if ( $("#password").val() == $("#password-confirm").val() ){
									if( $("#phoneNum") != "" ){
										if( $("#addr") != "" ){
											var url="<c:url value="/signup"/>";
											<c:if test="${not empty sessionScope.__USER__}">
												var url="<c:url value="/modify/${userVO.email}"/>";
											</c:if>
											
											$("#writeForm").attr({
												"method": "post",
												"action": url
											});
											writeForm.submit();
										}else{
											alert("주소를 입력하세요.");
											$("#addr").focus();
										}
									}else{
										alert("연락처를 입력하세요.");
										$("#phoneNum").focus();
									}
								}else{
									alert("비밀번호를 확인하세요.");
									$("#password").val("");
									$("#password-confirm").val("");
									$("#password").focus();
								}
							}
						});
					}
				}else{
					alert("이메일을 확인하세요."+"\n" +"email형식(email@email.com)");
					$("#email").removeClass("valid");
					$("#email").val("");
					$("#email-duplication").show();
				}
			});
		
		});
		function email_check( email ) {
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email));
		}
	});
	
</script>
</head>
<body>
	<div id="body22" style="width:800px; ">
		<div id="pageTitle" style="padding:3px; font-size:25px; font-color:#000000; bgcolor:#9bbb59; border: 1px solid; width:600px; margin:0 auto;">회원가입</div>
		<div style="margin-top: 10px; width:600px; margin:0 auto;">
			<form:form modelAttribute="writeForm" >
			<div class="pageList">아이디</div><input type="text" name="email" id="email" style="display:inline-block"  value="${userVO.email}"  placeholder="email형식(email@email.com)" /><br/>
			<form:errors path="email"/>
			<div class="duplication" id="email-duplication">사용할 수 없는 이메일입니다.</div>
			<div class="pageList">비밀번호</div> <input type="password" id="password" name="password" placeholder="비밀번호(6자 이상)"  /><br/>
			<form:errors path="password"/>
			<div class="pageList">비밀번호 확인</div> <input type="password" id="password-confirm" /><br/>
			<div class="duplication" id="password-duplication">비밀번호가 다릅니다.</div>
			<div class="pageList">
				<%-- <div style="display:inline-block; width:70px;">비밀번호 확인</div> <input type="password" name="password" id="password" style="position: relative; transform: translateY(-50%);"/> --%>
			</div><br/>
			
			
			<div class="pageList">닉네임</div> <input type="text" name="nickname" id="nickname" value="${userVO.nickname}"/><br/>
			<div class="duplication" id="nickname-duplication">사용할 수 없는 닉네임입니다.</div>
			<form:errors path="nickname"/>
			<div class="pageList">전화번호</div> <input type="text" name="phoneNum" id="phoneNum" value="${userVO.phoneNum}"/><br/><br/>
			<form:errors path="phonNum"/>
			<div class="pageList">주소</div> <input type="text" name="addr" id="addr" value="${userVO.addr}"/><br/>
			<form:errors path="addr"/>
			<input type="button" id="signupBtn" value="가입하기" style="fond-size:20pt; width:200px;">
			
			</form:form>
		</div>	
	</div>


</body>
</html>