<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameNewsBoard</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css"/>"/>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){	
		
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
					<div style="text-align:left">게임 소식(글쓰기)</div>
				</div>

				<div class="mainList" style="height:500px;" >
					<table class="board">
						<tr>
		 					<th>ID</th>
		 					<th>제목</th>
		 					<th>조회수</th>
		 					<th>작성자</th>
		 					<th>작성일</th>
			 			</tr>
			 			
		 				<c:forEach items="${gameNewsBoardList}" var="gameNewsBoard">
		 					<tr>
		 						<td style="width:30px; border:1px solid; height:30px; ">${gameNewsBoard.boardId}</td>
		 						<td style="width:400px; border:1px solid; height:30px; ">${gameNewsBoard.title}</td>
		 						<td style="width:50px; border:1px solid; height:30px; ">${gameNewsBoard.viewCount}</td>
		 						<td style="width:100px; border:1px solid; height:30px; ">${gameNewsBoard.userVO.nickname}</td>
		 						<td style="width:120px; border:1px solid; height:30px; ">${gameNewsBoard.writeDate}</td>
		 					</tr>
		 				</c:forEach>
		 		</table>
			</div>
			<div class="tablefoot">
				<a href="<c:url value="/gamenews/write"/>">
					<input type="button" id="writeBtn" value="글쓰기" />
				</a>
			</div>
		</div>
	</div>
</body>

</html>