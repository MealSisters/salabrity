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
				<form>
					<table class="tbl_question">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" id="p_title"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text" name="content" id="p_content"></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<div class="upload_file">
										<input type="text" name="" id="upFile">
										<div class="btn_upload_box">
											<button type="button" id="search_file">찾아보기</button>
											<button type="button" id="plus_file">+ 추가</button>
										</div>
								</td>
							</tr>

						</tbody>
					</table>
					<div class="btn_question_box">
						<button type="button" id="btn_del_can">취소</button>
						<button id="btn_question_enroll">등록</button>
					</div>
			</div>

			</form>
		</div>





	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>