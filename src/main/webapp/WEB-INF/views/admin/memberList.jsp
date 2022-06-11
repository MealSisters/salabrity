<%@page import="member.model.dto.MemberRole"%>
<%@page import="admin.model.service.AdminService"%>
<%@page import="member.model.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
List<Member> list = (List<Member>) request.getAttribute("list");
String pagebar = (String) request.getAttribute("pagebar");

int cPage = 1;
if(request.getParameter("cPage")!=null) {
	cPage = Integer.parseInt(request.getParameter("cPage"));
}
int startNo = (cPage-1)*AdminService.MEMBER_NUM_PER_PAGE + 1;
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminResultSetList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/ListSearchFilter.css">
<div class="div-level1">
    <p id="filter-wrapper-title">Filter</p>
    <div id="filter-wrapper" class="div-level2">
        <form name="memberFilterFrm" action="" onSubmit="return false;">
            <div class="div-searchFilter">
                <label for="filter-memberId">아이디</label>
                <input type="text" name="memberId" id="filter-memberId">
            </div>
            <div class="div-searchFilter">
                <label for="filter-memberName">이름</label>
                <input type="text" name="memberName" id="filter-memberName">
            </div>
            <div class="div-searchFilter">
                <label for="filter-gender">성별</label>
                <input type="radio" name="gender" id="radio-male" value="male">남
                <input type="radio" name="gender" id="radio-female" value="female">여
            </div>
            <div class="div-searchFilter">
                <label for="filter-birthday">생년월일</label>
                <input type="date" name="birthday" id="filter-birthday">
            </div>
            <div class="div-searchbtn">
                <button>조회</button>
            </div>
        </form>
    </div>

    <div class="div-level2 div-resultlist">
        <table id="tbl-memberList" class="tbl-searchResult">
            <thead>
                <tr>
                    <th class="col-no">No</th>
                    <th class="col-memberRole">역할</th>
                    <th class="col-memberId">아이디</th>
                    <th class="col-memberName">이름</th>
                    <th class="col-gender">성별</th>
                    <th class="col-birth">생년월일</th>
                    <th class="col-email">이메일</th>
                    <th class="col-phone">전화번호</th>
                    <th class="col-address">주소</th>
                    <th class="col-regDate">회원가입일</th>
                </tr>
            </thead>
            <tbody>
<%
	if(list != null && !list.isEmpty()){
		for(Member member : list){
%>
                <tr>
                    <td class="col-no"><%= startNo++ %></td>
                    <td class="col-memberRole">
                        <select class="member-role" data-member-id="<%= member.getMemberId() %>">
							<option value="<%=MemberRole.U%>"
								<%=member.getMemberRole() == MemberRole.U ? "selected" : ""%>>회원</option>
                            <option value="<%=MemberRole.A%>"
								<%=member.getMemberRole() == MemberRole.A ? "selected" : ""%>>관리자</option>
                        </select>
                    </td>
                    <td><%= member.getMemberId() %></td>
                    <td><%= member.getMemberName() %></td>
                    <td><%= member.getGender() != null ? member.getGender() : ""%></td>
                    <td><%= member.getBirthday() != null ? member.getBirthday() : "" %></td>
                    <td><%= member.getEmail()%></td>
                    <td><%= member.getPhone()%></td>
                    <td><%= member.getAddress()%> <%= member.getAddressDetail()%></td>
                    <td><%= member.getEnrollDate()%></td>
                </tr>
<%
		}
	} else {
%>
				<tr>
					<td colspan="11">조회된 회원이 없습니다.</td>
				</tr>
<%
	}
%>
            </tbody>
        </table>
    </div>

	<link rel='stylesheet' href='<%= request.getContextPath() %>/css/pagebar.css'>
    <%= pagebar %>

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>