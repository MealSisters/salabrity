<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/board.css" />

<div class="my_page_content">
	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>

	<div class="my_sub_content">
		<h4 class="mypage_hd">1:1 문의</h4>
		<div class="direct_question">
			<div class="direct_question_zone">
				<form name="questionEnrollFrm" 
				method="POST" 
				action="<%= request.getContextPath() %>/mypage/boardQuestion"
				enctype="multipart/form-data">
					<table class="tbl_question_enroll">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" id="p_title"></td>
								<input type="hidden" name="memberId"/>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text" name="content" id="p_content"></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<div class="upload_file">
										<input type="file" name="upFile1" id="upFile2">
										<input type="file" name="upFile1" id="upFile2">
									<!--  	<div class="btn_upload_box">
											<button type="button" id="search_file">찾아보기</button>
											<button type="button" id="plus_file">+ 추가</button>
										</div> -->
										</div>
								</td>
							</tr>

						</tbody>
					</table>
					<div class="btn_question_box">
						<button type="button" id="btn_del_can" onclick="location.href='<%= request.getContextPath() %>/mypage/boardQuestionList';">취소</button>
						<button type="submit" id="btn_question_enroll">등록</button>
					</div>
			</form>
			</div>

		</div>

	</div>
</div>
<script>

document.questionEnrollFrm.onsubmit = (e) => {
	const frm = e.target;
	const titleVal = frm.title.value.trim();
	if(!/^.+$/.test(titleVal)) {
		alert("제목을 작성해주세요.");
		frm.title.select();
		return false;
	}
	const contentVal = frm.content.value.trim();
	if(!/^(.|\n)+$/.test(contentVal)) {
		alert("내용을 작성해주세요.");
		frm.content.select();
		return false;
	}
}

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>