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
					<th class="main-title" colspan="6">Community</th>
				</tr>
				<tr>
					<td class="main-sub-title" colspan="6">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</td>
				</tr>
				<tr class="hacks-title">
					<th colspan="6">
						<a href="<%= request.getContextPath() %>/board/community/hacks">
							<i class="fa-solid fa-caret-right"></i>샐브's 레시피
						</a>
					</th>
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
						<div>
							<a href="#">게시글1</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">게시글2</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">게시글3</a>
						</div>
					</td>
				</tr>
				<tr class="hacks-content">
					<td colspan="2">
						<div>
							<a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem exercitationem a debitis est cum sed nesciunt magnam error odio veritatis fuga deleniti dolor beatae iure facere incidunt consequatur ab harum.</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit quos itaque ullam provident soluta optio ea vitae esse totam nesciunt autem reprehenderit. Itaque ab totam possimus nemo sunt ex pariatur.</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque rem temporibus nemo necessitatibus saepe neque ad atque excepturi inventore amet quasi itaque cumque porro quaerat nesciunt officiis illo est dicta!</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i>0
						</div>
					</td>
					<td>
						<div class="like-cnt">
							0<i class="fa-solid fa-heart"></i>
						</div>
					</td>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i>0
						</div>
					</td>
					<td>
						<div class="like-cnt">
							0<i class="fa-solid fa-heart"></i>
						</div>
					</td>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i>0
						</div>
					</td>
					<td>
						<div class="like-cnt">
							0<i class="fa-solid fa-heart"></i>
						</div>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="hacks-btn">
							<a href="<%= request.getContextPath() %>/board/community/hacks">
								샐브's 레시피 더보기　<i class="fa-solid fa-rectangle-list"></i>
							</a>
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
					<th colspan="6">
						<a href="<%= request.getContextPath() %>/board/community/general">
							<i class="fa-solid fa-caret-right"></i>자유게시판
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr class="general-content-writer">
					<td colspan="2">
						<div>작성자　writer</div>
					</td>
					<td colspan="2">
						<div>작성자　writer</div>
					</td>
					<td colspan="2">
						<div>작성자　writer</div>
					</td>
				</tr>
				<tr class="general-content-reg-date">
					<td colspan="2">
						<div>작성일　22-06-04</div>
					</td>
					<td colspan="2">
						<div>작성일　22-06-04</div>
					</td>
					<td colspan="2">
						<div>작성일　22-06-04</div>
					</td>
				</tr>
				<tr class="general-content-title">
					<td colspan="2">
						<div>						
							<a href="#">게시글1</a>
						</div>
					</td>
					<td colspan="2">
						<div>						
							<a href="#">게시글2</a>
						</div>
					</td>
					<td colspan="2">
						<div>						
							<a href="#">게시글3</a>
						</div>
					</td>
				</tr>
				<tr class="general-content">
					<td colspan="2">
						<div>
							<a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi quaerat accusantium excepturi debitis consectetur iure iusto numquam incidunt fugiat rerum accusamus velit aspernatur facere quis praesentium officiis hic voluptates temporibus!</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis sequi totam sapiente quisquam doloribus ratione amet laudantium impedit vero minima magni pariatur vitae recusandae dolores adipisci ut maiores temporibus et.</a>
						</div>
					</td>
					<td colspan="2">
						<div>
							<a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur laborum hic quisquam optio necessitatibus autem blanditiis modi explicabo non adipisci. Iure impedit quo sed dicta cumque natus nam officia corporis?</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i>0
						</div>
					</td>
					<td>
						<div class="like-cnt">
							0<i class="fa-solid fa-heart"></i>
						</div>
					</td>
					<td>
						<div class="comment-cnt">	
							<i class="fa-regular fa-comment"></i>0
						</div>
					</td>
					<td>
						<div class="like-cnt">
							0<i class="fa-solid fa-heart"></i>
						</div>
					</td>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i>0
						</div>
					</td>
					<td>
						<div class="like-cnt">
							0<i class="fa-solid fa-heart"></i>
						</div>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="general-btn">
							<a href="<%= request.getContextPath() %>/board/community/general">
								자유게시판 더보기　<i class="fa-solid fa-rectangle-list"></i>
							</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>