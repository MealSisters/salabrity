<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%-- 대문이미지 --%>
		<div id="main-slider-wrap">
	        <ul id="main-slider">
	            <li>
	                <img src="<%= request.getContextPath() %>/images/main-banner1.png">
	            </li>
	    
	            <li>
	                <img src="<%= request.getContextPath() %>/images/main-banner2.png">
	            </li>
	    
	            <li>
	                <img src="<%= request.getContextPath() %>/images/main-banner3.png">
	            </li>
	        </ul>
	        <div class="main-slider-btns" id="next"><span>▶</span></div>
	        <div class="main-slider-btns" id="previous"><span>◀</span></div>
	        <div id="main-slider-pagination-wrap">
	            <ul></ul>
	        </div>
	    </div>
		<%-- 인기상품 --%>
		<div id="main-product-wrap">
			<table class="tbl-main-product">
				<thead>
					<tr>
						<th class="main-title" colspan="8">인기상품</th>
					</tr>
					<tr>
						<td class="main-sub-title" colspan="8">샐러브리티에서 가장 잘 판매되는 상품이에요.</td>
					</tr>
				</thead>
				<tbody>
					<tr class="main-product-img">
						<td colspan="2">
							<div>
								<a href="#">
									<img src="#" alt="인기상품1" />
								</a>
							</div>
						</td>
						<td colspan="2">
							<div>
								<a href="#">
									<img src="#" alt="인기상품2" />
								</a>
							</div>
						</td>
						<td colspan="2">
							<div>
								<a href="#">
									<img src="#" alt="인기상품3" />
								</a>
							</div>
						</td>
						<td colspan="2">
							<div>
								<a href="#">
									<img src="#" alt="인기상품4" />
								</a>
							</div>
						</td>
					</tr>
					<tr class="main-product-name">
						<td colspan="2">체중조절 식단</td>
						<td colspan="2">든든한 한끼 식단</td>
						<td colspan="2">당뇨케어 식단</td>
						<td colspan="2">베이비 식단</td>
					</tr>
					<tr>
						<td colspan="2">1일 2식 2주(월~금, 20회)</td>
						<td colspan="2">1일 2식 2주(월~금, 20회)</td>
						<td colspan="2">1일 2식 2주(월~금, 20회)</td>
						<td colspan="2">1일 2식 2주(월~금, 20회)</td>
					</tr>
					<tr class="main-product-price">
						<td>140,000원</td>
						<td>
							<a href="#">
								<i class="fa-solid fa-cart-plus"></i>
							</a>
						</td>
						<td>170,000원</td>
						<td>
							<a href="#">
								<i class="fa-solid fa-cart-plus"></i>
							</a>
						</td>
						<td>240,000원</td>
						<td>
							<a href="#">
								<i class="fa-solid fa-cart-plus"></i>
							</a>
						</td>
						<td>104,000원</td>
						<td>
							<a href="#">
								<i class="fa-solid fa-cart-plus"></i>
							</a>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="main-product-btn">
								<a href="<%= request.getContextPath() %>/calendar">샐브의 식단 보기</a>
							</div>
						</td>
 					</tr>
				</tfoot>
			</table>
		</div>
		<hr />
		<%-- 맞춤식단찾기 --%>
		<div id="main-service-wrap">
			<table class="tbl-main-service">
				<thead>
					<tr>
						<th class="main-title" colspan="2">맞춤식단찾기</th>
					</tr>
					<tr>
						<td class="main-sub-title" colspan="2">샐러브리티에서 맞춤식단을 추천드려요.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="main-service-msg1" class="main-service-msg">간단한 설문에 응해주시면</td>
						<td class="main-service-img" rowspan="3">
							<a href="<%= request.getContextPath() %>/survey/surveyCustom">
								<img src="http://physicalsolutionsli.com/wp-content/uploads/2019/10/DASH-diet-1024x689.jpg" alt="맞춤식단찾기" />
							</a>
						</td>
					</tr>
					<tr>
						<td id="main-service-msg2" class="main-service-msg">빠르게 원하는 식단을 찾아드려요.</td>
					</tr>
					<tr>
						<td>
							<div class="main-service-btn">
								<a href="<%= request.getContextPath() %>/survey/surveyCustom">맞춤식단찾기</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<script>
		/**
		 * 대문이미지 슬라이드 처리
		 */
        let mainSlideWrap = document.getElementById('main-slider-wrap');
        let slideIndex = 0;
        let slides = document.querySelectorAll('#main-slider-wrap ul li');
        let totalSlides = slides.length;
        let sliderWidth = mainSlideWrap.clientWidth;
        
        slides.forEach((e) => {
            e.style.width = sliderWidth + 'px';
        });
        
        let slider = document.querySelector('#main-slider-wrap ul#main-slider');
        slider.style.width = sliderWidth * totalSlides + 'px';
		
        let nextBtn = document.getElementById('next');
        let prevBtn = document.getElementById('previous');
        
        // 다음/이전 버튼 처리
        nextBtn.addEventListener('click', () => {
            plusSlides(1);
        });
        
        prevBtn.addEventListener('click', () => {
            plusSlides(-1);
        });

        // hover 처리
        mainSlideWrap.addEventListener('mouseover', function () {
            this.classList.add('active');
            clearInterval(autoSlider);
        });
        
        mainSlideWrap.addEventListener('mouseleave', function () {
            this.classList.remove('active');
            autoSlider = setInterval(() => {
                plusSlides(1);
            }, 3000);
        });

        const plusSlides = (n) => {
            showSlides(slideIndex += n);
        };

        const currentSlides = (n) => {
            showSlides(slideIndex = n);
        };

        const showSlides = (n) => {
            slideIndex = n;
            if(slideIndex == -1) {
                slideIndex = totalSlides - 1;
            }
            else if(slideIndex === totalSlides) {
                slideIndex = 0;
            }

            slider.style.left = -(sliderWidth * slideIndex) + 'px';
            pagination();
        }

        // 페이징 처리
        slides.forEach((e) => {
            const li = document.createElement('li');
            document.querySelector('#main-slider-pagination-wrap ul').appendChild(li);
        });

        const pagination = () => {
            let dots = document.querySelectorAll('#main-slider-pagination-wrap ul li');
            dots.forEach((e) => {
                e.classList.remove('active');
            });
            dots[slideIndex].classList.add('active');
        };
        pagination();
        
        let autoSlider = setInterval(() => {
            plusSlides(1);
        }, 3000);
		</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

