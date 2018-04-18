<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$().ready(function(){
		$("#header").click(function(){
			$("#rightBody").load("<c:url value="/rightbody"/>");
		});
		
	});
</script>
<style type="text/css">
	#header{
		height:80px;
	}
</style>

<div id="header">
		<p> PC 타임</p>
</div>