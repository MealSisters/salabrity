<%@ page import="member.model.dto.MemberRole" %>
<%@ page import="board.model.dto.PostingExt" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 수진 start -->
<%
	List<PostingExt> postingList = (List<PostingExt>) request.getAttribute("postingList");
	String pagebar = (String) request.getAttribute("pagebar");
	BoardCode boardCode= (BoardCode) request.getAttribute("boardCode");
%>
<!-- 수진 end -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice/notice.css" />
<link rel="stylesheet" 
	href="<%= request.getContextPath() %>/css/pagebar.css" />
	
<div class="notice_page_content">
    <h3 class="notice_hd">공지사항</h3>
    <div class="notice_wrap">
    <% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
		<button type="button" class="btn_notice_enroll" onclick="location.href='<%= request.getContextPath() %>/board/noticeEnroll';">등록</button>
		<input type="hidden" name="boardCode" value="<%= boardCode %>" />
	<% } %>
<%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
        <div class="notice_cont"> <!-- FAQ랑 같이 사용 -->
            <table class="tbl_notice">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
        <!-- 수진 start -->
		<%
			if(postingList != null && !postingList.isEmpty()) {
				for(PostingExt posting : postingList) {
		%>
                    <tr>
                        <td><%= posting.getPostingNo() %></td>
                        <td>
							<a href="<%= request.getContextPath() %>/board/noticeView?no=<%= posting.getPostingNo() %>"><%= posting.getTitle() %></a>
						</td>
                        <td><%= posting.getRegDate() %></td>
                        <td><%= posting.getReadCount() %></td>
                    </tr>
		<%		
			 	}
			}
			else {
		%>
					<tr>
						<td colspan="4">조회된 게시글이 없습니다.</td>
					</tr>
		<% 
			}
		%>
                </tbody>
            </table>
		    <%= pagebar %>
        <!-- 수진 end -->
        </div>
    </div> <!-- notice_wrap -->
</div> <!--notice_page_content-->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

