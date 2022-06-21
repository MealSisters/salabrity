<%@ page import= "java.util.List" %>
<%@ page import= "cart.model.dto.Cart" %>
<%@ page import= "mypage.model.dto.Destination" %>
<%@ page import= "product.model.dto.ProductExt" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "product.model.dto.ProductAttach" %>
<%@ page import= "java.util.ArrayList" %>
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

	System.out.println(map);

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
                    <td class="date"><%= cartList.get(i).getQuantity() %>개</td>
                    <td class="qty"><%= productList.get(i).getSubscriptionPeriod() %>주</td>
                    <td class="prd_price"><%= productList.get(i).getProductPrice() %>원</td>
                    <td class="prd_price"><%= productList.get(i).getProductPrice()*cartList.get(i).getQuantity() %></td>
                </tr>
           <%
           		}
           	} else {    
           		 quantity = Integer.parseInt(request.getParameter("quantity"));
           		price = Integer.parseInt(request.getParameter("productPrice"));
           		totalPrice = quantity * price;
           %>
            <tr>
                    <td class="prd_title">
                        <ul>
                            <li><img src="<%= request.getContextPath() %>/upload/product/<%= request.getParameter("renamedFileName") %>"
                            alt="<%= request.getParameter("originalFileName") %>"></li>
                            <li><%= request.getParameter("productName") %></li>
                        </ul>
                    </td>
                    <td class="term"><%= request.getParameter("firstShippingDate") %></td>
                    <td class="qty"><%= quantity %>개</td>
                    <td class="date"><%= request.getParameter("subscriptionPeriod") %>주</td>
                    <td class="prd_price"><%= price %>원</td>
                    <td class="prd_price"><%= totalPrice%>원</td>
                </tr>
           <%
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
                        	<%= totalPrice%>
                        <%
                        } else {
                        %>
                        <%= quantity * price %>
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
                    <th>배송지 선택</th>
                    <td class="addr_chk">
                        <input type="radio" name="radio" id="user_addr" checked>&nbsp;&nbsp;<label for="user_addr">주문고객 정보와 동일</label>
                        <input type="radio" name="radio" id="address_default" >&nbsp;&nbsp;<label for="destination_default">기본 배송지</label>
                        <input type="radio" name="radio" id="address_choice">&nbsp;&nbsp;<label for="destination_choice">배송지 정보에서 선택</label>
                        <input type="radio" name="radio" id="new_addr">&nbsp;&nbsp;<label for="new_addr">직접 입력</label>
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
                            <input type="text" class="zipcode add_input" id="zipcode" value="<%= loginMember.getZipcode() %>" readonly>&nbsp;&nbsp;
                            <button type="button" class="search_zipcode">우편번호 검색</button><br>
                            <input type="text" class="address add_input" id="address" value="<%= loginMember.getAddress() %>" readonly>&nbsp;&nbsp;
                            <input type="text" class="address_detail add_input" id="address_detail" value="<%= loginMember.getAddressDetail() %>">
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
		console.log("로드테스트");
		<%
		if( defaultDestination != null){
		%>
		
			$('#address_default').prop('checked', true);
			addressDefault();
		<%
		} else {
		%>
		$('#user_addr').prop('checked', true);
		buyerAddr();
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
    }else {
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
    console.log(apply);
    apply.addEventListener('click',function(){
        const destinationList = document.querySelector('#destination_list');
        //체크된 객체 가져오기
        
        	

        <% 
        for(Destination destination : destinationList){        	
        	%>
        	if(document.querySelector("#destination_list input[type='radio']:checked").id === "<%= destination.getShippingAddressNo()%>"){
        		
       	
        //일치
				
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
    })
    
    //주문자정보와 동일 선택시
        $('#user_addr').click((e) => {
        	buyerAddr();
    	
    });
    
    //라디오 - 기본배송지 선택시 이벤트

    $('#address_default').click((e) => {

	    	addressDefault();

    });
    
    const addressDefault = () => {
    	
		<% if(defaultDestination != null){
		addressDetail = defaultDestination.getAddressDetail() != null ? defaultDestination.getAddressDetail() : "";%>
		
    	$('#shipping_person').val("<%=defaultDestination.getShippingPerson()%>");
		$('#tel1').val("<%=defaultDestination.getTelephone().substring(0, 3)%>");
		$('#tel2').val("<%=defaultDestination.getTelephone().substring(3, 7)%>");
		$('#tel3').val("<%=defaultDestination.getTelephone().substring(7)%>");
		$('#zipcode').val(<%=defaultDestination.getZipcode()%>);
		$('#address').val("<%=defaultDestination.getAddress()%>");
		
		$('#address_detail').val("<%=addressDetail%>");
		<% 
		}else{
		%>
			alert('기본배송지가 등록되어있지 않습니다.');
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
		console.log($(".productName").html());
		let orderName = $(".productName").html();
		if(<%= cartList != null && cartList.size() > 1%>){
			orderName += " 외 " + <%= cartList.size() - 1 %> + "건";
		}
		
		//주문자 주소 처리
	<%	String buyerAddress = "(" + loginMember.getZipcode() + ") " + loginMember.getAddress();
				buyerAddress += loginMember.getAddressDetail() != null ? loginMember.getAddressDetail() : ""; %>
    let buyerAddress = "<%= buyerAddress %>";
				
    //아임포트 결제-결제준비
   IMP.init('imp68598851'); 
    

   
	 $('#paymentBtn').click((e) => {
	 	IMP.request_pay({
	 	    pg : 'inicis', // version 1.1.0부터 지원.
	 	    pay_method : 'card',
	 	    merchant_uid : new Date().getTime(),
	 	    name : orderName,
	 	  //  amount : <%= totalPrice %>, //판매 가격
	 	    amount : 100, //판매 가격
	 	    buyer_email : '<%= loginMember.getEmail() %>',
	 	    buyer_name : '<%= loginMember.getMemberName() %>',
	 	    buyer_tel : '<%= loginMember.getPhone()%>',
	 	    buyer_addr : buyerAddress,
	 	    buyer_postcode : '<%= loginMember.getZipcode()%>'
	 	}, function (rsp) { // callback
	 	    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	 	        // jQuery로 HTTP 요청
	 	        jQuery.ajax({
	 	         // url: , // 가맹점 서버
	 	          method: "POST",
	 	          headers: { "Content-Type": "application/json" },
	 	          data: {
	 	              impUid: rsp.imp_uid,
	 	              merchantUid: rsp.merchant_uid,
	 	              payMethod = 'card',
	 	              requestTerm = $('requestTerm').html();
	 	              amount = <%= totalPrice %>,
	 	              paymentStatemant = "paid",
	 	              
	 	              
	 	              
	 	              //배송지
	 	              //주문자 정보와 동일에서 선택한 경우, 새 배송지 선택한 경우
	 	              
	 	              //배송지 목록에서 선택한 경우
	 	              
	 	              
	 	              
	 	          }
	 	      }).done(function(data) { // 응답 처리

	 	            	if(data.status.equals("success")){
	 	            		//결제 성공시 로직
	 	            		
	 	            		//페이지 이동
	 	            		location.href="<%= request.getContextPath() %>";
	 	            	}
	 	           
	 	          
	 	        });
	 	    } else {
	 	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	 	    }
	 	  });
	 	
	 	    });
	 
	


	

   
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>