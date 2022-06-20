<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyResult.css">
<!-- jQuery
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
-->
<script type="text/javascript"></script>


<%
	request.setCharacterEncoding("EUC-KR");

	String mealName[] = { "일반식단", "체중조절식단", "저당식단", "베이비식단" };
	String mealDesc[] = { "일반식단 설명", "체중조절식단 설명", "저당식단 설명", "베이비식단 설명" };
	
	String uniq = request.getParameter("uniq");
	String gender = request.getParameter("gender");	
	
	
	int h = Integer.parseInt(request.getParameter("heightInput"));
	int w = Integer.parseInt(request.getParameter("weightInput"));

	 
	String resultName = "";
	String resultDesc = "";
	h = (h/100);
	int bmi = (w / (h*h));
	
	 if(uniq !=null){ 
	for(int i=1; i<5; i++){
		if(uniq.equals("diabetes")){
			resultName = mealName[2];
			resultDesc = mealDesc[2];
		}
		if(uniq.equals("baby")){
			resultName = mealName[3];
			resultDesc = mealDesc[3];
		}
		}
	 }
		if(uniq == null && gender.equals("male")){
			 if(bmi<25){
				resultName = mealName[0];
				resultDesc = mealDesc[0];
			 }
			 else if(bmi>25){
				resultName = mealName[1];
				resultDesc = mealDesc[1];
			 }
			}
		if(uniq == null && gender.equals("female")){
			 if(bmi<23.0){
				resultName = mealName[0];
				resultDesc = mealDesc[0];
			 }
			 else if(bmi>23){
				resultName = mealName[1];
				resultDesc = mealDesc[1];
			 }
			}

%>

<div class="survey_result">

	<div class="survey_result_warp">
	    <h5>My Salabrity Meal</h5>
	    <p>맞춤식단추천</p></div>
	<div class="survey_detail">
		<img src="#" width="400">
			<p><%=resultName%></p>
			<%=resultDesc%>
				</div>


 	<button id="foward" onclick="location.href='javascript:history.go(-1)'">다시 찾기</button>
	<button id="detail" onclick="<%=request.getContextPath()%>/product/productList"></button>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

