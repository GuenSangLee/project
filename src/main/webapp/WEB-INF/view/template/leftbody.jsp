<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/button.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/leftBody.css"/>"/>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){
		
		
		$("#modifyBtn").click(function(){
			$("#signForm").attr({
				"action":"<c:url value="/modify/${sessionScope.__USER__.email}"/>",
				"method": "post"
			}).submit();
		}); 
		
		
		$("#checkSign").load("<c:url value="/login"/>");

	
	
		
		
});	
</script>
			<div style="margin:5px; border:1px solid; height:150px;">
				<div id="checkSign"></div>
			</div>
					<jsp:include page="/WEB-INF/view/template/map.jsp" />
