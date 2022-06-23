<%@ page import= "java.util.List" %>
<%@ page import= "mypage.model.dto.Destination" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/destination.css">
<% List<Destination> list = (List<Destination>) request.getAttribute("list"); %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.js"></script>

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
        <form action="<%= request.getContextPath() %>/mypage/destination/enroll" method="post" id="shippingAddressInsertFrm">
        <input type="hidden" name="member_id" value="<%= loginMember.getMemberId() %>" />
            <label for="shipping_person">받으실분</label><br>
            <input type="text" name="shipping_person" id="shipping_person"><br>
            <label for="telephone">휴대전화 번호</label><br>
            <input type="text" name="telephone" id="telephone" placeholder="01012341234"><br>
            <label for="zipcode">우편번호</label>
            <div class="zipcode_wrp">
           		<input type="text" name="zipcode" id="zipcode" readonly>
           		<button class="search_zipcode" type="button">우편번호 찾기</button><br>
            </div>
            <label for="address">주소</label><br>
            <input type="text" name="address" id="address"  readonly><br>
            <label for="address_detail">상세주소</label><br>
            <input type="text" name="address_detail" id="address_detail" ><br>
            <div class="submit_wrp">
                <button type="submit" class="submit">등록</button>
            </div>
        </form>
    </div>
    <table>
        <thead>
            <tr>
                <th class="col1">선택</th>
                <th class="col2">받으실분</th>
                <th class="col3">주소</th>
                <th class="col4">연락처</th>
                <th class="col5">삭제</th>
            </tr>
        </thead>
        <tbody>
<%
	if (list != null && !list.isEmpty()) {
		for (Destination destination : list) {
			String checked = "";
			if (destination.getIsDefault().equals("Y")) {
				checked = "checked";
			}
			String telephone = destination.getTelephone().substring(0, 3) + "-" + destination.getTelephone().substring(3, 7)
				+ "-" + destination.getTelephone().substring(7);
				String address = "(" + destination.getZipcode() + ") " + destination.getAddress();
				address += destination.getAddressDetail() != null ? destination.getAddressDetail() : "";
%>
			<tr id= "<%= destination.getShippingAddressNo()%>">
                <td class="col1">
               	 		<input type="radio" name="default" id="<%= destination.getShippingAddressNo()%>" <%= checked %>>
                </td>
                <td class="col2"><%= destination.getShippingPerson() %></td>
                <td class="col3"><%= address %></td>
                <td class="col4"><%= telephone %></td>
                <td class="col5">
                	<i class="fa-regular fa-trash-can isDefaultValue<%=destination.getIsDefault()%>"></i>
                </td>
            </tr>
<%
		}
	} else {
%>
			<tr>
				<td colspan="5">등록된 배송지가 없습니다.</td>
			</tr>
<%       
 	}    
 %>
    	</tbody>
    </table>
</section>
<script>
    const add_destination = document.querySelector('.address_add');
    add_destination.addEventListener('click', function () {
        document.querySelector("#address_section").style.opacity = "100";
        document.querySelector("#address_section").style.zIndex = "1";
    });

    const zipcode = document.querySelector('.search_zipcode');
    zipcode.addEventListener('click', function () {
        new daum.Postcode({
            oncomplete: function (data) {
				if(data.buildingName !== ""){
					document.getElementById("address").value = data.address + ' (' + data.buildingName + ') ';
				}else{
					document.getElementById("address").value = data.address;
				}
                document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("address_detail").focus;
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
    
	const radios = document.querySelectorAll('input[type=radio]');
	radios.forEach(function(radio) {
		radio.addEventListener('click', function () {

			$.ajax({
				type : "POST",
				async : true,
				data : {shippingAddressNo : radio.parentNode.parentNode.id, memberId : "<%= loginMember.getMemberId() %>"},
				url : "<%=request.getContextPath()%>/mypage/destination/defaultUpdate",
				success : function(data){
					location.reload();
				},
				error : function(data){
					alert("요청실패");
				}
			});
		});
	});
	
	//휴지통 아이콘 클릭시 이벤트
	const isDefaultValueNs= document.querySelectorAll('.isDefaultValueN');

	isDefaultValueNs.forEach(function(isDefaultValueN) {
		isDefaultValueN.addEventListener('click', function () {
			$.ajax({
				type : "POST",
				async : true,
				data : {shippingAddressNo : isDefaultValueN.parentNode.parentNode.id, memberId : "<%= loginMember.getMemberId() %>"},
				url : "<%=request.getContextPath()%>/mypage/destination/delFlagUpdate",
				success : function(data){
					location.reload();
				},
				error : function(data){
					alert("요청실패");
				}
			});
		});
	});
	//기본배송지인 아이콘 클릭시 이벤트
	const isDefaultValueY= document.querySelector('.isDefaultValueY');
	isDefaultValueY.addEventListener('click', function () {
			alert('기본 배송지는 삭제할 수 없습니다.')	
		});
	//폼 제출 유효성 검사
	$("form").submit(function(event){		
		if(!/^[가-힣]{2,}$/.test(shipping_person.value)){
			alert("이름은 한글 2글자이상 입력해주세요.");
			return false;
		}
		if(!(/^01([0|1|6|7|8|9])([0-9]{8})$/.test(telephone.value))){
			alert("휴대전화 번호가 올바르지 않습니다.");
			return false;
		}
		if(!/^[0-9]{5}$/.test($('#zipcode').val())){
			alert("주소를 입력해주세요.1");
			return false;
		}			
	});
	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>