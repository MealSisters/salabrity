<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />

	<div class="my_page_content">
<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp" %>	
	
	
	<div class="my_sub_content">
		<h4 class="mypage_hd">작성 게시글</h4>
	
	

</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>