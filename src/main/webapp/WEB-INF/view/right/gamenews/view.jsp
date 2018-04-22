<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
		var reReplyForm=
		
		
		loadReplies(0);
		
		function loadReplies(scrollTop){
			$.get("<c:url value="/api/readreply"/>"
					,$("#writeReplyForm").serialize()
					,function(response){
						console.log(response);
						for(var i in response){
							appendReplies(response[i]);
						}
						
						//스크롤 위치 설정
						$(window).scrollTop(scrollTop);
			});
		}
		
		
		$("#modifyBtn").click(function(){
			$("#rightBody").load("<c:url value="/gamenews/modify"/>");
					
		});
		$("#listBtn").click(function(){
			$("#rightBody").load("<c:url value="/gamenews/list"/>");
			
		});
		$("#writeBtn").click(function(){
			$("#rightBody").load("<c:url value="/gamenews/write"/>");
		});

		
		$("#replies").on("click", ".showReReplyBtn", function(e){
			if(!"${sessionScope.__USER__}"){
				alert("로그인이 필요합니다.");
				return false;
			}
			$("#parentReReplyId").val(e.target.getAttribute('data-id'));
			$("#writeReReplyForm").appendTo($(this).closest(".replyMain"));
			$("#writeReReplyForm").show();
		});
		
		$("#replies").on("click", ".delReplyBtn", function(e){
			if(!"${sessionScope.__USER__}"){
				alert("로그인이 필요합니다.");
				return false;
			}
			if("${sessionScope.__USER__.id} eq e.target.getAttribute('data-userId')"){
				$.post('<c:url value="/api/delreply"/>/'+e.target.getAttribute('data-id')
						,$("#writeReplyForm").serialize()
						,function(response){
							$("#replies").html("");
							var scrollTop= $(window).scrollTop();
							loadReplies(scrollTop);
				});
			}
		});
		
		$("#writeReReplyBtn").click(function(){
			if(!"${sessionScope.__USER__}"){
				alert("로그인이 필요합니다.");
				return false;
			}
			$.post("<c:url value="/api/createreply"/>",
				$("#writeReReplyForm").serialize(),
				function(response) {
				
					if( response.status) {
						//appendReplies(response.reply);
						
						var scrollTop= $(window).scrollTop();
						$("#createReply").appendTo("#createReplyDiv");
						$("#createReplyId").val(0);
						
						$("#replyWriteBody").val("");
						//id가 replies인 것을 초기화
						$("#replies").html("");
						
						//스크롤바 좌표를 가져온다.
						loadReplies(scrollTop);
						
					}else{
						alert("등록 실패!");
					}
			});
		});
		
		
		$("#writeReplyBtn").click(function(){
			if(!"${sessionScope.__USER__}"){
				alert("로그인이 필요합니다.");
				return false;
			}
			$.post("<c:url value="/api/createreply"/>",
				$("#writeReplyForm").serialize(),
				function(response) {
				
					if( response.status) {
						//appendReplies(response.reply);
						
						var scrollTop= $(window).scrollTop();
						$("#createReply").appendTo("#createReplyDiv");
						$("#createReplyId").val(0);
						
						$("#replyWriteBody").val("");
						//id가 replies인 것을 초기화
						$("#replies").html("");
						
						//스크롤바 좌표를 가져온다.
						loadReplies(scrollTop);
						
					}else{
						alert("등록 실패!");
					}
			});
		});
		
		function appendReplies(reply){
			
			var checkLevel = ((reply.level-1) >= 1)? true : false;
			if(checkLevel === true){
				var replyDiv= $('<div class="replyMain" style="background-color:#ececec;"><div class="replyNickname" style=" padding-left:'+((reply.level-1)*20)+'px;">└'+reply.userVO.nickname+'</div>');
			}else{
				var reReplyBtn= $('<div class="replyReBtn"><input type="button" data-id="'+reply.id+'" value="답글" class="showReReplyBtn"/></div>');
				var replyDiv= $('<div class="replyMain"><div class="replyNickname" style=" padding-left:'+((reply.level-1)*20)+'px;">'+reply.userVO.nickname+'</div>');
			}
			
			var checkShow = ((reply.show-0) == 0)? true : false;
			if(checkShow){
				var replyBody= $('<div class="replyBody">'+reply.body+'</div>');
			}else{
				var replyBody= $('<div class="replyBody" style="color:red;">'+"해당 댓글은 삭제되었습니다."+'</div>');
			}
			
			var delReplyBtn= $('<div class="replyDelBtn" style=" padding-left:'+((reply.level-1)*30)+'px;"><input type="button" class="delReplyBtn" data-id="'+reply.id+'" data-userId="'+reply.userId+'" id="delReplyBtn" value="삭제"/></div>');
			var replyDate= $('<div class="replyDate">' +reply.registDate+'</div></div>');
			
			replyDiv.append(replyBody);
			replyDiv.append(reReplyBtn);
			replyDiv.append(delReplyBtn);
			replyDiv.append(replyDate);
			
			$("#replies").append(replyDiv);
				
		}
		
		
	});
