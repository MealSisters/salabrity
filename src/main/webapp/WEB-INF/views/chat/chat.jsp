<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div id="chat-wrap">
		<h4>
			안녕하세요. 샐러브리티 채팅 서비스입니다.
			<br />
			문의하실 내용을 입력해주세요.
		</h4>
		<iframe 
			src="https://service.dongledongle.com/SalabrityChat" 
			frameborder="0" 
			width="100%" 
			height="500">
		</iframe>
		
		<input type="submit" id="chat-back-btn" value="뒤로가기" onclick="history.back();" />
	</div>
