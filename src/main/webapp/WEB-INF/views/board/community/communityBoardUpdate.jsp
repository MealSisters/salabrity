<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-update-wrap">
	<span class="main-title">게시판명</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<form
			name="generalBoardUpdateFrm" 
			action="<%= request.getContextPath() %>/board/community/general/update" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-board-update">
				<tr>
					<th>작성자</th>
					<td>
						<div>
							<input type="text" name="memberId" value="honggd<%-- <%= loginMember.getMemberId() %> --%>" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호<sup>*</sup></th>
					<td>
						<div>
							<input type="password" name="password" placeholder="비밀번호를 입력하세요." />
						</div>
					</td>
				</tr>
				<tr>
					<th>제목<sup>*</sup></th>
					<td>
						<div>
							<input type="text" name="title" value="게시판 테스트입니다.<%-- 기존 제목 --%>" />
						</div>
					</td>
				</tr>
				<tr>
					<th>내용<sup>*</sup></th>
					<td>
						<div>
							<%-- 기존 내용 --%>
							<textarea rows="5" cols="40" name="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam voluptate blanditiis dolorem molestias totam doloremque cumque ipsum at. Nobis debitis natus repellendus atque saepe dolor voluptates in consequatur commodi placeat. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio debitis sequi iusto itaque tenetur nulla doloribus nesciunt incidunt. Beatae expedita neque exercitationem tenetur nulla. Excepturi qui veritatis eius! Aliquam beatae.</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<div class="board-attach-wrap">
							<div class="existing-attach-wrap">
								<div class="existing-attach-img">
									<img src="https://img.bestrecipes.com.au/4bBXatUR/w643-h428-cfill-q90/br/2019/10/spiced-lamb-sausage-fattoush-954624-1.jpg" alt="" />
								</div>
								<span class="existing-attach-name">샐러드사진.jpg</span>
								<input type="checkbox" name="delFile" id="delFile" value="" />
								<label for="delFile">
									<sup>
										<svg width="30" height="15" xmlns="http://w3.org/2000/svg" version="1.1" viewbox="0 0 80 40">
								            <polyline class="st1" points="9.06 20.89 25.85 35.74 50.46 9.35"/>
								        </svg>									
								        <span>클릭시 삭제됩니다.</span>
									</sup>
								</label>
								<!-- <span class="attach-del-check">체크시 삭제됩니다.</span> -->
							</div>
							<br />
						    <input class="board-attach-name" value="첨부파일" placeholder="첨부파일" readonly />
						    <label for="upFile">파일찾기</label>
						    <input type="file" id="upFile" />
						</div>
					</td>
				</tr>
			</table>
			<div class="board-button-wrap">
				<input type="submit" value="수정" id="board-update-btn" />
				<input type="reset" value="취소" id="board-back-btn" onclick="history.go(-1);" />
			</div>
		</form>
	</div>
</div>
<script>
/**
 * generalBoardUpdateFrm 유효성 검사
 */
window.addEventListener('load', () => {
	document.generalBoardUpdateFrm.onsubmit = (e) => {
		const frm = e.target;
		
		const passwordVal = frm.password.value.trim();
		if(!/^.{4,}$/.test(passwordVal)) {
			alert("4자리 이상의 비밀번호를 입력해주세요.");
			frm.password.select();
			return false;
		}
		
		const titleVal = frm.title.value.trim();
		if(!/^.+$/.test(titleVal)) {
			alert("제목을 입력해주세요.");
			frm.title.select();
			return false;
		}
		
		const contentVal = frm.content.value.trim();
		if(!/^(.|\n)+$/.test(contentVal)) {
			alert("내용을 입력해주세요.");
			frm.content.select();
			return false;
		}
		
		return true;
	}
});

/**
 * 첨부파일명 변경
 */
const upFile = document.querySelector("#upFile");
upFile.addEventListener('change', () => {
	const upFileName = upFile.files[0].name; // value=fakepath
	document.querySelector(".board-attach-name").value = upFileName;
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>