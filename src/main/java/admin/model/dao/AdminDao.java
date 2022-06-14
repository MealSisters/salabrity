package admin.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import admin.model.exception.AdminException;
import member.model.dto.Member;
import member.model.dto.MemberRole;
import menu.model.dto.Menu;
import menu.model.dto.MenuAttach;
import menu.model.dto.MenuExt;

public class AdminDao {

	private Properties prop = new Properties();

	public AdminDao() {
		String filename = AdminDao.class.getResource("/sql/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getTotalMembers(Connection conn) {
		int totalMembers = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTotalMembers");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalMembers = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("전체 회원수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalMembers;
	}

	public List<Member> findAllMember(Connection conn, Map<String, Object> param) {
		List<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findAllMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = handelMemberResultSet(rset);
				list.add(member);
			}
		} catch (Exception e) {
			throw new AdminException("전체 회원목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private Member handelMemberResultSet(ResultSet rset) throws SQLException {
		Member member = new Member();
		member.setMemberId(rset.getString("member_id"));
		member.setPassword(rset.getString("password"));
		member.setMemberName(rset.getString("member_name"));
		member.setGender(rset.getString("gender"));
		member.setBirthday(rset.getDate("birthday"));
		member.setEmail(rset.getString("email"));
		member.setPhone(rset.getString("phone"));
		member.setZipcode(rset.getString("zipcode"));
		member.setAddress(rset.getString("address"));
		member.setAddressDetail(rset.getString("address_detail"));
		member.setEnrollDate(rset.getDate("enroll_date"));
		member.setMemberRole(MemberRole.valueOf(rset.getString("member_role")));
		return member;
	}

	public List<Member> findMemberBy(Connection conn, Map<String, Object> param) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findMemberBy");
		try {
			pstmt = conn.prepareStatement(sql);
			if (!param.get("memberRole").equals("all")) {
				pstmt.setString(1, param.get("memberRole").toString());
				pstmt.setString(2, "");
			} else {
				pstmt.setString(1, MemberRole.A.toString());
				pstmt.setString(2, MemberRole.U.toString());
			}
			pstmt.setString(3, "%" + param.get("memberId").toString() + "%");
			pstmt.setString(4, "%" + param.get("memberName").toString() + "%");
			if (!param.get("gender").equals("all")) {
				pstmt.setString(5, param.get("gender").toString());
				pstmt.setString(6, "");
			} else {
				pstmt.setString(5, "F");
				pstmt.setString(6, "M");
			}
			pstmt.setString(7, "%" + param.get("phone").toString() + "%");
			pstmt.setInt(8, (int) param.get("start"));
			pstmt.setInt(9, (int) param.get("end"));

			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = handelMemberResultSet(rset);
				list.add(member);
			}

		} catch (Exception e) {
			throw new AdminException("회원 검색결과 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getFilteringMembers(Connection conn, Map<String, Object> param) {
		int totalMembers = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getFilteringMembers");
		try {
			pstmt = conn.prepareStatement(sql);
			if (!param.get("memberRole").equals("all")) {
				pstmt.setString(1, param.get("memberRole").toString());
				pstmt.setString(2, "");
			} else {
				pstmt.setString(1, MemberRole.A.toString());
				pstmt.setString(2, MemberRole.U.toString());
			}
			pstmt.setString(3, "%" + param.get("memberId").toString() + "%");
			pstmt.setString(4, "%" + param.get("memberName").toString() + "%");
			if (!param.get("gender").equals("all")) {
				pstmt.setString(5, param.get("gender").toString());
				pstmt.setString(6, "");
			} else {
				pstmt.setString(5, "F");
				pstmt.setString(6, "M");
			}
			pstmt.setString(7, "%" + param.get("phone").toString() + "%");

			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalMembers = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("검색결과 회원수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalMembers;
	}

	public int updateMemberRole(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMemberRole");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberRole().toString());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new AdminException("회원 권한 변경 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getEnrollMemberByDate(Connection conn, Date date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getEnrollMemberByDate");
		int enrollMembers = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, date);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				enrollMembers = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("가입일 기준 회원 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return enrollMembers;
	}

	public List<Menu> findAllMenu(Connection conn, Map<String, Object> param) {
		List<Menu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findAllMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Menu menu = handelMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new AdminException("젠체 메뉴목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private MenuExt handelMenuResultSet(ResultSet rset) throws SQLException {
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
			throw new AdminException("전체 메뉴 수 조회 오류", e);
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
			while(rset.next()) {
				Menu menu = handelMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new AdminException("아이디 일치 메뉴 조회 오류", e);
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
			throw new AdminException("메뉴 등록 오류", e);
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
			throw new AdminException("최근 등록 메뉴 고유번호 조회 오류", e);
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
			throw new AdminException("메뉴 첨부파일 등록 오류", e);
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
				menu = handelMenuResultSet(rset);
			}
		} catch (Exception e) {
			throw new AdminException("메뉴번호를 이용한 메뉴 조회 오류", e);
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
			while(rset.next()) {
				attach = handelMenuAttachResultSet(rset);
			}
		} catch (Exception e) {
			throw new AdminException("메뉴번호를 이용한 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return attach;
	}

	private MenuAttach handelMenuAttachResultSet(ResultSet rset) throws SQLException {
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
			throw new AdminException("메뉴정보 업데이트 오류", e);
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
			while(rset.next()) {
				attach = handelMenuAttachResultSet(rset);
			}
		} catch (Exception e) {
			throw new AdminException("고유번호를 이용한 첨부파일 조회 오류", e);
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
			throw new AdminException("첨부파일 삭제 오류", e);
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
			throw new AdminException("메뉴정보 삭제 오류", e);
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
		if(!"menu_no".equals((String) param.get("sortBy")))
			sql = sql.replace("#", (String) param.get("sortBy"));
		else
			sql = prop.getProperty("findAllMenu");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Menu menu = handelMenuResultSet(rset);
				list.add(menu);
			}
		} catch (Exception e) {
			throw new AdminException("정렬된 메뉴목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
