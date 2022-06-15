package product.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import product.model.dao.ProductDao;
import product.model.dto.Product;
import product.model.dto.ProductAttach;
import product.model.dto.ProductExt;
import product.model.dto.ProductMenu;

public class ProductService {

	private ProductDao productDao = new ProductDao();

	/*-------------------------------------- 이은지 start --------------------------------------*/
	public List<Product> findProductById(String productId) {
		Connection conn = getConnection();
		List<Product> list = productDao.findProductById(conn, productId);
		close(conn);
		return list;
	}

	public int insertProduct(ProductExt product) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = productDao.insertProduct(conn, product);
			int productNo = productDao.findCurrentProductNo(conn);
			product.setProductNo(productNo);

			List<ProductAttach> attachs = product.getAttachs();
			if (attachs != null && !attachs.isEmpty()) {
				for (ProductAttach attach : attachs) {
					attach.setProductNo(productNo);
					result = productDao.insertProductAttachment(conn, attach);
				}
			}
			List<ProductMenu> menuList = product.getMenus();
			if (menuList != null && !menuList.isEmpty()) {
				for (ProductMenu pm : menuList) {
					pm.setProductNo(productNo);
					result = productDao.insertProductMenu(conn, pm);
				}
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
}
