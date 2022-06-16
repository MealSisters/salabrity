<%@page import="java.util.ArrayList"%>
<%@page import="product.model.dto.ProductMenu"%>
<%@page import="product.model.dto.Thumbnail"%>
<%@page import="product.model.dto.ProductAttach"%>
<%@page import="product.model.dto.ProductTarget"%>
<%@page import="product.model.dto.ProductExt"%>
<%@page import="menu.model.dto.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
ProductExt product = (ProductExt) request.getAttribute("product");

List<ProductAttach> attachs = product.getAttachs();
ProductAttach originalThumbnail = null;
ProductAttach originalDetail1 = null;
ProductAttach originalDetail2 = null;
for(ProductAttach attach : attachs) {
	if(attach.getThumbnail() == Thumbnail.Y)
		originalThumbnail = attach;
	if(attach.getThumbnail() == Thumbnail.N1)
		originalDetail1 = attach;
	if(attach.getThumbnail() == Thumbnail.N2)
		originalDetail2 = attach;
}

List<ProductMenu> menus = product.getMenus();
List<Integer> menuNoList = new ArrayList<>();
if(menus != null) {
	for(ProductMenu menu : menus){
		menuNoList.add(menu.getMenuNo());
	}	
}

%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/enroll.css">
<div class="div-level1">
    <h1 class="pageTitle">상품정보</h1>
    <!-- 수정시 아이디,가격은 편집불가 -->
    <form name="productUpdateFrm" method="POST" action="<%=request.getContextPath()%>/admin/productUpdate" enctype="multipart/form-data">
    	<input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
    	<input type="hidden" name="originalThumbnail" value="<%= originalThumbnail.getProductAttachNo() %>" />
    	<input type="hidden" name="originalDetail1" value="<%= originalDetail1.getProductAttachNo() %>" />
    	<% if(originalDetail2 != null) { %>
    		<input type="hidden" name="originalDetail2" value="<%= originalDetail2.getProductAttachNo() %>" />
    	<% } %>

    	<input type="hidden" name="delFileflag" id="delFileflag" value="false" />
        <div class="formLine-wrapper">
            <label for="prodcutId">상품ID</label>
            <p class="p-productId"><%= product.getProductId() %></p>
        </div>
        <div class="formLine-wrapper">
            <label for="productName">상품이름</label>
            <input type="text" name="productName" id="productName" value="<%= product.getProductName() %>">
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="productPrice">가격</label>
            <p class="p-productPrice"><%= product.getProductPrice() %></p><span>원</span>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper">
            <label for="productTarget">타겟층</label>
            <div class="radioGroup-wrapper">
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="dieter" <%= product.getProductTarget() == ProductTarget.dieter ? "checked" : "" %>><span>다이어터</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="diabetic" <%= product.getProductTarget() == ProductTarget.diabetic ? "checked" : "" %>><span>당뇨환자</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="baby" <%= product.getProductTarget() == ProductTarget.baby ? "checked" : "" %>><span>유아</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="targer-radio" name="productTarget" value="ordinary" <%= product.getProductTarget() == ProductTarget.ordinary ? "checked" : "" %>><span>일반인</span>
                </div>
            </div>
            <span class="inputErrMsg"></span>
        </div>
        <div class="textarea-wrapper">
	        <div class="formLine-wrapper description-wrapper">
	            <label for="productDescription">소개</label>
	            <textarea name="productDescription" id="productDescription" cols="120" rows="2" placeholder="상품을 설명해주세요."><%= product.getProductdescription() %></textarea>
	        </div>
            <span class="inputErrMsg"></span>
        </div>
        <div class="formLine-wrapper thumbnail-wrapper">
            <label for="thumbnail">대표 이미지</label>
            <input type="file" name="thumbnail" id="thumbnail" accept="image/*">
            <div class="upfileBtn-wrapper">
                <button type="button">파일 선택</button>
            </div>
            <p class="upfileName"><%= originalThumbnail.getOriginalFileName() %></p>
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
                    <p class="upfileName"><%= originalDetail1.getOriginalFileName() %></p>
                    <span class="inputErrMsg"></span>
                </div>
                <div class="detail-wrapper" id="detail-wrapper2">
