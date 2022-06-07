<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/enroll.css">
<div class="div-level1">
    <h1 class="pageTitle">메뉴정보</h1>
    <form name="menuEnrollFrm" action="">
        <div class="formLine-wrapper">
            <label for="menuId">메뉴ID</label>
            <input type="text" name="menuId">
            <div class="uniqueCkeck-wrapper">
                <button type="button" class="uniqueCkeckBtn">중복검사</button>
            </div>
        </div>
        <div class="formLine-wrapper">
            <label for="menuName">메뉴이름</label>
            <input type="text" name="menuName">
        </div>
        <div class="formLine-wrapper">
            <label for="calorie">칼로리</label>
            <input type="number" name="calorie"><span>kcal</span>
        </div>
        <div class="formLine-wrapper">
            <label for="menuAttach">이미지</label>
            <input type="file" name="menuAttach" id="menuAttach" accept="image/*">
            <div class="upfileBtn-wrapper">
                <button type="button">파일 선택</button>
            </div>
            <p class="upfileName"></p>
        </div>
        <div class="formLine-wrapper textarea-wrapper">
            <label for="ingredients">재료</label>
            <textarea name="ingredients" id="" cols="130" rows="2" placeholder="각 재료를 ,(콤마)로 구분해주세요."></textarea>
        </div>
        <div class="formLine-wrapper textarea-wrapper">
            <label for="menuDescription">소개</label>
            <textarea name="menuDescription" id="" cols="130" rows="5" placeholder="메뉴를 설명해주세요."></textarea>
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
        upFile();
        goToMenuList();
    });

    const upFile = () => {
        const fileInput = document.querySelector("#menuAttach");
        fileInput.addEventListener('change', (e) => {
            const fileNameTag = document.querySelector("p.upfileName");
            fileNameTag.innerHTML = e.target.files[0].name;
        });
        const btn = document.querySelector(".upfileBtn-wrapper button");
        btn.addEventListener('click', () => {
            const target = document.querySelector("#menuAttach");
            target.click();
        });
    };

    const goToMenuList = () => {
        const btn = document.querySelector(".cancelBtn");
        btn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/admin/menuList";
        };
    };
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>