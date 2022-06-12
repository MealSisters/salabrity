<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/order/cart.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


			<div class="heading">
				<h1>장바구니</h1>
				<div class="chk_opt">
					<ul>
						<li id="allDel">선택삭제 </li>
						<li>
							<span class="vertical_bar">|</span>
						</li>
						<li id="allSelect"> 전체삭제</li>
					</ul>
				</div>
			</div>
			<form action="" name="cart-form">
			
				<div id="cart_container">
					<table class="cart_list">
						<tr>
							<th class="cart_col"><input type="checkbox" name="check" id="checkAll"><label for="checkAll"></label></th>
							<th>상품</th>
							<th>수량</th>

							<th>첫배송일</th>
							<th>가격</th>
						</tr>
						<tr>
							<td class="col1">
								<input type="checkbox" name="check" id="check1"><label for="check1"></label>
							</td>
							<td>
								<ul>
									<li><i class="fa-solid fa-file-image"></i></li>
									<li>베이비식단</li>
								</ul>
							</td>
							<td class="quantity">
								<table class="quantity_table">
									<tr>
										<td><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></td>
						
							<td><input type="number" class="qty" value="1"></td>
							<td><span><i class="fa-solid fa-plus"></i></span></td>
						</tr>
					</table>
					</td>

					<td><input class="datepicker"" /></td>
								<td>100,000원</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="check" id="check2"><label for="check2"></label></td>
					<td>
						<ul>
							<li><i class="fa-solid fa-file-image"></i></li>
							<li>체중조절 식단</li>
						</ul>
					</td>
					<td class="quantity">
						<table class="quantity_table">
							<tr>
								<td><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></td>
					
					<td><input type="number" class="qty" value="1"></td>
					<td><span><i class="fa-solid fa-plus"></i></span></td>
					</tr>
					</table>
					</td>

					<td><input class="datepicker"" /></td>
								<td>100,000원</td>
							</tr>
						</table>
					</div>
					<div class=" cal">
						<div class=total>
							<span>총 결제금액&nbsp;</span>
							<span id="total_price" class="total_price=">200,000원</span>
						</div>
						<div class="order_container">
							<a href="/salabrity/order/order">
								선택상품 주문
							</a>
							<a href="/salabrity/order/order">
								전체주문
							</a>
						</div>
				</div>
			</form>
			<script>
				flatpickr(" .datepicker", {}); </script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>