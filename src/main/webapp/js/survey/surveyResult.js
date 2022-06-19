/**
 * 
 */

const select = [0, 0, 0, 0];

// 식단결과계산(선택)
function calResult(){
	console.log(select);
	var result = select.indexOf();
	return result;
}

// 식단결과출력
function setResult(){
	
	// 식단명
	let point = calResult();
	const resultName = document.querySelector('.resultname');
	resultName.innerHTML = productList[point].name;
	
	
	// 식단이미지
	var resultImg = document.createElement('img');
	const imgDiv = document.querySelector('#resultImg');
	var imgURL = 'img/image-' + point + '.png';
	resultImg.src = imgURL;
	resultImg.alt = point;
	resultImg.classList.add('img-fluid');
	imgDiv.appendChild(resultImg);

	// 식단설명
	const resultDesc = document.querySelector('.resultDesc');
	resultDesc.innerHTML = productList[point].desc;
}


/** 식단list
const productList = [
  {
    name: '일반식단',
	desc: '식단설명'
  },
  {
    name: '체중조절식단',
	desc: '식단설명'
  },
  {
    name: '저당식단',
	desc: '식단설명'
  },
  {
    name: '베이비식단',
	desc: '식단설명'
  },
]
*/