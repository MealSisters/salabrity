<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.sql.Date" %>
<%@ page import= "product.model.dto.ProductExt" %>
<%@ page import= "java.text.DecimalFormat" %>
<%@ page import= "buy.model.dto.BuyExt" %>
<%@ page import= "buy.model.dto.BuyExt" %>
<%@ page import= "mypage.model.dto.Destination"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/orderView.css" />
	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
<%
	List<BuyExt> buyList = (List<BuyExt>)request.getAttribute("buyList");
	List<ProductExt> productList = (List<ProductExt>)request.getAttribute("productList");
	Destination destination = (Destination) request.getAttribute("destination");
	DecimalFormat df = new DecimalFormat("#,###");
	String address = "(" + destination.getZipcode() + ") " + destination.getAddress();
	address += destination.getAddressDetail() != null ? destination.getAddressDetail() : "";
%>

<section id="order_view">
    <h1>주문내역 상세</h1>
    <article class="order_prduct">
        <div class="heading_wrp">
            <h2>주문번호&nbsp;&nbsp;&nbsp;&nbsp;<%= buyList.get(0).getMerchantUid() %></h2>
            <div>배송 또는 상품에 문제가 있나요?&nbsp;<a href="배송조회">1 : 1 문의하기</a></div>
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
                    <img src="<%= request.getContextPath() %>/upload/product/<%=product.getAttachs().get(0).getRenamedFileName() %>" 
                    	alt="<%= product.getAttachs().get(i).getOriginalFileName() %>" class="prd_img">
                </td>
                <td class="r2_1"><%= productList.get(i).getProductName() %><span> &nbsp;&nbsp;주문개수 : <%= buy.getList().get(i).getQuantity()%> 개</span></td>

                <td rowspan="2" class="r4"><button>장바구니 담기</button></td>
            </tr>
            <tr class="row_even">
                <td class="r2_2">
                가격 : <%= df.format(buy.getList().get(i).getQuantity() * product.getProductPrice()) %> 원&nbsp;&nbsp;
                | &nbsp;&nbsp;배송 시작일 : <%=buy.getList().get(i).getFirstShippingDate() %></td>
            </tr>
        <%
        	}
        }
        %>
        
        </table>
        <div class="order_btn_wrp">
            <button class="all_cart_btn btn">전체상품 다시 담기</button>
            <button class="all_cancel_btn btn" disabled>전체 상품 주문 취소</button>
        </div>
        <p></p>
    </article>
    <h2>배송정보</h2>
    <article class="ship_info">
        <table>
            <tr>
                <th>받는분</th>
                <td><%= destination.getShippingPerson() %></td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td><%= destination.getTelephone() %></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><%= address %></td>
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
                	<%= buyList.get(0).getBuyerTel() %>
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
                    <td><%= productList %></td>
                    <td><td>
                </tr>
                <tr>
                    <th>결제일시</th>
                    <td><%= buyList.get(0).getPaymentDate() %></td>
                </tr>
            </table>
        </article>
    </article>
</section>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>