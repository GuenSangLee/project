<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$().ready(function(){
		if("${sessionScope.__USER__}"){
			var latDiv= $("<div class='userLocation' id='lastLoginLocation'><div>마지막 접속 위치<hr/></div><div>${sessionScope.__USER__.lastLoginLocation}</div></div>");
			$("#loginLocation").append(latDiv);
		}else{
			if($("#lastLoginLocation")){
				$("#lastLoginLocation").remove();
			}
		}
		 
		$("#signout").click(function(){
			$("#checkSign").load("<c:url value="/signout"/>");
			if($("#lastLoginLocation")){
				$("#lastLoginLocation").remove();
			}
		});	 
	});
</script>
<style type="text/css">
	.userLocation{
		border: 1px solid;
	}
</style>
	<div id="loginLocation">
		<div >
			현재 접속 위치
		</div>
		<hr/>
		<div>
			<c:choose>
				<c:when test="${ empty sessionScope.__USER__}">
					로그인이 필요합니다.
				</c:when>
				<c:otherwise>
					${sessionScope.__USER__.mapAddr}
				</c:otherwise>
			</c:choose>						
		</div>
	</div>
	