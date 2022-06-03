<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminDashboard.css">
<script src="https://kit.fontawesome.com/4ade5a15fa.js" crossorigin="anonymous"></script>

<div class="div-level1">
    <div id="div-summaryData" class="div-level2 leftdiv">
        <table id="tbl-summaryData">
            <thead>
                <tr><th><h1>Today</h1></th></tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div>
                            <h2>Sales</h2>
                            <p>(매출액)</p>
                        </div>
                    </td>
                    <td>
                        <div>
                            <h2>Visitor</h2>
                            <p>(방문자수)</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <h2>New Member</h2>
                            <p>(가입자수)</p>
                        </div>
                    </td>
                    <td>
                        <div>
                            <h2>New Posting</h2>
                            <p>(자유게시판 글 수)</p>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <div id="div-board" class="div-level2 rightdiv">
        <div id="div-QnAboard">
            <div id="div-QnAboard-head">
                <h1>Question</h1>
                <div><a href="">Go</a></div>
            </div>
            <table id="tbl-QnAboard">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Date</th>
                        <th>Title</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>812</td>
                        <td>2022-04-12</td>
                        <td>asd</td>
                    </tr>
                    <tr>
                        <td>812</td>
                        <td>2022-04-12</td>
                        <td>asd</td>
                    </tr>
                    <tr>
                        <td>812</td>
                        <td>2022-04-12</td>
                        <td>asd</td>
                    </tr>
                    <tr>
                        <td>812</td>
                        <td>2022-04-12</td>
                        <td>asd</td>
                    </tr>
                    <tr>
                        <td>812</td>
                        <td>2022-04-12</td>
                        <td>asd</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <div class="div-174wrap"><a href="">Notice Board</a></div>
            <div class="div-174wrap"><a href="">Other Board</a></div>
        </div>
    </div>
    
    <div id="div-salestrend" class="div-level2 leftdiv middlediv">
        <h1><a href="<%= request.getContextPath()%>/admin/salesTrend">Sales Trend</a></h1>
        <div id="div-salestrend-chart">(매출 추이 영역)</div>
    </div>
    
    <div id="div-Members" class="div-level2 rightdiv middlediv">
        <h1>Members</h1>
        <div id="div-members-chart">(가입자 추이 영역)</div>
    </div>

    <div id="div-icons" class="div-level2 bottomdiv">
        <div class="div-icon"><a href=""><i class="fa-solid fa-plate-wheat fa-3x"></i>상품관리</a></div>
        <div class="div-icon"><a href=""><i class="fa-solid fa-calendar-days fa-3x"></i>캘린더관리</a></div>
        <div class="div-icon"><a href=""><i class="fa-solid fa-receipt fa-3x"></i>주문내역관리</a></div>
        <div class="div-icon"><a href=""><i class="fa-regular fa-comments fa-3x"></i>1:1채팅상담</a></div>
        <div class="div-icon"><a href=""><i class="fa-solid fa-unlock fa-3x"></i>역할관리</a></div>
    </div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>