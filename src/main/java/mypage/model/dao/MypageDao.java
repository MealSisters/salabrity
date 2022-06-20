package mypage.model.dao;

import static common.JdbcTemplate.close;

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

import board.model.dto.BoardCode;
import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
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


	public List<PostingExt> findQuestionList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<PostingExt> list = new ArrayList<>();
		String sql = prop.getProperty("findQuestionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PostingExt posting = new PostingExt();
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
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MypageException("1:1 문의글 조회 오류", e);
		} finally {
			close(pstmt);
		}
		
		return list;
	}


	public int insertQuestion(Connection conn, Posting posting) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, posting.getMemberId());
			pstmt.setString(2, posting.getTitle());
			pstmt.setString(3, posting.getContent());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
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


	public int findCurrentQuestionNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int no = 0;
		String sql = prop.getProperty("findCurrentQuestionNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
				no = rset.getInt(1);
		} catch (SQLException e) {
			throw new MypageException("게시글 번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return no;
	}


	public int insertAttachment(Connection conn, PostingAttach attach) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getPostingNo());
			pstmt.setString(2, attach.getOriginalFilename());
			pstmt.setString(3, attach.getRenamedFilename());
			result = pstmt.executeUpdate();
			System.out.println("제발좀"+result);
		} catch (Exception e) {
			throw new MypageException("첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
		
	}


	public PostingExt findByNo(Connection conn, int no) {
		PostingExt posting = new PostingExt();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			System.out.println("디에이오" + no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				posting.setPostingNo(rset.getInt("posting_no"));
				posting.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
				posting.setMemberId(rset.getString("member_id"));
				posting.setTitle(rset.getString("title"));
				posting.setContent(rset.getString("content"));
				posting.setRegDate(rset.getDate("reg_date"));
				posting.setReadCount(rset.getInt("read_count"));
				posting.setPostingLevel(rset.getInt("posting_level"));
				posting.setPostingRef(rset.getInt("posting_ref"));
				System.out.println("디에이오" + posting);
			}
		} catch (Exception e) {
			throw new MypageException("게시글 한 건 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return posting;
	}


//	private PostingExt handleBoardResultSet(ResultSet rset) throws SQLException {
//		PostingExt posting = new PostingExt();
//		posting.setPostingNo(rset.getInt("posting_no"));
//		posting.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
//		posting.setMemberId(rset.getString("member_id"));
//		posting.setTitle(rset.getString("title"));
//		posting.setContent(rset.getString("content"));
//		posting.setRegDate(rset.getDate("reg_date"));
//		posting.setReadCount(rset.getInt("read_count"));
//		posting.setPostingLevel(rset.getInt("posting_level"));
//		posting.setPostingRef(rset.getInt("posting_ref"));
//		posting.setAttachCount(rset.getInt("attach_count"));
//		posting.setCommentCount(rset.getInt("comment_count"));
//		posting.setLikeCount(rset.getInt("like_count"));
//		return posting;
//	}


	public List<PostingAttach> findAttachmentByNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<PostingAttach> attachments = new ArrayList<>();
		String sql = prop.getProperty("findAttachmentByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			System.out.println("디에이오 첨부파일" + no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingAttach attach = handleAttachmentResultSet(rset);
				attachments.add(attach);
			}
		} catch (Exception e) {
			throw new MypageException("게시글 번호 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return attachments;
	}


	private PostingAttach handleAttachmentResultSet(ResultSet rset) throws SQLException {
		PostingAttach attach = new PostingAttach();
		attach.setPostingAttachNo(rset.getInt("posting_attach_no"));
		attach.setPostingNo(rset.getInt("posting_no"));
		attach.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
		attach.setOriginalFilename(rset.getString("original_filename"));
		attach.setRenamedFilename(rset.getString("renamed_filename"));
		attach.setRegDate(rset.getDate("reg_date"));
		return attach;
	}


	public int deleteQuestion(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new MypageException("게시글 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}


	public PostingExt findByAnswer(Connection conn, int no) {
		PostingExt answer = new PostingExt();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findByAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				answer.setPostingNo(rset.getInt("posting_no"));
				answer.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
				answer.setMemberId(rset.getString("member_id"));
				answer.setTitle(rset.getString("title"));
				answer.setContent(rset.getString("content"));
				answer.setRegDate(rset.getDate("reg_date"));
				answer.setReadCount(rset.getInt("read_count"));
				answer.setPostingLevel(rset.getInt("posting_level"));
				answer.setPostingRef(rset.getInt("posting_ref"));
			}
		} catch (Exception e) {
			throw new MypageException("답변 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return answer;
	}


	public List<Posting> findFaqList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Posting> list = new ArrayList<>();
		String sql = prop.getProperty("findFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Posting p = new Posting();
				p.setPostingNo(rset.getInt("posting_no"));
				p.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
				p.setMemberId(rset.getString("member_id"));
				p.setTitle(rset.getString("title"));
				p.setContent(rset.getString("content"));
				p.setRegDate(rset.getDate("reg_date"));
				p.setReadCount(rset.getInt("read_count"));
				p.setPostingLevel(rset.getInt("posting_level"));
				p.setPostingRef(rset.getInt("posting_ref"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MypageException("faq 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}


	public int faqTotal(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("faqTotal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MypageException("faq 총 게시글 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	

}
