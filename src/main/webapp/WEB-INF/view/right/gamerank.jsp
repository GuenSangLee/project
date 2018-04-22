<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="rightHead">
	<div style="display:inline-block; font-size:13pt;">게임순위</div>
	<div style="display:inline-block; width:400px; font-size:13pt;">
		<marquee behavior="scroll" direction="left">
			<c:forEach items="${gameRankList}" var="gameRank">
				${ gameRank.gameRank }.${gameRank.gameTitle} &nbsp;&nbsp;&nbsp;       
			</c:forEach>
		</marquee>
	</div>
</div>