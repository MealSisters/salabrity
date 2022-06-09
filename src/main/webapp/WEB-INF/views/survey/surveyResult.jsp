<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/survey/surveyResult.css">
	
<link rel="stylesheet" href="surveyResult.css">

<script type="text/javascript">
</script>

<div class="survey_result">
	<div>
	<%
	request.setCharacterEncoding("UTF-8");
	String gender = request.getParameter("gender");
		if(gender.equals("male")){
		}else{
		}

	String uniquenessArr[] = request.getParameterValues("");
		for(String uniq : uniquenessArr){
			int n = 0;
			switch(n){
				case 1: 
						 break;
				case 2: 
				 		 break;
				}
		}
	%>
	<br>
	<b><a href='javascript:history.go(-1)'>다시</a></b>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

