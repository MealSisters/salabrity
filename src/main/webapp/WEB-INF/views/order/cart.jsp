<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/order/cart.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<div class="heading">
    <h1>장바구니</h1>
    <div class="chk_opt">
        <ul>
            <li id="allDel">선택삭제 </li>
            <li>
                <span class="vertical_bar">|</span>
            </li>
            <li id="allSelect"> 전체삭제</li>
        </ul>
    </div>
</div>
<form action="" name="cart-form">

    <div id="cart_container">
        <table class="cart_list">
            <tr>
                <th class="cart_col"><input type="checkbox" name="checkAll" id="checkAll"><label
                        for="checkAll"></label></th>
                <th>상품</th>
                <th>수량</th>

                <th>첫배송일</th>
                <th>가격</th>
            </tr>
            <tr>
                <td class="col1">
                    <input type="checkbox" name="check" id="check1"><label for="check1"></label>
                </td>
                <td>
                    <ul>
                        <li><i class="fa-solid fa-file-image"></i></li>
                        <li>베이비식단</li>
                    </ul>
                </td>
                <td class="quantity">
                    <table class="quantity_table">
                        <tr>
                            <td><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></td>

                            <td><input type="number" class="qty" value="1" readonly></td>
                            <td><span class= "quantity_plus"><i class="fa-solid fa-plus"></i></span></td>
                        </tr>
                    </table>
                </td>

                <td><input class="datepicker" /></td>
        <td>100,000원</td>
    </tr>
    <tr>
        <td><input type="checkbox" name="check" id="check2"><label for="check2"></label></td>
                <td>
                    <ul>
                        <li><i class="fa-solid fa-file-image"></i></li>
                        <li>체중조절 식단</li>
                    </ul>
                </td>
                <td class="quantity">
                    <table class="quantity_table">
                        <tr>
                            <td><span class="quantity_minus"><i class="fa-solid fa-minus"></i></span></td>

                            <td><input type="number" class="qty" value="1" readonly></td>
                            <td class="quantity_plus"><span><i class="fa-solid fa-plus"></i></span></td>
                        </tr>
                    </table>
                </td>

                <td><input class="datepicker" readonly /></td>
        <td>100,000원</td>
    </tr>
</table>
</div>
<div class=" cal">
                    <div class=total>
                        <span>총 결제금액&nbsp;</span>
                        <span id="total_price" class="total_price=">200,000원</span>
                    </div>
                    <div class="order_container">
                        <a href="/salabrity/order/order">
                            선택상품 주문
                        </a>
                        <a href="/salabrity/order/order">
                            전체주문
                        </a>
                    </div>
    </div>
</form>
<script>

    //datepicker
    flatpickr(" .datepicker", {
        // local:'ko',
        minDate: new Date().fp_incr(3),
        defaultDate: new Date().fp_incr(3),
        maxDate: new Date().fp_incr(30),
        "disable": [
            function (date) {
                // return true to disable
                return (date.getDay() === 0 || date.getDay() === 6);

            }
        ]
    });

    // 전체선택 체크박스
        $("#checkAll").change(() => {
            //checkAll이 체크된 경우 모두 체크
            if ($("#checkAll").is(":checked")) {
                $("input[name=check]").prop("checked", true);
            }
            // 체크해제된 경우 체크 해제
            else {

                $("input[name=check]").prop("checked", false);
            }
        });

        $("input[name=check]").change(() => {
            let total = $("input[name=check]").length;
            let checked = $("input[name=check]:checked").length;
            // 총 개수와 체크된 개수가 다르면 chkAll 체크 해제
            if (total != checked) $("#checkAll").prop("checked", false);
            // 반대
            else $("#checkAll").prop("checked", true);
        });
    
        // -아이콘? 클릭시 수량 감소
        $(".quantity_minus").click((e) =>{
            let quantity =$(event.target).parents("td").next().children().val();

            if(quantity <= 1) {
                alert('최소수량 1개');
                return;
            };
            quantity = quantity - 1;
            $(event.target).parents("td").next().children("input[type=number]").val(quantity);
        });
        // +아이콘? 클릭시 수량 증가
        $(".quantity_plus").click((e) =>{
            let quantity =(Number)($(event.target).parents("td").prev().children().val());
            quantity = quantity + 1;
            $(event.target).parents("td").prev().children().val(quantity);
            });
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>