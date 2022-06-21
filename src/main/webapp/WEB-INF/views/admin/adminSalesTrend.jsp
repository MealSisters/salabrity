<%@page import="admin.model.service.AdminService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="admin.model.dto.SalesTrend"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	int MIN_PERIOD = AdminService.CHART_MIN_PERIOD;

	/*------------------------------- 라인 차트 영역 -------------------------------*/
	List<SalesTrend> totalSalesList = (List<SalesTrend>) request.getAttribute("salesData");
	Map<String, Date> period = (Map<String, Date>) request.getAttribute("period");
	
	Date startDate = period.get("startDate");
	Date endDate = period.get("endDate");
	long difflong = endDate.getTime() - startDate.getTime();
	int inPeriodDay = (int) difflong / (24 * 60 * 60 * 1000) + 1;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	
	int[] salesArr = null;
	String[] dateArr = null;
	
	// 매출액 조회결과가 있으면
	if (totalSalesList != null && !totalSalesList.isEmpty()) {
		// 각 배열크기 초기화
		if(inPeriodDay < MIN_PERIOD){
			salesArr = new int[MIN_PERIOD];
			dateArr = new String[MIN_PERIOD];
		} else {
			salesArr = new int[inPeriodDay];
			dateArr = new String[inPeriodDay];
		}
		
		// 배열안에 값 대입
		long initialDate = endDate.getTime();
		for(int i = salesArr.length -1 ; i >= 0; i--){
			Date dateHere = new Date(initialDate);
			String sdfHere = sdf.format(dateHere);

			dateArr[i] = sdfHere;
			for(int j = 0; j < totalSalesList.size(); j ++){
				String compareDate = sdf.format(totalSalesList.get(j).getSalesDate());
				if(compareDate.compareTo(sdfHere) == 0) {
					salesArr[i] = totalSalesList.get(j).getAmount();
				}
			}
			initialDate -= (24 * 60 * 60 * 1000);
		}

	} else { // 매출액 조회결과 없으면	
		if(inPeriodDay < MIN_PERIOD){
			salesArr = new int[MIN_PERIOD];
			dateArr = new String[MIN_PERIOD];
		} else {
			salesArr = new int[inPeriodDay];
			dateArr = new String[inPeriodDay];
		}
		
		Long today = period.get("endDate").getTime();
		for (int i = dateArr.length - 1 ; i >= 0; i--) {
			Date dateHere = new Date(today);
			String sdfHere = sdf.format(dateHere);
			dateArr[i] = sdfHere;
			today -= (24 * 60 * 60 * 1000);
		}
	}

	String salesData = "['";
	String dateData = "['";
	for (int i = 0; i < salesArr.length; i++) {
		if( i != salesArr.length - 1){
			salesData += salesArr[i] + "', '";
			dateData += dateArr[i] + "', '";
		} else {
			salesData += salesArr[i] + "']";
			dateData += dateArr[i] + "']";
		}
	}
	
	/*------------------------------- 라인 차트 영역 -------------------------------*/	
%>
<%
	/*------------------------------- 파이 차트 영역 -------------------------------*/
	List<SalesTrend> topSalesData = (List<SalesTrend>) request.getAttribute("topSalesData");
	Map<String, Date> piePeriod = (Map<String, Date>) request.getAttribute("piePeriod");
	
	String pieProductNames = "['";
	String pieSalesData = "['";
	for (int i = 0 ; i < topSalesData.size() ; i++) {
		if( i != topSalesData.size() - 1 ) {
			pieProductNames += topSalesData.get(i).getProductName() + "', '";	
			pieSalesData += topSalesData.get(i).getAmount() + "', '";				
		} else {
			pieProductNames += topSalesData.get(i).getProductName();
			pieSalesData += topSalesData.get(i).getAmount();
		}
	}
	pieProductNames += "']";
	pieSalesData += "']";
	
	System.out.println("piePeriod = " + piePeriod);
	System.out.println("pieProductNames = " + pieProductNames);
	System.out.println("pieSalesData = " + pieSalesData);
	/*------------------------------- 파이 차트 영역 -------------------------------*/	
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminSalesChart.css">
<script src="<%= request.getContextPath() %>/js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/js/admin/adminchart.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<div class="div-level1">
    <form method="POST" name="chartPeriodFrm" action="<%= request.getContextPath() %>/admin/salesTrend">
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
	                                <input type="date" name="startDate" id="trendStart" value="<%= period.get("startDate") %>">
	                                <span>~</span>
	                                <input type="date" name="endDate" id="trendEnd" value="<%= period.get("endDate") %>">
	                            </div>
	                            <button>조회</button>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                	<td class="td-errMsg">
	                            <p class="p-errMsg"></p>
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
	                                <input type="date" name="topProductStart" id="topProductStart" value="<%= piePeriod.get("startDate") %>">
	                                <span>~</span>
	                                <input type="date" name="topProductEnd" id="topProductEnd" value="<%= piePeriod.get("endDate") %>">
	                            </div>
	                            <button>조회</button>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                	<td class="td-errMsg">
	                            <p class="p-errMsg"></p>
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
    </form>
</div>
<script>
    window.addEventListener('load', () => {
        const lineCanvas = document.getElementById("lineChart");
        printlineChart(lineCanvas, <%= dateData %>, <%= salesData %>);
    
        const pieCanvas = document.getElementById("pieChart");
        printPieChart(pieCanvas, <%= pieProductNames %>, <%= pieSalesData %>);
        document.querySelector("#div-pielegend").innerHTML = window.pieChart.generateLegend();

    });
    
    document.chartPeriodFrm.onsubmit = () => {
    	let result = true;
    	if(document.querySelector("#trendStart").value == "" || document.querySelector("#trendEnd").value == ""){
    		document.querySelector("#div-salesTrend .p-errMsg").innerHTML = "기간을 선택해주세요.";
    		result = false;
    	} else if (document.querySelector("#trendStart").value > document.querySelector("#trendEnd").value) {
    		document.querySelector("#div-salesTrend .p-errMsg").innerHTML = "마지막 탐색기간은 시작기간보다 빠를 수 없습니다.";
    		result = false;
    	} else {
    		document.querySelector("#div-salesTrend .p-errMsg").innerHTML = "";
    	}
    	
    	if(document.querySelector("#topProductStart").value == "" || document.querySelector("#topProductEnd").value == ""){
    		document.querySelector("#div-topSalesProduct .p-errMsg").innerHTML = "기간을 선택해주세요.";
    		result = false;
    	} else if (document.querySelector("#topProductStart").value > document.querySelector("#topProductEnd").value) {
    		document.querySelector("#div-topSalesProduct .p-errMsg").innerHTML = "마지막 탐색기간은 시작기간보다 빠를 수 없습니다.";
    		result = false;
    	} else {
    		document.querySelector("#div-topSalesProduct .p-errMsg").innerHTML = "";
    	}

    	return result;
    }
    
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>