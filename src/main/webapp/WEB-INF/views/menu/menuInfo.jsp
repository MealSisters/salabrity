<%@page import="menu.model.dto.MenuAttach"%>
<%@page import="menu.model.dto.MenuExt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	MenuExt menu = (MenuExt) request.getAttribute("menu");
	MenuAttach attach = menu.getMenuAttach();
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu/menuInfo.css">
<div class="div-level1">
    <h3>메뉴정보</h3>
    <div class="div-level2">
        <div class="img-wrapper">
            <img src="<%= request.getContextPath() %>/upload/menu/<%= attach.getRenamedFileName() %>" alt="<%= request.getContextPath() %>/upload/menu/<%= attach.getOriginalFileName() %>">
        </div>
        <div class="menuInfo-wrapper">
            <div class="mainInfo-wrapper">
                <div class="menuInfo-top">
                    <p class="menuName"><%= menu.getMenuName() %></p>
                    <p class="calorie"><%= menu.getCalorie() %><span>Kcal</span></p>
                </div>
                <div class="menuInfo-middle">
                    <p class="menuDesc"><%= menu.getMenuDescription() %></p>
                </div>
            </div>
            <div class="menuInfo-bottom">
                <p class="ingredients"><%= menu.getIngredients() %></p>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>