<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyCustom.css">
	

<link rel="stylesheet" href="surveyCustom.css">


<div class="survey_box">

	<div class="survey_gen">	
	
		<input type="radio" name="gender" value="female" checked="checked"> 여자
		<input type="radio" name="gender" value="male"> 남자	
	</div>
	<div class="survey_bmi">
		<p>
		  키를 입력해주세요. : <input type="number" id="height"/> cm
		</p>
	
		<p>
		  몸무게를 입력해주세요 : <input type="number" id="weight"/> kg
		</p>
	</div>
		<script type="text/javascript">	
		  function(){
			    document.getElementById("button").onclick = function(){
			       var h = parseFloat(document.getElementById("height").value);
			       var w = parseFloat(document.getElementById("weight").value);
			       var bmi = document.getElementById("");
			  }

			function surbeyCheck(){ 
				
		        var form = document.make_form; 
		        if(form.question.value.length==0) 
		        { 
	                alert("질문"); 
	                form.question.focus(); 
	                return false; 
		        } 
		        if(form.answer1.value.length==0) 
		        { 
	                alert("답변1"); 
	                form.answer1.focus(); 
	                return false; 
		        } 
		        if(form.answer2.value.length==0) 
		        { 
	                alert("답변2"); 
	                form.answer2.focus(); 
	                return false; 
		        } 
		        form.submit(); 
		} 
		</script>
		
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>