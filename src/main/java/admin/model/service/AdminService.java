package admin.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;

public class AdminService {
	
	public static final int MEMBER_NUM_PER_PAGE = 15;
	private AdminDao adminDao = new AdminDao();
	
	public int getTotalMembers() {
		Connection conn = getConnection();
		int totalMembers = adminDao.getTotalMembers(conn);
		close(conn);
		return totalMembers;
	}

//	public List<Member> findAllMember(Map<String, Object> param) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