<%
				if(originalDetail2 != null) {
%>
					<input type="file" name="detailimg2" id="detailimg2" accept="image/*">
                    <div class="upfileBtn-wrapper">
                        <button type="button">파일 선택</button>
                    </div>
                    <div class="delBtn-wrapper">
                        <button type="button">취소</button>
                    </div>
                    <p class="upfileName"><%= originalDetail2.getOriginalFileName() %></p>
                	<span class="inputErrMsg"></span>
<%
				} else {
%>
					<input type="file" name="detailimg2" id="detailimg2" accept="image/*">
                    <div class="upfileBtn-wrapper">
                        <button type="button">파일 선택</button>
                    </div>
                    <p class="upfileName"></p>
                	<span class="inputErrMsg"></span>
<%
				}
%>
                </div>
            </div>
        </div>
        <div class="formLine-wrapper">
            <label for="subscriptionPeriod">구독기간</label>
            <div class="radioGroup-wrapper">
                <div class="radio-wrapper">
                    <input type="radio" class="period-radio" name="subscriptionPeriod" value="1" <%= product.getSubscriptionPeriod() == 1 ? "checked" : "" %>><span>1 Week</span>
                </div>
                <div class="radio-wrapper">
                    <input type="radio" class="period-radio" name="subscriptionPeriod" value="2" <%= product.getSubscriptionPeriod() == 2 ? "checked" : "" %>><span>2 Weeks</span>
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
                        <input type="checkbox" class="menu-checkbox" name="menuNo" value="<%= menu.getMenuNo() %>" <%= menuNoList.contains(menu.getMenuNo()) ? "checked" : "" %>>
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
                    <div class="updateBtn-wrapper">
                        <button class="updateBtn">수정</button>
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
        addDelBtnEvent();
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
        
        const fileInput2 = document.querySelector("#detailimg2");
        const fileNameTag2 = document.querySelector("#detail-wrapper2 p.upfileName");
        const btn2 = document.querySelector("#detail-wrapper2 .upfileBtn-wrapper button");
		upFile(fileInput2, fileNameTag2, btn2);
		printDelBtn(fileInput2);
    }
    
    const addDelBtnEvent = () => {
    	const delBtn = document.querySelector(".delBtn-wrapper");
    	if(delBtn != null) {
		   	delBtn.addEventListener('click', (e) => {
		   		const targetInput = document.querySelector("#detailimg2");
		   		targetInput.value = "";
		   		document.querySelector("#detail-wrapper2 > p").innerHTML = ""
		   		document.querySelector("#delFileflag").value = true;
		   	});    		
    	}
    }

    const upFile = (fileInput, fileNameTag, btn) => {
        fileInput.addEventListener('change', (e) => {
            fileNameTag.innerHTML = e.target.files[0].name;
            // resetElemetMsg(fileInput);
        });
        btn.addEventListener('click', () => {
            fileInput.click();
        });
    };
    
    const printDelBtn = (fileInput) => {
    	fileInput.addEventListener('change', (e) => {
    		if((fileInput.files.length > 0) && (document.querySelector(".delBtn-wrapper") == null )) {
    			const div = `<div class="delBtn-wrapper">
                        <button type="button">취소</button>
                    </div>`;
               	const upfileDiv = document.querySelector("#detail-wrapper2 .upfileBtn-wrapper");
               	upfileDiv.insertAdjacentHTML("afterend", div);
               	addDelBtnEvent();
    		}
    		
    	});
    }
    

    const goToProductList = () => {
        const btn = document.querySelector(".cancelBtn");
        btn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/product/productList";
        };
    };
</script>
<script src="<%= request.getContextPath() %>/js/validation.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>