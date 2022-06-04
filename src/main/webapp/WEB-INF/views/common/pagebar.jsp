<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	페이지바 컨트롤러 따로 구현하기 전까지만 임시로 사용할 것
	
	컨트롤러의 페이지바영역 처리
	String pagebar = PageBar.getPagebar(cPage, numPerPage, totalContents, url);
	-> 스타일시트링크 및 div태그 포함하여 페이지바 html 반환
 --%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/pagebar.css">
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