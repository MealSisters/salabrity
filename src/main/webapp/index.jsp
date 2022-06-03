<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%-- 대문이미지 슬라이드 --%>
		<div id="main-slide-wrap">
			<div class="main-slider">
				<ul>
					<li>
						<div class="main-slide-msg">
							<h3>Slide 1</h3>
						</div>
						<img src="#" alt="대문이미지1" />
					</li>
					<!-- <li>
						<div class="main-slide-msg">
							<h3>Slide 2</h3>
						</div>
						<img src="#" alt="대문이미지2" />
					</li>
					<li>
						<div class="main-slide-msg">
							<h3>Slide 3</h3>
						</div>
						<img src="#" alt="대문이미지3" />
					</li> -->
				</ul>
			</div>
		</div>
		<hr />
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
								<a href="#">이달의 식단 보기</a>
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
							<a href="#">
								<img src="#" alt="맞춤식단찾기" />
							</a>
						</td>
					</tr>
					<tr>
						<td id="main-service-msg2" class="main-service-msg">빠르게 원하는 식단을 찾아드려요.</td>
					</tr>
					<tr>
						<td>
							<div class="main-service-btn">
								<a href="#">맞춤식단찾기</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

