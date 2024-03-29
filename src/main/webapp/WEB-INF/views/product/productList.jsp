<%@page import="common.utill.Methods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "product.model.dto.ProductExt" %>
<%@ page import="product.model.dto.Thumbnail"%>
<%@ page import="java.util.List"%>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "common.utill.Methods" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import = "product.model.dto.ProductAttach" %>
<%@ page import= "java.text.DecimalFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/product/productList.css">
<% 
	List<ProductExt> list = (List<ProductExt>) request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("#,###");
%>
<!-- 이은지 start -->
<div class="list_header" style="background-image: url(<%= request.getContextPath() %>/images/productList_headimg.jpg);">
<!-- 이은지 end -->
    <h1>정기배송</h1>
    <p>샐러브리티에서 판매하고 있는 건강하고 맛있는 식단들을 다양하게 만나보실 수 있습니다.</p>
</div>
<div class="product_list">
<%
	for(ProductExt product : list){
		ProductAttach attach = product.getAttachs().get(0);
%>
	<div class="item">
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>">
	    	<img src="<%= request.getContextPath() %>/upload/product/<%= attach.getRenamedFileName()%>" alt="<%= attach.getOriginalFileName() %>" class="item_img">
	    </a>
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>" class="item_tit"><%= product.getProductName() %></a>
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>" class="item_dsc"><%= product.getProductdescription() %></a>
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>" class="item_price"><%= df.format(product.getProductPrice()) %>원</a>
	    <span class="add_cart"><input type="hidden" value="<%= product.getProductNo() %>" /><i class="fa-solid fa-cart-plus"></i></span>
	</div>
<%		
	}
%>

</div>
<!-- 이은지 start -->
<form 
	name="deleteProductFrm"
	action="<%= request.getContextPath() %>/admin/productDelete"
	method="POST">
	<input type="hidden" name="delProductNo" value="" />
</form>

<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
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
        cartBtns.forEach((cartBtn) => {
        	const productNo = cartBtn.firstElementChild.value;
	        const div = `<div class="admin-bodyBtngroup">
				        	<a href="<%= request.getContextPath() %>/admin/productUpdate?productNo=\${productNo}" class="edit_product"><i class="fa-solid fa-pen"></i></a>
				        	<a onclick="deleteProduct(\${productNo});" class="del_product"><i class="fa-solid fa-trash-can"></i></a>
				    	</div>`;
				    	
            cartBtn.insertAdjacentHTML('beforeBegin', div);
        });

        addAdminBtnEvent();
    }

    const deleteProduct = (productNo) => {
    	document.querySelector("[name=delProductNo]").value = productNo;
		if(confirm(`\${productNo}번 상품을 삭제하시겠습니까?`)){
			document.deleteProductFrm.submit();
		};
	};
	
	
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
<script>
<% String memberId = loginMember != null ? loginMember.getMemberId() : ""; %>
		$(".fa-cart-plus").click((e) => {
			if("<%=memberId%>" !== ""){
			$.ajax({
				type : "POST",
				async : true,

				data : {productNo: $(event.target).prev().val(), memberId : "<%=memberId%>", quantity : 1
					,firstShippingDate : "<%=new Methods().getDefaultFilstShippingDate()%>"},

				url : "<%=request.getContextPath()%>/order/cart/insertCart",
				success : function(resp){
					alert(resp);
				},
				error : function(resp){
					alert('요청실패');
				}

			});
			}
			else{
				alert("로그인 후 이용하실 수 있습니다.");
		
			}
		});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>