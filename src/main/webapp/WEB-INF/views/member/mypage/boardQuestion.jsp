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
								<td><input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" id="p_content" cols="30" rows="10"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<div class="upload_file">
									 <input type="text" readonly="readonly" class="file-name" />
  									 <label for="upFile1" class="file-label">찾아보기</label>
									 <input type="file" name="upFile1" id="upFile1" style=display:none; class="file-upload">
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

(function($){
	  
	  var $fileBox = null;
	  
	  $(function() {
	    init();
	  })
	  
	  function init() {
	    $fileBox = $('.upload_file');
	    fileLoad();
	  }
	  
	  function fileLoad() {
	    $.each($fileBox, function(idx){
	      var $this = $fileBox.eq(idx),
	          $btnUpload = $this.find('[type="file"]'),
	          $label = $this.find('.file-label');
	      
	      $btnUpload.on('change', function() {
	        var $target = $(this),
	            fileName = $target.val(),
	            $fileText = $target.siblings('.file-name');
	        $fileText.val(fileName);
	      })
	      
	      $btnUpload.on('focusin focusout', function(e) {
	        e.type == 'focusin' ?
	          $label.addClass('file-focus') : $label.removeClass('file-focus');
	      })
	      
	    })
	  }
	  
	})(jQuery);
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>