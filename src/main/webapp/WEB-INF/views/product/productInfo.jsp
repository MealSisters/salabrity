<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/product/product_info.css">


<link rel="stylesheet" href="pdoduct_info.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<div class="gds_wrp">
	<img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="prd_img">
	<div class="prd_info">
		<a href="<%= request.getContextPath() %>/calendar" class="go_cal">식단캘린더로 이동</a>
		<div class="prd_tit_wrap">
			<h2 class="prd_tit">식단이름</h2>
			<h3 class="prd_sub_tit">설명</h3>
		</div>
		<div class="prd_opt_wrp">

			<div class="prd_opt">
				<div class="opt_title">수량</div>
				<div class="opt">
					<ul class="qty_wrp">
						<li class="qty_minus"><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></>
							</td>
						<li class="qty"><input type="number" value="1"></li>
						<li class="qty_plus"><span><i class="fa-solid fa-plus"></i></span></li>
					</ul>
					</tr>
				</div>
			</div>
			<div class="prd_opt">
				<div class="opt_title">첫 배송일</div>
				<div class="opt">
					<div class="input_wrp">
						<input class="datepicker" />
					</div>
				</div>
			</div>
		</div>
		<div class="total_wrap">
			<div class="total_tit">총 주문금액</div>
			<div class="total_price">100,000원</div>
		</div>
		<div class="order_btn_wrp">
			<a href="<%= request.getContextPath()%>/order/order" class="btn_order">주문하기</a>
			<a href="<%= request.getContextPath()%>/order/cart"" class=" btn_add_cart">장바구니 담기</a>
		</div>
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
		<img src="#" alt="상품상세사진" class="detail_img">
		<h3>상품정보 제공고시</h3>
		<p>상품상세 참조</p>
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
	// console.log(datepicker)

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
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>