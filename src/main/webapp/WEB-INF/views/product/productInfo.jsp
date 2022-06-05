<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/product/product_info.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<link rel="stylesheet" href="pdoduct_info.css">

<div class="gds_wrp">
	<img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="prd_img">
	<div class="prd_info">
		<a href="" class="go_cal">식단캘린더로 이동</a>
		<div class="prd_tit_wrap">
			<h2 class="prd_tit">식단이름</h2>
			<h3 class="prd_sub_tit">설명</h3>
		</div>
		<div class="prd_opt_wrp">
			<div class="prd_opt">
				<div class="opt_title">배송기간</div>
				<div class="opt">1주</div>
			</div>
			<div class="prd_opt">
				<div class="opt_title">수량</div>
				<div class="opt">
					<ul class="qty_wrp">
						<li class="qty_minus"><span class="quantity_minus"><i
								class="fa-solid fa-minus"></i></span></>
							</td> <li
							class="qty"><input type="number" value="1"></li>
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
						<a href="" class="btn_order">주문하기</a>
						<a href="" class="btn_add_cart">장바구니 담기</a>
					</div>
				</div>
			</div>
			<div class="tab_wrap">
				<ul class="detail_tab">
					<li class="detail_tab1"><span>상품상세</span></li>
					<li class="detail_tab2"><span>배송안내</span></li>
					<li class="detail_tab3"><span>상품정보 제공고시</span></li>
				</ul>
			</div>
			<div class="prd_detail">
				<img src="#" alt="" class="detail_img">
				상품상세영역
			</div>

			<script>	flatpickr(" .datepicker", {}); </script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>