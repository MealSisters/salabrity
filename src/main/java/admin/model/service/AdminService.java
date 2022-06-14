package admin.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import member.model.dto.Member;
import menu.model.dto.Menu;
import menu.model.dto.MenuAttach;
import menu.model.dto.MenuExt;

public class AdminService {

	public static final int MEMBER_NUM_PER_PAGE = 15;
	public static final int MENU_NUM_PER_PAGE = 10;
	private AdminDao adminDao = new AdminDao();

	public int getTotalMembers() {
		Connection conn = getConnection();
		int totalMembers = adminDao.getTotalMembers(conn);
		close(conn);
		return totalMembers;
	}

	public List<Member> findAllMember(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Member> list = adminDao.findAllMember(conn, param);
		close(conn);
		return list;
	}

	public List<Member> findMemberBy(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Member> list = adminDao.findMemberBy(conn, param);
		close(conn);
		return list;
	}

	public int getFilteringMembers(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalMembers = adminDao.getFilteringMembers(conn, param);
		close(conn);
		return totalMembers;
	}

	public int updateMemberRole(Member member) {
		Connection conn = getConnection();
		int result;
		try {
			result = adminDao.updateMemberRole(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int getEnrollMemberByDate(Date date) {
		Connection conn = getConnection();
		int enrollMembers = adminDao.getEnrollMemberByDate(conn, date);
		close(conn);
		return enrollMembers;
	}

	public List<Menu> findAllMenu(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Menu> list = adminDao.findAllMenu(conn, param);
		close(conn);
		return list;
	}

	public int getTotalMenu() {
		Connection conn = getConnection();
		int totalMenu = adminDao.getTotalMenu(conn);
		close(conn);
		return totalMenu;
	}

	public List<Menu> findMenuById(String menuId) {
		Connection conn = getConnection();
		List<Menu> list = adminDao.findMenuById(conn, menuId);
		close(conn);
		return list;
	}

	public int insertMenu(MenuExt menu) {
		Connection conn = getConnection();
		int result;
		try {
			result = adminDao.insertMenu(conn, menu);
			int menuNo = adminDao.findCurrentMenuNo(conn);
			menu.setMenuNo(menuNo);

			MenuAttach attach = menu.getMenuAttach();
			attach.setMenuNo(menuNo);
			result = adminDao.insertMenuAttach(conn, attach);

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
		MenuExt menu = adminDao.findByMenuNo(conn, menuNo);
		MenuAttach attach = adminDao.findAttachByMenuNo(conn, menuNo);
		menu.setMenuAttach(attach);
		close(conn);
		return menu;
	}

	public MenuAttach findAttachByMenuNo(int menuNo) {
		Connection conn = getConnection();
		MenuAttach attach = adminDao.findAttachByMenuNo(conn, menuNo);
		close(conn);
		return attach;
	}

	public int updateMenu(MenuExt menu) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = adminDao.updateMenu(conn, menu);
			
			if(menu.getMenuAttach() != null) {
				result = adminDao.insertMenuAttach(conn, menu.getMenuAttach());
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
		MenuAttach attach = adminDao.findAttachByNo(conn, menuAttachNo);
		close(conn);
		return attach;
	}

	public int deleteMenuAttach(int menuAttachNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = adminDao.deleteMenuAttach(conn, menuAttachNo);
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
			result = adminDao.deleteMenu(conn, menuNo);
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
		List<Menu> list = adminDao.findSortedAllMenu(conn, param);
		close(conn);
		return list;
	}

	public int getTotalFilteredMenu(Map<String, Object> searchParam) {
		Connection conn = getConnection();
		int totalMenu = adminDao.getTotalFilteredMenu(conn, searchParam);
		close(conn);
		return totalMenu;
	}

}
