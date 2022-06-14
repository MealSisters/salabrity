<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyCustom.css">

<link rel="stylesheet" href="surveyCustom.css">

      <form method="post" name="surveyForm">
      <div id="surveyContainer">
      	<div class="h1-container">
          <h1>나만을 위한 식단을 찾아보세요.</h1>
          <h5>아래 상세정보를 입력하시면, 맞춤 식단을 찾아드립니다.</h5>
        </div>

    	<div class="gender">
    		<p>
    		<input type="radio" name="gender" value="female" checked="checked"> 여자
    		</p>
    		<p>
    		<input type="radio" name="gender" value="male"> 남자
			</p>        
       	</div>

    	<div class="survey_height">
    		키 <input type="number" id="height" name="heightInput" placeholder="cm">
    	</div>
    	<div class="survey_weight">
    		몸무게 <input type="number" id="weight" name="weightInput" placeholder="kg">
    	</div>

        <div class="Uniqueness">
        	해당되는 사항이 있으신가요?
        <input type="checkbox" id="uniq" name="uniq" value="diabetes">
        <label for="uniq"> 당뇨환자</label>
    		<input type="checkbox" id="uniq2" name="uniq" value="baby">
        <label for="uniq2"> 유아 </label>
        </div>

    	<div class="submit">
          <input type="button" id="next" value="Find My Salab-Meal" onclick="check_onclick()">
        </div>
       </div>
    </form>
    
<!-- 유효성 검사 -->
<script>
	function check_onclick(){
	    var frm = document.surveyForm;
	      if(frm.heightInput.value=="" && frm.weightInput.value=="" ){
	      alert("상세정보 입력여부를 확인해주세요.")
	        frm.heightInput.focus();
	      	return false; 
	      }
	      if(frm.heightInput.value==""){
	        alert("키가 입력되지 않았습니다. 확인해주세요.")
	        frm.heightInput.focus();
	      	return false; 
	      }
	      if(frm.weightInput.value==""){
	        alert("몸무게가 입력되지 않았습니다. 확인해주세요.")
	        frm.weightInput.focus();
	      	return false; 
	      }
	      frm.action ="surveyResult.jsp";
	      frm.method = "post";
	      frm.submit();
	    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>