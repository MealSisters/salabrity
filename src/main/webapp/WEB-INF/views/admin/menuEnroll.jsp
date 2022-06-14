<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/enroll.css">
<div class="div-level1">
    <h1 class="pageTitle">메뉴정보</h1>
    <form method="POST" name="menuEnrollFrm" action="<%=request.getContextPath()%>/admin/menuEnroll" enctype="multipart/form-data">
        <div class="formLine-wrapper">
            <label for="menuId">메뉴ID</label>
            <input type="text" name="menuId" id="menuId">
            <div class="uniqueCkeck-wrapper">
                <button type="button" class="uniqueCkeckBtn" onclick="checkIdDuplicate();">중복검사</button>
            </div>
            <span class="goodMsg"></span>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="menuName">메뉴이름</label>
            <input type="text" name="menuName" id="menuName">
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="calorie">칼로리</label>
            <input type="number" name="calorie" id="calorie"><span>kcal</span>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="menuAttach">이미지</label>
            <input type="file" name="menuAttach" id="menuAttach" accept="image/*">
            <div class="upfileBtn-wrapper">
                <button type="button">파일 선택</button>
            </div>
            <p class="upfileName"></p>
            <span class="inputErrMsg"></span>
        </div>
        <div class="textarea-wrapper">
	        <div class="formLine-wrapper ingredients-wrapper">
	            <label for="ingredients">재료</label>
	            <textarea name="ingredients" id="ingredients" cols="120" rows="2" placeholder="각 재료를 ,(콤마)로 구분해주세요."></textarea>
	        </div>
            <span class="inputErrMsg"></span>
        </div>
        <div class="textarea-wrapper">
	        <div class="formLine-wrapper description-wrapper">
	            <label for="menuDescription">소개</label>
	            <textarea name="menuDescription" id="menuDescription" cols="120" rows="5" placeholder="메뉴를 설명해주세요."></textarea>
	        </div>
            <span class="inputErrMsg"></span>
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
        menuEnrollFrmValid();
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
        	history.go(-1);
        };
    };
    
    const checkIdDuplicate = () => {
		let menuId = $('#menuId').val();
		
		$.ajax({
			url : "<%= request.getContextPath() %>/admin/menuIdCheck",
			method : "POST",
        	dataType : "json",
        	data : { menuId : menuId },
        	success(idCheck) {
        		if(idCheck > 0) {
        			document.querySelector(".goodMsg").style.display = "none";
        			printErrSpan("#menuId", "중복된 아이디입니다.");
        			return false;
        		} else if(menuId != "") {
        			resetMsg("#menuId")
        			document.querySelector(".goodMsg").style.display = "block";
        			document.querySelector(".goodMsg").innerHTML = "중복검사완료";
        			return true;
        		}
        	},
        	error : console.log
		});
    }
</script>
<script src="<%= request.getContextPath() %>/js/validation.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>