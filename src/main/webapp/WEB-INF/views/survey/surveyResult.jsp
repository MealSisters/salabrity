<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyResult.css">
	
<link rel="stylesheet" href="surveyResult.css">

<script type="text/javascript"></script>

<div class="survey_result">

<!-- 
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
-->

	<div class="survey_result_warp">
	    <h5>My Salabrity Meal</h5>
	    <p>맞춤식단추천</p></div>
	<div class="survey_detail">
		<img src="#" width="400">
			<p>식단명</p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>


 	<button id="foward" onclick="location.href='javascript:history.go(-1)'">다시 찾기</button>
	<button id="detail" onclick="#">자세히 보기</button>
	
	

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

