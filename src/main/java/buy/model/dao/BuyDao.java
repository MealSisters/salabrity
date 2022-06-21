package buy.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import admin.model.dao.AdminDao;
import buy.model.dto.Buy;
import buy.model.dto.BuyExt;
import buy.model.dto.PayStatement;
import buy.model.dto.ProductBuyExt;
import buy.model.exception.BuyException;
import member.model.dto.MemberRole;

public class BuyDao {

	private Properties prop = new Properties();

	public BuyDao() {
		String filename = AdminDao.class.getResource("/sql/buy-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*-------------------------------------- 이은지 start --------------------------------------*/

	public List<BuyExt> findAllBuyExt(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<BuyExt> list = new ArrayList<>();
		String sql = prop.getProperty("findAllBuy");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				BuyExt buy = handleBuyExtResultSet(rset);
				list.add(buy);
			}
		} catch (Exception e) {
			throw new BuyException("전체 구매정보목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private BuyExt handleBuyExtResultSet(ResultSet rset) throws SQLException {
		BuyExt buy = new BuyExt();
		buy.setMerchantUid(rset.getLong("merchant_uid"));
		buy.setMemberId(rset.getString("member_id"));
		buy.setShippingAddressNo(rset.getInt("shipping_address_no"));
		buy.setPayMethod(rset.getString("pay_method"));
		buy.setAmount(rset.getInt("amount"));
		buy.setBuyerEmail(rset.getString("buyer_email"));
		buy.setBuyerName(rset.getString("buyer_name"));
		buy.setBuyerTel(rset.getString("buyer_tel"));
		buy.setBuyerAddr(rset.getString("buyer_addr"));
		buy.setBuyerPostcode(rset.getString("buyer_postcode"));
		buy.setPaymentDate(rset.getDate("payment_date"));
		buy.setBuyDate(rset.getDate("buy_date"));
		buy.setImpUid(rset.getString("imp_uid"));
		buy.setPayStatement(PayStatement.valueOf(rset.getString("pay_statement")));
		buy.setRequestTerm(rset.getString("request_term"));
		return buy;
	}

	public int getTotalBuys(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalBuys = 0;
		String sql = prop.getProperty("getTotalBuys");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalBuys = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new BuyException("전체 구매정보 수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalBuys;
	}

	public List<ProductBuyExt> findProductBuyExtByUid(Connection conn, Long merchantUid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductBuyExt> list = new ArrayList<>();
		String sql = prop.getProperty("findProductBuyExtByUid");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, merchantUid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductBuyExt pb = handleProductBuyExtResultSet(rset);
				list.add(pb);
			}
		} catch (Exception e) {
			throw new BuyException("구매번호를 이용한 구매상품목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private ProductBuyExt handleProductBuyExtResultSet(ResultSet rset) throws SQLException {
		ProductBuyExt pbe = new ProductBuyExt();

		pbe.setProductBuyNo(rset.getInt("product_buy_no"));
		pbe.setProductNo(rset.getInt("product_no"));
		pbe.setMerchantUid(rset.getLong("merchant_uid"));
		pbe.setQuantity(rset.getInt("quantity"));
		pbe.setFirstShippingDate(rset.getDate("first_shipping_date"));
		pbe.setCancelFlag(rset.getString("cancel_flag"));

		pbe.setProductId(rset.getString("product_id"));
		pbe.setProductName(rset.getString("product_name"));
		pbe.setProductPrice(rset.getInt("product_price"));
		pbe.setSalesCnt(rset.getInt("sales_cnt"));
		pbe.setSubscriptionPeriod(rset.getInt("subscription_period"));

		return pbe;
	}

	public List<BuyExt> findBuyByParam(Connection conn, Map<String, Object> searchParam) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<BuyExt> list = new ArrayList<>();
		String sql = prop.getProperty("findBuyByParam");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchParam.get("merchantUid").toString() + "%");
			pstmt.setString(2, "%" + searchParam.get("memberId").toString() + "%");
			if (searchParam.get("orderDateStart") != null) {
				pstmt.setDate(3, Date.valueOf(searchParam.get("orderDateStart").toString()));
			} else {
				pstmt.setDate(3, Date.valueOf("1000-01-01"));
			}
			if (searchParam.get("orderDateEnd") != null) {
				pstmt.setDate(4, Date.valueOf(searchParam.get("orderDateEnd").toString()));
			} else {
				pstmt.setDate(4, Date.valueOf("5000-01-01"));
			}
			if (searchParam.get("payStatement") != null) {
				pstmt.setString(5, searchParam.get("payStatement").toString());
				pstmt.setString(6, "");
				pstmt.setString(7, "");
				pstmt.setString(8, "");
			} else {
				pstmt.setString(5, PayStatement.cancelled.toString());
				pstmt.setString(6, PayStatement.faild.toString());
				pstmt.setString(7, PayStatement.paid.toString());
				pstmt.setString(8, PayStatement.ready.toString());
			}
			pstmt.setInt(9, (int) searchParam.get("start"));
			pstmt.setInt(10, (int) searchParam.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				BuyExt buy = handleBuyExtResultSet(rset);
				list.add(buy);
			}
		} catch (Exception e) {
			throw new BuyException("구매정보 검색결과 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getFilteringBuy(Connection conn, Map<String, Object> searchParam) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalBuys = 0;
		String sql = prop.getProperty("getFilteringBuy");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchParam.get("merchantUid").toString() + "%");
			pstmt.setString(2, "%" + searchParam.get("memberId").toString() + "%");
			if (searchParam.get("orderDateStart") != null) {
				pstmt.setDate(3, Date.valueOf(searchParam.get("orderDateStart").toString()));
			} else {
				pstmt.setDate(3, Date.valueOf("1000-01-01"));
			}
			if (searchParam.get("orderDateEnd") != null) {
				pstmt.setDate(4, Date.valueOf(searchParam.get("orderDateEnd").toString()));
			} else {
				pstmt.setDate(4, Date.valueOf("5000-01-01"));
			}
			if (searchParam.get("payStatement") != null) {
				pstmt.setString(5, searchParam.get("payStatement").toString());
				pstmt.setString(6, "");
				pstmt.setString(7, "");
				pstmt.setString(8, "");
			} else {
				pstmt.setString(5, PayStatement.cancelled.toString());
				pstmt.setString(6, PayStatement.faild.toString());
				pstmt.setString(7, PayStatement.paid.toString());
				pstmt.setString(8, PayStatement.ready.toString());
			}
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalBuys = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new BuyException("구매정보 검색결과 수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalBuys;
	}

	public int insertBuy(Connection conn, BuyExt buy) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBuy");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, buy.getMerchantUid());
			pstmt.setString(2, buy.getMemberId());
			pstmt.setInt(3, buy.getShippingAddressNo());
			pstmt.setString(4, buy.getPayMethod());
			pstmt.setInt(5, buy.getAmount());
			pstmt.setString(6, buy.getBuyerEmail());
			pstmt.setString(7, buy.getBuyerName());
			pstmt.setString(8, buy.getBuyerTel());
			pstmt.setString(9, buy.getBuyerAddr());
			pstmt.setString(10, buy.getBuyerPostcode());
			pstmt.setDate(11, buy.getPaymentDate());
			pstmt.setDate(12, buy.getBuyDate());
			pstmt.setString(13, buy.getImpUid());
			pstmt.setString(14, buy.getPayStatement().toString());
			pstmt.setString(15, buy.getRequestTerm());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BuyException("구매정보 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertProductBuy(Connection conn, ProductBuyExt pbe) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertProductBuy");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pbe.getProductNo());
			pstmt.setLong(2, pbe.getMerchantUid());
			pstmt.setInt(3, pbe.getQuantity());
			pstmt.setDate(4, pbe.getFirstShippingDate());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BuyException("구매상품정보 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCart(Connection conn, String memberId, ProductBuyExt pbe) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteCart");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, pbe.getProductNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BuyException("장바구니 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*--------------------------------------- 이은지 end ---------------------------------------*/
}
