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
	
	<div class="survey_result_warp">
    <p>My Salabrity Meal</p>
    <p>맞춤식단추천</p></div>
	<div class="survey_detail">
		<p><img src="#" width="400">식단명</p>
		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
	</div>


 	<button id="foward" onclick="location.href='javascript:history.go(-1)'">다시 찾기</button>
	<button id="detail" onclick="#">식단 정보 확인</button>
	
	

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

