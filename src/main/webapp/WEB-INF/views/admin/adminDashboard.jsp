<%@page import="board.model.dto.Posting"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Posting> questionList = (List<Posting>) request.getAttribute("questionList");
	Map<String, Object> todayDataMap = (Map<String, Object>) request.getAttribute("todayDataMap");
	String salesTrendData = (String) request.getAttribute("salesTrendData");
	Integer[] memberData = (Integer[]) request.getAttribute("memberData");
	DecimalFormat fm = new DecimalFormat("###,###");
	
	String memberDataStr = "['";
	for(int i = 0 ; i < memberData.length ; i++) {
		if( i != memberData.length - 1){
			memberDataStr += memberData[i] + "', '";
		} else {
			memberDataStr += memberData[i] + "']";
		}
	}
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminDashboard.css">
<script src="https://kit.fontawesome.com/4ade5a15fa.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/js/admin/adminchart.js"></script>

<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.js"></script>
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
                            <p><%= fm.format(todayDataMap.get("sales")) %></p>
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
                            <p><%= fm.format(todayDataMap.get("member")) %></p>
                        </div>
                    </td>
                    <td>
                        <div>
                            <h2>New Posting</h2>
                            <p><%= fm.format(todayDataMap.get("posting")) %></p>
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
                <div><a href="<%= request.getContextPath() %>/admin/QnAList">Go</a></div>
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
<%
	final int MAX = 5;
	int size = questionList.size();
	for(Posting posting : questionList) {
%>
                    <tr>
                        <td><%= posting.getPostingNo() %></td>
                        <td><%= posting.getRegDate() %></td>
                        <td><%= posting.getTitle() %></td>
                    </tr>
<%
	}
	for(int i = 0; i < MAX-size ; i++){
%>
					<tr>
                        <td></td><td></td><td></td>
                    </tr>
<%
	} 
%>
                </tbody>
            </table>
        </div>
        <div>
            <div class="div-174wrap"><a href="<%= request.getContextPath() %>/board/notice">Notice Board</a></div>
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
        	<div class="loading-container">
			    <div class="loading"></div>
			</div>
            <canvas id="barChart-member"></canvas>
        </div>
    </div>

    <div id="div-icons" class="div-level2 bottomdiv">
        <div class="div-icon"><a href="<%= request.getContextPath() %>/product/productList"><i class="fa-solid fa-plate-wheat fa-3x"></i>상품관리</a></div>
        <div class="div-icon"><a href="<%= request.getContextPath() %>/calendar"><i class="fa-solid fa-calendar-days fa-3x"></i>캘린더관리</a></div>
        <div class="div-icon"><a href="<%= request.getContextPath() %>/admin/orderList"><i class="fa-solid fa-receipt fa-3x"></i>주문내역관리</a></div>
        <div class="div-icon"><a href=""><i class="fa-regular fa-comments fa-3x"></i>1:1채팅상담</a></div>
        <div class="div-icon"><a href="<%= request.getContextPath() %>/admin/memberList"><i class="fa-solid fa-unlock fa-3x"></i>역할관리</a></div>
    </div>
</div>
<script>
    window.addEventListener('load', () => {
        const days = recent7Days();
        
		const memberCanvas = document.getElementById("barChart-member");
		printBarChart(memberCanvas, days, <%= memberDataStr %> );
        
        const salesCanvas = document.getElementById("lineChart-sales");
        printlineChart(salesCanvas, days, <%= salesTrendData %>);
        
    });
    
    const memberData = new Array();
    const memberChart = () => {
    	$.ajax({
        	url : "<%= request.getContextPath() %>/admin/memberChart",
        	method : "POST",
        	dataType : "json",
        	data : {
        		days : days.toString()
       		},
        	success(counts){
        		counts.forEach((count) => {
        			memberData.push(count);
        		});
       			const memberCanvas = document.getElementById("barChart-member");
       			printBarChart(memberCanvas, days, memberData);
        	},
        	error : console.log
        });
    }


</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>