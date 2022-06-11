<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>


<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminBoard.css">
<h1 class="boardTitle">1:1문의</h1>
<div class="div-level1">
    <div class="div-level2 div-sidemenu">
        <%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
    </div>
    
    <!-- div-nonedisplay 클래스로 노출 div 선택 -->
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
                    <!-- td.col-no+td.col-title+td.col-memberId+td.col-date+td.col-readCnt -->
                    <tr>
                        <td class="col-no">4</td>
                        <td class="col-status">대기중</td>
                        <td class="col-title"><a>환불해주세요</a></td>
                        <td class="col-memberId">honggd</td>
                        <td class="col-date">2022-04-23</td>
                        <td class="col-readCnt">0</td>
                    </tr>
                    <tr>
                        <td class="col-no">3</td>
                        <td class="col-status">완료</td>
                        <td class="col-title"><a>1주치 시켯는데 2주치 주시면 안되나요?????</a></td>
                    </tr>
                    <tr>
                        <td class="col-no">2</td>
                    </tr>
                    <tr>
                        <td class="col-no">1</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%@ include file="/WEB-INF/views/common/pagebar.jsp" %>
    </div>
    
    <div class="div-level2 div-questionView div-nonedisplay">
        <div class="postingNo-wrapper">
            <span class="span-postiongNo"><span class="span-contentlabel">No.</span>4</span>
        </div>
        <div class="writer-wrapper">
            <span class="span-writer"><span class="span-contentlabel">작성자</span>honngd</span>
            <span class="span-regDate"><span class="span-contentlabel">작성일</span>2022-04-23</span>
        </div>
        <div class="postinghead-wrapper">
            <h3 class="viewtitle">환불해주세요</h3>
        </div>
        <div class="postingbody-wrapper">
            <div class="postingTextContent">
                마음이 변했어요! 빨리 취소해주세요!
                <br>
                샐러드가싫어졌어요!
            </div>
        </div>
        <div class="postingAttach-wrapper div-postingTail">
            <span class="span-contentlabel">첨부파일</span><a href="">샐러드싫음 인증샷.jpg</a>
        </div>
        <div class="buttons-wrapper">
            <div class="div-answer"><button class="btn-answer">답변</button></div>
            <div class="div-cancel"><button class="btn-cancel">뒤로가기</button></div>
        </div>
    </div>
</div>
<script>
    window.addEventListener('load', () => {
        addOpenPostingView();
        addViewBtnEvent();
    });

    const addOpenPostingView = () => {
        const titles = document.querySelectorAll("#tbl-QnAList td.col-title");
        titles.forEach((title) => {
            title.addEventListener('click', () => {
                const hiddenTarget = document.querySelector(".div-board");
                const visibleTarget = document.querySelector(".div-questionView");

                hiddenTarget.classList.add('div-nonedisplay');
                visibleTarget.classList.remove('div-nonedisplay');
            });
        });
    };

    const addViewBtnEvent = () => {
        const cancelBtn = document.querySelector("button.btn-cancel");
        cancelBtn.addEventListener('click', () => {
            const hiddenTarget = document.querySelector(".div-questionView");
            const visibleTarget = document.querySelector(".div-board");

            hiddenTarget.classList.add('div-nonedisplay');
            visibleTarget.classList.remove('div-nonedisplay');
        });

        const submitBtn = document.querySelector("button.btn-answer");
        submitBtn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/board/question/questionReply?postingNo=";
        };
    }
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
