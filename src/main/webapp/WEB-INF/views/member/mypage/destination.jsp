<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/destination.css">


		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section id="destination">
    <div class="heading">
        <h1>배송지 목록</h1>
        <p class="address_add">새 배송지 추가 &nbsp;<i class="fa-solid fa-pen-to-square"></i></p>
    </div>
    <div id="address_section">
        <div class="sub_heading">
            <h1>새 배송지 추가</h1>
            <i class="fa-solid fa-xmark"></i>
        </div>
        <form action="">
            <label for="shipping_person">받으실분</label><br>
            <input type="text" name="shipping_person" id="shipping_person"><br>
            <label for="telephone">연락처</label><br>
            <input type="text" name="telephone" id="telephone"><br>
            <label for="zipcode">우편번호</label>
            <div class="zipcode_wrp">
                <input type="text" name="zipcode" id="zipcode" disabled>
                <button class="search_zipcode" type="button">우편번호 찾기</button><br>
            </div>
            <label for="address">주소</label><br>
            <input type="text" name="address" id="address" disabled><br>
            <label for="address_detail">상세주소</label><br>
            <input type="text" name="address_detail" id="address_detail"><br>
            <div class="submit_wrp">
                <button type="submit" class="submit">등록</button>
            </div>
        </form>
    </div>
    <table>
        <thead>
            <tr>
                <th class="col1">선택</td>
                <th class="col2">받으실분</th>
                <th class="col3">주소</th>
                <th class="col4">연락처</th>
                <th class="col5">삭제</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
                <td class="col5"><i class="fa-regular fa-trash-can"></i></td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
                <td class="col5"><i class="fa-regular fa-trash-can"></i></td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
                <td class="col5"><i class="fa-regular fa-trash-can"></i></td>
            </tr>
            <tr>
                <td class="col1"><input type="radio" name="default" id="default"></td>
                <td class="col2">홍길동</td>
                <td class="col3">(11111)서울특별시 종로구 필운대로5가길 47(누상동, 창원예가) 111-101</td>
                <td class="col4">010-1111-1111</td>
                <td class="col5"><i class="fa-regular fa-trash-can"></i></td>
            </tr>

        </tbody>

    </table>
</section>

<script>
    const add_destination = document.querySelector('.address_add');
    console.log(add_destination);
    add_destination.addEventListener('click', function () {

        document.querySelector("#address_section").style.opacity = "100";
        document.querySelector("#address_section").style.zIndex = "1";

    });

    const zipcode = document.querySelector('.search_zipcode');
    console.log(zipcode);
    zipcode.addEventListener('click', function () {

        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("address").value = data.address;
                document.getElementById("zipcode").value = data.zonecode;
            }
        }).open();

    });

    const cancel = document.querySelector('i.fa-xmark');
    cancel.addEventListener('click', function () {
        document.getElementById("shipping_person").value = "";
        document.getElementById("telephone").value = "";
        document.getElementById("zipcode").value = "";
        document.getElementById("address").value = "";
        document.getElementById("address_detail").value = "";
        document.querySelector("#address_section").style.opacity = "0";
        document.querySelector("#address_section").style.zIndex = "-1";

    });
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>