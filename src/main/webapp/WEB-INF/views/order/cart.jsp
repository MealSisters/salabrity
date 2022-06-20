<%@ page import="java.util.List"%>
<%@ page import="cart.model.dto.Cart"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="product.model.dto.ProductExt"%>
<%@ page import="product.model.dto.ProductAttach"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
	Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
	List<Cart> cartList = (List<Cart>)map.get("cartList");
	List<ProductExt> productList = (List<ProductExt>)map.get("productList");
	int totalPrice = 0;
	
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 3);
	if(cal.get(Calendar.DAY_OF_WEEK) == 1){
		cal.add(Calendar.DATE, 1);
	} else if(cal.get(Calendar.DAY_OF_WEEK) == 7){
		cal.add(Calendar.DATE, 2);
	}
	Date date = cal.getTime();
	String defaultDate = sdf.format(date);

	
%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/order/cart.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<div class="heading">
	<h1>장바구니</h1>
	<div class="chk_opt">
		<%
	if (cartList != null && !cartList.isEmpty()) {				
%>
		<ul>
			<li id="checkedDel">선택삭제</li>
			<li><span class="vertical_bar">|</span></li>
			<li id="allDel">전체삭제</li>
		</ul>
		<%
	}			
%>
	</div>
</div>


<div id="cart_container">
	<table class="cart_list">
		<%
	if (cartList != null && !cartList.isEmpty()) {				
%>
		<tr>
			<th class="cart_col"><input type="checkbox" name="checkAll"
				id="checkAll" checked><label for="checkAll"></label></th>
			<th>상품</th>
			<th>수량</th>
			<th>첫배송일</th>
			<th>가격</th>
		</tr>
		<%
				for (int i = 0; i < cartList.size(); i++) {
					ProductExt product = (ProductExt)productList.get(i);
					Cart cart = (Cart)cartList.get(i);
					ProductAttach attach  = product.getAttachs().get(0);
					totalPrice += product.getProductPrice() * cart.getQuantity();
					String firstShippingDate = cart.getFirstShipppingDate() != null ?  cart.getFirstShipppingDate() : defaultDate;
			%>
		<tr id="<%= cart.getCartNo()%>" class="itemRow">
			<td class="col1"><input type="checkbox" name="check"
				id="check<%=cart.getCartNo()%>" checked><label
				for="check<%=cart.getCartNo()%>"></label></td>
			<td>
				<ul>
					<li><img
						src="<%= request.getContextPath() %>/upload/product/<%= attach.getRenamedFileName()%>"
						alt="<%= attach.getOriginalFileName() %>" class="itemImg"></li>
					<li><a
						href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>"
						class="product_name"> <%= product.getProductName() %>
					</a></li>
				</ul>
			</td>
			<td class="quantity">
				<table class="quantity_table">
					<tr>
						<td><span class="quantity_minus"><i
								class="fa-solid fa-minus"></i></span></td>
						<td><input type="number" class="qty"
							value="<%=cart.getQuantity()%>" readonly><input
							type="hidden" value="<%= product.getProductPrice() %>" /></td>
						<td><span class="quantity_plus"><i
								class="fa-solid fa-plus"></i></span></td>
					</tr>
				</table>
			</td>

			<td><input class="datepicker" value="<%= firstShippingDate %>"></td>
			<td><span class="price"><%= product.getProductPrice()*cart.getQuantity()%></span>원</td>
		</tr>
		<%
        	}
			
        } else {
         %>
		<tr>
			<td class="emptyCart" colspan="5">장바구니에 등록된 상품이 없습니다.</td>
		</tr>
		<%	
        }
        %>


	</table>
	<%
			if (cartList != null && !cartList.isEmpty()) {
				
			%>
</div>
<div class=" cal">
	<div class=total>
		<span>총 결제금액&nbsp;</span> <span id="total_price" class="total_price="><%= totalPrice %></span><span>원</span>
	</div>
	<div class="order_container">
		<a id="checkedOrder"> 선택상품 주문 </a>
		<form id="checkedOrderFrm"
			action="<%=request.getContextPath()%>/order/cart/checkedCartOrder"
			method="post" name="checkedOrderFrm">
			<input type="hidden" name="checkedCartNoList" id="checkedCartNoList" />
		</form>
		<a href="<%=request.getContextPath()%>/order/cartOrder"> 전체주문 </a>
	</div>
</div>
<%
			}
			%>

