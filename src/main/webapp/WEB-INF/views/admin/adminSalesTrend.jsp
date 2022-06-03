<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminSalesChart.css">
<script src="<%= request.getContextPath() %>/js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/js/admin/adminchart.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<div class="div-level1">
    <div id="div-salesTrend" class="div-level2">
        <table>
            <thead>
                <tr>
                    <th><h1>Sales Trend</h1></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="div-searchfilter">
                            <label for="trendStart">조회기간</label>
                            <div class="input-period">
                                <input type="date" name="startDate" id="trendStart">
                                <span>~</span>
                                <input type="date" name="endDate" id="trendEnd">
                            </div>
                            <button>조회</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="div-lineChart" class="div-chart">
                            <canvas id="lineChart"></canvas>
                            <div id='div-linelegend' class="div-legend"></div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="div-topSalesProduct" class="div-level2">
        <table>
            <thead>
                <tr>
                    <th><h1>Top Sales Product</h1></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="div-searchfilter">
                            <label for="topProductStart">조회기간</label>
                            <div class="input-period">
                                <input type="date" name="startDate" id="topProductStart">
                                <span>~</span>
                                <input type="date" name="endDate" id="topProductEnd">
                            </div>
                            <button>조회</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="div-pieChart" class="div-chart">
                            <canvas id="pieChart"></canvas>
                            <div id='div-pielegend' class="div-legend"></div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script>
    window.addEventListener('load', () => {
        const lineCanvas = document.getElementById("lineChart");
        const days = ['2022-05-23', '2022-05-24', '2022-05-25', '2022-05-26', '2022-05-27', '2022-05-28'];
        const salesData1 = [100000, 123000, 85000, 104000, 146700, 137000];
        printlineChart(lineCanvas, days, salesData1);
    
        const pieCanvas = document.getElementById("pieChart");
        const labels = ['고단백다이어터2주', '완벽탄단지비건1주', '혈당관리3주', '500칼로리식단2주', '섬유질듬뿍1주']
        const salesData2 = [216700, 137000, 123000, 104000, 90000];
        printPieChart(pieCanvas, labels, salesData2);
        document.querySelector("#div-pielegend").innerHTML = window.pieChart.generateLegend();

    });
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>