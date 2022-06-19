<%@page import="board.model.dto.PostingExt"%>
<%@page import="board.model.dto.PostingAttach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	PostingExt p = (PostingExt) request.getAttribute("posting");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminBoard.css">
<h1 class="boardTitle">1:1문의 답변보기</h1>
<div class="div-level1">
    <div class="div-level2 div-sidemenu">
        <%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
    </div>
    
    <div class="div-level2 div-questionView">
        <div class="postingNo-wrapper">
            <span class="span-postiongNo"><span class="span-contentlabel">No.</span><span class="questionView-no"><%= p.getPostingNo() %></span></span>
        </div>
        <div class="writer-wrapper">
            <span class="span-writer"><span class="span-contentlabel">작성자</span><span class="questionView-memberId"><%= p.getMemberId() %></span></span>
            <span class="span-regDate"><span class="span-contentlabel">작성일</span><span class="questionView-regDate"><%= p.getRegDate() %></span></span>
        </div>
        <div class="postinghead-wrapper">
            <h3 class="viewtitle"><%= p.getTitle() %></h3>
        </div>
        <div class="postingbody-wrapper">
            <div class="postingTextContent"><%= p.getContent() %></div>
        </div>
        <div class="postingAttach-wrapper div-postingTail">
<%
	for(PostingAttach attach : p.getAttachments()) {
%>
			<div>
	            <span class="span-contentlabel">첨부파일</span><a href="<%= request.getContextPath() %>/admin/fileDownload?no=<%= attach.getPostingAttachNo() %>"><%= attach.getOriginalFilename() %></a>
			</div>
<%
	}
%>
        </div>
        <div class="buttons-wrapper">
			<div class="div-delete"><button class="btn-delete">삭제하기</button></div>
            <div class="div-cancel"><button class="btn-cancel">뒤로가기</button></div>
        </div>
    </div>
</div>
<form action="<%= request.getContextPath() %>/admin/answerDelete" name="answerDeleteFrm" method="POST">
		<input type="hidden" name="no" value="<%= p.getPostingNo() %>" />
</form>
<script>
	window.addEventListener('load', () => {
		addViewBtnEvent();
	});
	
	const addViewBtnEvent = () => {
	    const cancelBtn = document.querySelector("button.btn-cancel");
	    cancelBtn.addEventListener('click', () => {
	    	history.go(-1);
	    });
	
	    const deleteBtn = document.querySelector("button.btn-delete");
	    deleteBtn.onclick = () => {
	    	if(confirm("답변을 삭제하시겠습니까?"))
	    		document.answerDeleteFrm.submit();
	    };


	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
