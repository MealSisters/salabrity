<%@page import="calendar.model.dto.WeekDayCode"%>
<%@page import="menu.model.dto.MenuExt"%>
<%@page import="product.model.dto.ProductMenu"%>
<%@page import="java.util.List"%>
<%@page import="product.model.dto.ProductExt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	ProductExt product = (ProductExt) request.getAttribute("product");
	List<MenuExt> menuList = (List<MenuExt>) request.getAttribute("menuList");
	WeekDayCode dataDate = (WeekDayCode) request.getAttribute("dataDate");
	String dateCode = dataDate.toString();
	System.out.println("check! " + dataDate);
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/enroll.css">
<div class="div-level1">
    <h1 class="pageTitle">캘린더 등록</h1>
    <form method="POST" name="calendarEnrollFrm" action="<%=request.getContextPath()%>/admin/calendarMenuEnroll">
        <div class="formLine-wrapper">
            <label for="">상품이름</label>
            <p class="fixed-data productName"><%= product.getProductName() %></p>
            <input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
        </div>
        <div class="formLine-wrapper">
            <label for="data-wdCode">선택일자</label>
            <p class="fixed-data cal-date">Week<%= dateCode.charAt(1) %> Day<%= dateCode.charAt(3) %></p>
            <input type="hidden" name="data-wdCode" value="<%= dataDate %>">
        </div>
        <div class="formLine-wrapper">
            <div class="menuList-wrapper">
                <label class="label-includeMsgspan">식단선택 <span class="inputErrMsg"></span></label>
                <div class="menutable-wrapper">
                    <div class="menuList-top">
                        <div class="col-radio"><p>선택</p></div>
                        <div class="col-menuName"><p>메뉴이름</p></div>
                        <div class="col-menuId"><p>메뉴ID</p></div>
                        <div class="col-menuCalorie"><p>칼로리</p></div>
                    </div>
<% 
	for(MenuExt menu : menuList) {
%>
					<div class="menu-wrapper">
                        <input type="radio" class="menu-radio" name="menuNo" value="<%= menu.getMenuNo() %>">
                        <p class="p-menuName"><%= menu.getMenuName() %></p>
                        <p class="p-menuId"><%= menu.getMenuId() %></p>
                        <p class="p-menuCalorie"><%= menu.getCalorie() %></p>
                    </div>
<% 
	} 
%>
                </div>
            </div>
        </div>
        <div class="formLine-wrapper buttons-wrapper">
            <div class="enrollBtn-wrapper">
                <button type="submit" class="enrollBtn">등록</button>
            </div>
            <div class="cancelBtn-wrapper">
                <button class="cancelBtn">취소</button>
            </div>
        </div>
    </form>
</div>
<script>
    window.addEventListener('load', () => {
        const cancelBtn = document.querySelector(".cancelBtn");
        cancelBtn.addEventListener('click', goBack );
    });

    const goBack = () => {
        location.href = "<%= request.getContextPath() %>/calendar?productNo=<%= product.getProductNo()%>";
    }
    
    document.calendarEnrollFrm.onsubmit = () => {
    	let result = true;
    	const checkedMenu = document.querySelectorAll("[name=menuNo]:checked");
		if(checkedMenu.length == 0) {
			document.querySelector(".menuList-wrapper .inputErrMsg").innerHTML = "메뉴를 선택해주세요";
			result = false;
		} else document.querySelector(".menuList-wrapper .inputErrMsg").innerHTML = "";
		return result;
    }
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>