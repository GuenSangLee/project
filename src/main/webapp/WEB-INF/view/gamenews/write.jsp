<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameNewsWrite</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css"/>"/>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){	
		$("#writeBtn").click(function(){
			var writeForm = $("#writeForm");
			writeForm.attr({
				"method" : "post",
				"action" : "/gamenews/write"
			});
			writeForm.submit();
		});
		$("#cancleBtn").click(function(){
			location.href="<c:url value="/gamenews/list"/>"
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/template/leftbody.jsp" />
			
		<div id="right" >
			<div id="top">
				<p> PC 타임</p>
			</div>
				<div  class="mainList" id="gameRank">
					<div style="display:inline-block">게임순위</div>
					<div style="display:inline-block">1.ㅁㄴㅇ  2.ㅇㄴㅁ  3.ㅁㄴㅇㄹ  4.ㅁㄴㅇㄹ 5.ㅁㄴㅇㄹㄷ</div>
				</div>

				<div class="mainList">
					<div style="text-align:center">게임 소식(글쓰기)</div>
				</div>
				<form:form modelAttribute="writeForm">
					<div style="text-align:center">
						제목 : <input style="width:500px;" type="text" id="title" name="title" placeholder="title" value="${gameNewsBoardVO.title}"/>
					</div>
				<div>
					<textarea rows="10" cols="30" id="body" name="body" placeholder="내용 입력" style="height: 450px; width:600px;">
					${gameNewsBoardVO.body}
					</textarea>
				</div>
				<input type="hidden" id="userId" name="userId"
					value="${sessionScope.__USER__.id}" placeholder="userId" style="margin:2px auto;" /> 
				</form:form>
				<input type="button" id="writeBtn" value="등록" /> <input type="button" id="cancelBtn" value="취소"/>
			</div>
		</div>
</body>

</html>