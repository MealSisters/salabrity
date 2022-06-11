package admin.model.dao;

import static common.JdbcTemplate.close;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import admin.model.exception.AdminException;

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
			while(rset.next()) {
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

}
