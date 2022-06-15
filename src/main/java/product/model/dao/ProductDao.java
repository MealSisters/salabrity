package product.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import admin.model.dao.AdminDao;
import product.model.dto.Product;
import product.model.dto.ProductAttach;
import product.model.dto.ProductExt;
import product.model.dto.ProductMenu;
import product.model.dto.ProductTarget;
import product.model.exception.ProductException;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		String filename = ProductDao.class.getResource("/sql/product-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*-------------------------------------- 이은지 start --------------------------------------*/
	
	private ProductExt handelProductResultSet(ResultSet rset) throws SQLException {
		ProductExt product = new ProductExt();
		product.setProductNo(rset.getInt("product_no"));
		product.setProductId(rset.getString("product_id"));
		product.setProductName(rset.getString("product_name"));
		product.setProductPrice(rset.getInt("product_price"));
		product.setProductdescription(rset.getString("product_description"));
		product.setProductTarget(ProductTarget.valueOf(rset.getString("product_target")));
		product.setViews(rset.getInt("views"));
		product.setSalesCnt(rset.getInt("sales_cnt"));
		product.setRegistrationDate(rset.getDate("registration_date"));
		product.setSubscriptionPeriod(rset.getInt("subscription_period"));
		product.setDelFlag(rset.getString("del_flag"));
		return product;
	}
	
	public List<Product> findProductById(Connection conn, String productId) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findProductById");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductExt product = handelProductResultSet(rset);
				list.add(product);
			}
		} catch (Exception e) {
			throw new ProductException("아이디 일치 상품 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertProduct(Connection conn, ProductExt product) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductId());
			pstmt.setString(2, product.getProductName());
			pstmt.setInt(3, product.getProductPrice());
			pstmt.setString(4, product.getProductdescription());
			pstmt.setString(5, product.getProductTarget().toString());
			pstmt.setInt(6, product.getSubscriptionPeriod());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int findCurrentProductNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int productNo = 0;
		String sql = prop.getProperty("findCurrentProductNo");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				productNo = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new ProductException("최근 등록 상품 고유번호 조회 오류", e);
		} finally {
			close(pstmt);
		}
		return productNo;
	}

	public int insertProductAttachment(Connection conn, ProductAttach attach) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertProductAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getProductNo());
			pstmt.setString(2, attach.getThumbnail().toString());
			pstmt.setString(3, attach.getOriginalFileName());
			pstmt.setString(4, attach.getRenamedFileName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품 첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertProductMenu(Connection conn, ProductMenu pm) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertProductMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm.getProductNo());
			pstmt.setInt(2, pm.getMenuNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("메뉴-상품 연결정보 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/*--------------------------------------- 이은지 end ---------------------------------------*/

}
