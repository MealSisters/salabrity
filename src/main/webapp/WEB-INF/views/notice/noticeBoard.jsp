<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice/notice.css" />
	
<div class="notice_page_content">
    <h3 class="notice_hd">공지사항</h3>
    <div class="notice_wrap">        
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
                    <tr>
                        <td>01</td>
                        <td><a href="">공지사항1</a></td>
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
                    </tr>
                </tbody>
            </table>

            
        </div>

    </div> <!-- notice_wrap -->
</div> <!--notice_page_content-->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

