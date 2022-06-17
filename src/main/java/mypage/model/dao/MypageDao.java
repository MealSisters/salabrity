package mypage.model.dao;

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

import static common.JdbcTemplate.close;

import board.model.dto.BoardCode;
import board.model.dto.Posting;
import board.model.dto.PostingExt;
import member.model.dto.Member;
import member.model.exception.MemberException;
import mypage.model.exception.MypageException;

public class MypageDao {
	
	private Properties prop = new Properties();
	
	public MypageDao() {
		String fileName = MypageDao.class.getResource("/sql/mypage-query.properties").getPath();
//		System.out.println("fileName@mypageDao = " + fileName);
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


	public List<Posting> MyWriteList(Connection conn, String memberId, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Posting> list = new ArrayList<>();
		String sql = prop.getProperty("MyWriteList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rset = pstmt.executeQuery();
			// 작성일 조회수
			while(rset.next()) {
				Posting p = new Posting();
				p.setPostingNo(rset.getInt("posting_no"));
				p.setTitle(rset.getString("title"));
				p.setMemberId(rset.getString("member_id"));
				p.setRegDate(rset.getDate("reg_date"));
				p.setReadCount(rset.getInt("read_count"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MypageException("작성글 조회 오류", e);
		} finally {
			close(pstmt);
		}
		
		return list;
	}


	public int MyWriteTotal(Connection conn, String memberId) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("MyWriteTotal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				totalContents = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MypageException("작성글 조회 오류",e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}


	public List<Posting> findBy(Connection conn, String memberId, Map<String, String> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Posting> list = new ArrayList<>();
		String sql = prop.getProperty("findBy");
		sql = sql.replace("#", param.get("searchType"));
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + param.get("searchKeyword") + "%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Posting posting = new Posting();
				posting.setPostingNo(rset.getInt("posting_no"));
				posting.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
				posting.setMemberId(rset.getString("member_id"));
				posting.setTitle(rset.getString("title"));
				posting.setContent(rset.getString("content"));
				posting.setRegDate(rset.getDate("reg_date"));
				posting.setReadCount(rset.getInt("read_count"));
				posting.setPostingLevel(rset.getInt("posting_level"));
				posting.setPostingRef(rset.getInt("posting_ref"));
				list.add(posting);
			}
		} catch (Exception e) {
			throw new MemberException("작성글 검색 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}


	public List<Posting> searchMyWriteList(Connection conn, String memberId, Map<String, String> param, int start, int end) {
		List<Posting> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMyWriteList");
		sql = setSql(sql, param.get("searchType"), param.get("searchKeyword"));
//		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				Posting posting = new Posting();
				posting.setPostingNo(rset.getInt("posting_no"));
				posting.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
				posting.setMemberId(rset.getString("member_id"));
				posting.setTitle(rset.getString("title"));
				posting.setContent(rset.getString("content"));
				posting.setRegDate(rset.getDate("reg_date"));
				posting.setReadCount(rset.getInt("read_count"));
				posting.setPostingLevel(rset.getInt("posting_level"));
				posting.setPostingRef(rset.getInt("posting_ref"));
				list.add(posting);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MypageException("작성 게시글 검색 실패", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	private String setSql(String sql, String searchType, String searchKeyword) {
		switch(searchType) {
		case "member_id"	: sql = sql.replace("#", " member_id like '%"+searchKeyword+"%'"); break;
		case "title"	: sql = sql.replace("#", " title like '%"+searchKeyword+"%'"); break;
		case "content"	: sql = sql.replace("#", " content like '%"+searchKeyword+"%'"); break;
		}
		return sql;
	}


	public int searchMyBoardListCount(Connection conn, String memberId, Map<String, String> param) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMyBoardListCount");
		sql = setSql(sql, param.get("searchType"), param.get("searchKeyword"));
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MypageException("검색 페이지 조회 실패", e);
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}
	
	

}
