<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/backtoDashboard.css">
<%@ include file="/WEB-INF/views/admin/backtoDashboard.jsp" %>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminMemberList.css">
<div class="div-level1">
    <p>Filter</p>
    <div class="div-level2">
        <form name="memberFilterFrm" action="" onSubmit="return false;">
            <div class="div-searchFilter">
                <label for="filter-memberId">아이디</label>
                <input type="text" name="" id="filter-memberId">
            </div>
            <div class="div-searchFilter">
                <label for="filter-memberName">이름</label>
                <input type="text" name="" id="filter-memberName">
            </div>
            <div class="div-searchFilter">
                <label for="filter-gender">성별</label>
                <input type="radio" name="gender" id="radio-male" value="male">남
                <input type="radio" name="gender" id="radio-female" value="female">여
            </div>
            <div class="div-searchFilter">
                <label for="filter-birth">생년월일</label>
                <input type="date" name="" id="filter-birth">
            </div>
            <div class="div-searchbtn">
                <button>조회</button>
            </div>
        </form>
    </div>

    <div class="div-level2 div-resultlist">
        <table id="tbl-memberList">
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
                <tr>
                    <td class="col-no">1</td>
                    <td class="col-memberRole">
                        <select calss="member-role" data-member-id="">
                            <option value="회원" selected>회원</option>
                            <option value="관리자">관리자</option>
                        </select>
                    </td>
                    <td>honggd</td>
                    <td>홍길동</td>
                    <td>남</td>
                    <td>1980-08-08</td>
                    <td>gdgd1234@gmail.com</td>
                    <td>010-1111-2222</td>
                    <td>서울특별시 강남구 청담동 어쩔로 저쩔길 티비아파트</td>
                    <td>2022-04-01</td>
                </tr>
                <!-- (tr>td{$})*20 -->
                <tr>
                    <td class="col-no">2</td>
                </tr>
                <tr>
                    <td class="col-no">3</td>
                </tr>
                <tr>
                    <td class="col-no">4</td>
                </tr>
                <tr>
                    <td class="col-no">5</td>
                </tr>
                <tr>
                    <td class="col-no">6</td>
                </tr>
                <tr>
                    <td class="col-no">7</td>
                </tr>
                <tr>
                    <td class="col-no">8</td>
                </tr>
                <tr>
                    <td class="col-no">9</td>
                </tr>
                <tr>
                    <td class="col-no">10</td>
                </tr>
                <tr>
                    <td class="col-no">11</td>
                </tr>
                <tr>
                    <td class="col-no">12</td>
                </tr>
                <tr>
                    <td class="col-no">13</td>
                </tr>
                <tr>
                    <td class="col-no">14</td>
                </tr>
                <tr>
                    <td class="col-no">15</td>
                </tr>
            </tbody>
        </table>
    </div>


    <div class="page-bar">
        <a href=""><i class="fa-solid fa-angles-left"></i></a>
        <a href=""><i class="fa-solid fa-angle-left"></i></a>
        <a href="" class="cPage">1</a>
        <a href="">2</a>
        <a href="">3</a>
        <a href="">4</a>
        <a href="">5</a>
        <a href=""><i class="fa-solid fa-angle-right"></i></a>
        <a href=""><i class="fa-solid fa-angles-right"></i></a>
    </div>

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>