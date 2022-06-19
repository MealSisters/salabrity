package board.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.dao.BoardDao;
import board.model.dto.BoardCode;
import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.PostingComment;
import board.model.dto.PostingExt;
import board.model.dto.PostingLike;

public class BoardService {
	
	public static final int NUM_PER_PAGE = 10;
	private BoardDao boardDao = new BoardDao();
	
	/**
	 * 게시판 목록 조회 - 페이징 처리
	 * @param param
	 * @return
	 */
	public List<PostingExt> findAllPostingList(Map<String, Object> param, BoardCode boardCode) {
		Connection conn = getConnection();
		List<PostingExt> postingList = boardDao.findAllPostingList(conn, param, boardCode);
		close(conn);
		return postingList;
	}
	
	/**
	 * 전체 게시글 수 조회
	 * @return
	 */
	public int getTotalPostings(BoardCode boardCode) {
		Connection conn = getConnection();
		int totalBoardContents = boardDao.getTotalPostings(conn, boardCode);
		close(conn);
		return totalBoardContents;
	}
	
	/**
	 * 게시글 등록
	 * @param posting
	 * @return
	 */
	public int insertPosting(Posting posting) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.insertPosting(conn, posting);
			int no = boardDao.findCurrentPostingNo(conn);
			posting.setPostingNo(no);
			System.out.println("방금 등록된 posting_no = " + no);
			
			BoardCode boardCode = boardDao.findCurrentBoardCode(conn, no);
			posting.setBoardCode(boardCode);
			System.out.println("방금 등록된 board_code = " + boardCode);

			List<PostingAttach> attachments = ((PostingExt) posting).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PostingAttach attach : attachments) {
					attach.setPostingNo(no);
					attach.setBoardCode(boardCode);
					result = boardDao.insertPostingAttach(conn, attach);
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}
	
	/**
	 * 게시글 상세 조회
	 * @param no
	 * @return
	 */
	public PostingExt findByPostingNo(int no) {
		Connection conn = getConnection();
		List<PostingAttach> attachments = boardDao.findPostingAttachByPostingNo(conn, no);
		List<PostingComment> comments = boardDao.findPostingCommentByPostingNo(conn, no);
		List<PostingLike> likes = boardDao.findPostingLikeByPostingNo(conn, no);
		PostingExt posting = boardDao.findByPostingNo(conn, no);
		posting.setAttachments(attachments);
		posting.setComments(comments);
		posting.setLikes(likes);
		close(conn);
		return posting;
	}	

	/**
	 * 조회수 증가
	 * @param no
	 * @return
	 */
	public int updateReadCount(int no) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.updateReadCount(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 첨부파일 한 건 조회
	 * @param no
	 * @return
	 */
	public PostingAttach findPostingAttachByPostingAttachNo(int no) {
		Connection conn = getConnection();
		PostingAttach attach = boardDao.findPostingAttachByPostingAttachNo(conn, no);
		close(conn);
		return attach;
	}

	/**
	 * 게시글 삭제
	 * @param no
	 * @return
	 */
	public int deletePosting(int no) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.deletePosting(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 게시글 수정
	 * @param posting
	 * @return
	 */
	public int updatePosting(PostingExt posting) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			// 1. board 수정
			result = boardDao.updatePosting(conn, posting); 
			
			// 2. attachment에 등록
			List<PostingAttach> attachments = ((PostingExt) posting).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PostingAttach attach : attachments) {
					attach.setPostingNo(posting.getPostingNo());
					attach.setBoardCode(posting.getBoardCode());
					result = boardDao.insertPostingAttach(conn, attach);
				}
			}
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 첨부파일 삭제
	 * @param no
	 * @return
	 */
	public int deletePostingAttach(int no) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.deletePostingAttach(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 댓글 등록
	 * @param pc
	 * @return
	 */
	public int insertPostingComment(PostingComment pc) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.insertPostingComment(conn, pc);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 댓글 삭제
	 * @param commentNo
	 * @return
	 */
	public int deletePostingComment(int no) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.deletePostingComment(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 게시글 검색
	 * @param pageParam 
	 * @param param
	 * @return
	 */
	public List<PostingExt> searchBy(Map<String, Object> pageParam, Map<String, String> param) {
		Connection conn = getConnection();
		List<PostingExt> postingList = boardDao.searchBy(conn, pageParam, param);
		close(conn);
		return postingList;
	}

	/**
	 * 좋아요 여부 체크
	 * @param postingNo
	 * @param boardCode
	 * @param memberId
	 * @return
	 */
	public PostingLike likeCheck(int postingNo, BoardCode boardCode, String memberId) {
		Connection conn = getConnection();
		PostingLike like = boardDao.likeCheck(conn, postingNo, boardCode, memberId);
		close(conn);
		return like;
	}

	/**
	 * 좋아요수 증가
	 * @param postingNo
	 * @param boardCode
	 * @param memberId
	 * @return
	 */
	public Object updateLikeCount(int postingNo, BoardCode boardCode, String memberId) {
		int result = 0;
		Connection conn = getConnection();
	      
		try {
			result = boardDao.updateLikeCount(conn, postingNo, boardCode, memberId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
		
	}

	/**
	 * 좋아요 상태 등록
	 * @param like
	 */
	public void setPostingLike(PostingLike like) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.setPostingLike(conn, like);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
	}

	/**
	 * 답변 게시글 등록
	 * @param posting
	 * @return
	 */
	public int insertPostingRef(PostingExt posting) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = boardDao.insertPostingRef(conn, posting);
			int no = boardDao.findCurrentPostingNo(conn);
			posting.setPostingNo(no);
			System.out.println("방금 등록된 posting_no = " + no);
			
			BoardCode boardCode = boardDao.findCurrentBoardCode(conn, no);
			posting.setBoardCode(boardCode);
			System.out.println("방금 등록된 board_code = " + boardCode);

			List<PostingAttach> attachments = ((PostingExt) posting).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PostingAttach attach : attachments) {
					attach.setPostingNo(no);
					attach.setBoardCode(boardCode);
					result = boardDao.insertPostingAttach(conn, attach);
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	/**
	 * 커뮤니티 메인 게시판 목록 조회
	 * @param param
	 * @return
	 */
	public List<PostingExt> findCommunityPostingList(Map<Object, String> param) {
		Connection conn = getConnection();
		List<PostingExt> postingList = boardDao.findCommunityPostingList(conn, param);
		close(conn);
		return postingList;
	}
	
}
