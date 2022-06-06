<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
            <span>정렬기준</span>
            <select name="sortBy" class="select-sort">
                <option value="">등록일순</option>
                <option value="">이름순</option>
                <option value="">칼로리낮은순</option>
                <option value="">칼로리높은순</option>
            </select>
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
                <tr>
                    <!-- tr>td.col-no{$}+td.col-menuId+td.col-menuName+td.col-calorie+td.col-ingredients -->
                    <td class="col-no">1</td>
                    <td class="col-menuId"></td>
                    <td class="col-menuName"></td>
                    <td class="col-calorie"></td>
                    <td class="col-ingredients"></td>
                    <td class="col-buttons">
                        <div class="div-modify"><a class="a-modify">수정</a></div>
                        <div class="div-cancel"><a class="a-cancel">삭제</a></div>
                    </td>
                </tr>
                <tr>
                    <td class="col-no">2</td>
                    <td class="col-menuId"></td>
                    <td class="col-menuName"></td>
                    <td class="col-calorie"></td>
                    <td class="col-ingredients"></td>
                    <td class="col-buttons">
                        <div class="div-modify"><a class="a-modify">수정</a></div>
                        <div class="div-cancel"><a class="a-cancel">삭제</a></div>
                    </td>
                </tr>
                <tr>
                    <td class="col-no">3</td>
                    <td class="col-menuId"></td>
                    <td class="col-menuName"></td>
                    <td class="col-calorie"></td>
                    <td class="col-ingredients"></td>
                    <td class="col-buttons">
                        <div class="div-modify"><a class="a-modify">수정</a></div>
                        <div class="div-cancel"><a class="a-cancel">삭제</a></div>
                    </td>
                </tr>
                <tr>
                    <td class="col-no">4</td>
                    <td class="col-menuId"></td>
                    <td class="col-menuName"></td>
                    <td class="col-calorie"></td>
                    <td class="col-ingredients"></td>
                    <td class="col-buttons">
                        <div class="div-modify"><a class="a-modify">수정</a></div>
                        <div class="div-cancel"><a class="a-cancel">삭제</a></div>
                    </td>
                </tr>
                <tr>
                    <td class="col-no">5</td>
                    <td class="col-menuId"></td>
                    <td class="col-menuName"></td>
                    <td class="col-calorie"></td>
                    <td class="col-ingredients"></td>
                    <td class="col-buttons">
                        <div class="div-modify"><a class="a-modify">수정</a></div>
                        <div class="div-cancel"><a class="a-cancel">삭제</a></div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <%@ include file="/WEB-INF/views/common/pagebar.jsp" %>
</div>
<script>
    window.addEventListener('load', () => {
        enrollMenu();
    });
    const enrollMenu = () => {
        const btn = document.querySelector(".enrollBtn");
        btn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/admin/menuEnroll";
        };
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>