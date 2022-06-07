<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminResultSetList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/ListSearchFilter.css">
<div class="div-level1" id="div-firstView">
    <p id="filter-wrapper-title">Filter</p>
    <div id="filter-wrapper" class="div-level2">
        <form name="orderFilterFrm" action="" onSubmit="return false;">
            <div class="div-searchFilter">
                <label for="filter-orderNo">주문번호</label>
                <input type="text" name="orderNo" id="filter-orderNo">
            </div>
            <div class="div-searchFilter">
                <label for="filter-memberId">아이디</label>
                <input type="text" name="memberId" id="filter-memberId">
            </div>
            <div class="div-searchFilter">
                <label for="filter-orderDate-start">주문일</label>
                <input type="date" name="orderDateStart" id="filter-orderDate-start" class="periodStart">
                <span class="periodSeparator">~</span>
                <input type="date" name="orderDateEnd" id="filter-orderDate-end" class="periodEnd">
            </div>
            <div class="div-searchFilter">
                <label for="filter-shippingStatus">배송상태</label>
                <select name="shippingState" class="filter-select">
                    <option value="전체" selected>전체보기</option>
                    <option value="입금확인중">입금확인중</option>
                    <option value="결제완료">결제완료</option>
                    <option value="상품준비중">상품준비중</option>
                    <option value="배송준비중">배송준비중</option>
                    <option value="배송중">배송중</option>
                    <option value="배송완료">배송완료</option>
                    <option value="구매확정">구매확정</option>
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
                    <th class="col-shippingStatus">배송상태</th>
                    <th class="col-price">결제금액</th>
                    <th class="col-shippingAddr">배송지</th>
                    <th class="col-products">주문상품</th>
                    <th class="col-orderReq">요청사항</th>
                    <th class="col-buttons">수정/주문취소</th>
                </tr>
            </thead>
            <tbody>
                <!-- (tr>td.col-no{$}+td.col-orderNo{000$}+td.col-memberId+td.col-orderDate+td.col-shippingStatus+td.col-price+td.col-shippingAddr.td-xscroll+td.col-products.td-xscroll+td.col-orderReq.td-xscroll+td.col-buttons) -->
                <tr>
                    <td class="col-no">1</td>
                    <td class="col-orderNo">0001</td>
                    <td class="col-memberId">honggd1234</td>
                    <td class="col-orderDate">2022-05-27</td>
                    <td class="col-shippingStatus">입금확인중</td>
                    <td class="col-price">135,800</td>
                    <td class="col-shippingAddr td-xscroll">서울특별시 강남구 청담동 어쩔로 저쩔길 티비아파트 1234번 1234 어쩌고저쩌고 11111 2222</td>
                    <td class="col-products td-xscroll">단백질듬뿍 다이어터 4주</td>
                    <td class="col-orderReq td-xscroll">싱싱한걸로 주세요-_-</td>
                    <td class="col-buttons">
                        <div class="div-modify"><a class="a-modify">수정</a></div>
                        <div class="div-cancel"><a class="a-cancel">주문취소</a></div>
                    </td>
                </tr>
                <tr>
                    <td class="col-no">2</td>
                    <td class="col-orderNo">0002</td>
                    <td class="col-memberId"></td>
                    <td class="col-orderDate"></td>
                    <td class="col-shippingStatus"></td>
                    <td class="col-price"></td>
                    <td class="col-shippingAddr td-xscroll"></td>
                    <td class="col-products td-xscroll"></td>
                    <td class="col-orderReq td-xscroll"></td>
                    <td class="col-buttons"></td>
                </tr>
                <tr>
                    <td class="col-no">3</td>
                    <td class="col-orderNo">0003</td>
                    <td class="col-memberId"></td>
                    <td class="col-orderDate"></td>
                    <td class="col-shippingStatus"></td>
                    <td class="col-price"></td>
                    <td class="col-shippingAddr td-xscroll"></td>
                    <td class="col-products td-xscroll"></td>
                    <td class="col-orderReq td-xscroll"></td>
                    <td class="col-buttons"></td>
                </tr>
                <tr>
                    <td class="col-no">4</td>
                </tr>
                <tr>
                    <td class="col-no">5</td>
                </tr>
                <tr>
                    <td class="col-no">6</td>
                </tr>
                <tr>
                    <td class="col-no">7</td>
                </tr>
                <tr>
                    <td class="col-no">8</td>
                </tr>
                <tr>
                    <td class="col-no">9</td>
                </tr>
                <tr>
                    <td class="col-no">10</td>
                </tr>
            </tbody>
        </table>
    </div>

    <%@ include file="/WEB-INF/views/common/pagebar.jsp" %>
