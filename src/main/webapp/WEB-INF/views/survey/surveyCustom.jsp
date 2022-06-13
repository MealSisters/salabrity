<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyCustom.css">

<link rel="stylesheet" href="surveyCustom.css">

      <form action="surveyResult.jsp" method="post" name="surveyform">
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
    		키 <input type="number" id="height" placeholder="cm">
    	</div>
    	<div class="survey_weight">
    		몸무게 <input type="number" id="weight" placeholder="kg">
    	</div>

        <div class="Uniqueness">
        	해당되는 사항이 있으신가요?
        <input type="checkbox" id="uniq" name="uniq" value="diabetes">
        <label for="uniq"> 당뇨환자</label>
    		<input type="checkbox" id="uniq2" name="uniq" value="baby">
        <label for="uniq2"> 유아 </label>
        </div>

    	<div class="submit">
          <input type="submit" id="next" value="Find My Salab-Meal">
        </div>
       </div>
    </form>

	    
	<script type="text/javascript"> // 미선택시 메시지 미완성
		var survey = new Survey.Model(surveyJSON);
		$("#surveyContainer").Survey({
		    model: survey,
		    onComplete: sendDataToServer
		});
				$('button.survey-btn').click(function(){
				    var error='';
				    $('div.surveys').each(function(){
				        var survaysName=$(this).find('div.gender').text();
				        var checkBtn=$(this).find('input[type="radio"]:checked');
				        if(!checkBtn.length){
				            error+=gender+'가 입력되지 않았습니다.\n';
				        }
				    });
				    if(error) alert(error);
				});
	</script>

<!-- <SCRIPT language="javaScript">

 	function check_onclick(){
      survey=document.surveyform;
	   if(survey.input1.value=="" || survey.input2.value=="" || survey.input3.value=="" ){
           if(survey.input1.value==""){
                alert("")
                return survey.input1.focus();
           }else if(theForm.input2.value==""){
                alert("")
                return survey.input2.focus();
     		}
		}

	</SCRIPT> -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>