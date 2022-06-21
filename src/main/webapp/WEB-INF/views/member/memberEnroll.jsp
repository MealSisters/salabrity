<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<style>
#step2 {
	color: #116916;
	font-weight: bold;
}


</style>
<div class="join_main_head">
	<h3>정보입력</h3>
	<ul>
		<li class="step" id="step1"><span>01 약관동의&nbsp;>&nbsp;</span></li>
		<li class="step" id="step2"><span>02 정보입력&nbsp;>&nbsp;</span></li>
		<li class="step" id="step3"><span>03 가입완료</span></li>
	</ul>
</div>
<div class="join_box" style="border-top: 1px solid #dbdbdb;">
	<div class="join_main_box" style="border-bottom: 1px solid black;">
		
		<h4 class="use_agree">회원 정보 입력&nbsp;
		<span style="font-size:12px; font-weight: normal;"><span class="point">*</span>&nbsp;표시는 필수 입력 항목입니다.</span></h4>
		
		<form name="memberEnrollFrm" method="POST" action="<%= request.getContextPath() %>/member/memberEnroll">
		<div class="member_box">
			<div class="input_box">
				<label class="member_title">아이디&nbsp;<span class="point">*</span></label>
				<input type="text" name="memberId" id="memberId" class="input_text">
				<button type="button" class="checkId" onclick="checkIdDuplicate();">중복확인</button>
				<input type="hidden" id="idValid" value="0" />
				<span class="guide">* 6자리 이상의 영문자, 숫자를 조합하여 입력해 주세요</span>
			</div>
			<div class="input_box">
				<label class="member_title">비밀번호&nbsp;<span class="point">*</span></label> 
				<input type="password" name="password" id="password" class="input_text"> <span
					class="guide">* 8자리 이상의 숫자, 영문자, 특수문자를 조합하여 입력해주세요.</span>
			</div>
			
			  
			<div class="input_box">
				<label class="member_title">비밀번호 확인&nbsp;<span class="point">*</span></label> 
				<input type="password" id="checkPassword" class="input_text">
			</div>
			
			
			<div class="input_box">
				<label class="member_title">이름&nbsp;<span class="point">*</span></label> <input type="text"
					name="memberName" id="memberName" class="input_text">

			</div>

			<div class="input_box">
				<label class="member_title">이메일&nbsp;<span class="point">*</span></label> 
				<input type="text" name="email1" id="email1" class="input__text"> 
				  	<span style="font-size: 12px;">@</span>
				<input type="text" name="email2" class="input__text" id="inputDomain">
				<div class="email_select">
					<select name="email3" id="email3">
						<option value="1">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
					<input type="hidden" name="email" id="email"/>
				</div>
				
				
				<span class="guide"> <input type="checkbox" name="" id=""
					class="info_ck"> 다양한 할인 혜택과 이벤트 정보 메일 수신에 동의합니다.
				</span>
			</div>

			<div class="input_box">
				<label class="member_title">휴대폰 번호&nbsp;<span class="point">*</span></label> 
				<input type="text" name="phone1" id="phone1" maxlength="3" class="input_text" value="010">
				<span style="font-size: 12px;">-</span>
				<input type="text" name="phone2" id="phone2" maxlength="4" class="input_text">
				<span style="font-size: 12px;">-</span>
				<input type="text" name="phone3" id="phone3" maxlength="4" class="input_text">
				<input type="hidden" name="phone" id="phone" maxlength="11" class="input_text">
					<span class="guide"> <input type="checkbox" name="" id=""
						class="info_ck"> 다양한 할인 혜택과 이벤트 정보 메일 수신에 동의합니다.
					</span>
			</div>

			<div class="input_box">
				<label class="member_title">주소&nbsp;<span class="point">*</span></label> 
				<input type="text" name="zipcode" id="zipcode" class="input__text" readOnly>
								
				 <button type="button" class="btn_address" onclick="sample4_execDaumPostcode()">우편번호 검색</button>
				 
				<input type="text" name="address" id="address" class="input_text" readOnly>
				<input type="text" name="addressDetail" id="addressDetail" class="input_text" placeholder="상세주소를 입력해주세요.">
			</div>
				
				
				
			<div class="input_box">
				<label class="member_title">생년월일</label> <input type="date"
					name="birthday" id="birthday" class="input_text">
			</div>
			<div class="input_box">
				<p class="member_title">성별</p>
				<div class="gender_cb">
					<input type="radio" id="male" name="gender" class="gender_ck"
						value="M"> <label for="male" class="checkbox_label">남성</label>
					<input type="radio" id="female" name="gender" class="gender_ck"
						value="F"> <label for="female" class="checkbox_label">여성</label>
				</div>
			</div>
				
		</div>
	</div>
	<div class="btn_box">
		<button type="button" id="btn_cancle"
			onclick="location.href='<%= request.getContextPath() %>';">취소</button>
		<button type="submit" id="btn_join">회원가입</button>
	</div>
	</form>
