package product.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import product.model.dao.ProductDao;
import product.model.dto.Product;

public class ProductService {

	private ProductDao productDao = new ProductDao();

	/*-------------------------------------- 이은지 start --------------------------------------*/
	public List<Product> findProductById(String productId) {
		Connection conn = getConnection();
		List<Product> list = productDao.findProductById(conn, productId);
		close(conn);
		return list;
	}
	
	/*--------------------------------------- 이은지 end ---------------------------------------*/
}
