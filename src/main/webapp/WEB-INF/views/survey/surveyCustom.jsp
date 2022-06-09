<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyCustom.css">

<link rel="stylesheet" href="surveyCustom.css">

  <form action="surveyResult.jsp" method="post">
  <div class="surveyContainer">
  	<div class="h1-container">
      <h1>맞춤 식단 찾기</h1>
    </div>
    
	<div class="gender">
		<input type="radio" name="gender" value="female" checked="checked"> 여자
		<input type="radio" name="gender" value="male"> 남자
    </div>
    
	<div class="survey_height">
		키 <input type="number" id="height" placeholder="cm">
	</div>
	<div class="survey_weight">
		몸무게 <input type="number" id="weight" placeholder="kg">
	</div>
    
    <div class="Uniqueness">
    	해당되는 사항이 있으신가요? <br>
    	<input type="checkbox" name="uniq" value="diabetes"> 당뇨환자
		<input type="checkbox" name="uniq" value="baby"> 유아
    </div>

	<div class="submit">
      <input type="submit" value="GO">
    </div>
  </form>
</div>
	    
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

<%@ include file="/WEB-INF/views/common/footer.jsp" %>