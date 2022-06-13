package board.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.dao.BoardDao;
import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.PostingComment;
import board.model.dto.PostingExt;

public class BoardService {
	
	public static final int Num_PER_PAGE = 10;
	private BoardDao boardDao = new BoardDao();
	
	/**
	 * 게시판 목록 조회 - 페이징 처리
	 * @param param
	 * @return
	 */
	public List<PostingExt> findAllPostingList(Map<String, Object> param) {
		Connection conn = getConnection();
		List<PostingExt> postingList = boardDao.findAllPostingList(conn, param);
		close(conn);
		return postingList;
	}
	
	/**
	 * 전체 게시글 조회
	 * @return
	 */
	public int getTotalPostings() {
		Connection conn = getConnection();
		int totalBoardContents = boardDao.getTotalPostings(conn);
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

			List<PostingAttach> attachments = ((PostingExt) posting).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PostingAttach attach : attachments) {
					attach.setPostingNo(no);
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
	public PostingExt findbyPostingNo(int no) {
		Connection conn = getConnection();
		PostingExt posting = boardDao.findbyPostingNo(conn, no);
		List<PostingAttach> attachments = boardDao.findPostingAttachByPostingNo(conn, no);
		List<PostingComment> comments = boardDao.findPostingCommentByPostingNo(conn, no);
		posting.setAttachments(attachments);
		posting.setComments(comments);
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

}
