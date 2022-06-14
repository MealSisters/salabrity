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
import product.model.dto.ProductExt;
import product.model.dto.ProductTarget;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		String filename = AdminDao.class.getResource("/sql/product-query.properties").getPath();
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
	
	
	/*--------------------------------------- 이은지 end ---------------------------------------*/

}