</div>
<form name="checkIdDuplicateFrm" action="<%= request.getContextPath() %>/member/checkIdDuplicate">
	<input type="hidden" name="memberId" />
</form>
<script>
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

// 회원가입폼 유효성 검사
const checkIdDuplicate = () => {
	
	const id = document.getElementById("memberId");
	if(id.value.length == 0) {
		alert("아이디를 입력해주세요.");
		return false;
	} 
	if(!/[A-Za-z0-9]{6,}$/.test(memberId.value)){
		alert("아이디는 대소문자/숫자를 조합하여 6글자 이상이어야 합니다.");
		return false;
	}
	const title = "checkIdDuplicatePopup";
	const spec = "width=460px, height=300px";
	const popup = open("", title, spec);
	
	const frm = document.checkIdDuplicateFrm;
	frm.target = title;
	frm.memberId.value = memberId.value;
	frm.submit();
	return true;
	
};

checkPassword.onblur = () => {
	if(password.value !== checkPassword.value){
		alert("비밀번호가 일치하지 않습니다.");
		password.select();
		return false;
	}	
	return true;
};
	
document.memberEnrollFrm.onsubmit = () => {
	// ID는 6자리 이상의 영문 혹은 숫자
	if(!/^[A-Za-z0-9]{6,}/.test(memberId.value)){
		alert("아이디는 대소문자/숫자를 조합하여 6글자 이상이어야 합니다.");
		return false;
	}
	// 중복검사여부 체크
	if(idValid.value !== "1") {
		alert("아이디 중복검사는 필수 항목입니다.");
		return false;
	}
	
	// pw는 대소문자, 숫자, 특수문자를 모두 포함하여 10자리 이상 입력해주세요.
	if(!/^(?=.*?[A-za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(password.value)){
		alert("비밀번호는 숫자/대문자/소문자/특수문자를 조합하여 8글자 이상이어야 합니다.");
		return false;
	}
	if(!checkPassword.onblur()){
		return false;
	}

	// 이름
	if(!/^[가-힣]{2,}$/.test(memberName.value)){
		alert("이름은 2글자 이상이어야 합니다.");
		return false;
	}
	
	// phone
	if(!/^[0-9]{3}$/.test(phone1.value)){
		alert("유효하지 않은 전화번호입니다.");
		return false;
	}
	
	if(!/^[0-9]{3,4}$/.test(phone2.value)){
		alert("유효하지 않은 전화번호입니다.");
		return false;
	}

	if(!/^[0-9]{4}$/.test(phone3.value)){
		alert("유효하지 않은 전화번호입니다.");
		return false;
	}
	
	// 이메일 
	if(!/[A-Za-z0-9]{1,}/.test(email1.value)){
		alert("이메일을 다시 입력해주세요.");
		return false;
	}
	
	if(!/[A-Za-z]{1,}/.test(inputDomain.value)){
		alert("이메일을 다시 입력해주세요.");
		return false;
	}
	
	// 주소
	if(!/^[0-9]{5}$/.test(zipcode.value)){
		alert("주소를 입력해주세요.");
		return false;
	}
	

}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>