<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/product/productList.css">

<div class="list_header" style="background-image: url(<%= request.getContextPath() %>/images/food_sample.jpg);">
    <h1>정기배송(●'◡'●)</h1>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Officiis corporis d </p>
</div>



<div class="sort_box">
    <div>총 12개의 상품</div>
    <div>
        <select name="" id="sort">
            <option value="">인기순</option>
            <option value="">높은 가격순</option>
            <option value="">낮은 가격순</option>
        </select>
    </div>
</div>


<div class="product_list">

<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>

<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
<div class="item">
    <a href="<%= request.getContextPath() %>/product/productInfo"><img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="item_img"></a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_tit">당뇨케어식단</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_dsc">1일 2식 2주(월~금, 20회)</a>

    <a href="<%= request.getContextPath() %>/product/productInfo" class="item_price">100,000원</a>
    <a href="<%= request.getContextPath() %>/product/productInfo" href="" class="add_cart"><i class="fa-solid fa-cart-plus"></i></a>
</div>
</div>
<%@ include file="/WEB-INF/views/common/pagebar.jsp" %>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>