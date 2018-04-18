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
		$("#rightBody").load("<c:url value="/load/gamenews/write"/>");
	});
</script>

<style type="text/css">
	table.board{
		border-collapse: collapse;
	}
	table.board > tbody td{
		border:1px solid;
	}
</style>
	<div class="mainList" style="height:500px;" >
		<div style="height: 360px;">
			<table class="board">
				<tr>
						<th>ID</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성자</th>
						<th>작성일</th>
	 			</tr>
	 			
					<c:forEach items="${pageExplorer.list}" var="gameNewsBoard">
						<tr>
							<td style="width:30px; border:1px solid; height:30px; ">${gameNewsBoard.boardId}</td>
							<td style="width:400px; border:1px solid; height:30px; ">${gameNewsBoard.title}</td>
							<td style="width:50px; border:1px solid; height:30px; ">${gameNewsBoard.viewCount}</td>
							<c:choose>
							<c:when test="${not empty gameNewsBoard.userVO}">
								<td style="width:100px; border:1px solid;">${gameNewsBoard.userVO.nickname}</td>
							</c:when>
							<c:otherwise>
								<td style="width:100px; border:1px solid;">탈퇴한 회원</td>
							</c:otherwise>
						</c:choose>
							<td style="width:120px; border:1px solid; height:30px; ">${gameNewsBoard.writeDate}</td>
						</tr>
					</c:forEach>
					<c:if test="${empty pageExplorer.list}">
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
		<form id="searchForm" onsubmit="movePageLoad('0')">
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
				<a href="<c:url value="/reset"/>">[검색 초기화]</a>
			</div>
		</form>		 		
	</div>
 <div class="tablefoot">
	<input type="button" id="boardWriteBtn" value="글쓰기" />
</div>