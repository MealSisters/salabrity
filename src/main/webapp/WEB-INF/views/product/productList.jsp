<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/product/productList.css">
<!-- 이은지 start -->
<div class="list_header" style="background-image: url(<%= request.getContextPath() %>/images/productList_headimg.jpg);">
<!-- 이은지 end -->
    <h1>정기배송(●'◡'●)</h1>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Officiis corporis d </p>
</div>



<div class="sort_box">
    <div>총 12개의 상품</div>
    <div>
        <select name="" id="sort">
            <option value="registration">등록순</option>
            <option value="sales">판매량순</option>
            <option value="views">조회순</option>
            <option value="low_price">낮은 가격순</option>
        </select>
    </div>
</div>



<div class="product_list">

<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/order/cart" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
</div>
<%@ include file="/WEB-INF/views/common/pagebar.jsp" %>

<!-- 이은지 start -->
<!-- member 작업 끝나면 분기처리 예정 -->
<% if(true) { %>
<script>
    window.addEventListener('load', (e) => {
        addProductManageBtn();
    });

    const addProductManageBtn = () => {
        const header_desc = document.querySelector(".list_header p");
        const headAdminDiv = `<div class="admin-headBtns">
        <div class="button-wrapper"><button class="menuList-btn">메뉴목록</button></div>
        <div class="button-wrapper"><button class="addProduct-btn">상품등록</button></div>
    </div>`;
        header_desc.insertAdjacentHTML('afterEnd', headAdminDiv);

        const cartBtns = document.querySelectorAll(".add_cart");
        const div = `<div class="admin-bodyBtngroup">
        <a href="<%= request.getContextPath() %>/admin/productUpdate" class="edit_product"><i class="fa-solid fa-pen"></i></a>
        <a href="" onclick="deleteProduct()" class="del_product"><i class="fa-solid fa-trash-can"></i></a>
    </div>`;
        cartBtns.forEach((cartBtn) => {
            cartBtn.insertAdjacentHTML('beforeBegin', div);
        });

        addAdminBtnEvent();
    }

    const addAdminBtnEvent = () => {
        const menuListBtn = document.querySelector(".menuList-btn");
        menuListBtn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/admin/menuList";
        };
        
        const addProductBtn = document.querySelector(".addProduct-btn");
        addProductBtn.onclick = () => {
            location.href = "<%= request.getContextPath() %>/admin/productEnroll";
        };
    }
</script>
<% } %>
<!-- 이은지 end -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>