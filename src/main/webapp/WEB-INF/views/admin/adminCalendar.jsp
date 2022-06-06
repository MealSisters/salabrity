<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminCalendar.css">
<div class="div-level1">
    <div class="div-level2">
        <!-- 상품선택 폼 출력 -->
    </div>
    <div class="div-level2 monthPlan-calendar">
        <div class="calendar-top">
            <div class="prev"><i class="fa-solid fa-angle-left"></i></div>
            <p class="calendar-title">2022년 6월</p>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
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
                    <li></li>
                    <li></li>
                    <li data-date="2022-06-01">
                        <div class="day-num"><span>1</span></div>
                        <div class="day-menu"><span>닭가슴살볶음밥</span></div>
                        <div class="day-btns">
                            <div class="modifyDay-wrapper">
                                <button class="modifyDay">수정</button>
                            </div>
                            <div class="deleteDay-wrapper">
                                <button class="deleteDay">삭제</button>
                            </div>
                        </div>
                    </li>
                    <li data-date="2022-06-02">
                        <div class="day-num"><span>2</span></div>
                        <div class="day-btns">
                            <div class="enrollDay-wrapper">
                                <button class="enrollDay">등록</button>
                            </div>
                        </div>
                    </li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                </ul>
                <ul>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                </ul>
                <ul>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                </ul>
                <ul>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                </ul>
                <ul>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li data-date=""></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>