package cart.model.dao;
import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import cart.model.dto.Cart;
import cart.model.exception.CartException;
import mypage.model.exception.DestinationException;
import product.model.dao.ProductDao;
import product.model.dto.ProductAttach;
import product.model.dto.ProductExt;

public class CartDao {
	private Properties prop = new Properties();
	
	public CartDao() {
		String filename = ProductDao.class.getResource("/sql/cart-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//동일상품개수 가져오기
	public int findByIdIdenticalProductCount(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cnt = 0;
		String sql = prop.getProperty("findByIdIdenticalProductCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getMemberId());
			pstmt.setInt(2, cart.getProductNo());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				cnt = rset.getInt(1);
				System.out.println(cnt);
			}
			
		} catch (SQLException e) {
			throw new CartException("장바구니 동일상품 개수 조회 오류");
		}
		return cnt;
	}
	
//추가
	public int cartInsert(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String sql = prop.getProperty("cartInsert");
		System.out.println("CartDao@CartInsert cart:" + cart);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getMemberId());
			pstmt.setInt(2, cart.getProductNo());
			pstmt.setInt(3, cart.getQuantity());
			pstmt.setString(4, cart.getFirstShipppingDate());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw new CartException("장바구니에 추가 오류", e);
		} finally {
			close(pstmt);
		}
		return result;		
	}

	//장바구니 목록 조회
	public Map<String, Object> findByIdCart(Connection conn, String memberId) {
		String sql = prop.getProperty("findByIdCart");
		PreparedStatement pstmt = null;
		Map<String, Object> map = new HashMap<String,Object>();
		List<ProductExt> productList = new ArrayList<>();
		List<Cart> cartList = new ArrayList<>();
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				List<ProductAttach> attachs = new ArrayList<>();
				ProductExt product = handleProductResultSet(rset);
				ProductAttach attach = handleProductAttachResultSet(rset);
				Cart cart = handleCartResultSet(rset);
				attachs.add(attach);
				product.setAttachs(attachs);
				productList.add(product);
				cartList.add(cart);
			}
			System.out.println("Dao@" + productList);
			System.out.println("Dao@" + cartList);
			map.put("cartList", cartList);
			map.put("productList",productList);
			System.out.println("Dao@"+ map);
		} catch (Exception e) {
			throw new CartException("상품목록 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}
		return map;
	}
	
	//수량 업데이트
	public int cartQuantityUpdate(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String sql = prop.getProperty("cartQuantityUpdate");
		System.out.println("CartDao@ cart:" + cart);
		try {
			System.out.println("sql요청전" +  cart);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getQuantity());
			pstmt.setInt(2, cart.getCartNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new CartException("수량 업데이트 오류", e);
		} finally {
			close(pstmt);
		}
		return result;		
	}
	
	// 날짜 업데이트
	public int firstShippingDateUpdate(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String sql = prop.getProperty("firstShippingDateUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getFirstShipppingDate());
			pstmt.setInt(2, cart.getCartNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new CartException("배송 시작일 업데이트 오류", e);
		} finally {
			close(pstmt);
		}
		return result;	
	}

	// 선택삭제
	public int deleteByCartNo(Connection conn, int cartNo) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String sql = prop.getProperty("deleteByCartNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new CartException("장바구니 - 선택 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;	
	}

	//아이디로 삭제
	public int deleteBymemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String sql = prop.getProperty("deleteByMemberId");
		//System.out.println("CartDao@ cartNoList:" + cartNo);
		try {
			//System.out.println("sql요청전" +  cartNo);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();

			//System.out.println("sql요청후 result" +  result);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new CartException("장바구니 - 선택 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;	
	}
	//장바구니 번호로 장바구니 목록 조회
	public Cart findByCartNo(Connection conn, int cartNo) {
		Cart cart = new Cart();
		String sql = prop.getProperty("findByCartNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				cart = handleCartResultSet(rset);
			}
		} catch (Exception e) {
			throw new CartException("장바구니 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}
		return cart;
	}


	// 핸들러
	
	private ProductExt handleProductResultSet(ResultSet rset) throws SQLException {
		ProductExt product = new ProductExt();
		product.setProductNo(rset.getInt("product_no"));
		product.setProductId(rset.getString("product_id"));
		product.setProductName(rset.getString("product_name"));
		product.setProductPrice(rset.getInt("product_price"));
		product.setSubscriptionPeriod(rset.getInt("subscription_period"));
		return product;
	}
	
	private ProductAttach handleProductAttachResultSet(ResultSet rset) throws SQLException {
		ProductAttach attach = new ProductAttach();
		attach.setOriginalFileName(rset.getString("original_filename"));
		attach.setRenamedFileName(rset.getString("renamed_filename"));
		return attach;
	}
	

	private Cart handleCartResultSet(ResultSet rset) throws SQLException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Cart cart = new Cart();
		cart.setCartNo(rset.getInt("cart_no"));
		cart.setProductNo(rset.getInt("product_no"));
		cart.setMemberId(rset.getString("member_id"));
		cart.setQuantity(rset.getInt("quantity"));	
		if(rset.getDate("first_shipping_date") != null) {
			String tmp = sdf.format(rset.getDate("first_shipping_date"));
			cart.setFirstShipppingDate(tmp);		
		}
		return cart;
	}









	
	
}
