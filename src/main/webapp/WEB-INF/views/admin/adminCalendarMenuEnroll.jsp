<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/enroll.css">

<div class="div-level1">
    <h1 class="pageTitle">캘린더 등록</h1>
    <form name="calendarEnrollFrm" action="">
        <div class="formLine-wrapper">
            <label for="">상품이름</label>
            <p class="fixed-data productName">황금비율 탄단지 2주</p>
            <input type="hidden" name="productId" value="">
        </div>
        <div class="formLine-wrapper">
            <label for="data-wdCode">선택일자</label>
            <p class="fixed-data cal-date">Week1 Day1</p>
            <input type="hidden" name="data-wdCode" value="">
        </div>
        <div class="formLine-wrapper">
            <div class="menuList-wrapper">
                <label for="">식단선택</label>
                <div class="menutable-wrapper">
                    <div class="menuList-top">
                        <div class="col-radio"><p>선택</p></div>
                        <div class="col-menuName"><p>메뉴이름</p></div>
                        <div class="col-menuId"><p>메뉴ID</p></div>
                        <div class="col-menuCalorie"><p>칼로리</p></div>
                    </div>
                    <div class="menu-wrapper">
                        <input type="radio" class="menu-radio" name="menuId" value="">
                        <p class="p-menuName">닭가슴살 샐러드</p>
                        <p class="p-menuId">chickenbreastsalad_1</p>
                        <p class="p-menuCalorie">720</p>
                    </div>
                    <div class="menu-wrapper">
                        <input type="radio" class="menu-radio" name="menuId" value="">
                        <p class="p-menuName">연어 샐러드</p>
                        <p class="p-menuId">salmonsalad_2</p>
                        <p class="p-menuCalorie">650</p>
                    </div>
                    <div class="menu-wrapper">
                        <input type="radio" class="menu-radio" name="menuId" value="">
                        <p class="p-menuName">연어 샐러드</p>
                        <p class="p-menuId">salmonsalad_2</p>
                        <p class="p-menuCalorie">650</p>
                    </div>
                    <div class="menu-wrapper">
                        <input type="radio" class="menu-radio" name="menuId" value="">
                        <p class="p-menuName">연어 샐러드</p>
                        <p class="p-menuId">salmonsalad_2</p>
                        <p class="p-menuCalorie">650</p>
                    </div>
                    <div class="menu-wrapper">
                        <input type="radio" class="menu-radio" name="menuId" value="">
                        <p class="p-menuName">연어 샐러드</p>
                        <p class="p-menuId">salmonsalad_2</p>
                        <p class="p-menuCalorie">650</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="formLine-wrapper buttons-wrapper">
            <div class="enrollBtn-wrapper">
                <button class="enrollBtn">등록</button>
            </div>
            <div class="cancelBtn-wrapper">
                <button type="button" class="cancelBtn">취소</button>
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
        location.href = "<%= request.getContextPath() %>/admin/calendar?menuId=";
    }
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>