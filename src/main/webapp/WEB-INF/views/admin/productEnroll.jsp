<%@page import="menu.model.dto.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/enroll.css">
<div class="div-level1">
    <h1 class="pageTitle">상품정보</h1>
    <form method="POST" name="productEnrollFrm" action="<%=request.getContextPath()%>/admin/productEnroll" enctype="multipart/form-data">
        <div class="formLine-wrapper">
            <label for="prodcutId">상품ID</label>
            <input type="text" name="productId" id="productId">
            <div class="uniqueCkeck-wrapper">
                <button type="button" class="uniqueCkeckBtn" onclick="checkIdDuplicate();">중복검사</button>
            </div>
            <span class="goodMsg"></span>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="productName">상품이름</label>
            <input type="text" name="productName" id="productName">
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="productPrice">가격</label>
            <input type="number" name="productPrice" id="productPrice"><span>원</span>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="productTarget">타겟층</label>
            <div class="radioGroup-wrapper">
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="dieter"><span>다이어터</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="diabetic"><span>당뇨환자</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="baby"><span>유아</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="ordinary" checked><span>일반인</span>
                </div>
            </div>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper thumbnail-wrapper">
            <label for="thumbnail">대표 이미지</label>
            <input type="file" name="thumbnail" id="thumbnail" accept="image/*">
            <div class="upfileBtn-wrapper">
                <button type="button">파일 선택</button>
            </div>
            <p class="upfileName"></p>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper detailimgLine-wrapper">
            <label for="detailimg1">상세 이미지</label>
            <div class="detailimgGroup-wrapper">
                <div class="detail-wrapper" id="detail-wrapper1">
                    <input type="file" name="detailimg1" id="detailimg1" accept="image/*">
                    <div class="upfileBtn-wrapper">
                        <button type="button">파일 선택</button>
                    </div>
                    <p class="upfileName"></p>
                    <span class="inputErrMsg"></span>
                </div>
                <div class="detail-wrapper" id="detail-wrapper2"></div>
            </div>
        </div>
        <div class="formLine-wrapper">
            <label for="subscriptionPeriod">구독기간</label>
            <div class="radioGroup-wrapper">
                <div class="radio-wrapper">
                    <input type="radio" class="period-radio" name="subscriptionPeriod" value="1" checked><span>1 Week</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="period-radio" name="subscriptionPeriod" value="2"><span>2 Weeks</span>
                </div>
            </div>
        </div>
        <div class="formLine-wrapper">
            <div class="menuList-wrapper">
                <label class="label-includeMsgspan">구성메뉴<span class="inputErrMsg"></span></label>
                <div class="menutable-wrapper">
                    <div class="menuList-top">
                        <div class="col-checkbox"><p>선택</p></div>
                        <div class="col-menuName"><p>메뉴이름</p></div>
                        <div class="col-menuId"><p>메뉴ID</p></div>
                        <div class="col-menuCalorie"><p>칼로리</p></div>
                    </div>
<%
	if(menuList != null && !menuList.isEmpty()){
		for(Menu menu : menuList){
%>
                    <!-- value는 메뉴 no-->
                    <div class="menu-wrapper">
                        <input type="checkbox" class="menu-checkbox" name="menuNo" value="<%= menu.getMenuNo() %>">
                        <p class="p-menuName"><%= menu.getMenuName() %></p>
                        <p class="p-menuId"><%= menu.getMenuId() %></p>
                        <p class="p-menuCalorie"><%= menu.getCalorie() %></p>
                    </div>
<%
		}
	}
%>
                </div>
                <div class="formLine-wrapper buttons-wrapper">
                    <div class="enrollBtn-wrapper">
                        <button class="enrollBtn">등록</button>
                    </div>
                    <div class="cancelBtn-wrapper">
                        <button type="button" class="cancelBtn">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    window.addEventListener('load', () => {
        upFileAttachs(); 
        goToProductList();
    });

    const upFileAttachs = () => {
        const fileInputTumbnail = document.querySelector("#thumbnail");
        const fileNameTagTumbnail = document.querySelector(".thumbnail-wrapper p.upfileName");
        const btnTumbnail = document.querySelector(".thumbnail-wrapper .upfileBtn-wrapper button");
        upFile(fileInputTumbnail, fileNameTagTumbnail, btnTumbnail);

        const fileInput1 = document.querySelector("#detailimg1");
        const fileNameTag1 = document.querySelector("#detail-wrapper1 p.upfileName");
        const btn1 = document.querySelector("#detail-wrapper1 .upfileBtn-wrapper button");
        upFile(fileInput1, fileNameTag1, btn1);
        printNextUpFile(fileInput1, fileNameTag1, btn1);
    }

    const upFile = (fileInput, fileNameTag, btn) => {
        fileInput.addEventListener('change', (e) => {
            fileNameTag.innerHTML = e.target.files[0].name;
            resetElemetMsg(fileInput);
        });
        btn.addEventListener('click', () => {
            fileInput.click();
        });
    };
    
    const printNextUpFile = (fileInput, fileNameTag, btn) => {
    	fileInput.addEventListener('change', (e) => {
    		if(fileInput.files.length > 0) {
    			const divInnerHTML = `<input type="file" name="detailimg2" id="detailimg2" accept="image/*">
                    <div class="upfileBtn-wrapper">
                        <button type="button">파일 선택</button>
                    </div>
                    <p class="upfileName"></p>
                	<span class="inputErrMsg"></span>`;
                const div = document.querySelector("#detail-wrapper2");
                div.innerHTML = divInnerHTML;

                const fileInput2 = document.querySelector("#detailimg2");
                const fileNameTag2 = document.querySelector("#detail-wrapper2 p.upfileName");
                const btn2 = document.querySelector("#detail-wrapper2 .upfileBtn-wrapper button");
                upFile(fileInput2, fileNameTag2, btn2);
    		}
    	});
    };

    const goToProductList = () => {
        const btn = document.querySelector(".cancelBtn");
        btn.onclick = () => {
            location.href = history.go(-1);
        };
    };
    
    const checkIdDuplicate = () => {
		let productId = $('#productId').val();
		
		$.ajax({
			url : "<%= request.getContextPath() %>/admin/productIdCheck",
			method : "POST",
        	dataType : "json",
        	data : { productId : productId },
        	success(idCheck) {
        		if(idCheck > 0) {
        			document.querySelector(".goodMsg").style.display = "none";
        			printErrSpan("#productId", "중복된 아이디입니다.");
        			return false;
        		} else if(productId != "") {
        			resetMsg("#productId")
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