</script>
<style type="text/css">
	@media(min-height:500px){
		#boardBody{
			height:500px;
		}
	}
	.replyMain{
		padding:4px 0px 4px 4px;
		border-bottom:1px solid gray;
	}
	.replyNickname{
		display:inline-block;
		width:90px;
		vertical-align:50%;
	}
	.replyBody{
		display:inline-block;
		width:430px;
		padding-left:15px;
		vertical-align:top;
	}
	.replyReBtn{
		display:inline-block;
		padding-left:5px;
		vertical-align:50%;
	}
	.replyDelBtn{
		display:inline-block;
		padding-left:5px;
		vertical-align:50%;
	}
	.replyDate{
		display:inline-block;
		padding-left:15px;
		font-size: 9pt;
		vertical-align:50%;
	}
	#footMenu{
		width:100%;
	}
	#leftMenu{
		text-align:left;
		float:left;
		display:inline;
		width:120px;
	}
	#rightMenu{
		text-align:right;
		float:right;
		display:inline;
		width:120px;
		
	}
	.bttn5423{
		width:54px;
		height:23px;
	}
	#boardTitle{
		width: 500px;
		margin: 0px auto;
		text-align: left;
	}
	#boardBody{
		width: 600px;
		text-align: left;
		border:1px solid gray;
	}
	.inline{
		display:inline;
	}
	#boardName{
		border-bottom:2px solid gray;
		margin-bottom:10px;
		padding: 2px;
	}
</style>
<div id="boardName">
	<div class="inline">게임 뉴스(글읽기)</div>
	<div class="inline" style="float:right; font-size:10pt;">작성일: ${gameNewsBoard.writeDate}</div>
</div>
<div style="text-align: center; width:700px; margin:0px auto;">
	<div id="boardTitle">
		<div class="inline" style="board-right:1px solid gray;">제목</div>
		<div class="inline" id="writeTitle">${gameNewsBoard.title}</div>
	</div>
	<div id="boardBody">
		${gameNewsBoard.body}
	</div>
</div>
<div id="footMenu" style="disply:block;width:700px;">
	<div id="leftMenu" >
		<input type="button" class="bttn5423" id="modifyBtn" value="수정" />
	</div>
	<div id="rightMenu">
		<input type="button" class="bttn5423" id="listBtn" value="목록" />
		<input type="button" class="bttn5423" id="writeBtn" value="글쓰기" />
	</div>
</div>
<div id="" style="width:700px; margin-top:30px; height:5px;"></div>
<div style="border:3px solid #666666; text-align:left;">
	<div id="replies" style="width:700px;"></div>
	<div id="createReplyDiv" style="width:700px; "> 
		<div id="createReply" style="">
			<form id="writeReplyForm" style="background-color:#ececec; ">
				<input type="hidden" id="parentReplyId" name="parentReplyId" value="0"/>
				<input type="hidden" id="boardType" name="boardType" value="1"/>
				<input type="hidden" id="boardId" name="boardId" value="${gameNewsBoard.boardId}"/>
				<div style="background-color:#ececec; margin:0px;">
					<div class="inline" id="replyType">▶댓글쓰기:</div>
					<c:if test="${not empty sessionScope.__USER__}">
						<div class="inline"><input type="text" class="replyBody" id="replyWriteBody" name="body"/></div>
					</c:if>
					<c:if test="${empty sessionScope.__USER__ }">
						<input type="text" readonly="readonly" size="60" placeholder="로그인이 필요한 서비스입니다." />
					</c:if>
					<div class="inline"><input type="button" id="writeReplyBtn" value="등록"/></div>
					<div class="inline" style="font-size:9pt;">${gameNewsBoard.writeDate}</div>
					<div style="font-size:9pt; margin-left:26px;">[공지사항] 악성 댓글 혹은 분란을 야기하는 댓글은 삭제될 수 있습니다.</div>
				</div>
			</form>
		</div>
	</div>
	
		<form id="writeReReplyForm" style="background-color:#ececec; display:none;">
			<input type="hidden" id="parentReReplyId" name="parentReplyId" value="0"/>
			<input type="hidden" name="boardType" value="1"/>
			<input type="hidden" name="boardId" value="${gameNewsBoard.boardId}"/>
			<div style="background-color:#ececec; margin:0px;">
				<div class="inline">▶답글쓰기:</div>
					<div class="inline"><input type="text" class="replyBody" id="writeReReplyBody" name="body"/></div>
				<div class="inline"><input type="button" id="writeReReplyBtn" value="등록"/></div>
				<div class="inline" style="font-size:9pt;">${gameNewsBoard.writeDate}</div>
				<div style="font-size:9pt; margin-left:26px;">[공지사항] 악성 댓글 혹은 분란을 야기하는 댓글은 삭제될 수 있습니다.</div>
			</div>
		</form>
</div>