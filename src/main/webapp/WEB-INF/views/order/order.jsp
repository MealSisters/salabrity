<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/order/order.css">

			<h1>주문/결제</h1>
			<form action="" id="frmOrder">
				<div class="order_list">
					<h2>주문/결제 상품</h2>
					<table class="order_tbl">
						<thead>
							<tr>
								<td class="prd_title">상품명</td>
								<td class="term">배송기간</td>
								<td class="date">첫배송일</td>
								<td class="qty">수량</td>
								<td class="prd_price">판매가격</td>
								<td class="prd_price">합계가격</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="prd_title">
									<ul>
										<li><img src="meal-1307604_1920.jpg" alt="이미지"></li>
										<li>베이비 식단</li>
									</ul>
								</td>
								<td class="term">1주(1일 2식 총 10회)</td>
								<td class="date">2022-06-07</td>
								<td class="qty">1개</td>
								<td class="prd_price">104,000원</td>
								<td class="prd_price">104,000원</td>
							</tr>
							<tr>
								<td class="prd_title">
									<ul>
										<li><img src="meal-1307604_1920.jpg" alt="이미지"></li>
										<li>체중조절 식단</li>
									</ul>
								</td>
								<td class="term">1주(1일 2식 총 10회)</td>
								<td class="date">2022-06-07</td>
								<td class="qty">1개</td>
								<td class="prd_price">140,000원</td>
								<td class="prd_price">140,000원</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" class="total_tit">
									총 결제금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="total_price">244,000원</span>
								</td>

							</tr>
						</tfoot>
					</table>
				</div>

				<div class="ship-info">
					<div class="ship-header">
						<h2>상품 배송지 정보 &nbsp;&nbsp;&nbsp;</h2><span>*는 필수 입력 항목</span>
					</div>
					<table class="shipping_tbl">
						<tbody>
							<tr>
								<th>배송지 선택</th>
								<td class="addr_chk">
									<input type="radio" name="addr_radio" id="user_addr">&nbsp;&nbsp;&nbsp;&nbsp;<label for="user_addr">주문고객 정보와 동일</label>
									<input type="radio" name="addr_radio" id="ship-info_default" checked>&nbsp;&nbsp;&nbsp;&nbsp;<label for="ship-info_default">기본 배송지</label>
									<input type="radio" name="addr_radio" id="ship-info_addr">&nbsp;&nbsp;&nbsp;&nbsp;<label for="ship-info_addr">배송지 정보에서 선택</label>
									<input type="radio" name="addr_radio" id="new_addr">&nbsp;&nbsp;&nbsp;&nbsp;<label for="new_addr">새로 입력</label>
								</td>
							</tr>
							<tr>
								<th>받으시는분<span class="required_col">*</span></th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>휴대폰번호<span class="required_col">*</span></th>
								<td><input type="text">&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text"></td>
							</tr>
							<tr class="address">
								<th>주소<span class="required_col">*</span></th>
									<td>
										<input type="text" class="zip add_input">&nbsp;&nbsp;<a href="" >&nbsp;우편번호 검색</a><br>
										<input type="text" class="add1 add_input">&nbsp;&nbsp;
										<input type="text" class="add2 add_input">
									</td>
							</tr>
							<tr>
								<th>배송 요청사항</th>
								<td>
									<textarea name="" id="" cols="30" rows="10"></textarea><br>
									- 입력글자는 최대 한글 60자, 영문/숫자 120자까지 가능합니다.
								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="payment"><a href="">결제하기</a></div>
			</form>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>