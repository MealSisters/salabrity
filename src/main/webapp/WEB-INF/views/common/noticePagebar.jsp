<%@page import="board.model.dto.BoardCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/notice/notice.css">
<aside class="sub">
    <ul class="sub_notice_box">

        <li class="sub_notice_list"><a href="<%= request.getContextPath() %>/board/notice?boardCode=<%= BoardCode.N %>">공지사항</a></li>
        <li class="sub_notice_list"><a href="<%= request.getContextPath() %>/board/faq">자주 묻는 질문</a></li>
    </ul>
    <div class="cs_center">
        <span class="cs_center_hd">고객센터<br><strong>02-0000-0000</strong></span>
        <p class="cs_center_time">운영시간 <br>
            평일 09:00 ~ 18:00 <br>
            (토/일/공휴일 휴무)</p>
    </div>
</aside>
