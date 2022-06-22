package cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.service.CartService;

/**
 * Servlet implementation class CartCheckedDelete
 */
@WebServlet("/order/cart/checkedDelete")
public class CartCheckedDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String[] cartNoArr =  request.getParameterValues("cartNoList");
			
			List<Integer> cartNoList = new ArrayList<Integer>();
			for(int i = 0; i < cartNoArr.length;i++) {
				int cartNo = Integer.parseInt(cartNoArr[i]);
				int result = cartService.deleteByCartNo(cartNo);
			}
			System.out.println(cartNoList);
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}