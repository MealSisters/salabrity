<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice/notice.css" />
	
<div class="notice_page_content">
    <h3 class="notice_hd">자주 묻는 질문</h3>
    <div class="notice_wrap">        
    <button type="button" class="btn_notice_enroll">등록</button>
<%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>

   <div class="notice_cont"> <!-- faq랑 같이 사용 -->
            <table class="tbl_faq">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>제목</th>
                        <th>날짜</th>
                      
                    </tr>
                </thead>
                <tbody>
                    <tr id="faq_question" id="test">
                        <td>01</td>
                        <td><a href=""><span>Q.</span> 정기구독 이용 중 수령일 / 주소지 변경이 가능한가요?</a></td>
                        <td>2022-06-08</td>
                       
                    </tr>
                   
                    <tr class="toggle faq" id="toggle_faq">
                        <td colspan="3"> 
                            <div class="faq_content" id="abc">
                                <p>정기 구독 이용 중에 주소지 변경이 가능한가요?</p>
                            </div>

                            <div class="faq_comment"> 
                                <p>A. 상품 준비 중인 경우 변경이 가능합니다.</p>
                                <p>채팅상담/1:1문의/고객센터를 통해 요청해주세요.</p>
                                <p style="color : green;">답변은 토글 형식, 비동기로 구현 예정...</p>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>


    </div> <!-- notice_wrap -->
</div> <!--notice_page_content-->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>