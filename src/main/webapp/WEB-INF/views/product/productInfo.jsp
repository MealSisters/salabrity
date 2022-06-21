<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="product.model.dto.ProductExt"%>
<%@ page import="product.model.dto.Thumbnail"%>
<%@ page import="java.util.List"%>
<%@ page import= "java.text.DecimalFormat" %>
<%@ page import="product.model.dto.ProductAttach"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	ProductExt product = (ProductExt) request.getAttribute("product");
	List<ProductAttach> attachments= product.getAttachs();
	ProductAttach thumbnailImg = null;
	ProductAttach detailImg1 = null;
	ProductAttach detailImg2 = null;
	for(ProductAttach attachment : attachments){
		if(attachment.getThumbnail() == Thumbnail.Y)
			thumbnailImg = attachment;
		else if (attachment.getThumbnail() == Thumbnail.N1)
			detailImg1 = attachment;
		else if (attachment.getThumbnail() == Thumbnail.N2)
			detailImg2 = attachment;
	}
	System.out.println("thumbnail = " + thumbnailImg);
	System.out.println("detailImg1" + detailImg1);
	

	DecimalFormat df = new DecimalFormat("#,###");


%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/product/product_info.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<div class="gds_wrp">
	<img
		src="<%= request.getContextPath() %>/upload/product/<%= thumbnailImg.getRenamedFileName()
    %>"
		alt="<%= thumbnailImg.getOriginalFileName() %>" class="prd_img" />
	<div class="prd_info">
	<form action="<%=request.getContextPath()%>/order/order" method="post" name ="singleProductOrderFrm">
		<input type="hidden" name="productNo" value="<%=product.getProductNo() %>" />
		<input type="hidden" name="productPrice" value="<%=product.getProductPrice() %>" />
		<input type="hidden" name="originalFileName" value="<%=thumbnailImg.getOriginalFileName() %>" />
		<input type="hidden" name="renamedFileName" value="<%=thumbnailImg.getRenamedFileName() %>" />
		<input type="hidden" name="subscriptionPeriod" value="<%= product.getSubscriptionPeriod() %>" />
		<a href="<%= request.getContextPath() %>/calendar?productNo=<%=product.getProductNo() %>" class="go_cal">식단캘린더로
			이동</a>
		<div class="prd_tit_wrap">
			<h2 class="prd_tit"><%=product.getProductName() %>
			<input type="hidden" name="productName" value="<%= product.getProductName()%>"/> </h2>
			<h3 class="prd_sub_tit"><%=product.getProductdescription() %></h3>
		</div>
		<div class="prd_opt_wrp">
			<div class="prd_opt">
				<div class="opt_title">수량</div>
				<div class="opt">
					<ul class="qty_wrp">
						<li class="qty_minus"><span class="quantity_minus"><i
								class="fa-solid fa-minus"></i></span>
						<li class="qty"><input type="number" value="1" id="quantity" name="quantity"></li>
						<li class="qty_plus"><span class="quantity_plus"><i
								class="fa-solid fa-plus"></i></span></li>
					</ul>
				</div>
			</div>
			<div class="prd_opt">
				<div class="opt_title">첫 배송일</div>
				<div class="opt">
					<div class="input_wrp">
						<input class="datepicker" id="firstShippingDate" name="firstShippingDate"/>
					</div>
				</div>
			</div>
		</div>
		<div class="total_wrap">
			<div class="total_tit">판매 가격</div>
			<div class="total_price"><%=df.format(product.getProductPrice()) %>원</div>
		</div>
		<div class="order_btn_wrp">
			<a href='#' class="btn_order">주문하기</a> 
			<a href='javascript:void(0);' class="btn_add_cart">장바구니 담기</a>
		</div>
		</form>
	</div>
</div>
<div class="tab_wrap">
	<ul class="detail_tab">
		<li class="detail_tab1"><span>상품상세</span></li>
		<li class="detail_tab2"><span class="ship_info">배송안내</span></li>
	</ul>
