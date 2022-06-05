<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/order/cart.css">

<%--데이터피커 다른걸로 바꿀 예정입니다 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>



<%--action 주문페이지로 걸어놓기, form 태그 이름 수정 --%>
				<h1>장바구니</h1>
				<form action="" name="cart-form">
					<div class="chk_opt">
						<ul>
							<li id="allDel">선택삭제 </li>
							<li>
								<div class="img_wrp"><img src="<%= request.getContextPath() %>/images/vertical_line.svg" class="v_line" alt="구분선"></div>
							</li>
							<li id="allSelect"> 전체삭제</li>
						</ul>
					</div>
					<div id="cart_container">
						<table class="cart_list">
							<tr>
								<th class="cart_col"><i class="fa-regular fa-square-check"></i></th>
								<th>상품</th>
								<th>수량</th>
								<th>배송기간</th>
								<th>첫배송일</th>
								<th>가격</th>
							</tr>
							<tr>
								<td><i class="fa-regular fa-square-check"></i></td>
								<td>
									<ul>
										<li><i class="fa-solid fa-file-image"></i></li>
										<li>베이비식단</li>
									</ul>
								</td>
								<td class="quantity">
									<table class="quantity_table">
										<tr>
											<td><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></td>											</td>
											<td><input type="number" class="qty" value="1"></td>
											<td><span><i class="fa-solid fa-plus"></i></span></td>
										</tr>
									</table>
								</td>
								<td>1주</td>
								<td><input class="datepicker"" /></td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><i class=" fa-regular fa-square-check"></i></td>
								<td>
									<ul>
										<li><i class="fa-solid fa-file-image"></i></li>
										<li>체중조절 식단</li>
									</ul>
								</td>
								<td class="quantity">
									<table class="quantity_table">
										<tr>
											<td><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></td>											</td>
											<td><input type="number" class="qty" value="1"></td>
											<td><span><i class="fa-solid fa-plus"></i></span></td>
										</tr>
									</table>
								</td>
								<td>1주</td>
								<td><input class="datepicker"" /></td>
					<td>100,000원</td>
				</tr>
			</table>
		</div>
		<div class="cal">
		<div class=total>
				<span>총 결제금액</span>
				<span id="total_price" class="total_price=">200,000원</span>
		</div>
		<div class="order_container">
			<a href="<%= request.getContextPath() %>/order/order">
				선택상품 주문
			</a>
			<a href="<%= request.getContextPath() %>/order/order">
				전체주문
			</a>
		</div>
	</div>
		</form>
<script>
	flatpickr(" .datepicker", {}); </script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>