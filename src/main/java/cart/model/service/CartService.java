package cart.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import cart.model.dao.CartDao;
import cart.model.dto.Cart;
import product.model.dto.ProductExt;


public class CartService {
	private CartDao cartDao =  new CartDao();

	public int cartInsert(Cart cart) {
		Connection conn = getConnection();
		int result = 0;
		int findByIdIdenticalProductCount = 0;
		try {
			String isDefault = "N";
			//장바구니에 동일 상품 개수 요청
			findByIdIdenticalProductCount = cartDao.findByIdIdenticalProductCount(conn, cart);
			//없으면 장바구니에 추가요청 있으면 리턴

			if(findByIdIdenticalProductCount == 0) {
				result = cartDao.cartInsert(conn, cart);
			}

			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Map<String, Object> findByIdCart(String memberId) {
		Connection conn = getConnection();
		Map<String, Object> map = cartDao.findByIdCart(conn, memberId);
		System.out.println("Service@" + map);
		close(conn);
		return map;

	}
	//수량업데이트 
	public int cartQuantityUpdate(Cart cart) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = cartDao.cartQuantityUpdate(conn, cart);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	//선택배송일 업데이트
	public int firstShippingDateUpdate(Cart cart) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = cartDao.firstShippingDateUpdate(conn, cart);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	//선택삭제

	public int deleteByCartNo(int cartNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = cartDao.deleteByCartNo(conn, cartNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	// 전체삭제

	public int deleteByMemberId(String memberId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = cartDao.deleteBymemberId(conn, memberId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


}

