<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminDashboard.css">
<script src="https://kit.fontawesome.com/4ade5a15fa.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/js/admin/adminchart.js"></script>

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
                            <p>1,000,000</p>
                        </div>
                    </td>
                    <td>
                        <div>
                            <h2>Visitor</h2>
                            <p>300</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <h2>New Member</h2>
                            <p>20</p>
                        </div>
                    </td>
                    <td>
                        <div>
                            <h2>New Posting</h2>
                            <p>1,234</p>
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
            <div class="div-174wrap"><a href="<%= request.getContextPath() %>/board/community">Other Board</a></div>
        </div>
    </div>
    
    <div id="div-salestrend" class="div-level2 leftdiv middlediv">
        <a href="<%= request.getContextPath() %>/admin/salesTrend"><h1>Sales Trend</h1></a>
        <div id="div-salestrend-chart">
            <canvas id="lineChart-sales"></canvas>
        </div>
    </div>
    
    <div id="div-Members" class="div-level2 rightdiv middlediv">
        <h1>Members</h1>
        <div id="div-members-chart">
            <canvas id="lineChart-member"></canvas>
        </div>
    </div>

    <div id="div-icons" class="div-level2 bottomdiv">
        <div class="div-icon"><a href="<%= request.getContextPath() %>/product/productList"><i class="fa-solid fa-plate-wheat fa-3x"></i>상품관리</a></div>
        <div class="div-icon"><a href="<%= request.getContextPath() %>/admin/calendar"><i class="fa-solid fa-calendar-days fa-3x"></i>캘린더관리</a></div>
        <div class="div-icon"><a href="<%= request.getContextPath() %>/admin/orderList"><i class="fa-solid fa-receipt fa-3x"></i>주문내역관리</a></div>
        <div class="div-icon"><a href=""><i class="fa-regular fa-comments fa-3x"></i>1:1채팅상담</a></div>
        <div class="div-icon"><a href="<%= request.getContextPath() %>/admin/memberList"><i class="fa-solid fa-unlock fa-3x"></i>역할관리</a></div>
    </div>
</div>
<script>
    window.addEventListener('load', () => {
        const days = ['2022-05-23', '2022-05-24', '2022-05-25', '2022-05-26', '2022-05-27', '2022-05-28'];
        
        const salesCanvas = document.getElementById("lineChart-sales");
        const salesData = [100000, 123000, 85000, 104000, 146700, 137000];
        printlineChart(salesCanvas, days, salesData);

        const memberCanvas = document.getElementById("lineChart-member");
        const memberData = [10, 3, 5, 19, 16, 7];
        printlineChart(memberCanvas, days, memberData);
    });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>