<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"> </script>
<script type="text/javascript">
	$().ready(function(){
			
		$("#sign_in").click(function(){		
			$("#writeForm").attr({
				"action": "<c:url value="/signin"/>", 
				"method": "post"
			}).submit();
		});
			
		<c:if test="$(not empty sessionScope.__USER__)">
			$("#signForm").show();
			$("#loginForm").hide();
		</c:if>
	
	});
</script>
</head>
<body style="margin: 2px; text-align:center;">
	<div id="#wrapper" style="display: inline-block;  magin:0px; padding:0px; width:1020px;">
		<div id="#left" style=" margin:0px; display: inline-block; height: 700px; width:200px; border: 1px solid; float:left; padding:3px;">
			<div style="margin:5px; border:1px solid; height:150px;">
				<c:if test="${empty sessionScope.__USER__}">
				<form:form modelAttribute="writeForm">
					<div style=" display:inline-block;">
						<div><input type="text" id="name" name="name" placeholder="아이디" style="width:130px;"/> </div>
						<div><input type="text" id="password" name="password" placeholder="비밀번호" style="width:130px;"/> </div>
					
					</div> 
					<input type="button" id="sign_in" value="로그인" style=" display:inline-block; width: 50px; height: 30px; text-align:middle; "/>
					<a href="<c:url value="/signup"/>">
					<input type="button" id="sign_up" value="회원가입" style=" display:inline-block; width: 70px; height: 30px;" />
					</a>
				</form:form>
						</c:if>
				
						
				<c:if test="${not empty sessionScope.__USER__}">
					<div id="#signForm">
					${sessionScope.__USER__.name}님
					환영합니다.
					<a href="<c:url value="/modify/${sessionScope.__USER__.id}"/>"><div>회원정보 수정</div></a>
					<a href="<c:url value="/logout"/>"><div>로그아웃</div></a>					
				</div>
				</c:if>
			</div>
			
		</div>
		<div id="#right" style="margin: 0px; width:800px; height:705px; display:inline-block; border: 1px solid; background-color: #dedede; text-align:top;" >
			<div id="#top" style= "margin: 5px auto; width:700px; height:50px; border: 1px solid; background-color:#fefefe; ">
				<p style="margin:0px; padding:0px; font-size: 20pt;"> PC 타임</p>
			</div>
				<div id="#gameRank" style= "margin: 5px auto; width:700px; height:30px; border: 1px solid; background-color:#fefefe; text-align:left; vertical-align:top;">
					<div style="display:inline-block">게임순위</div>
					<div style="display:inline-block">1.ㅁㄴㅇ  2.ㅇㄴㅁ  3.ㅁㄴㅇㄹ  4.ㅁㄴㅇㄹ 5.ㅁㄴㅇㄹㄷ</div>
				</div>

				<div id="#gameRank"style= "margin: 5px auto; width:700px; height:30px; border: 1px solid; background-color:#fefefe;">
					<div style="text-align:left">게임 소식</div>
				</div>

				<div id="#gameRank"style= "margin: 5px auto; width:700px; height:250px; border: 1px solid; background-color:#fefefe;">
					<table>
						<tr>
							<th>
			 					<td style="width:30px; border:1px solid;">ID</td>
			 					<td style="width:400px; border:1px solid;">제목</td>
			 					<td style="width:50px; border:1px solid;">조회수</td>
			 					<td style="width:100px; border:1px solid;">작성자</td>
			 					<td style="width:120px; border:1px solid;">작성일</td>
			 				</th>
			 			
			 				<c:forEach items="${gameNewsBoardList}" var="gameNewsBoard">
			 					<tr>
			 						<td style="width:30px; border:1px solid;">gameNewsBoard.bordId</td>
			 						<td style="width:400px; border:1px solid;">gameNewsBoard.title</td>
			 						<td style="width:50px; border:1px solid;">gameNewsBoard.viewCount</td>
			 						<td style="width:100px; border:1px solid;">gameNewsBoard.userNickname</td>
			 						<td style="width:120px; border:1px solid;">gameNewsBoard.date</td>
			 					</tr>
			 				</c:forEach>
			 			</tr>
			 		</table>
				</div>

				<div id="#gameRank"style= "margin: 5px auto; width:700px; height:30px; border: 1px solid; background-color:#fefefe;">
					<div style="text-align:left">PC방 리뷰</div>
				</div>

				<div id="#gameRank"style= "margin: 5px auto; width:700px; height:250px; border: 1px solid; background-color:#fefefe;">
					<table>
							<tr>
								<th>
			 						<td style="width:30px; border:1px solid;">ID</td>
			 						<td style="width:400px; border:1px solid;">제목</td>
			 						<td style="width:50px; border:1px solid;">평점</td>
			 						<td style="width:100px; border:1px solid;">작성자</td>
			 						<td style="width:120px; border:1px solid;">작성일</td>
			 					
			 					</th>
			 						
			 					<c:forEach items="${reviewBoardList}" var="reviewBoard">
			 						<tr>
			 							<td style="width:30px; border:1px solid;">reviewBoard.bordId</td>
			 							<td style="width:400px; border:1px solid;">reviewBoard.title</td>
			 							<td style="width:50px; border:1px solid;">reviewBoard.grade</td>
			 							<td style="width:100px; border:1px solid;">reviewBoard.userNickname</td>
			 							<td style="width:120px; border:1px solid;">reviewBoard.date</td>
			 						</tr>
			 					</c:forEach>
			 				</tr>
			 			</table>
				</div>
		</div>
	</div>
</body>

</html>