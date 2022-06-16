<%@page import="product.model.dto.ProductExt"%>
<%@page import="java.util.Map"%>
<%@page import="calendar.model.dto.CalendarExt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
Map<String, CalendarExt> calMap = (Map<String, CalendarExt>) request.getAttribute("calMap");
List<ProductExt> productList = (List<ProductExt>) request.getAttribute("productList");
ProductExt recentProduct = (ProductExt) request.getAttribute("recentProduct");
String recentProductName = recentProduct.getProductName();
ProductExt productHere = (ProductExt) request.getAttribute("productHere");

String productName = "";
if(productHere != null)
	productName = productHere.getProductName();

System.out.println("productList@jsp = " + productList);
System.out.println("recentProduct@jsp = " + recentProduct);
System.out.println("productHere@jsp = " + productHere);
System.out.println("calMap@jsp = " + calMap);
%>

<!-- 관리자분기처리 예정 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminCalendar.css">
<div class="div-level1">
    <div class="div-level2 calendarimg-wrapper">
        <img class="calendarimg" src="<%=request.getContextPath() %>/images/food_sample.jpg" alt="">
    </div>
    <div class="div-level2 productName-wrapper">
        <p class="now-productName"><%=  productHere!=null ? productHere.getProductName() : ( recentProduct!=null ? recentProduct.getProductName() : "캘린더 준비중") %></p>
        <form name="selectProductFrm" action="">
            <label>상품변경</label>
            <select name="productName" class="select-product">
                <!-- value에 상품id -->
<% for(ProductExt product : productList) { %>
                <% }%>
                <option value="">황금비율 탄단지 2주</option>
                <option value="">혈당관리 2주</option>
            </select>
        </form>
    </div>
    <div class="div-level2 monthPlan-calendar">
        <div class="calendar-content">
            <div class="head">
                <ul>
                    <li>SUNDAY</li>
                    <li>MONDAY</li>
                    <li>TUESDAY</li>
                    <li>WEDNESDAY</li>
                    <li>THURSDAY</li>
                    <li>FRIDAY</li>
                    <li>SATURDAY</li>
                </ul>
            </div>
            <div class="body">
<% 
	if(calMap != null && !calMap.isEmpty()) {
		for(int i = 1; i <= 2; i++){
%>
				<ul>
<% 
			for(int j = 0; j < 7 ; j++) {
				if(j > 0 &&  j < 6) {
%>					
					<li data-wdCode="W<%= i %>D<%= j %>">
						<div class="day-code"><span>Week<%= i %> Day<%= j %></span></div>
<% 
					if(calMap.get("W"+i+"D"+j) != null) {
						CalendarExt cal = calMap.get("W"+i+"D"+j);
%>
						<div class="day-menu"><a href="<%=request.getContextPath() %>/menu/menuInfo?menuNo=<%= cal.getMenuNo() %>"><%= cal.getMenuName() %></a></div>
                        <div class="day-btns">
                            <div class="modifyDay-wrapper">
                                <button class="modifyDay">수정</button>
                            </div>
                            <div class="deleteDay-wrapper">
                                <button class="deleteDay">삭제</button>
                            </div>
                        </div>
<% 
					} else { 
%>
                        <div class="day-btns">
                            <div class="enrollDay-wrapper">
                                <button class="enrollDay" >등록</button>
                            </div>
                        </div>
<% 
					}
%>
					</li>
<% 
				} else { 
%>
					<li></li>
<% 
				}
			} 
%>
				</ul>
<%
		}
	} else if(recentProductName != null) {
		for(int i = 1; i <= 2; i++){
%>
				<ul>
<% 
			for(int j = 0; j < 7 ; j++) {
				if(j > 0 &&  j < 6) {
%>
					<li data-wdCode="W<%= i %>D<%= j %>">
						<div class="day-code"><span>Week<%= i %> Day<%= j %></span></div>
						<div class="day-btns">
                            <div class="enrollDay-wrapper">
                                <button class="enrollDay">등록</button>
                            </div>
                        </div>
					</li> 
				<% } else { %>
					<li></li>
<%
				}
			} 
%>
				</ul>
<%
		}
	}
%>
            </div>
        </div>
    </div>
</div>
<script>
window.addEventListener('load', () => {
    const enrollBtns = document.querySelectorAll(".enrollDay");
    enrollBtns.forEach((button) => {
        button.addEventListener('click', menuEnrollEvent);
    })
});

const menuEnrollEvent = (e) => {
	const targetli = e.target.parentElement.parentElement.parentElement;
	const dataWdCode = $(targetli).attr("data-wdCode");
	location.href = `<%= request.getContextPath() %>/admin/calendarMenuEnroll?productNo=<%= productHere!=null? productHere.getProductNo() : ( recentProduct!=null ? recentProduct.getProductNo() : "" ) %>&data-date=\${dataWdCode}`;
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>