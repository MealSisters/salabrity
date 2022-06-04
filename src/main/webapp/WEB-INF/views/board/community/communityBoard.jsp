<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<!-- 커뮤니티게시판 메인 -->
<div id="community-board-wrap">
	<!-- 게시판1 테이블 -->
	<div id="community-hacks-wrap">
		<table class="tbl-community-hacks">
			<thead>
				<tr>
					<th colspan="6">Community</th>
				</tr>
				<tr>
					<td colspan="6">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</td>
				</tr>
				<tr class="hacks-title">
					<th colspan="6">커뮤니티게시판1</th>
				</tr>
			</thead>
			<tbody>
				<tr class="hacks-img">
					<td colspan="2">
						<div>
							<a href="#">
								<img src="#" alt="hack1" />
							</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">
								<img src="#" alt="hack2" />
							</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">
								<img src="#" alt="hack3" />
							</a>
						</div>
					</td>
				</tr>
				<tr class="hacks-content-title">
					<td colspan="2">
						<a href="#">게시글1</a>
					</td>
					<td colspan="2">
						<a href="#">게시글2</a>
					</td>
					<td colspan="2">
						<a href="#">게시글3</a>
					</td>
				</tr>
				<tr class="hacks-content">
					<td colspan="2">
						<a href="#">게시글 내용</a>
					</td>
					<td colspan="2">
						<a href="#">게시글 내용</a>
					</td>
					<td colspan="2">
						<a href="#">게시글 내용</a>
					</td>
				</tr>
				<tr>
					<td><i class="fa-regular fa-comment"></i>0</td>
					<td>0<i class="fa-solid fa-heart"></i></td>
					<td><i class="fa-regular fa-comment"></i>0</td>
					<td>0<i class="fa-solid fa-heart"></i></td>
					<td><i class="fa-regular fa-comment"></i>0</td>
					<td>0<i class="fa-solid fa-heart"></i></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="hacks-btn">
							<a href="#">게시판1 이동</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<!-- 게시판2 테이블 -->
	<div id="community-general-wrap">
		<table class="tbl-community-general">
			<thead>
				<tr class="general-title">
					<th colspan="6">커뮤니티게시판2</th>
				</tr>
			</thead>
			<tbody>
				<tr class="general-content-writer">
					<td rowspan="2">
						<div>
							<i class="fa-solid fa-circle-user"></i>
						</div>
					</td>
					<td>작성자</td>
					<td rowspan="2">
						<div>
							<i class="fa-solid fa-circle-user"></i>
						</div>
					</td>
					<td>작성자</td>
					<td rowspan="2">
						<div>
							<i class="fa-solid fa-circle-user"></i>
						</div>
					</td>
					<td>작성자</td>
				</tr>
				<tr class="general-content-reg-date">
					<td>작성일</td>
					<td>작성일</td>
					<td>작성일</td>
				</tr>
				<tr class="general-content-title">
					<td colspan="2">
						<a href="#">게시글1</a>
					</td>
					<td colspan="2">
						<a href="#">게시글2</a>
					</td>
					<td colspan="2">
						<a href="#">게시글3</a>
					</td>
				</tr>
				<tr class="general-content">
					<td colspan="2">
						<a href="#">게시글 내용</a>
					</td>
					<td colspan="2">
						<a href="#">게시글 내용</a>
					</td>
					<td colspan="2">
						<a href="#">게시글 내용</a>
					</td>
				</tr>
				<tr>
					<td><i class="fa-regular fa-comment"></i>0</td>
					<td>0<i class="fa-solid fa-heart"></i></td>
					<td><i class="fa-regular fa-comment"></i>0</td>
					<td>0<i class="fa-solid fa-heart"></i></td>
					<td><i class="fa-regular fa-comment"></i>0</td>
					<td>0<i class="fa-solid fa-heart"></i></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="general-btn">
							<a href="#">게시판2 이동</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>