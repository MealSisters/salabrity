package common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 
 * jdbc api 사용간에 공통된 처리를 담당하는 static class 모음 클래스
 *
 */
public class JdbcTemplate {

	static String driverClass; // 드라이버클래스명
	static String url; // 접속할 db서버주소 (db접속프로토콜@ip:port:sid)
	static String user;
	static String password;

	// 프로그램당 최초 1회에 한하여 실행
	static {
		// datasource.properties에서 설정정보 가져오기
		Properties prop = new Properties();
		try {
			// buildpath의 datasource.properties 참조하기
			// getResource의 /(슬래시)는 buildpath(/WEB-INF/classes)
			String fileName = JdbcTemplate.class.getResource("/datasource.properties").getPath();
			// System.out.println("fileName@JdbcTemplate = " + fileName);
			prop.load(new FileReader(fileName));
			
			driverClass = prop.getProperty("driverClass");
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			password = prop.getProperty("password");
			System.out.println("> 설정정보 로드 완료");
			
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		try {
			// 1. drive class 등록
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;

		try {
			// 2. Connection 생성(url, user, password), setAutoCommit(false)
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	//자원반납
	public static void close(Connection conn) {
		try {
			if (conn != null && !conn.isClosed())
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement stmt) {
		try {
			if (stmt != null && !stmt.isClosed())
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rset) {
		try {
			if (rset != null && !rset.isClosed())
				rset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 커밋
	public static void commit(Connection conn) {
		try {
			if (conn != null && !conn.isClosed())
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 롤백
	public static void rollback(Connection conn) {
		try {
			if (conn != null && !conn.isClosed())
				conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
