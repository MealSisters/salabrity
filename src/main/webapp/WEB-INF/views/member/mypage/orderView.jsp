<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.sql.Date" %>
<%@ page import= "common.utill.Methods" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "product.model.dto.ProductExt" %>
<%@ page import= "java.text.DecimalFormat" %>
<%@ page import= "buy.model.dto.BuyExt" %>
<%@ page import= "buy.model.dto.BuyExt" %>
<%@ page import= "mypage.model.dto.Destination"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/orderView.css" />
<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
<%
	Methods method = new Methods();
	List<BuyExt> buyList = (List<BuyExt>)request.getAttribute("buyList");
	List<ProductExt> productList = (List<ProductExt>)request.getAttribute("productList");
	Destination destination = (Destination) request.getAttribute("destination");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
	String address = "(" + destination.getZipcode() + ") " + destination.getAddress();
	address += destination.getAddressDetail() != null ? destination.getAddressDetail() : "";
	String tel = method.getPhoneNumberFormat(destination.getTelephone()); 
	String buyerTel = method.getPhoneNumberFormat(buyList.get(0).getBuyerTel()); 
%>

<section id="order_view">
    <h1>주문내역 상세</h1>
	<article class="order_prduct">
		<div class="heading_wrp">
			<h2>
				주문번호&nbsp;&nbsp;&nbsp;&nbsp;<%= buyList.get(0).getMerchantUid() %></h2>
			<div>
				배송 또는 상품에 문제가 있나요?&nbsp;<a
					href="<%= request.getContextPath() %>/mypage/boardQuestionList">1
					: 1 문의하기</a>
			</div>
		</div>
		<table class="order_product_tbl">
			<%
        if(destination != null && buyList != null && !buyList.isEmpty() && productList != null && !productList.isEmpty()){
        	for(int i = 0; i < buyList.size(); i++){
        		ProductExt product = productList.get(i);
        		BuyExt buy = buyList.get(i);
        %>
			<tr class="row_odd">
				<td rowspan="2" class="r1">
				<% 
					if(product.getDelFlag().equals("Y")){
				%>
				<img src="<%= request.getContextPath() %>/upload/product/<%=product.getAttachs().get(0).getRenamedFileName() %>"
					alt="<%= product.getAttachs().get(i).getOriginalFileName() %>" class="prd_img">
				<%
				} else {
				%>
				<a href="<%= request.getContextPath() %>/product/productInfo?no=<%= product.getProductNo() %>">
					<img src="<%= request.getContextPath() %>/upload/product/<%=product.getAttachs().get(0).getRenamedFileName() %>"
					alt="<%= product.getAttachs().get(i).getOriginalFileName() %>" class="prd_img">
				</a>
				<%
				}
				%>	
				</td>
				<td class="r2_1"><%= productList.get(i).getProductName() %>
				<span>
						&nbsp;&nbsp;주문개수 : <%= buy.getList().get(i).getQuantity()%> 개
				</span>
				</td>
			</tr>
			<tr class="row_even">
				<td class="r2_2">가격 : <%= df.format(buy.getList().get(i).getQuantity() * product.getProductPrice()) %>
					원&nbsp;&nbsp; | &nbsp;&nbsp;배송 시작일 : <%=buy.getList().get(i).getFirstShippingDate() %></td>
			</tr>
			<%
        	}
        }
        %>
		</table>
		<div class="order_btn_wrp">
			<button class="all_cart_btn btn">전체상품 다시 담기</button>
		</div>
		<p></p>
	</article>
	<h2>배송정보</h2>
	<article class="ship_info">
		<table>
			<tr>
				<th>받는 분</th>
				<td><%= destination.getShippingPerson() %></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><%= tel %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=address%></td>
			</tr>
			<tr>
				<th>배송 요청사항</th>
				<td><%= buyList.get(0).getRequestTerm() != null ? buyList.get(0).getRequestTerm() : "" %></td>
			</tr>
		</table>
	</article>
	<h2>주문정보</h2>
    <article class="order_info">
        <table>
            <tr>
                <th>주문번호</th>
                <td> <%= buyList.get(0).getMerchantUid() %></td>
            </tr>
            <tr>
                <th>주문자명</th>
                <td><%= buyList.get(0).getBuyerName() %></td>
            </tr>
            <tr>
                <th>주문자 휴대폰번호</th>
                <td>
                	<%= buyerTel %>
                </td>
            </tr>
        </table>
    </article>
    <article class="pay_info">
        <h2>결제정보</h2>
        <article>
            <table>
                <tr>
                    <th>결제금액</th>
                    <td><%= df.format(buyList.get(0).getAmount()) %>원</td>
                </tr>
                <tr>
                    <th>결제방법</th>
                    <td>카드</td>
                    <td><td>
                </tr>
                <tr>
                    <th>결제일자</th>
                    <td><%= buyList.get(0).getPaymentDate() %></td>
                </tr>
            </table>
        </article>
    </article>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>