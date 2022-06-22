<%@page import="buy.model.dto.ProductBuyExt"%>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "common.utill.Methods" %>
<%@ page import= "product.model.dto.ProductExt" %>
<%@ page import= "java.text.DecimalFormat" %>
<%@ page import= "buy.model.dto.BuyExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/orderList.css" />
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<BuyExt> list = (List<BuyExt>)request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("#,###");
%>
<section id="order_list">
	<h1>주문 내역</h1>
	<table>
<%
	if(list != null && !list.isEmpty()){
		for(BuyExt buy : list){
			List<ProductBuyExt> productBuyList = buy.getList();
%>
		<tr class="row1" id="<%= buy.getMerchantUid() %>">
			<td class="col1" width="193">주문번호: <%= buy.getMerchantUid() %></td>
			<td class="col2" rowspan="2" width="400">주문 상품 : <%= productBuyList.get(0).getProductName() %>
				<%= productBuyList.size() == 1 ? "" : "외 "+ (productBuyList.size()-1) + "건" %>
			</td>
			<td class="col3" rowspan="2">결제금액 : <%= df.format(buy.getAmount()) %>원
			</td>
			<td class="col4" width="110" rowspan="2">
				<button class="boardQuestion">1 : 1문의</button>
			</td>
		</tr>
		<tr class="row2">
			<td class="col1">주문일자 : <%= sdf.format(buy.getBuyDate()) %></td>
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
</section>
<script>
	window.onload = () => {
		<%String addCartSuccessMsg = (String) session.getAttribute("addCartSuccessMsg");
		if (addCartSuccessMsg != null) {%>
			alert("<%= addCartSuccessMsg %>");
		<%
				session.removeAttribute("addCartSuccessMsg");
			}
		%>
	}
	const question_btns = document.querySelectorAll('#order_list tr.row2 td.col4');
	question_btns.forEach(function (elem) {
		elem.addEventListener('click', function () {
			location.href = '<%= request.getContextPath() %>/mypage/boardQuestionList';
		});
	});

	const order_infoes = document.querySelectorAll('#order_list tr .col1, #order_list tr .col2,#order_list tr .col3');
	
	order_infoes.forEach(function (elem) {
		elem.addEventListener('click', function () {
		location.href = '<%= request.getContextPath() %>/mypage/orderView?merchantUid='+ $(event.target).parent().attr('id');
		});
	});
	
	const cart_btns = document.querySelectorAll('#order_list tr.row1 td.col4');
	cart_btns.forEach(function (elem) {
		elem.addEventListener('click', function () {
			location.href = '<%= request.getContextPath() %>/order/cart';
		});
	});				
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>