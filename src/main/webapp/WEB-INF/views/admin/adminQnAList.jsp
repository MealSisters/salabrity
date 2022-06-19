<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.model.dto.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Question> list = (List<Question>) request.getAttribute("list");
	String pagebar = (String) request.getAttribute("pagebar");
%>
<link rel='stylesheet' href='<%= request.getContextPath() %>/css/pagebar.css'>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>


<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminBoard.css">
<h1 class="boardTitle">1:1문의</h1>
<div class="div-level1">
    <div class="div-level2 div-sidemenu">
        <%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
    </div>
    
    <div class="div-level2 div-board">
        <div class="div-level3">
            <table id="tbl-QnAList" class="tbl-searchResult">
                <thead>
                    <tr>
                        <th class="col-no">No</th>
                        <th class="col-status">답변상태</th>
                        <th class="col-title">제목</th>
                        <th class="col-memberId">작성자</th>
                        <th class="col-date">작성일</th>
                        <th class="col-readCnt">조회수</th>
                    </tr>
                </thead>
                <tbody>
<%
	if(list != null && !list.isEmpty()) {
		for(Question q : list) {
%>
                    <tr data-postingNo="<%= q.getPostingNo() %>">
                        <td class="col-no"><%= q.getPostingNo() %></td>
                        <td class="col-status"><%= q.getAnswerNo() == 0 ? "<span class='readyQuestion'>대기중</span>" : "<span class='clearQuestion'>완료</span>" %></td>
                        <td class="col-title"><a href="<%= request.getContextPath() %>/admin/questionView?no=<%= q.getPostingNo() %>"><%= q.getTitle() %></a></td>
                        <td class="col-memberId"><%= q.getMemberId() %></td>
                        <td class="col-date"><%= q.getRegDate() %></td>
                        <td class="col-readCnt"><%= q.getReadCount() %></td>
                    </tr>
<%
		}
	} else {
%>
					<tr><td colspan="6">등록된 문의글이 없습니다.</td></tr>
<%
	}
%>
                </tbody>
            </table>
        </div>
        <%= pagebar %>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
