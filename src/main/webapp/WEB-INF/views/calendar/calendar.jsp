<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- 관리자분기처리 예정 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminCalendar.css">
<div class="div-level1">
    <div class="div-level2 calendarimg-wrapper">
        <img class="calendarimg" src="<%=request.getContextPath() %>/images/food_sample.jpg" alt="">
    </div>
    <div class="div-level2 productName-wrapper">
        <p class="now-productName">황금비율 탄단지 2주</p>
        <form name="selectProductFrm" action="">
            <label>상품변경</label>
            <select name="productName" class="select-product">
                <!-- value에 상품id -->
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
                <!-- (ul>li[data-date]*7)*5 -->
                <ul>
                    <li></li>
                    <li data-wdCode="w1d1">
                        <div class="day-code"><span>Week1 Day1</span></div>
                        <div class="day-btns">
                            <div class="enrollDay-wrapper">
                                <button class="enrollDay" >등록</button>
                            </div>
                        </div>
                    </li>
                    <li data-wdCode="w1d2">
                        <div class="day-code"><span>Week1 Day2</span></div>
                        <div class="day-btns">
                            <div class="enrollDay-wrapper">
                                <button class="enrollDay" >등록</button>
                            </div>
                        </div>
                    </li>
                    <li data-wdCode="w1d3">
                        <div class="day-code"><span>Week1 Day3</span></div>
                        <div class="day-menu"><a href="<%=request.getContextPath() %>/menu/menuInfo?menuNo=">닭가슴살볶음밥</a></div>
                        <div class="day-btns">
                            <div class="modifyDay-wrapper">
                                <button class="modifyDay">수정</button>
                            </div>
                            <div class="deleteDay-wrapper">
                                <button class="deleteDay">삭제</button>
                            </div>
                        </div>
                    </li>
                    <li data-wdCode="w1d4">
                        <div class="day-code"><span>Week1 Day4</span></div>
                        <div class="day-btns">
                            <div class="enrollDay-wrapper">
                                <button class="enrollDay" >등록</button>
                            </div>
                        </div>
                    </li>
                    <li data-wdCode=""></li>
                    <li></li>
                </ul>
                <ul>
                    <li></li>
                    <li data-wdCode=""></li>
                    <li data-wdCode=""></li>
                    <li data-wdCode=""></li>
                    <li data-wdCode=""></li>
                    <li data-wdCode=""></li>
                    <li></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
window.addEventListener('load', () => {
    const enrollBtns = document.querySelectorAll(".enrollDay");
    enrollBtns.forEach((button) => {
        button.addEventListener('click', menuEnrollEvent );
    })
});

const menuEnrollEvent = () => {
	location.href = "<%= request.getContextPath() %>/admin/calendarMenuEnroll?menuId=&data-date=";
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>