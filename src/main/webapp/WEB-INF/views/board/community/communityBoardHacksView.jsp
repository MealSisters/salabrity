<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-view-wrap">
	<div>
		<div class="main-title">Community</div>
		<div class="main-sub-title">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</div>
	</div>
	<input type="button" value="샐브's 레시피" id="hacks-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacks';" />
	<input type="button" value="자유게시판" id="general-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/general';" />
	<br /><hr />
	<table class="tbl-posting-view">
		<thead>
			<tr>
				<th class="posting-view-writer"><i class="fa-solid fa-circle-user"></i> admin</th>
				<th class="posting-view-reg-date">22-06-06</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="posting-view-title" colspan="2">게시판 테스트입니다.</th>
			</tr>
			<tr>
				<td class="posting-view-board-name" colspan="2">
					<a href="<%= request.getContextPath() %>/board/community/hacks">in 샐브's 레시피</a>
				</td>
			</tr>
			<tr>
				<td class="posting-view-content" colspan="2">
					<div>
						<img src="https://img.bestrecipes.com.au/4bBXatUR/w643-h428-cfill-q90/br/2019/10/spiced-lamb-sausage-fattoush-954624-1.jpg" alt="" />
					</div>
					<div>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
						Nam voluptate blanditiis dolorem molestias totam doloremque cumque ipsum at. 
						Nobis debitis natus repellendus atque saepe dolor voluptates in consequatur commodi placeat.
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
						Distinctio debitis sequi iusto itaque tenetur nulla doloribus nesciunt incidunt. 
						Beatae expedita neque exercitationem tenetur nulla. Excepturi qui veritatis eius! Aliquam beatae.
					</div>
				</td>
			</tr>
			<tr>
				<td class="posting-view-cnt" colspan="2">
					<span class="posting-view-comment-tap">
						<a href="#comment-tap">
							<i class="fa-regular fa-comment"></i> comment
						</a>
					</span>
					<span class="posting-view-like-cnt">
						<i class="fa-solid fa-heart"></i> 0
					</span>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="board-button-wrap">
		<%-- 좋아요 버튼은 본인/관리자 열람불가 --%>
		<button id="board-like-btn">
			love it <i class="fa-regular fa-heart"></i>
			<!-- <i class="fa-solid fa-heart"></i> -->
		</button>
		<%-- 수정/삭제 버튼은 관리자만 열람 가능 --%>
		<input type="button" value="수정" id="board-update-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacksUpdate';" />
		<input type="button" value="삭제" id="board-delete-btn" />
	</div>
	<div class="comment-enroll-wrap" id="comment-tap">
		<h4>comment</h4>
		<form
			name="commentEnrollFrm"
			action="<%= request.getContextPath() %>/board/community/hacksView/commentEnroll" 
			method="POST">
			<input type="hidden" name="postingNo" value="" />
			<input type="hidden" name="memberId" value="" />
			<input type="hidden" name="commentLevel" value="1" />
			<input type="hidden" name="commentRef" value="" />
			<textarea name="commentContent" cols="60" rows="3" placeholder="권리침해, 욕설 및 특정 대상을 비하하는 내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다."></textarea>
			<button type="submit" id="comment-enroll-btn">등록</button>
		</form>
	</div>
	<table class="tbl-posting-comment-view">
		<tr class="level1">
        	<td>
        		<sub class="comment-writer">sinsa</sub>
        		<sub class="comment-date">22-06-06</sub>
        		<br />
	        	<span>답글 내용</span>
        	</td>
        	<td>
        		<button id="comment-reply-btn" value="">답글</button>
        		<button id="comment-delete-btn" value="">삭제</button>
        	</td>
        </tr>
        <tr class="level2">
        	<td>
        		<i class="fa-brands fa-replyd"></i>
        		<sub class="comment-writer">honggd</sub>
        		<sub class="comment-date">22-06-06</sub>
        		<br />
        		<span>　답글 내용</span>
        	</td>
        	<td>
        		<button id="comment-delete-btn" value="">삭제</button>
        	</td>
        </tr>
	</table>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>