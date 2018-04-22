<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
	function movePageLoad(pageNo) {
		document.getElementById('searchForm').pageNo.value = pageNo;
		/*post방식                                                +해서 get방식*/
		$("#rightBody").load("<c:url value="/gamenews/list"/>", $("#searchForm").serialize());
	}
	
	$("#boardWriteBtn").click(function(){
		if(!"${sessionScope.__USER__}"){
			alert("로그인이 필요합니다.");
			return false;
		}
		$("#rightBody").load("<c:url value="/load/gamenews/write"/>");
	});

	$("#searchReset").click(function(){
		$("#rightBody").load("<c:url value="/load/gamenews/reset"/>");
	});
	
	$(".gameNewsView").click(function(e){
		var dataId= parseInt(e.target.getAttribute('data-id'));
		$("#rightBody").load('<c:url value="/gamenews/view"/>/'+dataId);
	});
	
	$("#searchBtn").click(function(e){
		movePage('0');
	});
	
	$('#searchKeyword').keypress(function (e) {                                       
	       if (e.which == 13) {
	            e.preventDefault();
	       }
	});
</script>

<style type="text/css">

</style>
	<div class="mainList" style="height:500px;" >
		<div style="height: 360px;">
			<div class="boardName">
				게임 소식 게시판
			</div>
			<div style="width:700px; height:5px; background-color:#000000;" ></div>
			<table class="gameNews">
				<tr style="margin: 0px 0px 3px 0px; background-color:#d9d9d9;">
						<th class="boardId">ID</th>
						<th class="boardTitle">제목</th>
						<th class="boardViewCount">조회수</th>
						<th class="boardNickname">작성자</th>
						<th class="boardDate">작성일</th>
				</tr>
				
				<c:forEach items="${pageExplorer.list}" var="gameNewsBoard">
					<tr>
						<td class="ellips boardId">${gameNewsBoard.boardId}</td>
						<td>
							<div class="ellips boardTitle gameNewsView" data-id="${gameNewsBoard.boardId}">
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
		</div>
		<div style="text-align:right">
			<input style="" type="button" id="boardWriteBtn" value="글쓰기" />
		</div>
		<form id="searchForm" onsubmit="movePage('0')">
		${pageExplorer.make()}<br/>
			<div>
				<select id="searchType" name="searchType">
					<option value="1" ${ search.searchType eq 1 ? 'selected' : '' }>글 제목</option>
					<option value="2" ${ search.searchType eq 2 ? 'selected' : '' }>글 내용</option>
					<option value="3" ${ search.searchType eq 3 ? 'selected' : '' }>글 제목 + 글 내용</option>
					<option value="4" ${ search.searchType eq 4 ? 'selected' : '' }>작성자 Nickname</option>
					<option value="5" ${ search.searchType eq 5 ? 'selected' : '' }>작성자 Email</option>
				</select>
				<input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" />
				<input type="button" id="searchBtn" value="검색" />
				<input type="button" id="searchReset" value="검색 초기화" />
			</div>
		</form>		 		
	</div>
 <div class="tablefoot">
	
</div>