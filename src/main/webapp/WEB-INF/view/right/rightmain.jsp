<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$().ready(function(){
		
		$("#gameNewsList").click(function() {
			$("#rightBody").load("<c:url value="/gamenews/list"/>");
		});
		
		$(".gameNewsView").click(function(e){
			var dataId= parseInt(e.target.getAttribute('data-id'));
			$("#rightBody").load('<c:url value="/gamenews/view"/>/'+dataId);
		});
		
	});
</script>
<style type="text/css">
	.ellips{
		display: inline-block;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis; 
	}
	.boardName{
		height:40px;
		font-size:12pt;
	}
	.boardId{
		width:30px;
		font-size:12pt;
	}
	.boardTitle{
		width: 400px;
		margin: 0px auto;
		text-decoration:none;
 		cursor: pointer;
 		font-size:12pt;
	}
	.boardBody{
		width: 600px;
		text-align:left;
		border:1px solid gray;
		
	}
	.boardViewCount{
		width:50px;
		font-size:12pt;
	}
	.boardNickname{
		width:80px;
		font-size:12pt;
	}
	.boardDate{
		width:130px;
		font-size:12pt;
	}
	table.gameNews{
		border-collapse: collapse;
	}
	table.gameNews > thead th {
		border-bottom: 1px solid black;
		background-color:#d9d9d9;
	}
	table.gameNews > tbody tr{
		border-bottom: 1px solid black;
		background-color:#e9f6fc;
	}
	.boardTitle div:hover {
		color:black;
		cursor: pointer;
	}
	table.gameNews > tbody tr:FIRST  {
		background-color:#d9d9d9;
	}
	
</style>
		<div id="rightBody" >
		<div id="setting"style="border:1px solid black;">
			<span class="boardName" id="gameNewsList">
				게임 소식
			</span>
			<div style="width:700px; height:5px; background-color:#000000;" ></div>
				<table class="gameNews">
					<tr style="margin: 0px 0px 3px 0px; background-color:#d9d9d9;">
	 					<th class="boardId">ID</th>
						<th class="boardTitle">제목</th>
						<th class="boardViewCount">조회수</th>
						<th class="boardNickname">작성자</th>
						<th class="boardDate">작성일</th>
					</tr>
	 			
					<c:forEach items="${gameNewsBoardList}" var="gameNewsBoard">
						<tr>
							<td class="ellips boardId">${gameNewsBoard.boardId}</td>
							<td >
								<div class="ellips boardTitle gameNewsView" data-id="${gameNewsBoard.boardId}">
									${gameNewsBoard.title}
								</div>
							</td>
							<td>
								<div class="ellips">
									${gameNewsBoard.viewCount}
								</div>
							</td>
							<c:choose>
								<c:when test="${not empty gameNewsBoard.userVO}">
									<td>
										<div class="ellips boardNickname">
											${gameNewsBoard.userVO.nickname}
										</div>
									</td>
								</c:when>
								<c:otherwise>
									<td class="ellips boardNickname">탈퇴한 회원</td>
								</c:otherwise>
							</c:choose>
							<td class="boardDate">${gameNewsBoard.writeDate}</td>
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