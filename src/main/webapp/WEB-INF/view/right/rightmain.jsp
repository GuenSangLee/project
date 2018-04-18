<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$().ready(function(){
		
		$("#gamenews").click(function() {
			$("#rightBody").load("<c:url value="/gamenews/list"/>");
		});
		
	});
</script>
<style type="text/css">
	table.board{
		border-collapse: collapse;
	}
	table.board > tbody td{
		border:1px solid;
	}
	table.board > .title{
		
	}
	.ellips{
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; 
	}
</style>
		<div id="rightBody" >
			<span id="gamenews" style="cursor: pointer;">
				게임 소식
			</span>
			<div class="mainList" >
				<table class="board">
					<tr>
	 					<th style="width:30px; border:1px solid;">ID</th>
						<th style="width:400px; border:1px solid;">제목</th>
						<th style="width:50px; border:1px solid;">조회수</th>
						<th style="width:100px; border:1px solid;">작성자</th>
						<th style="width:120px; border:1px solid;">작성일</th>
					</tr>
	 			
					<c:forEach items="${gameNewsBoardList}" var="gameNewsBoard">
						<tr>
							<td style="width:30px;">${gameNewsBoard.boardId}</td>
							<td >
								<div class="ellips" style="width:400px;">
									${gameNewsBoard.title}
								</div>
							</td>
							<td>
								<div class="ellips" style="width:50px;">
									${gameNewsBoard.viewCount}
								</div>
							</td>
							<c:choose>
								<c:when test="${not empty gameNewsBoard.userVO}">
									<td>
										<div class="ellips" style="width:100px;">
											${gameNewsBoard.userVO.nickname}
										</div>
									</td>
								</c:when>
								<c:otherwise>
									<td style="width:100px; border:1px solid;">탈퇴한 회원</td>
								</c:otherwise>
							</c:choose>
							<td style="width:150px; border:1px solid;">${gameNewsBoard.writeDate}</td>
						</tr>
					</c:forEach>
	 			</table>
	
				<div id="gameRank"style= "margin: 5px auto; width:700px; height:30px; border: 1px solid; background-color:#fefefe;">
					<div style="text-align:left">PC방 리뷰</div>
				</div>
	
				<div id="gameRank"style= "margin: 5px auto; width:700px; height:250px; border: 1px solid; background-color:#fefefe;">
					<table>
						<tr>
							<th style="width:30px; border:1px solid;">ID</th>
							<th style="width:400px; border:1px solid;">제목</th>
							<th style="width:50px; border:1px solid;">평점</th>
							<th style="width:100px; border:1px solid;">작성자</th>
							<th style="width:120px; border:1px solid;">작성일</th>
						</tr>
	 						
	 					<c:forEach items="${reviewBoardList}" var="reviewBoard">
	 						<tr>
	 							<td style="width:30px; border:1px solid;">reviewBoard.boardId</td>
	 							<td style="width:400px; border:1px solid;">reviewBoard.title</td>
	 							<td style="width:50px; border:1px solid;">reviewBoard.grade</td>
	 							<td style="width:100px; border:1px solid;">reviewBoard.userNickname</td>
	 							<td style="width:120px; border:1px solid;">reviewBoard.date</td>
	 						</tr>
	 					</c:forEach>
	 				 </table>
				</div>
			</div>
		</div>