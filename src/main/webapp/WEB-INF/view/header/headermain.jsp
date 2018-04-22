<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$().ready(function(){
		$("#header").click(function(){
			$("#rightBody").load("<c:url value="/rightbody"/>");
		});
		
		$("#nav").click(function(event){
			var navEvent = event.target.innerHTML;
			if(!navEvent){
				location.href = "/";
			}else if(navEvent == "게임 소식"){
				$("#rightBody").load("<c:url value="/gamenews/list"/>");
			}else if(navEvent == "PC방 평가"){
				/* $("#rightBody").load("<c:url value="/rightbody"/>"); */
			}
		});
	});
</script>
<style type="text/css">
	#header{
		width: 1040px;
		height: 60px;
		border: 1px solid;
		padding-top:10px;
		padding-bottom:10px;
		text-align:center;
		font-size:17pt;
		margin:0px auto;
		position: relative;
	}
	
	#headerText a {
 		text-decoration:none;
 		color:black;
	}
	#headerText a:hover {
		color:black;
		cursor: pointer;
	}
	#headerText{
		position: absolute;
		transform: translate(70%, 3%);
	}
	
	#nav_menu ul {
		position: fixed;
		top:80px;
		right:0px;
		list-style-type:none;
		background-color:#000000;
		padding:1px 5px 5px 1px;
		float:right;
	}
	#nav_menu ul li {
		margin-left:2px;
		color:#ffffff;
		font-size:9pt;
	}
	#nav_menu ul li:first-child {
		border-left: none;
	}
	#nav_menu div {
 		text-decoration:none;
 		color:#ffffff;
 		cursor: pointer;
	}
	#nav_menu div:hover {
		 color:#D4F4FA;
 		border-bottom:3px solid yellow;
	}
</style>

<div style="display:inline; width:100%;">
	<div id="nav_menu">
		<ul id="nav">
		<li><div style="text-align:center"><img src="<c:url value="/static/img/home.png" />" width="20px" height="20px" alt="home"/></div></li>
		<li><div id="gameNews">게임 소식</div></li>
		<li><div>PC방 평가</div></li>
		</ul>
	</div>
</div>
<div id="header">
	<div id="headerText" >
		<a href="<c:url value="/"/>">PC 매니저</a>
		<div><jsp:include page="/WEB-INF/view/right/gamerank.jsp" /></div>
	</div>
</div>