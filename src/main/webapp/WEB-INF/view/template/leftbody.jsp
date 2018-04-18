<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/button.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/leftBody.css"/>"/> --%>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){
		
		$("#checkSign").load("<c:url value="/login"/>");
		$("#map_addr").load("<c:url value="/addrcheck"/>");
		
});	
</script>
<style type="text/css">
	#leftBody{
		border-collapse: collapse;
		margin:0px; 
		display: inline-block; 
		height: 700px; 
		width:200px; 
		border: 1px solid; 
		float:left; 
		border:1px solid;
	}
	#map_addr{
		border-collapse: collapse;
		border: 1px solid;
		width:200px;
		font-size:10pt;
	}
	#checkSign{
		border-collapse: collapse;
		border: 1px solid;
		width: 200px;
		height: 100px;
		font-size:10pt;
		vertical-align: Middle;
	}
</style>
			<div id="leftBody">
				<div id="checkSign"></div>
				<div id="map_addr"></div>
				<jsp:include page="/WEB-INF/view/template/map.jsp" />
			</div>
