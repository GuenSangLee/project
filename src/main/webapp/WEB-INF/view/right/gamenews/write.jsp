<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript">
	
</script>

<script type="text/javascript">
	$().ready(function() {
		if("$(sessionScope.__MODE__)"){
			$("rightTitle").text("게임 소식(글 수정)")
		}
				$("#writeBtn").click(function() {
							$.post("<c:url value="/gamenews/write"/>"
									,$("#writeForm").serialize()
									,function(response) {
								$("#rightBody").load("<c:url value="/gamenews/list"/>");
							});
				});

				$("#cancelBtn").click(function() {
					$("#rightBody").load("<c:url value="/gamenews/list"/>");
				});
				
				$('#title').keypress(function (e) {                                       
			       if (e.which == 13) {
			            e.preventDefault();
			       }
				});
			});
</script>
	<div style="text-align: center" id="rightTitle">게임 소식(글쓰기)</div>
<form:form modelAttribute="writeForm">
	<div style="text-align: center">
		제목 : <input style="width: 500px;" type="text" id="title" name="title"
			placeholder="title" value="${gameNewsBoardVO.title}" />
	</div>
	<div>
		<textarea rows="10" cols="30" id="body" name="body"
			placeholder="내용 입력" style="height: 450px; width: 600px;">${gameNewsBoardVO.body}</textarea>
	</div>
	<input type="hidden" id="userId" name="userId"
		value="${sessionScope.__USER__.id}" placeholder="userId"
		style="margin: 2px auto;" />
</form:form>
<input type="button" id="writeBtn" value="등록" />
<input type="button" id="cancelBtn" value="취소" />
