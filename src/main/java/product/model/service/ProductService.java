package product.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
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

	public ProductExt findProductByNo(int productNo) {
		Connection conn = getConnection();
		ProductExt product = productDao.findProductByNo(conn, productNo);
		List<ProductAttach> attachs = productDao.findProductAttachsByProductNo(conn, productNo);
		List<ProductMenu> menus = productDao.findProductMenusByProductNo(conn, productNo);
		product.setAttachs(attachs);
		product.setAttachCount(attachs.size());
		product.setMenus(menus);

		close(conn);
		return product;
	}

	public int updateProduct(ProductExt product) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = productDao.updateProduct(conn, product);

			List<ProductAttach> attachs = product.getAttachs();
			if (attachs != null && !attachs.isEmpty()) {
				for (ProductAttach attach : attachs) {
					result = productDao.insertProductAttachment(conn, attach);
				}
			}

			List<Integer> newMenuNums = new ArrayList<>();
			List<Integer> delMenuNums = productDao.findTargetMenuNoByProductNo(conn, product.getProductNo());
			
			result = productDao.deleteProductMenu(conn, product.getProductNo());
			List<ProductMenu> menuList = product.getMenus();
			if (menuList != null && !menuList.isEmpty()) {
				for (ProductMenu pm : menuList) {
					newMenuNums.add(pm.getMenuNo());
					result = productDao.insertProductMenu(conn, pm);
				}
			}

			for (Integer delMenuNo : delMenuNums) {
				if (!newMenuNums.contains(delMenuNo)) {
					result = productDao.deleteCalendarMenu(conn, product.getProductNo(), delMenuNo);
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

	public ProductAttach findAttachByNo(int productAttachNo) {
		Connection conn = getConnection();
		ProductAttach attach = productDao.findAttachByNo(conn, productAttachNo);
		close(conn);
		return attach;
	}

	public int deleteProductAttach(int productAttachNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = productDao.deleteProductAttach(conn, productAttachNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);			
		}
		return result;
	}

	public List<ProductAttach> findProductAttachsByProductNo(int productNo) {
		Connection conn = getConnection();
		List<ProductAttach> attachs = productDao.findProductAttachsByProductNo(conn, productNo);
		close(conn);
		return attachs;
	}

	public int deleteProduct(int productNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			// 첨부파일은 남겨두기
			result = productDao.updateDelflagY(conn, productNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public List<ProductExt> findProductsAll() {
		Connection conn = getConnection();
		List<ProductExt> list = productDao.findProductsAll(conn);
		close(conn);
		return list;
	}
	
	/*--------------------------------------- 이은지 end ---------------------------------------*/
	public List<ProductExt> findAllProduct() {
		Connection conn = getConnection();
		List<ProductExt> list = productDao.findAllProduct(conn);
		System.out.println("Service@"+list);
		close(conn);
		return list;
	}
	
	
	
}
