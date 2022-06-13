<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice/notice.css" />

<div class="notice_page_content">
	<h3 class="notice_hd">공지사항</h3>
	<div class="notice_wrap">

		<%@ include file="/WEB-INF/views/common/noticePagebar.jsp"%>
		<div class="notice_cont">
			<!-- FAQ랑 같이 사용 -->
			 <div class="noticeDetail_head">
                <h4 class="notice__head">[이벤트] 샐러드 가격 할인 안내</h4>
            </div>

            <div class="noticeSecond_head">
                <span class="noticeDetail_date">2022-06-08</span>
                <span class="noticeDetail_look">조회수 10</span>
            </div>

            <div class="noticeDetail_view">
                <p>안녕하세요. 샐러브리티입니다.</p>
                <p>사가세요들</p>
                <img src="<%= request.getContextPath() %>/images/noticeSample.png" alt="">
            </div>
            <button class="update_notice" onclick="location.href='<%= request.getContextPath() %>/board/noticeUpdate';">수정</button>
            <button class="delete_notice">삭제</button>
			<button class="back_notice" onclick="location.href='<%= request.getContextPath() %>/board/notice';">글 목록</button>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

