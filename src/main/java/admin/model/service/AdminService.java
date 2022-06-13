package admin.model.service;

import static common.JdbcTemplate.*;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import member.model.dto.Member;

public class AdminService {
	
	public static final int MEMBER_NUM_PER_PAGE = 15;
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

}
