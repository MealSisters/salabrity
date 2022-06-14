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
        			document.querySelector(".goodMsg").innerHTML = "Good";
        			return true;
        		}
        	},
        	error : console.log
		});
    }
    
    // 유효성검사 -> 추후 별도 파일로 분리하기
    document.menuEnrollFrm.onsubmit = () => {
        let result = true;
    	if(!/^[a-zA-Z0-9_]{4,30}$/.test(menuId.value)){
            printErrSpan("#menuId", "아이디는 영문자/숫자로 4글자 이상 30자 이하여야하며, 특수문자는 _ 만 사용가능합니다.");
            result = false;
    	} else if (checkIdDuplicate() != false){
    		resetMsg("#menuId");
    	}
    	
    	if(!/^[a-zA-Z가-힣0-9].{0,90}[^ \t\n]$/.test(menuName.value)){
    		printErrSpan("#menuName", "적절한 이름이 아닙니다.");
    		result = false;
    	} else resetMsg("#menuName");
    	
    	if(!calorie.value) {
    		printErrSpan("#calorie", "열량을 입력해주세요.");
    		result = false;
    	} else if(!/^[0-9]{1,4}$/.test(calorie.value)){
    		printErrSpan("#calorie", "입력 가능한 범위는 0이상 10000미만입니다.");
    		result = false;
    	} else resetMsg("#calorie");
    	
    	const menuAttach = document.querySelector("#menuAttach");
    	if(menuAttach.files.length == 0) {
    		printErrSpan("#menuAttach", "메뉴 이미지를 추가해주세요.");
    	} else resetMsg("#menuAttach");
    	
    	if(/[\n\t]/g.test(ingredients.value)){
    		printErrSpan(".ingredients-wrapper", "개행은 입력할 수 없습니다.");
    		result = false;
    	} else if (!/^.{1,800}$/.test(ingredients.value)) {
    		printErrSpan(".ingredients-wrapper", "적절한 길이로 입력해주세요.");
    		result = false;
    	} else if(!/^[a-zA-Z가-힣0-9, ()]{1,800}$/.test(ingredients.value)) {
    		printErrSpan(".ingredients-wrapper", "입력 불가능한 문자가 포함되어있습니다. *특수문자는 ,(콤마)와 소괄호만 가능");
    		result = false;
    	} else resetMsg(".ingredients-wrapper");

    	if(menuDescription.value == ""){
    		printErrSpan(".description-wrapper", "내용을 입력해주세요.");
    		result = false;
    	} else if (!/^(.|[\t\n]){0,1000}$/.test(menuDescription.value)) {
    		printErrSpan(".description-wrapper", "입력 가능한 길이를 초과하였습니다.");
    		result = false;
    	} else resetMsg(".description-wrapper");
        
        return result;
    };

    const printErrSpan = (target, msg) => {
        const msgSpan = document.querySelector(target).parentElement.lastElementChild;
        msgSpan.innerHTML = msg;
    };

    const resetMsg = (target) => {
        const msgSpan = document.querySelector(target).parentElement.lastElementChild;
        msgSpan.innerHTML = "";
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>