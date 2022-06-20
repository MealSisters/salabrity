<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		</section>
		<footer>
			<div>
				<div class="info">
					<table>
						<thead>
							<tr>
								<th colspan="2">
									<div class="info-logo">
										<span>Salabr<i class="fa-solid fa-seedling"></i>ty</span>
									</div>
								</th>
							</tr>
							<tr>
								<th colspan="2">㈜샐러브리티</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>주소</th>
								<td>서울특별시 강남구</td>
							</tr>
							<tr>
								<th>대표자명</th>
								<td>밀을 짓는 사람들</td>
							</tr>
							<tr>
								<th>통신판매업 신고번호</th>
								<td>2022-서울강남-0000</td>
							</tr>
							<tr>
								<th>사업자등록번호</th>
								<td>000-00-000000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="cs">
				<table>
					<thead>
						<tr>
							<th>고객센터</th>
							<td>대표전화 <a href="tel:02-0000-0000;">02-0000-0000</a></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th rowspan="2">채팅 문의</th>
							<td>채팅 상담 운영 시간</td>
						</tr>
						<tr>
							<td>평일 09:00 ~ 18:00 (토/일/공휴일 휴무)</td>
						</tr>
						<tr>
							<th rowspan="2">
								<a href="<%= request.getContextPath() %>/mypage/boardQuestion">1:1 문의</a>
							</th>
							<td>24시간 접수 가능</td>
						</tr>
						<tr>
							<td>빠른 응대를 원하시면 채팅을 통해 문의하여 주십시오.</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								제휴 및 기타 이메일 문의
								<a class="footer-contents" 
									href="mailto:salabrity0506@gmail.com?subject=안녕하세요. [샐러브리티]에서 문의드립니다.
				                    &amp;body=안녕하세요, 샐러브리티입니다. 문의 내용을 작성하여 주십시오.%0D%0A
				                    &amp;target=_blank">
				                	<strong>salabrity0506@gmail.com</strong>
								</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="rights">
				<a href="<%= request.getContextPath() %>/tos">이용약관</a> | <a href="<%= request.getContextPath() %>/privacyPolicy">개인정보처리방침</a>
				<p>Copyright ⓒ 2022 All rights reserved by <strong>㈜샐러브리티</strong></p>
			</div>
		</footer>
	</div>
</body>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "875acb53-7bf0-445a-8d7e-d6ef21bab6e9",
    "memberId": "member_id",
    "profile": {
      "name": "member_name",
      "mobileNumber": "phone",
      "email": "email"
    }
  });
</script>
<!-- End Channel Plugin -->
</html>