<%@page import="java.sql.Date"%>
<%@page import="buy.model.dto.ProductBuy"%>
<%@ page import= "java.util.List" %>
<%@ page import= "cart.model.dto.Cart" %>
<%@ page import= "mypage.model.dto.Destination" %>
<%@ page import= "product.model.dto.ProductExt" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "product.model.dto.ProductAttach" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/order/order.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%
	String addressDetail = "";
	Destination defaultDestination = (Destination)request.getAttribute("defaultDestination");
	List<Destination> destinationList = (List<Destination>) request.getAttribute("destinationList");
	String memberId = loginMember.getMemberId();
	Map<String, Object> map = (Map<String, Object>) session.getAttribute("orderMap");
	List<Cart> cartList = null;
	List<ProductExt> productList = null;
	int quantity = 0;
	int price = 0;
	int totalPrice = 0;
	if(map != null && !map.isEmpty()){
		cartList = (List<Cart>)map.get("cartList");
		productList = (List<ProductExt>)map.get("productList");
	}
	DecimalFormat df = new DecimalFormat("#,###");
	List<ProductBuy> pbList = new ArrayList<>();
%>

<h1>주문/결제</h1>
<form action="" id="frmOrder" method="post">
    <div class="order_list">
        <h2>주문/결제 상품</h2>
        <table class="order_tbl">
            <thead>
                <tr>
                    <th class="prd_title order_tbl_tit">상품명</th>
                    <th class="date order_tbl_tit">첫배송일</th>
                    <th class="qt order_tbl_tit">수량</th>
                    <th class="term order_tbl_tit">구독기간</th>
                    <th class="prd_price order_tbl_tit">판매가격</th>
                    <th class="prd_price order_tbl_tit">합계가격</th>
                </tr>
            </thead>
            <tbody>
           <%
           if (cartList != null && !cartList.isEmpty()) {	
           		for(int i = 0; i < cartList.size(); i++){
           			ProductBuy pb = new ProductBuy();
           			pb.setProductNo(productList.get(i).getProductNo());
           			pb.setQuantity(cartList.get(i).getQuantity());
           			pb.setFirstShippingDate(Date.valueOf(cartList.get(i).getFirstShipppingDate()));
           			pbList.add(pb);
           			
           			ProductAttach attach  = productList.get(i).getAttachs().get(0);
           			totalPrice += productList.get(i).getProductPrice()*cartList.get(i).getQuantity();
           %>
          		 <tr>
                    <td class="prd_title">
                        <ul>
                            <li><img src="<%= request.getContextPath() %>/upload/product/<%= attach.getRenamedFileName()%>"
                             alt="<%= attach.getOriginalFileName() %>" ></li>
                            <li class = "productName"><%= productList.get(i).getProductName() %></li>
                        </ul>
                    </td>
                    <td class="term"><%= cartList.get(i).getFirstShipppingDate() %></td>
                    <td class="qty"><%= cartList.get(i).getQuantity() %>개</td>
                    <td class="date"><%= productList.get(i).getSubscriptionPeriod() %>주</td>
                    <td class="prd_price"><%= df.format(productList.get(i).getProductPrice()) %>원</td>
                    <td class="prd_price"><%= df.format(productList.get(i).getProductPrice()*cartList.get(i).getQuantity()) %>원</td>
                </tr>
           <%
           		}
           	}
           %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6" class="total_tit">
                        총 결제금액&nbsp;&nbsp;
                        <span class="total_price">
                        <% if(map != null && !map.isEmpty()){
                        %>
                        	<%= df.format(totalPrice)%>원
                        <%
                        } 
                        %>
						</span>
                    </td>

                </tr>
            </tfoot>
        </table>
    </div>
    <!-- 주문자정보 -->

    <div class="ship-info">
        <div class="ship-header">
            <h2>상품 배송지 정보</h2><div><span>*</span>는 필수 입력 항목</div>
        </div>
        <table class="shipping_tbl">
            <tbody>
                <tr>
                    <th><label for="radio">배송지 선택</label></th>
                    <td class="addr_chk">
                        <input type="radio" name="radio" id="address_default" value="address_default" >&nbsp;&nbsp;<span for="address_default" style="font-size:13px; margin-right:20px;" >기본 배송지</span>
                        <input type="radio" name="radio" id="address_choice" value="address_choice" >&nbsp;&nbsp;<span for="address_choice" style="font-size:13px; margin-right:20px;" >배송지 정보에서 선택</span>
                        <input type="radio" name="radio" id="new_addr" value="new_addr" checked>&nbsp;&nbsp;<span for="new_addr" style="font-size:13px; margin-right:20px;" >직접 입력</span>
                    </td>
                </tr>
                <tr>
                    <th>받으시는분 <span class="required_col">*</span></th>
                    <td><input type="text" id="shipping_person"></td>
                </tr>
                <tr>
                    <th>휴대폰번호 <span class="required_col">*</span></th>
                    <td><input type="text" id="tel1">&nbsp;&nbsp;-&nbsp;&nbsp;
                    	<input type="text" id="tel2">&nbsp;&nbsp;-&nbsp;&nbsp;
                    	<input type="text" id="tel3"></td>
                </tr>
                <tr class="address_row">
                    <th>주소 <span class="required_col">*</span></th>
                        <td>
                            <input type="text" class="zipcode add_input" id="zipcode" value="" readonly>&nbsp;&nbsp;
                            <button type="button" class="search_zipcode">우편번호 검색</button><br>
                            <input type="text" class="address add_input" id="address" value="" readonly>&nbsp;&nbsp;
                            <input type="text" class="address_detail add_input" id="address_detail" value="">
                        </td>	
                </tr>
                <tr>
                    <th>배송 요청사항</th>
                    <td>
                        <textarea name="" id="requestTerm" cols="30" rows="10"></textarea><br>
                        - 입력글자는 최대 한글 60자, 영문/숫자 120자까지 가능합니다.
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
    <div class="payment"><button class="payment" type="button" id="paymentBtn">결제하기</button></div>
