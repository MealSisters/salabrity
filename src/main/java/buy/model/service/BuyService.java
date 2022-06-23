package buy.model.service;

import static common.JdbcTemplate.*;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import buy.model.dao.BuyDao;
import buy.model.dto.BuyExt;
import buy.model.dto.ProductBuyExt;

public class BuyService {

	private BuyDao buyDao = new BuyDao();

	/*-------------------------------------- 이은지 start --------------------------------------*/

	public List<BuyExt> findAllBuyExt(Map<String, Object> param) {
		Connection conn = getConnection();
		List<BuyExt> list = buyDao.findAllBuyExt(conn, param);
		close(conn);
		return list;
	}

	public int getTotalBuys() {
		Connection conn = getConnection();
		int totalBuys = buyDao.getTotalBuys(conn);
		close(conn);
		return totalBuys;
	}

	public List<ProductBuyExt> findProductBuyExtByUid(Long merchantUid) {
		Connection conn = getConnection();
		List<ProductBuyExt> list = buyDao.findProductBuyExtByUid(conn, merchantUid);
		close(conn);
		return list;
	}

	public List<BuyExt> findBuyByParam(Map<String, Object> searchParam) {
		Connection conn = getConnection();
		List<BuyExt> list = buyDao.findBuyByParam(conn, searchParam);
		close(conn);
		return list;
	}

	public int getFilteringBuy(Map<String, Object> searchParam) {
		Connection conn = getConnection();
		int totalBuys = buyDao.getFilteringBuy(conn, searchParam);
		close(conn);
		return totalBuys;
	}

	public int insertBuy(BuyExt buy) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = buyDao.insertBuy(conn, buy);
			List<ProductBuyExt> list = buy.getList();
			for(ProductBuyExt pbe : list) {
				result = buyDao.insertProductBuy(conn, pbe);
				result = buyDao.deleteCart(conn, buy.getMemberId(), pbe);
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

	/*--------------------------------------- 이은지 end ---------------------------------------*/
	
	
	public List<BuyExt> findBuyExtById(String memberId) {
		Connection conn = getConnection();
		List<BuyExt> list = buyDao.findBuyById(conn, memberId);
		for(BuyExt buy : list) {
			Long merchantUid = buy.getMerchantUid();
			List<ProductBuyExt> productBuyList = buyDao.findProductBuyExtByUid(conn, merchantUid);
			buy.setList(productBuyList);
		}
		close(conn);
		return list;
	}

	public List<BuyExt> findBuyByMerchantUid(Long merchantUid) {
		Connection conn = getConnection();
		List<BuyExt> list = buyDao.findBuyByMerchantUid(conn, merchantUid);
		for(BuyExt buy : list) {
			List<ProductBuyExt> productBuyList = buyDao.findProductBuyExtByUid(conn, merchantUid);
			buy.setList(productBuyList);
		}
		close(conn);
		return list;
	}
}
