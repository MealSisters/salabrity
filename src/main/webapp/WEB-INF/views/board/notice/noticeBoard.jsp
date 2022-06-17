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
	
	String noticeBoardSelect = (String) request.getAttribute("noticeBoardSelect");
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
	<% } %>
<%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
		<input type="hidden" name="noticeBoardSelect" value="general" />
		<input type="hidden" name="noticeBoardSelect" value="event" />
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
        <!-- 수진 end -->
                   <%--  <tr>
                        <td><%= posting.getPostingNo() %></td>
                        <td><a href="<%= request.getContextPath() %>/board/noticeView">[이벤트] 가격 할인 안내</a></td>
                        <td>2022-06-08</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>02</td>
                        <td><a href="">공지사항2</a></td>
                        <td>2022-06-08</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>03</td>
                        <td><a href="">공지사항3</a></td>
                        <td>2022-06-08</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>04</td>
                        <td><a href="">공지사항4</a></td>
                        <td>2022-06-08</td>
                        <td>0</td>
                    </tr> --%>
        <!-- 수진 start -->
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

