/**
 * 1. 작업자 이름 주석 범위 내에 작성하기
 * 2. 코드 추가하기전에 동일한 이름의 폼에 대한 유효성검사 코드 있는지 체크하기
 */

/*------------------- 김은주 start -------------------*/
/*-------------------- 김은주 end --------------------*/

/*------------------- 김지은 start -------------------*/
/*-------------------- 김지은 end --------------------*/

/*------------------- 박수진 start -------------------*/
/*-------------------- 박수진 end --------------------*/

/*------------------- 유혜리 start -------------------*/
/*-------------------- 유혜리 end --------------------*/

/*------------------- 이은지 start -------------------*/
const printErrSpan = (target, msg) => {
    const msgSpan = document.querySelector(target).parentElement.lastElementChild;
    msgSpan.innerHTML = msg;
};

const resetMsg = (target) => {
    const msgSpan = document.querySelector(target).parentElement.lastElementChild;
    msgSpan.innerHTML = "";
};

const resetElemetMsg = (target) => {
	const msgSpan = target.parentElement.lastElementChild;
	msgSpan.innerHTML = "";
}

// 메뉴 등록 유효성검사
if(document.menuEnrollFrm != null) {
	document.menuEnrollFrm.onsubmit = () => {
		let result = true;
		if(!/^[a-zA-Z0-9_]{4,30}$/.test(menuId.value)){
			printErrSpan("#menuId", "아이디는 영문자/숫자로 4글자 이상 30자 이하여야하며, 특수문자는 _ 만 사용가능합니다.");
			result = false;
		} else if (checkIdDuplicate() != false){
			resetMsg("#menuId");
		}
		
		if(!/^[a-zA-Z가-힣0-9].{0,90}[^ \t\n]$/.test(menuName.value)){
			printErrSpan("#menuName", "적절한 이름이 아닙니다.");
			result = false;
		} else resetMsg("#menuName");
		
		if(!calorie.value) {
			printErrSpan("#calorie", "열량을 입력해주세요.");
			result = false;
		} else if(!/^[0-9]{1,4}$/.test(calorie.value)){
			printErrSpan("#calorie", "입력 가능한 범위는 0이상 10000미만입니다.");
			result = false;
		} else resetMsg("#calorie");
		
		// const menuAttach = document.querySelector("#menuAttach");
		if(menuAttach.files.length == 0) {
			printErrSpan("#menuAttach", "메뉴 이미지를 추가해주세요.");
		} else resetMsg("#menuAttach");
		
		if(/[\n\t]/g.test(ingredients.value)){
			printErrSpan(".ingredients-wrapper", "개행은 입력할 수 없습니다.");
			result = false;
		} else if (!/^.{1,800}$/.test(ingredients.value)) {
			printErrSpan(".ingredients-wrapper", "적절한 길이로 입력해주세요.");
			result = false;
		} else if(!/^[a-zA-Z가-힣0-9, ()]{1,800}$/.test(ingredients.value)) {
			printErrSpan(".ingredients-wrapper", "입력 불가능한 문자가 포함되어있습니다. *특수문자는 ,(콤마)와 소괄호만 가능");
			result = false;
		} else resetMsg(".ingredients-wrapper");
	
		if(menuDescription.value == ""){
			printErrSpan(".description-wrapper", "내용을 입력해주세요.");
			result = false;
		} else if (!/^(.|[\t\n]){0,1000}$/.test(menuDescription.value)) {
			printErrSpan(".description-wrapper", "입력 가능한 길이를 초과하였습니다.");
			result = false;
		} else resetMsg(".description-wrapper");
		
		return result;
	};
}

// 메뉴 수정 유효성검사
if(document.menuUpdateFrm != null) {
	document.menuUpdateFrm.onsubmit = () => {
		let result = true;
		
		if(!/^[a-zA-Z가-힣0-9].{0,90}[^ \t\n]$/.test(menuName.value)){
			printErrSpan("#menuName", "적절한 이름이 아닙니다.");
			result = false;
		} else resetMsg("#menuName");
		
		if(!calorie.value) {
			printErrSpan("#calorie", "열량을 입력해주세요.");
			result = false;
		} else if(!/^[0-9]{1,4}$/.test(calorie.value)){
			printErrSpan("#calorie", "입력 가능한 범위는 0이상 10000미만입니다.");
			result = false;
		} else resetMsg("#calorie");
		
		if(/[\n\t]/g.test(ingredients.value)){
			printErrSpan(".ingredients-wrapper", "개행은 입력할 수 없습니다.");
			result = false;
		} else if (!/^.{1,800}$/.test(ingredients.value)) {
			printErrSpan(".ingredients-wrapper", "적절한 길이로 입력해주세요.");
			result = false;
		} else if(!/^[a-zA-Z가-힣0-9, ()]{1,800}$/.test(ingredients.value)) {
			printErrSpan(".ingredients-wrapper", "입력 불가능한 문자가 포함되어있습니다. *특수문자는 ,(콤마)와 소괄호만 가능");
			result = false;
		} else resetMsg(".ingredients-wrapper");
	
		if(menuDescription.value == ""){
			printErrSpan(".description-wrapper", "내용을 입력해주세요.");
			result = false;
		} else if (!/^(.|[\t\n]){0,1000}$/.test(menuDescription.value)) {
			printErrSpan(".description-wrapper", "입력 가능한 길이를 초과하였습니다.");
			result = false;
		} else resetMsg(".description-wrapper");
		
		return result;
	};
}

if(document.productEnrollFrm != null) {
	document.productEnrollFrm.onsubmit = () => {
		let result = true;
		if(!/^[a-zA-Z0-9_]{4,30}$/.test(productId.value)){
			printErrSpan("#productId", "아이디는 영문자/숫자로 4글자 이상 30자 이하여야하며, 특수문자는 _ 만 사용가능합니다.");
			result = false;
		} else if (checkIdDuplicate() != false){
			resetMsg("#productId");
		}
		
		if(productName.value == "" || productName.value.charAt(0) == " "){
			printErrSpan("#productName", "공백으로 시작할 수 없습니다.");
			result = false;
		} else if(!/^.{1,80}$/.test(productName.value)){
			printErrSpan("#productName", "80자 이내로 입력해주세요.");
			result = false;
		} else resetMsg("#productName");

		if(productPrice.value < 0) {
			printErrSpan("#productPrice", "음수는 입력할 수 없습니다.");
			result = false;
		} else resetMsg("#productPrice");

		if(thumbnail.files.length == 0) {
			printErrSpan("#thumbnail", "메뉴 이미지를 추가해주세요.");
			result = false;
		} else resetMsg("#thumbnail");

		if(detailimg1.files.length == 0) {
			printErrSpan("#detailimg1", "상세 이미지를 추가해주세요.")
			result = false;
		} else resetMsg("#detailimg1");

		const checkedMenu = document.querySelectorAll("[name=menuNo]:checked");
		if(checkedMenu.length == 0) {
			document.querySelector(".menuList-wrapper .inputErrMsg").innerHTML = "구성메뉴를 선택해주세요";
			result = false;
		} else {
			document.querySelector(".menuList-wrapper .inputErrMsg").innerHTML = "";
		}

		return result;
	}
}
/*-------------------- 이은지 end --------------------*/