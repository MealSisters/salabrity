<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminSalesChart.css">
<script src="<%= request.getContextPath() %>/js/Chart.min.js"></script>

<div class="return-dashboard">
    <a class="return-dashboard" href="">
        <i class="fa-solid fa-chevron-left"></i>대시보드로 돌아가기
    </a>
</div>
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
                            <input type="date" name="startDate" id="trendStart">
                            <span>~</span>
                            <input type="date" name="endDate" id="trendEnd">
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
                            <input type="date" name="startDate" id="topProductStart">
                            <span>~</span>
                            <input type="date" name="endDate" id="topProductEnd">
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
    window.onload = () => {
        printlineChart();

        printPieChart();
        document.querySelector("#div-pielegend").innerHTML = window.pieChart.generateLegend();
    };
    const printlineChart = () => {
        const days = ['2022-05-23', '2022-05-24', '2022-05-25', '2022-05-26', '2022-05-27', '2022-05-28'];
        const salesData = [100000, 123000, 85000, 104000, 146700, 137000];
        const context = document.getElementById("lineChart").getContext("2d");

        const lineChart = new Chart(context, {
            type: 'line',
            data: { // 차트에 들어갈 데이터
                labels: days,
                datasets: [
                    { // 데이터(계열당 중괄호 하나)
                        label: '일매출',
                        lineTension: 0,
                        backgroundColor: 'rgba(255,255,255,0)',
                        borderColor: 'rgb(17, 105, 22)',
                        borderWidth: 2,
                        data: salesData
                    }

                ]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                }
            }
        })
    };
    const printPieChart = () => {
      
        const labels = ['고단백다이어터2주', '완벽탄단지비건1주', '혈당관리3주', '500칼로리식단2주', '섬유질듬뿍1주']
        const salesData = [216700, 137000, 123000, 104000, 90000];

        const context = document.getElementById("pieChart").getContext("2d");
        window.pieChart = new Chart(context, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    data: salesData,
                    backgroundColor: [
                        'rgb(185, 191, 4)',
                        'rgb(17, 105, 22)',
                        'rgb(191, 38, 4)',
                        'rgb(102, 115, 2)',
                        'rgb(56, 64, 1)'
                    ]
                }]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                legendCallback: customLegend
            }
        });
    };

    let customLegend = (chart) => {
        let ul = document.createElement('ul');
        let color = chart.data.datasets[0].backgroundColor;

        chart.data.labels.forEach(function (label, index) {
            ul.innerHTML += `<li>
                    <span style="background-color: \${color[index]}"></span>
                    <span class="span-customlabel-pie">\${label}</span>
                </li>`;
        });

        return ul.outerHTML;
    };


</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>