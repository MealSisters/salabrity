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
				Member member = handleMemberResultSet(rset);
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

	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
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
				Member member = handleMemberResultSet(rset);
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
			while (rset.next()) {
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

	

}
