package menu.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import admin.model.dao.AdminDao;
import menu.model.dto.Menu;
import menu.model.dto.MenuAttach;
import menu.model.dto.MenuExt;
import menu.model.exception.MenuException;

public class MenuDao {
	
	private Properties prop = new Properties();
	
	public MenuDao() {
		String filename = MenuDao.class.getResource("/sql/menu-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Menu> findTopNAllMenu(Connection conn, Map<String, Object> param) {
		List<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findTopNAllMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			if (param.get("searchParam") != null) {
				Map<String, Object> searchParam = (Map<String, Object>) param.get("searchParam");
				pstmt.setString(1, "%" + searchParam.get("menuId") + "%");
				pstmt.setString(2, "%" + searchParam.get("menuName") + "%");
			} else {
				pstmt.setString(1, "%");
				pstmt.setString(2, "%");
			}
			pstmt.setInt(3, (int) param.get("start"));
			pstmt.setInt(4, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Menu menu = handleMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new MenuException("젠체 메뉴목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private MenuExt handleMenuResultSet(ResultSet rset) throws SQLException {
		MenuExt menu = new MenuExt();
		menu.setMenuNo(rset.getInt("menu_no"));
		menu.setMenuId(rset.getString("menu_id"));
		menu.setMenuName(rset.getString("menu_Name"));
		menu.setMenuDescription(rset.getString("menu_description"));
		menu.setIngredients(rset.getString("ingredients"));
		menu.setCalorie(rset.getInt("calorie"));
		return menu;
	}

	public int getTotalMenu(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTotalMenu");
		int totalMenu = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalMenu = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new MenuException("전체 메뉴 수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalMenu;
	}

	public List<Menu> findMenuById(Connection conn, String menuId) {
		List<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findMenuById");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menuId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Menu menu = handleMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new MenuException("아이디 일치 메뉴 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertMenu(Connection conn, MenuExt menu) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu.getMenuId());
			pstmt.setString(2, menu.getMenuName());
			pstmt.setString(3, menu.getMenuDescription());
			pstmt.setString(4, menu.getIngredients());
			pstmt.setInt(5, menu.getCalorie());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new MenuException("메뉴 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int findCurrentMenuNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int menuNo = 0;
		String sql = prop.getProperty("findCurrentMenuNo");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next())
				menuNo = rset.getInt(1);
		} catch (Exception e) {
			throw new MenuException("최근 등록 메뉴 고유번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return menuNo;
	}

	public int insertMenuAttach(Connection conn, MenuAttach attach) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMenuAttach");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getMenuNo());
			pstmt.setString(2, attach.getOriginalFileName());
			pstmt.setString(3, attach.getRenamedFileName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new MenuException("메뉴 첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public MenuExt findByMenuNo(Connection conn, int menuNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MenuExt menu = null;
		String sql = prop.getProperty("findByMenuNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				menu = handleMenuResultSet(rset);
			}
		} catch (Exception e) {
			throw new MenuException("메뉴번호를 이용한 메뉴 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return menu;
	}

	public MenuAttach findAttachByMenuNo(Connection conn, int menuNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MenuAttach attach = null;
		String sql = prop.getProperty("findAttachByMenuNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				attach = handleMenuAttachResultSet(rset);
			}
		} catch (Exception e) {
			throw new MenuException("메뉴번호를 이용한 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return attach;
	}

	private MenuAttach handleMenuAttachResultSet(ResultSet rset) throws SQLException {
		MenuAttach attach;
		attach = new MenuAttach();
		attach.setMenuAttachNo(rset.getInt("menu_attach_no"));
		attach.setMenuNo(rset.getInt("menu_no"));
		attach.setOriginalFileName(rset.getString("original_filename"));
		attach.setRenamedFileName(rset.getString("renamed_filename"));
		attach.setRegDate(rset.getDate("reg_date"));
		return attach;
	}

	public int updateMenu(Connection conn, MenuExt menu) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu.getMenuName());
			pstmt.setString(2, menu.getMenuDescription());
			pstmt.setString(3, menu.getIngredients());
			pstmt.setInt(4, menu.getCalorie());
			pstmt.setInt(5, menu.getMenuNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new MenuException("메뉴정보 업데이트 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public MenuAttach findAttachByNo(Connection conn, int menuAttachNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MenuAttach attach = null;
		String sql = prop.getProperty("findAttachByNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuAttachNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				attach = handleMenuAttachResultSet(rset);
			}
		} catch (Exception e) {
			throw new MenuException("고유번호를 이용한 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return attach;
	}

	public int deleteMenuAttach(Connection conn, int menuAttachNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMenuAttach");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuAttachNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new MenuException("첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMenu(Connection conn, int menuNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new MenuException("메뉴정보 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Menu> findSortedAllMenu(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Menu> list = new ArrayList<>();
		String sql = prop.getProperty("findSortedAllMenu");
		if (param.get("sortBy") != null)
			sql = sql.replace("#", (String) param.get("sortBy"));
		try {
			pstmt = conn.prepareStatement(sql);
			if (param.get("searchParam") != null) {
				Map<String, Object> searchParam = (Map<String, Object>) param.get("searchParam");
				pstmt.setString(1, "%" + searchParam.get("menuId") + "%");
				pstmt.setString(2, "%" + searchParam.get("menuName") + "%");
			} else {
				pstmt.setString(1, "%");
				pstmt.setString(2, "%");
			}
			pstmt.setInt(3, (int) param.get("start"));
			pstmt.setInt(4, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Menu menu = handleMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new MenuException("정렬된 메뉴목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getTotalFilteredMenu(Connection conn, Map<String, Object> searchParam) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTotalFilteredMenu");
		int totalMenu = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchParam.get("menuId") + "%");
			pstmt.setString(2, "%" + searchParam.get("menuName") + "%");
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalMenu = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new MenuException("전체 메뉴 수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalMenu;
	}

	public List<Menu> findAllMenu(Connection conn) {
		List<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findAllMenu");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Menu menu = handleMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new MenuException("전체 메뉴 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
