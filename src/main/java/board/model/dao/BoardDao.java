package board.model.dao;

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

import board.model.dto.BoardCode;
import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.PostingComment;
import board.model.dto.PostingExt;
import board.model.dto.PostingLike;
import board.model.exception.BoardException;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board-query.properties").getPath();
		System.out.println("fileName@BoardDao = " + fileName);
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 게시판 목록 조회 - 페이징 처리
	 * @param conn
	 * @param param
	 * @return
	 */
	public List<PostingExt> findAllPostingList(Connection conn, Map<String, Object> param, BoardCode boardCode) {
		String sql = prop.getProperty("findAllPostingList");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<PostingExt> postingList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardCode.toString());
			pstmt.setInt(2, (int) param.get("start"));
			pstmt.setInt(3, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingExt posting = handlePostingResultSet(rset);
				posting.setAttachCount(rset.getInt("attach_count")); // 첨부파일 개수
				posting.setCommentCount(rset.getInt("comment_count")); // 댓글 개수
				posting.setLikeCount(rset.getInt("like_count")); // 좋아요 개수
				postingList.add(posting);
			}
		} catch (Exception e) {
			throw new BoardException("게시판 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return postingList;
	}
	
	/**
	 * 게시글 ResultSet 관리
	 * @param rset
	 * @return
	 * @throws SQLException 
	 */
	private PostingExt handlePostingResultSet(ResultSet rset) throws SQLException {
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
		posting.setAttachCount(rset.getInt("attach_count"));
		posting.setCommentCount(rset.getInt("comment_count"));
		posting.setLikeCount(rset.getInt("like_count"));
		return posting;
	}

	/**
	 * 전체 게시글 수 조회
	 * @param conn
	 * @return
	 */
	public int getTotalPostings(Connection conn, BoardCode boardCode) {
		String sql = prop.getProperty("getTotalPostings");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int getTotalPostings = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardCode.toString());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				getTotalPostings = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new BoardException("전체 게시글 수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return getTotalPostings;
	}

	/**
	 * 게시글 등록
	 * @param conn
	 * @param posting
	 * @return
	 */
	public int insertPosting(Connection conn, Posting posting) {
		String sql = prop.getProperty("insertPosting");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, posting.getBoardCode().toString());
			pstmt.setString(2, posting.getMemberId());
			pstmt.setString(3, posting.getTitle());
			pstmt.setString(4, posting.getContent());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("게시글 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 게시글 번호 조회
	 * @param conn
	 * @return
	 */
	public int findCurrentPostingNo(Connection conn) {
		String sql = prop.getProperty("findCurrentPostingNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int no = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				no = rset.getInt(1);				
			}
		} catch (Exception e) {
			throw new BoardException("게시글 번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return no;
	}

	/**
	 * 첨부파일 등록
	 * @param conn
	 * @param attach
	 * @return
	 */
	public int insertPostingAttach(Connection conn, PostingAttach attach) {
		String sql = prop.getProperty("insertPostingAttach");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getPostingNo());
			pstmt.setString(2, attach.getBoardCode().toString());
			pstmt.setString(3, attach.getOriginalFilename());
			pstmt.setString(4, attach.getRenamedFilename());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글 한 건 조회 - posting테이블의 posting_no컬럼
	 * @param conn
	 * @param no
	 * @param boardCode 
	 * @return
	 */
	public PostingExt findByPostingNo(Connection conn, int no) {
		String sql = prop.getProperty("findByPostingNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PostingExt posting = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				posting = handlePostingResultSet(rset);
			}
		} catch (Exception e) {
			throw new BoardException("게시글 한 건 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return posting;
	}

	/**
	 * 첨부파일 조회 - posting_attach테이블의 posting_no컬럼
	 * @param conn
	 * @param no
	 * @param boardCode 
	 * @return
	 */
	public List<PostingAttach> findPostingAttachByPostingNo(Connection conn, int no) {
		String sql = prop.getProperty("findPostingAttachByPostingNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<PostingAttach> attachments = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingAttach attach = handlePostingAttachResultSet(rset);
				attachments.add(attach);
			}
		} catch (Exception e) {
			throw new BoardException("게시글 번호에 의한 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return attachments;
	}

	/**
	 * 첨부파일 ResultSet 관리
	 * @param rset
	 * @return
	 * @throws SQLException 
	 */
	private PostingAttach handlePostingAttachResultSet(ResultSet rset) throws SQLException {
		PostingAttach attach = new PostingAttach();
		attach.setPostingAttachNo(rset.getInt("posting_attach_no"));
		attach.setPostingNo(rset.getInt("posting_no"));
		attach.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
		attach.setOriginalFilename(rset.getString("original_filename"));
		attach.setRenamedFilename(rset.getString("renamed_filename"));
		attach.setRegDate(rset.getDate("reg_date"));
		return attach;
	}

	/**
	 * 댓글 목록 조회 - posting_comment테이블의 posting_no컬럼
	 * @param conn
	 * @param no
	 * @param boardCode 
	 * @return
	 */
	public List<PostingComment> findPostingCommentByPostingNo(Connection conn, int no) {
		String sql = prop.getProperty("findPostingCommentByPostingNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		List<PostingComment> comments = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingComment pc = handlePostingCommentResultSet(rset);
				comments.add(pc);
			}
		} catch (Exception e) {
			throw new BoardException("댓글 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return comments;
	}

	/**
	 * 댓글 ResultSet 관리
	 * @param rset
	 * @return
	 * @throws SQLException 
	 */
	private PostingComment handlePostingCommentResultSet(ResultSet rset) throws SQLException {
		PostingComment pc = new PostingComment();
		pc.setCommentNo(rset.getInt("comment_no"));
		pc.setPostingNo(rset.getInt("posting_no"));
		pc.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
		pc.setMemberId(rset.getString("member_id"));
		pc.setCommentContent(rset.getString("comment_content"));
		pc.setCommentLevel(rset.getInt("comment_level"));
		pc.setCommentRef(rset.getInt("comment_ref"));
		pc.setRegDate(rset.getDate("reg_date"));
		return pc;
	}
	

	/**
	 * 좋아요 목록 조회 - posting_like테이블의 posting_no컬럼
	 * @param conn
	 * @param no
	 * @return
	 */
	public List<PostingLike> findPostingLikeByPostingNo(Connection conn, int no) {
		String sql = prop.getProperty("findPostingLikeByPostingNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		List<PostingLike> likes = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingLike like = handlePostingLikeResultSet(rset);
				likes.add(like);
			}
		} catch (Exception e) {
			throw new BoardException("좋아요 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return likes;
	}

	/**
	 * 좋아요 ResultSet 관리
	 * @param rset
	 * @return
	 * @throws SQLException 
	 */
	private PostingLike handlePostingLikeResultSet(ResultSet rset) throws SQLException {
		PostingLike like = new PostingLike();
		like.setPostingNo(rset.getInt("posting_no"));
		like.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
		like.setMemberId(rset.getString("member_id"));
		like.setStatus(rset.getString("status"));
		return like;
	}

	/**
	 * 조회수 증가
	 * @param conn
	 * @param no
	 * @return
	 */
	public int updateReadCount(Connection conn, int no) {
		String sql = prop.getProperty("updateReadCount");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("조회수 증가처리 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 첨부파일 한 건 조회
	 * @param conn
	 * @param no
	 * @return
	 */
	public PostingAttach findPostingAttachByPostingAttachNo(Connection conn, int no) {
		String sql = prop.getProperty("findPostingAttachByPostingAttachNo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PostingAttach attach = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				attach = handlePostingAttachResultSet(rset);
			}
		} catch (Exception e) {
			throw new BoardException("첨부파일 한 건 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return attach;
	}

	/**
	 * 게시판 카테고리 조회
	 * @param conn
	 * @param no 
	 * @return
	 */
	public BoardCode findCurrentBoardCode(Connection conn, int no) {
		String sql = prop.getProperty("findCurrentBoardCode");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardCode boardCode = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				boardCode = BoardCode.valueOf(rset.getString("board_code"));
			}
		} catch (Exception e) {
			throw new BoardException("게시판 카테고리 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return boardCode;
	}

	/**
	 * 게시글 삭제
	 * @param conn
	 * @param no
	 * @return
	 */
	public int deletePosting(Connection conn, int no) {
		String sql = prop.getProperty("deletePosting");
		PreparedStatement pstmt = null;
		int result = 0;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("게시글 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글 수정
	 * @param conn
	 * @param posting
	 * @return
	 */
	public int updatePosting(Connection conn, PostingExt posting) {
		String sql = prop.getProperty("updatePosting");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, posting.getTitle());
			pstmt.setString(2, posting.getContent());
			pstmt.setInt(3, posting.getPostingNo());
			pstmt.setString(4, posting.getBoardCode().toString());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("게시글 수정 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 첨부파일 삭제
	 * @param conn
	 * @param no
	 * @return
	 */
	public int deletePostingAttach(Connection conn, int no) {
		String sql = prop.getProperty("deletePostingAttach");
		PreparedStatement pstmt = null;
		int result = 0;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 댓글 등록
	 * @param conn
	 * @param pc
	 * @return
	 */
	public int insertPostingComment(Connection conn, PostingComment pc) {
		String sql = prop.getProperty("insertPostingComment");
		PreparedStatement pstmt = null;
		int result = 0;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pc.getPostingNo());
			pstmt.setString(2, pc.getBoardCode().toString());
			pstmt.setString(3, pc.getMemberId());
			pstmt.setString(4, pc.getCommentContent());
			pstmt.setInt(5, pc.getCommentLevel());
			pstmt.setObject(6, pc.getCommentRef() == 0 ? null : pc.getCommentRef());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("댓글 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 댓글 삭제
	 * @param conn
	 * @param no
	 * @return
	 */
	public int deletePostingComment(Connection conn, int no) {
		String sql = prop.getProperty("deletePostingComment");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("댓글 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글 검색
	 * @param conn
	 * @param pageParam 
	 * @param param
	 * @return
	 */
	public List<PostingExt> searchBy(Connection conn, Map<String, Object> pageParam, Map<String, String> param, BoardCode boardCode) {
		String sql = prop.getProperty("searchBy");
		sql = sql.replace("#", param.get("searchType"));
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<PostingExt> postingList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardCode.toString());
			pstmt.setString(2, "%" + param.get("searchKeyword") + "%");
			pstmt.setInt(3, (int) pageParam.get("start"));
			pstmt.setInt(4, (int) pageParam.get("end"));
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingExt posting = handlePostingResultSet(rset);
				posting.setAttachCount(rset.getInt("attach_count")); // 첨부파일 개수
				posting.setCommentCount(rset.getInt("comment_count")); // 댓글 개수
				posting.setLikeCount(rset.getInt("like_count")); // 좋아요 개수
				postingList.add(posting);
			}
		} catch (Exception e) {
			throw new BoardException("게시물 검색 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return postingList;
	}

	/**
	 * 좋아요 여부 체크
	 * @param conn
	 * @param memberId
	 * @param postingNo
	 * @return
	 */
	public PostingLike likeCheck(Connection conn, int postingNo, BoardCode boardCode, String memberId) {
		String sql = prop.getProperty("likeCheck");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PostingLike like = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postingNo);
			pstmt.setString(2, boardCode.toString());
			pstmt.setString(3, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				like = new PostingLike();
				like.setPostingNo(rset.getInt("posting_no"));
				like.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
				like.setMemberId(rset.getString("member_id"));
				like.setStatus(rset.getString("status"));
			}
		} catch (Exception e) {
			throw new BoardException("좋아요 여부 체크 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return like;
	}

	/**
	 * 좋아요수 증가
	 * @param conn
	 * @param memberId
	 * @param postingNo
	 * @return
	 */
	public int updateLikeCount(Connection conn, int postingNo, BoardCode boardCode, String memberId) {
		String sql = prop.getProperty("updateLikeCount");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postingNo);
			pstmt.setString(2, boardCode.toString());
			pstmt.setString(3, memberId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("좋아요수 증가 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 좋아요 상태 등록
	 * @param conn
	 * @param like
	 * @return
	 */
	public int setPostingLike(Connection conn, PostingLike like) {
		String sql = "";
		if(like.getStatus().equals("Y")) {
			sql = prop.getProperty("setPostingLikeY");
		}else {
			sql = prop.getProperty("setPostingLikeN");
		}
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, like.getPostingNo());
			pstmt.setString(2, like.getBoardCode().toString());
			pstmt.setString(3, like.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("좋아요 상태 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 답변 게시글 등록
	 * @param conn
	 * @param posting
	 * @return
	 */
	public int insertPostingRef(Connection conn, PostingExt posting) {
		String sql = prop.getProperty("insertPostingRef");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, posting.getBoardCode().toString());
			pstmt.setString(2, posting.getMemberId());
			pstmt.setString(3, posting.getTitle());
			pstmt.setString(4, posting.getContent());
			pstmt.setInt(5, posting.getPostingLevel());
			pstmt.setInt(6, posting.getPostingRef());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("답변 게시글 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 커뮤니티 메인 게시판 목록 조회
	 * @param conn
	 * @param param
	 * @return
	 */
	public List<PostingExt> findCommunityPostingList(Connection conn, Map<Object, String> param) {
		String sql = prop.getProperty("findCommunityPostingList");		
		sql = sql.replace("#", param.get("orderBy"));
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<PostingExt> postingList = new ArrayList<>();
		List<PostingAttach> attachments = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, param.get("boardCode"));
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PostingExt posting = handlePostingResultSet(rset);
				posting.setAttachCount(rset.getInt("attach_count")); // 첨부파일 개수
				posting.setCommentCount(rset.getInt("comment_count")); // 댓글 개수
				posting.setLikeCount(rset.getInt("like_count")); // 좋아요 개수
				attachments = findPostingAttachByPostingNo(conn, posting.getPostingNo());
				posting.setAttachments(attachments); // 첨부파일
				postingList.add(posting);
			}
		} catch (Exception e) {
			throw new BoardException("커뮤니티 메인 게시판 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return postingList;
	}

}