<script>
	

		
		$("input[type=check]").prop("checked", true);
	
	
    //datepicker
    flatpickr(" .datepicker", {
        // local:'ko',
        minDate: new Date().fp_incr(3),

  //      defaultDate: new Date().fp_incr(3),
        maxDate: new Date().fp_incr(30),
        "disable": [
            function (date) {
                // return true to disable
                return (date.getDay() === 0 || date.getDay() === 6);

            }
        ]
    });

    // 전체선택 체크박스
        $("#checkAll").change(() => {
            //checkAll이 체크된 경우 모두 체크
            if ($("#checkAll").is(":checked")) {
                $("input[name=check]").prop("checked", true);
            }
            // 체크해제된 경우 체크 해제
            else {

                $("input[name=check]").prop("checked", false);
            }
        });

        $("input[name=check]").change(() => {
            let total = $("input[name=check]").length;
            let checked = $("input[name=check]:checked").length;
            // 총 개수와 체크된 개수가 다르면 chkAll 체크 해제
            if (total != checked) $("#checkAll").prop("checked", false);
            // 반대
            else $("#checkAll").prop("checked", true);
        });
    
        // -아이콘? 클릭시 수량 감소
        $(".quantity_minus").click((e) =>{
   			 let quantity =$(event.target).parents("td").next().children().val();

		    if(quantity <= 1) {
		        alert('최소수량 1개');
		        return;
		    };
		    quantity = quantity - 1;
		    $(event.target).parents("td").next().children("input[type=number]").val(quantity);
			 const productPrice = $(event.target).parents("td").next().find("input[type=hidden]").val();
			   let price = $(event.target).closest('.itemRow').find(".price").html();
			   const cartNo = $(event.target).closest('.itemRow').attr('id');
		     console.log("cartNO = " + cartNo);
		   console.log($(event.target).parents("td").next().children("input[type=number]"));
		     console.log(price);

		    $.ajax({
		        type : "POST",
		        async : true,
		        data : {cartNo: cartNo, quantity : quantity},
		        url : "<%=request.getContextPath()%>/order/cart/quantityUpdate",
		        success : function(resp){
		            if (resp !== "0"){
		
		                //가격, 총 결제금액 빼기
		                let totalPrice = $('#total_price').html()- productPrice;
		                price = price- productPrice;
		        
		                $('#total_price').html(totalPrice);
		                $('#' + cartNo).find(".price").html(price);
		            } else {"처리실패"}
		        },
		        error : function(resp){
		            alert('요청실패');
		        }
		    });
    
});
        // +아이콘? 클릭시 수량 증가
        $(".quantity_plus").click((e) =>{
            const productPrice = $(event.target).parents("td").prev().find("input[type=hidden]").val();
            let quantity =(Number)($(event.target).parents("td").prev().children().val());
            quantity = quantity + 1;
            $(event.target).parents("td").prev().children("input[type=number]").val(quantity);


            let price = $(event.target).closest('.itemRow').find(".price").html();
            const cartNo = $(event.target).closest('.itemRow').attr('id');

			$.ajax({
				type : "POST",
				async : true,
				data : {cartNo: $(event.target).closest('.itemRow').attr('id'), quantity : quantity},
				url : "<%=request.getContextPath()%>/order/cart/quantityUpdate",
				success : function(resp){
					if (resp !== "0"){
						let totalPrice = parseInt($('#total_price').html()) + parseInt(productPrice);
		                price = parseInt(price) + parseInt(productPrice);
		        
		                $('#total_price').html(totalPrice);
		                $('#' + cartNo).find(".price").html(price);
						
					} else {"처리실패"}
				},
				error : function(resp){
					alert('요청실패');
				}
			});
            });
        
        //날짜 업데이트
	$(".datepicker").change((e) =>{
            console.log($(event.target).val());
			$.ajax({
				type : "POST",
				async : true,
				data : {cartNo: $(event.target).closest('.itemRow').attr('id'), firstShippingDate : $(event.target).val()},
				url : "<%=request.getContextPath()%>/order/cart/shippingDateUpdate",
				success : function(resp){
					$(event.target).val(resp) ;
				},
				error : function(resp){
					alert('요청실패');
				}
			});
     });
        	
        // 선택된 체크박스의 장바구니 번호 배열

           function checkedCartNoListSearch () {
				checkedList = Array.from($("input[name=check]:checked"));
				checkedCartNoList = [];
				checkedList.forEach(function(ch){
				checkedCartNoList.push($(ch).closest('.itemRow').attr('id'));
				});
				return checkedCartNoList;
            }
       
        // 선택삭제 

        	$("#checkedDel").click((e) =>{
        		
        		// 배열 가져오기
        		let checkedCartNoList = [];
        		checkedCartNoList = checkedCartNoListSearch();
				console.log(checkedCartNoList);
			if (!checkedCartNoList.length) {
				alert("선택된 상품이 없습니다.");
				return
				};
        		$.ajax({
					type : "POST",
					async : false,
					traditional : true,
					data : {cartNoList: checkedCartNoList},
					url : "<%=request.getContextPath()%>/order/cart/checkedDelete",
					success : function(){
						location.reload();
					},
					error : function(resp){
						alert('요청실패');
					}
				});
            });
        

        //전체삭제
          $("#allDel").click((e) =>{
        	
        		$.ajax({
					type : "POST",
					async : false,
					data : {memberId : "<%=loginMember.getMemberId()%>"},
					url : "<%=request.getContextPath()%>/order/cart/allDelete",
					success : function(){
						location.reload();
					},
					error : function(resp){
						alert('요청실패');
					}
				});
            });
        
        
        //선택주문으로 넘기기
        
        $("#checkedOrder").click((e) =>{
        	
        	// 배열 가져오기
    		let checkedCartNoList = [];
    		checkedCartNoList = checkedCartNoListSearch();

		if (!checkedCartNoList.length) {
			alert("선택된 상품이 없습니다.");
			return
			};
    		$('#checkedCartNoList').val(checkedCartNoList);
    		console.log($('#checkedCartNoList').val());
    		$('form').submit();
        });
        
        

        
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>