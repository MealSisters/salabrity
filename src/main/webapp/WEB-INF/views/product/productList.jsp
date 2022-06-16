<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "product.model.dto.ProductExt" %>
<%@ page import="product.model.dto.Thumbnail"%>
<%@ page import="java.util.List"%>
<%@ page import = "product.model.dto.ProductAttach" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/product/productList.css">
<% 
	List<ProductExt> list = (List<ProductExt>) request.getAttribute("list");
%>
<!-- 이은지 start -->
<div class="list_header" style="background-image: url(<%= request.getContextPath() %>/images/productList_headimg.jpg);">
<!-- 이은지 end -->
    <h1>정기배송(●'◡'●)</h1>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Officiis corporis d </p>
</div>


<!-- 정렬쪽은 일단 뺄게요
<div class="sort_box">
    <div>총 12개의 상품</div>
    <div>
        <select name="sort" id="sort">
            <option value="registration">등록순</option>
            <option value="sales">판매량순</option>
            <option value="views">조회순</option>
            <option value="low_price">낮은 가격순</option>
        </select>
	</div>
    </div>
 -->


<div class="product_list">
<%
	for(ProductExt product : list){
		ProductAttach attach = product.getAttachs().get(0);
%>
	<div class="item">

	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>">
	    <img src="<%= request.getContextPath() %>/images/product/<%= attach.getRenamedFileName()%>" alt="<%= attach.getOriginalFileName() %>" class="item_img">
	    </a>
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>" class="item_tit"><%= product.getProductName() %></a>
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>" class="item_dsc"><%= product.getProductdescription() %></a>
	    <a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>" class="item_price"><%= product.getProductPrice() %></a>
	    <span class="add_cart"><input type="hidden" value="<%= product.getProductNo() %>" /><i class="fa-solid fa-cart-plus"></i></span>
	</div>
<%		
	}
%>


</div>


<!-- 이은지 start -->
<!-- 목록조회구현끝나면 각버튼에 상품번호따올수있게 수정하기 -->
<form 
	name="deleteProductFrm"
	action="<%= request.getContextPath() %>/admin/productDelete"
	method="POST">
	<input type="hidden" name="delProductNo" value="" />
</form>

<% if(true) { %> <!-- member 작업 끝나면 분기처리 예정 -->
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
	        const div = `<div class="admin-bodyBtngroup">
				        	<a href="<%= request.getContextPath() %>/admin/productUpdate?productNo=<%  %>" class="edit_product"><i class="fa-solid fa-pen"></i></a>
				        	<a onclick="deleteProduct(<%  %>);" class="del_product"><i class="fa-solid fa-trash-can"></i></a>
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
console.log("<%= memberId %>");
		//장바구니
		$(".fa-cart-plus").click((e) => {
			if("<%=memberId%>" !== ""){
			//console.log($(event.target).parents("span"));
		//	alert($(event.target).prev().val());
			$.ajax({
				type : "POST",
				async : true,

				data : {productNo: $(event.target).prev().val(), memberId : "<%=memberId%>", quantity : 1},

				url : "<%=request.getContextPath()%>/order/cart/insertCart",
				success : function(data){
					alert('요청성공');
				},
				error : function(data){
					alert('요청실패');
				}

			});
			}
			else{
				alert("로그인 후 이용 가능");
		
			}
		});

		
		
		

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>