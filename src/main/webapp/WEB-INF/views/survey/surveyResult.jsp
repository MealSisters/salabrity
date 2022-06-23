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
	request.setCharacterEncoding("UTF-8");
	
	String uniq = request.getParameter("uniq");
	String gender = request.getParameter("gender");	
	
	double h = Double.parseDouble(request.getParameter("heightInput"));
	double w = Double.parseDouble(request.getParameter("weightInput"));
	
	String mealName[] = { "정갈한 한식 식단", "건강한 400칼로리 식단", "직장인 저당 런치 식단", "어린이 맞춤식단" };
	String mealDesc[] = { "샐브가 선보이는 첫 한식 식단이에요.<br>풍부하고 전통적인 한식만의 맛은 물론 영양도 놓치지 않았죠.<br>샐브의 정갈한 한식으로 건강한 식단관리를 경험해보세요!",
						"영양사 출신 요리사가 만들어 더욱 건강한 체중조절 식단<br>건강관리와 칼로리 조절을 동시에!<br>균형잡힌 샐브만의 건강도시락을 만나보세요.",
						"샐브만의 비법으로 만들어낸 건강하고 든든한 저당 식단<br>직장인들 최대 난제인 점심메뉴해결과 함께 당까지 잡았습니다. ",
						"성장기 어린이를 위한 필수 영양소를 꾹꾹 눌러담은 식단<br>아이에겐 좋은 것만 주고싶은 샐브의 마음을 담았습니다." };
	String imgSrc[] = { "/upload/menu/20220621_120944776_028.jpg",
						"/upload/menu/20220614_175850911_140.jpg",
						"/upload/menu/20220614_231804280_969.jpg",
						"/upload/menu/어린이맞춤식단.jpg"};
	
	String resultName = "";
	String resultDesc = "";
	String resultImg = "";
	int productNo = 0;
	
	h = h/100;
	double bmi = w/(h*h);
	
	 if(uniq !=null){ 
		if(uniq.equals("diabetes")){
			resultName = mealName[2];
			resultDesc = mealDesc[2];
			resultImg = imgSrc[2];
			productNo = 22;
		}
		if(uniq.equals("baby")){
			resultName = mealName[3];
			resultDesc = mealDesc[3];
			resultImg = imgSrc[3];
			productNo = 82;
		}
		}
	 
	if(uniq == null && gender.equals("male")){
		 if(bmi < 25){
			resultName = mealName[0];
			resultDesc = mealDesc[0];
			resultImg = imgSrc[0];
			productNo = 48;
		 }
		 else if(bmi > 25){
			resultName = mealName[1];
			resultDesc = mealDesc[1];
			resultImg = imgSrc[1];
			productNo = 2;
		 }
		}
	if(uniq == null && gender.equals("female")){
		 if(bmi < 23){
			resultName = mealName[0];
			resultDesc = mealDesc[0];
			resultImg = imgSrc[0];
			productNo = 48;
		 }
		 else if(bmi > 23){
			resultName = mealName[1];
			resultDesc = mealDesc[1];
			resultImg = imgSrc[1];
			productNo = 2;
		 }
		}
	%>

<div class="survey_result">

	<div class="survey_result_warp">
	    <h5>My Salabrity Meal</h5>
	    <p>맞춤식단추천</p></div>
	<div class="survey_detail">
		<img id="mealimg" src="<%=request.getContextPath()%><%=resultImg%>">
			<p><%=resultName%></p>
			<%=resultDesc%>
	</div>

 	<button id="foward" onclick="location.href='javascript:history.go(-1)'">다시 찾기</button>
	<button id="detail" onclick="location.href='<%= request.getContextPath() %>/product/productInfo?no=<%= productNo %>'">주문하러가기</button>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