</div>

<div class="div-level1 div-hidden" id="div-secondView">
    <div class="orderModifyFrm-wrapper">
        <form action="" name="orderModifyFrm" id="orderModifyFrm">
            <p>주문수정</p>
            <div class="div-orderNoModify">
                <label>주문번호</label>
                <input type="hidden" name="orderNo">
                <span>0001</span>
            </div>
            <div class="div-memberIdModify">
                <label>회원아이디</label>
                <input type="hidden" name="memberId">
                <span>honggd1234</span>
            </div>
            <div class="div-shippingStatusModify">
                <label for="shippingStatusModify">배송상태</label>
                <select name="shippingState" class="shippingStatusModify-select" data-member-id="">
                    <option value="입금확인중" selected>입금확인중</option>
                    <option value="결제완료">결제완료</option>
                    <option value="상품준비중">상품준비중</option>
                    <option value="배송준비중">배송준비중</option>
                    <option value="배송중">배송중</option>
                    <option value="배송완료">배송완료</option>
                    <option value="구매확정">구매확정</option>
                </select>
            </div>
            <div class="div-shippingAddrModify">
                <label>배송지</label>
                <div class="shippingAddrList-wrapper">
                    <p class="shippingArreList">
                        <input type="radio" name="shippingAddrNo" data-member-id="" data-shipping-addr-no="" value=""><span>제주특별자치도 애월읍 하르방로 귤귤길 맛있다빌라 201호</span>
                    </p>
                    <p class="shippingArreList">
                        <input type="radio" name="shippingAddrNo" data-member-id="" data-shipping-addr-no="" value=""><span>서울특별시 마포구 멋쟁이로 힙스터길 1234-56</span>
                    </p>
                    <p class="shippingArreList">
                        <input type="radio" name="shippingAddrNo" data-member-id="" data-shipping-addr-no="" value=""><span>서울특별시 마포구 멋쟁이로 힙스터길 1234-56</span>
                    </p>
                    <p class="shippingArreList">
                        <input type="radio" name="shippingAddrNo" data-member-id="" data-shipping-addr-no="" value=""><span>서울특별시 마포구 멋쟁이로 힙스터길 1234-56</span>
                    </p>
                </div>
            </div>
            <div class="div-orderModifyFrmButtons">
                <div>
                    <button type="button" id="btn-submitCancel">취소</button>
                </div>
                <div>
                    <button id="btn-submitOrderModifyFrm">수정</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    window.addEventListener('load', () => {
        openModifyFrm();
        addModifyFrmBtnEvent();
    });

    // 각 행의 수정버튼에 이벤트 추가
    const openModifyFrm = () => {
        const links = document.querySelectorAll(".a-modify");
        links.forEach((link) => {
            link.addEventListener('click', () => {
                const hiddenTarget = document.getElementById("div-firstView");
                const visibleTarget = document.getElementById("div-secondView");

                hiddenTarget.classList.add('div-opacityLow');
                visibleTarget.classList.remove('div-hidden');
            });
        });
    }
    // 수정폼 내의 버튼에 이벤트 추가
    const addModifyFrmBtnEvent = () => {
        const cancelBtn = document.querySelector("#btn-submitCancel");
        cancelBtn.addEventListener('click', () => {
            const hiddenTarget = document.getElementById("div-secondView");
            const visibleTarget = document.getElementById("div-firstView");

            hiddenTarget.classList.add('div-hidden');
            visibleTarget.classList.remove('div-opacityLow');
        });
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
