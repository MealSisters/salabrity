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
    <div class="div-level2 div-board ">
        <div class="div-level3">
            <table id="tbl-QnAList" class="tbl-searchResult">
                <thead>
                    <tr>
                        <th class="col-no">No</th>
                        <th class="col-title">제목</th>
                        <th class="col-memberID">작성자</th>
                        <th class="col-date">작성일</th>
                        <th class="col-readCnt">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- td.col-no+td.col-title+td.col-memberId+td.col-date+td.col-readCnt -->
                    <tr>
                        <td class="col-no">4</td>
                        <td class="col-title"><a href="">환불해주세요</a></td>
                        <td class="col-memberId">honggd</td>
                        <td class="col-date">2022-04-23</td>
                        <td class="col-readCnt">0</td>
                    </tr>
                    <tr>
                        <td class="col-no">3</td>
                        <td class="col-title"><a href="">1주치 시켯는데 2주치 주시면 안되나요</a></td>
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
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
