<%@page import="board.model.dto.Posting"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice/notice.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<%
	List<Posting> list = (List<Posting>) request.getAttribute("list");
	int cPage = (int)request.getAttribute("cPage");
%>


<div class="notice_page_content">
    <h3 class="notice_hd">자주 묻는 질문</h3>
    <div class="notice_wrap">        
    <button type="button" class="btn_notice_enroll" onclick="location.href='<%= request.getContextPath() %>/board/faqEnroll';">등록</button>
<%@ include file="/WEB-INF/views/common/noticePagebar.jsp" %>
   <div class="notice_cont" id="faq_cont"> <!-- faq랑 같이 사용 -->
            <div class="faq">
              <%
			if(list != null && !list.isEmpty()) {
				for(Posting posting : list) {
		%>
                <ul class="faqBody" data-no="<%= posting.getPostingNo() %>">
                    <li class="article" id="a1">
                        <p class="q"><a href="#a1">
                        <span class="icon_q">Q</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= posting.getTitle() %><span class="q_img"><img src="<%= request.getContextPath() %>/images/arrow.png" style="width:20px" alt=""></span>
                        </a></p>

                        <p class="a">
                        <span class="icon_a">A</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= posting.getContent() %>
                      
                        </p>
                    </li>
                  
                </ul>
                <%		
			 	}
			}
			else {
		%>
		<div><p style="text-align:center;">등록된 게시글이 없습니다.</p></div>
		<% 
			}
		%>
            </div>
<%= request.getAttribute("pageBar") != null ? request.getAttribute("pageBar") : ""%>
        </div>

    </div> <!-- notice_wrap -->
</div> <!--notice_page_content-->

<script>
    jQuery(function($){
        var article = $('.faq>.faqBody>.article');
        article.addClass('hide');
        article.find('.a').hide();
        article.eq(0).removeClass('hide');
        article.eq(0).find('.a').show();
        $('.faq>.faqBody>.article>.q>a').click(function(){
            var myArticle = $(this).parents('.article:first');
            if(myArticle.hasClass('hide')){
                article.addClass('hide').removeClass('show');
                article.find('.a').slideUp(100);
                myArticle.removeClass('hide').addClass('show');
                myArticle.find('.a').slideDown(100);
            } else {
                myArticle.removeClass('show').addClass('hide');
                myArticle.find('.a').slideUp(100);
            }
            return false;
        });
       
    });
</script>

<!-- 이은지 start -->
<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
<script>
    window.addEventListener('load', (e) => {
        addAdminBtns();
        addAdminEvent(e);
    });
    const addAdminBtns = () => {
        const faqAll = document.querySelectorAll(".faqBody");
        const adminDiv = `<div class="admin_buttons">
                            	<div class="updateBtn-wrapper">
					                <button class="updateBtn">수정</button>
					            </div>
					            <div class="cancelBtn-wrapper">
					                <button type="button" class="cancelBtn">삭제</button>
					            </div>
                            </div>`

        faqAll.forEach((faq) => {
            const tr = faq.firstElementChild.lastElementChild;
            tr.insertAdjacentHTML('beforeEnd', adminDiv);
        });
    };
    const addAdminEvent = (e) => {
        const updateBtns = document.querySelectorAll(".updateBtn");
        const postingNo = $(e.target).parents("ul").attr("data-no");
        updateBtns.forEach((btn) => {
            btn.onclick = (e) => {
                location.href = `<%= request.getContextPath() %>/board/faqUpdate?no=\${postingNo}`;
            };
        });
        
        const cancelBtns = document.querySelectorAll(".cancelBtn");
        cancelBtns.forEach((btn) => {
        	btn.onclick = (e) => {
        		// doGet
        		// location.href = `<%= request.getContextPath() %>/board/faqDelete?no=\${postingNo}`;
        		
        		//doPost
        		// document.deleteFaqFrm.submit();
        	};
        });
    };
</script>
<% } %> 
<!-- 이은지 end -->


<%@ include file="/WEB-INF/views/common/footer.jsp" %>