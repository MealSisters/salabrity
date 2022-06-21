<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page import="buy.model.dto.ProductBuyExt"%>
<%@page import="buy.model.dto.ProductBuy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="buy.model.dto.BuyExt"%>
<%@page import="admin.model.service.AdminService"%>
<%@page import="buy.model.dto.Buy"%>
<%@page import="buy.model.dto.PayStatement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Map<String, Object> searchParam = (Map<String, Object>) request.getAttribute("searchParam"); 
	List<BuyExt> list = (List<BuyExt>) request.getAttribute("list");
	String pagebar = (String) request.getAttribute("pagebar");
	DecimalFormat fm = new DecimalFormat("###,###");
	
	int cPage = 1;
	if(request.getParameter("cPage")!=null) {
		cPage = Integer.parseInt(request.getParameter("cPage"));
	}
	int startNo = (cPage-1)*AdminService.ORDER_NUM_PER_PAGE + 1;

	
	System.out.println("searchParam@jsp = " + searchParam);
%>
<link rel='stylesheet' href='<%= request.getContextPath() %>/css/pagebar.css'>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminResultSetList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/ListSearchFilter.css">
<div class="div-level1" id="div-firstView">
    <p id="filter-wrapper-title">Filter</p>
    <div id="filter-wrapper" class="div-level2">
        <form name="orderFilterFrm" action="">
            <div class="div-searchFilter">
                <label for="filter-orderNo">주문번호</label>
                <input type="text" name="merchantUid" id="filter-orderNo" value="<%= searchParam.get("merchantUid")!=null ? searchParam.get("merchantUid") : "" %>">
            </div>
            <div class="div-searchFilter">
                <label for="filter-memberId">아이디</label>
                <input type="text" name="memberId" id="filter-memberId" value="<%= searchParam.get("memberId")!=null ? searchParam.get("memberId") : "" %>">
            </div>
            <div class="div-searchFilter">
                <label for="filter-orderDate-start">주문일</label>
                <input type="date" name="orderDateStart" id="filter-orderDate-start" class="periodStart" value="<%= searchParam.get("orderDateStart")!=null ? searchParam.get("orderDateStart") : "" %>">
                <span class="periodSeparator">~</span>
                <input type="date" name="orderDateEnd" id="filter-orderDate-end" class="periodEnd" value="<%= searchParam.get("orderDateEnd")!=null ? searchParam.get("orderDateEnd") : "" %>">
            </div>
            <div class="div-searchFilter">
                <label for="filter-payStatus">결제상태</label>
                <select name="payStatement" class="filter-select">
                    <option value="all" <%= searchParam.get("payStatement")!=null ? "" : "selected" %>>전체보기</option>
                    <option value="ready" <%= searchParam.get("payStatement") == PayStatement.ready ? "selected" : "" %>>미결제</option>
                    <option value="paid" <%= searchParam.get("payStatement") == PayStatement.paid ? "selected" : "" %>>결제완료</option>
                    <option value="faild" <%= searchParam.get("payStatement") == PayStatement.faild ? "selected" : "" %>>결제실패</option>
                    <option value="cancelled" <%= searchParam.get("payStatement") == PayStatement.cancelled ? "selected" : "" %>>환불처리</option>
                </select>
            </div>
            <div class="div-searchbtn">
                <button>조회</button>
            </div>
        </form>
    </div>

    <div class="div-level2 div-resultlist">
        <table id="tbl-orderList" class="tbl-searchResult">
            <thead>
                <tr>
                    <th class="col-no">No</th>
                    <th class="col-orderNo">주문번호</th>
                    <th class="col-memberId">아이디</th>
                    <th class="col-orderDate">주문일</th>
                    <th class="col-payStatus">결제상태</th>
                    <th class="col-price">결제금액</th>
                    <th class="col-shippingAddr">배송지</th>
                    <th class="col-products">주문상품</th>
                    <th class="col-orderReq">요청사항</th>
                    <%-- <th class="col-buttons">주문취소</th> --%>
                </tr>
            </thead>
            <tbody>
<%
	if(list != null && !list.isEmpty()){
		for(BuyExt buy : list){
			String status = buy.getPayStatement().toString();
			switch(status){
			case "ready" : status = "미결제"; break;
			case "paid" : status = "결제완료"; break;
			case "faild" : status = "결제실패"; break;
			case "cancelled" : status = "환불처리"; break;
			}
			List<ProductBuyExt> pbeList = buy.getList();
			String sumName = "";
			for(ProductBuyExt pbe : pbeList){
				if(!sumName.equals(""))
					sumName += ", ";
				sumName += pbe.getProductName();
			}
%>
                <tr>
                    <td class="col-no"><%= startNo++ %></td>
                    <td class="col-orderNo"><%= buy.getMerchantUid() %></td>
                    <td class="col-memberId"><%= buy.getMemberId() %></td>
                    <td class="col-orderDate"><%= buy.getBuyDate() %></td>
                    <td class="col-payStatus"><%= status %></td>
                    <td class="col-price"><%= fm.format(buy.getAmount()) %></td>
                    <td class="col-shippingAddr td-xscroll"><%= buy.getBuyerAddr() %></td>
                    <td class="col-products td-xscroll"><%= sumName %></td>
                    <td class="col-orderReq td-xscroll"><%= buy.getRequestTerm()!=null ? buy.getRequestTerm() : "" %></td>
                    
<%--            
	<%
				if(!status.equals("결제실패") && !status.equals("환불처리")){
	%>
	                    <td class="col-buttons">
	                        <div class="div-cancel"><a class="a-cancel">주문취소</a></div>
	                    </td>
	<%
				} else {
	%>
						<td><div><a>취소불가</a></div></td>
	<%
				}
	%>
--%>
                </tr>
<%
		}
	} else {
%>
				<tr>
					<td colspan="9">조회된 주문기록이 없습니다.</td>
				</tr>
<%
	}
%>
            </tbody>
        </table>
    </div>

    <%= pagebar %>
</div>
<script>
	document.orderFilterFrm.onsubmit = () => {
		let result = true;
		if (document.querySelector("#filter-orderDate-start").value > document.querySelector("#filter-orderDate-end").value) {
    		result = false;
    		alert("마지막 탐색기간은 시작기간보다 빠를 수 없습니다.");
    		document.querySelector("#filter-orderDate-end").focus();
    	}
		return result;
	};
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
