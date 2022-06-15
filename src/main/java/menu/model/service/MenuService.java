package menu.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import menu.model.dao.MenuDao;
import menu.model.dto.Menu;
import menu.model.dto.MenuAttach;
import menu.model.dto.MenuExt;

public class MenuService {
	
	public static final int MENU_NUM_PER_PAGE = 10;
	private MenuDao menuDao = new MenuDao();
	
	public List<Menu> findTopNAllMenu(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Menu> list = menuDao.findTopNAllMenu(conn, param);
		close(conn);
		return list;
	}

	public int getTotalMenu() {
		Connection conn = getConnection();
		int totalMenu = menuDao.getTotalMenu(conn);
		close(conn);
		return totalMenu;
	}

	public List<Menu> findMenuById(String menuId) {
		Connection conn = getConnection();
		List<Menu> list = menuDao.findMenuById(conn, menuId);
		close(conn);
		return list;
	}

	public int insertMenu(MenuExt menu) {
		Connection conn = getConnection();
		int result;
		try {
			result = menuDao.insertMenu(conn, menu);
			int menuNo = menuDao.findCurrentMenuNo(conn);
			menu.setMenuNo(menuNo);

			MenuAttach attach = menu.getMenuAttach();
			attach.setMenuNo(menuNo);
			result = menuDao.insertMenuAttach(conn, attach);

			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public MenuExt findByMenuNo(int menuNo) {
		Connection conn = getConnection();
		MenuExt menu = menuDao.findByMenuNo(conn, menuNo);
		MenuAttach attach = menuDao.findAttachByMenuNo(conn, menuNo);
		menu.setMenuAttach(attach);
		close(conn);
		return menu;
	}

	public MenuAttach findAttachByMenuNo(int menuNo) {
		Connection conn = getConnection();
		MenuAttach attach = menuDao.findAttachByMenuNo(conn, menuNo);
		close(conn);
		return attach;
	}

	public int updateMenu(MenuExt menu) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = menuDao.updateMenu(conn, menu);

			if (menu.getMenuAttach() != null) {
				result = menuDao.insertMenuAttach(conn, menu.getMenuAttach());
			}
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public MenuAttach findAttachByNo(int menuAttachNo) {
		Connection conn = getConnection();
		MenuAttach attach = menuDao.findAttachByNo(conn, menuAttachNo);
		close(conn);
		return attach;
	}

	public int deleteMenuAttach(int menuAttachNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = menuDao.deleteMenuAttach(conn, menuAttachNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteMenu(int menuNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = menuDao.deleteMenu(conn, menuNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public List<Menu> findSortedAllMenu(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Menu> list = menuDao.findSortedAllMenu(conn, param);
		close(conn);
		return list;
	}

	public int getTotalFilteredMenu(Map<String, Object> searchParam) {
		Connection conn = getConnection();
		int totalMenu = menuDao.getTotalFilteredMenu(conn, searchParam);
		close(conn);
		return totalMenu;
	}

	public List<Menu> findAllMenu() {
		Connection conn = getConnection();
		List<Menu> list = menuDao.findAllMenu(conn);
		close(conn);
		return list;
	}
}
