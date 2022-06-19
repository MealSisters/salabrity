<%@page import="board.model.dto.PostingAttach"%>
<%@page import="board.model.dto.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Question q = (Question) request.getAttribute("question");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminBoard.css">
<h1 class="boardTitle">1:1문의</h1>
<div class="div-level1">
    <div class="div-level2 div-sidemenu">
        <%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
    </div>
    
    <div class="div-level2 div-questionView">
        <div class="postingNo-wrapper">
            <span class="span-postiongNo"><span class="span-contentlabel">No.</span><span class="questionView-no"><%= q.getPostingNo() %></span></span>
        </div>
        <div class="writer-wrapper">
            <span class="span-writer"><span class="span-contentlabel">작성자</span><span class="questionView-memberId"><%= q.getMemberId() %></span></span>
            <span class="span-regDate"><span class="span-contentlabel">작성일</span><span class="questionView-regDate"><%= q.getRegDate() %></span></span>
        </div>
        <div class="postinghead-wrapper">
            <h3 class="viewtitle"><%= q.getTitle() %></h3>
        </div>
        <div class="postingbody-wrapper">
            <div class="postingTextContent"><%= q.getContent() %></div>
        </div>
        <div class="postingAttach-wrapper div-postingTail">
<%
	for(PostingAttach attach : q.getAttachments()) {
%>
		<div>
            <span class="span-contentlabel">첨부파일</span><a href="<%= request.getContextPath() %>/admin/fileDownload?no=<%= attach.getPostingAttachNo() %>"><%= attach.getOriginalFilename() %></a>
		</div>
<%
	}
%>
        </div>
        <div class="buttons-wrapper">
<%
	if(q.getAnswerNo() != 0) {
%>
			<div class="div-done"><button class="btn-done">답변보기</button></div>
<%
	} else {
%>
            <div class="div-answer"><button class="btn-answer">답변쓰기</button></div>
<%
	}
%>

            <div class="div-cancel"><button class="btn-cancel">뒤로가기</button></div>
        </div>
    </div>
</div>
<script>
	window.addEventListener('load', () => {
		addViewBtnEvent();
	});
	
	const addViewBtnEvent = () => {
	    const cancelBtn = document.querySelector("button.btn-cancel");
	    cancelBtn.addEventListener('click', () => {
	    	history.go(-1);
	    });
	
	    const submitBtn = document.querySelector("button.btn-answer");
	    if(submitBtn != null) {
		    submitBtn.onclick = () => {
		        location.href = "<%= request.getContextPath() %>/admin/QnAList/answer?no=<%= q.getPostingNo() %>";
		    };
	    }
	    
	    const doneBtn = document.querySelector("button.btn-done");
	    if(doneBtn != null) {
		    doneBtn.onclick = () => {
		        location.href = "<%= request.getContextPath() %>/admin/answerView?no=<%= q.getAnswerNo()%>";
		    };	    	
	    }
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
