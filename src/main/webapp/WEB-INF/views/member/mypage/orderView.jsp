<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/orderView.css" />
	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>

     <link rel="stylesheet" href="order_view.css" />
<section id="order_view">
    <h1>주문내역 상세</h1>
    <article class="order_prduct">
        <div class="heading_wrp">
            <h2>주문번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;000015212564</h2>
            <div>배송 또는 상품에 문제가 있나요? <a href="배송조회">1:1문의하기</a></div>
        </div>
        <table class="order_product_tbl">
            <tr class="row_odd">
                <td rowspan="2" class="r1">
                    <img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="prd_img">
                </td>
                <td class="r2_1">베이비 식단<span>1일 2식 2주(월~금, 20회)</span></td>

                <td rowspan="2" class="r4"><button>장바구니 담기</button></td>
            </tr>
            <tr class="row_even">
                <td class="r2_2">100,000원 | 1개 | 2022-06-18~</td>
            </tr>
            <tr>
                <td rowspan="2" class="r1">
                    <img src="<%= request.getContextPath() %>/images/food_sample.jpg" alt="" class="prd_img">
                </td>
                <td class="r2_1">베이비 식단<span>1일 2식 2주(월~금, 20회)</span></td>

                <td rowspan="2" class="r4"><button>장바구니 담기</button></td>
            </tr>
            <tr>
                <td class="r2_2">100,000원 | 1개 | 2022-06-18~</td>
            </tr>
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
                <td>홍길동</td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td>010-1111-1111</td>
            </tr>
            <tr>
                <th>주소</th>
                <td>(111111)경기도 양주시 Lorem ipsum, dolor sit amet consectetur adipisicing elit. </td>
            </tr>
            <tr>
                <th>배송 요청사항</th>
                <td>집앞에 두고 가시면 됩니다~!</td>
            </tr>

        </table>
    </article>
    <h2>주문정보</h2>
    <article class="order_info">
        <table>
            <tr>
                <th>주문번호</th>
                <td> 000015212564</td>
            </tr>
            <tr>
                <th>주문자명</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th>주문자 휴대폰번호</th>
                <td>010-1111-1111</td>
            </tr>
        </table>
    </article>
    <article class="pay_info">
        <h2>결제정보</h2>
        <article>
            <table>
                <tr>
                    <th>결제금액</th>
                    <td>200,000원</td>
                </tr>
                <tr>
                    <th>결제방법</th>
                    <td>신용카드</td>
                </tr>
                <tr>
                    <th>결제일시</th>
                    <td>2022-06-11 16:29:25</td>
                </tr>
            </table>
        </article>
    </article>
</section>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>