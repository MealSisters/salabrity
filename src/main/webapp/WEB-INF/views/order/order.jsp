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


<h1>주문/결제</h1>
<form action="" id="frmOrder">
    <div class="order_list">
        <h2>주문/결제 상품</h2>
        <table class="order_tbl">
            <thead>
                <tr>
                    <th class="prd_title order_tbl_tit">상품명</th>
                    <th class="date order_tbl_tit">첫배송일</th>
                    <th class="qt order_tbl_tit">수량</th>
                    <th class="term order_tbl_tit">배송기간</th>
                    <th class="prd_price order_tbl_tit">판매가격</th>
                    <th class="prd_price order_tbl_tit">합계가격</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="prd_title">
                        <ul>
                            <li><img src="" alt="이미지"></li>
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
                        
                            <li><img src="" alt="이미지"></li>
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
                        총 결제금액&nbsp;&nbsp;
                        <span class="total_price">244,000원</span>
                    </td>

                </tr>
            </tfoot>
        </table>
    </div>
    <!-- 주문자정보 -->
    <divclass class="buyer_info">

    </divclass>
    <div class="ship-info">
        <div class="ship-header">
            <h2>상품 배송지 정보</h2><div><span>*</span>는 필수 입력 항목</div>
        </div>
        <table class="shipping_tbl">
            <tbody>
                <tr>
                    <th>배송지 선택</th>
                    <td class="addr_chk">
                        <input type="radio" name="radio" id="user_addr">&nbsp;&nbsp;<label for="user_addr">주문고객 정보와 동일</label>
                        <input type="radio" name="radio" id="address_default" checked>&nbsp;&nbsp;<label for="destination_default">기본 배송지</label>
                        <input type="radio" name="radio" id="address_choice">&nbsp;&nbsp;<label for="destination_choice">배송지 정보에서 선택</label>
                        <input type="radio" name="radio" id="new_addr">&nbsp;&nbsp;<label for="new_addr">새로 입력</label>
                    </td>
                </tr>
                <tr>
                    <th>받으시는분 <span class="required_col">*</span></th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>휴대폰번호 <span class="required_col">*</span></th>
                    <td><input type="text">&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text"></td>
                </tr>
                <tr class="address_row">
                    <th>주소 <span class="required_col">*</span></th>
                        <td>
                            <input type="text" class="zipcode add_input" disabled>&nbsp;&nbsp;<button type="button" class="search_zipcode">우편번호 검색</button><br>
                            <input type="text" class="address add_input" disabled>&nbsp;&nbsp;
                            <input type="text" class="address_detail add_input">
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
    <div class="payment"><button class="payment" type="button">결제하기</button></div>
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
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
            </tr>
            
        </tbody>
    </table>
    <button type="button" class="apply"> 확인</button>
</div>

<script>
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
    console.log(addressChoice);
    
    addressChoice.addEventListener('click', function(){
        const destinationList = document.querySelector('#destination_list')
        console.log(destinationList);
        destinationList.style.zIndex="1";
        destinationList.style.opacity="1";
    });
    //선택창에서 확인버튼 클릭
    const apply = document.querySelector(".apply");
    console.log(apply);
    apply.addEventListener('click',function(){
        const destinationList = document.querySelector('#destination_list')
        //input 태그들에 값 입력

        //창 숨김
        destinationList.style.zIndex="-1";
        destinationList.style.opacity="0";
    })

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>