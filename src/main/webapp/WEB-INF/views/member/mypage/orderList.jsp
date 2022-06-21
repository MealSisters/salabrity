<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "product.model.dto.ProductExt" %>
<%@ page import= "java.text.DecimalFormat" %>
<%@ page import= "buy.model.dto.BuyExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/orderList.css" />
	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
<%

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
	List<BuyExt> list = (List<BuyExt>)request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("#,###");
	
	
	
	
%>

			<section id="order_list">

					<h1>주문 내역</h1>

				<table>
				<%
					if(list != null && !list.isEmpty()){
						for(BuyExt buy : list){
				%>
					<tr class="row1">
						<td class="col1">주문번호 : <%= ""%></td>
						<td class="col2" rowspan="2" >주문 상품: <%= "주문상품이름"%> <%=  ""%> </td>
						<td class="col3" rowspan="2"> 결제금액 : <%= df.format("결제금액") %></td>
						<td class="col4"><button class="addCart">다시담기</button></td>
					</tr>
					<tr class="row2">
						<td class="col1">주문일자 : 2022-06-08</td>
						<td class="col4"> <button class="boardQuestion">1 : 1문의</button></td>
					</tr>
				<%
						}
					} else{
				%>
					<tr>
						<td class="orderListNull">주문내역이 존재하지 않습니다.</td>
					</tr>
				<%
					}
				%>
									
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
				
				//클릭시
		       $(".addCart").click((e) =>{
					//폼생성 후 장바구니 추가 서블릿? 으로 보내기		          	

		           });
				</script>

			</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>