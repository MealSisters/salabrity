<%@page import="menu.model.dto.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
List<Menu> list = (List<Menu>) request.getAttribute("list");
String pagebar = (String) request.getAttribute("pagebar");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/ListSearchFilter.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminResultSetList.css">
<div class="div-level1">
    <p id="filter-wrapper-title">Filter</p>
    <div id="filter-wrapper" class="div-level2">
        <form name="menuFilterFrm" action="" onSubmit="return false;">
            <div class="div-searchFilter">
                <label for="filter-menuId">메뉴ID</label>
                <input type="text" name="menuId" id="filter-menuId">
            </div>
            <div class="div-searchFilter">
                <label for="filter-menuName">메뉴이름</label>
                <input type="text" name="menuName" id="filter-menuName">
            </div>
            <div class="div-searchbtn">
                <button>조회</button>
            </div>
        </form>
    </div>
    <div class="div-level2 div-spacebtween">
        <div class="enrollBtn-wrapper">
            <button class="enrollBtn" type="button">신규메뉴등록</button>
        </div>
        <div class="sort-wrapper">
        	<form action="">
            <span>정렬기준</span>
            <select name="sortBy" class="select-sort">
                <option value="recent">최근등록순</option>
                <option value="name">이름순</option>
                <option value="lowCal">칼로리낮은순</option>
                <option value="highCal">칼로리높은순</option>
            </select>
        	</form>
        </div>
    </div>
    <div class="div-level2 div-resultlist">
        <table id="tbl-menuList" class="tbl-searchResult">
            <thead>
                <tr>
                    <th class="col-no">No</th>
                    <th class="col-menuId">메뉴ID</th>
                    <th class="col-menuName">메뉴이름</th>
                    <th class="col-calorie">칼로리</th>
                    <th class="col-ingredients">재료</th>
                    <th class="col-buttons">수정/삭제</th>
                </tr>
            </thead>
            <tbody>
<%
	if(list != null && !list.isEmpty()){
		for(Menu menu : list){
%>
            <tr>
                <td class="col-no"><%= menu.getMenuNo() %></td>
                <td class="col-menuId"><%= menu.getMenuId() %></td>
                <td class="col-menuName"><%= menu.getMenuName() %></td>
                <td class="col-calorie"><%= menu.getCalorie() %></td>
                <td class="col-ingredients"><%= menu.getIngredients() %></td>
                <td class="col-buttons">
                    <div class="div-modify"><a class="a-modify" href="<%= request.getContextPath() %>/admin/menuUpdate?menuNo=<%= menu.getMenuNo() %>">수정</a></div>
                    <div class="div-cancel"><a class="a-cancel" onclick="deleteMenu(<%= menu.getMenuNo() %>);">삭제</a></div>
                </td>
            </tr>
<%
        }
	} else {
%>
				<tr>
					<td colspan="6">조회된 메뉴가 없습니다.</td>
				</tr>
<%
	}
%>
            </tbody>
        </table>
    </div>
    <link rel='stylesheet' href='<%= request.getContextPath() %>/css/pagebar.css'>
    <%= pagebar %>
</div>
<form 
	name="deleteMenuFrm"
	action="<%= request.getContextPath() %>/admin/menuDelete"
	method="POST">
	<input type="hidden" name="delMenuNo" value="" />
</form>

<script>
    window.addEventListener('load', () => {
        enrollMenu();
        addSortEvent();
    });
    const enrollMenu = () => {
        const btn = document.querySelector(".enrollBtn");
        btn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/admin/menuEnroll";
        };
    }
    
    const deleteMenu = (menuNo) => {
    	document.querySelector("[name=delMenuNo]").value = menuNo;
		if(confirm("메뉴를 삭제하시겠습니까?")){
			document.deleteMenuFrm.submit();
		};
	};
	
	const addSortEvent = () => {
		
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>