</form>
<div id="destination_list">
    <h3>배송지 목록</h3>
    <table>
        <thead>
            <tr>
                <th class="col1">선택</td>
                <th class="col2">받으실분</th>
                <th class="col3">주소</th>
                <th class="col4">연락처</th>
            </tr>
        </thead>
        <tbody>
<%
        	if(destinationList != null && !destinationList.isEmpty()){
        		for(Destination destination : destinationList){
        			String checked = "";
        			if(destination.getIsDefault().equals("Y")){
        				checked = "checked";
        			}
        			String telephone = destination.getTelephone().substring(0, 3) + "-" +
        				destination.getTelephone().substring(3, 7) + "-" + destination.getTelephone().substring(7);
        			String address = "(" + destination.getZipcode() + ") " + destination.getAddress();
        			address += destination.getAddressDetail() != null ? destination.getAddressDetail() : "";
%> 
            <tr >
                <td class="col1"><input type="radio" name="default" id="<%= destination.getShippingAddressNo() %>" <%=destination.getIsDefault().equals("Y")? "checked":""%>></td>
                <td class="col2"><%= destination.getShippingPerson() %></td>
                <td class="col3"><%= address %></td>
                <td class="col4"><%= telephone %></td>
            </tr>
            
<% 
       		}
    	}
 %>

        </tbody>
    </table>
    <button type="button" class="apply"> 확인</button>
</div>

