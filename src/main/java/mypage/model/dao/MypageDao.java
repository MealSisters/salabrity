package mypage.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static common.JdbcTemplate.close;

import board.model.dto.Posting;
import board.model.dto.PostingExt;
import mypage.model.exception.MypageException;

public class MypageDao {
	
	private Properties prop = new Properties();
	
	public MypageDao() {
		String fileName = MypageDao.class.getResource("/sql/mypage-query.properties").getPath();
		System.out.println("fileName@mypageDao = " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public List<Posting> findQuestionList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Posting> list = new ArrayList<>();
		String sql = prop.getProperty("findQuestionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Posting p = new Posting();
				p.setTitle(rset.getString("title"));
				p.setRegDate(rset.getDate("reg_date"));
				p.setMemberId(rset.getString("member_id"));
				list.add(p);
				System.out.println("dao");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MypageException("1:1 문의글 조회 오류", e);
		} finally {
			close(pstmt);
		}
		
		return list;
	}


	public int insertQuestion(Connection conn, PostingExt posting) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, posting.getBoardCode().toString());
			pstmt.setString(2, posting.getMemberId());
			pstmt.setString(3, posting.getTitle());
			pstmt.setString(4, posting.getContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MypageException("1:1 문의 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

}
