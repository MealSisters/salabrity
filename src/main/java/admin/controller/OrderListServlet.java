package admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import buy.model.dto.Buy;
import buy.model.dto.BuyExt;
import buy.model.dto.PayStatement;
import buy.model.dto.ProductBuy;
import buy.model.dto.ProductBuyExt;
import buy.model.service.BuyService;
import common.utill.PageBar;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/admin/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BuyService buyService = new BuyService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// 검색어
			Map<String, Object> searchParam = new HashMap<>();
			if(request.getParameter("payStatement")!=null) {
				String merchantUid = request.getParameter("merchantUid");
				String memberId = request.getParameter("memberId");
				Date orderDateStart = null;
				Date orderDateEnd = null;
				if(!request.getParameter("orderDateStart").equals(""))
					orderDateStart = Date.valueOf(request.getParameter("orderDateStart"));
				if(!request.getParameter("orderDateEnd").equals(""))
					orderDateStart = Date.valueOf(request.getParameter("orderDateEnd"));
				PayStatement payStatement = null;
				if(!request.getParameter("payStatement").equals("all")) {
					payStatement = PayStatement.valueOf(request.getParameter("payStatement"));
				}
	
				searchParam.put("merchantUid", merchantUid);
				searchParam.put("memberId", memberId);
				searchParam.put("orderDateStart", orderDateStart);
				searchParam.put("orderDateEnd", orderDateEnd);
				searchParam.put("payStatement", payStatement);
			}
			
			
			int numPerPage = AdminService.ORDER_NUM_PER_PAGE;
			int cPage = 1;
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
				// 예외발생시 현재페이지는 1로 처리
			}
			Map<String, Object> param = new HashMap<>();
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			param.put("start", start);
			param.put("end", end);

			int totalOrders = 0;
			List<BuyExt> list = null;
			if (!searchParam.isEmpty()) {
				// 검색어 있을때 페이징에 필요한 값들
				list = buyService.findMemberByParam(searchParam);
			} else {
				// 검색어 없을때
				list = buyService.findAllBuyExt(param);
				totalOrders = buyService.getTotalBuys();
			}
			if(list != null) {
				for(BuyExt buy : list) {
					List<ProductBuyExt> pbeList = buyService.findProductBuyExtByUid(buy.getMerchantUid());
					buy.setList(pbeList);
				}
			}
			
			String url = request.getRequestURI();
			String pagebar = PageBar.getPagebar(cPage, numPerPage, totalOrders, url);

			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/admin/orderList.jsp").forward(request, response);
		} catch (Exception e) {
			// e.printStackTrace();
			throw e;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
