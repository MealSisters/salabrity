<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyResult.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<link rel="stylesheet" href="surveyResult.css">


<div class="survey_result">

<!-- js분리

const select = [0, 0, 0, 0];

// 식단결과계산
function calResult(){
	console.log(select);
	var result = select.indexOf();
	return result;
}

// 식단결과출력
function setResult(){
	
	// 식단명
	let point = calResult();
	const resultName = document.querySelector('.resultname');
	resultName.innerHTML = productList[point].name;
	
	
	// 식단이미지
	var resultImg = document.createElement('img');
	const imgDiv = document.querySelector('#resultImg');
	var imgURL = 'img/image-' + point + '.png';
	resultImg.src = imgURL;
	resultImg.alt = point;
	resultImg.classList.add('img-fluid');
	imgDiv.appendChild(resultImg);

	// 식단설명
	const resultDesc = document.querySelector('.resultDesc');
	resultDesc.innerHTML = productList[point].desc;
}

 -->

<!-- 
	
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

