package common.utill;

// 페이지바 담당자 이은지
// css파일 별도로 link하여 사용
public class PageBar {

	private static int PAGEBAR_SIZE = 5; // 페이지번호는 5개씩 출력

	/**
	 * 페이지바 생성
	 * 
	 * @param cPage         현재페이지번호
	 * @param numPerPage    페이지당 출력되는 컨텐츠(게시글, 상품) 개수
	 * @param totalContents 전체 컨텐츠(게시글, 상품) 개수
	 * @param url           각 페이지번호 요소들의 공통 url (ex. /mvc/admin/memberList)
	 * @return
	 * 
	 */
	public static String getPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();

		pagebar.append("\n");
		pagebar.append("<div class='page-bar'>");

		int totalPages = (int) Math.ceil((double) totalContents / numPerPage); // 전체 페이지 수
		int pagebarSize = PAGEBAR_SIZE;
		int pagebarStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pagebarEnd = pagebarStart + pagebarSize - 1;
		int pageNo = pagebarStart;

		url += "?cPage=";

		if (pageNo != 1) {
			// '<<'버튼과 '<'버튼 활성화
			pagebar.append("<a href='" + url + "1'><i class='fa-solid fa-angles-left'></i></a>");
			pagebar.append("\n");
			pagebar.append("<a href='" + url + (pageNo - 1) + "'><i class='fa-solid fa-angle-left'></i></a>");
			pagebar.append("\n");
		}

		while (pageNo <= pagebarEnd && pageNo <= totalPages) {
			if (pageNo == cPage) {
				// 현재페이지에는 이동 링크 없음
				pagebar.append("<a class='cPage'>" + pageNo + "</a>");
				pagebar.append("\n");
			} else {
				pagebar.append("<a href='" + url + pageNo + "'>" + pageNo + "</a>");
				pagebar.append("\n");
			}
			pageNo++;
		}

		// 현재페이지가 마지막페이지 이전 && 전체페이지수가 페이지바수보다 많을때
		if (pageNo > totalPages && totalPages > pagebarSize) {
			// '>'버튼과 '>>'버튼 활성화
			pagebar.append("<a href='" + url + pageNo + "'><i class='fa-solid fa-angle-right'></i></a>");
			pagebar.append("\n");
			pagebar.append("<a href='" + url + totalPages + "'><i class='fa-solid fa-angles-right'></i></a>");
			pagebar.append("\n");
		}

		pagebar.append("</div>");

		return pagebar.toString();
	}
	
	/**
	 * 다른쿼리 함께 전달하는 페이지바
	 * @이은지
	 */
	public static String getMultiParamPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();

		pagebar.append("\n");
		pagebar.append("<div class='page-bar'>");

		int totalPages = (int) Math.ceil((double) totalContents / numPerPage); // 전체 페이지 수
		int pagebarSize = PAGEBAR_SIZE;
		int pagebarStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pagebarEnd = pagebarStart + pagebarSize - 1;
		int pageNo = pagebarStart;

		url += "&cPage=";

		if (pageNo != 1) {
			// '<<'버튼과 '<'버튼 활성화
			pagebar.append("<a href='" + url + "1'><i class='fa-solid fa-angles-left'></i></a>");
			pagebar.append("\n");
			pagebar.append("<a href='" + url + (pageNo - 1) + "'><i class='fa-solid fa-angle-left'></i></a>");
			pagebar.append("\n");
		}

		while (pageNo <= pagebarEnd && pageNo <= totalPages) {
			if (pageNo == cPage) {
				// 현재페이지에는 이동 링크 없음
				pagebar.append("<a class='cPage'>" + pageNo + "</a>");
				pagebar.append("\n");
			} else {
				pagebar.append("<a href='" + url + pageNo + "'>" + pageNo + "</a>");
				pagebar.append("\n");
			}
			pageNo++;
		}

		// 현재페이지가 마지막페이지 이전 && 전체페이지수가 페이지바수보다 많을때
		if (pageNo > totalPages && totalPages > pagebarSize) {
			// '>'버튼과 '>>'버튼 활성화
			pagebar.append("<a href='" + url + pageNo + "'><i class='fa-solid fa-angle-right'></i></a>");
			pagebar.append("\n");
			pagebar.append("<a href='" + url + totalPages + "'><i class='fa-solid fa-angles-right'></i></a>");
			pagebar.append("\n");
		}

		pagebar.append("</div>");

		return pagebar.toString();
	}
}
