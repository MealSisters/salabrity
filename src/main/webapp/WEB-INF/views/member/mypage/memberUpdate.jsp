<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/member.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<script>
window.onload = () => {
	<% if(msg != null) { %>
	alert("<%= msg %>");
	<% } %>
}
</script>
<style>

#address1 {
	width : 135px;
}

#address1, #address2 {
	margin-bottom: 15px;
}
#address2, #address3 {
	margin-left: 135px;
}

</style>
<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
	<div class="my_sub_content">
		<h4 class="mypage_hd">회원 정보 변경&nbsp;
		<span style="font-size:12px; font-weight: normal;"><span class="point">*</span>&nbsp;표시는 변경하실 수 없습니다.</span></h4>
		<div class="update_content">

<form name="memberUpdateFrm" method="POST" action="<%= request.getContextPath() %>/mypage/memberUpdate">
			<div class="update_cont_box">
				<div class="input_box">
					<label class="member_title">아이디&nbsp;<span class="point">*</span></label> <input type="text"
						name="memberId" id="memberId" value="<%= loginMember.getMemberId() %>" readOnly class="input__text">
				</div>

				<div class="input_box">
					<label class="member_title">비밀번호</label> 
					<button type="button" class="btn_password" onclick="location.href='<%= request.getContextPath() %>/mypage/pwdUpdate';">비밀번호 변경</button>
					</div>

				<div class="input_box">
					<label class="member_title">이름&nbsp;<span class="point">*</span></label> <input type="text"
						name="memberName" id="memberName" value="<%= loginMember.getMemberName() %>" readOnly class="input__text">
				</div>

				<div class="input_box">
				<label class="member_title">이메일</label> 
				
					<input type="text" name="email" id="email" value="<%= loginMember.getEmail() %>" class="input__text"/>
				</div>
					
				
				<div class="input_box">
				<label class="member_title">휴대폰 번호</label> 
			
				<input type="text" name="phone" id="phone" maxlength="11" value="<%= loginMember.getPhone() %>" class="input_text">
					</div>
					
				<div class="input_box">
				<label class="member_title">주소</label> 
				<input type="text" name="zipcode" id="zipcode" class="input__text" value="<%= loginMember.getZipcode() %>" readOnly>
				 <button type="button" class="btn_address" onclick="sample4_execDaumPostcode()">우편번호 검색</button>
				<input type="text" name="address" id="address" value="<%= loginMember.getAddress() %>" class="input__text" readOnly>
				<input type="text" name="addressDetail" id="addressDetail" class="input__text" placeholder="상세주소를 입력해주세요." value="<%= loginMember.getAddressDetail() != null ? loginMember.getAddressDetail() : "" %>">
			</div>

				<div class="input_box">
				<label class="member_title">생년월일</label> <input type="date"
					name="birthday" id="birthday" value="<%= loginMember.getBirthday() %>" class="input_text">
			</div>
				
				<div class="input_box">
					<p class="member_title">성별</p>
					<div class="gender_cb">
						<input type="radio" id="male" name="gender" class="gender_ck"
							value="M" <%= "M".equals(loginMember.getGender()) ? "checked" : "" %>> <label for="male" class="checkbox_label">남성</label>
						<input type="radio" id="female" name="gender" class="gender_ck"
							value="F" <%= "F".equals(loginMember.getGender()) ? "checked" : "" %>> <label for="female" class="checkbox_label">여성</label>
					</div>
				</div>
			</div>
			<div class="btn_update_box">
				<button type="button" id="btn_update_can" onclick="location.href='<%= request.getContextPath() %>';">취소</button>
				<button type="submit" id="btn_update">수정하기</button>
			</div>
</form>
		</div>
		</div>
		</div>
		
		
<script>
// 수정 유효성 검사
document.memberUpdateFrm.onsubmit = () => {
	
	// 이메일
	if(/^[0-9A-Z]([-_\.]?[0-9A-Z])*@[0-9A-Z]([-_\.]?[0-9A-Z])*\.[A-Z]{2,6}$/.test(email.value)){
		alert("이메일을 확인해주세요.");
		return false;
	}
	
	// phone
	if(!/^[0-9]{9,}$/.test(phone.value)){
		alert("유효하지 않은 전화번호입니다.");
		console.log("[" + phone.value + "]");
		return false;
	}
	
	// 주소
	if(!/^[0-9]{5}$/.test(zipcode.value)){
		alert("주소를 입력해주세요.");
		return false;
	}
	
}

$(function(){		
	$(document).ready(function(){		
		$('select[name=email3]').change(function() {			
			if($(this).val()=="1"){				
				$('#inputDomain').val("");	                      
				 $("#inputDomain").attr("readonly",false);
				} else {				
					$('#inputDomain').val($(this).val());				
					$("#inputDomain").attr("readonly", true);			
					}		
			});	
		});
});

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
           
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = roadAddr;
            
        }
    }).open();
}


</script>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>