<script>

	$(()=>{
		<%
			if( defaultDestination != null){
		%>
				$('#address_default').prop('checked', true);
				addressDefault();
		<%
			}
			if(destinationList != null && destinationList.size()!= 0){
		%>
		<%
			}
		%>
	});

    //우편번호 선택 클릭 이벤트
    const zipcode = document.querySelector('.search_zipcode');
    console.log(zipcode);
    zipcode.addEventListener('click', function () {

        new daum.Postcode({
            oncomplete: function (data) {
                document.querySelector(".address").value = data.address;
                document.querySelector(".zipcode").value = data.zonecode;
            }
        }).open();

    });

    // 배송지 정보에서 선택 클릭
    const addressChoice = document.querySelector("#address_choice");
    addressChoice.addEventListener('click', function(){
    <%
    	if( destinationList != null && destinationList.size() != 0 ){
    %>

        const destinationList = document.querySelector('#destination_list')
        console.log(destinationList);
        destinationList.style.zIndex="1";
        destinationList.style.opacity="1";
    <%
    } else {
    %>
    	alert('등록된 배송지가 없습니다.');
    	$('#address_choice').prop('checked', false);
    	addrClear();
    	return;
    <%
    	}
    %>
    });

    //선택창에서 확인버튼 클릭
    const apply = document.querySelector(".apply");
    apply.addEventListener('click',function(){
        const destinationList = document.querySelector('#destination_list');

        //체크된 객체 가져오기
        <% 
        for(Destination destination : destinationList){        	
        	%>
        	//일치
        	if(document.querySelector("#destination_list input[type='radio']:checked").id === "<%= destination.getShippingAddressNo()%>"){	
		    	$('#shipping_person').val("<%=destination.getShippingPerson()%>");
				$('#tel1').val("<%=destination.getTelephone().substring(0, 3)%>");
				$('#tel2').val("<%=destination.getTelephone().substring(3, 7)%>");
				$('#tel3').val("<%=destination.getTelephone().substring(7)%>");
				$('#zipcode').val(<%=destination.getZipcode()%>);
				$('#address').val("<%=destination.getAddress()%>");
				<%addressDetail = destination.getAddressDetail() != null ? destination.getAddressDetail() : "";%>
				$('#address_detail').val("<%=addressDetail%>");
        	}
		<%
        }
        %>
       
        //창 숨김
        destinationList.style.zIndex="-1";
        destinationList.style.opacity="0";
    });
    
    //라디오 - 기본배송지 선택시 이벤트
    $('#address_default').click((e) => {
	    	addressDefault();
    });
    
    const addressDefault = () => {
    	
		<% if(defaultDestination != null) {
			addressDetail = defaultDestination.getAddressDetail() != null ? defaultDestination.getAddressDetail() : "";%>
			
	    	$('#shipping_person').val("<%=defaultDestination.getShippingPerson()%>");
			$('#tel1').val("<%=defaultDestination.getTelephone().substring(0, 3)%>");
			$('#tel2').val("<%=defaultDestination.getTelephone().substring(3, 7)%>");
			$('#tel3').val("<%=defaultDestination.getTelephone().substring(7)%>");
			$('#zipcode').val(<%=defaultDestination.getZipcode()%>);
			$('#address').val("<%=defaultDestination.getAddress()%>");
			
			$('#address_detail').val("<%=addressDetail%>");
			<% 
		} else {
		%>
			alert('기본배송지가 등록되어있지 않습니다.');
			$('#new_addr').prop('checked', true);
			addrClear();
		<%
		}
		%>
    };
    
    //주문자 주소
	const buyerAddr = () => {
    	$('#shipping_person').val("<%=loginMember.getMemberName()%>");
		$('#tel1').val("<%=loginMember.getPhone().substring(0,3)%>");
		$('#tel2').val("<%=loginMember.getPhone().substring(3,7)%>");
		$('#tel3').val("<%=loginMember.getPhone().substring(7)%>");
		$('#zipcode').val(<%= loginMember.getZipcode() %>);
		$('#address').val("<%= loginMember.getAddress() %>");
		
		<% addressDetail = loginMember.getAddressDetail() != null ? loginMember.getAddressDetail() : "";%>
		$('#address_detail').val("<%= addressDetail %>");
    };
    
    // 배송지 값 ""로
    const addrClear = () => {
    	$('#shipping_person').val("");
		$('#tel1').val("");
		$('#tel2').val("");
		$('#tel3').val("");
		$('#zipcode').val("");
		$('#address').val("");
		$('#address_detail').val("");
    };
    
    //새로입력 클릭 이벤트
	$('#new_addr').click((e) => {
		addrClear();
    });
    
	//주문명 생성
	let orderName = $(".productName").html();
	if(<%= cartList != null && cartList.size() >= 1 %>){
		orderName += " 외 " + <%= cartList.size() - 1 %> + "건";
	}

	<%-------------------------------------- 이은지 start --------------------------------------%>
   //아임포트 결제-결제준비
   IMP.init('imp68598851');
	
	$('#paymentBtn').click((e) => {
		// 사용자 form 입력값 가져오기
		const buyerTelMerge = $('#tel1').val()+$('#tel2').val()+$('#tel3').val();
		const buyerAddrMerge = $('#address').val()+" "+$('#address_detail').val();
		const requestTermVal = document.querySelector("#requestTerm").value;

		// 배송지정보 옵션 처리 1.기본배송지 2.배송지정보에서선택 3.직접입력
		let shippingAddrNo = 0;
		switch($("[type=radio]:checked").val()){
		<%-- case "user_addr": shippingOpt = "userAddr"; break; --%>
		case "address_default":
			<% if( defaultDestination != null) { %>
				shippingAddrNo = "<%= defaultDestination.getShippingAddressNo() %>";
			<% } %>
			break;
		case "address_choice":
			shippingAddrNo = document.querySelector("#destination_list input[type='radio']:checked").id;
			break;
		case "new_addr":
			shippingAddrNo = 0;
			break;
		}

		// 배열에 현재 구매에 포함된 상품정보(json형식) 추가
		let payPbArr = [];
		<% for(int i = 0 ; i < pbList.size(); i++) { %>
			payPbArr.push({ 
				productNo: <%= pbList.get(i).getProductNo() %>,
				quantity: <%= pbList.get(i).getQuantity() %>,
				firstShippingDate: "<%= pbList.get(i).getFirstShippingDate() %>"
			});
		<% } %>

		// json객체배열에 저장
		const jsonPayPbArr = JSON.stringify(payPbArr);

		// IMP.request_pay(결제정보, callback) : 결제창 호출
	 	IMP.request_pay({

	 	    pg : 'inicis',
	 	    pay_method : 'card',
	 	    merchant_uid : new Date().getTime(),
	 	    name : orderName,
	 	  	amount : <%=totalPrice%>, //판매 가격
	 	    buyer_email : '<%=loginMember.getEmail()%>',
	 	    buyer_name : $('#shipping_person').val(),
	 	    buyer_tel : buyerTelMerge,
	 	    buyer_addr : buyerAddrMerge,
	 	    buyer_postcode : $('#zipcode').val()

	 	}, function (rsp) { // callback
	 		
	 		// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	 	    if (rsp.success) { 	
	 	        
	 	    	// DB저장에 필요한 정보를 서블릿으로 전달
	 	        $.ajax({
					url: "<%=request.getContextPath()%>/buy/payment",
					method: "POST",
					dataType : "json",
					data: {
						// buy 테이블에 필요한 정보
		 	            merchantUid : rsp.merchant_uid, // 주문번호(buy테이블 고유값)
		 	            memberId : "<%=loginMember.getMemberId()%>",
		 	            payMethod : rsp.pay_method,
		 	            amount : rsp.paid_amount,
		 	            buyerEmail : rsp.buyer_email,
		 	            buyerName : rsp.buyer_name,
		 	            buyerTel : rsp.buyer_tel,
		 	            buyerAddr : rsp.buyer_addr,
		 	            buyerPostcode : rsp.buyer_postcode,
		 	            paySec : rsp.paid_at, // Unix time
						impUid : rsp.imp_uid, // 결제번호
						payStatement : rsp.status,
		 	            requestTerm : requestTermVal,

		 	        	// product_buy 테이블에 필요한 정보
						jsonPbArr : jsonPayPbArr,

						// shipping_address 테이블에 필요한 정보
		 	         	shippingAddrNo : shippingAddrNo,
						shippingAddrInput : $('#address').val(),
						shippingAddrDetailInput : $('#address_detail').val()
					}
	 	      	}).done(function(data) {
	 	      		// 결제 성공 시 응답 처리 : 알림 후 웰컴페이지 이동
	 	      		alert("결제에 성공하였습니다.");
	 	      		location.href = "<%=request.getContextPath()%>/";
		 	    });

	 	    } else {
		 	  // 결제 실패 case : 알림창 출력
	 	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	 	    }
		});

	});
	 <%--------------------------------------- 이은지 end ---------------------------------------%>

   
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>