<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu/menuInfo.css">
<div class="div-level1">
    <h3>메뉴정보</h3>
    <div class="div-level2">
        <div class="img-wrapper">
            <img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="">
        </div>
        <div class="menuInfo-wrapper">
            <div class="mainInfo-wrapper">
                <div class="menuInfo-top">
                    <p class="menuName">닭가슴살볶음밥</p>
                    <p class="calorie">700<span>Kcal</span></p>
                </div>
                <div class="menuInfo-middle">
                    <p class="menuDesc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere recusandae aliquid magnam odio dicta commodi.</p>
                </div>
            </div>
            <div class="menuInfo-bottom">
                <p class="ingredients">쌀(국산), 닭가슴살(국산), 곤약, 양파, 당근, 청피망, 홍파프리카, 대파, 애호박, 가공버터, 마늘, 정제소금, 설탕, 참기름, 혼합간장, 향미증진제, 흑후추분</p>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>