</div>
<div class="prd_detail">
	<div class="detail_tab1_active">
		<img
			src="<%= request.getContextPath() %>/upload/product/<%= detailImg1.getRenamedFileName()
    %>"
			alt="<%= detailImg1.getOriginalFileName() %>" class="detail_img" />
		<%
    	if(detailImg2 != null ){
    %>
		<img src="<%= request.getContextPath() %>/upload/product/<%= detailImg2.getRenamedFileName()
    %>"
			alt="<%= detailImg2.getOriginalFileName() %>" class="detail_img" />
		<%
    }
    %>

		<h3>상품정보 제공고시</h3>
		<p>상세이미지, 식단캘린더-메뉴정보 참조</p>
	</div>
	<div class="detail_tab2_active">
		<table>
			<tr>
				<th>배송비</th>
				<td>무료</td>
			</tr>
			<tr>
				<th>첫 배달일</th>
				<td>주문일로부터 3일 후 첫 배달이 가능하며, 주말, 공휴일은 불가능합니다.</td>
			</tr>
		</table>
	</div>
</div>

<script>

    const datepicker = document.querySelector('.datepicker');
  

    flatpickr(" .datepicker", {
        // local:'ko',
        minDate: new Date().fp_incr(3),
        defaultDate: new Date().fp_incr(3),
        maxDate: new Date().fp_incr(30),
        "disable": [
            function (date) {
                // return true to disable
                return (date.getDay() === 0 || date.getDay() === 6);

            }
        ]
    });

    const detail_tab2 = document.querySelector(".detail_tab2");
    const detail_tab1 = document.querySelector(".detail_tab1");
    console.log(detail_tab2);
    detail_tab2.addEventListener('click', function () {
        const detail_tab1_active = document.querySelector(".detail_tab1_active");
        const detail_tab2_active = document.querySelector(".detail_tab2_active");
        console.log
        detail_tab2.style.borderBottom = "#116919 solid";
        detail_tab1.style.borderBottom = "none";
        detail_tab1_active.style.display = "none";
        detail_tab2_active.style.display = "block";
    });

    console.log(detail_tab1);
    detail_tab1.addEventListener('click', function () {
        const detail_tab1_active = document.querySelector(".detail_tab1_active");
        const detail_tab2_active = document.querySelector(".detail_tab2_active");
        detail_tab1.style.borderBottom = "#116919 solid";
        detail_tab2.style.borderBottom = "none";
        detail_tab2_active.style.display = "none";
        detail_tab1_active.style.display = "block";
    });
    // -아이콘? 클릭시 수량 감소
    // -아이콘? 클릭시 수량 감소
    $(".quantity_minus").click((e) => {
        let quantity = $(event.target).parents("li").next().children().val();

        if (quantity <= 1) {
            alert('최소수량 1개');
            return;
        };
        quantity = quantity - 1;
        $(event.target).parents("li").next().children("input[type=number]").val(quantity);
    });
    // +아이콘? 클릭시 수량 증가
    $(".quantity_plus").click((e) => {
        let quantity = (Number)($(event.target).parents("li").prev().children().val());
        quantity = quantity + 1;
        $(event.target).parents("li").prev().children().val(quantity);
    });
    
    <% String memberId = loginMember != null ? loginMember.getMemberId() : ""; %>
  //장바구니 버튼 클릭
	$(".btn_add_cart").click((e) => {
		if("<%=memberId%>" !== ""){
		
		$.ajax({
			type : "POST",
			async : true,
			dataType: "text",
			data : {productNo: <%=product.getProductNo() %>, memberId : "<%=memberId%>",
				quantity : $('#quantity').val(), firstShippingDate : $('#firstShippingDate').val()},
			url : "<%=request.getContextPath()%>/order/cart/insertCart",
			success : function(resp){
				alert(resp);
			},
			error : function(data){
				alert('요청실패');
			}

		});
		}
		else{
			alert("로그인 후 이용하실 수 있습니다.");
	
		}
	});
  //주문하기 버튼 클릭
  
	$(".btn_order").click((e) => {
		$("form").submit();
	});
  
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>