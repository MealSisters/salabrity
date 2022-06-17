<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyResult.css">
	
<link rel="stylesheet" href="surveyResult.css">

<script type="text/javascript"></script>

<div class="survey_result">

	<%
	request.setCharacterEncoding("UTF-8");
	
	// 당뇨케어, 베이비식단
    String[] uniquenessArr = request.getParameterValues("uniq");
    
	for(String uniq : uniquenessArr){
		int n = 0;
		switch(n){
			case 1: 
				// location.replace("");
				break;
			case 2: 
 		 		break;
			}
	}
	
	String gender = request.getParameter("gender");		
	int a = Integer.parseInt(request.getParameter("weightInput"));
	int b = Integer.parseInt(request.getParameter("heightInput"));
	
	b = b/100;
	int bmi = a / (b*b);
	
	if(gender.equals("male")){
	 if(bmi<25){
	  // 일반식단
	 }
	 else if(bmi>25){
	  // 체중조절식단
	 }
	}
	else{
	 if(bmi<23.0){
	  // 일반식단
	 }
	 else if(bmi>23){
	  // 체중조절식단
	 }
	}
	%>
	
	<div class="survey_result_warp"></div>
	<div class="survey_result"></div>
	
	<div>
	<input type="button" id="foward" value="GO BACK" onclick="location.href='javascript:history.go(-1)'">
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

