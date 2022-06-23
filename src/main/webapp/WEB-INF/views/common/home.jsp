<%@ page import="java.text.DecimalFormat" %>
<%@ page import="product.model.dto.ProductExt" %>
<%@ page import="product.model.dto.ProductAttach" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	List<ProductExt> productList = (List<ProductExt>) request.getAttribute("productList");
	final int READ_COUNT = 3;
	DecimalFormat df = new DecimalFormat("###,###");
%>
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
	<div class="main-product-layout">
		<div class="main-title">인기상품</div>
		<div class="main-sub-title">샐러브리티에서 가장 잘 판매되는 상품이에요.</div>
		<div class="main-product-contents-wrap">
<%
	if(productList != null && !productList.isEmpty()) {
		for(int i = 0; i < READ_COUNT; i++) {
%>
			<div class="main-product-content-wrap">
<%
		List<ProductAttach> attachments = productList.get(i).getAttachs();
		if(attachments != null && !attachments.isEmpty()) {
			for(int j = 0; j < 1; j++) {
%>
				<div class="main-product-img">
					<a href="<%= request.getContextPath() %>/product/productInfo?no=<%= productList.get(i).getProductNo() %>">
						<img src="<%= request.getContextPath() %>/upload/product/<%= attachments.get(j).getRenamedFileName() %>" alt="<%= attachments.get(j).getOriginalFileName() %>" />
					</a>
				</div>
<%
		}
	}
%>
				<div class="main-product-name">
					<a href="<%= request.getContextPath() %>/product/productInfo?no=<%= productList.get(i).getProductNo() %>">
						<%= productList.get(i).getProductName() %>
					</a>
				</div>
				<div class="main-product-price">
					<a href="<%= request.getContextPath() %>/product/productInfo?no=<%= productList.get(i).getProductNo() %>">
						<%= df.format(productList.get(i).getProductPrice())  %>
					</a>
				</div>
			</div>
	<%		
		 	}
		}
	%>
		</div>
		<div class="main-product-btn">
			<a href="<%= request.getContextPath() %>/calendar">샐브의 식단 보기</a>
		</div>
	</div>
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
					<a href="<%= request.getContextPath() %>/surveyResult">
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
						<a href="<%= request.getContextPath() %>/surveyResult">맞춤식단찾기</a>
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

