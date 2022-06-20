package product.model.dao;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mypage.model.dto.Destination;
import mypage.model.exception.DestinationException;
import product.model.dto.Product;
import product.model.dto.ProductAttach;
import product.model.dto.ProductExt;
import product.model.dto.ProductMenu;
import product.model.dto.ProductTarget;
import product.model.dto.Thumbnail;
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
	
	private ProductExt handleProductResultSet(ResultSet rset) throws SQLException {
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
				ProductExt product = handleProductResultSet(rset);
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
			System.out.println("product@dao = " + product);
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

	public ProductExt findProductByNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductExt product = null;
		String sql = prop.getProperty("findProductByNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				product = handleProductResultSet(rset);
			}
		} catch (Exception e) {
			throw new ProductException("상품번호를 이용한 상품조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return product;
	}

	public List<ProductAttach> findProductAttachsByProductNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductAttach> list = new ArrayList<>();
		String sql = prop.getProperty("findProductAttachsByProductNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductAttach attach = handleAttachResultSet(rset);
				list.add(attach);
			}
		} catch (Exception e) {
			throw new ProductException("상품번호를 이용한 첨부파일조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private ProductAttach handleAttachResultSet(ResultSet rset) throws SQLException {
		ProductAttach attach = new ProductAttach();
		attach.setProductAttachNo(rset.getInt("product_attach_no"));
		attach.setProductNo(rset.getInt("product_no"));
		attach.setThumbnail(Thumbnail.valueOf(rset.getString("thumbnail")));
		attach.setOriginalFileName(rset.getString("original_filename"));
		attach.setRenamedFileName(rset.getString("renamed_filename"));
		attach.setRegDate(rset.getDate("reg_date"));
		return attach;
	}

	public List<ProductMenu> findProductMenusByProductNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductMenu> list = new ArrayList<>();
		String sql = prop.getProperty("findProductMenusByProductNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductMenu pm = handleProductMenuResultSet(rset);
				list.add(pm);
			}
		} catch (Exception e) {
			throw new ProductException("상품번호를 이용한 상품-메뉴 연결정보 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private ProductMenu handleProductMenuResultSet(ResultSet rset) throws SQLException {
		ProductMenu pm = new ProductMenu();
		pm.setProductNo(rset.getInt("product_no"));
		pm.setMenuNo(rset.getInt("menu_no"));
		return pm;
	}

	public int updateProduct(Connection conn, ProductExt product) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductName());
			pstmt.setString(2, product.getProductTarget().toString());
			pstmt.setString(3, product.getProductdescription());
			pstmt.setInt(4, product.getSubscriptionPeriod());
			pstmt.setInt(5, product.getProductNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("메뉴정보 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteProductMenu(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteProductMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품-메뉴 연결정보 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ProductAttach findAttachByNo(Connection conn, int productAttachNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductAttach attach = new ProductAttach();
		String sql = prop.getProperty("productAttachNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productAttachNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				attach = handleAttachResultSet(rset);
			}
		} catch (SQLException e) {
			throw new ProductException("첨부파일 고유번호를 이용한 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return attach;
	}

	public int deleteProductAttach(Connection conn, int productAttachNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteProductAttach");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productAttachNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateDelflagY(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateDelflagY");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("삭제상품처리 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<ProductExt> findProductsAll(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductExt> list = new ArrayList<>();
		String sql = prop.getProperty("findProductsAllOrderByRegDate");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductExt product = handleProductResultSet(rset);
				list.add(product);
			}
		} catch (Exception e) {
			throw new ProductException("판매중인 상품 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<Integer> findTargetMenuNoByProductNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Integer> targetMenuNoList = new ArrayList<>();
		String sql = prop.getProperty("findTargetMenuNoByProductNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Integer menuNo = rset.getInt("menu_no");
				targetMenuNoList.add(menuNo);
			}
		} catch (Exception e) {
			throw new ProductException("상품번호를 이용한 연결 메뉴번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return targetMenuNoList;
	}
	
	public int deleteCalendarMenu(Connection conn, int productNo, Integer delMenuNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteCalendarMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, delMenuNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("특정 상품의 특정 메뉴연결정보 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*--------------------------------------- 이은지 end ---------------------------------------*/




	public List<ProductExt>findAllProduct(Connection conn) {
		String sql = prop.getProperty("findAllProduct");
		PreparedStatement pstmt = null;
		List<ProductExt> list = new ArrayList<>();
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				List<ProductAttach> attachs = new ArrayList<>();
				ProductExt product = handleProductResultSet(rset);
				ProductAttach attach = handleAttachResultSet(rset);
				attachs.add(attach);
				product.setAttachs(attachs);
				list.add(product);
			}
			System.out.println("Dao@"+ list);
		} catch (Exception e) {
			throw new DestinationException("상품목록 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	/*-------------------------------------- 박수진 start --------------------------------------*/
	public List<ProductExt> findPopularProducts(Connection conn) {
		String sql = prop.getProperty("findPopularProducts");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductExt> productList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				List<ProductAttach> attachments = new ArrayList<>();
				ProductExt product = handleProductResultSet(rset);
				ProductAttach attach = handleAttachResultSet(rset);
				attachments.add(attach);
				product.setAttachs(attachments);
				productList.add(product);
			}
		} catch (Exception e) {
			throw new DestinationException("메인 화면 인기상품 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return productList;
	}
	/*--------------------------------------- 박수진 end ---------------------------------------*/
	
}
