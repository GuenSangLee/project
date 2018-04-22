<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css"/>"/> --%>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){
		
		
		
	});
</script>

<style type="text/css">
	#wrapper{
		margin:0 auto;
		width:1026px;
		padding:0px;
		margin:2px auto;
		text-align:center;
		border: 1px solid;
	}
	#left{
		border-collapse: collapse;
		display:inline;
	}
	#right{
		border-collapse: collapse;
		display: inline-block;
		height: 700px;
		margin:0px auto;
	}
	p. div, a, li, span, td, i, u, input, textarea, b, body{
		font-size: 12pt;
		color: #333;
		font-family:"맑은 고딕", "맑은고딕";
		border-collapse: collapse;
		margin:0px;
	}
</style>
</head>
<body style="margin:0px;">
	<jsp:include page="/WEB-INF/view/header/headermain.jsp" />
	<div id="wrapper">
		<div id="left">
			<jsp:include page="/WEB-INF/view/template/leftbody.jsp" />
		</div>	
		<div id="right" >
			
			<jsp:include page="/WEB-INF/view/right/rightmain.jsp" />
		</div>
	</div>
</body>

</html>