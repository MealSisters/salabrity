<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/orderList.css" />
	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>

			<link rel="stylesheet" href="order_list.css">
			<section id="order_list">

					<h1>주문 내역
						<p>지난 3년간의 주문 내역 조회됩니다.</p>
					</h1>

				<table>
					<tr class="row1">
						<td class="col1">주문번호 : 0000000000</td>
						<td class="col2" rowspan="2" >주문 상품: 채식주의자를 위한 비건 식단(2주 10회 총 5회 배송)외 1개 </td>
						<td class="col3" rowspan="2"> 결제금액 : 200,000원</td>
						<td class="col4"><button>다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<!-- <td class="col2">주문자 연락처: 010-1111-1111</td> -->
						<!-- <td class="col3"></td> -->
						<td class="col4"> <button>1 : 1문의</button></td>
					</tr>
					<tr class="row1">
						<td class="col1">주문번호 : 0000000000</td>
						<td class="col2" rowspan="2" >주문 상품: 채식주의자를 위한 비건 식단(2주 10회 총 5회 배송)외 1개 </td>
						<td class="col3" rowspan="2"> 결제금액 : 200,000원</td>
						<td class="col4"><button>다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<!-- <td class="col2">주문자 연락처: 010-1111-1111</td> -->
						<!-- <td class="col3"></td> -->
						<td class="col4"> <button>1 : 1문의</button></td>
					</tr>					<tr class="row1">
						<td class="col1">주문번호 : 0000000000</td>
						<td class="col2" rowspan="2" >주문 상품: 채식주의자를 위한 비건 식단(2주 10회 총 5회 배송)외 1개 </td>
						<td class="col3" rowspan="2"> 결제금액 : 200,000원</td>
						<td class="col4"><button>다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<!-- <td class="col2">주문자 연락처: 010-1111-1111</td> -->
						<!-- <td class="col3"></td> -->
						<td class="col4"> <button>1 : 1문의</button></td>
					</tr>					<tr class="row1">
						<td class="col1">주문번호 : 0000000000</td>
						<td class="col2" rowspan="2" >주문 상품: 채식주의자를 위한 비건 식단(2주 10회 총 5회 배송)외 1개 </td>
						<td class="col3" rowspan="2"> 결제금액 : 200,000원</td>
						<td class="col4"><button>다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<!-- <td class="col2">주문자 연락처: 010-1111-1111</td> -->
						<!-- <td class="col3"></td> -->
						<td class="col4"> <button>1 : 1문의</button></td>
					</tr>					<tr class="row1">
						<td class="col1">주문번호 : 0000000000</td>
						<td class="col2" rowspan="2" >주문 상품: 채식주의자를 위한 비건 식단(2주 10회 총 5회 배송)외 1개 </td>
						<td class="col3" rowspan="2"> 결제금액 : 200,000원</td>
						<td class="col4"><button>다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<!-- <td class="col2">주문자 연락처: 010-1111-1111</td> -->
						<!-- <td class="col3"></td> -->
						<td class="col4"> <button>1 : 1문의</button></td>
					</tr>					<tr class="row1">
						<td class="col1">주문번호 : 0000000000</td>
						<td class="col2" rowspan="2" >주문 상품: 채식주의자를 위한 비건 식단(2주 10회 총 5회 배송)외 1개 </td>
						<td class="col3" rowspan="2"> 결제금액 : 200,000원</td>
						<td class="col4"><button>다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<!-- <td class="col2">주문자 연락처: 010-1111-1111</td> -->
						<!-- <td class="col3"></td> -->
						<td class="col4"> <button>1 : 1문의</button></td>
					</tr>
				</table>
			
				
				<script>
				const question_btns = document.querySelectorAll('#order_list tr.row2 td.col4');
				console.log(question_btns);
				question_btns.forEach(function (elem) {
					elem.addEventListener('click', function () {
						location.href = '<%= request.getContextPath() %>/mypage/boardQuestion';
					});
				});

				const order_infoes = document.querySelectorAll('#order_list tr .col1, #order_list tr .col2,#order_list tr .col3');
				console.log(order_infoes);

				order_infoes.forEach(function (elem) {
					elem.addEventListener('click', function () {
						location.href = '<%= request.getContextPath() %>/mypage/orderView';
					});
				});
				const cart_btns = document.querySelectorAll('#order_list tr.row1 td.col4');
				console.log(cart_btns);
				cart_btns.forEach(function (elem) {
					elem.addEventListener('click', function () {
						location.href = '<%= request.getContextPath() %>/order/cart';
					});
				});
				</script>
<%@ include file="/WEB-INF/views/common/pagebar.jsp" %>
			</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>